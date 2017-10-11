## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# creating a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y){
        x <<- y
        i <<- NULL
        x
      }
    get <- function() x
    setinv <- function(invr) i <- invr
    getinv <- function() i
    list(set=set,get=get,getinv=getinv,setinv=setinv)
}


## Write a short comment describing this function
#computes the inverse of the special "matrix" returned by 
#makeCacheMatrix above

cacheSolve <- function(x, ...) {
    i <- x$getinv()
    if(!is.null(i)){
        message("getting cached data")
        return(i)
      }
     data <- x$get()
     invr <- solve(data)
     x$setinv(invr)
     ## Return a matrix that is the inverse of 'x'
     invr
  }