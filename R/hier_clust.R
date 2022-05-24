#' Implements agglomerative hierarchical clustering
#'
#' @param dat A data frame
#' @param k The number of clusters you want
#' @return A data frame with the cluster assignments
#'
#' @import dplyr
#'
#' @export

hier_clust <- function(dat,k){
    dat[,3] <- 1
    for(clust in 1:k){
        r1 <- c()
        r2 <- c()
        distance <- c()
        for(row in 1:nrow(dat)){
            set_x <- dat[row,1]
            set_y <- dat[row,2]
            for(obs in (row+1):nrow(dat)){
                dist <- sqrt((set_x - dat[obs,1])^2 + (set_y - dat[obs,2])^2)
                r1 <- c(r1, row)
                r2 <- c(r2, obs)
                distance <- c(distance,dist)
            }
        }
        min_d <- which.min(distance)
        find_r1 <- r1[min_d]
        find_r2 <- r2[min_d]
        meanx <- mean(c(dat[find_r1,1], dat[find_r2,1]))
        meany <- mean(c(dat[find_r1,2], dat[find_r2,2]))
 # find way to replace rows with new obs (meanx,meany)
        clusters <- c(find_r1,find_r2)
        return(clusters)
}
}

