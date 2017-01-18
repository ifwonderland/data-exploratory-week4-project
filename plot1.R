#This script will answer the following question: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

source("loadData.R")
#Get total emissions per year
totalEc <- aggregate(NEI$Emissions, list(NEI$year), sum)
names(totalEc) <- c("Year", "Total.Emission")

#Plot this data, showing that total emission has been decreasing over years
plot(
    totalEc$Year,
    totalEc$Total.Emission,
    type = "b",
    xlab = "Year",
    ylab = "Total Emission"
)