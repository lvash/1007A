###### Programming in R 
###### 12 January 2023
###### LVA

# Advantages
## interactive use
## graphics, statistics
## very active community of contributors
## works on multiple platforms

# Disadvatages
## lazy evaluation
## some packages are poorly documented
## functions are hard to learn (steep learning curve)
## unreliable packages
## problems big data (multiple GBs)  

# Let's start with the basic

## Assignment operator: used to assign a new value to a variable  

x <- 5
print(x)
x

y = 4 #legal but not used except in function arguments
print(y)
y = y + 1.1
y <- y + 1.1
print(y)

## Variables: used to store information (a container)

z <- 3 #single letter variables 
plantHeight <- 10 #camel case format
plant_height <- 3.3 # snake case format #a preferred method
plant.height <- 4.2
. <- 5.5 #reserve for temporary variable

## Functions: blocks of code that performs a task; use short command over again instead of writing out that block code multiple times

# you can create your own function!

square <- function(y = NULL){
  y <- y^2
  print(y)
}

z<-103
square(x = z) #the argument name is x

### or there are built in functions
sum(109, 3, 10) ### look at package info using ?sum or going to Help panel


#### Atomic Vectors
# one dimensional (a single row)
# data structures in R programming

### Types
# character strings (usually within quotes)
# integers (whole numbers)
# double (real numbers, decimal)
# both integers and doubles are numeric
# logical (TRUE or FALSE)
# factor (categorizes, groups variable) 

# c function (combine)
z <- c(3.2, 5, 5, 6)
print(z) # prints
class(z) # returns class
typeof(z) # returns type of variable
is.numeric(z) #returns T/F

## c() always "flattens" to a vector
### c() useful for creating vectors 
z <- c(c(3,4), c(5,6)) 

# character vectors
z <- c("perch", "bass", "trout")
print(z)
z <- c("This is only 'one' character string", "a second", 'a third')
print(z)
typeof(z)
is.character(z) #is. functions tests whether it is certain data type

### Logical (Boolean), no quotes, all caps: TRUE and/or FALSE
z<-c(TRUE, FALSE, T, F) # as. functions coerces data type
z <- as.character(z)
is.logical(z)

# Type
# is.numeric / as.character
# typeof()

# Length
length(z)
dim(z) #NULL because vectors are 1 dim.

## Names 
z <- runif(5)
names(z) #no names 

# add names 
names(z) <- c("chow", "pug", "beagle", "greyhound", "akita")
print(z)
names(z) #shows names now
names(z) <- NULL

#### NA values
### missing data
z <- c(3.2, 3.5, NA)
typeof(z)
sum(z)

#check for NAs
anyNA(z)
is.na(z)
which(is.na(z)) #helpful for exploring data and determining where NAs are

## Subsetting vectors
# vectors are indexed
z <- c(3.1, 9.2, 1.3, 0.4, 7.5)
z[4] #use square brackets to subset by index
z[c(4,5)] #need to use c for multiple indices
z[-c(2,3)] #minus signs to exclude elements
z[-1]
z[z==7.5] #use double equals for exact match
z[z<7.5] #use logical statements within square brackets to subset by conditions

z[which(z < 7.5)] #which only outputs indices; within [] it subsets those values

# creating logical vector
z < 7.5

## subsetting characters (named elements)
names(z) <- c("a", "b", "c", "d", "e")
z[c("a","d")]

# subset
subset(x=z, subset= z>1.5 )

# randomly sample
# sample function
story_vec <- c("A", "Frog", "Jumped", "Here")
sample(story_vec)

# randomly select 3 elements from vector
sample(story_vec, size =3)

story_vec <- c(story_vec[1], "Green", story_vec[2:4])
story_vec[2] <- "Blue"
story_vec

# vector function
vec <- vector(mode = "numeric", length=5)

### rep and seq function
z <- rep(x=0, times =100)
z <- rep(x= 1:4, each = 3)

z <- seq(from = 2, to=4)
z
seq(from = 2, to=4, by=0.5)

z <- runif(5)
seq(from=1, to=length(z))










