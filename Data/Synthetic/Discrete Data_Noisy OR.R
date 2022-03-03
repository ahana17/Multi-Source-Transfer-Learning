library(bnlearn)
library(Rgraphviz)

# network specification.
g <- model2network("[PMB][INT][DISC][KINK][MVS][FIO2][APL][ANES][SHNT|PMB:INT][PAP|PMB][TPR|APL][VMCH|MVS][VTUB|DISC:VMCH][PRSS|VTUB:KINK:INT][VLNG|VTUB:KINK:INT][VALV|VLNG:INT][MINV|INT:VLNG][ACO2|VALV][PVS|VALV:FIO2][SAO2|PVS:SHNT][ECO2|ACO2:VLNG][CCHL|SAO2:TPR:ACO2:ANES]")
# graphviz.plot(dag)

g
p <- graphviz.plot(g, layout = "dot")

nodeRenderInfo(p) <- list(col = c("KINK" = "black", "INT" = "black", "ACO2" = "black"),
                          fill = c("KINK" = "green", "INT" = "green", "ACO2" = "orange")) # KINK, INT context variables; ACO2 target
renderGraph(p)


#########################
# SOURCE DATA

l = c("y", "n")
PMB = sample(l, 5000, prob = c(0.8, 0.2), replace = TRUE)
INT = sample(l, 5000, prob = c(0.7, 0.3), replace = TRUE)
DISC = sample(l, 5000, prob = c(0.6, 0.4), replace = TRUE)
KINK = sample(l, 5000, prob = c(0.9, 0.1), replace = TRUE)
MVS = sample(l, 5000, prob = c(0.1, 0.9), replace = TRUE)
FIO2 = sample(l, 5000, prob = c(0.2, 0.8), replace = TRUE)
APL = sample(l, 5000, prob = c(0.3, 0.7), replace = TRUE)
ANES = sample(l, 5000, prob = c(0.4, 0.6), replace = TRUE)

SHNT = apply(cbind(PMB,INT), 1, paste, collapse= ":")
SHNT[SHNT == "y:y"] = sample(l, length(which(SHNT == "y:y")), prob = c(0.98, 0.02), replace = TRUE)
SHNT[SHNT == "y:n"] = sample(l, length(which(SHNT == "y:n")), prob = c(0.8, 0.2), replace = TRUE)
SHNT[SHNT == "n:y"] = sample(l, length(which(SHNT == "n:y")), prob = c(0.9, 0.1), replace = TRUE)
SHNT[SHNT == "n:n"] = sample(l, length(which(SHNT == "n:n")), prob = c(0, 1), replace = TRUE)

PAP = PMB
PAP[PAP == "y"] = sample(l, length(which(PAP == "y")), prob = c(0.97,0.03), replace = TRUE)
PAP[PAP == "n"] = sample(l, length(which(PAP == "n")), prob = c(0, 1), replace = TRUE)

TPR = APL
TPR[TPR == "y"] = sample(l, length(which(TPR == "y")), prob = c(0.98,0.02), replace = TRUE)
TPR[TPR == "n"] = sample(l, length(which(TPR == "n")), prob = c(0.02, 0.98), replace = TRUE)


VMCH = MVS
VMCH[VMCH == "y"] = sample(l, length(which(VMCH == "y")), prob = c(0.1,0.9), replace = TRUE)
VMCH[VMCH == "n"] = sample(l, length(which(VMCH == "n")), prob = c(0.9, 0.1), replace = TRUE)


VTUB = apply(cbind(DISC,VMCH), 1, paste, collapse= ":")
VTUB[VTUB == "y:y"] = sample(l, length(which(VTUB == "y:y")), prob = c(0.95, 0.05), replace = TRUE)
VTUB[VTUB == "y:n"] = sample(l, length(which(VTUB == "y:n")), prob = c(0.8, 0.2), replace = TRUE)
VTUB[VTUB == "n:y"] = sample(l, length(which(VTUB == "n:y")), prob = c(0.7, 0.3), replace = TRUE)
VTUB[VTUB == "n:n"] = sample(l, length(which(VTUB == "n:n")), prob = c(0, 1), replace = TRUE)


PRSS = apply(cbind(VTUB, INT, KINK), 1, paste, collapse= ":")
PRSS[PRSS == "y:y:y"] = sample(l, length(which(PRSS == "y:y:y")), prob = c(0.988, 0.012), replace = TRUE)
PRSS[PRSS == "y:n:y"] = sample(l, length(which(PRSS == "y:n:y")), prob = c(0.94, 0.06), replace = TRUE)
PRSS[PRSS == "n:y:y"] = sample(l, length(which(PRSS == "n:y:y")), prob = c(0.98, 0.02), replace = TRUE)
PRSS[PRSS == "n:n:y"] = sample(l, length(which(PRSS == "n:n:y")), prob = c(0.9, 0.1), replace = TRUE)

PRSS[PRSS == "y:y:n"] = sample(l, length(which(PRSS == "y:y:n")), prob = c(0.88, 0.12), replace = TRUE)
PRSS[PRSS == "y:n:n"] = sample(l, length(which(PRSS == "y:n:n")), prob = c(0.4, 0.6), replace = TRUE)
PRSS[PRSS == "n:y:n"] = sample(l, length(which(PRSS == "n:y:n")), prob = c(0.8, 0.2), replace = TRUE)
PRSS[PRSS == "n:n:n"] = sample(l, length(which(PRSS == "n:n:n")), prob = c(0,1), replace = TRUE)

VLNG = apply(cbind(VTUB, INT, KINK), 1, paste, collapse= ":")
VLNG[VLNG == "y:y:y"] = sample(l, length(which(VLNG == "y:y:y")), prob = c(0.988, 0.012), replace = TRUE)
VLNG[VLNG == "y:n:y"] = sample(l, length(which(VLNG == "y:n:y")), prob = c(0.94, 0.06), replace = TRUE)
VLNG[VLNG == "n:y:y"] = sample(l, length(which(VLNG == "n:y:y")), prob = c(0.98, 0.02), replace = TRUE)
VLNG[VLNG == "n:n:y"] = sample(l, length(which(VLNG == "n:n:y")), prob = c(0.9, 0.1), replace = TRUE)

VLNG[VLNG == "y:y:n"] = sample(l, length(which(VLNG == "y:y:n")), prob = c(0.88, 0.12), replace = TRUE)
VLNG[VLNG == "y:n:n"] = sample(l, length(which(VLNG == "y:n:n")), prob = c(0.4, 0.6), replace = TRUE)
VLNG[VLNG == "n:y:n"] = sample(l, length(which(VLNG == "n:y:n")), prob = c(0.8, 0.2), replace = TRUE)
VLNG[VLNG == "n:n:n"] = sample(l, length(which(VLNG == "n:n:n")), prob = c(0.03,0.97), replace = TRUE)


VALV = apply(cbind(VLNG,INT), 1, paste, collapse= ":")
VALV[VALV == "y:y"] = sample(l, length(which(VALV == "y:y")), prob = c(0.88, 0.12), replace = TRUE)
VALV[VALV == "y:n"] = sample(l, length(which(VALV == "y:n")), prob = c(0.7, 0.3), replace = TRUE)
VALV[VALV == "n:y"] = sample(l, length(which(VALV == "n:y")), prob = c(0.6, 0.4), replace = TRUE)
VALV[VALV == "n:n"] = sample(l, length(which(VALV == "n:n")), prob = c(0, 1), replace = TRUE)


MINV = apply(cbind(VLNG,INT), 1, paste, collapse= ":")
MINV[MINV == "y:y"] = sample(l, length(which(MINV == "y:y")), prob = c(0.88, 0.12), replace = TRUE)
MINV[MINV == "y:n"] = sample(l, length(which(MINV == "y:n")), prob = c(0.6, 0.4), replace = TRUE)
MINV[MINV == "n:y"] = sample(l, length(which(MINV == "n:y")), prob = c(0.7, 0.3), replace = TRUE)
MINV[MINV == "n:n"] = sample(l, length(which(MINV == "n:n")), prob = c(0, 1), replace = TRUE)


ACO2 = VALV
ACO2[ACO2 == "y"] = sample(l, length(which(ACO2 == "y")), prob = c(0.98,0.02), replace = TRUE)
ACO2[ACO2 == "n"] = sample(l, length(which(ACO2 == "n")), prob = c(0.02, 0.98), replace = TRUE)


PVS = apply(cbind(VALV,FIO2), 1, paste, collapse= ":")
PVS[PVS == "y:y"] = sample(l, length(which(PVS == "y:y")), prob = c(0.86, 0.14), replace = TRUE)
PVS[PVS == "y:n"] = sample(l, length(which(PVS == "y:n")), prob = c(0.3, 0.7), replace = TRUE)
PVS[PVS == "n:y"] = sample(l, length(which(PVS == "n:y")), prob = c(0.8, 0.2), replace = TRUE)
PVS[PVS == "n:n"] = sample(l, length(which(PVS == "n:n")), prob = c(0, 1), replace = TRUE)


SAO2 = apply(cbind(PVS,SHNT), 1, paste, collapse= ":")
SAO2[SAO2 == "y:y"] = sample(l, length(which(SAO2 == "y:y")), prob = c(0.96, 0.04), replace = TRUE)
SAO2[SAO2 == "y:n"] = sample(l, length(which(SAO2 == "y:n")), prob = c(0.9, 0.1), replace = TRUE)
SAO2[SAO2 == "n:y"] = sample(l, length(which(SAO2 == "n:y")), prob = c(0.6, 0.4), replace = TRUE)
SAO2[SAO2 == "n:n"] = sample(l, length(which(SAO2 == "n:n")), prob = c(0.04, 0.96), replace = TRUE)


ECO2 = apply(cbind(VLNG,ACO2), 1, paste, collapse= ":")
ECO2[ECO2 == "y:y"] = sample(l, length(which(ECO2 == "y:y")), prob = c(0.94, 0.06), replace = TRUE)
ECO2[ECO2 == "y:n"] = sample(l, length(which(ECO2 == "y:n")), prob = c(0.7, 0.3), replace = TRUE)
ECO2[ECO2 == "n:y"] = sample(l, length(which(ECO2 == "n:y")), prob = c(0.8, 0.2), replace = TRUE)
ECO2[ECO2 == "n:n"] = sample(l, length(which(ECO2 == "n:n")), prob = c(0.03, 0.97), replace = TRUE)



CCHL = apply(cbind(SAO2, TPR, ACO2, ANES), 1, paste, collapse= ":")
CCHL[CCHL == "y:y:y:y"] = sample(l, length(which(CCHL == "y:y:y:y")), prob = c(0.9964, 0.0036), replace = TRUE)#
CCHL[CCHL == "y:n:y:y"] = sample(l, length(which(CCHL == "y:n:y:y")), prob = c(0.988, 0.012), replace = TRUE)#
CCHL[CCHL == "n:y:y:y"] = sample(l, length(which(CCHL == "n:y:y:y")), prob = c(0.994, 0.006), replace = TRUE)#
CCHL[CCHL == "n:n:y:y"] = sample(l, length(which(CCHL == "n:n:y:y")), prob = c(0.98, 0.02), replace = TRUE)#

CCHL[CCHL == "y:y:n:y"] = sample(l, length(which(CCHL == "y:y:n:y")), prob = c(0.964, 0.036), replace = TRUE)#
CCHL[CCHL == "y:n:n:y"] = sample(l, length(which(CCHL == "y:n:n:y")), prob = c(0.88, 0.12), replace = TRUE)#
CCHL[CCHL == "n:y:n:y"] = sample(l, length(which(CCHL == "n:y:n:y")), prob = c(0.94, 0.06), replace = TRUE)#
CCHL[CCHL == "n:n:n:y"] = sample(l, length(which(CCHL == "n:n:n:y")), prob = c(0.8,0.2), replace = TRUE)#

CCHL[CCHL == "y:y:y:n"] = sample(l, length(which(CCHL == "y:y:y:n")), prob = c(0.982, 0.018), replace = TRUE)#
CCHL[CCHL == "y:n:y:n"] = sample(l, length(which(CCHL == "y:n:y:n")), prob = c(0.97, 0.03), replace = TRUE)#
CCHL[CCHL == "n:y:y:n"] = sample(l, length(which(CCHL == "n:y:y:n")), prob = c(0.98, 0.02), replace = TRUE)#
CCHL[CCHL == "n:n:y:n"] = sample(l, length(which(CCHL == "n:n:y:n")), prob = c(0.9, 0.1), replace = TRUE)#

CCHL[CCHL == "y:y:n:n"] = sample(l, length(which(CCHL == "y:y:n:n")), prob = c(0.82, 0.18), replace = TRUE)#
CCHL[CCHL == "y:n:n:n"] = sample(l, length(which(CCHL == "y:n:n:n")), prob = c(0.4, 0.6), replace = TRUE)#
CCHL[CCHL == "n:y:n:n"] = sample(l, length(which(CCHL == "n:y:n:n")), prob = c(0.7, 0.3), replace = TRUE)#
CCHL[CCHL == "n:n:n:n"] = sample(l, length(which(CCHL == "n:n:n:n")), prob = c(0,1), replace = TRUE)#

dag = g

bn = custom.fit(dag, list(
  PMB = matrix(c(0.8, 0.2), ncol = 2, dimnames = list(NULL, l)),
  INT = matrix(c(0.7, 0.3), ncol = 2, dimnames = list(NULL, l)),
  DISC = matrix(c(0.6, 0.4), ncol = 2, dimnames = list(NULL, l)),
  KINK = matrix(c(0.9, 0.1), ncol = 2, dimnames = list(NULL, l)),
  MVS = matrix(c(0.1, 0.9), ncol = 2, dimnames = list(NULL, l)),
  FIO2 = matrix(c(0.2, 0.8), ncol = 2, dimnames = list(NULL, l)),
  APL = matrix(c(0.3, 0.7), ncol = 2, dimnames = list(NULL, l)),
  ANES = matrix(c(0.4, 0.6), ncol = 2, dimnames = list(NULL, l)),


  SHNT = array(c(0.98, 0.02, 0.8, 0.2, 0.9, 0.1, 0, 1), dim = c(2, 2, 2), dimnames = list(SHNT = l, PMB = l, INT = l)),
  
  PAP = array(c(0.97,0.03, 0, 1), dim = c(2,2),
            dimnames = list(PAP = l, PMB = l)),
  
  TPR = array(c(0.98,0.02, 0.02, 0.98), dim = c(2,2),
              dimnames = list(TPR = l, APL = l)),
  
  VMCH = array(c(0.1,0.9, 0.9, 0.1), dim = c(2,2),
              dimnames = list(VMCH = l, MVS = l)),
  
  VTUB = array(c(0.95, 0.05, 0.8, 0.2, 0.7, 0.3, 0, 1), dim = c(2, 2, 2), dimnames = list(VTUB = l, DISC = l, VMCH = l)),
  
  PRSS = array(c(0.988, 0.012, 0.94, 0.06, 0.98, 0.02, 0.9, 0.1, 0.88, 0.12, 0.4, 0.6, 0.8, 0.2, 0, 1), dim = c(2, 2, 2, 2), dimnames = list(PRSS = l, VTUB = l, INT = l, KINK = l)),
  
  VLNG = array(c(0.988, 0.012, 0.94, 0.06, 0.98, 0.02, 0.9, 0.1, 0.88, 0.12, 0.4, 0.6, 0.8, 0.2, 0.03,0.97), dim = c(2, 2, 2, 2), dimnames = list(VLNG = l, VTUB = l, INT = l, KINK = l)),
  
  VALV = array(c(0.88, 0.12, 0.7, 0.3, 0.6, 0.4, 0, 1), dim = c(2, 2, 2), dimnames = list(VALV = l, VLNG = l, INT = l)),
  
  MINV = array(c(0.88, 0.12, 0.6, 0.4, 0.7, 0.3, 0, 1), dim = c(2, 2, 2), dimnames = list(MINV = l, VLNG = l, INT = l)),
  
  ACO2 = array(c(0.98,0.02, 0.02, 0.98), dim = c(2,2),
               dimnames = list(ACO2 = l, VALV = l)),
  
  PVS = array(c(0.86, 0.14, 0.3, 0.7, 0.8, 0.2, 0, 1), dim = c(2, 2, 2), dimnames = list(PVS = l, VALV = l, FIO2 = l)),
  
  SAO2 = array(c(0.96, 0.04, 0.9, 0.1, 0.6, 0.4, 0.04, 0.96), dim = c(2, 2, 2), dimnames = list(SAO2 = l, PVS = l, SHNT = l)),
  
  ECO2 = array(c(0.94, 0.06, 0.7, 0.3, 0.8, 0.2, 0.03, 0.97), dim = c(2, 2, 2), dimnames = list(ECO2 = l, VLNG = l, ACO2 = l)),
  
  
  CCHL = array(c(0.9964, 0.0036, 0.988, 0.012, 0.994, 0.006, 0.98, 0.02,
                 0.964, 0.036, 0.88, 0.12, 0.94, 0.06, 0.8,0.2,
                 0.982, 0.018, 0.97, 0.03, 0.98, 0.02, 0.9, 0.1,
                 0.82, 0.18, 0.4, 0.6, 0.7, 0.3, 0,1), dim = c(2, 2, 2, 2, 2), dimnames = list(CCHL = l, SAO2 = l, TPR = l, ACO2 = l, ANES = l))))
  
df<- rbn(bn,1000)

write.csv(df,"TL3_CTrain1.csv", row.names = FALSE)


#########################################


#########################
# SOURCE DATA

l = c("y", "n")
PMB = sample(l, 5000, prob = c(0.8, 0.2), replace = TRUE)
INT = sample(l, 5000, prob = c(0.8, 0.2), replace = TRUE)
DISC = sample(l, 5000, prob = c(0.6, 0.4), replace = TRUE)
KINK = sample(l, 5000, prob = c(0.9, 0.1), replace = TRUE)
MVS = sample(l, 5000, prob = c(0.1, 0.9), replace = TRUE)
FIO2 = sample(l, 5000, prob = c(0.2, 0.8), replace = TRUE)
APL = sample(l, 5000, prob = c(0.3, 0.7), replace = TRUE)
ANES = sample(l, 5000, prob = c(0.4, 0.6), replace = TRUE)

SHNT = apply(cbind(PMB,INT), 1, paste, collapse= ":")
SHNT[SHNT == "y:y"] = sample(l, length(which(SHNT == "y:y")), prob = c(0.98, 0.02), replace = TRUE)
SHNT[SHNT == "y:n"] = sample(l, length(which(SHNT == "y:n")), prob = c(0.8, 0.2), replace = TRUE)
SHNT[SHNT == "n:y"] = sample(l, length(which(SHNT == "n:y")), prob = c(0.9, 0.1), replace = TRUE)
SHNT[SHNT == "n:n"] = sample(l, length(which(SHNT == "n:n")), prob = c(0, 1), replace = TRUE)

PAP = PMB
PAP[PAP == "y"] = sample(l, length(which(PAP == "y")), prob = c(0.97,0.03), replace = TRUE)
PAP[PAP == "n"] = sample(l, length(which(PAP == "n")), prob = c(0, 1), replace = TRUE)

TPR = APL
TPR[TPR == "y"] = sample(l, length(which(TPR == "y")), prob = c(0.98,0.02), replace = TRUE)
TPR[TPR == "n"] = sample(l, length(which(TPR == "n")), prob = c(0.02, 0.98), replace = TRUE)


VMCH = MVS
VMCH[VMCH == "y"] = sample(l, length(which(VMCH == "y")), prob = c(0.1,0.9), replace = TRUE)
VMCH[VMCH == "n"] = sample(l, length(which(VMCH == "n")), prob = c(0.9, 0.1), replace = TRUE)


VTUB = apply(cbind(DISC,VMCH), 1, paste, collapse= ":")
VTUB[VTUB == "y:y"] = sample(l, length(which(VTUB == "y:y")), prob = c(0.95, 0.05), replace = TRUE)
VTUB[VTUB == "y:n"] = sample(l, length(which(VTUB == "y:n")), prob = c(0.8, 0.2), replace = TRUE)
VTUB[VTUB == "n:y"] = sample(l, length(which(VTUB == "n:y")), prob = c(0.7, 0.3), replace = TRUE)
VTUB[VTUB == "n:n"] = sample(l, length(which(VTUB == "n:n")), prob = c(0, 1), replace = TRUE)


PRSS = apply(cbind(VTUB, INT, KINK), 1, paste, collapse= ":")
PRSS[PRSS == "y:y:y"] = sample(l, length(which(PRSS == "y:y:y")), prob = c(0.988, 0.012), replace = TRUE)
PRSS[PRSS == "y:n:y"] = sample(l, length(which(PRSS == "y:n:y")), prob = c(0.94, 0.06), replace = TRUE)
PRSS[PRSS == "n:y:y"] = sample(l, length(which(PRSS == "n:y:y")), prob = c(0.98, 0.02), replace = TRUE)
PRSS[PRSS == "n:n:y"] = sample(l, length(which(PRSS == "n:n:y")), prob = c(0.9, 0.1), replace = TRUE)

PRSS[PRSS == "y:y:n"] = sample(l, length(which(PRSS == "y:y:n")), prob = c(0.88, 0.12), replace = TRUE)
PRSS[PRSS == "y:n:n"] = sample(l, length(which(PRSS == "y:n:n")), prob = c(0.4, 0.6), replace = TRUE)
PRSS[PRSS == "n:y:n"] = sample(l, length(which(PRSS == "n:y:n")), prob = c(0.8, 0.2), replace = TRUE)
PRSS[PRSS == "n:n:n"] = sample(l, length(which(PRSS == "n:n:n")), prob = c(0,1), replace = TRUE)

VLNG = apply(cbind(VTUB, INT, KINK), 1, paste, collapse= ":")
VLNG[VLNG == "y:y:y"] = sample(l, length(which(VLNG == "y:y:y")), prob = c(0.988, 0.012), replace = TRUE)
VLNG[VLNG == "y:n:y"] = sample(l, length(which(VLNG == "y:n:y")), prob = c(0.94, 0.06), replace = TRUE)
VLNG[VLNG == "n:y:y"] = sample(l, length(which(VLNG == "n:y:y")), prob = c(0.98, 0.02), replace = TRUE)
VLNG[VLNG == "n:n:y"] = sample(l, length(which(VLNG == "n:n:y")), prob = c(0.9, 0.1), replace = TRUE)

VLNG[VLNG == "y:y:n"] = sample(l, length(which(VLNG == "y:y:n")), prob = c(0.88, 0.12), replace = TRUE)
VLNG[VLNG == "y:n:n"] = sample(l, length(which(VLNG == "y:n:n")), prob = c(0.4, 0.6), replace = TRUE)
VLNG[VLNG == "n:y:n"] = sample(l, length(which(VLNG == "n:y:n")), prob = c(0.8, 0.2), replace = TRUE)
VLNG[VLNG == "n:n:n"] = sample(l, length(which(VLNG == "n:n:n")), prob = c(0.03,0.97), replace = TRUE)


VALV = apply(cbind(VLNG,INT), 1, paste, collapse= ":")
VALV[VALV == "y:y"] = sample(l, length(which(VALV == "y:y")), prob = c(0.88, 0.12), replace = TRUE)
VALV[VALV == "y:n"] = sample(l, length(which(VALV == "y:n")), prob = c(0.7, 0.3), replace = TRUE)
VALV[VALV == "n:y"] = sample(l, length(which(VALV == "n:y")), prob = c(0.6, 0.4), replace = TRUE)
VALV[VALV == "n:n"] = sample(l, length(which(VALV == "n:n")), prob = c(0, 1), replace = TRUE)


MINV = apply(cbind(VLNG,INT), 1, paste, collapse= ":")
MINV[MINV == "y:y"] = sample(l, length(which(MINV == "y:y")), prob = c(0.88, 0.12), replace = TRUE)
MINV[MINV == "y:n"] = sample(l, length(which(MINV == "y:n")), prob = c(0.6, 0.4), replace = TRUE)
MINV[MINV == "n:y"] = sample(l, length(which(MINV == "n:y")), prob = c(0.7, 0.3), replace = TRUE)
MINV[MINV == "n:n"] = sample(l, length(which(MINV == "n:n")), prob = c(0, 1), replace = TRUE)


ACO2 = VALV
ACO2[ACO2 == "y"] = sample(l, length(which(ACO2 == "y")), prob = c(0.98,0.02), replace = TRUE)
ACO2[ACO2 == "n"] = sample(l, length(which(ACO2 == "n")), prob = c(0.02, 0.98), replace = TRUE)


PVS = apply(cbind(VALV,FIO2), 1, paste, collapse= ":")
PVS[PVS == "y:y"] = sample(l, length(which(PVS == "y:y")), prob = c(0.86, 0.14), replace = TRUE)
PVS[PVS == "y:n"] = sample(l, length(which(PVS == "y:n")), prob = c(0.3, 0.7), replace = TRUE)
PVS[PVS == "n:y"] = sample(l, length(which(PVS == "n:y")), prob = c(0.8, 0.2), replace = TRUE)
PVS[PVS == "n:n"] = sample(l, length(which(PVS == "n:n")), prob = c(0, 1), replace = TRUE)


SAO2 = apply(cbind(PVS,SHNT), 1, paste, collapse= ":")
SAO2[SAO2 == "y:y"] = sample(l, length(which(SAO2 == "y:y")), prob = c(0.96, 0.04), replace = TRUE)
SAO2[SAO2 == "y:n"] = sample(l, length(which(SAO2 == "y:n")), prob = c(0.9, 0.1), replace = TRUE)
SAO2[SAO2 == "n:y"] = sample(l, length(which(SAO2 == "n:y")), prob = c(0.6, 0.4), replace = TRUE)
SAO2[SAO2 == "n:n"] = sample(l, length(which(SAO2 == "n:n")), prob = c(0.04, 0.96), replace = TRUE)


ECO2 = apply(cbind(VLNG,ACO2), 1, paste, collapse= ":")
ECO2[ECO2 == "y:y"] = sample(l, length(which(ECO2 == "y:y")), prob = c(0.94, 0.06), replace = TRUE)
ECO2[ECO2 == "y:n"] = sample(l, length(which(ECO2 == "y:n")), prob = c(0.7, 0.3), replace = TRUE)
ECO2[ECO2 == "n:y"] = sample(l, length(which(ECO2 == "n:y")), prob = c(0.8, 0.2), replace = TRUE)
ECO2[ECO2 == "n:n"] = sample(l, length(which(ECO2 == "n:n")), prob = c(0.03, 0.97), replace = TRUE)



CCHL = apply(cbind(SAO2, TPR, ACO2, ANES), 1, paste, collapse= ":")
CCHL[CCHL == "y:y:y:y"] = sample(l, length(which(CCHL == "y:y:y:y")), prob = c(0.9964, 0.0036), replace = TRUE)#
CCHL[CCHL == "y:n:y:y"] = sample(l, length(which(CCHL == "y:n:y:y")), prob = c(0.988, 0.012), replace = TRUE)#
CCHL[CCHL == "n:y:y:y"] = sample(l, length(which(CCHL == "n:y:y:y")), prob = c(0.994, 0.006), replace = TRUE)#
CCHL[CCHL == "n:n:y:y"] = sample(l, length(which(CCHL == "n:n:y:y")), prob = c(0.98, 0.02), replace = TRUE)#

CCHL[CCHL == "y:y:n:y"] = sample(l, length(which(CCHL == "y:y:n:y")), prob = c(0.964, 0.036), replace = TRUE)#
CCHL[CCHL == "y:n:n:y"] = sample(l, length(which(CCHL == "y:n:n:y")), prob = c(0.88, 0.12), replace = TRUE)#
CCHL[CCHL == "n:y:n:y"] = sample(l, length(which(CCHL == "n:y:n:y")), prob = c(0.94, 0.06), replace = TRUE)#
CCHL[CCHL == "n:n:n:y"] = sample(l, length(which(CCHL == "n:n:n:y")), prob = c(0.8,0.2), replace = TRUE)#

CCHL[CCHL == "y:y:y:n"] = sample(l, length(which(CCHL == "y:y:y:n")), prob = c(0.982, 0.018), replace = TRUE)#
CCHL[CCHL == "y:n:y:n"] = sample(l, length(which(CCHL == "y:n:y:n")), prob = c(0.97, 0.03), replace = TRUE)#
CCHL[CCHL == "n:y:y:n"] = sample(l, length(which(CCHL == "n:y:y:n")), prob = c(0.98, 0.02), replace = TRUE)#
CCHL[CCHL == "n:n:y:n"] = sample(l, length(which(CCHL == "n:n:y:n")), prob = c(0.9, 0.1), replace = TRUE)#

CCHL[CCHL == "y:y:n:n"] = sample(l, length(which(CCHL == "y:y:n:n")), prob = c(0.82, 0.18), replace = TRUE)#
CCHL[CCHL == "y:n:n:n"] = sample(l, length(which(CCHL == "y:n:n:n")), prob = c(0.4, 0.6), replace = TRUE)#
CCHL[CCHL == "n:y:n:n"] = sample(l, length(which(CCHL == "n:y:n:n")), prob = c(0.7, 0.3), replace = TRUE)#
CCHL[CCHL == "n:n:n:n"] = sample(l, length(which(CCHL == "n:n:n:n")), prob = c(0,1), replace = TRUE)#

dag = g

bn = custom.fit(dag, list(
  PMB = matrix(c(0.8, 0.2), ncol = 2, dimnames = list(NULL, l)),
  INT = matrix(c(0.8, 0.2), ncol = 2, dimnames = list(NULL, l)),
  DISC = matrix(c(0.6, 0.4), ncol = 2, dimnames = list(NULL, l)),
  KINK = matrix(c(0.9, 0.1), ncol = 2, dimnames = list(NULL, l)),
  MVS = matrix(c(0.1, 0.9), ncol = 2, dimnames = list(NULL, l)),
  FIO2 = matrix(c(0.2, 0.8), ncol = 2, dimnames = list(NULL, l)),
  APL = matrix(c(0.3, 0.7), ncol = 2, dimnames = list(NULL, l)),
  ANES = matrix(c(0.4, 0.6), ncol = 2, dimnames = list(NULL, l)),
  
  
  SHNT = array(c(0.98, 0.02, 0.8, 0.2, 0.9, 0.1, 0, 1), dim = c(2, 2, 2), dimnames = list(SHNT = l, PMB = l, INT = l)),
  
  PAP = array(c(0.97,0.03, 0, 1), dim = c(2,2),
              dimnames = list(PAP = l, PMB = l)),
  
  TPR = array(c(0.98,0.02, 0.02, 0.98), dim = c(2,2),
              dimnames = list(TPR = l, APL = l)),
  
  VMCH = array(c(0.1,0.9, 0.9, 0.1), dim = c(2,2),
               dimnames = list(VMCH = l, MVS = l)),
  
  VTUB = array(c(0.95, 0.05, 0.8, 0.2, 0.7, 0.3, 0, 1), dim = c(2, 2, 2), dimnames = list(VTUB = l, DISC = l, VMCH = l)),
  
  PRSS = array(c(0.988, 0.012, 0.94, 0.06, 0.98, 0.02, 0.9, 0.1, 0.88, 0.12, 0.4, 0.6, 0.8, 0.2, 0, 1), dim = c(2, 2, 2, 2), dimnames = list(PRSS = l, VTUB = l, INT = l, KINK = l)),
  
  VLNG = array(c(0.988, 0.012, 0.94, 0.06, 0.98, 0.02, 0.9, 0.1, 0.88, 0.12, 0.4, 0.6, 0.8, 0.2, 0.03,0.97), dim = c(2, 2, 2, 2), dimnames = list(VLNG = l, VTUB = l, INT = l, KINK = l)),
  
  VALV = array(c(0.88, 0.12, 0.7, 0.3, 0.6, 0.4, 0, 1), dim = c(2, 2, 2), dimnames = list(VALV = l, VLNG = l, INT = l)),
  
  MINV = array(c(0.88, 0.12, 0.6, 0.4, 0.7, 0.3, 0, 1), dim = c(2, 2, 2), dimnames = list(MINV = l, VLNG = l, INT = l)),
  
  ACO2 = array(c(0.98,0.02, 0.02, 0.98), dim = c(2,2),
               dimnames = list(ACO2 = l, VALV = l)),
  
  PVS = array(c(0.86, 0.14, 0.3, 0.7, 0.8, 0.2, 0, 1), dim = c(2, 2, 2), dimnames = list(PVS = l, VALV = l, FIO2 = l)),
  
  SAO2 = array(c(0.96, 0.04, 0.9, 0.1, 0.6, 0.4, 0.04, 0.96), dim = c(2, 2, 2), dimnames = list(SAO2 = l, PVS = l, SHNT = l)),
  
  ECO2 = array(c(0.94, 0.06, 0.7, 0.3, 0.8, 0.2, 0.03, 0.97), dim = c(2, 2, 2), dimnames = list(ECO2 = l, VLNG = l, ACO2 = l)),
  
  
  CCHL = array(c(0.9964, 0.0036, 0.988, 0.012, 0.994, 0.006, 0.98, 0.02,
                 0.964, 0.036, 0.88, 0.12, 0.94, 0.06, 0.8,0.2,
                 0.982, 0.018, 0.97, 0.03, 0.98, 0.02, 0.9, 0.1,
                 0.82, 0.18, 0.4, 0.6, 0.7, 0.3, 0,1), dim = c(2, 2, 2, 2, 2), dimnames = list(CCHL = l, SAO2 = l, TPR = l, ACO2 = l, ANES = l))))

df<- rbn(bn,1000)

write.csv(df,"TL3_CTrain2.csv", row.names = FALSE)


##############################################


#########################
# TARGET DATA : hard int on INT & KINK

l = c("y", "n")
PMB = sample(l, 5000, prob = c(0.8, 0.2), replace = TRUE)
INT = sample(l, 5000, prob = c(0.2, 0.8), replace = TRUE)
DISC = sample(l, 5000, prob = c(0.6, 0.4), replace = TRUE)
KINK = sample(l, 5000, prob = c(0.1, 0.9), replace = TRUE)
MVS = sample(l, 5000, prob = c(0.1, 0.9), replace = TRUE)
FIO2 = sample(l, 5000, prob = c(0.2, 0.8), replace = TRUE)
APL = sample(l, 5000, prob = c(0.3, 0.7), replace = TRUE)
ANES = sample(l, 5000, prob = c(0.4, 0.6), replace = TRUE)

SHNT = apply(cbind(PMB,INT), 1, paste, collapse= ":")
SHNT[SHNT == "y:y"] = sample(l, length(which(SHNT == "y:y")), prob = c(0.98, 0.02), replace = TRUE)
SHNT[SHNT == "y:n"] = sample(l, length(which(SHNT == "y:n")), prob = c(0.8, 0.2), replace = TRUE)
SHNT[SHNT == "n:y"] = sample(l, length(which(SHNT == "n:y")), prob = c(0.9, 0.1), replace = TRUE)
SHNT[SHNT == "n:n"] = sample(l, length(which(SHNT == "n:n")), prob = c(0, 1), replace = TRUE)

PAP = PMB
PAP[PAP == "y"] = sample(l, length(which(PAP == "y")), prob = c(0.97,0.03), replace = TRUE)
PAP[PAP == "n"] = sample(l, length(which(PAP == "n")), prob = c(0, 1), replace = TRUE)

TPR = APL
TPR[TPR == "y"] = sample(l, length(which(TPR == "y")), prob = c(0.98,0.02), replace = TRUE)
TPR[TPR == "n"] = sample(l, length(which(TPR == "n")), prob = c(0.02, 0.98), replace = TRUE)


VMCH = MVS
VMCH[VMCH == "y"] = sample(l, length(which(VMCH == "y")), prob = c(0.1,0.9), replace = TRUE)
VMCH[VMCH == "n"] = sample(l, length(which(VMCH == "n")), prob = c(0.9, 0.1), replace = TRUE)


VTUB = apply(cbind(DISC,VMCH), 1, paste, collapse= ":")
VTUB[VTUB == "y:y"] = sample(l, length(which(VTUB == "y:y")), prob = c(0.95, 0.05), replace = TRUE)
VTUB[VTUB == "y:n"] = sample(l, length(which(VTUB == "y:n")), prob = c(0.8, 0.2), replace = TRUE)
VTUB[VTUB == "n:y"] = sample(l, length(which(VTUB == "n:y")), prob = c(0.7, 0.3), replace = TRUE)
VTUB[VTUB == "n:n"] = sample(l, length(which(VTUB == "n:n")), prob = c(0, 1), replace = TRUE)


PRSS = apply(cbind(VTUB, INT, KINK), 1, paste, collapse= ":")
PRSS[PRSS == "y:y:y"] = sample(l, length(which(PRSS == "y:y:y")), prob = c(0.988, 0.012), replace = TRUE)
PRSS[PRSS == "y:n:y"] = sample(l, length(which(PRSS == "y:n:y")), prob = c(0.94, 0.06), replace = TRUE)
PRSS[PRSS == "n:y:y"] = sample(l, length(which(PRSS == "n:y:y")), prob = c(0.98, 0.02), replace = TRUE)
PRSS[PRSS == "n:n:y"] = sample(l, length(which(PRSS == "n:n:y")), prob = c(0.9, 0.1), replace = TRUE)

PRSS[PRSS == "y:y:n"] = sample(l, length(which(PRSS == "y:y:n")), prob = c(0.88, 0.12), replace = TRUE)
PRSS[PRSS == "y:n:n"] = sample(l, length(which(PRSS == "y:n:n")), prob = c(0.4, 0.6), replace = TRUE)
PRSS[PRSS == "n:y:n"] = sample(l, length(which(PRSS == "n:y:n")), prob = c(0.8, 0.2), replace = TRUE)
PRSS[PRSS == "n:n:n"] = sample(l, length(which(PRSS == "n:n:n")), prob = c(0,1), replace = TRUE)

VLNG = apply(cbind(VTUB, INT, KINK), 1, paste, collapse= ":")
VLNG[VLNG == "y:y:y"] = sample(l, length(which(VLNG == "y:y:y")), prob = c(0.988, 0.012), replace = TRUE)
VLNG[VLNG == "y:n:y"] = sample(l, length(which(VLNG == "y:n:y")), prob = c(0.94, 0.06), replace = TRUE)
VLNG[VLNG == "n:y:y"] = sample(l, length(which(VLNG == "n:y:y")), prob = c(0.98, 0.02), replace = TRUE)
VLNG[VLNG == "n:n:y"] = sample(l, length(which(VLNG == "n:n:y")), prob = c(0.9, 0.1), replace = TRUE)

VLNG[VLNG == "y:y:n"] = sample(l, length(which(VLNG == "y:y:n")), prob = c(0.88, 0.12), replace = TRUE)
VLNG[VLNG == "y:n:n"] = sample(l, length(which(VLNG == "y:n:n")), prob = c(0.4, 0.6), replace = TRUE)
VLNG[VLNG == "n:y:n"] = sample(l, length(which(VLNG == "n:y:n")), prob = c(0.8, 0.2), replace = TRUE)
VLNG[VLNG == "n:n:n"] = sample(l, length(which(VLNG == "n:n:n")), prob = c(0.03,0.97), replace = TRUE)


VALV = apply(cbind(VLNG,INT), 1, paste, collapse= ":")
VALV[VALV == "y:y"] = sample(l, length(which(VALV == "y:y")), prob = c(0.88, 0.12), replace = TRUE)
VALV[VALV == "y:n"] = sample(l, length(which(VALV == "y:n")), prob = c(0.7, 0.3), replace = TRUE)
VALV[VALV == "n:y"] = sample(l, length(which(VALV == "n:y")), prob = c(0.6, 0.4), replace = TRUE)
VALV[VALV == "n:n"] = sample(l, length(which(VALV == "n:n")), prob = c(0, 1), replace = TRUE)


MINV = apply(cbind(VLNG,INT), 1, paste, collapse= ":")
MINV[MINV == "y:y"] = sample(l, length(which(MINV == "y:y")), prob = c(0.88, 0.12), replace = TRUE)
MINV[MINV == "y:n"] = sample(l, length(which(MINV == "y:n")), prob = c(0.6, 0.4), replace = TRUE)
MINV[MINV == "n:y"] = sample(l, length(which(MINV == "n:y")), prob = c(0.7, 0.3), replace = TRUE)
MINV[MINV == "n:n"] = sample(l, length(which(MINV == "n:n")), prob = c(0, 1), replace = TRUE)


ACO2 = VALV
ACO2[ACO2 == "y"] = sample(l, length(which(ACO2 == "y")), prob = c(0.98,0.02), replace = TRUE)
ACO2[ACO2 == "n"] = sample(l, length(which(ACO2 == "n")), prob = c(0.02, 0.98), replace = TRUE)


PVS = apply(cbind(VALV,FIO2), 1, paste, collapse= ":")
PVS[PVS == "y:y"] = sample(l, length(which(PVS == "y:y")), prob = c(0.86, 0.14), replace = TRUE)
PVS[PVS == "y:n"] = sample(l, length(which(PVS == "y:n")), prob = c(0.3, 0.7), replace = TRUE)
PVS[PVS == "n:y"] = sample(l, length(which(PVS == "n:y")), prob = c(0.8, 0.2), replace = TRUE)
PVS[PVS == "n:n"] = sample(l, length(which(PVS == "n:n")), prob = c(0, 1), replace = TRUE)


SAO2 = apply(cbind(PVS,SHNT), 1, paste, collapse= ":")
SAO2[SAO2 == "y:y"] = sample(l, length(which(SAO2 == "y:y")), prob = c(0.96, 0.04), replace = TRUE)
SAO2[SAO2 == "y:n"] = sample(l, length(which(SAO2 == "y:n")), prob = c(0.9, 0.1), replace = TRUE)
SAO2[SAO2 == "n:y"] = sample(l, length(which(SAO2 == "n:y")), prob = c(0.6, 0.4), replace = TRUE)
SAO2[SAO2 == "n:n"] = sample(l, length(which(SAO2 == "n:n")), prob = c(0.04, 0.96), replace = TRUE)


ECO2 = apply(cbind(VLNG,ACO2), 1, paste, collapse= ":")
ECO2[ECO2 == "y:y"] = sample(l, length(which(ECO2 == "y:y")), prob = c(0.94, 0.06), replace = TRUE)
ECO2[ECO2 == "y:n"] = sample(l, length(which(ECO2 == "y:n")), prob = c(0.7, 0.3), replace = TRUE)
ECO2[ECO2 == "n:y"] = sample(l, length(which(ECO2 == "n:y")), prob = c(0.8, 0.2), replace = TRUE)
ECO2[ECO2 == "n:n"] = sample(l, length(which(ECO2 == "n:n")), prob = c(0.03, 0.97), replace = TRUE)



CCHL = apply(cbind(SAO2, TPR, ACO2, ANES), 1, paste, collapse= ":")
CCHL[CCHL == "y:y:y:y"] = sample(l, length(which(CCHL == "y:y:y:y")), prob = c(0.9964, 0.0036), replace = TRUE)#
CCHL[CCHL == "y:n:y:y"] = sample(l, length(which(CCHL == "y:n:y:y")), prob = c(0.988, 0.012), replace = TRUE)#
CCHL[CCHL == "n:y:y:y"] = sample(l, length(which(CCHL == "n:y:y:y")), prob = c(0.994, 0.006), replace = TRUE)#
CCHL[CCHL == "n:n:y:y"] = sample(l, length(which(CCHL == "n:n:y:y")), prob = c(0.98, 0.02), replace = TRUE)#

CCHL[CCHL == "y:y:n:y"] = sample(l, length(which(CCHL == "y:y:n:y")), prob = c(0.964, 0.036), replace = TRUE)#
CCHL[CCHL == "y:n:n:y"] = sample(l, length(which(CCHL == "y:n:n:y")), prob = c(0.88, 0.12), replace = TRUE)#
CCHL[CCHL == "n:y:n:y"] = sample(l, length(which(CCHL == "n:y:n:y")), prob = c(0.94, 0.06), replace = TRUE)#
CCHL[CCHL == "n:n:n:y"] = sample(l, length(which(CCHL == "n:n:n:y")), prob = c(0.8,0.2), replace = TRUE)#

CCHL[CCHL == "y:y:y:n"] = sample(l, length(which(CCHL == "y:y:y:n")), prob = c(0.982, 0.018), replace = TRUE)#
CCHL[CCHL == "y:n:y:n"] = sample(l, length(which(CCHL == "y:n:y:n")), prob = c(0.97, 0.03), replace = TRUE)#
CCHL[CCHL == "n:y:y:n"] = sample(l, length(which(CCHL == "n:y:y:n")), prob = c(0.98, 0.02), replace = TRUE)#
CCHL[CCHL == "n:n:y:n"] = sample(l, length(which(CCHL == "n:n:y:n")), prob = c(0.9, 0.1), replace = TRUE)#

CCHL[CCHL == "y:y:n:n"] = sample(l, length(which(CCHL == "y:y:n:n")), prob = c(0.82, 0.18), replace = TRUE)#
CCHL[CCHL == "y:n:n:n"] = sample(l, length(which(CCHL == "y:n:n:n")), prob = c(0.4, 0.6), replace = TRUE)#
CCHL[CCHL == "n:y:n:n"] = sample(l, length(which(CCHL == "n:y:n:n")), prob = c(0.7, 0.3), replace = TRUE)#
CCHL[CCHL == "n:n:n:n"] = sample(l, length(which(CCHL == "n:n:n:n")), prob = c(0,1), replace = TRUE)#

dag = g

bn = custom.fit(dag, list(
  PMB = matrix(c(0.8, 0.2), ncol = 2, dimnames = list(NULL, l)),
  INT = matrix(c(0.2, 0.8), ncol = 2, dimnames = list(NULL, l)),
  DISC = matrix(c(0.6, 0.4), ncol = 2, dimnames = list(NULL, l)),
  KINK = matrix(c(0.1, 0.9), ncol = 2, dimnames = list(NULL, l)),
  MVS = matrix(c(0.1, 0.9), ncol = 2, dimnames = list(NULL, l)),
  FIO2 = matrix(c(0.2, 0.8), ncol = 2, dimnames = list(NULL, l)),
  APL = matrix(c(0.3, 0.7), ncol = 2, dimnames = list(NULL, l)),
  ANES = matrix(c(0.4, 0.6), ncol = 2, dimnames = list(NULL, l)),
  
  
  SHNT = array(c(0.98, 0.02, 0.8, 0.2, 0.9, 0.1, 0, 1), dim = c(2, 2, 2), dimnames = list(SHNT = l, PMB = l, INT = l)),
  
  PAP = array(c(0.97,0.03, 0, 1), dim = c(2,2),
              dimnames = list(PAP = l, PMB = l)),
  
  TPR = array(c(0.98,0.02, 0.02, 0.98), dim = c(2,2),
              dimnames = list(TPR = l, APL = l)),
  
  VMCH = array(c(0.1,0.9, 0.9, 0.1), dim = c(2,2),
               dimnames = list(VMCH = l, MVS = l)),
  
  VTUB = array(c(0.95, 0.05, 0.8, 0.2, 0.7, 0.3, 0, 1), dim = c(2, 2, 2), dimnames = list(VTUB = l, DISC = l, VMCH = l)),
  
  PRSS = array(c(0.988, 0.012, 0.94, 0.06, 0.98, 0.02, 0.9, 0.1, 0.88, 0.12, 0.4, 0.6, 0.8, 0.2, 0, 1), dim = c(2, 2, 2, 2), dimnames = list(PRSS = l, VTUB = l, INT = l, KINK = l)),
  
  VLNG = array(c(0.988, 0.012, 0.94, 0.06, 0.98, 0.02, 0.9, 0.1, 0.88, 0.12, 0.4, 0.6, 0.8, 0.2, 0.03,0.97), dim = c(2, 2, 2, 2), dimnames = list(VLNG = l, VTUB = l, INT = l, KINK = l)),
  
  VALV = array(c(0.88, 0.12, 0.7, 0.3, 0.6, 0.4, 0, 1), dim = c(2, 2, 2), dimnames = list(VALV = l, VLNG = l, INT = l)),
  
  MINV = array(c(0.88, 0.12, 0.6, 0.4, 0.7, 0.3, 0, 1), dim = c(2, 2, 2), dimnames = list(MINV = l, VLNG = l, INT = l)),
  
  ACO2 = array(c(0.98,0.02, 0.02, 0.98), dim = c(2,2),
               dimnames = list(ACO2 = l, VALV = l)),
  
  PVS = array(c(0.86, 0.14, 0.3, 0.7, 0.8, 0.2, 0, 1), dim = c(2, 2, 2), dimnames = list(PVS = l, VALV = l, FIO2 = l)),
  
  SAO2 = array(c(0.96, 0.04, 0.9, 0.1, 0.6, 0.4, 0.04, 0.96), dim = c(2, 2, 2), dimnames = list(SAO2 = l, PVS = l, SHNT = l)),
  
  ECO2 = array(c(0.94, 0.06, 0.7, 0.3, 0.8, 0.2, 0.03, 0.97), dim = c(2, 2, 2), dimnames = list(ECO2 = l, VLNG = l, ACO2 = l)),
  
  
  CCHL = array(c(0.9964, 0.0036, 0.988, 0.012, 0.994, 0.006, 0.98, 0.02,
                 0.964, 0.036, 0.88, 0.12, 0.94, 0.06, 0.8,0.2,
                 0.982, 0.018, 0.97, 0.03, 0.98, 0.02, 0.9, 0.1,
                 0.82, 0.18, 0.4, 0.6, 0.7, 0.3, 0,1), dim = c(2, 2, 2, 2, 2), dimnames = list(CCHL = l, SAO2 = l, TPR = l, ACO2 = l, ANES = l))))

df<- rbn(bn,1000)

write.csv(df,"TL3_CTest.csv", row.names = FALSE)



  