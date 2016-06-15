
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


# 4.	Across the United States, 
# how have emissions from coal combustion-related sources changed from 1999-2008?

# Answer: Emissions from coal combustion-related sources were pretty flat during 1999-2005, then dropped in 2008

coalscc<-SCC[(grepl('Comb', SCC$EI.Sector) & grepl('Coal', SCC$EI.Sector)) | (grepl('Comb', SCC$Short.Name) & grepl('Coal', SCC$Short.Name)), 'SCC']

with(NEI[NEI$SCC %in% coalscc,], 
     barplot(tapply(Emissions, year, sum), main = 'Coal Combustion-Related Sources', xlab = 'year', ylab = 'Total emissions from PM2.5'))

dev.copy(png, file = "plot4.png", width = 500, height = 500, res = 130)
dev.off()
