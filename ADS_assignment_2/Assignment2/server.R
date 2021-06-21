#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    output$plot1 <- renderPlot({
        
        # Data cleaning
        spotify <- read.csv("Spotify-2000.csv")
        spotify <- na.omit(spotify)
        Popularity <- substr(spotify$Popularity..,1,nchar(spotify$Popularity..)-2)
        Popularity <- as.integer(Popularity)
        spotify[["Popularity.."]] <- Popularity
        colnames(spotify)[colnames(spotify) == "Popularity.."] <- "Popularity"
        spotify[["Year"]] <- as.integer(spotify$Year)
        spotify[["BPM"]] <- as.integer(spotify$BPM)
        
        # Scatterplot for radio buttons
        p1 <- switch(input$radioInput,
                     "Year" = ggplot(data = spotify, mapping = aes(x = Year, y = Danceability)) +
                         geom_point() +
                         scale_x_continuous(breaks=seq(1950,2020,5)) +
                         theme_minimal(),
                     "BPM" = ggplot(data = spotify, mapping = aes(x = BPM, y = Danceability)) +
                         geom_point() +
                         scale_x_continuous(breaks=seq(0,250,10)) +
                         theme_minimal(),
                     "Energy" = ggplot(data = spotify, mapping = aes(x = Energy, y = Danceability)) +
                         geom_point() +
                         theme_minimal(),
                     "Loudness" = ggplot(data = spotify, mapping = aes(x = Loudness, y = Danceability)) +
                         geom_point() +
                         theme_minimal(),
                     "Valence" = ggplot(data = spotify, mapping = aes(x = Valence, y = Danceability)) +
                         geom_point() +
                         theme_minimal(),
                     "Length" = ggplot(data = spotify, mapping = aes(x = Length, y = Danceability)) +
                         geom_point() +
                         theme_minimal(),
                     "Acousticness" = ggplot(data = spotify, mapping = aes(x = Acousticness, y = Danceability)) +
                         geom_point() +
                         theme_minimal(),
                     "Speechiness" = ggplot(data = spotify, mapping = aes(x = Speechiness, y = Danceability)) +
                         geom_point() +
                         theme_minimal(),
                     "Popularity" = ggplot(data = spotify, mapping = aes(x = Popularity, y = Danceability)) +
                         geom_point() +
                         scale_x_continuous(breaks = seq(0,100,5)) +
                         theme_minimal()
        )
        # Smoothing line
        p1 + geom_smooth()
        
    })
    
})