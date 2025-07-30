# 🦷 DPD Age Estimation Analysis in R

This project investigates how dental pulp-to-dentine (DPD) ratios relate to chronological age and whether this relationship can be modeled to estimate age. It uses statistical modeling and visualization techniques in R to explore the strength of the relationship and the impact of variables like sex and molar count.

---

## 🎯 Problem

Can the **DPD ratio** be used to accurately **estimate a person's age**?  
What roles do **sex** and **molar count** play in improving prediction accuracy?

---

## 🧠 Approach

We used R to explore the dataset and build regression models:

- 📊 Exploratory data analysis
- 📈 Linear modelling:
  - `age ~ dpd.ratio`
  - `age ~ dpd.ratio + sex`
  - `age ~ dpd.ratio * sex`
  - `age ~ poly(dpd.ratio, 2)`
  - `age ~ dpd.ratio + sex + molar`
- 📏 Model performance compared via AIC, adjusted R², and F-statistics
- 📉 Residual diagnostics

---

## 📊 Key Findings

- **DPD ratio is a strong predictor of age** (p < 0.001)
- Simple linear model `age ~ dpd.ratio` performs best (lowest AIC: 183.5)
- Adding **sex** and **molar count** or interaction terms offers no significant improvement
- Diagnostic plots show good model fit

---

## ✅ Recommendation

Use a **simple linear model** (`age ~ dpd.ratio`) for age prediction.  
Future improvements may involve:
- Larger sample size
- Additional dental or skeletal biomarkers
- External validation datasets

---

