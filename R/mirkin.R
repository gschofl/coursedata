#' Company
#'
#' A dataset of eight companies characterized by mixed scale features.
#' The company names reflect the fact not present in the data - product
#' affinities: first three companies mostly adhere to product group A,
#' the next three to product group B, and the last two to product group C.
#'
#' @format A data frame with 8 rows and 6 columns:
#' \describe{
#'   \item{Company name}{Name of the company (fictional).}
#'   \item{Income, $mln}{Income in milion dollars.}
#'   \item{SharP $}{Share price}
#'   \item{NSup}{The number of principal suppliers.}
#'   \item{EC}{Yes or No depending on the usage of e-commerce in the company}
#'   \item{Sector}{which sector of the economy: (a) Retail, (b) Utility, and (c) Industrial}
#' }
#'
#' @source Mirkin (2011). Core Concepts in Data Analysis: Summarization,
#' Correlation and Visualization.
#' \url{http://www.springer.com/computer/theoretical+computer+science/book/978-0-85729-286-5}
#'
#' @examples
#'   company
"company"

#' Market towns
#'
#' A dataset of Market towns in West Country, England is presented along
#' with features characterizing population and social infrastructure according
#' to a census in 1991.
#'
#' @format A data frame with 45 rows and 13 columns:
#' \describe{
#'   \item{Town}{Name of the town.}
#'   \item{Pop}{Population resident.}
#'   \item{PS}{Primary schools.}
#'   \item{D}{General Practitioners.}
#'   \item{Hos}{Hospitals.}
#'   \item{Ba}{Banks.}
#'   \item{Sst}{Superstores.}
#'   \item{Pet}{Petrol stations.}
#'   \item{DIY}{Do It Yourself shops.}
#'   \item{Swi}{Swimming pools.}
#'   \item{Po}{Post offices.}
#'   \item{CAB}{Citizen Advice Bureaus.}
#'   \item{FM}{Farmer markets.}
#' }
#'
#' @source Mirkin (2011). Core Concepts in Data Analysis: Summarization,
#' Correlation and Visualization.
#' \url{http://www.springer.com/computer/theoretical+computer+science/book/978-0-85729-286-5}
#'
#' @examples
#'   market_towns
"market_towns"

#' Student
#'
#' A fictitional dataset is presented as imitating a typical set up for a group
#' of Birkbeck University of London part-time students pursuing Master’s degree in
#' Computer Sciences.
#'
#' This dataset refers to a hundred students along with six features, three of which
#' are personal characteristics.
#'
#' @format A data frame with 100 rows and 6 columns:
#' \describe{
#'   \item{Oc}{Occupation. Either Information technology (IT)
#'     or Business Administration (BA) or anything else (AN)}
#'   \item{Age}{Age, in years.}
#'   \item{Ch}{Number of children.}
#'   \item{SE}{Marks in Software and Programming.}
#'   \item{OO}{Marks in Object-Oriented Programming.}
#'   \item{CI}{Marks in Computational Intelligence.}
#' }
#'
#' @source Mirkin (2011). Core Concepts in Data Analysis: Summarization,
#' Correlation and Visualization.
#' \url{http://www.springer.com/computer/theoretical+computer+science/book/978-0-85729-286-5}
#'
#' @examples
#'   student
"student"

#' Intrusion
#'
#' A dataset consisting of a hundred communication packages along with some of
#' their features sampled from a set of artificially created data publicly
#' available on webpage of MIT Lincoln Laboratory:
#' \url{http://www. ll.mit.edu/mission/communications/ist/corpora/ideval/data/intex.html}.
#'
#' @format A data frame with 100 rows and 7 columns:
#' \describe{
#'   \item{Pr}{The protocol-type, which is either tcp or icmp or udp.}
#'   \item{BySD}{The number of data bytes from source to destination.}
#'   \item{SH}{The number of connections to the same host as the current one in the past 2 s.}
#'   \item{SS}{The number of connections to the same service as the current one in the past 2 s.}
#'   \item{SE}{The rate of connections (per cent in SHCo) that have SYN errors.}
#'   \item{RE}{The rate of connections (per cent in SHCo) that have REJ errors.}
#'   \item{A}{The type of attack (ap - apache, sa - saint, sm - smurf, and no attack)}
#' }
#'
#' @source Mirkin (2011). Core Concepts in Data Analysis: Summarization,
#' Correlation and Visualization.
#' \url{http://www.springer.com/computer/theoretical+computer+science/book/978-0-85729-286-5}
#'
#' @examples
#'   intrusion
"intrusion"

#' Amino acid substitution rates
#'
#' The \strong{BLOSUM62} matrix of substitution scores between amino acids
#' presented using 1-letter codes.
#'
#' @format A data frame with 23 rows and 24 columns
#' @source Mirkin (2011). Core Concepts in Data Analysis: Summarization,
#' Correlation and Visualization.
#' \url{http://www.springer.com/computer/theoretical+computer+science/book/978-0-85729-286-5}
#'
#' @examples
#'   blosum62
"blosum62"
