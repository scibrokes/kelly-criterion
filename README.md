# Application of Kelly Criterion model in Sportsbook Investment

## Abstract

  The investment in sportsbook industry is very popular in Europe and United States but not yet in Asia. I tried to refer to [*Dixon and Coles (1996)*]() and also [*Karlis and Ntzuofras (2005)*]() and complete my **®model** *®γσ, Eng Lian Hu (2016)*^[1st paper in [3. References]] but the return is not stable and I try to apply Kelly model and generates an impressive returns which is in section [1. Kelly Criterion].
  
  The section [2. Comparison of Betting Strategy in Sportsbook Investment] will not only compare the staking model in betting model validation *®γσ, Eng Lian Hu (2016)*^[2nd paper in [3. References]]. and also Kelly model in section 1 but also enhanced.

## 1. Kelly Criterion

### 1.2 Summary

  I have simulate a betting model on 13 bookmakers across 2 soccer seasons in English 2011/12 and 2012/13.

  - [Application of Kelly model in English Soccer session 2011/12](http://rpubs.com/englianhu/kelly_eng1112)
  - [Application of Kelly model in English Soccer session 2012/13](http://rpubs.com/englianhu/kelly_eng1213)

### 1.3 Result of Kelly Staking model on English Soccer 2011/2012

| No |          Category |  Bets_Wf_Overround |  Bets_No_Overround |
|:--:|:-----------------:|:------------------:|:------------------:|
| 1  |     No of Matches |         4896.00000 |         4896.00000 |
| 2  |          Total PL |          353.96966 |          381.06299 |
| 3  |        No of Bets |         2268.00000 |         2404.00000 |
| 4  |    No of Won Bets |         1531.00000 |         1584.00000 |
| 5  | No of Voided Bets |          128.00000 |          143.00000 |
| 6  |   No of Lose Bets |          609.00000 |          677.00000 |
| 7  |           Staking |          636.98372 |          705.89203 |
| 8  |   Won Bets Stakes |          453.43724 |          496.09555 |
| 9  |     Voided Stakes |           19.13296 |           22.67241 |
| 10 |  Lose Bets Stakes |          -99.46758 |         -115.03256 |

*table 2.1.1 : Staking breakdown and result of the bets settlement.*

|        Company |           PL |      PL2 |
|:--------------:|:------------:|:--------:|
|      Ladbrokes |    33.772411 | 38.25184 |
|         Bet365 |    34.120624 | 37.19263 |
|      Macauslot |    35.740062 | 40.23454 |
|         X10Bet |    37.538487 | 41.64034 |
|        X188Bet |    36.579289 | 38.25589 |
|         SBOBET |    40.392461 | 41.90898 |
|      Mansion88 |    31.219547 | 32.38999 |
|          YSB88 |    13.167746 | 14.34128 |
|         X12BET |    36.802466 | 38.19015 |
| VictorChandler |    24.391917 | 25.95763 |
|         Canbet |    10.347393 | 10.97516 |
|    Betinternet |    10.286812 | 11.18731 |
|       Titanbet |     9.610441 | 10.53726 |

*table 2.1.2 : Return of Investment on the Odds Price with/without Overrounds.*

### 1.4 Result of Kelly Staking model on English Soccer 2012/2013

| No |          Category |  Bets_Wf_Overround |  Bets_No_Overround |
|:--:|:-----------------:|:------------------:|:------------------:|
| 1  |     No of Matches |          5514.0000 |         5514.00000 |
| 2  |          Total PL |           448.8993 |          488.91841 |
| 3  |        No of Bets |          2570.0000 |         2697.00000 |
| 4  |    No of Won Bets |          1765.0000 |         1824.00000 |
| 5  | No of Voided Bets |           192.0000 |          196.00000 |
| 6  |   No of Lose Bets |           613.0000 |          677.00000 |
| 7  |           Staking |           756.2979 |          834.32032 |
| 8  |   Won Bets Stakes |           563.6685 |          614.24795 |
| 9  |     Voided Stakes |            27.1151 |           32.12999 |
| 10 |  Lose Bets Stakes |          -114.7691 |         -125.32954 |

*table 2.2.1 : Staking breakdown and result of the bets settlement.*

|        Company |           PL |        PL2 |
|:--------------:|:------------:|:----------:|
|      Ladbrokes |  44.53507895 | 46.7763362 |
|         Bet365 |  33.53743752 | 40.6766948 |
|      Macauslot |   1.76408658 |  1.9329171 |
|         X10Bet |  33.62892077 | 40.6921976 |
|        X188Bet |  41.05668234 | 46.1156378 |
|         SBOBET |  43.50915478 | 47.8308212 |
|      Mansion88 |  42.44403404 | 43.9521665 |
|          YSB88 |  45.92688667 | 46.8393963 |
|         X12BET |  36.03065656 | 36.2449956 |
| VictorChandler |  45.13420638 | 46.2154620 |
|         Canbet |  41.04019224 | 46.9617659 |
|    Betinternet |  40.20594752 | 44.5435274 |
|       Titanbet |   0.08604952 |  0.1364944 |

*table 2.1.2 : Return of Investment on the Odds Price with/without Overrounds.*

## 2. Comparison of Betting Strategy in Sportsbook Investment

  By conduct above betting model and get a positive and impressive returns from the experiments, here I have try to retrive the betting model of British sportsbook consultancy firm A.
  
  Besides, by refer to [3. References] I try to build a simple shinyApp for betting model prior to build up my own **Scibrokes®** business website...

### 2.1 ...

**betting-models** shinyApp



## 3. References

1. [**Odds Modelling and Testing Inefficiency of Sports Bookmakers : Rmodel** by ®γσ, Eng Lian Hu (2016)](https://github.com/scibrokes/odds-modelling-and-testing-inefficiency-of-sports-bookmakers/blob/master/Odds%20Modelling%20and%20Testing%20Inefficiency%20of%20Sports-Bookmakers.pdf)
2. [**Betting-Strategy-and-Model-Validation** by ®γσ, Eng Lian Hu (2016)](https://github.com/scibrokes/betting-strategy-and-model-validation)
3. [**Systematic Investor Toolbox (SIT)** *by Michael Kapler (2012)*](https://github.com/englianhu/SIT)
4. [**MatchOdds.org** *by Simon Collins (2010)*](http://www.matchodds.org/ords/f?p=101:1::::::)

**Powered by - Copyright® Intellectual Property Rights of <img src='figure/oda-army.jpg' width='24'> [Scibrokes®](http://www.scibrokes.com)個人の経営企業**