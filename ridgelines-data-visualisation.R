library(lubridate)
library(tidyverse)
library(ggplot2)
library(ggridges)
library(forcats)
theme_set(theme_minimal())

setwd(dir = 'C:/Users/George.Aalbers/Desktop/behapp')

df <- read.csv('ridgelines-df.csv')

df$group <- factor(df$group, levels = c("Symptomatic","Asymptomatic"))

ridgeline <- ggplot(df, aes(x = value_feature, 
                            y = fct_reorder(variable, 
                                            value_feature, 
                                            .fun = 'median'), 
                            fill = group,
                            color = group)) +
  scale_fill_manual(values = c('Symptomatic'='black','Asymptomatic'='#c4c5e0')) + 
  scale_color_manual(values = c('Symptomatic'='white','Asymptomatic'='white')) +
  geom_density_ridges(alpha = 0.95) +
  facet_wrap(~ feature_group, scales = 'free') +
  labs(x = 'Feature value (minmax scaled)',
       y = 'Feature',
       fill = 'Group',
       color = 'Group') +
  xlim(-.1, 1)

ggsave('figures/distributions.pdf', ridgeline, width = 14, height = 6)