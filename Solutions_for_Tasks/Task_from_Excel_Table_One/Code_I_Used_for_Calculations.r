getwd()
setwd("F:/folder")
install.packages("readxl")
library(readxl)
library(sqldf)
my_data = read_excel("task1_data.xlsx")


#1)
V1_fuzz = sqldf('SELECT * from my_data WHERE ITEM = "FUZETEA-GR.TEA LIME&MINT 1.5L PB" AND MARKET = "CZ Hypermarkets"' )
Answer1 = V1_fuzz[3,9]

### ANSWER : 90.51300


#2. Jaka byla prumerna cena produktu AQUILA-PRVNI VODA KOJENECKA 1.5L PB NS K v CZ Hypermarkets letech 2014, 2015, 2016?
# choose  AQUILA-PRVNI VODA KOJENECKA 1.5L PB NS K in CZ Hyper and calculate avg price
AVG_AQ = sqldf('SELECT * from my_data WHERE ITEM = "AQUILA-PRVNI VODA KOJENECKA 1.5L PB NS K" AND MARKET = "CZ Hypermarkets"' )
Total = AVG_AQ[4,]
Answer2_2014 = AVG_AQ[4,9]
Answer2_2015 = AVG_AQ[4,10]
Answer2_2016 = AVG_AQ[4,11]

#3. Kolik se prodalo v CZK (Value in 1 000 000 CZK) produktu 7UP-1L PB na CZ Petrol Stations v roce 2015?
CZK_7UP = sqldf('SELECT * FROM my_data WHERE ITEM = "7UP-1L PB" AND MARKET = "CZ Petrol Stations"')
Answer3 = CZK_7UP[2,10]

#  4. Kolik se prodalo kusu (Units in 1000 PCS) 0.5L PET lahvi ve WATER kategorii behem roku 2014?
names(my_data)[names(my_data) == 'PACKAGE TYPE'] <- 'PACKAGE_TYPE'
PET_2014 = sqldf('SELECT * FROM my_data WHERE CATEGORY = "TOTAL WATER" AND PACKAGE_TYPE = "BOTTLE PET" AND SIZE = "0.5L" AND FACT = "Units (in 1000 PCS)"')
Answer4 = sum(PET_2014[, "2014.0"]) ### In 1000 PCS


