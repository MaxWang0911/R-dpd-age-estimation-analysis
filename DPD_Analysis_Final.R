
# Install and load the dataset
options(repos = c(CRAN = "https://cran.rstudio.com/"))
install.packages('dafs')
library(dafs)
library(ggplot2)

data(dpd.df)

# Explore the dataset
View(dpd.df)
summary(dpd.df)
dim(dpd.df)
sum(is.na(dpd.df))
colSums(is.na(dpd.df))

# Q1. Gender count
summary(dpd.df$sex)
print(paste("Male individuals are there in this study is:", table(dpd.df$sex)['M']))
print(paste("Female individuals are there in this study is:", table(dpd.df$sex)['F']))

# Q2. Mean and median age for female
Fe_data <- subset(dpd.df, sex == "F")
Ma_data <- subset(dpd.df, sex == "M")
mean_Fe_age <- mean(Fe_data$age, na.rm = TRUE)
median_Fe_age <- median(Fe_data$age, na.rm = TRUE)
print(paste("The mean and median age of the female individuals are:", mean_Fe_age, "and", median_Fe_age))

# Q3. Age range
print(paste("The female age range is:", paste(range(Fe_data$age), collapse = " - ")))
print(paste("The male age range is:", paste(range(Ma_data$age), collapse = " - ")))

# Q4. Max DPD ratio
print(paste("The maximum DPD ratio for the male individuals is:", max(Ma_data$dpd.ratio)))
print(paste("The maximum DPD ratio for the female individuals is:", max(Fe_data$dpd.ratio)))

# Q5. Boxplot for real.error by sex
ggplot(dpd.df, aes(x = sex, y = real.error, fill = sex)) +
  geom_boxplot() +
  labs(title = "Boxplot of Real Errors by Gender", x = "Gender", y = "Real Error") +
  theme_minimal()

boxplot(real.error ~ sex, data = dpd.df,
        main = "Boxplot of Real Errors by Gender",
        xlab = "Gender", ylab = "Real Error",
        col = c("lightblue", "pink"))

# Q6. IQR
IQR_Fe <- IQR(Fe_data$real.error)
IQR_Ma <- IQR(Ma_data$real.error)
print(paste("Interquartile Range for Female Individuals:", IQR_Fe))
print(paste("Interquartile Range for Male Individuals:", IQR_Ma))

# Q7. Bar plot of mean estimated age by gender
mean_est_age <- aggregate(est.age ~ sex, data = dpd.df, FUN = mean)
barplot(mean_est_age$est.age,
        names.arg = mean_est_age$sex,
        col = c("lightgreen", "yellow"),
        main = "Mean Estimated Ages by Gender",
        xlab = "Gender", ylab = "Mean Estimated Age",
        width = 0.5, space = 0.5, ylim = c(0, 60))

# Q8. Histograms with density + mean line
mean_Ma_re.er <- mean(Ma_data$real.error)
mean_Fe_re.er <- mean(Fe_data$real.error)

# Male
ggplot(Ma_data, aes(x = real.error)) +
  geom_histogram(aes(y = after_stat(density)), bins = 5, fill = "lightblue", color = "black", alpha = 0.7) +
  geom_density(color = "red", linewidth = 1) +
  geom_vline(aes(xintercept = mean_Ma_re.er), color = "blue", linetype = "dashed", linewidth = 1) +
  labs(title = "Histogram of Actual Errors for Male Individuals", x = "Actual Error", y = "Density") +
  theme_minimal()

# Female
ggplot(Fe_data, aes(x = real.error)) +
  geom_histogram(aes(y = after_stat(density)), bins = 5, fill = "pink", color = "black", alpha = 0.7) +
  geom_density(color = "red", linewidth = 1) +
  geom_vline(aes(xintercept = mean_Fe_re.er), color = "blue", linetype = "dashed", linewidth = 1) +
  labs(title = "Histogram of Actual Errors for Female Individuals", x = "Actual Error", y = "Density") +
  theme_minimal()
