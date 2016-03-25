getQuotes
========================================================
author: Joerg Landskron
date: March 25 2016
transition: rotate

Coursera Course Project for Developing Data Products  
Data Science Specialization  
(Johns Hopkins University)

What is getQuotes?
========================================================
getQuotes is a shiny-app which enables the user to query historical stock quotes in an easy and comfortable way
and plots a stock quotes chart

- Load stock prices by entering a stock symbol like **YHOO, AMZN**, etc.
- Select a predefined or individual time frame for the stock prices
- Stock prices and trading volumes are shown in a nice chart
 

Technical Background 1/2
========================================================
- getQuotes uses the powerful **quantmod** package provided on CRAN
- quantmod retrieves stock data from Yahoo and provides nice pre-defined charts
- Stock data is stored in a xts-object (extended time series) in OHLC-format (open-high-low-close) which makes it easy to handle the timeseries data of stock quotes
- Following simplified code is the core part of the shiny app


```r
library(quantmod)
stockdat <- getSymbols("YHOO", env=NULL)
chartSeries(stockdat, theme = "white")
```


Technical Background 2/2
========================================================
The plot created by the above mentioned code is shown below:

<img src="getQuotes_Pitch-figure/stockchart-1.png" title="plot of chunk stockchart" alt="plot of chunk stockchart" style="display: block; margin: auto;" />


Links
========================================================
- getQuotes can be tested at https://joerg.shinyapps.io/getQuotes/
- The whole code of getQuotes and this presentation can be found at GitHub under  https://github.com/joerglandskron/devdataprod
- Yahoo stock symbols can be looked-up at http://finance.yahoo.com/lookup 

