#import library
library(tidyverse)
#To solve quadratic equation

solve_quadratic <- function(a, b, c) {
  
  # Calculate the discriminant
  
  discriminant <- b^2 - 4 * a * c
  
  if (discriminant > 0) {
    
    # Two distinct real roots
    
    root1 <- (-b + sqrt(discriminant)) / (2 * a)
    
    root2 <- (-b - sqrt(discriminant)) / (2 * a)
    
    print(paste("The real roots are:", root1, "and", root2))
    
    return(c(root1, root2))
    
  } else if (discriminant == 0) {
    
    # One real root
    
    root <- -b / (2 * a)
    
    print(paste("The real root is:", root))
    
    return(root)
    
  } else {
    
    # Complex roots
    
    real_part <- -b / (2 * a)
    
    imaginary_part <- sqrt(-discriminant) / (2 * a)
    
    root1 <- complex(real = real_part, imaginary = imaginary_part)
    
    root2 <- complex(real = real_part, imaginary = -imaginary_part)
    
    print(paste("The complex roots are:", root1, "and", root2))
    
    return(c(root1, root2))
  }
}





# Example:
a <- 1
b <-2
c <-1
roots <- solve_quadratic(a, b, c)


a <- 1
b <- -3
c <- 2
roots <- solve_quadratic(a, b, c)
