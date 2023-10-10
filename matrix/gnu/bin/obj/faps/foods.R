#!/usr/bin/r

# Rounding of Numbers
# Description
# ceiling takes a single numeric argument x and returns a numeric vector containing the smallest integers not less than the corresponding elements of x.

# floor takes a single numeric argument x and returns a numeric vector containing the largest integers not greater than the corresponding elements of x.

# trunc takes a single numeric argument x and returns a numeric vector containing the integers formed by truncating the values in x toward 0.

# round rounds the values in its first argument to the specified number of decimal places (default 0). See ‘Details’ about “round to even” when rounding off a 5.

# signif rounds the values in its first argument to the specified number of significant digits. Hence, for numeric x, signif(x, dig) is the same as round(x, dig - ceiling(log10(abs(x)))). For complex x, this is not the case, see the ‘Details’.

# Usage
# ceiling(x)
# floor(x)
# trunc(x, ...)

# round(x, digits = 0)
# signif(x, digits = 6)
# Arguments
# x	
# a numeric vector. Or, for round and signif, a complex vector.

# digits	
# integer indicating the number of decimal places (round) or significant digits (signif) to be used. Negative values are allowed (see ‘Details’).

# ...	
# arguments to be passed to methods.

# Details
# These are generic functions: methods can be defined for them individually or via the Math group generic.

# Note that for rounding off a 5, the IEC 60559 standard (see also ‘IEEE 754’) is expected to be used, ‘go to the even digit’. Therefore round(0.5) is 0 and round(-1.5) is -2. However, this is dependent on OS services and on representation error (since e.g. 0.15 is not represented exactly, the rounding rule applies to the represented number and not to the printed number, and so round(0.15, 1) could be either 0.1 or 0.2).

# Rounding to a negative number of digits means rounding to a power of ten, so for example round(x, digits = -2) rounds to the nearest hundred.

# For signif the recognized values of digits are 1...22, and non-missing values are rounded to the nearest integer in that range. Complex numbers are rounded to retain the specified number of digits in the larger of the components. Each element of the vector is rounded individually, unlike printing.

# These are all primitive functions.

# S4 methods
# These are all (internally) S4 generic.

# ceiling, floor and trunc are members of the Math group generic. As an S4 generic, trunc has only one argument.

# round and signif are members of the Math2 group generic.

# Warning
# The realities of computer arithmetic can cause unexpected results, especially with floor and ceiling. For example, we ‘know’ that floor(log(x, base = 8)) for x = 8 is 1, but 0 has been seen on an R platform. It is normally necessary to use a tolerance.

# Rounding to decimal digits in binary arithmetic is non-trivial (when digits != 0) and may be surprising. Be aware that most decimal fractions are not exactly representable in binary double precision. In R 4.0.0, the algorithm for round(x, d), for d > 0, has been improved to measure and round “to nearest even”, contrary to earlier versions of R (or also to sprintf() or format() based rounding).

# References
# Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988) The New S Language. Wadsworth & Brooks/Cole.

# The ISO/IEC/IEEE 60559:2011 standard is available for money from https://www.iso.org.

# The IEEE 754:2008 standard is more openly documented, e.g, at https://en.wikipedia.org/wiki/IEEE_754.

# See Also
# as.integer. Package round's roundX() for several versions or implementations of rounding, including some previous and the current R version (as version = "3d.C").

# Examples

round(.5 + -2:4) # IEEE / IEC rounding: -2  0  0  2  2  4  4
## (this is *good* behaviour -- do *NOT* report it as bug !)

( x1 <- seq(-2, 4, by = .5) )
round(x1) #-- IEEE / IEC rounding !
x1[trunc(x1) != floor(x1)]
x1[round(x1) != floor(x1 + .5)]
(non.int <- ceiling(x1) != floor(x1))

x2 <- pi * 100^(-1:3)
round(x2, 3)
signif(x2, 3)