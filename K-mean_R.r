#Clustering Method
#K-Means

rm(list = ls())
#importing dataset
dataset = read.csv("Mall_Customers.csv")
X = dataset[4:5]

#Using elbow method to find optimal value of k
set.seed(123)
wcss = vector()
for (i in 1:10)
  wcss[i] = sum(kmeans(X, i)$withinss)
plot(1:10, wcss, type = "b" , main = "Eblow method",  xlab = "Number of Clusbers",
     ylab = "WCSS Score")

#Hence Optimized number of Cluster is 5

#Applying k-means to the mall dataset
set.seed(123)
kmeans = kmeans(X, 5 , iter.max = 300, nstart = 10)

#visualizing the clusters
library(cluster)
clusplot(x = X, 
         clus =  kmeans$cluster,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 5,
         plotchar = TRUE,
         span = TRUE,
         main = "Clusters",
         xlab = "Annual Income",
         ylab = "Spending score")
         