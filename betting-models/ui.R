## Shiny structure
##
## tabsetPanel with conditional sidebarPanel, choose from main tabset
## similar with https://egon.stats.ucl.ac.uk/project/bmetaweb/ and 
## https://egon.stats.ucl.ac.uk/project/BCEAweb/ inside 
## https://gianlubaio.blogspot.my/2016/10/shiny-happy-people-in-land-of-czar.html


shinyUI(pageWithSidebar(
  
  
  headerPanel(""),
  
  
  sidebarPanel(
    tags$head(
      tags$link(rel = 'stylesheet', type = 'text/css', href = 'styles.css')),
    
    
    wellPanel(
      conditionalPanel(
        condition = "input.myPanel == 'World Rankings' && input.rankPanel == 1",
        helpText("World Ranking records of current Top 250"),
        selectInput("playerRankings","Select Player",rankingsChoice, selected="Phil Mickelson")
      ),
      conditionalPanel(
        condition = "input.myPanel == 'World Rankings' && input.rankPanel == 2",
        helpText("World Ranking records of current Top 250"),
        selectInput("playerRankings","Select Player",rankingsChoice, selected="Phil Mickelson")
      ),
      conditionalPanel(
        condition = "input.myPanel == 'World Rankings' && input.rankPanel == 3",
        helpText("Select any Sunday back to Christmas 1988. N.B It will only show records for players
                 still active"),
        dateInput("calendar","", value=latestDate,max=latestDate,min="1988-12-25")
        ),
      conditionalPanel(
        condition = "input.myPanel == 'Majors' && input.majorsPanel == 4",
        helpText("Majors Records for all 2400+ players since 1970"),
        selectInput("playerMajors2","Select Player",majorsChoice, selected="Tiger Woods")
      ),
      conditionalPanel(
        condition = "input.myPanel == 'Majors' && input.majorsPanel == 5",
        helpText("Majors Records for all 2400+ players since 1970"),
        selectInput("playerMajors2","Select Player",majorsChoice, selected="Tiger Woods")
      ),
      conditionalPanel(
        condition = "input.myPanel == 'Majors' && input.majorsPanel == 6",
        helpText("Track Players Performance by Round. Switch between position and stroke options"),
        selectInput("playerMajors","Select Player",majorsChoice, selected="Tiger Woods"),
        selectInput("tourney","Select tourney",tourneyChoice, selected="Masters") ,
        radioButtons(inputId="choice", label="Chart Type",choices=c("Stroke Difference","Position"))
      ),
      conditionalPanel(
        condition = "input.myPanel == 'Majors' && input.majorsPanel == 7",
        helpText("Majors LeaderBoards since 1970"),
        HTML("<table>"),
        HTML("<tr><td>"),
        selectInput("contest","",tourneyChoice, selected="Masters"),
        HTML("</td>"),
        # HTML("<td></td"), unsuccesful attempt to increase gap
        HTML("<td>"),
        numericInput("year","",2013,min=1970,max=2013 ),
        HTML("</td></tr>"),
        HTML("</table>"),
        actionButton("goButton", "New Leaderboard")
      )
    )),
  
  
  mainPanel(
    tabsetPanel(
      tabPanel("World Rankings",
               tabsetPanel(
                 tabPanel("Player Timeline", chartOutput("timeLineChart","highcharts"), value = 1),
                 tabPanel("Player Sequences", chartOutput("rankChart","highcharts"), value = 2), # prob need to hae seperate conditional
                 tabPanel("Weekly Rankings", chartOutput("weeklyTable","highcharts"), value = 3),
                 id = "rankPanel"
                 # should be datatables
               )
               
               
               
      ),
      
      
      tabPanel("Majors",
               tabsetPanel(
                 tabPanel("Player Summaries", chartOutput("majorsTimeline","highcharts"), value = 4),
                 tabPanel("Earnings", chartOutput("earningsChart","highcharts"), value = 5), # prob need to hae seperate conditional
                 tabPanel("Bump Charts", chartOutput("pChart","highcharts"), value = 6),
                 tabPanel("Leaderboards",  h3(textOutput("lCaption")),chartOutput("leaderboard",'datatables'), value = 7),
                 id = "majorsPanel"
                 
               )
               
               
               
      ),
      
      
      id="myPanel"
    )
    
  )
  
  ))