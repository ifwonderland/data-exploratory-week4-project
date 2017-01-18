#This script answer the following question: Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
library(dplyr)
library(ggplot2)

source("loadData.R")

#From descriptions, we only need level one and level three of SCC and we can pre-filter by Combustion and Coal
filtered <-
    SCC %>%
    select(SCC, SCC.Level.One, SCC.Level.Three) %>%
    filter(grepl("Combustion", SCC.Level.One)) %>%
    filter(grepl("Coal", SCC.Level.Three))

#merge two data sets
merged <- merge(NEI, filtered, by = "SCC")

#group by Year, find total emissions from coal combustion-related sources
sumByYear <-
    merged %>%
    group_by(year) %>%
    summarise(total = sum(Emissions))

#plot total emissions by year, as shown in the graph, total emissions related to coal combusions have been decreasing over time, especiall from 2006 to 2008
qplot(
    year,
    total,
    data = sumByYear,
    geom = c("point", "smooth")
)
