# server.R
	source("helpers.R") 
	counties <- readRDS("data/counties.rds")
	library(maps)
	library(mapproj)
shinyServer(

  function(input, output) {

    
    output$map <- renderPlot({
	
	color = switch(
    input$var,
    "Percent White"="green",
    "Percent Black"="navy",
    "Percent Hispanic"="blue",
    "Percent Asian"="red"
	)	
	varPlot = switch(
    input$var,
    "Percent White"=counties$white,
    "Percent Black"=counties$black,
    "Percent Hispanic"=counties$hispanic,
    "Percent Asian"=counties$asian
	)	
	legendTitle = input$var
	
	

	
	min = input$range[1]
	max= input$range[2]
      
    percent_map(varPlot,color,legendTitle,min,max )
    })
      
  }
)
    