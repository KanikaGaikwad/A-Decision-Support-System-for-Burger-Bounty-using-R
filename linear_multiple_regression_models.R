# 1. Data Loading and Preparation
library(openxlsx)

path <- "C:/Users/f1/BurgerBounty.xlsx"
BurgerBounty_Visits <- read.xlsx(path, sheet = "Visits", detectDates = TRUE)
BurgerBounty_Prices <- read.xlsx(path, sheet = "Prices", detectDates = TRUE)
BurgerBounty_Sales <- read.xlsx(path, sheet = "Sales", detectDates = TRUE)
attach(BurgerBounty_Visits)
attach(BurgerBounty_Prices)
attach(BurgerBounty_Sales)

# 2. Building Regression Models:
## 1. Bounty Hunter Burger
# Regression Model for Bounty Hunter
regBH <- lm(`Bounty Hunter` ~ BH.Prices + Town + Time + Precipitation + Temperature + Event + Weekend, data = BurgerBounty_Sales)
summary(regBH)

# Prediction Scenario
df_bh <- data.frame(
  BH.Prices = 9,
  Town = "Downtown Hartford",
  Time = 2,
  Precipitation = 0.20,
  Temperature = 70,
  Event = "Yes",
  Weekend = "No"
)

# Predicted Sales and Revenue
predicted_bh <- predict(regBH, newdata = df_bh)
predicted_revenue_bh <- predicted_bh * df_bh$BH.Prices

print(predicted_bh)  # Display predicted sales
print(predicted_revenue_bh)  # Display predicted revenue

## 2. Classic Cheeseburger
regCC <- lm(`Classic Cheeseburger` ~ CC.Prices + Town + Time + Precipitation + Temperature + Event + Weekend, data = BurgerBounty_Sales)
summary(regCC)

## 3. Spicy Mutiny
# Regression Model for Spicy Mutiny
regSM <- lm(`Spicy Mutiny` ~ SM.Prices + Town + Time + Precipitation + Temperature + Event + Weekend, data = BurgerBounty_Sales)
summary(regSM)

## 4. Nature Bounty
# Regression Model for Nature Bounty
regNB <- lm(`Nature Bounty` ~ NB.Prices + Town + Time + Precipitation + Temperature + Event + Weekend, data = BurgerBounty_Sales)
summary(regNB)

## 5. BEC
regBEC <- lm(`BEC` ~ BEC.Prices + Town + Time + Precipitation + Temperature + Event + Weekend, data = BurgerBounty_Sales)
summary(regBEC)

## 6. Double Veggie
regDV <- lm(`Double Veggie` ~ DV.Prices + Town + Time + Precipitation + Temperature + Event + Weekend, data = BurgerBounty_Sales)
summary(regDV)
