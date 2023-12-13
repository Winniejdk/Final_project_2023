---
title: "Vielse_skilsmisse"
output:
  html_document: default
  pdf_document: default
date: "2023-10-25"
---
#Installing
```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

```{r}
rmarkdown::render
```


## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r cars}
summary(cars)
```

## Including Plots

You can also embed plots, for example:

```{r pressure, echo=FALSE}
plot(pressure)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.


#Installing the needed packages
```{r}
library(tidyverse)
library(dplyr)
library(rvest)
library(stringr)
library(janitor)
library(ggplot2)
library(hrbrthemes)
library(tidyr)
library(viridis)
```

#Import dataset 
```{r}
library(readr)
DATA_vielser_skilsmisser_clean <- read_delim("DATA_vielser_skilsmisser_clean.csv", 
    delim = ";", escape_double = FALSE, col_types = cols(År = col_number(), 
        Antal = col_number()), trim_ws = TRUE)
View(DATA_vielser_skilsmisser_clean) 
```

#Rename dataset
```{r}
df <- DATA_vielser_skilsmisser_clean

df
```
#Vielser og registrerede partnerskaber i alt
```{r}
df%>% 
  filter(År %in% c("1989", "1999", "2009", "2015", "2022")) %>% 
  filter(Type %in% c("Vielser og indgåede registrerede partnerskaber i alt", "Vielser mellem en mand og en kvinde", "Vielser mellem to mænd", "Vielser mellem to kvinder", "Indgåede registrerede partnerskaber mellem to mænd", "Indgåede registrerede partnerskaber mellem to kvinder")) %>%
  group_by(Antal,
           År,
           Type) %>% 
  tally() %>% 
  ggplot(aes(x = År,
             y = Antal,
             fill = Type)) + 
  geom_bar(position="dodge", stat="identity", width=3.5) +
  theme_minimal(base_size = 10) +
  scale_fill_hue(c = 35) +
  scale_y_continuous(breaks=seq(0,50000,2500))
```
#Vielser og registrerede partnerskaber i alt
```{r}
df%>% 
  filter(Type %in% c("Vielser og indgåede registrerede partnerskaber i alt")) %>% 
  filter(År %in% c("1989", "1995", "2000", "2005", "2010", "2015", "2022")) %>% 
  tail(7) %>%
  ggplot( aes(x=År, y=Antal, group=Type)) +
    geom_line( color="#69b3a2") +
    geom_point(shape=21, color="black", fill="#69b3a2", size=3) +
    theme_ipsum() +
  ggtitle("Vielser og indgåede registrerede partnerskaber i alt")
```

#Skilsmisser og opløste partnerskaber 
```{r}
df%>% 
  filter(År %in% c("1989", "1999", "2009", "2019")) %>% 
  filter(Type %in% c("Skilsmisser og opløste partnerskaber i alt", "Skilsmisser mellem en mand og en kvinde", "Skilsmisser mellem to mænd", "Skilsmisser mellem to kvinder", "Opløste partnerskaber mellem to mænd", "Opløste partnerskaber mellem to kvinder")) %>%
  group_by(Antal,
           År,
           Type) %>% 
  tally() %>% 
  ggplot(aes(x = År,
             y = Antal,
             fill = Type)) + 
  geom_bar(position="dodge", stat="identity", width=3.5) +
  theme_minimal(base_size = 10) +
  scale_fill_hue(c = 35) +
  scale_y_continuous(breaks=seq(0,50000,2500))
```

#Skilsmisser og opløste partnerskaber
```{r}
df%>% 
  filter(Type %in% c("Skilsmisser og opløste partnerskaber i alt")) %>% 
  filter(År %in% c("1989", "1995", "2000", "2005", "2010", "2015", "2022")) %>% 
  tail(7) %>%
  ggplot( aes(x=År, y=Antal, group=Type)) +
    geom_line( color="#69b3a2") +
    geom_point(shape=21, color="black", fill="#69b3a2", size=3) +
    theme_ipsum() +
  ggtitle("Skilsmisser og opløste partnerskaber i alt")
```
#Skilsmisser og vielser
```{r}
df%>% 
  filter(År %in% c("1989", "1999", "2005", "2010", "2015", "2022")) %>% 
  filter(Type %in% c("Skilsmisser og opløste partnerskaber i alt", "Vielser og indgåede registrerede partnerskaber i alt")) %>%
  group_by(Antal,
           År,
           Type) %>% 
  tally() %>% 
  ggplot(aes(x = År,
             y = Antal,
             fill = Type)) + 
  geom_bar(position="dodge", stat="identity", width=3.5) +
  theme_minimal(base_size = 10) +
  scale_fill_hue(c = 35) +
  scale_y_continuous(breaks=seq(0,50000,2500))
```
#Vielser og registrerede partnerskaber
```{r}
df%>% 
  filter(År %in% c("1989", "1999", "2005", "2012", "2022")) %>% 
  filter(Type %in% c("Vielser mellem to mænd", "Vielser mellem to kvinder", "Indgåede registrerede partnerskaber mellem to mænd", "Indgåede registrerede partnerskaber mellem to kvinder")) %>%
  group_by(Antal,
           År,
           Type) %>% 
  tally() %>% 
  ggplot(aes(x = År,
             y = Antal,
             fill = Type)) + 
  geom_bar(position="dodge", stat="identity", width=3.5) +
  theme_minimal(base_size = 10) +
  scale_fill_hue(c = 35) +
  scale_y_continuous(breaks=seq(0,50000,300))
```
