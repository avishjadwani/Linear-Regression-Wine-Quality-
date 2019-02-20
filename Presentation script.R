# Data Input
winedata<-read.csv("./wine.csv")
# Structure of wine data  
str(winedata)
# Correlation Matrix
cor(winedata)
# Model 1 with low correlation values 
# ie. Price vs winterRain, Age, France pop
# Model 2 Price vs AGST, Harvest Rain, Age Francepop 
# Scatter plots
plot1<-plot(winedata$Price, winedata$WinterRain, xlab =  "Winter Rain", ylab = "Price", main = "Price vs Winter Rain")
plot2<-plot(winedata$Price, winedata$AGST, xlab =  "Average growing season temperature", ylab = "Price", main = "Price vs AGST")
plot3<-plot(winedata$Price, winedata$HarvestRain, xlab =  "Harvest Rain", ylab = "Price", main = "Price vs Harvest Rain")
plot4<-plot(winedata$Price, winedata$Age, xlab =  "Age", ylab = "Price", main = "Price vs Age")
plot5<-plot(winedata$Price, winedata$FrancePop, xlab =  "France population", ylab = "Price", main = "Price vs France Population")
# Creating a linear regression model
#model1<- lm(Price~WinterRain +Year+ Age+FrancePop, data= winedata)
model1<- lm(Price~WinterRain + Age+Year, data= winedata)
summary(model1)
model2<-lm(Price~AGST+HarvestRain+Age+FrancePop , data = winedata)
summary(model2)
#Getting test data
testdata<- read.csv("./wine_test.csv")
#summary of test data 
summary(testdata)
prediction1<-predict(model1, newdata = testdata)
prediction2<- predict(model2, newdata = testdata)
prediction1
prediction2
testdata$Price

