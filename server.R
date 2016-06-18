library(shiny)
risk <<- c(0,1.3,2.2,3.2,4.0,6.7,9.8,9.6,12.5,15.2)

shinyServer(
  function(input, output) {
    
    output$oid1 = renderPrint({input$age})
    output$oid2 = renderPrint({input$sex})
    #output$oid3 = renderPrint({input$cond})
    
    
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
    
    value <- risk[v+1]
    output$oid3 = renderPrint({
      value()
    })
   
  }
)

function value(conditions){
  
}