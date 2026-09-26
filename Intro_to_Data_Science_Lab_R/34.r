# 1. Create different types of variables and display values and data types
num_var <- 25
char_var <- "R Programming"
log_var <- TRUE

cat("Numeric variable:", num_var, "\n")
cat("Data type:", class(num_var), "\n\n")

cat("Character variable:", char_var, "\n")
cat("Data type:", class(char_var), "\n\n")

cat("Logical variable:", log_var, "\n")
cat("Data type:", class(log_var), "\n\n")

# 2. Create a vector of numbers and find sum, mean, maximum, minimum, and length
vec <- c(10, 20, 30, 40, 50)

cat("Vector:", vec, "\n")
cat("Sum:", sum(vec), "\n")
cat("Mean:", mean(vec), "\n")
cat("Maximum:", max(vec), "\n")
cat("Minimum:", min(vec), "\n")
cat("Length:", length(vec), "\n\n")

# 3. Generate Fibonacci series for N terms
n <- 10
fib <- numeric(n)

if (n >= 1) fib[1] <- 0
if (n >= 2) fib[2] <- 1

for (i in 3:n) {
  fib[i] <- fib[i - 1] + fib[i - 2]
}

cat("Fibonacci series for", n, "terms:\n")
print(fib)
cat("\n")

# 4. Find factorial of a given number
num <- 5
fact <- 1

for (i in 1:num) {
  fact <- fact * i
}

cat("Factorial of", num, "is:", fact, "\n\n")

# 5. Check whether a given number is prime or not
check_num <- 29
is_prime <- TRUE

if (check_num <= 1) {
  is_prime <- FALSE
} else if (check_num == 2) {
  is_prime <- TRUE
} else {
  for (i in 2:sqrt(check_num)) {
    if (check_num %% i == 0) {
      is_prime <- FALSE
      break
    }
  }
}

if (is_prime) {
  cat(check_num, "is a prime number.\n")
} else {
  cat(check_num, "is not a prime number.\n")
}