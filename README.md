# Burger Bounty Decision Support System (DSS)

![16bb0a3ab8ea98cfe8906135767f7bf4](https://github.com/KanikaGaikwad/A-Decision-Support-System-for-Burger-Bounty-using-R/assets/138404863/5d29bc1d-3eb0-4569-9a16-f0ac70e37055)

## Project Overview

Developed a Decision Support System (DSS) using R Shiny for Burger Bounty, a gourmet meatless burger food truck. The goal was to optimize sales and operations by analyzing factors like weather, day of the week, prices, and location.

## Objectives
1. Assist in strategic decision-making for pricing and location selection.
Enhance food truck sales and operational efficiency.
2. The Burger Bounty Sales Dashboard is a data visualization tool developed to analyze aggregate monthly sales per burger and per town for a burger restaurant chain to gain insights into sales trends and performance metrics.
3. Regression Analysis for Burger Sales Prediction
4. Shiny App for Interactive Forecasting
   
## Key Features
- Data Input Interface: User-friendly Shiny app for entering daily sales data, weather conditions, event occurrences, and pricing.
- Data Management: Automatically updates and stores data in an Excel file.
- Sales Analysis: Aggregates data for insights into sales patterns.

## Technologies Used
- R: Data manipulation and analysis.
- R Shiny: Interactive user interface.
- Excel: Data storage and retrieval.

## Getting Started
1. Clone the Repository:
Clone the GitHub repository to your local machine to access the R script and dataset.

```bash
git clone https://github.com/KanikaGaikwad/A-Decision-Support-System-for-Burger-Bounty-using-R.git
```

2. Open in RStudio:
Open the R script (script.R) in RStudio.

3. Install Required Packages:
Make sure you have the required R packages installed by running the following commands in RStudio:
```r
install.packages("shiny")
install.packages("shinydashboard")
install.packages("openxlsx")
```
4. Run the Script:
Run the R script to load the necessary libraries, perform regression analysis, and set up the Shiny dashboard.

## Import Dataset
Before running the Shiny app, ensure that you have the Burger Bounty dataset available. You can import the dataset using the following R code:
```r
library(openxlsx)

# Load the dataset
BurgerBounty_Visits <- read.xlsx("path/to/your/dataset/BurgerBounty_Visits.xlsx", sheet = 1)
BurgerBounty_Prices <- read.xlsx("path/to/your/dataset/BurgerBounty_Prices.xlsx", sheet = 1)
BurgerBounty_Sales <- read.xlsx("path/to/your/dataset/BurgerBounty_Sales.xlsx", sheet = 1)
```
Replace "path/to/your/dataset/" with the actual path to your dataset files.
# Load the dataset
BurgerBounty_Visits <- read.xlsx("path/to/your/dataset/BurgerBounty_Visits.xlsx", sheet = 1)
BurgerBounty_Prices <- read.xlsx("path/to/your/dataset/BurgerBounty_Prices.xlsx", sheet = 1)
BurgerBounty_Sales <- read.xlsx("path/to/your/dataset/BurgerBounty_Sales.xlsx", sheet = 1)
Replace "path/to/your/dataset/" with the actual path to your dataset files.


## Dashboard Design:

The dashboard features a user-friendly interface with intuitive input controls and visually appealing pie chart outputs. Select inputs allow users to choose the month, aggregation method (by burger or town), and data type (sales or revenue). The layout is designed for easy navigation and quick interpretation of sales metrics.

## Regression Analysis for Burger Sales Prediction

### Libraries:
- openxlsx: reading Excel files
- lm: linear regression modeling
- Shiny
- shinydashboard

## Shiny App for Interactive Forecasting

### Features:

- User inputs for time, weather, events, and prices.
- Predictions for sales and revenue.
- Recommendations based on user inputs.

## Application Development

The application was developed using the Shiny and shinydashboard packages in R. Below is a detailed description of the code and its functionality.

### UI Component

The UI is designed using dashboardPage from the shinydashboard package. It includes:

- Header: Title of the dashboard.
- Sidebar: Inputs for general parameters (time, precipitation, temperature, weekend), event occurrences in different towns, and burger prices.
- Body: Displays the recommendations based on the input parameters.

### Server Component

The server component handles the logic for predicting sales and calculating revenues. It uses the pre-built regression models to make predictions based on the input parameters and generates recommendations accordingly.
