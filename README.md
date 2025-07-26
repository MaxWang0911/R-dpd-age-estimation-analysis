# DPD Age Estimation Analysis in R

This project is a statistical and visual analysis of a dental dataset (`dpd.df`) from the **dafs** package in R. The analysis focuses on the estimation of age based on DPD ratios and explores differences across gender. The project was completed by **Zheng Wang** as part of academic coursework in 2024.

## 📊 Objective

To perform descriptive and graphical analysis of DPD ratio and age estimation accuracy by gender using R.

## 📁 Dataset

- **Source**: `dpd.df` from the `dafs` package
- **Variables include**:
  - `age`: true age
  - `sex`: gender (M/F)
  - `dpd.ratio`: dental measurement ratio
  - `est.age`: estimated age
  - `real.error`: difference between estimated and actual age

## 🧪 Analysis Tasks

- Missing value checks and summary statistics
- Gender counts and age distribution
- Max DPD ratio by gender
- Interquartile range of real errors
- Boxplots, histograms, bar plots, and density plots
- Gender-wise comparison of estimation errors

## 🖥️ Tools Used

- `R`
- Packages: `ggplot2`, `dafs`

## 📈 Key Visuals

- Boxplots of real error by gender
- Histograms with density lines for male and female real error distributions
- Bar plot of mean estimated age by gender

## 📌 Author

**Zheng Wang**  
Email: zheng.wang-15@student.uts.edu.au  
Date: 2024-09-12  
R Version: 4.3.3

---

## ▶️ How to Run

```r
install.packages("dafs")
library(dafs)
library(ggplot2)

# Load dataset
data(dpd.df)

# Then run the analysis from the provided script:
source("Zheng_Wang_DPD_Analysis_Final.R")
