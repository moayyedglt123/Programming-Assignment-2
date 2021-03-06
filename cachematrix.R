## My function is for calculating the inverse of a matrix.
## The first function is for calculating a matrix, the second one is for preventing it from calculating repeatly. 

## Calculating the inverse of a matrix is sometimes computational consuming, while caching the inverse of it would prevent it from calculating repeatly. 

makeCacheMatrix <- function(x = matrix()) {
  inv<-NULL#assign NULL to m
  set<-function(y){
    x<<-y #after setting y to x, x=y, m=NULL
    inv<<-NULL # m is NULL
  }
  get<-function()x #set this function to GET
  setinverse<-function(inverse) inv<<-inverse 
  getinverse<-function()inv #assign inv to getinverse (NULL)
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}



## This function will prevent the null from calculating the inverse of the matrix repeatly. If the value is not NULL, then this function will show a message "getting cached matrix" and then caching the matrix and show it.


cacheSolve <- function(x, ...) {
  inv<-x$getinverse() #first, setting the value of m to GETMEAN
  if(!is.null(inv)){
    message("getting cached matrix")
    return(inv) #if the value of inv is not NULL, then a message "getting cached matrix" will be shown here.
  }
  matrix<-x$get()
  inv<-solve(matrix,...)
  x$setinverse(inv)
  inv  ## Return a matrix that is the inverse of 'x'
}