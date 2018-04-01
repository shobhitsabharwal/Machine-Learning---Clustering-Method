#Clustering Method
#Hierarchial clustering 

rm(list = ls())
#importing dataset
dataset = read.csv("Mall_Customers.csv")
X = dataset[4:5]

#Finding optimum numbers of clusters using Hierarchial clustering
dendrogram = hclust(dist(X, method = 'euclidean'), method = 'ward.D')
plot(dendrogram,
     main = paste('Dendrogram'),
     xlab = "Customers",
     ylab = "Euclidean distance")

#Insight
#Optimum numbers of clusters is 5

#fitting HC to dataset
set.seed(29)
hc = hclust(dist(X, method = 'euclidean'), method = 'ward.D')
y_hc = cutree(hc, 5)


#visualizing the clusters
library(cluster)
clusplot(x = X, 
         clus =  y_hc,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 5,
         plotchar = TRUE,
         span = TRUE,
         main = paste("Clusters"),
         xlab = "Annual Income",
         ylab = "Spending score")

# a plot without scaling
plot(x=X[,1], y=X[,2], col=y_hc, pch=19, 
     xlim=c(from=min(X[,1]), to=max(X[,1]+30)),
     xlab="Annual Income", ylab="Spending Score",
     main = "Clusters")
clusters=c("Sensible", "Careless", "Standard" , "Target", "Careful")
legend('bottomright', legend=clusters, col=1:5, pch=19, horiz=F)
