con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
content <- readLines(con)
x <- c(content[10], content[20], content[30], content[100])
nchar(x)