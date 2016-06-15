
#################################################################
## Exploratory Plots on PM2.5 Emissions Data
#################################################################

# Set the work directory to where the data resides

library(dplyr)
library(ggplot2)

# Read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# No NA values - good
sum(is.na(NEI))


# 2.	Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

# Answer: total emissions from PM2.5 in the Baltimore City went up and down from 1999 to 2008, with amount in 2008 being the lowest


with(NEI[NEI$fips == "24510",], 
     barplot(tapply(Emissions, year, sum), main = 'Baltimore City', xlab = 'year', ylab = 'Total emissions from PM2.5'))

dev.copy(png, file = "plot2.png", width = 500, height = 500, res = 130)
dev.off()
