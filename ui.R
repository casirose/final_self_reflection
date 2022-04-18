# Load R packages
library(shiny)
library(shinythemes)
library(ggplot2)
library(dplyr)
library(gganimate)
library(tidyverse)


league1 <- read.csv(file = 'league.csv')
club <- read.csv(file = 'ClubBar.csv')
country <- read.csv(file = 'countryMap.csv')
line <- read.csv(file ='linegraph8.csv')
club <- read.csv(file = 'ClubBar.csv')
plot_scatter <- read.csv(file ='scatter1.csv')

title<-
  # Define UI
  ui <- fluidPage(theme = shinytheme("darkly"),
                  navbarPage("Fifa 22 Analysis",
                             tabPanel("Home",
                                      sidebarPanel(
                                        tags$img(src = "fifa.jpg", height= "250px", width="375px", deleteFile=FALSE),
                                        # selectInput("cyear", "Choose Year", choices = unique(league1$year),selected = "2022"),
                                      ),
                                      mainPanel(
                                        h3("FIFA 22 Players Wage Analysis",align = "center"),
                                        p("My main aim of the project is to analyze and find what determins the wage of the FIFA 22 players. The data was extracted from Kaggle and I have analyzed the wages of player across countris, clubs, leagues.Additionally, it also shows the correlation of the wage with other variables such as age, height, weight, their passing, shooting, dribbling, and defending skills."
                                          ,align = "center"),
                                        tags$img(src = "Avgbar.gif", height= "450px", width="800px", deleteFile=FALSE),
                                        # plotOutput("bargraph_league"),
                                        # imageOutput("League")
                                        
                                      ) # mainPanel
                                      
                             ),
                             tabPanel("League Average Salary",
                                      sidebarPanel(
                                        selectInput("cyear", "Choose Year", choices = unique(league1$year),selected = "2022"),
                                      ),
                                      mainPanel(
                                        h3("Visualization of League Average Salary of top 5 club in Europe ",align = "center"),
                                        p(" The bar graph shows the average wages of the players across different leagues. We can see that the EPL has the highest average wage distribution to its players with more than 50,000 Euros. It is then followed by Laliga and Serie A with approximately 30,000 Euros. The least league that provides the lowest average salary in comparison to the other leagues is French Ligue 1 with approximately 22,000 Euros to its player. I have used a categorical color scale which means each color represents different leagues which helps the user easily understand the bar graph."
                                          ,align = "center"),
                                        plotOutput("bargraph_league"),
                                        
                                        # imageOutput("League")
                                      ) # mainPanel
                                      
                             ),
                             tabPanel("Club Average Salary",
                                      sidebarPanel(
                                        tags$h3("Input:"),
                                        # selectInput("league", "What is your league",choices = c("English Premier League","French Ligue 1","German 1. Bundesliga","Italian Serie A","Spain Primera Division",selected = "English Premier League")),
                                        
                                        selectInput("league", "Choose League", choices = unique(club$League),selected = "EPL"),
                                        
                                        h4("Bar Graph of Clubs Average salary "),
                                        
                                        tableOutput("league_table")
                                      ), # sidebarPanel
                                      mainPanel(
                                        h4("Club Average Salary "),
                                        
                                        plotOutput("bargraph_club"),
                                        
                                        p("The above bar graph shows the average wages of the player across different clubs. By inputting the EPL League, we can see that the highest paying club is Manchester City with around 112,000 Euros. Similarly, for the Bundesliga, the highest paying club is FC Bayern Munchen with approximately 79,000 Euros. Furthermore, for the Laliga, Real Madrid CF has the highest wage with 133,000 Euros. We can input each league and find out the highest paying club by reviewing the bar graph and data as well."
                                          ,align = "center"),
                                      
                                      ) # mainPanel
                                      
                             ),#tabPanel
                             
                             tabPanel("Country Average Salary",
                                      sidebarPanel(
                                        tags$h3("Country Average Salary Table"),
                                        tableOutput("country_table")
                                        
                                      ), # sidebarPanel
                                      mainPanel(
                                        h4("World Map of Country Average Salary"),
                                        
                                        plotOutput("country_map"),
                                      
                                        p("The map visualization shows the average salary as per the countries. We can analyze the highest paying country is Egypt with 43,100 Euros to its player. It is then followed by Tanzania with the average salary of 40,000 Euros. Thai map visualized the country which provides the average salary to its player. Also, I have used a sequential color scale which helps us determine the darker shade color of the country which pays the highest average salary to its players and vice versa."
                                          ,align = "center")
                                      )
                             )#tabPanel
                             
                             
                             ,
                             tabPanel("Past Five Year Rating",
                                      sidebarPanel(
                                        tags$img(src = "fifa.jpg", height= "250px", width="375px", deleteFile=FALSE),
                                        # selectInput("cyear", "Choose Year", choices = unique(league1$year),selected = "2022"),
                                      ),
                                      
                                      mainPanel(
                                        h4("linegraph of Top 10 player of Fifa 22 for past five years"),
                                        tags$img(src = "line.gif"),
                                        p("The above line graph depicts the trend of the player’s salary from the year 2018 to 2022. The players selected are top 10 players of the FIFA 2022. The top player Christiano Ronaldo had the maximum average wage in 2018 which was constant till 2019 and then it showed a gradual decrease till 2022. However, for Lionel Messi it was lower than Ronaldo’s in 2018, however it gradually increased over the year. Also, twe can see the average salary of the other players following the line graph above."
                                          ,align = "center"),
                                        br(),
                                        plotOutput("linegraph")
                                        
                                      )
                             ),
                        tabPanel("Correlation With Age",
                                               h4("Correlation With Age"),
                                               sidebarPanel(
                                                 tags$h3("Input:"),
                                                 selectInput("s_plot", "Choose Year", choices = c("Age","Overall","Potential","Height_cm","Weight_kg","Pace","Shooting","Passing","Dribbling","Defending","Physic"),selected = "Overall"),
                                  ),
                                               
         mainPanel(
           h4("Scatter plot of Salary vs other variables"),
           plotOutput("plotScatter"),
           p("The above scatter plot shows the correlation with salaary with overall player rating. We can also change the input from left tab bar. Where we can choose Age, overall, potential, Height ,weight, pace, shooting, passing, dribbling, defending, physic of player vs salary of player.  "
             ,align = "center")
           
          
           
           
         )


)
                             
                             
                  )#navbarPage
  )  #fluidPage





