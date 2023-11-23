
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
