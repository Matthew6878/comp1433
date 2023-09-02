# Load the iris dataset
data(iris)

# Extract the petal length and petal width columns
petal_data <- iris[, c("Petal.Length", "Petal.Width")]

# Initialize the cluster centroids randomly
set.seed(123)
k <- 3
centroids <- petal_data[sample(nrow(petal_data), k), ]

# Create a function to calculate the Euclidean distance between two points
euclidean_distance <- function(x1, x2, y1, y2) {
  sqrt((x1 - x2)^2 + (y1 - y2)^2)
}

# Perform the K-means clustering algorithm for 100 iterations
num_iterations <- 100
distance_list <- matrix(0, nrow = num_iterations, ncol = k)

cluster_assignments <- integer(nrow(petal_data))
for (i in 1:num_iterations) {
  # Assign each data point to the nearest cluster centroid
  for (j in 1:nrow(petal_data)) {
    min_distance <- 10000000
    for (c in 1:k) {
      distance <- euclidean_distance(petal_data[j, 1], centroids[c, 1], petal_data[j, 2], centroids[c, 2])
      if (distance < min_distance) {
        min_distance <- distance
        cluster_assignments[j] <- c
      }
    }
  }
  
  # Calculate the mean distance of data points to their respective cluster centroid
  for (j in 1:k) {
    distances <- numeric()
    for (r in 1:nrow(petal_data)) {
      if (cluster_assignments[r] == j) {
        distances <- c(distances, euclidean_distance(petal_data[r, 1], centroids[j, 1], petal_data[r, 2], centroids[j, 2]))
      }
    }
    distance_list[i, j] <- mean(distances)
  }
  
  # Update the cluster centroids
  for (j in 1:k) {
    cluster_members <- which(cluster_assignments == j)
    if (length(cluster_members) > 0) {
      centroids[j, ] <- colMeans(petal_data[cluster_members, ])
    }
  }
}

# Visualize the results
library(ggplot2)
iris_df <- data.frame(iris)
# Create a new column in the data frame called "cluster"
iris_df$cluster <- ifelse(cluster_assignments == 1, "level1",
                          ifelse(cluster_assignments == 2, "level2", "level3"))

# Scatter plot of petal length vs petal width with custom colors
ggplot(iris_df, aes(x = Petal.Length, y = Petal.Width, color = cluster)) +
  geom_point() +
  labs(title = "K-means Clustering of Iris Dataset")

# Line plot of mean distance to cluster centroids at each iteration
iteration_vec <- numeric()
for (i in 1:num_iterations) {
  iteration_vec <- c(iteration_vec, rep(i, k))
}

distance_df <- data.frame(iteration = rep(1:num_iterations, k), distance = c(distance_list))
distance_df$cluster <- rep(1:k, each = num_iterations)
ggplot(distance_df, aes(x = iteration, y = distance, color = cluster)) +
  geom_line() +
  labs(title = "Mean Distance to Cluster Centroids")
