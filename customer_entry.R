
library(shiny)
library(openxlsx)
library(shinydashboard)

# UI
ui = dashboardPage(
  dashboardHeader(title="Burger Bounty"),
  dashboardSidebar(
    textInput("uname",label="User name"),
    dateInput("edate",label="Date",startview="month"),
    selectInput("town",label="Town",choices=c("Downtown Hartford",
                                              "East Hartford",
                                              "Glastonbury",
                                              "Manchester",
                                              "New Britain",
                                              "West Hartford",
                                              "Wethersfield")),
    numericInput("etime",label="Time in town (hours)", min=1, max=24, step=1, value=1),
    numericInput("preci",label="Average precipitation (%)", min=0, max=100, step=1, value=50),
    numericInput("tempe",label="Average temperature (F)", min=20, max=100, step=1, value=70),
    checkboxInput("event",label="Event at location",value = FALSE),
    actionButton("save",label="Save")
  ),
  dashboardBody(
    tabsetPanel(
      tabPanel("Burger Prices ($)",
               sliderInput("p1",label="Bounty Hunter",min=0,max=20,step=0.5,value=6),
               sliderInput("p2",label="Classic Cheeseburger",min=0,max=20,step=0.5,value=6),
               sliderInput("p3",label="Spicy Mutiny",min=0,max=20,step=0.5,value=6),
               sliderInput("p4",label="Nature Bounty",min=0,max=20,step=0.5,value=6),
               sliderInput("p5",label="BEC",min=0,max=20,step=0.5,value=6),
               sliderInput("p6",label="Double Veggie",min=0,max=20,step=0.5,value=6)
      ),
      tabPanel("Burger Sales",
               sliderInput("q1",label="Bounty Hunter",min=0,max=100,step=1,value=20),
               sliderInput("q2",label="Classic Cheeseburger",min=0,max=100,step=1,value=20),
               sliderInput("q3",label="Spicy Mutiny",min=0,max=100,step=1,value=20),
               sliderInput("q4",label="Nature Bounty",min=0,max=100,step=1,value=20),
               sliderInput("q5",label="BEC",min=0,max=100,step=1,value=20),
               sliderInput("q6",label="Double Veggie",min=0,max=100,step=1,value=20)
      )
    )
  )
)

# Server
server = function(input,output){
  observeEvent(input$save,{
    excel_file <- "C:/Users/Kanika Gaikwad/Desktop/Sem 3/adaptive bi/Project/BurgerBounty.xlsx"
    BBVisits=read.xlsx(excel_file,sheet="Visits",detectDates=TRUE)
    BBPrices=read.xlsx(excel_file,sheet="Prices",detectDates=TRUE)
    BBSales=read.xlsx(excel_file,sheet="Sales",detectDates=TRUE)
    
    evnt="No"
    if(input$event){evnt="Yes"}
    wd=as.numeric(strftime(as.Date(input$edate,"%Y-%m-%d"),"%u"))
    wknd="No"
    if((wd==6)|(wd==7)){wknd="Yes"}
    
    NewVisits=data.frame(input$edate,input$uname,input$town,input$etime,input$preci/100,input$tempe,evnt,wknd)
    NewPrices=data.frame(input$edate,input$p1,input$p2,input$p3,input$p4,input$p5,input$p6)
    NewSales=data.frame(input$edate,input$q1,input$q2,input$q3,input$q4,input$q5,input$q6)
    
    colnames(NewVisits)=colnames(BBVisits)
    colnames(NewPrices)=colnames(BBPrices)
    colnames(NewSales)=colnames(BBSales)
    
    if(input$edate %in% BBVisits$Date){
      k=which(difftime(BBVisits$Date,input$edate,"days") == 0)
      BBVisits[k,]=NewVisits[k,]
      BBPrices[k,]=NewPrices[k,]
      BBSales[k,]=NewSales[k,]
    } else {
      BBVisits=rbind(BBVisits,NewVisits)
      BBPrices=rbind(BBPrices,NewPrices)
      BBSales=rbind(BBSales,NewSales)
    }
    
    BBList=list("Visits"=BBVisits,"Prices"=BBPrices,"Sales"=BBSales)
    write.xlsx(BBList, excel_file)
  })
}

# Run the app
shinyApp(ui,server)
