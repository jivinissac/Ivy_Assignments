#read the training data into a dataframe called train
train<- read.table("C:/Users/User/Desktop/IVY/R/Nov 5/Titanic/train.csv",
                   
                  header = TRUE, sep = ",")
#set the pclass, passengers pseudoclass, to be ordered categorical
train$pclass <-factor(train$Pclass,levels = c(3, 2, 1), ordered = TRUE)
#Loading test data
#read the training data into a dataframe called train
test<- read.table("C:/Users/User/Desktop/IVY/R/Nov 5/Titanic/test.csv",
                  header = TRUE, sep = ",")
#pclass is categorical for test data also
test$pclass <-factor(test$Pclass,levels = c(3, 2, 1), ordered = TRUE)
summary(train)

S = train$Survived == 1
#data cleaning
clean_data <- function(dt){
  #replacing NA with mean
  dt$Age[is.na(dt$Age)]= round(mean(dt$Age,na.rm = T))
  #clearing outliers
  dt$Fare[dt$Age > 40]=round(mean(dt$Fare))
  return(dt)
  
}
train=clean_data(train)
test=clean_data(test)

#Logistic model
logistic_model <- glm(Survived ~ pclass + Age +Sex, family = binomial(), data=train)
training_predictions <- predict(logistic_model, type = "response")

#compute training error use an outcome cutoff at 0.5
training_error <-sum((training_predictions >= 0.5) != S)/nrow(train)
training_error
1-training_error

#training error for predictions in {0,1}
test_predictions = predict(logistic_model, test, type = "response")

#using a probability cutoff of 0.5 for outcome of survived, default missing to deceased
test_predictions[test_predictions >=0.5] <- 1
test_predictions[ test_predictions != 1] <- 0
test_predictions[is.na(test_predictions)] <- 0
write.table(test_predictions, "C:/Users/User/Desktop/IVY/R/Nov 5/Titanic/predictions1.csv",col.names = F,row.names=F,quote=FALSE)
