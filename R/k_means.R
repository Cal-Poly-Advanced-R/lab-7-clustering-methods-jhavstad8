#' Implements a basic k-means algorithm
#'
#' @param dat A data frame
#' @param k The number of observations to use as starting points
#' @param pca An option if you want to perform PCA before doing the k_means clustering
#'
#' @return A list with the cluster assignments and total sum of squares
#'
#' @import dplyr
#'
#' @export



k_means <- function(dat,k,pca=FALSE){
    # sample observations from data set to be starting points
    pts <- dat[sample(nrow(dat),k),]

    # turn columns in dataset into x and y vectors
    x <- dat[,1]
    y <- dat[,2]

    # create empty data frame for our distances
    dist <- data.frame(matrix(ncol=k,nrow=length(x)))

    # find distances between each point in our data set and each sample observation
    cluster <- c()
    for(clust in 1:k){
        for(i in 1:length(x)){
        dist[i,clust] <- sqrt((pts[clust,1] - x[i])^2 + (pts[clust,2] - y[i])^2)
        }
    }
    # find which starting point each observation is closest to
    for(row in 1:nrow(dist)){
        shortest <- which.min(dist[i,])
        cluster <- c(cluster,shortest)
    }
    # bind cluster vector to dataset, showing which cluster each observation is in
    dat <- cbind(dat,cluster)

    # find mean x and y for each cluster, those are new starting points
    mean_x <- tapply(dat[,1], dat[,3],mean)
    mean_y <- tapply(dat[,2], dat[,3], mean)

    # repeat steps
    for(step in 1:50){
    for(clust in 1:k){
        for(i in 1:length(x)){
            dist[i,clust] <- sqrt((mean_x[clust] - x[i])^2 + (mean_y[clust] - y[i])^2)
        }
    }
    cluster <- c()
    for(row in 1:nrow(dist)){
        shortest <- which.min(dist[row,])
        cluster <- c(clusteer,shortest)
    }
    dat[,3] <- cluster
    mean_x <- tapply(dat[,1], dat[,3],mean)
    mean_y <- tapply(dat[,2], dat[,3], mean)
    }
    results <- cluster
    return(results)
}

