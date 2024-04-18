# Load necessary libraries
library(cluster) # For k-medoids algorithm
library(ggplot2) # For plotting

# Read the data (replace "your_dataset_path.csv" with the actual path to your dataset)
data <- read.csv("data.csv", sep = "\t")

# Perform any necessary data cleaning or preprocessing here
# For example, converting character variables to factors, removing unnecessary columns, etc.

# Select numerical columns for clustering
num_cols <- data[, !(names(data) %in% c("date", "street", "city", "statezip", "country"))]

# Perform k-medoids clustering
k <- 3  # Number of clusters
kmedoids_model <- pam(num_cols, k = k)

# Plot the clusters
ggplot(data, aes(x = num_cols$X1, y = num_cols$X2, color = factor(kmedoids_model$clustering))) +
  geom_point() +
  geom_point(data = data.frame(num_cols[kmedoids_model$medoids, ]), aes(x = X1, y = X2), color = "red", shape = 3, size = 3) +
  labs(title = "K-Medoids Clustering", x = "Feature 1", y = "Feature 2") +
  scale_color_discrete(name = "Cluster") +
  theme_minimal()
