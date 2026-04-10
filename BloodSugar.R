# Data management
Diabetes_ill=c(1.30,1.67,0.95,0.92,1.10) # - Entry of variable "Diabetes_ill"
Diabetes_ill 

Diabetes_healthy=c(0.63,1.33,1.42,0.68,0.60) # - Entry of variable "Diabetes_healthy"
Diabetes_healthy 

data=data.frame(Diabetes_ill, Diabetes_healthy) 
data
View(data)

# Normality tests (Shapiro-Wilk test and Kolmogoroc-Smirnoff)
library(dplyr) 
library(nortest)

shapiro.test(data$Diabetes_ill) #Performs the Shapiro-Wilk test of normality for Diabetes_ill
data%>% summarise(statistic = shapiro.test(Diabetes_ill)$statistic, p.value = shapiro.test(Diabetes_ill)$p.value) #Performs the Shapiro-Wilk test of normality

mean1 = mean(data$Diabetes_ill)
sd1 = sd(data$Diabetes_ill)
ks.test(data$Diabetes_ill, "pnorm", mean1, sd1)
data%>% summarise(statistic = ks.test(data$Diabetes_ill, "pnorm", mean1, sd1)$statistic, p.value = ks.test(data$Diabetes_ill, "pnorm", mean1, sd1)$p.value) # Performs the KS test of normality

lillie.test(data$Diabetes_ill)
data%>% summarise(statistic = lillie.test(data$Diabetes_ill)$statistic, p.value = lillie.test(data$Diabetes_ill)$p.value) # Performs the KS test of normality

shapiro.test(data$Diabetes_healthy) #Performs the Shapiro-Wilk test of normality for Diabetes_healthy
data%>% summarise(statistic = shapiro.test(Diabetes_healthy)$statistic, p.value = shapiro.test(Diabetes_healthy)$p.value) # Performs the Shapiro-Wilk test of normality for Diabetes_healthy

mean2 = mean(data$Diabetes_healthy)
sd2 = sd(data$Diabetes_healthy)
ks.test(data$Diabetes_healthy, "pnorm", mean2, sd2)
data%>% summarise(statistic = ks.test(data$Diabetes_healthy, "pnorm", mean2, sd2)$statistic, p.value = ks.test(data$Diabetes_healthy, "pnorm", mean2, sd2)$p.value) #Performs the KS test of normality

lillie.test(data$Diabetes_healthy)
data%>% summarise(statistic = lillie.test(data$Diabetes_healthy)$statistic, p.value = lillie.test(data$Diabetes_healthy)$p.value)  #Performs the KS test of normality

# Data description
library(psych) 
describe(data)  
describe(select(data,c(Diabetes_ill, Diabetes_healthy)))
describe(select(data,c(Diabetes_ill)))
describe(select(data,c(Diabetes_healthy)))

# Non-parametric tests
#Testing whether the median blood sugar level of children with healthy parents is equal to 1.
#Testing whether the blood sugar level of children differs depending on whether the parents are healthy or suffer from diabetes.

library(BSDA)

SIGN.test(x = data$Diabetes_healthy, md = 1) #One-sample Sign-Test
data%>% summarise(statistic = SIGN.test(x = Diabetes_healthy, md = 1)$statistic, p.value = SIGN.test(x = Diabetes_healthy, md = 1)$p.value)



# 

# Solution 1
wilcox.test(data$Diabetes_ill, data$Diabetes_healthy)#Performs two-sample Wilcoxon tests on vectors of data; also known as ‘Mann-Whitney’ test

# Solution 2
data_new=data.frame(diabetes=c(data$Diabetes_ill, data$Diabetes_healthy), group=c(1,1,1,1,1,2,2,2,2,2))
data_new$group=factor(data_new$group,levels = c(1,2),labels=c("ill parents","healthy parents"))
data_new
View(data_new)
wilcox.test(data_new$diabetes~data_new$group) # Performs two-sample Wilcoxon tests on vectors of data; also known as ‘Mann-Whitney’ test
data_new%>% summarise(statistic = wilcox.test(diabetes~group)$statistic, p.value = wilcox.test(diabetes~group)$p.value)
