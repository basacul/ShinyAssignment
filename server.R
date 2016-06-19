library(shiny)
risk <<- c(0,1.3,2.2,3.2,4.0,6.7,9.8,9.6,12.5,15.2)

shinyServer(
  function(input, output) {
    
    output$oid1 = renderText({input$age})
    output$oid2 = renderText({input$sex})
    
    score <- eventReactive(input$goButton,{
               conditions <- as.integer(input$cond)
               
               v <- sum(conditions)
               if(input$age >= 75){
                 v <- v + 2
               }else if(input$age >= 65){
                 v <- v + 1
               }
               
               if(input$sex == "female"){
                 v <- v + 1
               }
               v
             })
    df <- eventReactive(input$goButton,{
              paste("Stroke Risk Per Year : ",risk[score()+1], "%")
    })
    
    output$oid3 = renderText({df()})
    output$oid4 = renderText({paste("Score : ", score())})
  }
)

