## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

    list( get = get,
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    m <- x$getmean()
    if(!is.null(m)) {                   ## Check if there was already value in the M populated by the solve function
        message("getting cached data")  ## If there is this value will be used.
        return(m)
    } else {                            ## If M is different from NULL it will not execute the solve again.
        data <- x$get()                     
        m <- solve(data, ...)
        x$setmean(m)
    }
    m
}
