#' Rat fertility
#'
#' A dataset containing the bivariate distribution of mother's weight and number
#' of offspring for a population of rats.
#'
#' The \code{rownames} denote the lower bound of the maternal weight in grams;
#' the \code{colnames} denote the number of offspring. Each number in the table
#' refers to the number of observations in a particular case, e.g. 38 animals
#' weighed between 100 and 110 grams and produced 5 offspring.
#'
#' @source Pearson 1910
#' @format A data frame with 15 rows and 12 columns
#' @examples
#'   fertility
"fertility"

#' Dax30
#'
#' A dataset containing the DAX 30 stock quotes between 27. Feb. 2013 and
#' 26. Feb. 2014.
#'
#' @source \url{http://de.finance.yahoo.com/}
#' @format A data frame with 7818 rows and 8 columns
#' \describe{
#'  \item{symbol}{A factor representing the date for each quote}
#'  \item{Date}{Date on which the quote was taken}
#'  \item{Open}{A numeric vector representing the opening price for each stock on each day}
#'  \item{High}{A numeric vector representing the high price for each stock on each day}
#'  \item{Low}{A numeric vector representing the low price for each stock on each day}
#'  \item{Close}{A numeric vector representing the closing price for each stock on each day}
#'  \item{Volume}{A numeric vector representing the number of shares traded for each stock on each day}
#'  \item{Adj.Close}{A numeric vector representing the closing price for each stock on each day}
#' }
#'
"dax30"

#' Births in the US in 2012
#'
#' A dataset containing information on babies born in the United States during
#' 2012. There is one record per birth. This data set is a random twenty-five percent
#' sample of the original data set.
#'
#' @source \url{http://www.cdc.gov/nchs/data_access/Vitalstatsonline.htm}
#' @format A data frame with 990199 rows and 12 columns
#' \describe{
#'  \item{DOB_MM}{Month of date of birth}
#'  \item{DOB_WK}{Day of week of birth}
#'  \item{MAGER}{Mother's age}
#'  \item{TBO_REC}{Total birth order}
#'  \item{WTGAIN}{Weight gain by mother [pounds]}
#'  \item{SEX}{a factor with levels \code{F} \code{M}, representing the sex of the child}
#'  \item{APGAR5}{APGAR score}
#'  \item{UPREVIS}{Number of prenatal visits}
#'  \item{ESTGEST}{Estimated weeks of gestation}
#'  \item{DMETH_REC}{Delivery Method; levels \code{spontaneous}, \code{cesarean},
#'    \code{unknown}}
#'  \item{DPLURAL}{"Plural Births"; levels \code{single}, \code{twin}, \code{triplet},
#'    \code{quadruplet}, and \code{quintuplet or higher}}
#'  \item{DBWT}{Birth weight [grams]}
#' }
#'
"birth2012us"

#' \emph{Spodoptera frugiperda} mating trials
#'
#' The noctuid moth \emph{Spodoptera frugiperda} (fall armyworm) consists of two
#' strains (R and C) associated with different larval host plants (most notably
#' corn and rice). These strains exhibit differential temporal patterns of reproductive
#' behaviours (copulation, female calling, male calling, oviposition) during scotophase,
#' with the corn strain more active earlier in the night. This data set describes
#' an experiment where the reproductive timing of 320 fall armyworm mating
#' pairs was observed for three consecutive nights.
#'
#'  @source \url{http://onlinelibrary.wiley.com/doi/10.1111/j.1420-9101.2009.01759.x/abstract}
#' @format A data frame with 3129 rows and 18 columns
#'   \describe{
#'     \item{\code{Cross}}{Type of cross (Backcross, F1, or Parental)}
#'     \item{\code{Female}}{Strain of the female mating partner (R, C, RC, CR),
#'     where CR and RC describe female x male hybrids.}
#'     \item{\code{MGM}}{Strain of the maternal grandmother}
#'     \item{\code{MGF}}{Strain of the maternal grandfather}
#'     \item{\code{Male}}{Strain of the male mating partner.}
#'     \item{\code{PGM}}{Strain of the paternal grandmother}
#'     \item{\code{PGF}}{Strain of the paternal grandfather}
#'     \item{\code{Day}}{Day of experiment}
#'     \item{\code{Pair}}{Number of mating pair (= number of mating cup)}
#'     \item{\code{NumCop}}{Number of copulation [First, Second, Third, ...]}
#'     \item{\code{NumFcal}}{Number of female calling [First, Second, Third, ...]}
#'     \item{\code{NumOvi}}{Number of oviposition [First, Second, Third, ...]}
#'     \item{\code{NumMcal}}{Number of male calling [First, Second, Third, ...]}
#'     \item{\code{StartCop}}{Start of copulation [hours into scotophase]}
#'     \item{\code{DurationCop}}{Duration of copulation [hours]}
#'     \item{\code{StartFcal}}{Start of female calling [hours into scotophase]}
#'     \item{\code{StartOvi}}{Start of oviposition [hours into scotophase]}
#'     \item{\code{StartMcal}}{Start of male calling [hours into scotophase]}
#'   }
#'
"spodoptera"

#' headache
#'
#' A fictional dataset containing the effects of asprin and a placebo treatment
#' of female and male patients
#'
#' @format A data frame with 30 rows and 6 columns:
#' \describe{
#'  \item{\code{subjects}}{index number.}
#'  \item{\code{sex}}{Sex of the subjects; factor levels \code{F}, \code{M}}
#'  \item{\code{condition}}{Treatment received by the subject; factor levels
#'    \code{placebo}, \code{aspirin}}
#'  \item{\code{before}}{Headache intensity before treatment.}
#'  \item{\code{after}}{Headache intensity after treatment.}
#'  \item{\code{change}}{Change in headache intensity.}
#' }
"headache"

#' Savings rates in 50 countries
#'
#' The \code{savings} data frame has 50 rows and 5 columns. The data is
#' averaged over the period 1960-1970.
#'
#' Also appears as \code{LifeCycleSavings} in the \code{datasets} package,
#' and as \code{savings} in the \code{faraway} package.
#'
#' @source Belsley, D., Kuh. E. and Welsch, R. (1980) "Regression Diagnostics"
#' Wiley.
#' @format A data frame with 50 rows and 5 columns:
#' \describe{
#'  \item{\code{sr}}{savings rate - personal saving divided by disposable income}
#'  \item{\code{pop15}}{percent population under age of 15}
#'  \item{\code{pop75}}{percent population over age of 75}
#'  \item{\code{dpi}}{per-capita disposable income in dollars}
#'  \item{\code{ddpi}}{percent growth rate of dpi}
#' }
#'
"savings"

#' Pearson-Lee data
#'
#' Karl Pearson organized the collection of data on over 1100 families in
#' England in the period 1893 to 1898. This particular data set gives the
#' heights in inches of mothers and their daughters, with up to two daughters
#' per mother.  All daughters are at least age 18, and all mothers are younger
#' than 65.  Data were given in the source as a frequency table to the nearest
#' inch. Rounding error has been added to remove discreteness from graph.
#'
#' @references Weisberg, S. (2005). \emph{Applied Linear Regression}, 3rd
#'   edition. New York: Wiley, Section 1.1.
#' @source K. Pearson and A. Lee (1903), On the laws of inheritance in man,
#'   \emph{Biometrika}, 2, 357--463, Table 31.
#' @format A data frame with 1375 rows and 2 columns:
#' \describe{
#'   \item{Mheight}{ Mother's ht, in.  }
#'   \item{Dheight}{ Daughter's ht, in.  }
#' }
#'
#' @examples
#' heights
"heights"

#' New York Times ads
#'
#' This data set represents a (simulated) day’s worth of ads shown and
#' clicks recorded on the New York Times home page in May 2012. Each
#' row represents a single user.
#'
#' @source \url{https://github.com/oreillymedia/doing_data_science}
#' @format A data frame with 458441 rows and 5 columns:
#' \describe{
#'   \item{\code{Age}}{ Age of user. }
#'   \item{\code{Gender}}{ Gender of user (0=female, 1=male). }
#'   \item{\code{Impressions}}{ The number of times an ad is seen. Clicking or
#'   not is not taken into account. }
#'   \item{\code{Clicks}}{ The number of times an ad has been clicked at. }
#'   \item{\code{Signed_In}}{ Has the user been signed in (0=no, 1=yes). }
#' }
#'
"nyt"

#' Study of teenage gambling in Britain
#'
#' The \code{teengamb} data frame contains survey data from a study
#' conducted to study teenage gambling in Britain.
#'
#' @source Ide-Smith & Lea, 1988, Journal of Gambling Behavior, 4, 110-118
#' @format A data frame with 47 rows and 5 columns:
#' \describe{
#'   \item{\code{sex}}{ 0=male, 1=female. }
#'   \item{\code{status}}{ Socioeconomic status score based on parents' occupation. }
#'   \item{\code{income}}{ In pounds per week. }
#'   \item{\code{verbal}}{ Verbal score in words out of 12 correctly defined. }
#'   \item{\code{gamble}}{ Expenditure on gambling in pounds per year. }
#' }
#'
"teengamb"

#' Weekly wages of US male workers in 1988
#'
#' The \code{uswages} data frame contains data on weekly Wages for
#' US male workers sampled from the Current Population Survey in 1988.
#'
#' @format A data frame with 2000 rows and 10 columns:
#' \describe{
#'   \item{\code{wage}}{ Real weekly wages in dollars (deflated by personal
#'   consumption expenditures - 1992 base year) }
#'   \item{\code{educ}}{ Years of education }
#'   \item{\code{exper}}{ Years of experience }
#'   \item{\code{race}}{ 1 if Black, 0 if White (other races not in sample) }
#'   \item{\code{smsa}}{ 1 if living in Standard Metropolitan Statistical Area,
#'   0 if not }
#'   \item{\code{ne}}{ 1 if living in the North East }
#'   \item{\code{mw}}{ 1 if living in the Midwest }
#'   \item{\code{we}}{ 1 if living in the West }
#'   \item{\code{so}}{ 1 if living in the South }
#'   \item{\code{pt}}{ 1 if working part time, 0 if not }
#' }
#' @source Bierens, H.J., and D. Ginther (2001): "Integrated Conditional Moment
#' Testing of Quantile Regression Models", Empirical Economics 26, 307-324
"uswages"

#' Mid-Atlantic Wage Data
#'
#' Wage and other data for a group of 3000 workers in the Mid-Atlantic region.
#'
#' @format A data frame with 3000 rows and 12 columns:
#' \describe{
#'   \item{\code{year}}{Year that wage information was recorded}
#'   \item{\code{age}}{Age of worker}
#'   \item{\code{sex}}{Gender}
#'   \item{\code{maritl}}{A factor with levels \code{1. Never Married} \code{2.
#'     Married} \code{3. Widowed} \code{4. Divorced} and \code{5. Separated}
#'     indicating marital status}
#'   \item{\code{race}}{A factor with levels \code{1. White} \code{2. Black}
#'     \code{3. Asian} and \code{4. Other} indicating race}
#'   \item{\code{education}}{A factor with levels \code{1. < HS Grad} \code{2.
#'     HS Grad} \code{3. Some College} \code{4. College Grad} and \code{5. Advanced
#'     Degree} indicating education level}
#'   \item{\code{region}}{Region of the country (mid-atlantic only)}
#'   \item{\code{jobclass}}{A factor with levels \code{1. Industrial} and
#'     \code{2. Information} indicating type of job}
#'   \item{\code{health}}{A factor with levels \code{1. <=Good} and \code{2.
#'     >=Very Good} indicating health level of worker}
#'   \item{\code{health_ins}}{A factor with levels \code{1. Yes} and \code{2. No}
#'     indicating whether worker has health insurance}
#'   \item{\code{logwage}}{Log of workers wage}
#'   \item{\code{wage}}{Workers raw wage}
#' }
#' @references Games, G., Witten, D., Hastie, T., and Tibshirani, R. (2013)
#' \emph{An Introduction to Statistical Learning with applications in R},
#' \url{www.StatLearning.com}, Springer-Verlag, New York
#' @source Data was manually assembled by Steve Miller, of Open BI
#' (www.openbi.com), from the March 2011 Supplement to Current Population
#' Survey data.
#' \url{http://thedataweb.rm.census.gov/TheDataWeb}
#' @examples
#' summary(Wage)
"Wage"

#' Gene expression data HIV
#'
#' A random sample of 6000 genes from gene expression data set GDS4358.
#' Contains expression data from basal ganglia, frontal cortex, and white matter
#' tissue from HIV patients and controls.
#' @format A data frame with 216000 rows and 5 columns:
#' \describe{
#'   \item{\code{sample}}{Sample code (6 samples per \code{tissue} per \code{state})}
#'   \item{\code{state}}{\code{control} or \code{HIV}}
#'   \item{\code{tissue}}{One of \code{Basal ganglia}, \code{Frontal cortex},
#'     or \code{White matter}}
#'   \item{\code{gene}}{One of 6000 gene objects}
#'   \item{\code{expr}}{log-transformed expression values}
#' }
#' @source Gelman BB, Chen T, Lisinicchia JG, Soukup VM et al.
#' The National NeuroAIDS Tissue Consortium brain gene array: two types of
#' HIV-associated neurocognitive impairment. PLoS One 2012;7(9):e46178.
#' PMID: 23049970
#' @examples
#' summary(hiv)
"hiv"

#' Primate taxonomy
#'
#' A dataset containing information on 22 primate species on variables like
#' maximum age at death and several birth and pregnancy-related data.
#'
#' @format A data frame with 22 rows and 12 columns
#'   \describe{
#'     \item{\code{Suborder}}{Suborder (Parvorder) classification: \code{Strepsirrhini}
#'     (lemurs, lorises, etc.), \code{ Platyrrhini} (New World monkeys), \code{Catarrhini}
#'     (Old World anthropoids)}
#'     \item{\code{Family}}{Family classification}
#'     \item{\code{Species}}{Species classification}
#'     \item{\code{PregLen}}{Average duration of pregnancy [days]}
#'     \item{\code{AgeAtBirth}}{Earliest age at birth [years]}
#'     \item{\code{AgeAtDeath}}{Maximum age at death [years]}
#'     \item{\code{BodyWeightBirth}}{Body weight at birth [kg]}
#'     \item{\code{MaternalBodyWeigthAtBirth}}{Maternal body weight at birth [kg]}
#'     \item{\code{BrainWeightBirth}}{Brain weight at birth [g]}
#'     \item{\code{MaternalBrainWeigthAtBirth}}{Maternal brain weight at birth [g]}
#'     \item{\code{SO}}{Suborder code}
#'     \item{\code{FA}}{Family code}
#'   }
#' @source Pruscha H. (2006) Statistisches Methodenbuch. Springer Berlin.
#' ISBN-13 978-3-540-26006-6
"primates"
