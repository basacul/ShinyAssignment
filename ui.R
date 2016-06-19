library(shiny)

library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("CHA2DS2-VASc"),
  sidebarPanel(
    h3('Instructions'),
    p('The CHA2DS2-VASc score calculates the stroke risk per year for any person. 
       You need to input the the age and gender, as 
       well as the medical conditions, by checking the 
       boxes that apply. By clicking the button \'Calculate\' 
      the stroke risk per year and the respective score will be displayed at their appropriate sections.'),
    p('For more information follow this', 
      tags$a(href="https://en.wikipedia.org/wiki/CHA2DS2-VASc_score", "link"), "."),
    p('The source code can be found at github following this ', 
      tags$a(href="https://github.com/basacul/ShinyAssignment", "link"), "." ),
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
    actionButton("goButton", "Calculate"),
    h4('Documentation'),
    p('Each condition is worth 1 or 2 points. The range is 0 to 9 points and helps to determine the treatment plan. 
      For each additional point the risk rises. The CHA2DS2-VASc score is the successor
      of the CHADS score, which used less parameters.')
  ), 
  mainPanel(
    h3('Stroke Risk Per Year'),
    p('Age : ', verbatimTextOutput("oid1")),
    p('Gender : ', verbatimTextOutput("oid2")),
    p('STROKE RISK PER YEAR (in combination with the medical conditions) :'),
    verbatimTextOutput("oid3"),
    p('SCORE :'),
    verbatimTextOutput("oid4")
)))