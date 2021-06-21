#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
sshinyUI(fluidPage(
    
    titlePanel("Danceability of Songs"),
    
    sidebarLayout(
        sidebarPanel(
            # Radio buttons to switch between plots with different predictors
            radioButtons("radioInput",
                         "Choose variable to display on the x-axis:",
                         choices = c("Release Year" = "Year",
                                     "Tempo (BPM)" = "BPM",
                                     "Energy",
                                     "Loudness (dB)" = "Loudness",
                                     "Valence (Positivity)" = "Valence",
                                     "Length",
                                     "Acousticness",
                                     "Speechiness",
                                     "Popularity")
            )
        ),
        
        mainPanel(
            h4("Visualization of simple correlations"),
            plotOutput("plot1")
        )
    )
))