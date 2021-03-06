## The functions compute the inverse of a matrix and stores it in cache
## in order to save multiple computations

## Creates a matrix object to cache its inverse

makeCacheMatrix <- function(x = matrix()) {
	i <- NULL
	set <- function(y) {
		x <<- y
		i <<- NULL
	}
	get <- function() x
	setinverse <- function(inverse) i <<- inverse
	getinverse <- function() i
	list(set = set, get = get, setinverse = setinverse,
		getinverse = getinverse)
}


## Calculates the inverse of a matrix if it hasn't been calculated yet.
## If it was, then retrieves the inverse from the cache

cacheSolve <- function(x, ...) {
	i <- x$getinverse()
	if(!is.null(i)) {
		message("getting cached data")
		return(i)
	}
	data <- x$get()
	i <- solve(data)
	x$setinverse(i)
	i
        
}
