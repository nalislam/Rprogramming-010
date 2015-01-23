# following two functions are used to cache the inverse of a matrix.
# makeCacheMatrix creates a object of list containing a
# function to set, get, setting inverse and getting inverse of matrix
makeCacheMatrix <- function(x = matrix()) {
inv <- NULL
set <- function(y) {
x <<- y
inv <<- NULL
}
get <- function() x
setinverse <- function(inverse) inv <<- inverse
getinverse <- function() inv
list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}
# This function assumes that the inverse for matrix exists.
# makes use of cache
cacheSolve <- function(x, ...) {
inv <- x$getinverse()
if(!is.null(inv)) {
message("getting cached data.")
return(inv)
}
data <- x$get()
inv <- solve(data)
x$setinverse(inv)
inv
}
## how to run code ?
## fist make matrix
## > source("CacheMatrix_1.R")
## > x <- matrix(1:4,nrow=2,ncol=2)
## > m = makeCacheMatrix(x)
## > m$get()
## > cacheSolve(m)
## [,1] [,2]
## [1,] -2 1.5
## [2,] 1 -0.5
## Retrieving from the cache in the second run
## > cacheSolve(m)
## getting cached data.
## [,1] [,2]
## [1,] -2 1.5
## [2,] 1 -0.5
## > 
