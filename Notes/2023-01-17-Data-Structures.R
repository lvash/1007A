##### Vectors, Matrices, Data Frames, and Lists
##### 17 January 2023
##### LVA

#### Vectors (cont'd)
#### Properties

## Coercion

### All atomic vectors are of the same data type
### If you use c() to assemble different types, R coerces them
### logical -> integer -> double -> character

a <- c(2, 2.2)
a #coerces to double

b <- c("purple", "green")
typeof(b)

d <- c(a,b)
typeof(d)

### comparison operators yield a logical result
a <- runif(10)
print(a)

a > 0.5 # conditional statement 

### How many elements in the vector are > 0.5
sum(a > 0.5)
mean(a > 0.5) # what proportion of vector are greater than 0.5


#### Vectorization 
## add a constant to a vector 

z <- c(10, 20, 30)
z + 1

## what happens when vectors are added together?
y <- c(1, 2, 3)

z + y # results in an "element by element" operation on the vector

z^2

## Recycling 
# what if vector lengths are not equal?

z
x <- c(1,2)
z + x #warning is issued but calculation is still made
# shorter vector is always recycled 

#### Simulating data: runif and rnorm()

runif(n=5, min=5, max=10) #n sample size, min = minimum value, max=maximum value

set.seed(111) # set.seed can any number, sets random number generator (is reproducible)
runif(n=100, min=5, max=10)

hist(runif(n=100, min=5, max=10))

## rnorm: random normal values with mean 0 and sd 1
randomNormalNumbers <- rnorm(100)
mean(randomNormalNumbers) #hist function shows distribution

rnorm(n=100, mean=100, sd=30)
hist(rnorm(n=100, mean=100, sd=30))

########## Matrix data structure
### 2 dimensional (rows and columns)
### homogeneous data type 

# matrix is an atomic vector organized into rows and columns
my_vec <- 1:12

m <- matrix(data = my_vec, nrow=4)
m

m <- matrix(data = my_vec, ncol=3)
m

m <- matrix(data = my_vec, ncol=3, byrow=TRUE)
m

#### Lists
## are atomic vectors BUT each element can hold different data types (and different sizes)

myList <- list(1:10, matrix(1:8, nrow=4, byrow=TRUE), letters[1:3], pi)
class(myList)
str(myList)

### subsetting lists
## using [] gives you a single item BUT not the elements
myList[4]
myList[4] - 3 #single brackets gives you only elements in slot which is always type list

# to grab object itself, use [[]]
myList[[4]] #now we access contents

myList[[4]] - 3 

myList[[2]][4,1] ## 2 dim subsetting -> first number is row index, second is column [4,1] gives 4th row, first column

myList[c(1,2)] # to obtain multiple compartments of list

c(myList[[1]], myList[[2]]) # to obtain multiple elements within list

### Name list items when they are created
myList2 <- list(Tester = FALSE, littleM = matrix(1:9, nrow=3))
myList2$Tester #dollar sign accesses named elements

myList2$littleM[2,3] #extracts second row, third column of littleM

myList2$littleM[2,] # leave blank if you want all elements [2,] = second row, all columns

myList2$littleM[2] #gives second element

### unlist to string everything back to vector
unRolled <- unlist(myList2)
unRolled

data(iris)
head(iris)
plot(Sepal.Length ~ Petal.Length, data= iris) #y~x
model <- lm(Sepal.Length ~ Petal.Length, data=iris)
results <- summary(model)

str(results)
# use [] to extract Petal.Length pvalue
results$coefficients["Petal.Length","Pr(>|t|)"]
results[[4]][2,4]

# different way: use unlist()
unlist(results)$coefficients8

### Data frames 
## (list of) equal-lengthed vectors, each of which is a column

varA <- 1:12
varB <- rep(c("Con", "LowN", "HighN"), each=4)
varC <- runif(12)

dFrame <- data.frame(varA, varB, varC, stringsAsFactors = FALSE)
print(dFrame)

# add another row
newData <- list(varA=13, varB= "HighN", varC= 0.668)

# use rbind() 
dFrame <- rbind(dFrame, newData)

### why can't we use c?
newData2 <- c(14, "HighN", 0.668) #coerces to character
dFrame <- rbind(dFrame, newData2) #all character data types now!

### add a column 
newVar <- runif(14)

# use dim() to check rows and columns

# use cbind() function to add column
dFrame <- cbind(dFrame, newVar)
head(dFrame)

### Data frames vs Matrices
zMat <- matrix(data=1:30, ncol=3, byrow=TRUE)
zDframe <- as.data.frame(zMat)

zMat[3,3]
zDframe[3,3]

zMat[,3]
zDframe[,3]
zDframe$V3
zDframe["V3"]

zMat[3,]
zDframe[3,]

zMat[3]
zDframe[3] # different!! whole third column is given

##### Eliminating NAs
# complete.cases() function
zD <- c(NA, rnorm(10), NA, rnorm(3))
complete.cases(zD) #gives logical output

# clean out NAs
zD[complete.cases(zD)]
which(!complete.cases(zD))
which(is.na(zD))

#use with matrix
m <- matrix(1:20, nrow=5)
m[1,1] <- NA 
m[5,4] <- NA
complete.cases(m) #gives T/F as to whether whole row is 'complete' (no NAs)
m[complete.cases(m),]

## get complete cases for only certain rows
m[complete.cases(m[,c(1:2)]),]


