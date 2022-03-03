library(StabilizedRegression)

d1 <- read.csv("Alarm_Reg_train1.csv")
d2 <- read.csv("Alarm_Reg_softINT2.csv")


data_train <- rbind(d1,d2)
data_test = read.csv("Alarm_Reg_hardINT2.csv")


#############
#############



library(StabilizedRegression)

X<- subset(data_train, select = -c(ACO2))

X_mat <- as.matrix(X) 
vec <- data_train$ACO2
#df <- Filter(function(x)!all(is.na(x)), df)

fit<-StabilizedRegression(X_mat, vec,
                          as.factor(rep(c(1,2), each=1000)),
                          list(B=NA,
                               alpha_stab=0.01,
                               alpha_pred=0.01,
                               size_weight="linear",
                               prescreen_size=NA,
                               prescreen_type="lasso",
                               use_resampling=FALSE,
                               compute_predictive_model=TRUE,
                               stab_test="mean_sres",
                               pred_score="mse",
                               variable_importance="scaled_coefficient"),
                          verbose=1)

X_test<- subset(data_test, select = -c(ACO2))

X_mat_test <- as.matrix(X_test) 
vec_test <- data_test$ACO2

r1 <- list(var_score=fit$variable_importance,
           pred=mean((predict(fit, X_mat_test) - vec_test)^2),
           method="SR")
r2 <- list(var_score=fit$variable_importance_pred,
           pred=mean((predict(fit, X_mat_test,
                              predictive_model=TRUE) - vec_test)^2),
           method="SR (nostab)")
#r3 <- list(var_score=fit$variable_importance_diff,
#           pred=NA,
#          method="SR (diff)")

r1
r2
# r3


a<-fit[["weighting_pred"]]
l<- list()
for(i in 1:length(a)){
  if(a[i]==max(a)){
    # print(fit[["learner_list"]][[i]][["S"]])
    l<-append(l,fit[["learner_list"]][[i]][["S"]])
  }
}

max(a)
#length(a)
# l<-append(l,length(a))

capture.output(fit,file = 'fit.csv')

r <- c(r1,r2)
capture.output(r,file = 'r.csv')

capture.output(l,file = 'l.csv')


