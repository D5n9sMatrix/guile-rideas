#!/usr/bin/r

# Package Description
# Description
# Parses and returns the ‘DESCRIPTION’ file of a package as a "packageDescription".

# Utility functions return (transformed) parts of that.

# Usage
# packageDescription(pkg, lib.loc = NULL, fields = NULL,
#                    drop = TRUE, encoding = "")
# packageVersion(pkg, lib.loc = NULL)
# packageDate(pkg, lib.loc = NULL,
#             date.fields = c("Date", "Packaged", "Date/Publication", "Built"),
#             tryFormats = c("%Y-%m-%d", "%Y/%m/%d", "%D", "%m/%d/%y"),
#             desc = packageDescription(pkg, lib.loc=lib.loc, fields=date.fields))
# asDateBuilt(built)
# Arguments
# pkg	
# a character string with the package name.

# lib.loc	
# a character vector of directory names of R libraries, or NULL. The default value of NULL corresponds to all libraries currently known. If the default is used, the loaded packages and namespaces are searched before the libraries.

# fields	
# a character vector giving the tags of fields to return (if other fields occur in the file they are ignored).

# drop	
# If TRUE and the length of fields is 1, then a single character string with the value of the respective field is returned instead of an object of class "packageDescription".

# encoding	
# If there is an Encoding field, to what encoding should re-encoding be attempted? If NA, no re-encoding. The other values are as used by iconv, so the default "" indicates the encoding of the current locale.

# date.fields	
# character vector of field tags to be tried. The first for which as.Date(.) is not NA will be returned. (Partly experimental, see Note.)

# tryFormats	
# date formats to try, see as.Date.character().

# desc	
# optionally, a named list with components named from date.fields; where the default is fine, a complete packageDescription() maybe specified as well.

# built	
# for asDateBuilt(), a character string as from packageDescription(*, fields="Built").

# Details
# A package will not be ‘found’ unless it has a ‘DESCRIPTION’ file which contains a valid Version field. Different warnings are given when no package directory is found and when there is a suitable directory but no valid ‘DESCRIPTION’ file.

# An attached environment named to look like a package (e.g., package:utils2) will be ignored.

# packageVersion() is a convenience shortcut, allowing things like if (packageVersion("MASS") < "7.3") { do.things } .

# For packageDate(), if desc is valid, both pkg and lib.loc are not made use of.

# Value
# If a ‘DESCRIPTION’ file for the given package is found and can successfully be read, packageDescription returns an object of class "packageDescription", which is a named list with the values of the (given) fields as elements and the tags as names, unless drop = TRUE.

# If parsing the ‘DESCRIPTION’ file was not successful, it returns a named list of NAs with the field tags as names if fields is not null, and NA otherwise.

# packageVersion() returns a (length-one) object of class "package_version".

# packageDate() will return a "Date" object from as.Date() or NA.

# asDateBuilt(built) returns a "Date" object or signals an error if built is invalid.

# Note
# The default behavior of packageDate(), notably for date.fields, is somewhat experimental and may change. Using date.fields = <string> single

# See Also
# read.dcf

# Examples

packageDescription("stats")
packageDescription("stats", fields = c("Package", "Version"))

packageDescription("stats", fields = "Version")
packageDescription("stats", fields = "Version", drop = FALSE)

if(packageVersion("MASS") < "7.3.29")
  message("you need to update 'MASS'")

pu <- packageDate("utils")
str(pu)
stopifnot(identical(pu, packageDate(desc = packageDescription("utils"))),
          identical(pu, packageDate("stats"))) # as "utils" and "stats" are
                                   # both 'base R' and "Built" at same time