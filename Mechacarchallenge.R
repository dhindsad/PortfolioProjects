
> installed.packages()
> library(dplyr)
> demo_table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
> lm(mpg~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance+ AWD,data=MechaCar_mpg) #generate multiple linear regression model
> summary(lm(mpg~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance+ AWD,data=MechaCar_mpg))



> demo_table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

> summarize_PSI <- Suspension_Coil %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI), SD=sd(PSI)) #create summary table with multiple columns
> View(summarize_demo)

> lot_summary<- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI), SD=sd(PSI),.groups="keep") #create summary table with multiple columns

> t.test(log10(Suspension_Coil$PSI)) #compare sample versus population means
> t.test(subset(Suspension_Coil, Manufacturing_Lot = 'Lot1')$PSI) 
> t.test(subset(Suspension_Coil, Manufacturing_Lot = 'Lot2')$PSI) 
> t.test(subset(Suspension_Coil, Manufacturing_Lot = 'Lot3')$PSI) 




# MechaCar_Statistical_Analysis


## Linear Regression to Predict MPG
  - Vehicle weight, Spoiler Angle and AWD are the variables providing non-random amount of variance.
  -No, the slope of our linear regression is not considered to be Zero. From our linear regression model, the r-squared value is 0.71, which means that roughly 70% of all predictions will be correct when using this linear model. The p-value is 5.35 x 10-11, which is much smaller than our assumed significance level of 0.05%. Hence, we can state that there is sufficient evidence to reject our null hypothesis, which means that the slope of our linear model is not zero.
 - According to the calculated r squared value, the linear model has 70% chance of predicting the correct outcome, i.e, mpg of MechaCar Prototypes effectively. There might be other unknown variables involved in the outcome.


## Summary Statistics on Suspension Coils
![Screen Shot 2020-10-04 at 3 43 01 PM](https://user-images.githubusercontent.com/67085043/95027261-28266300-0665-11eb-9152-3264ff353fb9.png)
![Screen Shot 2020-10-04 at 3 43 07 PM](https://user-images.githubusercontent.com/67085043/95027258-265c9f80-0665-11eb-8fe2-33ffb860025a.png)

The current manufacturing data meet does not design specification for all manufacturing lots in total and each lot individually as the variance is for lot 3 is way more than lot 1 and 2. 

## T-Tests on Suspension Coils
![Screen Shot 2020-10-04 at 8 54 35 PM](https://user-images.githubusercontent.com/67085043/95031297-3c795880-0683-11eb-907c-4b0ace1d6216.png)
![Screen Shot 2020-10-04 at 8 55 15 PM](https://user-images.githubusercontent.com/67085043/95031299-3d11ef00-0683-11eb-86dd-b460933ed364.png)
![Screen Shot 2020-10-04 at 8 55 26 PM](https://user-images.githubusercontent.com/67085043/95031300-3daa8580-0683-11eb-9e90-816c3d134c92.png)
![Screen Shot 2020-10-04 at 8 55 53 PM](https://user-images.githubusercontent.com/67085043/95031301-3daa8580-0683-11eb-9c67-70e2489bb7be.png)

The p value for all lots in suspension Coil is 2.26 X 10^-16
The p value for each manufacturing lot in suspension Coil is 0.5117




## Study Design: MechaCar vs Competition
  To quantify how the MechaCar performs against the competition, I would test the manufacturing cost, horsepower, fuel efficiency, and comfort. 
  Null Hypothesis: MechaCar performs better than the competition in multiple factors.
  I would choose Independent T-test to test the hypothesis because it would allow me to compare the same variables from different samples.
  We will need the data for variables such as the cost, fuel efficiency, horsepower from random samples and test the values for p-value and r squared to either reject or fail to reject the hypothesis.
  
  
