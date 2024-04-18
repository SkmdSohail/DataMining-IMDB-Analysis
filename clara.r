# Load necessary libraries
library(readr) # For data import
library(cluster) # For CLARA algorithm

# Read the data
data <- read.csv("C:/Users/sohail/Desktop/data.csv")

# Perform any necessary data cleaning or preprocessing here
# For example, converting character variables to factors, removing unnecessary columns, etc.

# Select numerical columns for clustering
num_cols <- select(data, -c("date", "street", "city", "statezip", "country"))

# Perform CLARA clustering
clara_model <- clara(num_cols, k = 3, samples = 5) # Change k to the desired number of clusters and samples as needed

# Add cluster labels to the original dataset
data$cluster <- clara_model$clustering

# View the clustered data
print(data)

# Plot the clusters (Example plot)
plot(num_cols[, c(1,2)], col = clara_model$clustering, pch = 20, main = "CLARA Clustering", xlab = "X Variable", ylab = "Y Variable")
legend("topright", legend = unique(clara_model$clustering), col = 1:length(unique(clara_model$clustering)), pch = 20, title = "Cluster")
