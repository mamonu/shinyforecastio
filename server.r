library(curl)
library(RCurl)
library(jsonlite)
library(formattable)
library(shiny)
library(Rforecastio) 
library(dygraphs)
#library(datacomb)



#FORECASTIO_API_KEY
forecastio_api_key(force = FALSE)
now <- get_current_forecast(-1.24757, -50.862676, units = "us")
nowdf <- data.frame(now$daily)

#nowdf$temperature <- (5/9) * (nowdf$temperature - 32)

shinyServer(function(input, output) {

output$forecastPrecip <- renderDygraph    ({
  
  #nowdf$precipProbability,nowdf$windSpeed,
  
  time.series.x <- xts(nowdf$precipProbability ,order.by = nowdf$time)
  dygraph(time.series.x) %>%
  dyRangeSelector(height = 60)

 })


output$forecastCloudy <- renderDygraph    ({
  

  #nowdf$precipProbability,nowdf$windSpeed,
  
  time.series.x <- xts(nowdf$cloudCover ,order.by = nowdf$time)
  dygraph(time.series.x) %>%dyOptions(fillGraph = TRUE, fillAlpha = 0.4)%>% 
  dyRangeSelector(height = 60)
  
  
})



output$forecastTemp <- renderDygraph    ({
  
  
  #nowdf$precipProbability,nowdf$windSpeed,
  
  time.series.x <- xts(nowdf$temperature ,order.by = nowdf$time)
  dygraph(time.series.x) %>%
    dyRangeSelector(height = 60)%>% dyOptions(fillGraph = TRUE, fillAlpha = 0.4)%>% 
    dyOptions(stepPlot = TRUE)
  
  
})

 

})