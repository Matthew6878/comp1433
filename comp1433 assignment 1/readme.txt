

Question 1:

This R code performs K-means clustering on the iris dataset, which contains measurements of the sepal length, sepal width, petal length, and petal width of 150 iris flowers belonging to three different species. Specifically, the code performs clustering on the petal length and petal width columns of the dataset.

Here's a step-by-step breakdown of what the code does:

1. The iris dataset is loaded using the data() function.
2. The code extracts the petal length and petal width columns from the dataset and stores them in a new data frame called petal_data.
3. The code sets the random seed to 123 and initializes the cluster centroids randomly by selecting k (which is set to 3) points from the petal_data data frame.
4. A function called euclidean_distance() is defined to calculate the Euclidean distance between two points in two-dimensional space.
5. The code performs the K-means clustering algorithm for 100 iterations. For each iteration, the code does the following:

	Assigns each data point to the nearest cluster centroid using the 		euclidean_distance() function.

	Calculates the mean distance of data points to their respective cluster 	centroid.

	Updates the cluster centroids by computing the mean of the data points 		assigned to each cluster.

6. The results of the clustering are visualized using the ggplot2 library. The code first creates a new column in the iris data frame called "cluster" that assigns each data point to one of three levels based on its cluster assignment. The code then creates a scatter plot of petal length vs petal width with custom colors based on the "cluster" column. Finally, the code creates a line plot of the mean distance to cluster centroids at each iteration.

Question 2:

Q2a:

First, the code loads the data from the file "employees.csv" into a data frame called "employees" using the read.csv() function.

Next, the code creates a new column in the "employees" data frame called "Salary Per Year" using the following formula: employees$Salary_Per_Year <- employees$Monthly_Salary * 12. This calculates the salary per year for each employee by multiplying their monthly salary by 12.

Finally, the code prints the resulting data frame using the print() function.

Q2b:

The code calculates the average salary per year for male and female employees separately using the mean() function. The function is applied to the "Salary_Per_Year" column of the "employees" data frame, but only for those rows where the "Gender" column is equal to "Male" or "Female".

The resulting averages are then rounded to two decimal places using the round() function.

Since I have learned C language, I find that the sprintf() in R is similar to printf() in C. So, the code then uses the sprintf() function to print the results on the screen.

Q2c:

The code loads the ggplot2 package using the library() function.

Next, the code creates a histogram of the "Years_of_Experience" column of the "employees" data frame using the geom_histogram() function. The binwidth argument sets the width of each bin in the histogram.

The code then adds a title, x-axis label, and y-axis label to the plot using the ggtitle(), xlab(), and ylab() functions, respectively.

Q2d:

The code loads the ggplot2 package using the library() function.

Next, the code creates a scatter plot of the "Years_of_Experience" and "Monthly_Salary" columns of the "employees" data frame using the geom_point() function. The color argument is set to "Gender" so that the points are colored by gender.

The code then adds a title, x-axis label, and y-axis label to the plot using the ggtitle(), xlab(), and ylab() functions, respectively.


Question 3:

For non coding question (Q3a, Q3c and part of Q3d):

The derive of PMF , mean and variance of negative binomial distribution is too long, so I write them on papers and save in the non_coding_question 3acd.pdf please check.

Q3a:

I derive the PMF of negative binomial distribution from binomial distribution and geometric distribution.

Q3b:

This code simulates the negative binomial distribution, creates the theoretical and simulated probability mass functions, and plots them on the same graph for comparison.

First, the code sets the seed for reproducibility using the set.seed() function.

Next, the code simulates the negative binomial distribution using the rnbinom() function. The n argument sets the number of observations to generate, which is 10000 in this case. The size argument sets the number of failures until the 20th success, which is 20 in this case. The prob argument sets the probability of success, which is 0.5 in this case.

The code then creates the theoretical probability mass function using the dnbinom() function. The x argument sets the values at which to evaluate the probability mass function, which is a sequence of integers from 0 to 100 in this case. The size and prob arguments are set to the same values as in the rnbinom() function.

The code then creates the simulated probability mass function using a for loop. For each value of x, the code calculates the proportion of simulated data that equals that value, and stores it in the pmf_simulated vector.

Finally, the code creates a plot using the plot() function. The x and pmf_theoretical vectors are plotted with a blue line and blue points, respectively, using the lines() and points() functions. The pmf_simulated vector is plotted with a red line and red points, respectively, using the same functions. The x-axis label is set to "Number of Failures until 20th Success", and the y-axis label is set to "Probability".

Q3d: 

This code simulates and calculates the theoretical probabilities of Montgomery the cat surviving for another 104 weeks (2 years) if he has 1 or 9 lives left, respectively.

First, the code sets the seed to 42 and simulates 10,000 negative binomial samples for each scenario using the rnbinom function. The simulated data is stored in nb_sim_1_data and nb_sim_9_data.

Next, for each scenario, the code calculates the simulated probability that Montgomery will survive for another 104 weeks. For the scenario where Montgomery has 1 life left, the code uses a for loop to iterate over the simulated data and checks how many values are greater than or equal to 104. The number of successful trials is then divided by the total number of trials to obtain the simulated probability of survival. For the scenario where Montgomery has 9 lives left, the code uses the sum function to count how many values in the simulated data are greater than or equal to 104. The number of successful trials is then divided by the total number of trials to obtain the simulated probability of survival.

After calculating the simulated probabilities, the code calculates the theoretical probabilities using a for loop to iterate over the possible number of successes. The choose function is used to calculate the number of ways to choose i successes out of i+9-1 trials for the scenario where Montgomery has 9 lives left, and i+1-1 trials for the scenario where Montgomery has 1 life left. The probability of i successes is then calculated using the binomial probability formula and added to prob_1 or prob_9. The theoretical probability of survival is then obtained by subtracting prob_1 or prob_9 from 1.

Finally, the code uses the sprintf function to print out the simulated and theoretical probabilities for each scenario.


