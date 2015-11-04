## Matrix inversion is usually a costly computation.
## These functions allow to cache the inverse of a matrix 
## rather than compute it repeatedly.

## This function contains a list of functions: to set the value of the matrix, get the value of the matrix,
## set the value of the inverse of the matrix, get the value of the inverse.

makeCacheMatrix<-function(x = matrix()){
inv<-NULL
set<-function(y){
	x<<-y
	inv<<-NULL
}
get<-function() x
setinverse<-function(inverse) inv<<-inverse
getinverse<-function() inv
list(set=set, get=get, setinverse=setinverse, getinverse=getinverse) 
}


## This function returns the inverse of a matrix, 
## retrieving it from the cache if it's there.

cacheSolve<-function(x, ...) {
inv<-x$getinverse()
if(!is.null(inv)){
	message("getting cached data")
	return(inv)
}
dat<-x$get()
inv<-solve(dat)
x$setinverse(inv)
inv
}

