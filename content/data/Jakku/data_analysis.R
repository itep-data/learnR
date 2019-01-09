library(dplyr)
library(readr)
library(ggplot2)

# read in the salvage output report from the .csv
data <- read_csv("starwars_scrap_jakku_subset.csv")

#start looking at the data
head(data)



ggplot(data, aes(x=Origin, y = Amount))+
  geom_col()

data %>% filter(Origin == "All")

tail(data)

jakku <- data[-241,]

arrange(jakku, desc(Price_per_Ton))

#Let's take a deeper dive on the Units
ggplot(data, aes(x=Units, y=Amount))+
  geom_col()

#We see that there are two spelling of Tons, we should look at them in more detail
data %>% filter(Units == 'TONS')

#Looks like for the Ion Engine, they spells Tons in Upper case vs Tons
data <- data %>% 
  mutate(Units = replace(Units, Units == 'TONS', "Tons"))

data$Units[data$Units == 'TONS'] <- "Tons"

data$Units <- tolower(data$Units)

#we could have also used the function toupper() or tolower()

ggplot(data, aes(x=Units, y=Amount))+
  geom_col()

#Excellent! This is fixed! However, we now have a new problem. We want to know 
#the total amount of salvage collected but we have mixed units
#We need a conversion table.

convert <- read.csv("conversion_table.csv")
head(convert)

#We need to join this table with our data table, but the column names are not the same
#We can also drop the units column since we have that already and it's been corrected

data <- left_join(data, convert, by = c("Salvage" = "desc")) %>% 
  select(-units)


data <- data %>% mutate(Ton_Conv = ifelse(Units == 'Tons', Amount,
                                          Amount*pounds/2000))

head(data)

