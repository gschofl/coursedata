#' @include utils.r
NULL

#' Convert chunk files to rmd decks.
#'
#' @param chunkfile Path to chunk file.
#' @param deckdir Directory in which the Rmd template will be created (or
#' in which an \emph{index.Rmd} file is present)
#' @param title Title string to be substituted into the template.
#' @param subtitle Subtitle string to be substituted into the template.
#' @param author Author name to be substituted into the template. Taken from
#' the DESCRIPTION file if not provided.
#' @param job Job or address to be substituted into the template.
#' @param replace Replace an existing index.Rmd file
#' @param ... Further arguments.
#' @export
codechunk2deck <- function(chunkfile, deckdir, title = "", subtitle = "",
                           author = "", job = "", replace = FALSE, ...) {
  lines <- readLines(chunkfile)
  fm <- frontmatter_from_chunks(lines)
  slides <- slides_from_chunks(lines)
  indexfile <- initialise_deck(deckdir, title = fm$title, subtitle = fm$subtitle,
                               author = fm$author, job = fm$job, libs = fm$libs,
                               slides = slides, replace = replace, ...)
  indexfile
}

## patterns: title, subtitle, author, job
pt <- list(tfc  = "^#t# (.*)$",
           sfc  = "^#s# (.*)$",
           afc  = "^#a# (.*)$",
           jfc  = "^#j# (.*)$",
           rfc  = "^#r# (.*)$",
           tfd  = "^title\\s{7}: (.*)$",
           sfd  = "^subtitle\\s{4}: (.*)$",
           afd  = "^author\\s{6}: (.*)$",
           jfd  = "^job\\s{9}: (.*)$",
           prm  = "^#{3} ?(.?[^:]*): ?(.?[^\\(]*) ?\\(?(.?[^\\)]*)\\)?$",
           scnd = "^#{3} ((?!.*:)[^\\(]*) ?\\(?(.?[^\\)]*)\\)?$",
           chnk = "^```\\{r ?(.*)\\}$",
           exr  = "## ([Ee]xercise.?\\d+).*$")

frontmatter_from_chunks <- function(lines) {
  title    <- sub(pt$tfc, "\\1", grep(pt$tfc, lines, value = TRUE)) %||% ""
  subtitle <- sub(pt$sfc, "\\1", grep(pt$sfc, lines, value = TRUE)) %||% ""
  author   <- sub(pt$afc, "\\1", grep(pt$afc, lines, value = TRUE)) %||% getAuthor()
  job      <- sub(pt$jfc, "\\1", grep(pt$jfc, lines, value = TRUE)) %||% ""
  libs     <- trim(strsplit(sub(pt$rfc, "\\1", grep(pt$rfc, lines, value = TRUE)),
                            split = ",")[[1]]) %||% ""
  list(title = title, subtitle = subtitle, author = author, job = job, libs = libs)
}

frontmatter_from_deck <- function(lines) {
  title    <- sub(pt$tfd, "\\1", grep(pt$tfd, lines, value = TRUE))
  subtitle <- sub(pt$sfd, "\\1", grep(pt$sfd, lines, value = TRUE))
  author   <- sub(pt$afd, "\\1", grep(pt$afd, lines, value = TRUE))
  job      <- sub(pt$jfd, "\\1", grep(pt$jfd, lines, value = TRUE))
  sprintf("###\n#t# %s\n#s# %s\n#a# %s\n#j# %s\n###\n", title, subtitle, author, job)
}

# the defining minimal pattern for a chunk:
#
# ### Slide title: chunk-tag (chunk-opts)
#
# #' Stuff that goes into the slide
# #' Stuff that goes into the slide
# # comment that goes into the chunk
# code
# code
#
# ### chunk-tag (chunk-opts)
# code
# code
#
chunkify <- function(chunk) {
  ## split into subchunks
  chnk_idx <- c(1, grep(pt$scnd, chunk, perl = TRUE))
  chnk_lines <- chunk[chnk_idx]
  title <- trim(sub(pt$prm, "\\1", chnk_lines[1], perl = TRUE))
  tags <- c(
    gsub("\\s+", "_", trim(sub(pt$prm, "\\2", chnk_lines[1], perl = TRUE))),
    gsub("\\s+", "_", trim(sub(pt$scnd, "\\1", chnk_lines[-1], perl = TRUE))))
  opts <- c(
    trim(sub(pt$prm, "\\3", chnk_lines[1], perl = TRUE)),
    trim(sub(pt$scnd, "\\2", chnk_lines[-1], perl = TRUE)))
  chnk_list <- vector('list', length(chnk_idx))
  for (i in seq_along(chnk_idx)) {
    start <- chnk_idx[i] + 1
    end <- if (i != length(chnk_idx)) chnk_idx[i + 1] - 1 else length(chunk)
    chnk_list[[i]] <- subchunkify(subchunk = chunk[start:end],
                                   title = title[i],
                                   tag = tags[i],
                                   opts = opts[i])
  }
  sep <- "\n---\n"
  s <- paste0(unlist(chnk_list), collapse = "")
  if (grepl('\\n\\*{3} =(left|right)\\n', s)) {
    sep <- "\n--- &twocol\n"
  }
  if (grepl('\\n\\*{3} =(left|right) (w1:.+|w2:.+)\\n', s)) {
    widths <- paste(regmatches(s, gregexpr('(w1:\\d+%|w2:\\d+%)', s, perl = TRUE))[[1]], collapse = " ")
    sep <- paste0("\n--- &twocols ", widths, "\n")
  }
  paste0(sep, s, collapse = "")
}

subchunkify <- function(subchunk, title, tag, opts) {
  freetext_idx <- grep("^#' ?", subchunk)
  freetext <- ""
  if (length(freetext_idx) > 0) {
    freetext <- sprintf("\n%s\n", paste0(substring(subchunk[freetext_idx], 4), collapse = "\n"))
    code <- subchunk[-freetext_idx]
  } else {
    code <- subchunk
  }
  if (!is.na(title)) {
    tmplt <- "\n## %s\n%s\n```{r %s%s}\n%s\n```\n\n"
  } else {
    title <- ""
    tmplt <- "%s%s\n```{r %s%s}\n%s\n```\n\n"
  }
  opts <- if (nzchar(opts)) sprintf(", %s", opts) else ""
  sprintf(tmplt, title, freetext, tag, opts, paste0(code, collapse = "\n"))
}

slides_from_chunks <- function(lines) {
  ## split by primary chunks
  prm_chnk_idx <- grep(pt$prm, lines, perl = TRUE)
  prm_chnk_lines <- lines[prm_chnk_idx]
  chnk_list <- vector("list", length(prm_chnk_idx))
  for (i in seq_along(prm_chnk_idx)) {
    start <- prm_chnk_idx[i]
    end <- if (i != length(prm_chnk_idx)) prm_chnk_idx[i + 1] - 1 else length(lines)
    chnk_list[[i]] <- chunkify(chunk = Filter(nzchar, lines[start:end]))
  }
  paste(unlist(chnk_list), collapse = "")
}

#' Convert rmd decks to code chunk files
#'
#' @param rmdfile Path to an Rmd file.
#' @param chunkfile Path to chunk file.
#' @param header Custom text preceding the code chunks.
#' @param width Width of the chunk seperators.
#' @export
deck2codechunks <- function(rmdfile,
                            chunkfile = replace_ext(rmdfile, "R", level = 1),
                            header = "",
                            width = 51) {
  if (file.exists(chunkfile)) {
    unlink(chunkfile)
  }
  if (!file.exists(dirname(chunkfile))) {
    dir.create(dirname(chunkfile), recursive = TRUE)
  }
  lines <- readLines(rmdfile)
  .header <- sprintf("### R code from slides deck '%s'\n%s\n%s",
                     basename(rmdfile),
                     frontmatter_from_deck(lines),
                     header)

  chunk_idx <- grep(pt$chnk, lines)
  chunk_lines <- sub(pt$chnk, "\\1", lines[chunk_idx])
  chunk_tags <- strsplitN(chunk_lines, ",", 1L)
  chunk_opts <- strsplitN(chunk_lines, ",", -1L)

  ## remove setup and empty tags
  i <- which(!grepl("(setup|style|([Ee]xercise.?\\d))", chunk_tags) & nzchar(chunk_tags))
  chunk_idx <- chunk_idx[i]
  chunk_tags <- chunk_tags[i]
  chunk_opts <- chunk_opts[i]

  chunk_list <- vector("list", length(chunk_idx))
  for (i in seq_along(chunk_idx)) {
    cat(paste0("Processing chunk at #", chunk_idx[i], '\n'))
    chunk_list[[i]] <- extract_chunk(lines, chunk_idx[i])
  }
  names(chunk_list) <- chunk_tags
  attr(chunk_list, "opts") <- chunk_opts

  ## remove empty chunks
  not_empty <- vapply(chunk_list, nzchar, FALSE)
  chunk_list <- slice(chunk_list, not_empty)

  task_idx <- grep(pt$exr, lines)
  task_tags <- sub("##\\s*(.+)$", "\\1", lines[task_idx])
  task_list <- vector("list", length(task_idx))
  for (i in seq_along(task_idx)) {
    cat(paste0("Processing exercise chunk at #", task_idx[i], '\n'))
    task_list[[i]] <- extract_exercises(lines, j = task_idx[i])
  }
  names(task_list) <- task_tags
  attr(task_list, "opts") <- rep("", length(task_list))
  chunk_list <- merge_chunk_with_exercise(chunk_list, chunk_idx,
                                          task_list, task_idx)
  chunk_list <- compactList(chunk_list)
  write.chunks(chunk_list, chunkfile, header = .header, width = width)
  invisible()
}

extract_chunk <- function(file, i, chunk = "") {
  loc <- file[i + 1]
  if (grepl("^```$", loc)) {
    return(trim(chunk))
  }
  Recall(file, i + 1, paste(trim(chunk), loc, sep="\n"))
}

extract_exercises <- function(lines, j, task = "") {
  taskline <- lines[j + 1]
  taskline
  if (grepl("^---", taskline)) {
    return(trim(task))
  }
  if (notNA(charmatch("#", taskline))) {
    taskline <- trim(taskline)
  } else if (notNA(charmatch("*", trim(taskline))) ||
             notNA(charmatch("+", trim(taskline)))) {
    taskline <- sub("[*+]", "#", trim(taskline))
  } else if (notNA(charmatch("```", trim(taskline)))) {
    j <- j + 2
    while (is.na(charmatch("```", trim(lines[j])))) j <- j + 1
    taskline <- trim(lines[j + 1])
  } else {
    taskline <- paste("#", trim(taskline))
  }
  Recall(lines, j = j + 1, task = paste(task, taskline, sep="\n"))
}

merge_chunk_with_exercise <- function(cList, cIdx, eList, eIdx) {
  for (i in seq_along(eIdx)) {
    pos <- sum(eIdx[i] > cIdx)
    if (pos < length(cIdx)) {
      cIdx <- c(cIdx[1:pos], eIdx[i], cIdx[(pos+1):length(cIdx)])
      cList <- combine(slice(cList, 1:pos), slice(eList, i), slice(cList, (pos+1):length(cList)))
    } else {
      cIdx <- c(cIdx[1:pos], eIdx[i])
      cList <- combine(slice(cList, 1:pos), slice(eList, i))
    }
  }
  cList
}

merge_chunks <- function(chunk_list) {
  tags <- names(chunk_list)
  runs <- rle(strsplitN(tags, "\\.", 1))
  lens <- runs$lengths
  vals <- runs$values
  merged_chunks <- vector("list", length(lens))
  for (i in seq_along(lens)) {
    idx <- seq_len(lens[i])
    merged_chunks[[i]] <- vapply(chunk_list[idx], paste, "", USE.NAMES=FALSE)
    chunk_list <- chunk_list[-idx]
  }
  names(merged_chunks) <- vals
  merged_chunks
}

write.chunks <- function(chunk_list, outfile, header, width = 51) {
  ###################################################
  ### code chunk number 1: basic-operators (opts)
  ###################################################
  opts <- trim(attr(chunk_list, 'opts'))
  tags <- paste0(dup('#', width),
                 sprintf('\n### code chunk number %s: %s %s\n', seq_along(chunk_list), names(chunk_list),
                         ifelse(nzchar(opts), sprintf("(%s)", opts), "")),
                 dup('#', width))
  if (nzchar(header)) {
    cat(header, sep = "\n", file = outfile, append = TRUE)
  }
  for (i in seq_along(chunk_list)) {
    cat(tags[i], chunk_list[[i]], '\n\n', sep = "\n", file = outfile, append = TRUE)
  }
  invisible()
}





