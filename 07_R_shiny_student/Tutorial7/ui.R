
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30),
            radioButtons('hiscol',
                         'Colour of Histogram',
                         choices = c('Crimson' = '#DC143C', 'Violet' = '#8A2BE2', 'Coral' = '#FF7F50'),
                         selected = '#8A2BE2'
                         )
        ),
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
))
