library(tidyverse)
library(RColorBrewer)

shinyUI(fluidPage(
    
    # Application title
    titlePanel('Tutorial 7 -- Shiny applications'),
    
    # Description
    p('This app will show some visualisations to practice shiny apps.'),
    
    # Sidebar 
    sidebarLayout(
        sidebarPanel(
            sliderInput(inputId = 'price',          # The name of your slider, which will match with the input$inputId
                        label = 'Filter on Price',            # The label presented on the UI
                        min = 0,              # The sliders min value
                        max = 15000,              # The sliders max value
                        value = c(0,15000),      # The inital value of the slider
                        step = 1000) ,            # The stepped increments in the slider
            sliderInput(inputId = 'carat',          # The name of your slider, which will match with the input$inputId
                        label = 'Filter on Carat',            # The label presented on the UI
                        min = 0,              # The sliders min value
                        max = 3,              # The sliders max value
                        value = c(0,3),      # The inital value of the slider
                        step = 0.1) ,            # The stepped increments in the slider
            checkboxGroupInput(inputId = 'cut',
                         label = 'Filter on Cut',
                         choices = c('Fair', 'Good', 'Very Good', 'Premium', 'Ideal'),
                         selected = c('Fair', 'Good', 'Very Good', 'Premium', 'Ideal')),
            selectInput(inputId = 'colors',
                               label = 'Select Palette',
                               choices = c('Blues', 'BuGn', 'BuPu', 'GnBu', 
                                           'Greens', 'Greys', 'Oranges', 
                                           'OrRd', 'PuBu', 'PuBuGn', 'PuRd', 'Purples', 
                                           'RdPu', 'Reds', 'YlGn', 'YlGnBu', 'YlOrBr', 'YlOrRd'),
                               selected = 'Purples'),
            checkboxInput(inputId = 'linear',
                          label = 'Show Linear Regression',
                          value = TRUE),
            checkboxInput(inputId = 'poly',
                          label = 'Show Poly Regression',
                          value = TRUE),
            checkboxInput(inputId = 'step',
                          label = 'Show Step Regression',
                          value = TRUE),
            sliderInput(inputId = 'stepnr',
                        label = 'Number of Steps',
                        min = 0,
                        max = 10,
                        value = 5)
        ),
        
        # Show the generated plots
        mainPanel(
            
            # Sub-Heading 
            h4('A diamonds plot'),
            
            # Main Graphical Output
            plotOutput('diaPlot')
        )
    )
))