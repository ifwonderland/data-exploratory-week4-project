#This script answers the followin question: Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
library(ggplot2)

source("loadData.R")

#Get total emissions per year for Baltimore
EcBaltimore <- NEI[NEI$fips == "24510", ]

#Group by type, year in the data
EcTypeYear <-
    aggregate(EcBaltimore$Emissions,
              list(EcBaltimore$type, EcBaltimore$year),
              sum)

names(EcTypeYear) <- c("Type", "Year", "Total.Emission")

#Qplot the trend (points + smooth line) for each type over years, as we can see from the diagram, all types except point type has decreased over time
qplot(
    Year,
    Total.Emission,
    data = EcTypeYear,
    color = Type,
    geom = c("point", "smooth")
)