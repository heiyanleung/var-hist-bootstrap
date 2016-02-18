# var-hist-bootstrap
Value at Risk: historical bootstrapping

Historical Bootstrapping is similar to the previous method, but this time we
bootstrap from the historical data instead of taking the actual historical sequence
as is. Therefore, we are using all available history, from first day in data frame
until the day before the calculated VaR to bootstrap a sample of data of length
“size.days”. From this sample, the function draws the percentile based on the
specified confidence level. For example, in our exercise we type the following:

MyVarHistBS(port=port,wei=e.weight,comp.days=1,size.days=251,conf=0.95)
