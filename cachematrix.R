## This R file contains two functions: 
## makeCacheMatrix which takes input of type matrix and returns the special Matrix
## cacheSolve which takes the speciai matrix as input and returns the inverse of the
## matrix from cache if available or calculates and returns if not available in cache

## This functions creates a special matix containing the methods for setting and 
## getting the special matrix values or inverse

makeCacheMatrix <- function(x = matrix()) {
m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setInverse <- function(xInverse) m <<- xInverse
  getInverse <- function() m
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)

}


## This method tries getting values from the cache for inverse of the 
## special matrix passed as argument or calculates and adds it to cache

cacheSolve <- function(x) {
        ## Return a matrix that is the inverse of 'x'
	m <- x$getInverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setInverse(m)
  ## Return a matrix that is the inverse of 'x'
  m
}
