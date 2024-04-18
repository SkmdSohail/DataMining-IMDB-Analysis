# Load necessary libraries
library(readr) # For data import
library(dplyr) # For data manipulation
library(tidyr) # For data cleaning
library(factoextra) # For clustering visualization

# Read the data
data <- read.csv("C:/Users/sohail/Desktop/data.csv")

# Perform any necessary data cleaning or preprocessing here
# For example, converting character variables to factors, removing unnecessary columns, etc.

# Select numerical columns for clustering
num_cols <- select(data, -c("date", "street", "city", "statezip", "country"))

# Normalize the data
normalized_data <- scale(num_cols)

# Determine the optimal number of clusters using elbow method
wss <- (nrow(normalized_data) - 1) * sum(apply(normalized_data, 2, var))
for (i in 1:10) {
  wss[i] <- sum(kmeans(normalized_data, centers = i)$withinss)
}
plot(1:10, wss, type = "b", xlab = "Number of Clusters", ylab = "Within groups sum of squares")

# From the plot, determine the optimal number of clusters (elbow point) and set k accordingly
k <- # Set the optimal number of clusters
  
  # Perform k-means clustering
  kmeans_model <- kmeans(normalized_data, centers = k)

# Visualize the clusters
fviz_cluster(kmeans_model, data = normalized_data)

# Add cluster labels to the original dataset
data$cluster <- kmeans_model$cluster

# View the clustered data
print(data)
