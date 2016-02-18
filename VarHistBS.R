MyVarHistBS <- function(port=port, wei=e.weight, comp.days=1, size.days=251,
  conf=0.95){
  if(nrow(port)-size.days<comp.days)
    stop("Not enough data. Lower comp.days.")
  val <- port %*% wei
  hbvar <- c(rep(0,comp.days))
  for (i in 1:comp.days){
    a <- i+1
    data <- port[a:nrow(port),]
    portboot <- data[sample(nrow(data),size.days,replace=TRUE),]
    valboot <- portboot %*% wei
    hbvar[i] <- quantile(valboot, 1-conf)
    }
  hbfail <- sum((val[0:comp.days]<0)&(val[0:comp.days]<hbvar))/length(hbvar)
  return(list(VaR=hbvar, Fail=hbfail))
  }
