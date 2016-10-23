
# Run each plot and try to study and enhance
# Scatterplot matrix of DMC,DC,wind,rain,temp
# 3D Scatterplot of wind,rain,area
# Interactive 3D Scatterplot of wind,rain,area
# Boxplot of X and Y
# Simple bar plot of temp, wind, rain [horizontal and vertical]
# Grouped bar plot of X and Y
# Histogram of probability distribution of X, Y, wind, temp, area along with line density
# Histogram of frequency distribution of X, Y, wind, temp, area
# Pie Chart of area, wind, rain, temp by month
# Pie Chart of area, wind, rain, temp by day
# Map Plot of sourceAirportID
# Map Plot of destinationAirportID

df<-read.csv("C:/Users/User/Desktop/IVY/R/forestfires.csv")
summary(df)
attach(df)
install.packages("scatterplot3d")
library(scatterplot3d)
pairs(~DMC+DC+wind+rain,data=df, 
      main="Simple Scatterplot Matrix")
library(scatterplot3d)
scatterplot3d(wind,rain,area,main = "SactterPlot 3d")
install.packages("rgl")
library(rgl)
plot3d(wind,rain,area,col = "blue",size = 3)
boxplot(X,Y, main= "Box Plt", xlab ="X", ylab ="Y", size =3)
counts <- table(temp)
barplot(counts, main="Temperature Distribution", horiz=TRUE)
barplot(counts, main="Temperature Distribution")
Counts_1 <- table(wind)
barplot(Counts_1, main="Wind Distribution", horiz=TRUE)
barplot(Counts_1, main="Wind Distribution")
Counts_2 <- table(rain)
barplot(Counts_1, main="Rain Distribution", horiz=TRUE)
barplot(Counts_1, main="Rain Distribution")
barplot(X,Y, main="Distribution by X and Y",
        xlab="X", col=c("darkblue","red"),
        
          legend = rownames(X,Y), beside=TRUE)
counts <- table(X,Y)
barplot(counts, main="Distribution by X and Y",
        xlab="X", col=c("Green","red"),
        legend = rownames(counts), beside=TRUE)
hist(, 
     main="Histogram for X", 
     xlab="X", 
     border="blue", 
     col="green", 
     las=1, 
     breaks=5, 
     prob = TRUE)
lines(density(X))

hist(Y, 
     main="Histogram for Y", 
     xlab="Y", 
     border="blue", 
     col="green", 
     las=1, 
     breaks=5, 
     prob = TRUE)
lines(density(Y))

hist(wind, 
     main="Histogram Wind", 
     xlab="Wind", 
     border="blue", 
     col="green", 
     las=1, 
     breaks=5, 
     prob = TRUE)
lines(density(wind))

hist(wind, 
     main="Histogram Wind", 
     xlab="Wind", 
     border="blue", 
     col="green", 
     las=1, 
     breaks=5)

     hist(X, 
          main="Histogram X", 
          xlab="X", 
          border="blue", 
          col="green", 
          las=1, 
          breaks=5)
          
     hist(Y, 
          main="Histogram Y", 
          xlab="Y", 
          border="blue", 
          col="green", 
          las=1, 
          breaks=5)
     
     hist(temp, 
          main="Histogram temp", 
          xlab="Temp", 
          border="blue", 
          col="green", df_area <- summarise(group_by(df, month), area=sum(area))
     slices <- df_area[["area"]] 
     pie(slices, labels = month, main = "Pie Chart of Area")
          las=1, 
          breaks=5)
     hist(area  , 
          main="Histogram Area", 
          xlab="Area", 
          border="blue", 
          col="green", 
          las=1, 
          breaks=5)
     library(dplyr)
     
     df_Wind <- summarize(group_by(df,month),wind=sum(wind))
     slices <- df_Wind[["wind"]] 
     pie(slices, labels = month, main="Pie Chart of Wind")
     
     df_area <- summarise(group_by(df, month), area=sum(area))
      slices <- df_area[["area"]] 
     pie(slices, labels = month, main = "Pie Chart of Area")
     
     df_rain <- summarise(group_by(df, month), rain=sum(rain))
     slices <- df_rain[["rain"]]
     pie(slices, labels = month, main = "Pie Chart of Rain")
     
     df_temp <- summarise(group_by(df, month), temp=sum(temp))
     slices <- df_temp[["temp"]]
     pie(slices, labels = month, main = "Pie Chart of Temp")
     
     df_Wind <- summarize(group_by(df,day),wind=sum(wind))
     slices <- df_Wind[["wind"]] 
     pie(slices, labels = day, main="Pie Chart of Wind")
     
     df_area <- summarise(group_by(df, day), area=sum(area))
     slices <- df_area[["area"]] 
     pie(slices, labels = day, main = "Pie Chart of Area")
     
     df_rain <- summarise(group_by(df, day), rain=sum(rain))
     slices <- df_rain[["rain"]]
     pie(slices, labels = day, main = "Pie Chart of Rain")
     
     df_temp <- summarise(group_by(df, day), temp=sum(temp))
     slices <- df_temp[["temp"]]
     pie(slices, labels = day, main = "Pie Chart of Temp")
     
     airports <- read.csv("C:/Users/User/Desktop/IVY/R/oct 22/airports.dat")
     colnames(airports) <- c("ID", "name", "city", "country", "IATA_FAA", "ICAO", "lat", "lon", "altitude", "timezone", "DST")
     head(airports)
     routes <- read.csv("C:/Users/User/Desktop/IVY/R/oct 22/routes.dat")
     head(routes)
     

    
     
     