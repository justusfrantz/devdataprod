### Developing Data Products : Course Project
### ui.R file for the Shiny app
### Github repo : https://github.com/justusfrantz/devdataprod

library(markdown)

shinyUI(navbarPage("Coursera Developing Data Products: Course Project",
                   tabPanel("Analysis",
                           # Sidebar
                            sidebarLayout(
                              sidebarPanel(
                                helpText("Specify the gasoline price, gasoline expenditure limit & desired travel distance followed by the desired car characteristics"),
                                numericInput('cost', 'Gasoline Price (USD/gallon):', 2.05, min = 1, max = 4, step=0.01),
                                numericInput('gas', 'Gasoline expenditure limit (USD):', 25, min=1, max=1000),
                                numericInput('dis', 'Distance (in miles):', 100, min = 1, max = 1000),
                                checkboxGroupInput('cyl', 'Number of Cylinders:', c("4"=4, "6"=6, "8"=8), selected = c(4,6,8)),
                                sliderInput('disp', 'Displacement', min=70, max=480, value=c(70,480), step=10),
                                sliderInput('hp', 'Gross Horsepower', min=50, max=340, value=c(50,340), step=10),
                                checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1))
                              ),
                                mainPanel(
                                dataTableOutput('table'),
                                downloadButton('downloadData', 'Download'),
                                plotOutput("Plot")
                              )
                            )
                   ),
                   tabPanel("About",
                            mainPanel(
                              includeMarkdown("about.md")
                            )
                   )
)
)   