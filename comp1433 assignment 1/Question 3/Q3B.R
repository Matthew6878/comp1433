# Set the seed for reproducibility
set.seed(42)

# Simulate the negative binomial distribution
simulated_data <- rnbinom(n = 10000, size = 20, prob = 0.5)

# Create the theoretical probability mass function
x <- 0:100
pmf_theoretical <- dnbinom(x, size = 20, prob = 0.5)

# Create the simulated probability mass function
pmf_simulated <- rep(0, length(x))
for (i in 1:length(x)) {
  pmf_simulated[i] <- sum(simulated_data == x[i]) / length(simulated_data)
}

plot(x, pmf_theoretical , xlab = "Number of Failures until 20th Success", ylab = "Probability")
lines(x, pmf_simulated, col = "red", lwd = 2)
points(x, pmf_simulated, col = "red", pch = 20)
lines(x,pmf_theoretical, col = "blue", lwd = 2)
points(x, pmf_theoretical, col = "blue", pch = 20)
