shinyUI(fluidPage(
    
    #headerPanel("getQuotes", windowTitle = "getQuotes"),
    fluidRow(
        column(width = 12,
               h1("getQuotes"),
               "by Joerg Landskron, 20/03/2016, ",
               br(),
               "Course Project for Developing Data Products, Data Science Specialization at Coursera",
               p()
        )),
    
    sidebarLayout(
        sidebarPanel(
            textInput(inputId="stocksymbol", label = "Enter stock symbol:", value = "YHOO"),
            actionButton("goButton", "Get Quotes!"),
            p(),
            radioButtons(inputId = "timeframe", label = "Select timeframe:", 
                         c("3 months" = "1",
                           "6 months" = "2", 
                           "1 year" = "3",
                           "3 years" = "4",
                           "max" = "5",
                           "Individual" = "0"), selected = "0"),
            dateRangeInput(inputId = "daterange", label = NULL, 
                           start = "2016-01-01", end = as.character(Sys.Date()))
  
        ),
        
        mainPanel(
            plotOutput("chart")
        )
    ),
    
    fluidRow(
      column(width = 12,
             h3("Instructions:"),
             "The application shows historical daily stock quotes retrieved from Yahoo. You can query 
             the quotes of any stock by entering a valid stock symbol (like ", strong("YHOO"), "  
             for Yahoo, ", strong("AMZN"), " for Amazon, but also ", strong("NDAQ"), " or ", strong("^DJI"), 
             "for the NASDAQ respectively the Dow Jones Industrial Average Index, etc.). 
             If certain stock symbols are unknown, they can be looked up at the ",
             a(href = "http://finance.yahoo.com/lookup", "Yahoo Symbol Look-up."), 
             "There you can enter a clear name of the company you would like to look-up and Yahoo 
             will show up the stock. Nearby the stock name in brackets the corresponding stock symbol 
             is shown. After entering the stock symbol, the corresponding stock quotes are loaded by clicking 
             the \"Get Quotes!\"-button.",
             br(),
             "You can also select a certain pre-defined timeframe by clicking one of the corresponding 
             radio buttons or enter a timeframe individually. For that you should select the radio button
             \"Individual\" and enter the start and end date in the date range input fields. By clicking in 
             the date-fields a calender will show up enabling you to enter the date easily. Nevertheless you 
             can also enter the date directly in the date-range-fields using the format \"YYYY-MM-DD\". 
             Date ranges are making sense to plot for timeframes of approx. minimum 30 days. The date range 
             shown in the plot can differ from the selected one depending on the available data (trading 
             days).",
             br(),
             br(),
             "An now have fun using getQuotes!"
             )  
    ),
    
    title = "getQuotes")
)