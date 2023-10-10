#!/usr/bin/r


# Grouping Permutation
# Description
# grouping returns a permutation which rearranges its first argument such that identical values are adjacent to each other. Also returned as attributes are the group-wise partitioning and the maximum group size.

# Usage
# grouping(...)
# Arguments
# ...	
# a sequence of numeric, character or logical vectors, all of the same length, or a classed R object.

# Details
# The function partially sorts the elements so that identical values are adjacent. NA values come last. This is guaranteed to be stable, so ties are preserved, and if the data are already grouped/sorted, the grouping is unchanged. This is useful for aggregation and is particularly fast for character vectors.

# Under the covers, the "radix" method of order is used, and the same caveats apply, including restrictions on character encodings and lack of support for long vectors (those with 2^31 or more elements). Real-valued numbers are slightly rounded to account for numerical imprecision.

# Like order, for a classed R object the grouping is based on the result of xtfrm.

# Value
# An object of class "grouping", the representation of which should be considered experimental and subject to change. It is an integer vector with two attributes:

# ends	
# subscripts in the result corresponding to the last member of each group

# maxgrpn	
# the maximum group size

# See Also
# order, xtfrm.

# Examples

(ii <- grouping(x <- c(1, 1, 3:1, 1:4, 3), y <- c(9, 9:1), z <- c(2, 1:9)))
## 6  5  2  1  7  4 10  8  3  9
rbind(x, y, z)[, ii]