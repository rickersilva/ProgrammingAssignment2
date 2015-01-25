## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##This function is some sort of an object that contains in iself the matrix and the inverse matrix. o it has two properties (in the programming way) that allows the user to set or get the matrix or its inverse. This object only sottores the information. The user needs to compute the inverse outside, yet it can be tweaked to doit here too. by changing  line 10 to inverse <<- solve(y), however that way, it could take longer to create the object, so it is better left to further actions from the user. this object at the end returns a list of functions which can be accessed fromthe instance user creates.

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y){
        x <<- y
        inverse <<- NULL
    }
    get <- function(){
        x
    }
    setInverse <- function(inverse){
        i <<- inverse
    }
    getInverse <- function(){
        i
    }
    getevn <- function() {
        environment()
    }
    list(set = set, get = get, setInverse=setInverse, getInverse = getInverse, getevn = getevn)
}


## Write a short comment describing this function
## This function ony tests the previous one. this is not that usefull for prduction purposes, but it is enough to test the concept of caching. If you call this function and passes a matrix created with the previous method you will see that you can now just call yourMatrix$getInverse() to retrieve the cached matrix

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    i<- x$getInverse()
    if(!is.null(i)){
        message("geting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data)
    x$setInverse(i)
    i
}