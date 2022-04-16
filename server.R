# Define server function 
# club <- read.csv(file = 'ClubBar.csv')

server <- function(input, output) {
  
  #Bar graph of league-------------------------------------------------------------
  league1 <- read.csv(file = 'league.csv')
  output$bargraph_league <- renderPlot({

    league1 <- read.csv(file = 'league.csv')
    
    df1 <- league1 %>% filter(year==input$cyear)
    g <- ggplot(df1, aes( y = Avg_Wages_league, x = league,fill=league))
    g+ geom_bar(stat='identity') +scale_x_discrete(guide = guide_axis(check.overlap = TRUE))
    
  })  
    
  
  # INTER
    output$League <-renderImage({
      
      league1 <- read.csv(file = 'league.csv')
      
      outfile <- tempfile(fileext='.gif')
      p= ggplot(league1, aes( y = Avg_Wages_league, x = league,fill=league))+geom_bar(stat='identity') +
        scale_x_discrete(guide = guide_axis(check.overlap = TRUE))+transition_states(year, transition_length = 2,state_length = 1) +labs(title = 'Year: {closest_state}',subtitle  = "Departments Visualization of Graduate Student from 2015 to 2020")
      
      anim_save("Avgbar.gif", animate(p,height=300,width=900,fps=20,duration=20,end_pause=60,res=120))
      list(src = "Avgbar.gif",
           contentType = 'image/gif',
           width = 900,
           height = 400
           # alt = "This is alternate text"
      )}, deleteFile = FALSE)


  
  #Bar graph of club-------------------------------------------------------------
  
  output$bargraph_club <- renderPlot({
    
    club <- read.csv(file = 'ClubBar.csv')
    
    df <- club %>% filter(League==input$league)
    g <- ggplot(df, aes( y = Avg_Wages, x = club_name,fill=club_name))
    g+ geom_bar(stat='identity') +scale_x_discrete(guide = guide_axis(check.overlap = TRUE))
    
    
  })
  
 
  
 
  output$league_table <- renderTable({
    
    club <- read.csv(file = 'ClubBar.csv')
    df<- club %>% filter(League==input$league)
    df
  })
  
  
  #Country-----------------------------------------------------------------
  
  
  output$country_2d <-renderPlot({
    library(ggmap)
    library(maps)
    library(mapproj)
    
    library(ggplot2)
    
    # MAP+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    c_map<-read.csv("countryMap.csv", stringsAsFactors = FALSE)
    w_map=map_data("world")
    w_map=merge(w_map,c_map,by.x="region",by.y="nationality_name")
    w_map=w_map[order(w_map$group, w_map$order),]
    ggplot(w_map, aes(x=long, y=lat, group=group)) +
      geom_polygon(aes(fill=Avg_Wages), color="red")+coord_map(xlim=c(-180,180), ylim=c(-60, 90))
    
  })
  
  output$country_table <- renderTable({
    
    country <- read.csv(file = 'countryMap.csv')
    country  %>% select(nationality_name,Avg_Wages)
  })
  
  

# Linegraph +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
output$ethnicity <-renderPlot({
  line <- read.csv(file ='linegraph8.csv')
  g <- ggplot(line, aes( y = Overall, x = Year,color=Player))
  g + geom_line()+theme_bw()

})


# InterBarGarph +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
output$ethnicity_data <-renderImage({
  line <- read.csv(file ='linegraph8.csv')
  
  outfile <- tempfile(fileext='.gif')
  p= ggplot(line, aes( y = Overall, x = Year, fill=Player,color=Player))+
    geom_line(stat='identity')+ theme_bw() + transition_reveal(Year)
  
  anim_save("line.gif", animate(p,height=400,width=800,fps=20,duration=20,end_pause=60,res=120))
  list(src = "line.gif",
       contentType = 'image/gif'
       
  )}, deleteFile = FALSE)




# BarGarph +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
output$bargraph_club <- renderPlot({
  
  club <- read.csv(file = 'ClubBar.csv')
  df <- club %>% filter(League==input$league)
  
  
  g <- ggplot(df, aes( y = Avg_Wages, x = club_name,fill=club_name))
  g+ geom_bar(stat='identity') +scale_x_discrete(guide = guide_axis(check.overlap = TRUE))
  
})


#ScatterPlot +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
output$plotScatter <- renderPlot({
  plot_scatter <- read.csv(file ='scatter1.csv')
  df1 <- plot_scatter %>% filter(Category==input$s_plot)
  
  plot(df1$Wage_eur, log(df1$Rating) , main = "Scatter Plot of overall rating vs wage", xlab = "Salary", ylab = "Overall Rating", pch = 19,col = "deepskyblue3")
 
})


}#server
# Create Shiny object
# shinyApp(ui, server)
