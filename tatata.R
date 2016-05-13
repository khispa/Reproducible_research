download.file("https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2","raw_data.csv.bz2")

lalal2 <- read.csv("raw_data.csv")

library(data.table)

all_data <-data.table(lalal2)

fatalities <- all_data[, total_fat := sum(FATALITIES), by = c("EVTYPE")]


fatalities2 <- data.frame(type = fatalities$EVTYPE, count = fatalities$total_fat)
fatalities2 <- unique(fatalities2)
worst <-  fatalities2[fatalities2$count == max(fatalities2$count),]
fatalities3<- fatalities2[fatalities2$count>300,]

barplot(fatalities3$count, names.arg = fatalities3$type)
