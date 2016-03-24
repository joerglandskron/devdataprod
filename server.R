library(shiny)
library(quantmod)

shinyServer(
    function(input, output) {
        
        #load stock data, if action button was pressed
        stockdat <- reactive({
            input$goButton
            isolate({
                tryCatch({
                    stockdat <- getSymbols(input$stocksymbol, 
                                       warnings = FALSE,
                                       env = NULL)
                },
                
                #Show error message, if stock date cannot be loaded
                error = function(cond) {validate(FALSE, 
                                             "Stock Symbol could not be retrieved. Please check your input about correct stock symbols and correct date format.")
                }
                )
        })
        })
        
        output$chart <- renderPlot({ 
            
            #Subset timeframe from loaded stock data
            t <- as.POSIXlt(Sys.Date())
            date_to <- t
            if (input$timeframe == "1") {t$mon <- t$mon-3; date_from <- t}
                else if (input$timeframe == "2") {t$mon <- t$mon-6; date_from <- t}
                else if (input$timeframe == "3") {t$mon <- t$mon-12; date_from <- t}
                else if (input$timeframe == "4") {t$mon <- t$mon-36; date_from <- t}
                else if (input$timeframe == "5") {date_from <- min(index(stockdat())); date_to <- max(index(stockdat()))}
                else {date_from <- input$daterange[1]; date_to <- input$daterange[2]}   
            
            #Create stock quotes chart
            chartSeries(stockdat()[paste0(date_from, "::", date_to)], 
                        name = sub("\\..*$","",attributes(stockdat())$dimnames[[2]][1]),
                        theme = chartTheme("white"))
        })
    }
)

