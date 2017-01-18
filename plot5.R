#This script answers the question: How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
library(dplyr)
source("loadData.R")


#Filter, select and merge

#Filter by short name containing motorcycles
motor <- SCC %>%
    filter(grepl("Motorcycles", Short.Name)) %>%
    select(SCC)

#Filter by fips to get Baltimore data
balitimore <- NEI[NEI$fips == "24510",]

#Merge the data sets
merged <- merge(balitimore, motor, by = "SCC")

#Group by year and sum
yearSum <- merged %>%
    group_by(year) %>%
    summarise(total = sum(Emissions))

#Plot data, as shown in the diagram, there has been decreasing until 2005, then increased till 2008,
qplot(year,
      total,
      data = yearSum,
      geom = c("point", "smooth"))
