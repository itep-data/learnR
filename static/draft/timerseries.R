---
title: "ITEP_Times Series Primer"
author: "KMEllickson"
date: "July 2, 2018"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

-training for ITEP:
3 days
Day 1. Morning - 2.5 hours
            Evening - 2.5 hours
Day 2. Morning - 2.5 hours
            Evening - 2.5 hours
Day 3. Morning - 2.5 hours

Teaching Objectives
be able to make these plots here: https://gispub.epa.gov/air/trendsreport/2017/#naaqs_trends

#Day 1
##Customizing R Studio
###Installing packages

Students will have installed R and R Studio prior to the start of class.
1. First exercise in the class is to look for updates.

1. How to install a new package and some means of finding the package you want. (this will avoid some people doing nothing in the rest of the class)
install readr first
install ggplot2
put in images for both of these
some explanation
pull form existing tutorial
install.packages("increaseTravelBudget")

Now we are going to explore our data so, let's learn how to make a project.

########we already decided that we will not make an itep package this is not how people actually work. Dorian.
Customizing increasing changing font themes and ah settings yea cool

##Getting Data into R Studio
###Starting an R project
insert new project stuff here from the 3 day class

1. How to get data into R.
readr
Students will be able to read excel files into R Studio
insert readr stuff here

##Jumping in 
###Plots are motivating!
####Here is where we are going these next three days
```{r, eval = F, echo = T}
ggplot(data = data_we_choose_later, aes(x = date, y = conc, color = site_id)) +
  geom_line() +
  geom_point() +
  geom_smooth(method = "lm")
##have something look wrong in the chart, like a really unrealistically high value.
```


##Ways to look at 
glimpse, summary

next: filter and arrange data, to find when this really high value happened

dplyr

mutate (create season column) - here is a good point to talk about commands and arguments, because we will need to change the default fiscal start to make this a met-season.

group_by (year) and (year AND quarter)

summarise (group categories, create trend tables)

there will be nulls in the data which ggplot has ignored, but mean() won't!
go through some of the possible null characters or numerics that are used.

remove nulls (or wierd characters that represent nulls)

save new data
-make the point that we never modifed the original data file. You cannot break your data if you rename it in R.

lubridate and work with dates

Students will be able to create a time series plot withs smoothing, detection limt (maybe-or just another line, add geompoint, the take away dots with just geomline)

Students will be able to create a calendar plot with data

The hunt for outliers...boxplots. Make these by several different time categories.

Students will be able to create a wind rose with data
but first we need to teach left_join()

Students will be able to create a pollution rose with data

leaflet maps

include an emission charts

Working wiht difficult people[strikeout] data
so, 
Students will be able to tidy data, , gather and spread, change column names

Super mutating

Students will have script that calculates design values for criteria pollutant data
Look into past agency trend reports
Decide on theme, what data
Make objectives more specific. 
split into separate Rmd files (~4-5 minutes chunks)

