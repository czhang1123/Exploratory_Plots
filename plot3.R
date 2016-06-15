
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


# 3.	Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

# Answer: 'NON-ROAD', 'NONPOINT', 'ON-ROAD' have seen decreases; 'POINT' has seen both increases and decreases

Balti.year.type <- 
        (
                NEI[NEI$fips == "24510",] %>%
                        group_by(year, type) %>%
                        summarize(Emissions = sum(Emissions))
        )

ggplot(Balti.year.type, aes(x = year, y = Emissions, color = type, group = type)) + 
        geom_point() + geom_line() + ggtitle('Baltimore City') + ylab('Total emissions from PM2.5')

dev.copy(png, file = "plot3.png", width = 700, height = 500, res = 130)
dev.off()
