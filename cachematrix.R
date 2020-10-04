## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        s <- NULL
        set1 <- function(y) {
            x <<- y
            s <<- NULL
        }
        get1 <- function() x
        setsolve <- function(solve) s <<- solve
        getsolve <- function() s
        list(set1 = set1, get1 = get1,
             setsolve = setsolve,
             getsolve = getsolve)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        s <- x$getsolve()
        if(!is.null(s)) {
            message("getting cached data")
            return(s)
        }
        data <- x$get1()
        s <- solve(data, ...)
        x$setsolve(s)
        s
}

matrix1 <- matrix(1:25, ncol = 5, nrow = 5, byrow= T, row.names(c("1, 2, 3, 4, 5")))
matrix2 <- makeCacheMatrix(matrix1)
cacheSolve(matrix2)
solve(matrix1, rightside)
as.numeric(matrix1)
rightside <- matrix(nrow = 5, ncol = 5)
