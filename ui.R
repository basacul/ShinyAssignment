library(shiny)

library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("CHA2DS2-VASc"),
  sidebarPanel(
    h3('Stroke Risk Per Year'),
    p('The CHA2DS2-VASc score helps you to calculate the stroke risk in percent by clicking the options that apply for your patient.'),
    p('For more information follow this', tags$a(href="https://en.wikipedia.org/wiki/CHA2DS2-VASc_score", "link"), "."),
    textInput('age', 'Age of the person',50 ),
    radioButtons("sex", "Gender", c(
                  "Male" = "male",
                  "Female" = "female")),
    checkboxGroupInput("cond", "Medical Conditions",
                       c("Congestive Heart Failure or Left ventricular Systolic Dysfunction" = "1",
                         "Hypertension or in treatment for Hypertension" = "1",
                         "Diabetes Mellitus" = "1",
                         "Prior Stroke or TIA or Thromboembolism" = "2",
                         "Vascular Disease" = "1")),
    p('For Vascular Disease: e.g. peripheral artery disease, myocardial infarction, aortic plaque'),
    actionButton("goButton", "Calculate")
  ), 
  mainPanel(
    h3('Stroke Risk'),
    p('Age : ', verbatimTextOutput("oid1")),
    p('Gender : ', verbatimTextOutput("oid2")),
    p('In combination with the medical conditions the stroke risk per year is around :'),
    verbatimTextOutput("oid3")
  
)))