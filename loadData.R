#This file/function is a util function to load raw data into workspace for futher processing and plotting

#File names
zipFileName <- "exdata%2Fdata%2FNEI_data.zip"
summaryFileName <- "summarySCC_PM25.rds"
classificationFileName <- "Source_Classification_Code.rds"

#Check if summary file and classficaiton file already exist, if not, unzip the raw zip file
if (!file.exists(summaryFileName) ||
    !file.exists(classificationFileName))
    unzip(zipFileName)

#Load raw data
NEI <- readRDS(summaryFileName)
SCC <- readRDS(classificationFileName)
