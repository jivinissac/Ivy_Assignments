df <- read.csv("C:/Users/User/Desktop/IVY/R/forestfires.csv")
library(plyr)
df_X <- df["X"]
X_square <- df_X^2
print(X_square)
Sub1_df <- df[c("FFMC","DMC","DC")]
colSums(Sub1_df)
colMeans(Sub1_df,na.rm = TRUE)
#column median is not working
#standard deviation is not working
# Create another column called "Month", which has full values of month, i.e "aug" becomes "August", "sep" becomes "September" and so on
#	Create another Column Day_Num where day will be from 1 to 7 - 1 being Sunday, 2 being Monday, 3 being Tuesday and so on

library(dplyr)
df_xy <- df[c("X","Y")]
cor(df_xy,use = "everything", method = c("pearson"))
Q678 <- summarise(group_by(df,month),sum(rain),sum(wind),mean(rain),mean(wind),count=n())
Q9 <- summarise(group_by(df,month,day),count=n())


