
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


# 6.	Compare emissions from motor vehicle sources in Baltimore City 
# with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

# Answer: Los Angeles County has seen greater changes over time in motor vehicle emissions

Baltimore <-
        (
                NEI[NEI$fips == "24510" & NEI$type == 'ON-ROAD',] %>%
                        group_by(year) %>%
                        summarize(Emissions = sum(Emissions)) %>%
                        mutate(county = 'Baltimore City')
        )

LA <-
        (
                NEI[NEI$fips == "06037" & NEI$type == 'ON-ROAD',] %>%
                        group_by(year) %>%
                        summarize(Emissions = sum(Emissions)) %>%
                        mutate(county = 'Los Angeles County')
        )

Combined <- rbind(Baltimore, LA)

ggplot(Combined, aes(x = year, y = Emissions, color = county, group = county)) + 
        geom_point() + geom_line() + 
        ggtitle('Baltimore City vs. Los Angeles County, Motor Vehicle Only') + 
        ylab('Total emissions from PM2.5')

dev.copy(png, file = "plot6.png", width = 800, height = 500, res = 130)
dev.off()

