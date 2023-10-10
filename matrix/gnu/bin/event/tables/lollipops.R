#!/usr/bin/r

# Specifying Complex Plot Arrangements
# Description
# layout divides the device up into as many rows and columns as there are in matrix mat, with the column-widths and the row-heights specified in the respective arguments.

# Usage
# layout(mat, widths = rep.int(1, ncol(mat)),
#        heights = rep.int(1, nrow(mat)), respect = FALSE)

# layout.show(n = 1)
# lcm(x)
# Arguments
# mat	
# a matrix object specifying the location of the next N figures on the output device. Each value in the matrix must be 0 or a positive integer. If N is the largest positive integer in the matrix, then the integers {1, …, N-1} must also appear at least once in the matrix.

# widths	
# a vector of values for the widths of columns on the device. Relative widths are specified with numeric values. Absolute widths (in centimetres) are specified with the lcm() function (see examples).

# heights	
# a vector of values for the heights of rows on the device. Relative and absolute heights can be specified, see widths above.

# respect	
# either a logical value or a matrix object. If the latter, then it must have the same dimensions as mat and each value in the matrix must be either 0 or 1.

# n	
# number of figures to plot.

# x	
# a dimension to be interpreted as a number of centimetres.

# Details
# Figure i is allocated a region composed from a subset of these rows and columns, based on the rows and columns in which i occurs in mat.

# The respect argument controls whether a unit column-width is the same physical measurement on the device as a unit row-height.

# There is a limit (currently 200) for the numbers of rows and columns in the layout, and also for the total number of cells (10007).

# layout.show(n) plots (part of) the current layout, namely the outlines of the next n figures.

# lcm is a trivial function, to be used as the interface for specifying absolute dimensions for the widths and heights arguments of layout().

# Value
# layout returns the number of figures, N, see above.

# Warnings
# These functions are totally incompatible with the other mechanisms for arranging plots on a device: par(mfrow), par(mfcol) and split.screen.

# Author(s)
# Paul R. Murrell

# References
# Murrell, P. R. (1999). Layouts: A mechanism for arranging plots on a page. Journal of Computational and Graphical Statistics, 8, 121–134. doi: 10.2307/1390924.

# Chapter 5 of Paul Murrell's Ph.D. thesis.

# Murrell, P. (2005). R Graphics. Chapman & Hall/CRC Press.

# See Also
# par with arguments mfrow, mfcol, or mfg.

# Examples

def.par <- par(no.readonly = TRUE) # save default, for resetting...

## divide the device into two rows and two columns
## allocate figure 1 all of row 1
## allocate figure 2 the intersection of column 2 and row 2
layout(matrix(c(1,1,0,2), 2, 2, byrow = TRUE))
## show the regions that have been allocated to each plot
layout.show(2)

## divide device into two rows and two columns
## allocate figure 1 and figure 2 as above
## respect relations between widths and heights
nf <- layout(matrix(c(1,1,0,2), 2, 2, byrow = TRUE), respect = TRUE)
layout.show(nf)

## create single figure which is 5cm square
nf <- layout(matrix(1), widths = lcm(5), heights = lcm(5))
layout.show(nf)


##-- Create a scatterplot with marginal histograms -----

x <- pmin(3, pmax(-3, stats::rnorm(50)))
y <- pmin(3, pmax(-3, stats::rnorm(50)))
xhist <- hist(x, breaks = seq(-3,3,0.5), plot = FALSE)
yhist <- hist(y, breaks = seq(-3,3,0.5), plot = FALSE)
top <- max(c(xhist$counts, yhist$counts))
xrange <- c(-3, 3)
yrange <- c(-3, 3)
nf <- layout(matrix(c(2,0,1,3),2,2,byrow = TRUE), c(3,1), c(1,3), TRUE)
layout.show(nf)

par(mar = c(3,3,1,1))
plot(x, y, xlim = xrange, ylim = yrange, xlab = "", ylab = "")
par(mar = c(0,3,1,1))
barplot(xhist$counts, axes = FALSE, ylim = c(0, top), space = 0)
par(mar = c(3,0,1,1))
barplot(yhist$counts, axes = FALSE, xlim = c(0, top), space = 0, horiz = TRUE)

par(def.par)  #- reset to default