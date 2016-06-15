
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


# 5.	How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# Answer: Emissions from motor vehicle sources in Baltimore City decreased more than half in 2002, then decreased further in 2008.

# motor vehicle means type == 'ON-ROAD'

with(NEI[NEI$fips == "24510" & NEI$type == 'ON-ROAD',], 
     barplot(tapply(Emissions, year, sum), main = 'Baltimore City, Motor Vehicle Only', xlab = 'year', ylab = 'Total emissions from PM2.5'))

dev.copy(png, file = "plot5.png", width = 500, height = 500, res = 130)
dev.off()
