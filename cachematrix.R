## This functions are used to avoid computational processes to invert a matrix if  
## this was already done (executed) before.

## This function creates a list of functions that are supposed to be used when someone tries
## calculate the inverse of a matrix. The functions are:
# set the value of the vector
# get the value of the vector
# set the value of the mean
# get the value of the mean

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL               ## Used to set m, this NULL will be found when there is no cache yet.
    set <- function(y) {
        x <<- y             ## This function can be used to change the specialMatrix values. 
        m <<- NULL          ## Set the value to the Parent environment as this camos from a change in the matrix.
    }
    get <- function() x
    setmean <- function(inverse) m <<- inverse
    getmean <- function() m
    list( get = get,
          setmean = setmean,
          getmean = getmean)
}

## The cacheSolve function is used to check if the inverse matrix was already calculated
## If it has been calculated, this will return the cached value and avoid all the computation again
## if it has NOT been calculated it will execute the computation and cache the result using the "setmean" function 

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

