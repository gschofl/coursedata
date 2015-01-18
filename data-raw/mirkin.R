library("XML")

## Source: Boris Mirkin (2011). Core Concepts in Data Analysis: Summarization,
## Correlation and Visualization.
src <- "~/.insync/books/Data Analysis/Core Concepts in Data Analysis.epub"
unzip(src, exdir = "~/tmp")
x <- "~/tmp/OEBPS/A978-0-85729-287-2_1_Chapter.html"
doc <- htmlParse(x)
tn <- getNodeSet(doc, "//table")

company <- readHTMLTable(tn[[3]])
save(company, file = "data/company.RData")

market_towns <- readHTMLTable(tn[[6]], colClasses = c("character", rep("numeric", 12)))
names(market_towns) <- trim(names(market_towns))
save(market_towns, file = "data/market_towns.RData")

student <- readHTMLTable(tn[[8]], colClasses = c("character", rep("numeric", 5), "character", rep("numeric", 5)))
student <- rbind(student[, 1:6], student[, 7:12])
save(student, file = "data/student.RData")

intrusion <- readHTMLTable(tn[[9]], colClasses = c("character", rep("numeric", 5), "character",
                                                   "character", rep("numeric", 5), "character"))
names(intrusion) <- rep(c("Pr", "BySD", "SH", "SS", "SE", "RE", "A"), 2)
intrusion <- rbind(intrusion[, 1:7], intrusion[, 8:14])
intrusion$Pr <- tolower(intrusion$Pr)
intrusion$A <- tolower(intrusion$A)
save(intrusion, file = "data/intrusion.RData")

blosum62 <- readHTMLTable(tn[[11]])
blosum62 <- data.frame(lapply(blosum62, gsub, pattern = "−", replacement = "-"))
blosum62 <- cbind(Aa = blosum62[, 1], data.frame(lapply(blosum62[, -1], as.numeric)))
save(blosum62, file = "data/blosum62.RData")

