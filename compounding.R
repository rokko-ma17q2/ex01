# ex01: 
#   Read carefully and complete the code as instructed.
#   The places where you need to edit are indicated with **[EXERCISE]**
#
# Tip: 
#   You can run code within a Code Section that starts with # ---- using 
#   a keyboard shortcut, "Ctrl+Alt+T" or "Command+Option+T".
#

# 1. Interest rate ------------------------------------------------------
# 
# Let's consider the Problem 2 of [17MA2B] again. The initial deposit is 1000
# dollars and the annual interest rate is 6%. We save this information in the
# following variables (objects).

deposit <- 1000
rate_annual <- 0.06

num_months <- 12
num_days <- 365


# **[EXERCISE]**
#   Now you can compute the monthly and daily interest rates.
#   Complete the following expressions.

rate_monthly <- 
rate_daily <- 


# 2. Compounding ----------------------------------------------------------
# 
# In the case of monthly compounding, the amount you have in one year from the
# time of depositing and the effective interest rate can be computed by the following 
# code.

compounded_monthly <- deposit * (1 + rate_monthly) ^ num_months
eair_monthly <- compounded_monthly / deposit - 1


# **[EXERCISE]**
#   Complete the following code to compute the corresponding amount in the case 
#   of daily compounding and the effective interest rate.

compounded_daily <- deposit * (1 + rate_daily) ^ num_days
eair_daily <- compounded_daily / deposit - 1


# **[EXERCISE]**
#   Write a line of code to verify that the effective rate of monthly compounding 
#   is smaller than that of daily compounding.





# 3. More frequent compounding --------------------------------------------
# 
# Now we have a conjecture that the more frequent the compunding becomes, the 
# more interest income we get even if the annual nominal rate is fixed. 
# We also guess that, if the interest is compounded infinitely often then the 
# return will be infinitely large. Let's check these conjectures.


# **[EXERCISE]**
#   Since we need to iterate above computation many times, we will define a
#   function that computes the effective annual interest rate (`eair`) for a given 
#   annual interest rate, `r` and a given number of compounding, `n`. Complete the 
#   below function to achieve this.


#' Effective Annual Interest Rate
#'
#' @param r nominal annual interest rate
#' @param n number of compounding within a year
#' @return effective annual interest rate
eair <- function(r, n) {
  # Complete the definition.
  effective_rate <- 
  effective_rate
}


# Verify code with stopifnot; compare the return values of `eair(r, n)`
# with `eair_monthly` and `eair_daily` obtained earlier in the exercise.
# It is a good practice to write test code. Here is an example:

stopifnot(
  all.equal(eair(rate_annual, num_months), eair_monthly),
  all.equal(eair(rate_annual, num_days), eair_daily)
)



# 4. Simulation -----------------------------------------------------------
#
# Let's compute effective rates for 1000 values of number of compounding
# starting from 1 up until 1000. 

N = 1000
numbers_of_compounding <- 1:N

# **[EXERCISE]**
#   Compute the vector of 1000 effective_rates by using eair() function. 
#   Notice that `eair()` function accepts a vector as an argument.
effective_rates <- 

# Plotting
pdf("4-compounding.pdf")
plot(numbers_of_compounding, effective_rates, type = 'l')
dev.off()


# 5. Limit ----------------------------------------------------------------
#
# The fist conjecture we made in Section 3 seems to be correct but the second
# does not. The effective rates seem to converge to a finite value as the number 
# of compounding becomes large. As a matter of fact, this is exp(rate_annual) - 1. 
# Observe that the printed value is positive and very small.
# Notice that 1.911228e-06 means that it's approximately 1.911228 times 10^(-6).

print((exp(rate_annual) - 1) - effective_rates[N])



# 6. Plotting with limit --------------------------------------------------
#
# To see if the simulation result converges to the line as N -> Inf, let's plot 
# both the compounding curve and horizontal line at exp(rate_annual) - 1 on a 
# single figure.

pdf("6-limit.pdf")
plot(numbers_of_compounding, effective_rates, type = 'l')
lines(numbers_of_compounding, rep(exp(rate_annual) - 1, N), col = 'red')
dev.off()

