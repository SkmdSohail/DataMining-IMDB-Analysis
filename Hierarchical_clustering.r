# Load necessary libraries
library(readr) # For data import
library(dplyr) # For data manipulation
library(tidyr) # For data cleaning

# Read the data
data <- read.csv("C:/Users/sohail/Desktop/data.csv")

# Perform any necessary data cleaning or preprocessing here
# For example, converting character variables to factors, removing unnecessary columns, etc.

# Select numerical columns for clustering
num_cols <- select(data, -c("date", "street", "city", "statezip", "country"))

# Compute distance matrix
dist_matrix <- dist(num_cols)

# Perform hierarchical clustering
hierarchical_model <- hclust(dist_matrix, method = "ward.D")

# Visualize the dendrogram
plot(hierarchical_model, main = "Hierarchical Clustering Dendrogram", xlab = "", sub = "")

# Cut the dendrogram to obtain clusters
clusters <- cutree(hierarchical_model, k = 3) # Change k to the desired number of clusters

# Add cluster labels to the original dataset
data$cluster <- clusters

# View the clustered data
print(data)
