library(rvest)
library(dplyr)
library(robotstxt)

url<-"https://www.amazon.in/s?k=32+watches&crid=3S0GJZ9N3YKTZ&sprefix=32+watche%2Caps%2C268&ref=nb_sb_noss_2"
path = paths_allowed(url)

web <- read_html(url)
View(web)

image<-web%>%html_nodes(".s-image")%>%html_text()
View(image)

configuration<-web%>%html_nodes(".a-color-base.a-text-normal")%>%html_text()
View(configuration)

price<-web%>%html_nodes(".s-title-instructions-style")%>%html_text()
View(price)

date<-web%>%html_nodes(".s-align-children-center .a-text-bold")%>%html_text()
View(date)

watches <- data.frame(image,configuration,price,date)
View(watches)

write.csv(watches,"amazon_watches.csv")
str(watches)
