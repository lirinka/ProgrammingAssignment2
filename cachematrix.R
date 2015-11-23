## Matrix inversion is usually a costly computation.
## These functions allow to cache the inverse of a matrix 
## rather than compute it repeatedly.

## This function contains a list of functions: to set the value of the matrix, get the value of the matrix,
## set the value of the inverse of the matrix, get the value of the inverse.

makeCacheMatrix<-function(x = matrix()){
inv<-NULL

# this function sets the cached value to null (in case the data has been changed)
set<-function(y){
	x<<-y
	inv<<-NULL
}
# this function gets the matrix data
get<-function() x

# this function sets the inverse of the matrix
setinverse<-function(inverse) inv<<-inverse

# this function gets the inverse of the matrix
getinverse<-function() inv

# this returns the list of functions that get and set the matrix,
# the inverse of the matrix and the cached value
list(set=set, get=get, setinverse=setinverse, getinverse=getinverse) 
}


## This function returns the inverse of a matrix, 
## retrieving it from the cache if it's there.

cacheSolve<-function(x, ...) {
inv<-x$getinverse()

# if the matrix has not been changed, the cached value is retrieved and returned
if(!is.null(inv)){
	message("getting cached data")
	return(inv)
}

# otherwise a new inverse is computed and cached

dat<-x$get()
inv<-solve(dat)
x$setinverse(inv)
inv
}

