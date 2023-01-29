#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
library(tidyverse)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$Northern_Spain <- renderLeaflet({
      
      cat(input$Church)
      
      churches <- c('Jaca Cathedral', 'Santa Maria de Eunate', 'San Pedro de la Rúa', 'Santa Juliana Collegiate', ' San Martín de Frómista',
                    'Santa María la Mayor', 'Santiago Cathedral')
      google <- c('https://www.google.com/search?q=')
      
      churches_google <- gsub(' ','+',churches)
      
      links <- paste("'<a href='",churches_google,">",churches,"</a>'",sep = "")
      
      lat <- c(42.5709545057806,	42.6724072450719,	42.6690627309342,	43.392380009178,	42.2669425077117,	43.223853387462, 42.88079272398023)
      
      lon <-  c(-0.549463985785409,	-1.76142721347906,	-2.02951789134708,	-4.10509657960206,	-4.40645063233623,	-4.14409392901853,-8.544555370435715)
      
      DF <- data.frame(churches, links, lat,lon)
      
      DF <- DF %>% filter(churches==input$Church)
      
      cat(nrow(DF))
      
      DF %>% leaflet() %>% addTiles() %>% addMarkers(lat=DF$lat, lng=DF$lon, popup=DF$links, clusterOptions=markerClusterOptions)
      
    })

})
