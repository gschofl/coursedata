read_description <- function() {
  desc <- read.dcf("DESCRIPTION")
  desc_list <- setNames(as.list(desc[1, ]), colnames(desc))
  lapply(desc_list, trim)
}

getPackage <- function() {
  read_description()$Package
}

getAuthor <- function(x) {
  x <- as.person(read_description()$`Authors@R`)
  first <- gsub("^[\"\']|[\"\']$", "", unlist(x$given))
  last <- gsub("^[\"\']|[\"\']$", "", unlist(x$family))
  paste(first, last, sep = " ", collapse = ", ")
}

getEmail <- function(x) {
  x <- as.person(read_description()$`Authors@R`)
  if (length(x) > 1) {
    x <- x[[which(unlist(lapply(x$role, Compose(any, grepl), pattern = 'cre')))]]
  }
  sub("@@", "@", x$email)
}

quotify <- function(x) {
  if (grepl('^((\\")|\').[^\\"]+((\\")|\')$', x)) {
    x
  } else if (grepl("\"", x)) {
    wrap(x, "'")
  } else {
    wrap(x)
  }
}

#' Intitialise (onr open) an Rnw vignette.
#'
#' This function creates a 'vignettes' directory and initialises an Rnw vignette
#' template for the user to edit.
#'
#' @param pkg Root directory of the package for which the vignette is going to
#' be created. Must contain a valid DESCRIPTION file
#' @param title Title of the vignette.
#' @param short_title File name of the vignette.
#' @param address The authors address.
#' @param open_rnw Whether to open the Rnw file created for editing.
#' @export
initialise_vignette <- function(pkg = ".",
                                title = "My Vignette",
                                short_title = gsub("\\s+", "-", title),
                                address = "",
                                open_rnw = TRUE) {
  template <- system.file("templates", "vignettes", "template.Rnw", package = "coursedata")
  bioc_sty <- system.file("templates", "vignettes", "BioconductorVignette.sty", package = "coursedata")
  if (length(dir(pkg, pattern = "DESCRIPTIONS") == 0)) {
    stop("'", pkg, "' is not the root directory of a valid R package")
  }
  tmp <- readLines(template)
  tmp <- gsub("@title@", title, tmp)
  tmp <- gsub("@shorttitle@", short_title, tmp)
  tmp <- gsub("@package@", getPackage(), tmp)
  tmp <- gsub("@author@", getAuthor(), tmp)
  tmp <- gsub("@address@", address, tmp)
  tmp <- gsub("@email@", getEmail(), tmp)
  if (!file.exists("vignettes")) {
    dir.create("vignettes")
  }
  outfile <- file.path("vignettes", paste0(short_title, '.Rnw'))
  writeLines(tmp, con = outfile, sep = "\n")
  file.copy(from = bioc_sty, to = "vignettes/", overwrite = FALSE)
  if (open_rnw) {
    message("Opening vignette source ...")
    file.edit(outfile)
  }
}
