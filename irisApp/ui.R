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
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Iris Species Name Predictor"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("slength",
                   "Sepal Length:",
                   min = min(iris$Sepal.Length),
                   max = max(iris$Sepal.Length),
                   value = 5.1
                   ),
       sliderInput("swidth",
                   "Sepal Width:",
                   min = min(iris$Sepal.Width),
                   max = max(iris$Sepal.Width),
                   value = 3.5
       ),
       sliderInput("plength",
                   "Petal Length:",
                   min = min(iris$Petal.Length),
                   max = max(iris$Petal.Length),
                   value = 1.4
       ),
       sliderInput("pwidth",
                   "Petal Width:",
                   min = min(iris$Petal.Width),
                   max = max(iris$Petal.Width),
                   value = 0.2
       ),
       submitButton("Submit")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3("The name of the iris species is:"),
      h4(textOutput("pred1"), style="color:red")
    )
  )
))
