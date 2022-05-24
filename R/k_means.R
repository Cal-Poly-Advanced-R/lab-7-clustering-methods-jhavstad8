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
    pts <- dat[sample(nrow(dat),k),]
    x <- dat[,1]
    y <- dat[,2]
    dist <- data.frame(matrix(ncol=k,nrow=length(x)))
    cluster <- c()
    for(i in 1:k){
        for(i in 1:length(x)){
        dist[i,k] <- sqrt((pts[k,1] - x[i])^2 + (pts[k,2] - y[i])^2)
        }
    }
    for(row in 1:nrow(dist)){
        shortest <- which.min(dist[i,])
        cluster <- c(cluster,shortest)
    }
    dat <- cbind(dat,cluster)
    mean_x <- tapply(dat[,1], dat[,3],mean)
    mean_y <- tapply(dat[,2], dat[,3], mean)

    # repeat steps
    for(step in 1:100){
    for(col in 1:k){
        for(i in 1:length(x)){
            dist[i,k] <- sqrt((mean_x[k] - x[i])^2 + (mean_y[k] - y[i])^2)
        }
    }
    clust <- c()
    for(row in 1:nrow(dist)){
        shortest <- which.min(dist[row,])
        clust <- c(clust,shortest)
    }
    dat[,3] <- clust
    mean_x <- tapply(dat[,1], dat[,3],mean)
    mean_y <- tapply(dat[,2], dat[,3], mean)
    }
    results <- cluster
    return(results)
}

