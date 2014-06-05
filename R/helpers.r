#' @include utils.r
NULL

#' markUp
#'
#' @keywords internal
#' @export
#' @noRd
markUp <- function(file) {
  lines <- readLines(file)
  bold.i <- grep("\\*\\*.[^*]+\\*\\*", lines)
  ital.i <- grep("[[:blank:]]_.[^_]+_[[:punct:]]?", lines)
  to_bold <- lines[bold.i]
  to_ital <- lines[ital.i]
  embolden <- function(val) {
    paste0("<span style=font-weight:bold;'>", val, "</span>")
  }
  italizise <- function(val) {
    paste0(" <span style='font-style:italic;'>", val, "</span>")
  }
  if (length(to_bold) > 0) {
    lines[bold.i] <- gsub("\\*\\*(.[^*]+)\\*\\*", embolden("\\1"), to_bold)
  }
  if (length(to_ital) > 0) {
    lines[ital.i] <- gsub(" _(.[^_]+)_", italizise("\\1"), to_ital)
  }
  writeLines(lines, con=file)
}

#' markDown
#'
#' @keywords internal
#' @export
#' @noRd
markDown <- function(file) {
  lines <- readLines(file)
  bold.i <- grep("<span.*?bold;'>.*?</span>", lines)
  ital.i <- grep("<span.*?italic;'>.*?</span>", lines)
  from_bold <- lines[bold.i]
  from_ital <- lines[ital.i]
  debolden <- function(val) {
    paste0("**", val, "**")
  }
  deitalizise <- function(val) {
    paste0("_", val, "_")
  }
  if (length(from_bold) > 0) {
    lines[bold.i] <- gsub("<span.*?bold;'>(.*?)</span>", debolden("\\1"), from_bold)
  }
  if (length(from_ital) > 0) {
    lines[ital.i] <- gsub("<span.*?italic;'>(.*?)</span>", deitalizise("\\1"), from_ital)
  }
  writeLines(lines, con=file)
}
