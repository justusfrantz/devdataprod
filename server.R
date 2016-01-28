### Developing Data Products : Course Project
### server.R file for the Shiny app
### Github repo : https://github.com/justusfrantz/devdataprod

library(shiny)
library(datasets)
library(dplyr)
library(data.table)

shinyServer(function(input, output) {
  
  # Tabulate the results based on selections
  output$table <- renderDataTable({
    disp_seq <- seq(from = input$disp[1], to = input$disp[2], by = 0.1)
    hp_seq <- seq(from = input$hp[1], to = input$hp[2], by = 1)
    data <- transmute(mtcars, Car = rownames(mtcars), MilesPerGallon = mpg,
                      Distance = input$gas*mpg/input$cost,
                      Cylinders = cyl, Displacement = disp, Horsepower = hp, 
                      Transmission = am)
    data <- filter(data, Distance >= input$dis, Cylinders %in% input$cyl, 
                   Displacement %in% disp_seq, Horsepower %in% hp_seq, Transmission %in% input$am)
    data <- mutate(data, Transmission = ifelse(Transmission==0, "Automatic", "Manual"))
    data <- arrange(data, desc(Distance))
    output$downloadData <- downloadHandler(filename = 'data.csv',
                                           content = function(file) 
                                           {
                                             write.csv(data, file, row.names=FALSE)
                                           }
    )
    if (nrow(data) > 0 ) {
      output$Plot <- renderPlot({
        # render plot for result
        carnames <- data$Car
        par(mar=(c(10,4,4,2) +0.1))
        barplot(data$Distance,col = 'cornflowerblue', main="Cars By Travel Distance (miles)",ylab = "Travel Distance (miles)",names.arg = carnames,las=2)
        })}
    else {
      output$Plot <- renderPlot({plot(c(0, 1), c(0, 1), ann = F, bty = 'n', type = 'n', xaxt = 'n', yaxt = 'n')})
    }
    data
  }, options = list(lengthMenu = c(5,10), pageLength = 5))
  
})