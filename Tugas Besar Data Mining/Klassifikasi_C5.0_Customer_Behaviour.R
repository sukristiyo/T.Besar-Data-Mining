#set and get Lokasi Kerja
lokasi_kerja <- "E:/Data Mining/Tugas Besar"
setwd(lokasi_kerja)
getwd()
rm(list =ls())
#Instalasi package 
install.packages("C50")
install.packages("printr")
#Gunakan package 
library(C50)
library(printr)
#membaca data
dataset <- read.csv("Customer_Behaviour.csv", sep = ",")
dataset$Purchased<-as.factor(dataset$Purchased)
class(dataset$Purchased)
#Pembuatan model decision tree menggunakan algoritman C5.0
model <- C5.0(Purchased ~., data=dataset)
#Melihat model
model
summary(model)
#Menampilkan pohon yang sudah dibangun
plot(model)
#dataset, dijadikan sebagai data testing. Hanya kolom 1,2,3,4 saja, dan tanpa label
datatesting <- dataset[,1:4]
#prediksi
predictions <- predict(model, dataset)
#Membandingkan hasil prediksi dengan dataset
table(predictions, dataset$Purchased)


