compactList <- function(x) {
  slice(x, vapply(x, Negate(is.null), FALSE))
}

notNA <- Negate(is.na)

slice <- function(x, i) {
  xs <- x[i]
  attributes(xs) <- lapply(attributes(x), `[`, i)
  xs
}

combine <- function(...) {
  x <- c(...)
  attributes(x) <-
    as.list(Reduce(function(a, b) {
      rbind(data.frame(a, stringsAsFactors = FALSE),
            data.frame(b, stringsAsFactors = FALSE))
    }, lapply(list(...), attributes)))
  x
}

trim <- function(x, trim = '\\s+') {
  gsub(paste0("^", trim, "|", trim, "$"), '', x)
}

usplit <- function(x, split, ...) unlist(strsplit(x = x, split = split, ...))


