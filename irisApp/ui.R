#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Iris Species Name Predictor"),
  
  # Sidebar with a slider inputs
  sidebarLayout(
    sidebarPanel(
      
      # slider input for sepal length
       sliderInput("slength",
                   "Sepal Length:",
                   min = min(iris$Sepal.Length),
                   max = max(iris$Sepal.Length),
                   value = 5.1
                   ),
       # slider input for sepal width
       sliderInput("swidth",
                   "Sepal Width:",
                   min = min(iris$Sepal.Width),
                   max = max(iris$Sepal.Width),
                   value = 3.5
       ),
       # slider input for petal length
       sliderInput("plength",
                   "Petal Length:",
                   min = min(iris$Petal.Length),
                   max = max(iris$Petal.Length),
                   value = 1.4
       ),
       # slider input for petal width
       sliderInput("pwidth",
                   "Petal Width:",
                   min = min(iris$Petal.Width),
                   max = max(iris$Petal.Width),
                   value = 0.2
       ),
       # submit button
       submitButton("Submit")
    ),
    
    # Show the prediction
    mainPanel(
      h3("The name of the iris species is:"),
      h4(textOutput("pred1"), style="color:red")
    )
  )
))
