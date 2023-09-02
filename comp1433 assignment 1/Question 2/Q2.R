#Q2a:
# Load the data from the file "employees.csv" into a data frame called "employees"
employees <- read.csv("employees.csv")

# Create a new column called "Salary Per Year" that contains the calculated salary per year for each employee
employees$Salary_Per_Year <- employees$Monthly_Salary * 12

# Print the resulting data frame
print(employees)

# Q2b:

# Calculate the average salary per year for male and female employees separately
male_salary_avg <- mean(employees$Salary_Per_Year[employees$Gender == "Male"])
female_salary_avg <- mean(employees$Salary_Per_Year[employees$Gender == "Female"])

male_salary_avg<- round(male_salary_avg, digit=2)
female_salary_avg<- round(female_salary_avg, digit=2)

# Print the results on the screen
sprintf("The average salary per year for male employees is %f", male_salary_avg)
sprintf("The average salary per year for female employees is %f", female_salary_avg)

#Q2c:

# Load the ggplot2 package
library(ggplot2)

# Create a histogram of years of experience
ggplot(employees) + 
  geom_histogram(mapping=aes(x = Years_of_Experience), binwidth = 0.5) +
  ggtitle("Distribution of Years of Experience") + xlab("Years of Experience") + ylab("Frequency")
  

#Q2d:
# Load the ggplot2 package
library(ggplot2)

# Create a scatter plot of years of experience and monthly salary, colored by gender
ggplot(data = employees) +
  geom_point(mapping = aes(x = Years_of_Experience, y = Monthly_Salary, color = Gender)) +
  ggtitle("Relationship Between Years of Experience and Monthly Salary")+xlab("Years of Experience")+ylab("Monthly Salary")
  
  
