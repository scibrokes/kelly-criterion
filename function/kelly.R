kelly = function(bkbase, mbase, EMbase){
  
  ## Saved as RData format file in order to the save the read files time.
  #'@ load('./data/dataset.RData')
  
  ## ------------------- option setting and load packages -----------------------
  options(warn = -1)
  
  if(suppressMessages(!require('plyr'))){
    suppressMessages(install.packages('plyr'))
  }
  suppressMessages(library('plyr'))
  
  pkgs <- c('tidyverse', 'turner', 'reshape2', 'formattable', 'DT', 'highcharter')
  suppressMessages(l_ply(pkgs, library, character.only = TRUE))
  
  ## ------------------- Read Data ----------------------------------------------
  COModds = subset(bkbase$AH, names(bkbase$AH) %in% mbase$MatchID_7M)
  
  ## initial odds price
  ini.odds = lapply(COModds, function(x) na.omit(x)[1,-1])
  ini.odds = lapply(ini.odds, function(x){ 
    df_to_blocks(x, blocks = c(rep(3, ncol(x) / 3)), byrow = FALSE)})
  
  ini.odds2 = lapply(seq(ini.odds), function(i) {
    lapply(seq(ini.odds[[i]]),function(j) {
      COM = substr(names(ini.odds[[i]][[j]]), 1, 
                 nchar(names(ini.odds[[i]][[j]])) - 3)[1]
      names(ini.odds[[i]][[j]]) = c('AH', 'HM', 'AW')
      data.frame(MatchID = names(ini.odds)[[i]], COM, ini.odds[[i]][[j]])}) })
  iniOdds = Reduce(function(x, y) merge(x, y, all = T), 
                   unlist(ini.odds2, recursive = F), accumulate = F)
  iniOdds = iniOdds[iniOdds$MatchID %in% EMbase$FT$FTAH$MatchID,]
  iniOdds$Spreads = iniOdds$HM + iniOdds$AW
  rm(ini.odds, ini.odds2)
  
  ## ------------------- Data Manipulation --------------------------------------
  ## Manipulate and reshape the dataset.
  # EMbase$FT$FTAH[,1:5]
  # filter the soccer matches which the teams has selected to calculated
  mbaseb = subset(mbase, MatchID_7M %in% EMbase$FT$FTAH$MatchID)
  ## validate the observation
  #'@ nrow(EMbase$FT$FTAH)

  # filter the initial odds data from 7M by MatchID
  dat = EMbase$FT$FTAH[EMbase$FT$FTAH$MatchID %in% iniOdds$MatchID,]
  # nrow(EMbase$FT$FTAH[EMbase$FT$FTAH$MatchID %in% iniOdds$MatchID,])
  ah = ifelse(nchar(abs(iniOdds$AH * 100)) < 3, 
              paste0('0', abs(iniOdds$AH * 100)), iniOdds$AH * 100)
  ah = ifelse(substr(ah, 1, 1) == '-', paste0('HN', ah), paste0('HP', ah))
  ah = gsub('-', '', ah); iniOdds$AHCode = gsub('HP00', 'H000', ah); rm(ah)
  iniOdds$AHCode = as.factor(iniOdds$AHCode)
  iniHM = iniOdds[c('MatchID', 'COM', 'AH', 'HM', 'AHCode', 'Spreads')]
  iniHM$AH = -iniHM$AH
  iniAW = iniOdds[c('MatchID', 'COM', 'AH', 'AW', 'AHCode', 'Spreads')]
  iniAW$AHCode = gsub('HN','AP',iniAW$AHCode)
  iniAW$AHCode = gsub('HP','AN',iniAW$AHCode)
  iniAW$AHCode = gsub('H000','A000',iniAW$AHCode)
  
  iniOdds = merge(iniHM, iniAW, all = T)
  iniOdds$AH = ifelse(substr(iniOdds$AHCode, 2, 2) == 'N', -abs(iniOdds$AH), 
                      abs(iniOdds$AH))
  iniOdds$COMOdds = ifelse(is.na(iniOdds$HM) & !is.na(iniOdds$AW), iniOdds$AW, 
                           ifelse(!is.na(iniOdds$HM) & is.na(iniOdds$AW), 
                                  iniOdds$HM, NA))
  iniOdds = iniOdds[c('MatchID', 'COM', 'AH', 'AHCode', 'COMOdds', 'Spreads')]
  iniOdds$RProb = iniOdds$COMOdds * 2 / iniOdds$Spreads
  rm(iniHM, iniAW)

  ## ------------------- Merge the dataset --------------------------------------
  # Filter the MatchID of EM_7M and iniOdds
  EMOdds = melt(EMbase$FT$FTAH, 
                id = c('MatchID', 'Round', 'KODate', 'Home', 'Away', 
                       'FTHG', 'FTAG', 'HTHG', 'HTAG'), 
                variable.name = 'AHCode', value.name = 'EMprob')
  ## validate if the number of observation of EMbase and bkbase is matching
  #'@ length(unique(EMOdds$MatchID))
  #'@ length(unique(iniOdds$MatchID))
  
  ## merge iniOdds and EMOdds
  mbase = merge(iniOdds, EMOdds, by = c('MatchID', 'AHCode')) %>% 
    mutate(AH = ifelse(substr(AHCode, 2, 2) == 'N', -abs(AH), abs(AH)))
  
  ## ------------------- Kelly criterion ----------------------------------------
  ## Advantages = (EM Probability * HK odds) - (1 - EM Probability)
  ## Optimal Kelly wager % = Advantages / HK odds
  #'@ mbase$Adv = (mbase$EMprob * mbase$COMOdds) - (1 - mbase$EMprob)
  #'@ mbase$Staking = mbase$Adv / mbase$COMOdds
  #'@ mbase$Staking = ifelse(mbase$Staking < 0, 0, mbase$Staking)
  
  # Measure the advantage (pure odds without overround/margin)
  #'@ mbase$Adv2 = (mbase$EMprob * mbase$RProb) - (1 - mbase$EMprob)
  #'@ mbase$Staking2 = mbase$Adv2 / mbase$COMOdds
  #'@ mbase$Staking2 = ifelse(mbase$Staking2 < 0, 0, mbase$Staking2)
  
  mbase %<>% mutate(Adv = (EMprob * COMOdds) - (1 - EMprob), 
                    Adv2 = (EMprob * RProb) - (1 - EMprob), 
                    Staking = ifelse((Adv / COMOdds) < 0, 0, Adv / COMOdds), 
                    Staking2 = ifelse((Adv2 / COMOdds) < 0, 0, Adv2 / COMOdds))
  ## ------------------- AH & OU Calculator -------------------------------------
  mbase$Output = 0
  for(i in seq(mbase$AH)){
    if(substr(mbase$AHCode[i], 1, 1) == 'H'){
      if((mbase$FTHG[i] + mbase$AH[i] - mbase$FTAG[i]) > 0.25){
        mbase$Output[i] = "W"
      } else if((mbase$FTHG[i] + mbase$AH[i] - mbase$FTAG[i]) == -0.25){
        mbase$Output[i] = "LH"
      } else if((mbase$FTHG[i] + mbase$AH[i] - mbase$FTAG[i]) == 0){
        mbase$Output[i] = "VOID"
      } else if((mbase$FTHG[i] + mbase$AH[i] - mbase$FTAG[i]) == 0.25){
        mbase$Output[i] = "WH"
      } else if((mbase$FTHG[i] + mbase$AH[i] - mbase$FTAG[i]) < -0.25){
        mbase$Output[i] = "L"
      }
    } else if(substr(mbase$AHCode[i], 1, 1) == 'A'){
      if((mbase$FTAG[i] + mbase$AH[i] - mbase$FTHG[i]) > 0.25){
        mbase$Output[i] = "W"
      } else if((mbase$FTAG[i] + mbase$AH[i] - mbase$FTHG[i]) == -0.25){
        mbase$Output[i] = "LH"
      } else if((mbase$FTAG[i] + mbase$AH[i] - mbase$FTHG[i]) == 0){
        mbase$Output[i] = "VOID"
      } else if((mbase$FTAG[i] + mbase$AH[i] - mbase$FTHG[i]) == 0.25){
        mbase$Output[i] = "WH"
      } else if((mbase$FTAG[i] + mbase$AH[i] - mbase$FTHG[i]) < -0.25){
        mbase$Output[i] = "L"
      }
    }
  }; rm(i)
  
  ## ------------------- Profit & Loss ------------------------------------------
  ## Calculate the Net Profit and Lose (AH and OU odds without capital)
  #'@ mbase$PL = 0
  #'@ for(i in seq(mbase$Output)){
  #'@   if(mbase$Output[i] == 'W'){
  #'@     mbase$PL[i] = mbase$COMOdds[i] * mbase$Staking[i]
  #'@   } else if(mbase$Output[i] == 'WH'){
  #'@     mbase$PL[i] = mbase$COMOdds[i] * mbase$Staking[i] * 0.5 
  #'@   } else if(mbase$Output[i] == 'VOID'){
  #'@     mbase$PL[i] =  0
  #'@   } else if(mbase$Output[i] == 'LH'){
  #'@     mbase$PL[i] = mbase$COMOdds[i] * mbase$Staking[i] * -0.5
  #'@   } else if(mbase$Output[i] == 'L'){
  #'@     mbase$PL[i] = mbase$COMOdds[i] * -mbase$Staking[i]
  #'@   } else {
  #'@     mbase$PL[i] = NA
  #'@   }
  #'@ }; rm(i)
  
  ## Calculate the Net Profit and Lose (AH and OU odds without capital and without overround/margin)
  #'@ mbase$PL2 = 0
  #'@ for(i in seq(mbase$Output)){
  #'@  if(mbase$Output[i]=='W'){
  #'@     mbase$PL2[i] = mbase$COMOdds[i] * mbase$Staking2[i]
  #'@  } else if(mbase$Output[i]=='WH'){
  #'@     mbase$PL2[i] = mbase$COMOdds[i] * mbase$Staking2[i] * 0.5 
  #'@  } else if(mbase$Output[i]=='VOID'){
  #'@     mbase$PL2[i] =  0
  #'@  } else if(mbase$Output[i]=='LH'){
  #'@     mbase$PL2[i] = mbase$COMOdds[i] * mbase$Staking2[i] * -0.5
  #'@  } else if(mbase$Output[i]=='L'){
  #'@     mbase$PL2[i] = mbase$COMOdds[i] * -mbase$Staking2[i]
  #'@  } else {
  #'@     mbase$PL2[i] = NA
  #'@  }
  #'@ }; rm(i)
  
  mbase %<>% mutate(PL = )
  
  mbase[1:100,-c(6:9,12:13)]
  
  ## ------------------- Summary ------------------------------------------
  ## Summary of the betting

  Summary = data.frame(
  Category = c('No of Matches','Total PL','No of Bets','No of Won Bets','No of Voided Bets','No of Lose Bets',
               'Staking','Won Bets Stakes','Voided Stakes','Lose Bets Stakes'),
  Bets_Wf_Overround = c(nrow(mbase), sum(mbase$PL), length(mbase[mbase$Staking>0,]$Staking), length(mbase[mbase$PL>0,]$PL),
                        length(mbase[mbase$PL==0 & mbase$Staking>0,]$PL), length(mbase[mbase$PL<0,]$PL),
                        sum(mbase[mbase$Staking>0,]$Staking), sum(mbase[mbase$PL>0,]$PL),
                        sum(mbase[mbase$PL==0 & mbase$Staking>0,]$Staking), sum(mbase[mbase$PL<0,]$PL)),
  Bets_No_Overround = c(nrow(mbase), sum(mbase$PL2), length(mbase[mbase$Staking2>0,]$Staking2), length(mbase[mbase$PL2>0,]$PL2),
                        length(mbase[mbase$PL2==0 & mbase$Staking2>0,]$PL2), length(mbase[mbase$PL2<0,]$PL2),
                        sum(mbase[mbase$Staking2>0,]$Staking2), sum(mbase[mbase$PL2>0,]$PL2),
                        sum(mbase[mbase$PL2==0 & mbase$Staking2>0,]$Staking2), sum(mbase[mbase$PL2<0,]$PL2)))

# Total Profit & Lose on different companies
COMPL = data.frame(PL=sapply(split(mbase,mbase$COM), function(x) sum(x$PL)), PL2=sapply(split(mbase,mbase$COM), function(x) sum(x$PL2)))
Summary
COMPL

COMPL %>% tbl_df %>% mutate(PL = currency(PL), PL.R = percent(PL/sum(PL)), PL2 = currency(PL2), PL2.R = percent(PL2/sum(PL2)))
}

