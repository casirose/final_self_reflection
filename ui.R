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
                                        tags$img(src = "fifa.jpg", height= "250px", width="400px", deleteFile=FALSE),
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
                                        
                                        h4("Clubs Average salary "),
                                        
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
                                        tags$h3("Input:"),
                                        tableOutput("country_table")
                                        # 
                                      ), # sidebarPanel
                                      mainPanel(
                                        
                                        
                                        plotOutput("country_2d"),
                                      
                                        
                                      )
                             )#tabPanel
                             
                             
                             ,
                             tabPanel("Past Five Year Rating",
                                 
                                      
                                      mainPanel(
                                        tags$img(src = "line.gif"),
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
           plotOutput("plotScatter")
          
           
           
         )


)
                             
                             
                  )#navbarPage
  )  #fluidPage





