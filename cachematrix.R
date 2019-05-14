## functions do

## Write a short comment describing this function
## Functions for creating and using inverted matrices which caching ability


## Creates cacheable matrix for inputting to
## cacheSolve() function which sets and gets 
## the cached values

makeCacheMatrix <- function(x = matrix()) {
        
        if (!is.matrix(original.matrix)) {
                stop("Please give a matrix")
        }
        
        inverted.matrix <- NULL
        
        set <- function(y) {
                original.matrix <<- y
                inverted.matrix <<- NULL
        }
        
        get <- function() original.matrix
        # Inversing the matrix using build in solve() function in R
        set.inverse <- function(solve) inverted.matrix <<- solve
        get.inverse <- function() inverted.matrix
        
        list(
                set = set, 
                get = get,
                set.inverse = set.inverse,
                get.inverse = get.inverse)
        
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        ## Return a matrix that is the inverse of 'x'
        inverted.matrix <- cacheable.matrix$get.inverse()
        # Do we have cached matrix available?
        if(!is.null(inverted.matrix)) {
                message("Getting cached inverse matrix")
                return(inverted.matrix)
        }
        # Let's create inverted matrix in case
        # there's no cached matrix available.
        matrix.to.inverse <- cacheable.matrix$get()
        inverted.matrix <- solve(matrix.to.inverse)
        cacheable.matrix$set.inverse(inverted.matrix)
        inverted.matrix
        
}
