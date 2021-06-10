library(tidyverse)

shinyServer(function(input, output) {
    
      # retain all values lower than or equal too the upper bound
    dia.filtered <- reactive({                           # name of new variable
            diamonds %>%                           # dataset to be used, piped (%>%)
            filter(price >= input$price[1],   # retain all values greater than or equal too the lower bound
                   price <= input$price[2],
                   carat >= input$carat[1],
                   carat <= input$carat[2],
                   cut %in% input$cut) 
    })
    
    output$diaPlot <- renderPlot({
        
        model_lm <- lm(data = dia.filtered(),
               formula = price ~ carat)
        
        model_poly <- lm(data = dia.filtered(),
               formula = price ~ poly(carat, 3, raw = TRUE))

        model_stepwise <- lm(data = dia.filtered(),
               formula = price ~ cut(carat, input$stepnr))

        carat_pred <- seq(min(dia.filtered()$carat), 
                          max(dia.filtered()$carat), 
                          length.out = 25)
        
        y_pred.lm <- predict(model_lm,
                             newdata = tibble(carat = carat_pred))
        
        y_pred.poly <- predict(model_poly,
                             newdata = tibble(carat = carat_pred))
        
        y_pred.step <- predict(model_stepwise,
                             newdata = tibble(carat = carat_pred))
        
        
        ggplot(data = dia.filtered(), mapping = aes(x = carat, y = price, color = cut)) +
            geom_point() +
            geom_line(data = tibble(carat = carat_pred, price = y_pred.lm), 
                      size = input$linear,
                      col = 'red') +
            geom_line(data = tibble(carat = carat_pred, price = y_pred.poly), 
                      size = input$poly,
                      col = 'blue') +
            geom_line(data = tibble(carat = carat_pred, price = y_pred.step), 
                      size = input$step,
                      col = 'green')  +
            scale_colour_brewer(palette = input$colors) 
    })
    
   
    
   
})