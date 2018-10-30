# loading the required library
library(shiny)
# the e1071 is specifically loaded for caret package
# without that library things are running properly in local environment.
# but when uploaded to the server shinyapps.io we need to load this e1071, 
# else server keeps on disconnected.
library(e1071)
library(caret)


# Define server logic 
shinyServer(function(input, output) {
  set.seed(101)
  
  # Training the model
  # Linear Discriminant Analysis (LDA)
  model1 <- train(Species~., data=iris, method='lda')
  
  # Adding the reactive component
  model1pred <- reactive({
    sepalLength <- input$slength
    sepalWidth <- input$swidth
    petalLength <- input$plength
    petalWidth <- input$pwidth
    
    # predicting
    predict(model1, newdata = data.frame(
      Sepal.Length = sepalLength,
      Sepal.Width = sepalWidth,
      Petal.Length = petalLength,
      Petal.Width = petalWidth
    ))
  })
  
  
  # defining the value for display
  speciesToDisplay <- c("Setosa","Versicolor","Virginica")
  
  # sending the prediction ouput
  output$pred1 <- renderText({
    
      # if needed we can directly add model1pred()
      # But the result would be numerical therefore we are using
      # speciesToDisplay vector so that it can display character
    
      speciesToDisplay[model1pred()]
  })
  
  
})
