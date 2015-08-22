library(shiny)

GEcrops <- read.csv("./data/GEcrops.csv", check.names=FALSE, row.names=1)

shinyServer(function(input, output) {
        
        output$cropPlot <- renderPlot({
                
                barplot(GEcrops[, as.character(input$year)],
                        main=input$year,
                        col=c("yellow", "red", "blue"),
                        names.arg=rownames(GEcrops),
                        xlab="Genetically Engineered Crops",                       
                        ylab="Percent of All Crops Planted",
                        ylim=c(0,100))
                
        })
})