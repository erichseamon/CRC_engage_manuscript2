library(ggplot2)

crcdata <- read.csv("./data/crc_data_ES2.csv")


#set YN to 01
require(dplyr)
crcdata <- crcdata %>%
  mutate(solution_proposed_YN = ifelse(solution_proposed_YN == "N",0,1))

require(dplyr)
crcdata <- crcdata %>%
  mutate(solution_implemented_YN = ifelse(solution_implemented_YN == "N",0,1))

require(dplyr)
crcdata <- crcdata %>%
  mutate(S_stakeholder_engagment_YN = ifelse(S_stakeholder_engagment_YN == "N",0,1))


barplot(colSums(crcdata[,4:10]))

#stakeholder types
barplot(colSums(crcdata[,23:32]), las=2)

#ghodsvali scale
barplot(colSums(crcdata[,33:36]), las=2)

#IAP2 scale
barplot(colSums(crcdata[,37:43]), las=2)

#local scale
barplot(colSums(crcdata[,44:51]), las=2)

#geography
barplot(colSums(crcdata[,52:57]), las=2)


ggplot(crcdata,aes(x=solution_proposed_YN, fill=year)) + 
  geom_bar(stat = "count", position = "dodge") 

ggplot(crcdata,aes(x=solution_implemented_YN, fill=year)) + 
  geom_bar(stat = "count", position = "dodge") 

ggplot(crcdata,aes(x=S_model_YN, fill=year)) + 
  geom_bar(stat = "count", position = "dodge") 
  


ggplot(as.data.frame(crcdata), aes(factor(year), Freq, fill = Species)) +     
  geom_col(position = 'dodge')


ggplot(data=crcdata, aes(x=S_policy)) +
  geom_bar()
