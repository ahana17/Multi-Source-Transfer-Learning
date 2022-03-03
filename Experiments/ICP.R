

library(InvariantCausalPrediction)

d1 <- read.csv("TL3_CTrain1.csv")
d2 <- read.csv("TL3_CTrain2.csv")
d3 <- read.csv("TL3_CTest.csv")

# data_train <- rbind(d1,d2,d3,d4)
data_train <- rbind(d1,d2,d3)

## divide data into observational (ExpInd=1) and interventional (ExpInd=2)
ExpInd <- c(rep(1,1000),rep(2,2000))

# X<- subset(data_train, select = -c(ACO2))
# 
# X <- as.matrix(X) 
# Y <- data_train$ACO2

X<- subset(data_train, select = -c(ECO2))

X <- as.matrix(X) 
Y <- data_train$ECO2

####### Compute "Invariant Causal Prediction" Confidence Intervals
icp <- ICP(X,Y,ExpInd)

###### Print/plot/show summary of output
print(icp)
#summary(icp)
plot(icp)

#### compare with linear model
cat("\n compare with linear model \n")
print(summary(lm(Y~X)))

