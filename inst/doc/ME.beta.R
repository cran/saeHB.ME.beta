## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(saeHB.ME.beta)
data("dataHBMEbeta")

## -----------------------------------------------------------------------------
example <- meHBbeta(Y~x1+x2, var.x = c("v.x1","v.x2"),
                   iter.update = 3, iter.mcmc = 10000,
                   thin = 3, burn.in = 1000, data = dataHBMEbeta)

## -----------------------------------------------------------------------------
example$Est

## -----------------------------------------------------------------------------
example$coefficient

## -----------------------------------------------------------------------------
example$refvar

## -----------------------------------------------------------------------------
MSE_HBMEbeta=example$Est$sd^2

## -----------------------------------------------------------------------------
RSE_HBMEbeta=sqrt(MSE_HBMEbeta)/example$Est$mean*100

## -----------------------------------------------------------------------------
Y_direct=dataHBMEbeta[,1]
MSE_direct=dataHBMEbeta[,6]
RSE_direct=sqrt(MSE_direct)/Y_direct*100

## -----------------------------------------------------------------------------
Y_HBMEbeta=example$Est$mean
Y=as.data.frame(cbind(Y_direct,Y_HBMEbeta))
summary(Y)

## -----------------------------------------------------------------------------
MSE=as.data.frame(cbind(MSE_direct,MSE_HBMEbeta))
summary(MSE)

## -----------------------------------------------------------------------------
RSE=as.data.frame(cbind(RSE_direct,RSE_HBMEbeta))
summary(RSE)

## -----------------------------------------------------------------------------
example_mix <- meHBbeta(Y~x1+x2+x3, var.x = c("v.x1","v.x2"),
                   iter.update = 3, iter.mcmc = 10000,
                   thin = 3, burn.in = 1000, data = dataHBMEbeta)

## -----------------------------------------------------------------------------
example_mix$Est

## -----------------------------------------------------------------------------
example_mix$coefficient

## -----------------------------------------------------------------------------
example_mix$refvar

## -----------------------------------------------------------------------------
MSE_HBMEbeta_mix=example_mix$Est$sd^2

## -----------------------------------------------------------------------------
RSE_HBMEbeta_mix=sqrt(MSE_HBMEbeta_mix)/example_mix$Est$mean*100

## -----------------------------------------------------------------------------
Y_HBMEbeta_mix=example_mix$Est$mean
Y_mix=as.data.frame(cbind(Y_direct,Y_HBMEbeta_mix))
summary(Y)

## -----------------------------------------------------------------------------
MSE_mix=as.data.frame(cbind(MSE_direct,MSE_HBMEbeta_mix))
summary(MSE_mix)

## -----------------------------------------------------------------------------
RSE_mix=as.data.frame(cbind(RSE_direct,RSE_HBMEbeta_mix))
summary(RSE_mix)

