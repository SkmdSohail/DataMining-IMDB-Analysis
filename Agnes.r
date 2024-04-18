# Load necessary libraries
library(readr) # For data import
library(cluster) # For agnes algorithm

# Read the data
data <- read_delim("data.csv", delim = "\t")

# Perform any necessary data cleaning or preprocessing here
# For example, converting character variables to factors, removing unnecessary columns, etc.

# Select numerical columns for clustering
num_cols <- select(data, -c("date", "street", "city", "statezip", "country"))

# Perform agglomerative hierarchical clustering (agnes)
agnes_model <- agnes(num_cols, method = "ward") # You can change the method if needed

# Plot the dendrogram
plot(agnes_model, main = "Agglomerative Hierarchical Clustering Dendrogram")

# Add cluster labels to the original dataset
data$cluster <- cutree(agnes_model, k = 3) # Change k to the desired number of clusters

# View the clustered data
print(data)
