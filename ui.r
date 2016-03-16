library(shiny)
library(formattable)
library(leaflet)
library(shinydashboard)

      

dashboardPage(
  dashboardHeader(title = "Weather Dashboard"),
  dashboardSidebar(),
  dashboardBody(
    
     
      box(
        title = "Prob of cloud cover", solidHeader = TRUE,
      dygraphOutput("forecastCloudy")
      ),
      
      
      box(
        title = "Prob of rain", solidHeader = TRUE,
        dygraphOutput("forecastPrecip")
      )

      
    )
    
    
    
    
    
   
)

#plotOutput("plotout")
# fluidPage(
#   sidebarLayout(
#     sidebarPanel(),
#     mainPanel(dygraphOutput("forecastCloudy"))
#     
#     
#   ))   