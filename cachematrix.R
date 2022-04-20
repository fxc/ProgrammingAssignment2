## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# This function make a vector, contains a matrix and inverse matrix, with set/get, set_inv_matrix/get_inv_matrix method
makeCacheMatrix <- function(x = matrix()) {
  inv_m <- NULL
  set <- function(y){
    x <- y
    inv_m <<- NULL
  }
  
  get <- function() x
  
  set_inv_matrix <- function(v) inv_m <<- v
  
  get_inv_matrix <- function() inv_m
  
  list(set = set, get = get, 
       set_inv_matrix = set_inv_matrix, get_inv_matrix = get_inv_matrix)
}


## Write a short comment describing this function
# The function compute the inverse of a matrix, and cache it, If the inverse has already been calculated (and the matrix has not changed), 
# then the cachesolve should retrieve the inverse from the cache
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv_matrix = x$get_inv_matrix()
  if (!is.null(inv_matrix)) {
    message("getting cached data")
    return(inv_matrix)
  }
  
  inv_matrix <- solve(x$get(), ...)
  x$set_inv_matrix(inv_matrix)
  inv_matrix
}
