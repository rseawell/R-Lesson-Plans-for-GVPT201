#####HW 6 example#######

#Works on R 4.4.1 as of August 7, 2024

library(RCPA3)

#Question 1

#create a function to calculate standard error

se = function(p, n){
    x= sqrt(p*(1-p))/sqrt(n)
    return(x)
    
}

#example: let's say sample proportion is 0.5 and sample size is 6400
se(0.5, 6400) #the standard error is 0.00625

#####Alternatively, you can also calculate it manually using the formula
#sqrt(p*(1-p))/sqrt(n)
sqrt(0.5*(1-0.5))/sqrt(6400) #the answer is the same. Use which ever method you want


#For the fifth blank in question 1 example:
#let's say our sample proportion is 0.5 and standard error is 0.00625, calculate n:
(0.5*(1-0.5))/(0.00625*0.00625) #gives us the sample size of 6400

#Question 2

#Let's say standard deviation is 54 and sample size is 2500

# we know that se = sd/sqrt(n)

#You can create a function: 
se.sd = function(sd, n){
    x= sd/sqrt(n)
    return(x)
    
}
se.sd(54, 2500) #1.08

#Or you can do it manually
54/sqrt(2500) #1.08

#For the final blank that asks for sample size: let's say sd is 54 and se is 1.08
(54/1.08)^2  #the sample size is 2500


#Question 3A
#For 3 A, include all the values under CDF into an object like below:
#Here we only provide the first and the second one:
prob.vector <- c(0.005, 0.025)
z_values <- qnorm(prob.vector, mean = 0, sd=1) #And then, you use qnorm function
z_values #This gives you the z-score.

#Question 3B
#you can use the same prob.vector object you create for q 3A:
#Then, you use the prob.vector as first argument and df s second argument in your function
t5_values <- qt(prob.vector, df=5)
t5_values
#Here we provide example for the first two rows in your homework for df =5. You can create
#separate objects for df=25 and df=200

#Question 4A
#Example: What is the probability of drawing a zscore that is 1.76 or higher?
pnorm(1.76, mean = 0, sd=1, lower.tail = F) #p=0.04

#Example: What is the probability of drawing a z-score that is -1.76 or lower?
pnorm(-1.89, mean = 0, sd=1, lower.tail = T) #because the question say lower, so we do lower.tail=T, which is the
#default argument in the function. the p-value here is 0.029. 

#Example: whats the probability of drawing a z-score that is -1.76 or lower or is 1.76 or greater?
pnorm(-1.76, mean = 0, sd=1) + pnorm(1.76, mean = 0, sd=1, lower.tail=F)
#the probability is 0.078

#Question 5
#sample proportion is 0.5
#let's say margin of error is +/- 0.04
(1.96^2*0.25)/(0.04^2) #600 is the sample size
#what if we need to find the margin of error: 
(1.96*sqrt(0.25))/sqrt(600) #0.04