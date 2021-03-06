% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/deck-to-chunk.r
\name{codechunk2deck}
\alias{codechunk2deck}
\title{Convert chunk files to rmd decks.}
\usage{
codechunk2deck(chunkfile, deckdir, title = "", subtitle = "", author = "",
  job = "", replace = FALSE, ...)
}
\arguments{
\item{chunkfile}{Path to chunk file.}

\item{deckdir}{Directory in which the Rmd template will be created (or
in which an \emph{index.Rmd} file is present)}

\item{title}{Title string to be substituted into the template.}

\item{subtitle}{Subtitle string to be substituted into the template.}

\item{author}{Author name to be substituted into the template. Taken from
the DESCRIPTION file if not provided.}

\item{job}{Job or address to be substituted into the template.}

\item{replace}{Replace an existing index.Rmd file}

\item{...}{Further arguments.}
}
\description{
Convert chunk files to rmd decks.
}

