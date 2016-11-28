install.packages("devtools")
install.packages("rjson")
install.packages("bit64")
install.packages("httr")
install.packages("plyr")
install.packages("twitteR")
install.packages("stringr")
install.packages("rtools")
install.packages("tm")
install.packages("wordcloud")


library(wordcloud)
library(devtools)
library(plyr)
library(twitteR)

?searchTwitteR
#Twitter session info

api_key <- "lTapq2nEKeMF2AkTgAbCj7v3r"
api_secret <- "TgAqq4PMgraUG1h7Ht4C7Mf544MQOCaHSpeWfp2qHIa0tKkWtN"
access_token <- "141552068-sh3ofHYws5EGQGogaVgaCiTKtfdZRUwBh3vaIb7N"
access_token_secret <- "o9dwkWAUJhXFFQAuBCxsuFaivrYTP6zFDvLFteJTCpY9i"

library(httr)


setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)
#Get tweets for demonitisation decision
?searchTwitteR

hashtags <- c("#demonitisation","#blackmoney","#CashCrunch","#economy")
needle <- paste(hashtags, sep ="OR")
tweets=searchTwitter(needle,n=1000, )
df <- do.call("rbind", lapply(tweets, as.data.frame))
?do.call
text <- df$text

library(tm)
review_source <- VectorSource(text)
corpus <- Corpus(review_source)

#Cleaning Tweets

corpus <- tm_map(corpus,removePunctuation)
corpus <- tm_map(corpus,content_transformer(tolower))
corpus <- tm_map(corpus,stripWhitespace)
corpus <- tm_map(corpus,removeWords,stopwords("english"))

dtm <- DocumentTermMatrix(corpus)
dtm2 <- as.matrix(dtm)

frequency <- colSums(dtm2)
frequency <- sort(frequency,decreasing=TRUE)
head(frequency,n=200)


install.packages("RColorBrewer")
library(RColorBrewer)
library(wordcloud)

trunc_freq <- frequency[2:100]
frequency[1]
words <- names(frequency)
wordcloud(words[1:50],frequency[1:50])
clr=brewer.pal(8, "Dark2")
wordcloud(words[1:50],frequency[1:50],random.order = FALSE,colors =clr)
