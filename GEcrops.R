## Download data set from USDA website

if (!file.exists("data")) {
        dir.create("data")
}
download.file(url="http://ers.usda.gov/datafiles/Adoption_of_Genetically_Engineered_Crops_in_the_US/alltables.xls",
              destfile="./data/GEcrops.xls", mode="wb")

## Read in each worksheet from Excel file

library(xlsx)
corn <- read.xlsx("./data/GEcrops.xls", 1)
cotton <- read.xlsx("./data/GEcrops.xls", 2)
soybeans <- read.xlsx("./data/GEcrops.xls", 3)

## Subset each data frame by U.S. totals

cornUS <- corn[37,18:33]
cottonUS <- cotton[31,18:33]
soybeansUS <- soybeans[19,18:33]

## Combine subsets and rename columns/rows

crops <- rbind(cornUS, cottonUS, soybeansUS)
names(crops) <- c(2000:2015)
row.names(crops) <- c("corn", "cotton", "soybeans")

## Export tidy data set to CSV

write.csv(crops, file="./data/GEcrops.csv")