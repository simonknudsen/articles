## Read data merged from 3 sources: M3, HPI and CPI
hd <- read.csv(url("https://raw.githubusercontent.com/simonknudsen/articles/master/data/hpi/merged_data.csv"))

## Define an M3 in billions instead of millions
hd$M3Billion <- hd$M3 / 1000

## Lets get dates instead of Quarters
paste(substr(hd$Quarter, 1, 4), sep="")
hd$Year <- substr(hd$Quarter, 1, 4)
hd$Q <- substr(hd$Quarter, 6, 8)
hd$Q[hd$Q == "Q 1"] <- "-03-31"
hd$Q[hd$Q == "Q 2"] <- "-06-30"
hd$Q[hd$Q == "Q 3"] <- "-09-30"
hd$Q[hd$Q == "Q 4"] <- "-12-31"
hd$Date <- paste(hd$Year, hd$Q, sep="")
hd$Date <- as.Date(hd$Date)

# Componound inflation (start with earliest value at 1)
# NOTE: inflation is by quarter - hence the "400" instead of "100"
hd$InflationCmpd <- vector(mode="integer", length=length(hd$Inflation))
hd$InflationCmpd[1] = 1
for (i in 2:length(hd$Inflation)) {
  hd$InflationCmpd[i] = hd$InflationCmpd[i-1] + (hd$InflationCmpd[i-1] * hd$Inflation[i] / 400)
}

## -----------------
## Plot all stats together without an axes
## -----------------
png("value_housing_versus_all.png", width = 800, height = 600)
plot(hd$Date, hd$M3Billion, axes=FALSE, type="l", lwd=2, col="blue", xlab="", ylab="",
     main="Housing Value and Three Potential Causes")
par(new=TRUE)
plot(hd$Date, hd$ValueHousing, axes=FALSE, type="l", lwd=2, col="chartreuse4", xlab="", ylab="")
par(new=TRUE)
plot(hd$Date, hd$Population, axes=FALSE, type="l", lwd=2, col="brown", xlab="", ylab="")
par(new=TRUE)
plot(hd$Date, hd$InflationCmpd, axes=FALSE, type="l", lwd=2, col="purple", xlab="", ylab="")

# Date (X) Axis
axis.Date(side = 1, hd$Date, format = "%d %b %Y",cex.axis=0.75)
mtext("Date",side=1,col="black",line=2.5, cex = 0.75)  

## Add Legend
legend("topleft",
       legend=c("M3","Housing Value", "Population", "Inflation Compound"),
       lwd=c(1.5,1.5,1.5,1.5),
       col=c("blue","chartreuse4", "brown", "purple"),
       cex = 0.75, bty = "n")

dev.off()

## -----------------
## Plot both M3 and Value of Housing on one Graph with Different Y axes
## -----------------
png("m3_versus_value_housing.png", width = 800, height = 600)

par(mar=c(5, 4, 4, 6) + 0.1)
plot(hd$Date, hd$M3Billion, pch=16, axes=FALSE, xlab="", ylab="", ylim=c(0,max(hd$M3Billion)), 
     type="l", lwd=2, col="blue", main="M3 and the Value of Housing")
axis(2, ylim=c(0,max(hd$M3Billion)),col="blue",col.axis="blue", las=1,cex.axis=0.75)
mtext("M3 ($NZD Billions)",side=2,line=2.5, col="blue", cex = 0.75)
box()

# Allow a second plot 
par(new=TRUE)

plot(hd$Date, hd$ValueHousing, xlab="", ylab="", ylim=c(0,max(hd$ValueHousing)), 
     axes=FALSE, type="l", lwd=2, col="chartreuse4")
mtext("Value Housing ($NZD Billions)",side=4,col="chartreuse4",line=4, cex = 0.75) 
axis(4, ylim=c(0,max(hd$ValueHousing)), col="chartreuse4",col.axis="chartreuse4",las=1,cex.axis=0.75)

# Date (X) Axis
axis.Date(side = 1, hd$Date, format = "%d %b %Y",cex.axis=0.75)
mtext("Date",side=1,col="black",line=2.5, cex = 0.75)  

## Add Legend
legend("topleft",
       legend=c("M3","Housing Value"),
       lwd=c(1.5,1.5),
       col=c("blue","chartreuse4"),
       cex = 0.75, bty = "n")

dev.off()

## -----------------
## Correlation Between Value of Housing and other attributes
## -----------------
cor(hd$M3, hd$ValueHousing)
cor(hd$InflationCmpd, hd$ValueHousing)
#skip the first 12 data points from population as we have no data
cor(tail(hd$Population, -12), tail(hd$ValueHousing, -12))

## -----------------
## De-Trending Using First Differences & Link Relatives
## This did not remove the trend sufficiently 
## -----------------
first_differences <- function(x) {
  return(x - c(0, diff(x)))
}

link_relatives <- function(x) {
  return(x / c(x[1], x[1:(length(x) - 1)]))
}

cor(first_differences(hd$M3), first_differences(hd$ValueHousing))
cor(first_differences(hd$InflationCmpd), first_differences(hd$ValueHousing))
cor(first_differences(tail(hd$Population, -12)), first_differences(tail(hd$ValueHousing, -12)))

cor(link_relatives(hd$M3), link_relatives(hd$ValueHousing))
cor(link_relatives(hd$InflationCmpd), link_relatives(hd$ValueHousing))
cor(link_relatives(tail(hd$Population, -12)), link_relatives(tail(hd$ValueHousing, -12)))

plot(hd$Date, first_differences(hd$M3), type="l")
par(new=TRUE)
plot(hd$Date, first_differences(hd$ValueHousing), col = "red", type="l")
par(new=TRUE)
plot(hd$Date, first_differences(hd$InflationCmpd), col = "blue", type="l")
par(new=TRUE)
plot(tail(hd$Date, -12), first_differences(tail(hd$Population, -12)), col = "green", type="l")

## -----------------
## De-trending function using linear regression
## -----------------
detrend_linear_reg <- function(x) {
  lr_f <- lm(formula = x ~ c(1:length(x)))
  x_lr <- lr_f$coefficients[1] + c(1:length(x)) * lr_f$coefficients[2]
  return(x - x_lr)
}

## --- CHART: All three variables detrended versus HPI 
png("detrended_hpi_versus_all.png", width = 800, height = 600)
par(mfrow=c(1, 3))
plot(hd$Date, detrend_linear_reg(hd$ValueHousing), axes=FALSE, type="l", lwd=2, col="chartreuse4", xlab="", 
     ylab="", main="Housing Value and M3")
par(new=TRUE)
plot(hd$Date, detrend_linear_reg(hd$M3Billion), axes=FALSE, type="l", lwd=2, col="blue", xlab="", ylab="")

plot(hd$Date, detrend_linear_reg(hd$ValueHousing), axes=FALSE, type="l", lwd=2, col="chartreuse4", xlab="", 
     ylab="", main="Housing Value and Population")
par(new=TRUE)
plot(hd$Date, detrend_linear_reg(hd$Population), axes=FALSE, type="l", lwd=2, col="brown", xlab="", ylab="")

plot(hd$Date, detrend_linear_reg(hd$ValueHousing), axes=FALSE, type="l", lwd=2, col="chartreuse4", xlab="", 
     ylab="", main="Housing Value and Inflation (Compound)")
par(new=TRUE)
plot(hd$Date, detrend_linear_reg(hd$InflationCmpd), axes=FALSE, type="l", lwd=2, col="purple", xlab="", ylab="")
dev.off()

## Correlation - post de-trending
pop_dt <- detrend_linear_reg(tail(hd$Population, -12))
m3_dt <- detrend_linear_reg(hd$M3)
value_housing_dt <- detrend_linear_reg(hd$ValueHousing)
inflation_dt <- detrend_linear_reg(hd$InflationCmpd)

## Correlation - post de-trending
cor(value_housing_dt, m3_dt)
cor(tail(value_housing_dt, -12), pop_dt)
cor(value_housing_dt, inflation_dt)
