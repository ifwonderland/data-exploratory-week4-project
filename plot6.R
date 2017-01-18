# This script answers the following question: Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city has seen greater changes over time in motor vehicle emissions?
library(dplyr)
source("loadData.R")

#Get motor SCC records
motor <- SCC %>%
    filter(grepl("Motorcycles", Short.Name)) %>%
    select(SCC, Short.Name)

#Get Blatimore and LA merged
balitimore <-
    merge(NEI[NEI$fips == "24510",], motor, by = "SCC") %>%
    transform(city = "Baltimore")
la <- merge(NEI[NEI$fips == "06037",], motor, by = "SCC") %>%
    transform(city = "Los Angeles")

bothCities <- rbind(balitimore, la)

#Group and sum by year
yearSum <- bothCities %>% group_by(year, city) %>%
    summarise(total = sum(Emissions))


#Plot in the same graph with cities colored differently, as we can see, LA is higher than Balitmore and have been increasing until 2005
qplot(
    year,
    total,
    data = yearSum,
    color = city,
    geom = c("point", "smooth")
)
