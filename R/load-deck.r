#' @include utils.r
NULL

#' Load a html5 deck
#'
#' This function lets you choose among html5 presentations available
#' in the package \code{pkg}, and loads it into your browser.
#'
#' @param pkg Package from which to load slides.
#' @export
load_deck <- function(pkg = "IDA") {
  pkg <- match.arg(pkg, c("IDA", "SDA"))
  slides_dir <- system.file("slides", package = pkg)
  decks <- dir(slides_dir, full.names = TRUE)
  cat("Load Deck:\n")
  cat(sprintf("%s) %s", seq_along(decks), basename(decks)), sep="\n")
  while (TRUE) {
    msg <- "Which deck shall we load [or q(uit)]: "
    which <- tolower(usplit(gsub('\\s+', '', readline(msg)), ''))
    if (which[1] == 'q') {
      return(NULL)
    } else if (!any(is.na(idx <- suppressWarnings(as.numeric(which))))
               && max(idx) <= length(decks)
               && min(idx) > 0) {
      deck <- decks[idx]
      break
    } else {
      message("Please submit a number between 1 and ", length(decks))
    }
  }

  html <- dir(deck, pattern = "index.html", full.names = TRUE)
  if (!nzchar(html)) {
    stop("No index file available")
  }
  browseURL(html)
}

#' Clear chached data in a deckdir
#'
#' @param deckdir Deck directory.
#' @keywords internal
#' @export
clear_cache <- function(deckdir) {
  cache <- file.path(deckdir, "assets", "cache")
  unlink(dir(path = cache, full.names = TRUE))
}
