
library(bnlearn)

# SETTING 9: SOURCE DOMAINS HAVE LARGE VARIATIONS & TARGET HIGHLY VARIES FROM SOURCE DOMAINS 

Q <- (4.67) + rnorm(1000, mean=(5), sd=0.25)
C1 <- (-1.56) + rnorm(1000, mean=(4), sd=0.2)
I <- (3) + rnorm(1000, mean=(-4), sd=0.3)
C2 <- (-1.54) + rnorm(1000, mean=(0), sd=0.4)
K <- (4) + rnorm(1000, mean=(-4), sd=0.2)
O <- (-1) + rnorm(1000, mean=(0), sd=0.1)
F <- (-0.5) + rnorm(1000, mean=(-1), sd=0.55)
L <- (-0.9) + rnorm(1000, mean=(0), sd=0.15)

S <- (-1)*Q + (6)*C1 + rnorm(1000, mean=(0), sd=0.2)
R <- (4)*Q + rnorm(1000, mean=(0), sd=0.45)
E <- (2)*F + rnorm(1000, mean=(0), sd=0.5)
J <- (-5)*K + rnorm(1000, mean=(0), sd=0.6)
H <- (1.23)*I + (-3.56)*J + rnorm(1000, mean=(0), sd=0.25)
M <- (0.4)*H + (-3)*C1 + (4)*C2 + rnorm(1000, mean=(0), sd=0.35)
B <- (0.4)*H + (-3)*C1 + (4)*C2 + rnorm(1000, mean=(0), sd=0.25)
G <- (6.08)*B + (5.8)*C1 + rnorm(1000, mean=(0), sd=0.25)
N <- (1.12)*B + (3.56)*C1 + rnorm(1000, mean=(0), sd=0.55)

A <- (10)*G + rnorm(1000, mean=(0), sd=0.5)
P <- (-2.1)*G + (3)*O + rnorm(1000, mean=(0), sd=0.65)
V <- (0.5)*P + (0.8)*S + rnorm(1000, mean=(0), sd=0.5)
T <- (6)*B + (8)*A + rnorm(1000, mean=(0), sd=0.25)
D <- (4)*V + (3)*E + (8)*A + (3)*L + rnorm(1000, mean=(0), sd=0.4)

df1 <- cbind(Q,C1,I,C2,K,O,F,L,S,R,E,J,H,M,B,G,N,A,P,V,T,D)

Q <- (4.67) + rnorm(1000, mean=(5), sd=0.25)
C1 <- (-1.56) + rnorm(1000, mean=(8), sd=0.2)
I <- (3) + rnorm(1000, mean=(-4), sd=0.3)
C2 <- (-1.54) + rnorm(1000, mean=(0), sd=0.4)
K <- (4) + rnorm(1000, mean=(-4), sd=0.2)
O <- (-1) + rnorm(1000, mean=(0), sd=0.1)
F <- (-0.5) + rnorm(1000, mean=(-1), sd=0.55)
L <- (-0.9) + rnorm(1000, mean=(0), sd=0.15)

S <- (-1)*Q + (6)*C1 + rnorm(1000, mean=(0), sd=0.2)
R <- (4)*Q + rnorm(1000, mean=(0), sd=0.45)
E <- (2)*F + rnorm(1000, mean=(0), sd=0.5)
J <- (-5)*K + rnorm(1000, mean=(0), sd=0.6)
H <- (1.23)*I + (-3.56)*J + rnorm(1000, mean=(0), sd=0.25)
M <- (0.4)*H + (-3)*C1 + (4)*C2 + rnorm(1000, mean=(0), sd=0.35)
B <- (0.4)*H + (-3)*C1 + (4)*C2 + rnorm(1000, mean=(0), sd=0.25)
G <- (6.08)*B + (5.8)*C1 + rnorm(1000, mean=(0), sd=0.25)
N <- (1.12)*B + (3.56)*C1 + rnorm(1000, mean=(0), sd=0.55)

A <- (10)*G + rnorm(1000, mean=(0), sd=0.5)
P <- (-2.1)*G + (3)*O + rnorm(1000, mean=(0), sd=0.65)
V <- (0.5)*P + (0.8)*S + rnorm(1000, mean=(0), sd=0.5)
T <- (6)*B + (8)*A + rnorm(1000, mean=(0), sd=0.25)
D <- (4)*V + (3)*E + (8)*A + (3)*L + rnorm(1000, mean=(0), sd=0.4)

df2 <- cbind(Q,C1,I,C2,K,O,F,L,S,R,E,J,H,M,B,G,N,A,P,V,T,D)

Q <- (4.67) + rnorm(1000, mean=(5), sd=0.25)
C1 <- (-1.56) + rnorm(1000, mean=(-2.9), sd=0.2)
I <- (3) + rnorm(1000, mean=(-4), sd=0.3)
C2 <- (-1.54) + rnorm(1000, mean=(-6.1), sd=0.4)
K <- (4) + rnorm(1000, mean=(-4), sd=0.2)
O <- (-1) + rnorm(1000, mean=(0), sd=0.1)
F <- (-0.5) + rnorm(1000, mean=(-1), sd=0.55)
L <- (-0.9) + rnorm(1000, mean=(0), sd=0.15)

S <- (-1)*Q + (6)*C1 + rnorm(1000, mean=(0), sd=0.2)
R <- (4)*Q + rnorm(1000, mean=(0), sd=0.45)
E <- (2)*F + rnorm(1000, mean=(0), sd=0.5)
J <- (-5)*K + rnorm(1000, mean=(0), sd=0.6)
H <- (1.23)*I + (-3.56)*J + rnorm(1000, mean=(0), sd=0.25)
M <- (0.4)*H + (-3)*C1 + (4)*C2 + rnorm(1000, mean=(0), sd=0.35)
B <- (0.4)*H + (-3)*C1 + (4)*C2 + rnorm(1000, mean=(0), sd=0.25)
G <- (6.08)*B + (5.8)*C1 + rnorm(1000, mean=(0), sd=0.25)
N <- (1.12)*B + (3.56)*C1 + rnorm(1000, mean=(0), sd=0.55)

A <- (10)*G + rnorm(1000, mean=(0), sd=0.5)
P <- (-2.1)*G + (3)*O + rnorm(1000, mean=(0), sd=0.65)
V <- (0.5)*P + (0.8)*S + rnorm(1000, mean=(0), sd=0.5)
T <- (6)*B + (8)*A + rnorm(1000, mean=(0), sd=0.25)
D <- (4)*V + (3)*E + (8)*A + (3)*L + rnorm(1000, mean=(0), sd=0.4)

df3 <- cbind(Q,C1,I,C2,K,O,F,L,S,R,E,J,H,M,B,G,N,A,P,V,T,D)

Q <- (4.67) + rnorm(1000, mean=(5), sd=0.25)
C1 <- (-1.56) + rnorm(1000, mean=(4), sd=0.2)
I <- (3) + rnorm(1000, mean=(-4), sd=0.3)
C2 <- (-1.54) + rnorm(1000, mean=(5.1), sd=0.4)
K <- (4) + rnorm(1000, mean=(-4), sd=0.2)
O <- (-1) + rnorm(1000, mean=(0), sd=0.1)
F <- (-0.5) + rnorm(1000, mean=(-1), sd=0.55)
L <- (-0.9) + rnorm(1000, mean=(0), sd=0.15)

S <- (-1)*Q + (6)*C1 + rnorm(1000, mean=(0), sd=0.2)
R <- (4)*Q + rnorm(1000, mean=(0), sd=0.45)
E <- (2)*F + rnorm(1000, mean=(0), sd=0.5)
J <- (-5)*K + rnorm(1000, mean=(0), sd=0.6)
H <- (1.23)*I + (-3.56)*J + rnorm(1000, mean=(0), sd=0.25)
M <- (0.4)*H + (-3)*C1 + (4)*C2 + rnorm(1000, mean=(0), sd=0.35)
B <- (0.4)*H + (-3)*C1 + (4)*C2 + rnorm(1000, mean=(0), sd=0.25)
G <- (6.08)*B + (5.8)*C1 + rnorm(1000, mean=(0), sd=0.25)
N <- (1.12)*B + (3.56)*C1 + rnorm(1000, mean=(0), sd=0.55)

A <- (10)*G + rnorm(1000, mean=(0), sd=0.5)
P <- (-2.1)*G + (3)*O + rnorm(1000, mean=(0), sd=0.65)
V <- (0.5)*P + (0.8)*S + rnorm(1000, mean=(0), sd=0.5)
T <- (6)*B + (8)*A + rnorm(1000, mean=(0), sd=0.25)
D <- (4)*V + (3)*E + (8)*A + (3)*L + rnorm(1000, mean=(0), sd=0.4)

df4 <- cbind(Q,C1,I,C2,K,O,F,L,S,R,E,J,H,M,B,G,N,A,P,V,T,D)

Q <- (4.67) + rnorm(1000, mean=(5), sd=0.25)
C1 <- (-1.56) + rnorm(1000, mean=(-2.8), sd=0.2)
I <- (3) + rnorm(1000, mean=(-4), sd=0.3)
C2 <- (-1.54) + rnorm(1000, mean=(7.2), sd=0.4)
K <- (4) + rnorm(1000, mean=(-4), sd=0.2)
O <- (-1) + rnorm(1000, mean=(0), sd=0.1)
F <- (-0.5) + rnorm(1000, mean=(-1), sd=0.55)
L <- (-0.9) + rnorm(1000, mean=(0), sd=0.15)

S <- (-1)*Q + (6)*C1 + rnorm(1000, mean=(0), sd=0.2)
R <- (4)*Q + rnorm(1000, mean=(0), sd=0.45)
E <- (2)*F + rnorm(1000, mean=(0), sd=0.5)
J <- (-5)*K + rnorm(1000, mean=(0), sd=0.6)
H <- (1.23)*I + (-3.56)*J + rnorm(1000, mean=(0), sd=0.25)
M <- (0.4)*H + (-3)*C1 + (4)*C2 + rnorm(1000, mean=(0), sd=0.35)
B <- (0.4)*H + (-3)*C1 + (4)*C2 + rnorm(1000, mean=(0), sd=0.25)
G <- (6.08)*B + (5.8)*C1 + rnorm(1000, mean=(0), sd=0.25)
N <- (1.12)*B + (3.56)*C1 + rnorm(1000, mean=(0), sd=0.55)

A <- (10)*G + rnorm(1000, mean=(0), sd=0.5)
P <- (-2.1)*G + (3)*O + rnorm(1000, mean=(0), sd=0.65)
V <- (0.5)*P + (0.8)*S + rnorm(1000, mean=(0), sd=0.5)
T <- (6)*B + (8)*A + rnorm(1000, mean=(0), sd=0.25)
D <- (4)*V + (3)*E + (8)*A + (3)*L + rnorm(1000, mean=(0), sd=0.4)

df5 <- cbind(Q,C1,I,C2,K,O,F,L,S,R,E,J,H,M,B,G,N,A,P,V,T,D)


data_train <- rbind(df1, df2, df3, df4, df5)

# write.csv(df,"TL_cont_train9.csv", row.names = FALSE)

Q <- (4.67) + rnorm(1000, mean=(5), sd=0.25)
C1 <- (-1.56) + rnorm(1000, mean=(-4), sd=0.2)
I <- (3) + rnorm(1000, mean=(-4), sd=0.3)
C2 <- (-1.54) + rnorm(1000, mean=(10), sd=0.4)
K <- (4) + rnorm(1000, mean=(-4), sd=0.2)
O <- (-1) + rnorm(1000, mean=(0), sd=0.1)
F <- (-0.5) + rnorm(1000, mean=(-1), sd=0.55)
L <- (-0.9) + rnorm(1000, mean=(0), sd=0.15)

S <- (-1)*Q + (6)*C1 + rnorm(1000, mean=(0), sd=0.2)
R <- (4)*Q + rnorm(1000, mean=(0), sd=0.45)
E <- (2)*F + rnorm(1000, mean=(0), sd=0.5)
J <- (-5)*K + rnorm(1000, mean=(0), sd=0.6)
H <- (1.23)*I + (-3.56)*J + rnorm(1000, mean=(0), sd=0.25)
M <- (0.4)*H + (-3)*C1 + (4)*C2 + rnorm(1000, mean=(0), sd=0.35)
B <- (0.4)*H + (-3)*C1 + (4)*C2 + rnorm(1000, mean=(0), sd=0.25)
G <- (6.08)*B + (5.8)*C1 + rnorm(1000, mean=(0), sd=0.25)
N <- (1.12)*B + (3.56)*C1 + rnorm(1000, mean=(0), sd=0.55)

A <- (10)*G + rnorm(1000, mean=(0), sd=0.5)
P <- (-2.1)*G + (3)*O + rnorm(1000, mean=(0), sd=0.65)
V <- (0.5)*P + (0.8)*S + rnorm(1000, mean=(0), sd=0.5)
T <- (6)*B + (8)*A + rnorm(1000, mean=(0), sd=0.25)
D <- (4)*V + (3)*E + (8)*A + (3)*L + rnorm(1000, mean=(0), sd=0.4)

df <- cbind(Q,C1,I,C2,K,O,F,L,S,R,E,J,H,M,B,G,N,A,P,V,T,D)
# write.csv(df,"TL_cont_test9.csv", row.names = FALSE)

df = data.frame(df)
df1 = data.frame(df1)
df2 = data.frame(df2)
df3 = data.frame(df3)
df4 = data.frame(df4)
df5 = data.frame(df5)
data_train = data.frame(data_train)

print("Domain 1")
data.info = bnlearn:::check.data(df1, allow.missing = TRUE)
complete=data.info$complete.nodes
g<-bnlearn:::gs.markov.blanket(x="T", data=df1,nodes=names(df1),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df1))
g
g<-bnlearn:::ia.markov.blanket(x="T", data=df1,nodes=names(df1),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df1))
g
g<-bnlearn:::ia.fdr.markov.blanket(x="T", data=df1,nodes=names(df1),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df1))
g
g<-bnlearn:::inter.ia.markov.blanket(x="T", data=df1,nodes=names(df1),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df1))
g
g<-bnlearn:::fast.ia.markov.blanket(x="T", data=df1,nodes=names(df1),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df1))
g

print("Domain 2")
data.info = bnlearn:::check.data(df2, allow.missing = TRUE)
complete=data.info$complete.nodes
g<-bnlearn:::gs.markov.blanket(x="T", data=df2,nodes=names(df2),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df2))
g
g<-bnlearn:::ia.markov.blanket(x="T", data=df2,nodes=names(df2),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df2))
g
g<-bnlearn:::ia.fdr.markov.blanket(x="T", data=df2,nodes=names(df2),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df2))
g
g<-bnlearn:::inter.ia.markov.blanket(x="T", data=df2,nodes=names(df2),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df2))
g
g<-bnlearn:::fast.ia.markov.blanket(x="T", data=df2,nodes=names(df2),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df2))
g

print("Domain 3")
data.info = bnlearn:::check.data(df3, allow.missing = TRUE)
complete=data.info$complete.nodes
g<-bnlearn:::gs.markov.blanket(x="T", data=df3,nodes=names(df3),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df3))
g
g<-bnlearn:::ia.markov.blanket(x="T", data=df3,nodes=names(df3),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df3))
g
g<-bnlearn:::ia.fdr.markov.blanket(x="T", data=df3,nodes=names(df3),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df3))
g
g<-bnlearn:::inter.ia.markov.blanket(x="T", data=df3,nodes=names(df3),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df3))
g
g<-bnlearn:::fast.ia.markov.blanket(x="T", data=df3,nodes=names(df3),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df3))
g

print("Domain 4")
data.info = bnlearn:::check.data(df4, allow.missing = TRUE)
complete=data.info$complete.nodes
g<-bnlearn:::gs.markov.blanket(x="T", data=df4,nodes=names(df4),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df4))
g
g<-bnlearn:::ia.markov.blanket(x="T", data=df4,nodes=names(df4),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df4))
g
g<-bnlearn:::ia.fdr.markov.blanket(x="T", data=df4,nodes=names(df4),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df4))
g
g<-bnlearn:::inter.ia.markov.blanket(x="T", data=df4,nodes=names(df4),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df4))
g
g<-bnlearn:::fast.ia.markov.blanket(x="T", data=df4,nodes=names(df4),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df4))
g

print("Domain 5")
data.info = bnlearn:::check.data(df5, allow.missing = TRUE)
complete=data.info$complete.nodes
g<-bnlearn:::gs.markov.blanket(x="T", data=df5,nodes=names(df5),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df5))
g
g<-bnlearn:::ia.markov.blanket(x="T", data=df5,nodes=names(df5),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df5))
g
g<-bnlearn:::ia.fdr.markov.blanket(x="T", data=df5,nodes=names(df5),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df5))
g
g<-bnlearn:::inter.ia.markov.blanket(x="T", data=df5,nodes=names(df5),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df5))
g
g<-bnlearn:::fast.ia.markov.blanket(x="T", data=df5,nodes=names(df5),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df5))
g

print("Target Domain")
data.info = bnlearn:::check.data(df, allow.missing = TRUE)
complete=data.info$complete.nodes
g<-bnlearn:::gs.markov.blanket(x="T", data=df,nodes=names(df),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df))
g
g<-bnlearn:::ia.markov.blanket(x="T", data=df,nodes=names(df),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df))
g
g<-bnlearn:::ia.fdr.markov.blanket(x="T", data=df,nodes=names(df),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df))
g
g<-bnlearn:::inter.ia.markov.blanket(x="T", data=df,nodes=names(df),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df))
g
g<-bnlearn:::fast.ia.markov.blanket(x="T", data=df,nodes=names(df),whitelist = NULL,blacklist = NULL,test="zf",alpha = 0.05,B=0L,complete=complete,max.sx = ncol(df))
g


# SETTING 10: CAUSAL STRUCTURE CHANGED (only context C1)
#DOMAIN 1: reference
#DOMAIN 2: C1 TO S REMOVED
#DOMAIN 3: C1 TO N REMOVED
#DOMAIN 4: C1 TO B, G REMOVED
#DOMAIN 5: C1 TO G REMOVED
#DOMAIN TARGET: C1 TO B REMOVED

Q <- (4.67) + rnorm(1000, mean=(5), sd=0.25)
C1 <- (-1.56) + rnorm(1000, mean=(4), sd=0.2)
I <- (3) + rnorm(1000, mean=(-4), sd=0.3)
C2 <- (-1.54) + rnorm(1000, mean=(0), sd=0.4)
K <- (4) + rnorm(1000, mean=(-4), sd=0.2)
O <- (-1) + rnorm(1000, mean=(0), sd=0.1)
F <- (-0.5) + rnorm(1000, mean=(-1), sd=0.55)
L <- (-0.9) + rnorm(1000, mean=(0), sd=0.15)

S <- (-1)*Q + (6)*C1 + rnorm(1000, mean=(0), sd=0.2)
R <- (4)*Q + rnorm(1000, mean=(0), sd=0.45)
E <- (2)*F + rnorm(1000, mean=(0), sd=0.5)
J <- (-5)*K + rnorm(1000, mean=(0), sd=0.6)
H <- (1.23)*I + (-3.56)*J + rnorm(1000, mean=(0), sd=0.25)
M <- (0.4)*H + (-3)*C1 + (4)*C2 + rnorm(1000, mean=(0), sd=0.35)
B <- (0.4)*H + (-3)*C1 + (4)*C2 + rnorm(1000, mean=(0), sd=0.25)
G <- (6.08)*B + (5.8)*C1 + rnorm(1000, mean=(0), sd=0.25)
N <- (1.12)*B + (3.56)*C1 + rnorm(1000, mean=(0), sd=0.55)

A <- (10)*G + rnorm(1000, mean=(0), sd=0.5)
P <- (-2.1)*G + (3)*O + rnorm(1000, mean=(0), sd=0.65)
V <- (0.5)*P + (0.8)*S + rnorm(1000, mean=(0), sd=0.5)
T <- (6)*B + (8)*A + rnorm(1000, mean=(0), sd=0.25)
D <- (4)*V + (3)*E + (8)*A + (3)*L + rnorm(1000, mean=(0), sd=0.4)

df1 <- cbind(Q,C1,I,C2,K,O,F,L,S,R,E,J,H,M,B,G,N,A,P,V,T,D)

Q <- (4.67) + rnorm(1000, mean=(5), sd=0.25)
C1 <- (-1.56) + rnorm(1000, mean=(4), sd=0.2)
I <- (3) + rnorm(1000, mean=(-4), sd=0.3)
C2 <- (-1.54) + rnorm(1000, mean=(0), sd=0.4)
K <- (4) + rnorm(1000, mean=(-4), sd=0.2)
O <- (-1) + rnorm(1000, mean=(0), sd=0.1)
F <- (-0.5) + rnorm(1000, mean=(-1), sd=0.55)
L <- (-0.9) + rnorm(1000, mean=(0), sd=0.15)

S <- (-1)*Q + rnorm(1000, mean=(0), sd=0.2)
R <- (4)*Q + rnorm(1000, mean=(0), sd=0.45)
E <- (2)*F + rnorm(1000, mean=(0), sd=0.5)
J <- (-5)*K + rnorm(1000, mean=(0), sd=0.6)
H <- (1.23)*I + (-3.56)*J + rnorm(1000, mean=(0), sd=0.25)
M <- (0.4)*H + (-3)*C1 + (4)*C2 + rnorm(1000, mean=(0), sd=0.35)
B <- (0.4)*H + (-3)*C1 + (4)*C2 + rnorm(1000, mean=(0), sd=0.25)
G <- (6.08)*B + (5.8)*C1 + rnorm(1000, mean=(0), sd=0.25)
N <- (1.12)*B + (3.56)*C1 + rnorm(1000, mean=(0), sd=0.55)

A <- (10)*G + rnorm(1000, mean=(0), sd=0.5)
P <- (-2.1)*G + (3)*O + rnorm(1000, mean=(0), sd=0.65)
V <- (0.5)*P + (0.8)*S + rnorm(1000, mean=(0), sd=0.5)
T <- (6)*B + (8)*A + rnorm(1000, mean=(0), sd=0.25)
D <- (4)*V + (3)*E + (8)*A + (3)*L + rnorm(1000, mean=(0), sd=0.4)

df2 <- cbind(Q,C1,I,C2,K,O,F,L,S,R,E,J,H,M,B,G,N,A,P,V,T,D)

Q <- (4.67) + rnorm(1000, mean=(5), sd=0.25)
C1 <- (-1.56) + rnorm(1000, mean=(4), sd=0.2)
I <- (3) + rnorm(1000, mean=(-4), sd=0.3)
C2 <- (-1.54) + rnorm(1000, mean=(0), sd=0.4)
K <- (4) + rnorm(1000, mean=(-4), sd=0.2)
O <- (-1) + rnorm(1000, mean=(0), sd=0.1)
F <- (-0.5) + rnorm(1000, mean=(-1), sd=0.55)
L <- (-0.9) + rnorm(1000, mean=(0), sd=0.15)

S <- (-1)*Q + (6)*C1 + rnorm(1000, mean=(0), sd=0.2)
R <- (4)*Q + rnorm(1000, mean=(0), sd=0.45)
E <- (2)*F + rnorm(1000, mean=(0), sd=0.5)
J <- (-5)*K + rnorm(1000, mean=(0), sd=0.6)
H <- (1.23)*I + (-3.56)*J + rnorm(1000, mean=(0), sd=0.25)
M <- (0.4)*H + (-3)*C1 + (4)*C2 + rnorm(1000, mean=(0), sd=0.35)
B <- (0.4)*H + (-3)*C1 + (4)*C2 + rnorm(1000, mean=(0), sd=0.25)
G <- (6.08)*B + (5.8)*C1 + rnorm(1000, mean=(0), sd=0.25)
N <- (1.12)*B + rnorm(1000, mean=(0), sd=0.55)

A <- (10)*G + rnorm(1000, mean=(0), sd=0.5)
P <- (-2.1)*G + (3)*O + rnorm(1000, mean=(0), sd=0.65)
V <- (0.5)*P + (0.8)*S + rnorm(1000, mean=(0), sd=0.5)
T <- (6)*B + (8)*A + rnorm(1000, mean=(0), sd=0.25)
D <- (4)*V + (3)*E + (8)*A + (3)*L + rnorm(1000, mean=(0), sd=0.4)

df3 <- cbind(Q,C1,I,C2,K,O,F,L,S,R,E,J,H,M,B,G,N,A,P,V,T,D)

Q <- (4.67) + rnorm(1000, mean=(5), sd=0.25)
C1 <- (-1.56) + rnorm(1000, mean=(4), sd=0.2)
I <- (3) + rnorm(1000, mean=(-4), sd=0.3)
C2 <- (-1.54) + rnorm(1000, mean=(0), sd=0.4)
K <- (4) + rnorm(1000, mean=(-4), sd=0.2)
O <- (-1) + rnorm(1000, mean=(0), sd=0.1)
F <- (-0.5) + rnorm(1000, mean=(-1), sd=0.55)
L <- (-0.9) + rnorm(1000, mean=(0), sd=0.15)

S <- (-1)*Q + (6)*C1 + rnorm(1000, mean=(0), sd=0.2)
R <- (4)*Q + rnorm(1000, mean=(0), sd=0.45)
E <- (2)*F + rnorm(1000, mean=(0), sd=0.5)
J <- (-5)*K + rnorm(1000, mean=(0), sd=0.6)
H <- (1.23)*I + (-3.56)*J + rnorm(1000, mean=(0), sd=0.25)
M <- (0.4)*H + (-3)*C1 + (4)*C2 + rnorm(1000, mean=(0), sd=0.35)
B <- (0.4)*H + (4)*C2 + rnorm(1000, mean=(0), sd=0.25)
G <- (6.08)*B + rnorm(1000, mean=(0), sd=0.25)
N <- (1.12)*B + (3.56)*C1 + rnorm(1000, mean=(0), sd=0.55)

A <- (10)*G + rnorm(1000, mean=(0), sd=0.5)
P <- (-2.1)*G + (3)*O + rnorm(1000, mean=(0), sd=0.65)
V <- (0.5)*P + (0.8)*S + rnorm(1000, mean=(0), sd=0.5)
T <- (6)*B + (8)*A + rnorm(1000, mean=(0), sd=0.25)
D <- (4)*V + (3)*E + (8)*A + (3)*L + rnorm(1000, mean=(0), sd=0.4)

df4 <- cbind(Q,C1,I,C2,K,O,F,L,S,R,E,J,H,M,B,G,N,A,P,V,T,D)

Q <- (4.67) + rnorm(1000, mean=(5), sd=0.25)
C1 <- (-1.56) + rnorm(1000, mean=(4), sd=0.2)
I <- (3) + rnorm(1000, mean=(-4), sd=0.3)
C2 <- (-1.54) + rnorm(1000, mean=(0), sd=0.4)
K <- (4) + rnorm(1000, mean=(-4), sd=0.2)
O <- (-1) + rnorm(1000, mean=(0), sd=0.1)
F <- (-0.5) + rnorm(1000, mean=(-1), sd=0.55)
L <- (-0.9) + rnorm(1000, mean=(0), sd=0.15)

S <- (-1)*Q + (6)*C1 + rnorm(1000, mean=(0), sd=0.2)
R <- (4)*Q + rnorm(1000, mean=(0), sd=0.45)
E <- (2)*F + rnorm(1000, mean=(0), sd=0.5)
J <- (-5)*K + rnorm(1000, mean=(0), sd=0.6)
H <- (1.23)*I + (-3.56)*J + rnorm(1000, mean=(0), sd=0.25)
M <- (0.4)*H + (-3)*C1 + (4)*C2 + rnorm(1000, mean=(0), sd=0.35)
B <- (0.4)*H + (-3)*C1 + (4)*C2 + rnorm(1000, mean=(0), sd=0.25)
G <- (6.08)*B + rnorm(1000, mean=(0), sd=0.25)
N <- (1.12)*B + (3.56)*C1 + rnorm(1000, mean=(0), sd=0.55)

A <- (10)*G + rnorm(1000, mean=(0), sd=0.5)
P <- (-2.1)*G + (3)*O + rnorm(1000, mean=(0), sd=0.65)
V <- (0.5)*P + (0.8)*S + rnorm(1000, mean=(0), sd=0.5)
T <- (6)*B + (8)*A + rnorm(1000, mean=(0), sd=0.25)
D <- (4)*V + (3)*E + (8)*A + (3)*L + rnorm(1000, mean=(0), sd=0.4)

df5 <- cbind(Q,C1,I,C2,K,O,F,L,S,R,E,J,H,M,B,G,N,A,P,V,T,D)


data_train <- rbind(df1, df2, df3, df4, df5)
# write.csv(df,"TL_cont_train10.csv", row.names = FALSE)

Q <- (4.67) + rnorm(1000, mean=(5), sd=0.25)
C1 <- (-1.56) + rnorm(1000, mean=(4), sd=0.2)
I <- (3) + rnorm(1000, mean=(-4), sd=0.3)
C2 <- (-1.54) + rnorm(1000, mean=(0), sd=0.4)
K <- (4) + rnorm(1000, mean=(-4), sd=0.2)
O <- (-1) + rnorm(1000, mean=(0), sd=0.1)
F <- (-0.5) + rnorm(1000, mean=(-1), sd=0.55)
L <- (-0.9) + rnorm(1000, mean=(0), sd=0.15)

S <- (-1)*Q + (6)*C1 + rnorm(1000, mean=(0), sd=0.2)
R <- (4)*Q + rnorm(1000, mean=(0), sd=0.45)
E <- (2)*F + rnorm(1000, mean=(0), sd=0.5)
J <- (-5)*K + rnorm(1000, mean=(0), sd=0.6)
H <- (1.23)*I + (-3.56)*J + rnorm(1000, mean=(0), sd=0.25)
M <- (0.4)*H + (-3)*C1 + (4)*C2 + rnorm(1000, mean=(0), sd=0.35)
B <- (0.4)*H + (4)*C2 + rnorm(1000, mean=(0), sd=0.25)
G <- (6.08)*B + (5.8)*C1 + rnorm(1000, mean=(0), sd=0.25)
N <- (1.12)*B + (3.56)*C1 + rnorm(1000, mean=(0), sd=0.55)

A <- (10)*G + rnorm(1000, mean=(0), sd=0.5)
P <- (-2.1)*G + (3)*O + rnorm(1000, mean=(0), sd=0.65)
V <- (0.5)*P + (0.8)*S + rnorm(1000, mean=(0), sd=0.5)
T <- (6)*B + (8)*A + rnorm(1000, mean=(0), sd=0.25)
D <- (4)*V + (3)*E + (8)*A + (3)*L + rnorm(1000, mean=(0), sd=0.4)

df <- cbind(Q,C1,I,C2,K,O,F,L,S,R,E,J,H,M,B,G,N,A,P,V,T,D)
# write.csv(df,"TL_cont_test10.csv", row.names = FALSE)

df = data.frame(df)
df1 = data.frame(df1)
df2 = data.frame(df2)
df3 = data.frame(df3)
df4 = data.frame(df4)
df5 = data.frame(df5)
data_train = data.frame(data_train)


library(InvariantCausalPrediction)


## divide data into observational (ExpInd=1) and interventional (ExpInd=2)
ExpInd <- c(rep(1,1000),rep(2,4000))


X<- subset(data_train, select = -c(T))

X <- as.matrix(X) 
Y <- data_train$T

####### Compute "Invariant Causal Prediction" Confidence Intervals
icp <- ICP(X,Y,ExpInd)

###### Print/plot/show summary of output
print(icp)
#summary(icp)
plot(icp)

#### compare with linear model
cat("\n compare with linear model \n")
print(summary(lm(Y~X)))
