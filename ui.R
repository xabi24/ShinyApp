#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
library(tidyverse)


churches <- c('Jaca Cathedral', 'Santa Maria de Eunate', 'San Pedro de la Rúa', 'Santa Juliana Collegiate', ' San Martín de Frómista',
              'Santa María la Mayor', 'Santiago Cathedral')

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  h1("Churches on Northern Spain Camino de Santiago, 2023/01/29"),
  leafletOutput("Northern_Spain"),
  p(),
  p(),
  selectInput(inputId='Church',
              selected= 'Jaca Cathedral',
              label='Locata a Church',
              choices=churches,
              multiple=FALSE),
  p()        )
    
  )
