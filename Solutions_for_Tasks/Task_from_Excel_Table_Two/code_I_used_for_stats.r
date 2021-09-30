getwd()
setwd("F:/folder")
install.packages("readxl")
install.packages("sqldf")
install.packages("ggplot2")
library(readxl)
library(sqldf)
library(ggplot2)
library(openxlsx)
library(data.table)
mynamestheme <- theme(plot.title = element_text(family = "Helvetica", face = "bold", size = (15)), 
                      legend.title = element_text(colour = "darkblue",  face = "bold.italic", family = "Helvetica"), 
                      legend.text = element_text(face = "italic", colour="steelblue",family = "Helvetica"), 
                      axis.title = element_text(family = "Helvetica", size = (10), colour = "dodgerblue4"),
                      axis.text = element_text(family = "Courier", colour = "cyan4", size = (10)))

data_productssss = read_excel("data_productsss.xlsx")
### 	2. How did the total market shares of waters manufactured by Mattoni 1873 evolve in Q3 and Q4 2019?
### create plots to show amount of sold water in Q3 and Q4, then compare different basic statistics in different shops

data_productssss$Q1 = rowSums(data_productssss[, c("Jan 2019", "Feb 2019", "Mar 2019")])
data_productssss$Q2 = rowSums(data_productssss[, c("Apr 2019", "May 2019", "Jun 2019")])
data_productssss$Q3 = rowSums(data_productssss[, c("Jul 2019", "Aug 2019", "Sep 2019")])
data_productssss$Q4 = rowSums(data_productssss[, c("Oct 2019", "Nov 2019", "Dec 2019")])

data_czk = sqldf('SELECT * FROM data_productssss WHERE Fact = "Value (in 1 000 000 CZK)" ')
data_ltrs = sqldf('SELECT * FROM data_productssss WHERE Fact = "Volume (in 1000 LTRS)" ')
avg_czk_q1 = mean(data_czk$Q1)
avg_ltrs_q1 = mean(data_ltrs$Q1)
avg_czk_q2 = mean(data_czk$Q2)
avg_ltrs_q2 = mean(data_ltrs$Q2)
avg_czk_q3 = mean(data_czk$Q3)
avg_ltrs_q3 = mean(data_ltrs$Q3)
avg_czk_q4 = mean(data_czk$Q4)
avg_ltrs_q4 = mean(data_ltrs$Q4)

a = data.table(x = c(1, 2, 3, 4),
               y = c(avg_czk_q1, avg_czk_q2, avg_czk_q3, avg_czk_q4),
               z = c(avg_ltrs_q1, avg_ltrs_q2, avg_ltrs_q3, avg_ltrs_q4))
?BOD
BOD
colnames(a) = c("quarter", "Avarage_Value", "Aavarage_Liters")
a

plot_for_value = ggplot(a, aes(x = quarter, y = Avarage_Value)) + geom_line() + geom_point() + ggtitle("Avarage Value of Sold Water in Mattoni 1873 during 4 quarters in 2019") +
  labs(y = "Avarage Value(in 1000000 CZK)", x = "Quarters") + mynamestheme
plot_for_value

plot_for_ltrs = ggplot(a, aes(x = quarter, y = Aavarage_Liters)) + geom_line() + geom_point() + ggtitle("Avarage Volume of Sold Water in Mattoni 1873 during 4 quarters in 2019") +
  labs(y = "Avarage Volume(in 1000 LTRS)", x = "Quarters") + mynamestheme
plot_for_ltrs


write.xlsx(data_productssss, 'final_data.xlsx')


