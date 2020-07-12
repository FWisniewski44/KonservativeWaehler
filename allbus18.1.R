################################################### install
install.packages("moderndive")
install.packages("sjlabelled")
install.packages("sjPlot")
install.packages("sjmisc")
install.packages("Amelia")
install.packages("huxtable")
install.packages("ggstance")
install.packages("jtools")
install.packages("expss")
install.packages("rmarkdown")
install.packages("finalfit")
install.packages("car")
install.packages("gdata")
install.packages("robustfa")
install.packages("nnet")
install.packages("MASS")
install.packages("brant")
install.packages("ordinal")
install.packages("effects")
install.packages("rockchalk")
install.packages("performance")
install.packages("kable.extra")
install.packages("nloptr")
install.packages("Rcpp")
install.packages("rstanarm")
install.packages("modeldata")
install.packages("pls")
install.packages("glmnet")
install.packages("randomForest")
install.packages("ranger")

####
################################################### libraries

library(flextable)
library(ggplot2)
library(kableExtra)
library(tidyverse)
library(tidymodels)
library(tidyr)
library(purrr)
library(rstan)
library(rstanarm)
library(stats)
library(DescTools)
library(stats)
library(psych)
library(vcd)
library(expss)
library(rmarkdown)
library(Amelia)
library(finalfit)
library(jtools)
library(ggstance)
library(huxtable)
library(sjlabelled)
library(sjmisc)
library(sjPlot)
library(moderndive)
library(broom)
library(pcaPP)
library(haven)
library(gdata)
library(car)
library(forcats)
library(MASS)
library(leaps)
library(robustfa)
library(nnet)
library(brant)
library(ordinal)
library(effects)
library(rockchalk)
library(performance)
library(RColorBrewer)
library(vcd)
library(pander)
library(foreign)
library(glmnet)
library(randomForest)
library(ranger)
library(recipes)
library(caret)
library(rms)

###################################################

# GET ALLBUS18
allbus18.1 <- read_spss(file = "/Users/flo/Documents/Uni/SS 2020/Wahlforschung Arbeit/allbus 18.sav/allbusdaten18.sav")
allbus18.1 <- as_tibble(allbus18.1)

# DEPENDENT VARIABLE
names(allbus18.1)[712] <- "wahlabs"
fre(allbus18.1$wahlabs)

allbus18.1$pv01 <- factor(allbus18.1$pv01)
fre(allbus18.1$pv01)
allbus18.1 <- dplyr::rename(allbus18.1, "wahl" = "pv01")
fre(allbus18.1$wahl)

# if.else AUF wahl
allbus18.1$wahl <- ifelse(allbus18.1$wahl == "1", 1, 0)
allbus18.1$wahl <- factor(allbus18.1$wahl, levels = c(0, 1))

# labels?
allbus18.1$wahl <- factor(allbus18.1$wahl, levels = c(0, 1), labels = c("NICHT KONSERVATIV", "KONSERVATIV"))
# check: should work!
# contrasts(allbus18.1$wahl)

# allbus18.1$wahlabs <- factor(allbus18.1$wahlabs, ordered = F, labels = c("Nicht Union", "Union"))
# allbus18.1$wahlabs <- relevel(allbus18.1$wahlabs, ref = "Union")
# contrasts(allbus18.1$wahlabs)

# DEPENDENT AS NUMERIC???
# allbus18.1$wahlabs <- as.numeric(allbus18.1$wahlabs)

# CREATE linksRechts
allbus18.1 <- rename(allbus18.1, "linksRechts" = "pa01")
allbus18.1$linksRechts <- as.numeric(allbus18.1$linksRechts)
fre(allbus18.1$linksRechts)

# Erstellung add. Index "Bürgerpflichten"
## Variablen:
### pe09 (WAHLBETEILIGUNG IST BÜRGERPFLICHT)
### pe13 (REGELMAESSIG UEBER POLITIK INFORMIEREN)

allbus18.1$pe09 <- as.numeric(allbus18.1$pe09)
fre(allbus18.1$pe09)
class(allbus18.1$pe09)
pe09 <- allbus18.1$pe09
#
allbus18.1$pe13 <- as.numeric(allbus18.1$pe13)
fre(allbus18.1$pe13)
class(allbus18.1$pe13)
pe13 <- allbus18.1$pe13
#
## Index (Versuch mit R):
buergerpfl <- (pe09 + pe13)
allbus18.1$buergerpfl <- buergerpfl
fre(allbus18.1$buergerpfl)
class(allbus18.1$buergerpfl)

# RELABEL IMPORTANT VARIABLES
allbus18.1$eastwest <- factor(allbus18.1$eastwest, labels = c("West", "Ost"))
allbus18.1$eastwest <- relevel(allbus18.1$eastwest, ref = "West")

allbus18.1$sex <- factor(allbus18.1$sex, labels = c("Mann", "Frau"))
allbus18.1$sex <- relevel(allbus18.1$sex, ref = "Mann")

fre(allbus18.1$agec)
allbus18.1$agec <- factor(allbus18.1$agec, labels = c("18-29", "30-44", "45-59", "60-74", "75-89", "UEBER 89"))

allbus18.1$educ <- factor(allbus18.1$educ, labels = c("Ohne Abschluss", "Volks-/Mittelschule",
                                                        "Mittl. Reife", "Fachhochschulreife",
                                                        "Hochschulreife", "anderer Abschl.",
                                                        "Noch Schüler"))
# allbus18.1$work <- factor(allbus18.1$work, labels = c("Ganztags", "Halbtags",
#                                                           "Nebenher berufstät.", "Nicht erwerbstät."))
allbus18.1$work <- factor(allbus18.1$work)
# fre(allbus18.1$work)
allbus18.1$work <- combineLevels(allbus18.1$work, levs = c(1, 2, 3), newLabel = "Erwerbstät.")
allbus18.1$work <- combineLevels(allbus18.1$work, levs = c(1), newLabel = "Nicht erwerbstät.")
allbus18.1$work <- relevel(allbus18.1$work, ref = "Erwerbstät.")

allbus18.1$mstat <- factor(allbus18.1$mstat, labels = c("Verh., zsm.lebend", "Verh., getr. lebend",
                                                          "Verwitwet", "Geschieden", "Ledig",
                                                          "Lebensp., zsm.lebend", "Lebensp., getr. lebend"))

allbus18.1$id02 <- factor(allbus18.1$id02, labels = c("Unterschicht", "Arbeiterschicht",
                                                        "Mittelschicht", "Obere Mittelschicht",
                                                        "Oberschicht"))
allbus18.1$id02 <- relevel(allbus18.1$id02, ref = "Oberschicht")

# EINSTELLUNG BEFR. ZU VERSCH. THEMEN
## Gleichgeschlechtliche Ehe verbieten
allbus18.1$pa12 <- factor(allbus18.1$pa12, labels = c("Stimme voll zu", "Stimme eher zu", "Weder noch",
                                                        "Stimme eher nicht zu", "Stimme gar nicht zu"))
#
#### allbus18.1$pa12 <- as.numeric(allbus18.1$pa12)
## Schwangerschaftsabbruch freistellen
allbus18.1$pa08a <- factor(allbus18.1$pa08a, labels = c("Stimme voll zu", "Stimme eher zu", "Weder noch",
                                                          "Stimme eher nicht zu", "Stimme gar nicht zu"))
#
#### allbus18.1$pa08a <- as.numeric(allbus18.1$pa08a)
## Heirat bei dauerndem Zusammenleben
allbus18.1$fn02 <- factor(allbus18.1$fn02, labels = c("Ja", "Nein", "Unentschieden"))
## Wahlbeteiligung ist Bürgerpflicht
allbus18.1$pe09 <- factor(allbus18.1$pe09, labels = c("Stimme voll zu", "Stimme eher zu",
                                                        "Stimme eher nicht zu", "Stimme gar nicht zu"))
#
#### allbus18.1$pe09 <- as.numeric(allbus18.1$pe09)
## Man sollte sich regelmäßig über Politik informieren
allbus18.1$pe13 <- factor(allbus18.1$pe13, labels = c("Stimme voll zu", "Stimme eher zu",
                                                        "Stimme eher nicht zu", "Stimme gar nicht zu"))
#
#### allbus18.1$pe013 <- as.numeric(allbus18.1$pe13)
## Pol. Interesse Befragter (Ordinal)
allbus18.1$pa02a <- factor(allbus18.1$pa02a, labels = c("Sehr stark", "Stark", "Mittel",
                                                          "Wenig", "Ueberhaupt nicht"))
#
#### allbus18.1$pa02a <- as.numeric(allbus18.1$pa02a)
## Befragter ist stolz aufs Grundgesetz
allbus18.1$pn01 <- factor(allbus18.1$pn01, labels = c("Keine Aussage", "Stolz auf GG"))
## Befragter ist stolz auf den Bundestag
allbus18.1$pn02 <- factor(allbus18.1$pn02, labels = c("Keine Aussage", "Stolz auf BT"))
## Verbundenheit Befragter zu: Gemeinde
allbus18.1$pn12 <- factor(allbus18.1$pn12, labels = c("Stark verbunden", "Ziemlich verbunden",
                                                        "Wenig verbunden", "Gar nicht verbunden"))
#
#### allbus18.1$pn12 <- as.numeric(allbus18.1$pn12)
## Verbundenheit Befragter zu: Gesamtdeutschland
allbus18.1$pn16 <- factor(allbus18.1$pn16, labels = c("Stark verbunden", "Ziemlich verbunden",
                                                        "Wenig verbunden", "Gar nicht verbunden"))
allbus18.1$pn16 <- relevel(allbus18.1$pn16, ref = "Stark verbunden")
#
#### allbus18.1$pn16 <- as.numeric(allbus18.1$pn16)

# Vertrauensvariablen im weitesten Sinne Nationalgefühl
## Vertr. Befragter: BVerfG
allbus18.1$pt02 <- factor(allbus18.1$pt02, labels = c("Gar kein Vertrauen", "2", "3", "4", "5", "6", "Sehr großes Vertrauen"))
#
#### allbus18.1$pt02 <- as.numeric(allbus18.1$pt02)
## Vertr. Befragter: Bundestag
allbus18.1$pt03 <- factor(allbus18.1$pt03, labels = c("Gar kein Vertrauen", "2", "3", "4", "5", "6", "Sehr großes Vertrauen"))
#
#### allbus18.1$pt03 <- as.numeric(allbus18.1$pt03)
## Vertr. Befragter: Justiz
allbus18.1$pt08 <- factor(allbus18.1$pt08, labels = c("Gar kein Vertrauen", "2", "3", "4", "5", "6", "Sehr großes Vertrauen"))
#
#### allbus18.1$pt08 <- as.numeric(allbus18.1$pt08)
## Vertr. Befragter: Fernsehen
allbus18.1$pt09 <- factor(allbus18.1$pt09, labels = c("Gar kein Vertrauen", "2", "3", "4", "5", "6", "Sehr großes Vertrauen"))
#
#### allbus18.1$pt09 <- as.numeric(allbus18.1$pt09)
## Vertr. Befragter: Zeitungswesen
allbus18.1$pt12 <- factor(allbus18.1$pt12, labels = c("Gar kein Vertrauen", "2", "3", "4", "5", "6", "Sehr großes Vertrauen"))
#
#### allbus18.1$pt12 <- as.numeric(allbus18.1$pt12)
## Vertr. Befragter: Hochschulen/Unis
allbus18.1$pt14 <- factor(allbus18.1$pt14, labels = c("Gar kein Vertrauen", "2", "3", "4", "5", "6", "Sehr großes Vertrauen"))
#
#### allbus18.1$pt14 <- as.numeric(allbus18.1$pt14)
## Vertr. Befragter: Bundesregierung
allbus18.1$pt15 <- factor(allbus18.1$pt15, labels = c("Gar kein Vertrauen", "2", "3", "4", "5", "6", "Sehr großes Vertrauen"))
#
#### allbus18.1$pt15 <- as.numeric(allbus18.1$pt15)
## Frage: In D. kann man gut leben
allbus18.1$pd11 <- factor(allbus18.1$pd11, labels = c("Stimme voll zu", "Stimme eher zu",
                                                        "Stimme eher nicht zu", "Stimme gar nicht zu"))
#
#### allbus18.1$pd11 <- as.numeric(allbus18.1$pd11)
## Zufriedenheit mit Arbeit der Bundesregierung
allbus18.1$ps01 <- factor(allbus18.1$ps01, labels = c("Sehr zufrieden", "Zieml. zufrieden", "Etw. zufrieden",
                                                        "Etw. unzufrieden", "Zieml. unzufrieden", "Sehr unzufrieden"))
#
#### allbus18.1$ps01 <- as.numeric(allbus18.1$ps01)

## Wahlverhalten Befragter
allbus18.1$pv03 <- factor(allbus18.1$pv03, labels = c("Ja", "Nein"))

## Wichtigkeit von Sicherheit f. Befragten
allbus18.1$va01 <- factor(allbus18.1$va01, labels = c("Wichtigkeit"))

# numerics 
#### glm --> include; lrm --> not include:
allbus18.1$wghtpew <- as.numeric(allbus18.1$wghtpew)
allbus18.1$age <- as.numeric(allbus18.1$age)
allbus18.1$inc <- as.numeric(allbus18.1$inc)
allbus18.1$staatl <- as.numeric(allbus18.1$staatl)
allbus18.1$heimat <- as.numeric(allbus18.1$heimat)

# # checkt umcodierungen von oben - workflow
# fre(allbus18.1$pt02)
# fre(allbus18.1$pn12)
# fre(allbus18.1$pn02)
# fre(allbus18.1$pn01)
# fre(allbus18.1$id02)
# fre(allbus18.1$mstat)
# fre(allbus18.1$pd11)
# fre(allbus18.1$ps01)
# fre(allbus18.1$va01)
# fre(allbus18.1$pa12)
# fre(allbus18.1$pa08a)
# fre(allbus18.1$fn02)
# fre(allbus18.1$pe09)
# fre(allbus18.1$pv03)
# fre(allbus18.1$pe13)
# fre(allbus18.1$pa02a)

# SAVE allbus18.1
save(allbus18.1, file = "allbus181.RData")

###################################################

# GETTING NEW SUBSET FOR ANALYSES
sub <- subset(allbus18.1, select = c("wahl", "eastwest", "sex", "age", "inc", "id02",
                                     "va01", "staatl", "heimat", "linksRechts", "buergerpfl", "wghtpew"))
sub <- as_tibble(sub)

# NA TREATMENT
missmap(sub)
sub <- na.omit(sub)

# SAVE sub
save(sub, file = "sub.RData")

################################################### END


























