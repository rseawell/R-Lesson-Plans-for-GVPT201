#################################################
###                                           ###
###       GVPT 201                            ###
###       Making Controlled Comparisons       ###
###       Oct 4, 2024                         ###
#################################################

###########################################################################################################################################
#start by clearing your workspace
rm(list=ls())

#Now let's set your working directory
getwd()
#Now, let's set your working directory
setwd()

#Finally, let's load the required package
library("RCPA3")

#################################################################################################################################################

#Let's say our independent variable is X
#Our dependent variable is Y
#And, our control variable is Z

#What are control variables? Let's say it is an alternative cause

#What happens when we analyze the relationship between X and Y, while controlling for Z?

#They could have a spurious relationship; when researcher controls for Z, X and Y's relationship disappears or becomes weaker

#The could have an additive relationship; when two sets of meaningful relationships exist. X and Y maintain their relationship
#Z still helps to explain Y. 

#They could have an interactive relationship; when the relationship between X and Y depends on the value of Z. 
#The strength or tendency of the relationship is different for one value of Z than for its other value

#################################################################################################################################################


#Cross tab analysis with a control variable

#What other factors, besides party id can account for difference in public opinion about the death penalty?
#Let's say we assume that men favor death penalty more that women do.

crosstabC(dv=death.penalty, iv=partyid3, w=wt, z=gender, data = nes,
          dvlabs = c("Favor Strongly", "Favor", "Oppose", "Oppose strongly"),
          ivlabs = c("Dem", "Ind", "Rep"), digits = 2, compact = T)

#what type of relationship is this?
#partisan effect appear to be stronger among males than among females
#is this relationship spurious? No.
#But is it additive or interactive?

#Let's look at the plot more clearly through a line plot
crosstabC(dv=death.penalty, iv=partyid3, w=wt, z=gender, data = nes,
          dvlabs = c("Favor Strongly", "Favor", "Oppose", "Oppose strongly"),
          ivlabs = c("Dem", "Ind", "Rep"), digits = 2, plot = "line")


# Mean Comparison analysis with a control variable

#Let's see the relationship between election of judges and the legal climate of the
#state controlling for whether a state has enacted right to work laws.

compmeansC(dv=legalclimate, iv=judges.elected, z=rtw, data=states,
           ivlabs = c("Appointed", "Elected"), plot = "line")

#What type of relationship is this?


#Controlled comparison analysis with a interval level control variable

#we first transform to make ordinal version

states$covid.resp.3cat <- transformC(type = "cut", x=states$covid.response.mean,
                                     groups = 3, confirm = F)
levels(states$covid.resp.3cat)<- c("Light mean", "Moderate mean", "Strict mean")

compmeansC(dv=covid.cases.per1000, iv=medicaid.expansion,
           z=covid.resp.3cat, data = states, digits = 2, plot = "line")

#what type of relationship do you think this is?
