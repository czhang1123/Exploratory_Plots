
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



# 1.	Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission 
# from all sources for each of the years 1999, 2002, 2005, and 2008.

# Answer: yes total emissions from PM2.5 have decreased in the United States from 1999 to 2008

with(NEI, barplot(tapply(Emissions, year, sum), main = 'United States Overall', xlab = 'year', ylab = 'Total emissions from PM2.5'))

dev.copy(png, file = "plot1.png", width = 500, height = 500, res = 130)
dev.off()
