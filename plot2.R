#This script answers the following question: Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

source("loadData.R")

#Get total emissions per year for Baltimore
EcBaltimore <- NEI[NEI$fips == "24510", ]
totalEc <-
    aggregate(EcBaltimore$Emissions, list(EcBaltimore$year), sum)
names(totalEc) <- c("Year", "Total.Emission")

#Plot this data, showing that total emission for Baltimore which mostly decreasing, except for year 2005
plot(
    totalEc$Year,
    totalEc$Total.Emission,
    type = "b",
    xlab = "Year",
    ylab = "Total Emission"
)