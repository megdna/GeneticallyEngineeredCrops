library(shiny)

GEcrops <- read.csv("./data/GEcrops.csv", check.names=FALSE, row.names=1)

shinyUI(fluidPage(
        
        titlePanel("Adoption of Genetically Engineered Crops in U.S. from 2000-2015"),
                
        sidebarLayout(      
                        
                sidebarPanel(
                        sliderInput("year", "Select Year with Slider:", min=2000, max=2015, value=2000, step=1, sep=""),
                        hr(),
                        p("Results show the percentage of each genetically engineered crop (corn, cotton and soybeans) relative to all 
                          types of that crop planted for the year selected."),
                        p("Genetically engineered crops include herbicide-tolerant, insect-resistant and/or stacked gene (combined) 
                          varieties."),
                        hr(),
                        helpText("Data obtained from United States Department of Agriculture (USDA) for 2000 through 2015.")
                        ),
                        
                mainPanel(
                        plotOutput("cropPlot")
                        )
                        
                )
        )
)