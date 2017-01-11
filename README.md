# Application of Kelly Criterion model in Sportsbook Investment

## Abstract

  The investment in sportsbook industry is very popular in Europe and United States but not yet in Asia. I tried to refer to *Dixon and Coles (1996)*, *Karlis and Ntzuofras (2005)* and some others papers to complete my **®model** *®γσ, Eng Lian Hu (2016)*^[1st paper in [3. References]] but the return is not stable and I try to apply Kelly model and generates an impressive returns which is in section [1. Kelly Criterion].
  
  The section [2. Comparison of Betting Strategy in Sportsbook Investment] will not only compare the staking model in betting model validation *®γσ, Eng Lian Hu (2016)*^[2nd paper in [3. References]]. and also Kelly model in section 1 but also enhanced.

## 1. Kelly Criterion

### 1.2 Summary

  I have simulate a betting model on 13 bookmakers across 2 soccer seasons in English 2011/12 and 2012/13. Kindly refer to below techincal research.

  - [Application of Kelly model in English Soccer session 2011/12](http://rpubs.com/englianhu/kelly_eng1112)
  - [Application of Kelly model in English Soccer session 2012/13](http://rpubs.com/englianhu/kelly_eng1213)

### 1.3 Result of Kelly Staking model on English Soccer 2011/2012

| No |          Category |  With Spreads (2011/12) | Ratio (%) |  Without Spreads (2011/12) | Ratio (%) |  With Spreads (2012/13) | Ratio (%) |  Without Spreads (2012/13) | Ratio (%) |
|:--:|:-----------------:|:-----------------------:|:---------:|:--------------------------:|:---------:|:-----------------------:|:---------:|:--------------------------:|:---------:|
| 1  |     No of Matches |                   4,896 |         1 |                      4,896 |         1 |                   5,514 |         1 |                      5,514 |         1 |
| 2  |          Total PL |              $353.96966 |    55.57% |                 $381.06299 |    53.98% |               $448.8993 |    59.35% |                 $488.91841 |    58.60% |
| 3  |        No of Bets |                   2,268 |    46.32% |                      2,404 |    49.10% |                   2,570 |    46.61% |                      2,697 |    48.91% |
| 4  |    No of Won Bets |                   1,531 |    31.27% |                      1,584 |    32.35% |                   1,765 |    32.01% |                      1,824 |    33.08% |
| 5  | No of Voided Bets |                     128 |     2.61% |                        143 |     2.92% |                     192 |     3.48% |                        196 |     3.55% |
| 6  |   No of Lose Bets |                     609 |    12.44% |                        677 |    13.83% |                     613 |    11.12% |                        677 |    12.28% |
| 7  |           Staking |              $636.98372 |         1 |                 $705.89203 |         1 |               $756.2979 |         1 |                 $834.32032 |         1 |
| 8  |   Won Bets Stakes |              $453.43724 |    71.19% |                 $496.09555 |    70.28% |               $563.6685 |    74.53% |                 $614.24795 |    73.62% |
| 9  |     Voided Stakes |               $19.13296 |     3.00% |                  $22.67241 |     3.21% |                $27.1151 |     3.59% |                  $32.12999 |     3.85% |
| 10 |  Lose Bets Stakes |              -$99.46758 |   -15.62% |                -$115.03256 |   -16.30% |              -$114.7691 |   -15.18% |                -$125.32954 |   -15.02% |

*table 1.3.1 : Staking breakdown and result of the bets settlement.*

|        Company |   PL (2011/12) | Ratio (%) | PL2 (2011/12) | Ratio (%) |   PL (2012/13) | Ratio (%) | PL2 (2012/13) | Ratio (%) |
|:--------------:|:--------------:|:---------:|:-------------:|:---------:|:--------------:|:---------:|:-------------:|:---------:|
|      Ladbrokes |     $33.772411 |     9.54% |     $38.25184 |    10.04% |   $44.53507895 |     9.92% |   $46.7763362 |     9.57% |
|         Bet365 |     $34.120624 |     9.64% |     $37.19263 |     9.76% |   $33.53743752 |     7.47% |   $40.6766948 |     8.32% |
|      Macauslot |     $35.740062 |    10.10% |     $40.23454 |    10.56% |    $1.76408658 |     0.39% |    $1.9329171 |     0.40% |
|         X10Bet |     $37.538487 |    10.61% |     $41.64034 |    10.93% |   $33.62892077 |     7.49% |   $40.6921976 |     8.32% |
|        X188Bet |     $36.579289 |    10.33% |     $38.25589 |    10.04% |   $41.05668234 |     9.15% |   $46.1156378 |     9.43% |
|         SBOBET |     $40.392461 |    11.41% |     $41.90898 |    11.00% |   $43.50915478 |     9.69% |   $47.8308212 |     9.78% |
|      Mansion88 |     $31.219547 |     8.82% |     $32.38999 |     8.50% |   $42.44403404 |     9.46% |   $43.9521665 |     8.99% |
|          YSB88 |     $13.167746 |     3.72% |     $14.34128 |     3.76% |   $45.92688667 |    10.23% |   $46.8393963 |     9.58% |
|         X12BET |     $36.802466 |    10.40% |     $38.19015 |    10.02% |   $36.03065656 |     8.03% |   $36.2449956 |     7.41% |
| VictorChandler |     $24.391917 |     6.89% |     $25.95763 |     6.81% |   $45.13420638 |    10.05% |   $46.2154620 |     9.45% |
|         Canbet |     $10.347393 |     2.92% |     $10.97516 |     2.88% |   $41.04019224 |     9.14% |   $46.9617659 |     9.61% |
|    Betinternet |     $10.286812 |     2.91% |     $11.18731 |     2.94% |   $40.20594752 |     8.96% |   $44.5435274 |     9.11% |
|       Titanbet |      $9.610441 |     2.72% |     $10.53726 |     2.77% |    $0.08604952 |     0.02% |    $0.1364944 |     0.03% |

*table 1.3.2 : Breakdown of Operators - Profit & Loss on the Odds Price with/without Overrounds.*

## 2. Sportsbook Investment Portfolio

  By conduct above betting model and get a positive and impressive returns from the experiments, here I have try to retrive the betting model of British sportsbook consultancy firm A.
  
  Besides, by refer to [3. References] I try to build a simple shinyApp for betting model prior to build up my own **Scibrokes®** business website...

### 2.1 Investment Portfolio


### 2.2 Web Base App

**betting-models** shinyApp

  Based on [Betting-Strategy-and-Model-Validation](https://github.com/scibrokes/betting-strategy-and-model-validation), in order to test the risk of ruin, here I focus on English soccer leagues which will write as an shinyApp and set few elastic adjusters to test the efficiency of the sportsbook investment fund :
  
  - the initial fund size
  - betting stakes
  - average follwed odds price
  - missing followed bets
  - investment fund portfolio management
  - regular investor refill or pump into initial fund pool
  
  Secondly, application of own *Rmodel* [Odds Modelling and Testing Inefficiency of Sports Bookmakers](https://github.com/scibrokes/odds-modelling-and-testing-inefficiency-of-sports-bookmakers) to test the efficiency and comparison.

## 3. References

1. [**Odds Modelling and Testing Inefficiency of Sports Bookmakers : Rmodel** by ®γσ, Eng Lian Hu (2016)](https://github.com/scibrokes/odds-modelling-and-testing-inefficiency-of-sports-bookmakers/blob/master/Odds%20Modelling%20and%20Testing%20Inefficiency%20of%20Sports-Bookmakers.pdf)
2. [**Betting-Strategy-and-Model-Validation** by ®γσ, Eng Lian Hu (2016)](https://github.com/scibrokes/betting-strategy-and-model-validation)
3. [**Systematic Investor Toolbox (SIT)** *by Michael Kapler (2012)*](https://github.com/englianhu/SIT)
4. [**MatchOdds.org** *by Simon Collins (2010)*](http://www.matchodds.org/ords/f?p=101:1::::::)
5. [**Bayesian statistics, health economics and random stuff** *by Gianluca Baio*](https://gianlubaio.blogspot.my/2016/10/shiny-happy-people-in-land-of-czar.html)

**Powered by - Copyright® Intellectual Property Rights of <img src='figure/oda-army.jpg' width='24'> [Scibrokes®](http://www.scibrokes.com)個人の経営企業**