# Install new packages
install.packages(c("dplyr", "ggplot2", "ggrepel"))

# Load required packages
library(dplyr)
library(ggplot2)
library(ggrepel)
library(ggridges)

# Get starwars character data
star_df <- starwars

# What is this?
glimpse(star_df)


# Height distribution
ggplot(star_df, aes(x = height)) + geom_histogram(fill = "hotpink")


# Height vs. Mass scatterplot
ggplot(star_df, aes(y = mass, x = height)) +
   geom_point(aes(color = species), size = 5)


# Add labels
ggplot(star_df, aes(y = mass, x = height)) +
  geom_point(aes(color = species), size = 5) +
  geom_text_repel(aes(label = name))


# Log scale for Mass
ggplot(star_df, aes(y = log10(mass), x = height)) +
  geom_point(aes(color = species), size = 5) +
  geom_text_repel(aes(label = name))


# Without the Hutt
ggplot(filter(star_df, species != "Hutt"), aes(y = mass, x = height)) +
  geom_point(aes(color = species), size = 5) +
  geom_text_repel(aes(label = name, color = species))


# Split out by species
ggplot(star_df, aes(x = mass, y = height)) +
  geom_point(aes(color = species), size = 3) +
  facet_wrap(vars(species)) +
  guides(color = FALSE)

