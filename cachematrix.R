## The functions calculates/pulls the inverse of a matrix stored in a different
## environment, depending if it is already done.



## makes a list object whihc has a bunch of functions whihc sets ...
## variables in an environment. They be altered with the functions created

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    
    get <- function() x
    
    setinv <- function(solve) m <<- solve
    getinv <- function() m
    
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)

}

## this function looks for an inverse, if it exists already 
## in the cache it pulls from there otherwise calcs new and 
## sets to the object.

cacheSolve <- function(x, ...) {
    m <- x$getinv()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data)
    x$setinv(m)
    m
           ## Return a matrix that is the inverse of 'x'
}

## to test that the code works you have to source this and then add a few 
## following lines in the console:

## mattes<-matrix(c(1:4,1:4,1),3,3)
## matr<-makeCacheMatrix(mattes)
## cacheSolve(matr)
## cacheSolve(matr) 

## the output shows that it reads from the cache.
