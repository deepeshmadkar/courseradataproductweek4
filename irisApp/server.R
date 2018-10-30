#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(caret)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  set.seed(101)
  
  # Linear Discriminant Analysis (LDA)
  model1 <- train(Species~., data=iris, method='lda')
  
  
  model1pred <- reactive({
    sepalLength <- input$slength
    sepalWidth <- input$swidth
    petalLength <- input$plength
    petalWidth <- input$pwidth
    
    predict(model1, newdata = data.frame(
      Sepal.Length = sepalLength,
      Sepal.Width = sepalWidth,
      Petal.Length = petalLength,
      Petal.Width = petalWidth
    ))
  })
  
  
  
  speciesToDisplay <- c("Setosa","Versicolor","Virginica")
  
  output$pred1 <- renderText({
    speciesToDisplay[model1pred()]
  })
  
  
})
