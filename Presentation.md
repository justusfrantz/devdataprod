Coursera Developing Data Products: Course Project
========================================================
author: NG PENG HONG
date: 28 January 2016
transition: rotate
width: 1600
height: 900

Introduction
========================================================
type: sub-section

This presentation is created as part of the requirement for the Coursera Developing Data Products Course. Objectives of the assignment are to ensure sound understanding of the following concepts

- **shiny** to build data product application
- **R-Presentation or slidify** to create data product related presentations

The Application
========================================================
type: sub-section
An  application based on the **mtcars** dataset from **[R]** has been developed and deployed at 

https://phng.shinyapps.io/devdataprod/

The app allows to perform interactive data analysis from a set of user specified criterias

- Selling price of gasoline (USD/gallon).
- Limit of money to be spent on gasoline.
- Desired travel distance in miles.

Additional Features of the App
========================================================
type: sub-section
User will be able to further refine the results by choosing the desired car charateristics as below:
- Number of Cylinders
- Displacement
- Horsepower
- Transmission

The source codes for ui.R and server.R files are also available on the [GitHub repo] (https://github.com/justusfrantz/devdataprod)

The Data
========================================================
type: sub-section

The data used in the app comes from the Motor Trend Car Road Tests **(mtcars)** dataset. The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models). A brief look into the the data is shown below:


```r
head(mtcars)
```

```
                   mpg cyl disp  hp drat    wt  qsec vs am gear carb
Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
```
