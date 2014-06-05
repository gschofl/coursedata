#' @include helpers.r
#' @include initialise-vignette.r
NULL

copy_dir <- function(from, to) {
  if (!(file.exists(to))) {
    dir.create(to, recursive = TRUE)
  }
  message("Copying files to ", to, "...")
  file.copy(list.files(from, full.names = TRUE), to, recursive = TRUE)
}

libs <- c("XML", "lubridate", "ggplot2")
require_libs <- function(libs) {
  if (length(libs) > 1 && nzchar(libs)) {
    paste0("require(\"", libs, "\")", collapse = "\n")
  } else {
    ""
  }
}

template <- function(deckdir, title = "", subtitle = "", author = "", job = "",
                     libs = "", slides = "") {
  index_file <- dir(path = deckdir, pattern = "index.Rmd", full.names = TRUE)
  if (length(index_file) == 0) {
    stop("No 'index.Rmd' template found")
  }
  tmp <- readLines(index_file)
  tmp <- sub("@title@", quotify(title), tmp)
  tmp <- sub("@subtitle@", quotify(subtitle), tmp)
  tmp <- sub("@author@", quotify(author %||% getAuthor()), tmp)
  tmp <- sub("@job@", quotify(job), tmp)
  tmp <- sub("@required@", require_libs(libs), tmp)
  tmp <- sub("@slides@", slides, tmp)
  writeLines(tmp, index_file)
  return(index_file)
}

author_deck <- function(deckdir,
                        title = "",
                        subtitle = "",
                        author = "",
                        job = "",
                        libs = "",
                        slides = "## First Slide\n\n---\n\n",
                        open_rmd = TRUE,
                        replace = FALSE,
                        scaffold = system.file("templates", "slides", package = "coursedata")) {
  message("Creating slide directory at ", deckdir, "...")
  copy_dir(scaffold, deckdir)
  if (replace) {
    file.copy(file.path(scaffold, "index.Rmd"), deckdir, overwrite = TRUE)
  }
  message("Inserting templates ...")
  index_file <- template(deckdir, title = title, subtitle = subtitle, author = author,
                         job = job, libs = libs, slides = slides)
  if (open_rmd) {
    message("Opening slide deck...")
    file.edit(index_file)
  } else {
    index_file
  }
}

#' Intitialise (or open) an Rmd deck.
#'
#' This function creates a deck directory and initialises an Rmd slidify
#' template for the user to edit.
#'
#' @param deckdir Directory in which the Rmd template will be created (or
#' in which an \emph{index.Rmd} file is present)
#' @param title Title string to be substituted into the template.
#' @param subtitle Subtitle string to be substituted into the template.
#' @param author Author name to be substituted into the template. Taken from
#' the DESCRIPTION file if not provided.
#' @param job Job or address to be substituted into the template.
#' @param slides Slides to be substituted into the template.
#' @param open_rmd Open the index file for edition after it has been created.
#' @export
initialise_deck <- function(deckdir,
                            title = "",
                            subtitle = "",
                            author = "",
                            job = "",
                            libs = "",
                            slides = "## First Slide\n\n---\n\n",
                            open_rmd = TRUE,
                            replace = FALSE) {
  assert_that(require(slidify), require(slidifyLibraries), require(knitr))
  cwd <- getwd()
  on.exit(setwd(cwd))
  indexfile <- file.path(deckdir, "index.Rmd")
  if (file.exists(indexfile) && replace) {
    unlink(indexfile)
  }
  if (!file.exists(indexfile)) {
    author_deck(deckdir, title = title, subtitle = subtitle, author = author,
                job = job, libs = libs, slides = slides, open_rmd = open_rmd,
                replace = replace)
  } else {
    message("Opening slide deck...")
    file.edit(indexfile)
  }
  indexfile
}
