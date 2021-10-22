getwd()
setwd("F:/folder")
library(readxl)
library(sqldf)
library(ggplot2)
library(openxlsx)
library(data.table)
data_productssss = read_excel("data_productsss.xlsx")

All_Volume = sqldf('SELECT * from data_productssss WHERE Fact = "Volume (in 1000 LTRS)"')
All_Value = sqldf('SELECT * from data_productssss WHERE Fact = "Value (in 1 000 000 CZK)"')


Mattoni1873_Volume = sqldf('SELECT * from data_productssss WHERE (BRAND = "AQUILA" OR BRAND = "DOBRA VODA" OR BRAND = "HANACKA" OR BRAND = "MAGNESIA" OR BRAND = "MATTONI" OR BRAND = "MLYNSKY PRAMEN" OR BRAND = "PODEBRADKA" OR BRAND = "THEODORA") AND Fact = "Volume (in 1000 LTRS)"')
Mattoni1873_Value = sqldf('SELECT * from data_productssss WHERE (BRAND = "AQUILA" OR BRAND = "DOBRA VODA" OR BRAND = "HANACKA" OR BRAND = "MAGNESIA" OR BRAND = "MATTONI" OR BRAND = "MLYNSKY PRAMEN" OR BRAND = "PODEBRADKA" OR BRAND = "THEODORA") AND Fact = "Value (in 1 000 000 CZK)"')


Mattoni1873_Value$Q1 = rowSums(Mattoni1873_Value[, c("Jan 2019", "Feb 2019", "Mar 2019")])
Mattoni1873_Value$Q2 = rowSums(Mattoni1873_Value[, c("Apr 2019", "May 2019", "Jun 2019")])
Mattoni1873_Value$Q3 = rowSums(Mattoni1873_Value[, c("Jul 2019", "Aug 2019", "Sep 2019")])
Mattoni1873_Value$Q4 = rowSums(Mattoni1873_Value[, c("Oct 2019", "Nov 2019", "Dec 2019")])



All_Volume$Q1 = rowSums(All_Volume[, c("Jan 2019", "Feb 2019", "Mar 2019")])
All_Volume$Q2 = rowSums(All_Volume[, c("Apr 2019", "May 2019", "Jun 2019")])
All_Volume$Q3 = rowSums(All_Volume[, c("Jul 2019", "Aug 2019", "Sep 2019")])
All_Volume$Q4 = rowSums(All_Volume[, c("Oct 2019", "Nov 2019", "Dec 2019")])

Mattoni1873_Volume$Q1 = rowSums(Mattoni1873_Volume[, c("Jan 2019", "Feb 2019", "Mar 2019")])
Mattoni1873_Volume$Q2 = rowSums(Mattoni1873_Volume[, c("Apr 2019", "May 2019", "Jun 2019")])
Mattoni1873_Volume$Q3 = rowSums(Mattoni1873_Volume[, c("Jul 2019", "Aug 2019", "Sep 2019")])
Mattoni1873_Volume$Q4 = rowSums(Mattoni1873_Volume[, c("Oct 2019", "Nov 2019", "Dec 2019")])



All_Value$Q1 = rowSums(All_Value[, c("Jan 2019", "Feb 2019", "Mar 2019")])
All_Value$Q2 = rowSums(All_Value[, c("Apr 2019", "May 2019", "Jun 2019")])
All_Value$Q3 = rowSums(All_Value[, c("Jul 2019", "Aug 2019", "Sep 2019")])
All_Value$Q4 = rowSums(All_Value[, c("Oct 2019", "Nov 2019", "Dec 2019")])




###q3 and q4 for volume
#q3
q3_all = sum(All_Volume[, 21])
q3_mattoni = sum(Mattoni1873_Volume[, 21])
q3 = (q3_mattoni/q3_all) * 100
#q4
q4_mattoni = sum(Mattoni1873_Volume[, 22])
q4_all = sum(All_Volume[, 22])
q4 = (q4_mattoni/q4_all) * 100

#-----------------------------------------------
#q3 value % from the whole water market in CZ
q3_value_all = sum(All_Value[, 21])
q3_value_mattoni = sum(Mattoni1873_Value[, 21])  
q3_value = (q3_value_mattoni/q3_value_all) * 100

#q2
q2_all = sum(All_Volume[, 20])
q2_mattoni = sum(Mattoni1873_Volume[, 20])
q2 = (q2_mattoni/q2_all) * 100
