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

###################################################################### load/save zone
## Variablen von Interesse für Untersuchung

## Allgemeines
# eastwest
# german + dn05
# sex
# age
# work
# educ
# inc
# mstat (Familienstand Befragter)
# id02 (Subjektive Schichteinstufung Befragter)
# id03 (Subjektive Einstufung Befragter auf Oben-Unten-Skala)
# wghtpew (Personenbez. Ost-West-Transformationsgewicht)

## Zufriedenheitsvariablen
# ep01 (Wirtschaftslage BRD, heute)
# ep03 (Wirtschaftslage Befragter, heute)
# ep04 (Wirtschaftslage BRD in BRD in 1 Jahr)
# ep06 (Wirtschaftslage Befragter in 1 Jahr)
# pd11 (In der BRD kann man sehr gut leben)
# ps03 (Zufrieden mit Demokratie in der BRD?) --> WICHTIG
# ps01 (Zufrieden mit Leistung der Bundesregierung?) --> WICHTIG

## Mediennutzung: Nachrichten
# lm20 (Konsumhäufigkeit: Nachrichten öffentliches TV)
# lm22 (Konsumhäufigkeit: Nachrichten privates TV)
# lm14 (Häufigkeit Tageszeitung lesen pro Woche)
# lm24 (Häufigkeit Internet für Politikinfo)

## Zustimmung und Ablehnung zu Themen: Einwanderer
# pa09 (Einwanderer zu Anpassung verpflichten?)
# pa19 (Zuzug Flüchtlinge unterbinden?)

## Zustimmung und Ablehnung zu Themen: Traditionalität (z. B. Frauenrechte o. Homosexualität)
# pa12 (Gleichgeschlechtliche Ehe verbieten?)
# pa08a (Schwangerschaftsabbruch freistellen?)
# fn02 (Heirat bei dauerndem Zusammenleben)

## Zustimmung und Ablehnung zu Themen: Regierungsarbeit
# pa15 (Regierung: Soz. Sicherung am wichtigsten?)
# pa16 (Umverteilung zu Gunsten einfacher Leute?)

## Wie würde der Befragte politisch Einfluss nehmen wollen?
# pp06 (Ggfs. Bekannten politische Meinung sagen)
# pp07 (Ggfs. mich an Wahlen beteiligen)
# pp08 (Ggfs. Teilnahme an öff. Diskussionen)
# pp09 (Ggfs. Mitarbeit Bürgerinitiative)
# pp10 (Ggfs. Mitarbeit in Partei)
# pp19 (Ggfs. andere Partei wählen)
# pp60 (Ggfs. Beteiligung Volksabstimmung)
# pp24 (Habe schon politische Meinung gesagt)
# pp25 (Habe mich an Wahlen beteiligt)
# pp26 (Habe an öff. Diskussionen teilgenommen)
# pp28 (Habe schon in Partei mitgearbeitet)
# pp37 (Habe schon andere Partei gewählt)

# pa20 (Meinung Bürgerbeteiligung: Bundesebene)

## Vertrauen in den Staat
# vertrStaat (klein und groß - add. Index vgl. SPSS-Syntax)
# pt-Variablen (Vertrauen in Behörde XY)

## Meinungen zu pol. Beteiligung
# pe05 (Politiker vertreten Interessen der Bev.)
# pe06 (Weiß wenig über Politik)
# pe08 (Durchschnitt: wenig polit. Verständnis)
# pe09 (Wahlbeteiligung ist Bürgerpflicht) --> SEHR WICHTIG!!!
# pe13 (Regelmäßig über Politik informieren)
# pa02a (Politisches Interesse Befragter, Ordinal)

## Wichtigkeit von XY
# va01 (Wichtigkeit von Ruhe und Ordnung) --> SEHR WICHTIG!!!
# va02 (Wichtigkeit von Bürgereinfluss)
# va04 (Wichtigkeit von freier Meinungsäußerung) --> schützenswertes Gut Demokratie - daher vllt. aufn?

## Bin stolz auf...
# pn01 (Bin stolz auf: Grundgesetz)
# pn02 (Bin stolz auf: Bundestag)
# pn06 (Bin stolz auf: dt. wissenschaftl. Leistung) --> unsicher
# pn07 (Bin stolz auf: dt. sozialstaatl. Leistung) --> unsicher

## Verbundenheit mit...
# pn12 (Verbundenheit zur Gemeinde)
# pn16 (Verbundenheit zu Deutschland als Ganzem)
# pn17 (Verbundenheit zur EU und ihren Bürgern)

## Mitgliedsstatus in Vereinen etc.
# alle smXY Variablen --> ist das notwendig? wohl eher weniger...

## Religiosität/Religionsfragen
# rp01 (Kirchgangshäufigkeit)
# hier ist auch noch die Frage, ob die ISSP-Fragen zu Rel. einbezogen werden können

###### BESONDERHEIT - AUFNEHMEN JA NEIN? - FLÜCHTLINGSVARIABLEN
# alle mpXY Variablen


# get allbus18
allbus18 <- read_spss(file = "/Users/flo/Documents/Uni/SS 2020/Wahlforschung Arbeit/allbus 18.sav/allbusdaten18.sav")
allbus18 <- as_tibble(allbus18)


# pa03 - PARTEIPRAEFERENZ VORHANDEN? (Filter für pa04)
# pa04 - PARTEIPRAEFERENZ BEFRAGTER (abhängige Variable):
## labels vergeben auf parteien, var umbenennen, dichotomisieren
### dichotomisieren inkl. namen
# allbus18$pa04 <- factor(allbus18$pa04, ordered = F)
# fre(allbus18$pa04)
# allbus18$pa04 <- car::recode(allbus18$pa04, recodes = "c(1)='Union'; else='Nicht Union'")
# fre(allbus18$pa04)
# allbus18$pa04 <- relevel(allbus18$pa04, ref = "Union")

# vertrStaat - Add. Index zum Vertrauen in den Staat und staatl. Institutionen (mit SPSS angefertigt)
allbus18$vertrStaat <- factor(allbus18$vertrStaat)
fre(allbus18$vertrStaat)

allbus18$vertrStaatKlein <- factor(allbus18$vertrStaatKlein)
fre(allbus18$vertrStaatKlein)

# pv01 - WAHLABSICHT BEFR. BTW --> ab jetzt Var "wahlabs"
allbus18$pv01 <- factor(allbus18$pv01, ordered = F)
fre(allbus18$pv01)
allbus18$pv01 <- car::recode(allbus18$pv01, recodes = "c(1)='KONSERVATIV'; else='NICHT KONSERVATIV'")
fre(allbus18$pv01)
#
allbus18$pv01 <- relevel(allbus18$pv01, ref = "KONSERVATIV")
allbus18 <- dplyr::rename(allbus18, "wahl" = "pv01")
fre(allbus18$wahl)

# numeric gewichtung
allbus18$wghtpew <- as.numeric(allbus18$wghtpew)

# RELABEL IMPORTANT VARIABLES
allbus18$eastwest <- factor(allbus18$eastwest, labels = c("West", "Ost"))
allbus18$eastwest <- relevel(allbus18$eastwest, ref = "West")

allbus18$sex <- factor(allbus18$sex, labels = c("Mann", "Frau"))
allbus18$sex <- relevel(allbus18$sex, ref = "Mann")

allbus18$id02 <- factor(allbus18$id02, labels = c("Unterschicht", "Arbeiterschicht",
                                                      "Mittelschicht", "Obere Mittelschicht",
                                                      "Oberschicht"))
allbus18$id02 <- relevel(allbus18$id02, ref = "Oberschicht")

# #
# ## Wahlbeteiligung ist Bürgerpflicht
# allbus18.1$pe09 <- factor(allbus18.1$pe09, labels = c("Stimme voll zu", "Stimme eher zu",
#                                                       "Stimme eher nicht zu", "Stimme gar nicht zu"))
# #
# #### allbus18.1$pe09 <- as.numeric(allbus18.1$pe09)
# ## Man sollte sich regelmäßig über Politik informieren
# allbus18.1$pe13 <- factor(allbus18.1$pe13, labels = c("Stimme voll zu", "Stimme eher zu",
#                                                       "Stimme eher nicht zu", "Stimme gar nicht zu"))
# #
# #### allbus18.1$pe013 <- as.numeric(allbus18.1$pe13)
# ## Pol. Interesse Befragter (Ordinal)
# allbus18.1$pa02a <- factor(allbus18.1$pa02a, labels = c("Sehr stark", "Stark", "Mittel",
#                                                         "Wenig", "Ueberhaupt nicht"))
# #
# #### allbus18.1$pa02a <- as.numeric(allbus18.1$pa02a)
# ## Befragter ist stolz aufs Grundgesetz
# allbus18.1$pn01 <- factor(allbus18.1$pn01, labels = c("Keine Aussage", "Stolz auf GG"))
# ## Befragter ist stolz auf den Bundestag
# allbus18.1$pn02 <- factor(allbus18.1$pn02, labels = c("Keine Aussage", "Stolz auf BT"))
# ## Verbundenheit Befragter zu: Gemeinde
# allbus18.1$pn12 <- factor(allbus18.1$pn12, labels = c("Stark verbunden", "Ziemlich verbunden",
#                                                       "Wenig verbunden", "Gar nicht verbunden"))
# #
# #### allbus18.1$pn12 <- as.numeric(allbus18.1$pn12)
# ## Verbundenheit Befragter zu: Gesamtdeutschland
# allbus18.1$pn16 <- factor(allbus18.1$pn16, labels = c("Stark verbunden", "Ziemlich verbunden",
#                                                       "Wenig verbunden", "Gar nicht verbunden"))
# allbus18.1$pn16 <- relevel(allbus18.1$pn16, ref = "Stark verbunden")
# #
# #### allbus18.1$pn16 <- as.numeric(allbus18.1$pn16)
# 
# # Vertrauensvariablen im weitesten Sinne Nationalgefühl
# ## Vertr. Befragter: BVerfG
# allbus18.1$pt02 <- factor(allbus18.1$pt02, labels = c("Gar kein Vertrauen", "2", "3", "4", "5", "6", "Sehr großes Vertrauen"))
# #
# #### allbus18.1$pt02 <- as.numeric(allbus18.1$pt02)
# ## Vertr. Befragter: Bundestag
# allbus18.1$pt03 <- factor(allbus18.1$pt03, labels = c("Gar kein Vertrauen", "2", "3", "4", "5", "6", "Sehr großes Vertrauen"))
# #
# #### allbus18.1$pt03 <- as.numeric(allbus18.1$pt03)
# ## Vertr. Befragter: Justiz
# allbus18.1$pt08 <- factor(allbus18.1$pt08, labels = c("Gar kein Vertrauen", "2", "3", "4", "5", "6", "Sehr großes Vertrauen"))
# #
# #### allbus18.1$pt08 <- as.numeric(allbus18.1$pt08)
# ## Vertr. Befragter: Fernsehen
# allbus18.1$pt09 <- factor(allbus18.1$pt09, labels = c("Gar kein Vertrauen", "2", "3", "4", "5", "6", "Sehr großes Vertrauen"))
# #
# #### allbus18.1$pt09 <- as.numeric(allbus18.1$pt09)
# ## Vertr. Befragter: Zeitungswesen
# allbus18.1$pt12 <- factor(allbus18.1$pt12, labels = c("Gar kein Vertrauen", "2", "3", "4", "5", "6", "Sehr großes Vertrauen"))
# #
# #### allbus18.1$pt12 <- as.numeric(allbus18.1$pt12)
# ## Vertr. Befragter: Hochschulen/Unis
# allbus18.1$pt14 <- factor(allbus18.1$pt14, labels = c("Gar kein Vertrauen", "2", "3", "4", "5", "6", "Sehr großes Vertrauen"))
# #
# #### allbus18.1$pt14 <- as.numeric(allbus18.1$pt14)
# ## Vertr. Befragter: Bundesregierung
# allbus18.1$pt15 <- factor(allbus18.1$pt15, labels = c("Gar kein Vertrauen", "2", "3", "4", "5", "6", "Sehr großes Vertrauen"))
# #
# #### allbus18.1$pt15 <- as.numeric(allbus18.1$pt15)
# ## Frage: In D. kann man gut leben
# allbus18.1$pd11 <- factor(allbus18.1$pd11, labels = c("Stimme voll zu", "Stimme eher zu",
#                                                       "Stimme eher nicht zu", "Stimme gar nicht zu"))
# #
# #### allbus18.1$pd11 <- as.numeric(allbus18.1$pd11)
# ## Zufriedenheit mit Arbeit der Bundesregierung
# allbus18.1$ps01 <- factor(allbus18.1$ps01, labels = c("Sehr zufrieden", "Zieml. zufrieden", "Etw. zufrieden",
#                                                       "Etw. unzufrieden", "Zieml. unzufrieden", "Sehr unzufrieden"))
# #
# #### allbus18.1$ps01 <- as.numeric(allbus18.1$ps01)
# 
# ## Wahlverhalten Befragter
# allbus18.1$pv03 <- factor(allbus18.1$pv03, labels = c("Ja", "Nein"))
# 
# ## Wichtigkeit von Sicherheit f. Befragten
# allbus18.1$va01 <- factor(allbus18.1$va01, labels = c("Wichtigkeit"))
# 
# # numerics 
# #### glm --> include; lrm --> not include:
# allbus18.1$wghtpew <- as.numeric(allbus18.1$wghtpew)
# allbus18.1$age <- as.numeric(allbus18.1$age)
# allbus18.1$inc <- as.numeric(allbus18.1$inc)
# allbus18.1$staatl <- as.numeric(allbus18.1$staatl)
# allbus18.1$heimat <- as.numeric(allbus18.1$heimat)
# 
# # dummy von wahlabs
# # subsetGross$wahlabs <- dummies::dummy(subsetGross$wahlabs)

save(allbus18, file = "allbus18.RData")

###############################################

# subsetting main df allbus18
# subsetGroß allbus18 - nur vars, die relevant sind/sein könnten
subsetGross <- subset(allbus18, select = c("pa04", "wahlabs", "eastwest", "german", "dn05", "sex", "age", "work", "educ", "inc", "mstat", "id02", "id03", "wghtpew",
                            "ep01", "ep03", "ep04", "ep06", "pd11", "ps03", "ps01",
                            "pa09", "pa19", "pa12", "pa08a", "fn02", "pa15", "pa16", "pp06", "pp07", "pp08", "pp09",
                            "pp10", "pp60", "pp24", "pp25", "pp26", "pp28", "pp37", "pa20", "vertrStaat", "vertrStaatKlein",
                            "pe05", "pe06", "pe08", "pe09", "pe13", "pa02a", "va01", "va02", "va04",
                            "pn01", "pn02", "pn06", "pn07", "pn12", "pn16", "pn17"))
subsetGross <- as_tibble(subsetGross)
na.omit(subsetGross)
missmap(subsetGross)

##############################
# kleineres Subset
subsetKlein <- subset(allbus18, select = c("wahlabs", "eastwest", "sex", "age", "work", "educ", "inc", "mstat", "id02",
                                           "pd11", "ps01", "va01", "pa12", "pa08a", "fn02", "pe09", "pv03", "pe13", "pa02a",
                                           "pn01", "pn02", "pn12", "pn16", "pt02", "pt03", "pt08", "pt09",
                                           "pt12", "pt14", "pt15"))
subsetKlein <- as_tibble(subsetKlein)
subsetKlein <- na.omit(subsetKlein)
Amelia::missmap(subsetKlein)
fre(subsetKlein$wahlabs)

# # subsetKlein$wahlabs <- dummy.code(subsetKlein$wahlabs, group = "Union")
# summarytools::dfSummary(subsetKlein)

# genauere spezifizierung der vars inkl labels für subsetKlein
# Persönliches zu Befragten
subsetKlein$eastwest <- factor(subsetKlein$eastwest, labels = c("West", "Ost"))
subsetKlein$sex <- factor(subsetKlein$sex, labels = c("Mann", "Frau"))
subsetKlein$educ <- factor(subsetKlein$educ, labels = c("Ohne Abschluss", "Volks-/Mittelschule",
                                                                     "Mittl. Reife", "Fachhochschulreife",
                                                                     "Hochschulreife", "anderer Abschl.",
                                                                     "Noch Schüler"))
# subsetKlein$work <- factor(subsetKlein$work, labels = c("Ganztags", "Halbtags",
#                                                           "Nebenher berufstät.", "Nicht erwerbstät."))
subsetKlein$work <- factor(subsetKlein$work)
# fre(subsetKlein$work)
subsetKlein$work <- combineLevels(subsetKlein$work, levs = c(1, 2, 3), newLabel = "Erwerbstät.")
subsetKlein$work <- combineLevels(subsetKlein$work, levs = c(1), newLabel = "Nicht erwerbstät.")
subsetKlein$work <- relevel(subsetKlein$work, ref = "Erwerbstät.")
subsetKlein$mstat <- factor(subsetKlein$mstat, labels = c("Verh., zsm.lebend", "Verh., getr. lebend",
                                                          "Verwitwet", "Geschieden", "Ledig",
                                                          "Lebensp., zsm.lebend", "Lebensp., getr. lebend"))
subsetKlein$id02 <- factor(subsetKlein$id02, labels = c("Unterschicht", "Arbeiterschicht",
                                                        "Mittelschicht", "Obere Mittelschicht",
                                                        "Oberschicht"))

# EINSTELLUNG BEFR. ZU VERSCH. THEMEN
## Gleichgeschlechtliche Ehe verbieten
subsetKlein$pa12 <- factor(subsetKlein$pa12, labels = c("Stimme voll zu", "Stimme eher zu", "Weder noch",
                                                        "Stimme eher nicht zu", "Stimme gar nicht zu"))
#
#### subsetKlein$pa12 <- as.numeric(subsetKlein$pa12)
## Schwangerschaftsabbruch freistellen
subsetKlein$pa08a <- factor(subsetKlein$pa08a, labels = c("Stimme voll zu", "Stimme eher zu", "Weder noch",
                                                        "Stimme eher nicht zu", "Stimme gar nicht zu"))
#
#### subsetKlein$pa08a <- as.numeric(subsetKlein$pa08a)
## Heirat bei dauerndem Zusammenleben
subsetKlein$fn02 <- factor(subsetKlein$fn02, labels = c("Ja", "Nein", "Unentschieden"))
## Wahlbeteiligung ist Bürgerpflicht
subsetKlein$pe09 <- factor(subsetKlein$pe09, labels = c("Stimme voll zu", "Stimme eher zu",
                                                        "Stimme eher nicht zu", "Stimme gar nicht zu"))
#
#### subsetKlein$pe09 <- as.numeric(subsetKlein$pe09)
## Man sollte sich regelmäßig über Politik informieren
subsetKlein$pe13 <- factor(subsetKlein$pe13, labels = c("Stimme voll zu", "Stimme eher zu",
                                                        "Stimme eher nicht zu", "Stimme gar nicht zu"))
#
#### subsetKlein$pe013 <- as.numeric(subsetKlein$pe13)
## Pol. Interesse Befragter (Ordinal)
subsetKlein$pa02a <- factor(subsetKlein$pa02a, labels = c("Sehr stark", "Stark", "Mittel",
                                                        "Wenig", "Ueberhaupt nicht"))
#
#### subsetKlein$pa02a <- as.numeric(subsetKlein$pa02a)
## Befragter ist stolz aufs Grundgesetz
subsetKlein$pn01 <- factor(subsetKlein$pn01, labels = c("Keine Aussage", "Stolz auf GG"))
## Befragter ist stolz auf den Bundestag
subsetKlein$pn02 <- factor(subsetKlein$pn02, labels = c("Keine Aussage", "Stolz auf BT"))
## Verbundenheit Befragter zu: Gemeinde
subsetKlein$pn12 <- factor(subsetKlein$pn12, labels = c("Stark verbunden", "Ziemlich verbunden",
                                                        "Wenig verbunden", "Gar nicht verbunden"))
#
#### subsetKlein$pn12 <- as.numeric(subsetKlein$pn12)
## Verbundenheit Befragter zu: Gesamtdeutschland
subsetKlein$pn16 <- factor(subsetKlein$pn16, labels = c("Stark verbunden", "Ziemlich verbunden",
                                                        "Wenig verbunden", "Gar nicht verbunden"))
#
#### subsetKlein$pn16 <- as.numeric(subsetKlein$pn16)

# Vertrauensvariablen im weitesten Sinne Nationalgefühl
## Vertr. Befragter: BVerfG
subsetKlein$pt02 <- factor(subsetKlein$pt02, labels = c("Gar kein Vertrauen", "2", "3", "4", "5", "6", "Sehr großes Vertrauen"))
#
#### subsetKlein$pt02 <- as.numeric(subsetKlein$pt02)
## Vertr. Befragter: Bundestag
subsetKlein$pt03 <- factor(subsetKlein$pt03, labels = c("Gar kein Vertrauen", "2", "3", "4", "5", "6", "Sehr großes Vertrauen"))
#
#### subsetKlein$pt03 <- as.numeric(subsetKlein$pt03)
## Vertr. Befragter: Justiz
subsetKlein$pt08 <- factor(subsetKlein$pt08, labels = c("Gar kein Vertrauen", "2", "3", "4", "5", "6", "Sehr großes Vertrauen"))
#
#### subsetKlein$pt08 <- as.numeric(subsetKlein$pt08)
## Vertr. Befragter: Fernsehen
subsetKlein$pt09 <- factor(subsetKlein$pt09, labels = c("Gar kein Vertrauen", "2", "3", "4", "5", "6", "Sehr großes Vertrauen"))
#
#### subsetKlein$pt09 <- as.numeric(subsetKlein$pt09)
## Vertr. Befragter: Zeitungswesen
subsetKlein$pt12 <- factor(subsetKlein$pt12, labels = c("Gar kein Vertrauen", "2", "3", "4", "5", "6", "Sehr großes Vertrauen"))
#
#### subsetKlein$pt12 <- as.numeric(subsetKlein$pt12)
## Vertr. Befragter: Hochschulen/Unis
subsetKlein$pt14 <- factor(subsetKlein$pt14, labels = c("Gar kein Vertrauen", "2", "3", "4", "5", "6", "Sehr großes Vertrauen"))
#
#### subsetKlein$pt14 <- as.numeric(subsetKlein$pt14)
## Vertr. Befragter: Bundesregierung
subsetKlein$pt15 <- factor(subsetKlein$pt15, labels = c("Gar kein Vertrauen", "2", "3", "4", "5", "6", "Sehr großes Vertrauen"))
#
#### subsetKlein$pt15 <- as.numeric(subsetKlein$pt15)
## Frage: In D. kann man gut leben
subsetKlein$pd11 <- factor(subsetKlein$pd11, labels = c("Stimme voll zu", "Stimme eher zu",
                                                        "Stimme eher nicht zu", "Stimme gar nicht zu"))
#
#### subsetKlein$pd11 <- as.numeric(subsetKlein$pd11)
## Zufriedenheit mit Arbeit der Bundesregierung
subsetKlein$ps01 <- factor(subsetKlein$ps01, labels = c("Sehr zufrieden", "Zieml. zufrieden", "Etw. zufrieden",
                                                        "Etw. unzufrieden", "Zieml. unzufrieden", "Sehr unzufrieden"))
#
#### subsetKlein$ps01 <- as.numeric(subsetKlein$ps01)

## Wahlverhalten Befragter
subsetKlein$pv03 <- factor(subsetKlein$pv03, labels = c("Ja", "Nein"))

## Wichtigkeit von Sicherheit f. Befragten
subsetKlein$va01 <- factor(subsetKlein$va01, labels = c("Wichtigkeit"))

# numerics 
#### glm --> include; lrm --> not include:
#### subsetKlein$wghtpew <- as.numeric(subsetKlein$wghtpew)
subsetKlein$age <- as.numeric(subsetKlein$age)
subsetKlein$inc <- as.numeric(subsetKlein$inc)

# # checkt umcodierungen von oben - workflow
# fre(subsetKlein$pt02)
# fre(subsetKlein$pn12)
# fre(subsetKlein$pn02)
# fre(subsetKlein$pn01)
# fre(subsetKlein$id02)
# fre(subsetKlein$mstat)
# fre(subsetKlein$pd11)
# fre(subsetKlein$ps01)
# fre(subsetKlein$va01)
# fre(subsetKlein$pa12)
# fre(subsetKlein$pa08a)
# fre(subsetKlein$fn02)
# fre(subsetKlein$pe09)
# fre(subsetKlein$pv03)
# fre(subsetKlein$pe13)
# fre(subsetKlein$pa02a)

############################# PCA?


fre(subsetGrossPCA$vertrStaatKlein)
summaryDF <- summarytools::dfSummary(subsetGrossPCA)
View(summaryDF)

# kick: alle lmXY variablen, da zu viele NAs

### missmap und na.omit
missmap(subsetKlein)
subsetKlein <- na.omit(subsetKlein)
str(subsetKlein)


### --> für copypaste: nullmodel - totalmodel - stepAIC
nullmod.lrm <- lrm(wahlabs~1, data = subsetKlein)
nullmod.glm <- glm(wahlabs~1, family = "binomial", data = subsetKlein)
# summary(nullmod.glm)
# summary(nullmod.lrm)
#
totalmod.lrm <- lrm(wahlabs~., data = subsetKlein)
totalmod.glm <- glm(wahlabs~., family = "binomial", data = subsetKlein)
# summary(totalmod.glm)
# summary(totalmod.lrm)

# stepAIC für glm
stepAIC(nullmod.glm, direction = "both", test = "Chisq", scope = list(upper = totalmod.glm), data = subsetKlein)
##########
# rms::fastbw --> stepwise function mit aussschlussorientierung auf pValues
fastbw(fit = totalmod.lrm, rule = "p", sls = .5)
## schlüsse aus fastbw
# lrm mit wahlabs~pd11+ps01+va01+pa12+fn02+pn16+pt08+pt12
endmodelLRM<- lrm(wahlabs~pd11+ps01+va01+pa12+fn02+pn16+pt08+pt12, data = subsetKlein)
anova(endmodelLRM)
VIF(endmodelLRM)
ddist <- datadist(subsetKlein)
#
endmodelGLM <- glm(formula = wahlabs ~ ps01 + va01 + pt12 + fn02 + pa12 + pd11 +
                              pn16 + pv03 + pt08 + pn01 + pa08a, family = "binomial", data = subsetKlein)
anova(endmodelGLM)
#
# model.numeric <- glm(formula = wahlabs ~ ps01 + va01 + pt12 + fn02 + pa12 + pn16 + 
#                        pa08a + pt08 + pd11 + pt09 + pv03 + educ + pn01 + inc, family = "binomial", 
#                      data = subsetKlein)
# anova(model.numeric)
# summary(model.numeric)

# model.numeric1 <- model.numeric
# summary(glm(formula = wahlabs ~ ps01 + va01 + pt12 + fn02 + pa12 + pn16 + pa08a + pt08 + pd11 + pt09 + pv03 + pn01, family = "binomial", 
#     data = subsetKlein))
# VIF(model)


## from first endmodel



# # PCA
# ## vorbereitung 1: eigenes subset, mutate: alles auf numeric
# subsetGrossPCA <- subsetGross
# subsetGrossPCA <- as_tibble(subsetGrossPCA)
# 
# subsetGrossPCA <- subsetGrossPCA %>% mutate_if(is.double, as.numeric)
# subsetGrossPCA$wahlabs <- as.numeric(subsetGrossPCA$wahlabs)
# subsetGrossPCA$vertrStaat <- as.numeric(subsetGrossPCA$vertrStaat)
# subsetGrossPCA$vertrStaatKlein <- as.numeric(subsetGrossPCA$vertrStaatKlein)
# 
# str(subsetGrossPCA)
# 
# ## vorbereitung 2: na.omit
# subsetGrossPCA <- na.omit(subsetGrossPCA)
# missmap(subsetGrossPCA)
# 
# # Befehl pca
# pcaRiese <- prcomp(subsetGrossPCA[,c(1:58)], center = T, scale. = T)
# summary(pcaRiese)
# 
# recipe(wahlabs ~ ., data = subsetGross) %>%
#   step_center(all_predictors()) %>%
#   step_scale(all_predictors())
# 
# ?step_scale


# # mit vertr index
# subsetKlein1 <- subset(allbus18, select = c("wahlabs", "eastwest", "sex", "age", "work", "educ", "inc", "mstat", "id02",
#                                            "pd11", "ps01", "va01", "pa12", "pa08a", "fn02", "pe09", "pv03", "pe13", "pa02a",
#                                            "pn01", "pn02", "pn12", "pn16", "vertrStaatKlein", "wghtpew"))
# subsetKlein1 <- as_tibble(subsetKlein1)
# 
# ## vars
# # genauere spezifizierung der vars inkl labels für subsetKlein
# # Persönliches zu Befragten
# subsetKlein1$eastwest <- factor(subsetKlein1$eastwest, labels = c("West", "Ost"))
# subsetKlein1$sex <- factor(subsetKlein1$sex, labels = c("Mann", "Frau"))
# subsetKlein1$educ <- factor(subsetKlein1$educ, labels = c("Ohne Abschluss", "Volks-/Mittelschule",
#                                                         "Mittl. Reife", "Fachhochschulreife",
#                                                         "Hochschulreife", "anderer Abschl.",
#                                                         "Noch Schüler"))
# subsetKlein1$work <- factor(subsetKlein1$work, labels = c("Ganztags", "Halbtags",
#                                                         "Nebenher berufstät.", "Nicht erwerbstät."))
# subsetKlein1$inc <- as.numeric(subsetKlein1$inc)
# subsetKlein1$mstat <- factor(subsetKlein1$mstat, labels = c("Verh., zsm.lebend", "Verh., getr. lebend",
#                                                           "Verwitwet", "Geschieden", "Ledig",
#                                                           "Lebensp., zsm.lebend", "Lebensp., getr. lebend"))
# subsetKlein1$id02 <- factor(subsetKlein1$id02, labels = c("Unterschicht", "Arbeiterschicht",
#                                                         "Mittelschicht", "Obere Mittelschicht",
#                                                         "Oberschicht"))
# 
# # EINSTELLUNG BEFR. ZU VERSCH. THEMEN
# ## Gleichgeschlechtliche Ehe verbieten
# subsetKlein1$pa12 <- factor(subsetKlein1$pa12, labels = c("Stimme voll zu", "Stimme eher zu", "Weder noch",
#                                                         "Stimme eher nicht zu", "Stimme gar nicht zu"))
# ## Schwangerschaftsabbruch freistellen
# subsetKlein1$pa08a <- factor(subsetKlein1$pa08a, labels = c("Stimme voll zu", "Stimme eher zu", "Weder noch",
#                                                           "Stimme eher nicht zu", "Stimme gar nicht zu"))
# ## Heirat bei dauerndem Zusammenleben
# subsetKlein1$fn02 <- factor(subsetKlein1$fn02, labels = c("Ja", "Nein", "Unentschieden"))
# ## Wahlbeteiligung ist Bürgerpflicht
# subsetKlein1$pe09 <- factor(subsetKlein1$pe09, labels = c("Stimme voll zu", "Stimme eher zu",
#                                                         "Stimme eher nicht zu", "Stimme gar nicht zu"))
# ## Man sollte sich regelmäßig über Politik informieren
# subsetKlein1$pe13 <- factor(subsetKlein1$pe13, labels = c("Stimme voll zu", "Stimme eher zu",
#                                                         "Stimme eher nicht zu", "Stimme gar nicht zu"))
# ## Pol. Interesse Befragter (Ordinal)
# subsetKlein1$pa02a <- factor(subsetKlein1$pa02a, labels = c("Sehr stark", "Stark", "Mittel",
#                                                           "Wenig", "Ueberhaupt nicht"))
# ## Befragter ist stolz aufs Grundgesetz
# subsetKlein1$pn01 <- factor(subsetKlein1$pn01, labels = c("Keine Aussage", "Stolz auf GG"))
# ## Befragter ist stolz auf den Bundestag
# subsetKlein1$pn02 <- factor(subsetKlein1$pn02, labels = c("Keine Aussage", "Stolz auf BT"))
# ## Verbundenheit Befragter zu: Gemeinde
# subsetKlein1$pn12 <- factor(subsetKlein1$pn12, labels = c("Stark verbunden", "Ziemlich verbunden",
#                                                         "Wenig verbunden", "Gar nicht verbunden"))
# ## Verbundenheit Befragter zu: Gesamtdeutschland
# subsetKlein1$pn16 <- factor(subsetKlein1$pn16, labels = c("Stark verbunden", "Ziemlich verbunden",
#                                                         "Wenig verbunden", "Gar nicht verbunden"))
# 
# ## Frage: In D. kann man gut leben
# subsetKlein1$pd11 <- factor(subsetKlein1$pd11, labels = c("Stimme voll zu", "Stimme eher zu",
#                                                         "Stimme eher nicht zu", "Stimme gar nicht zu"))
# ## Zufriedenheit mit Arbeit der Bundesregierung
# subsetKlein1$ps01 <- factor(subsetKlein1$ps01, labels = c("Sehr zufrieden", "Zieml. zufrieden", "Etw. zufrieden",
#                                                         "Etw. unzufrieden", "Zieml. unzufrieden", "Sehr unzufrieden"))
# 
# 
# ## Wahlverhalten Befragter
# subsetKlein1$pv03 <- factor(subsetKlein1$pv03, labels = c("Ja", "Nein"))
# 
# ## Wichtigkeit von Sicherheit f. Befragten
# subsetKlein1$va01 <- factor(subsetKlein1$va01, labels = c("Wichtigkeit"))
# 
# # numerics 
# subsetKlein1$wghtpew <- as.numeric(subsetKlein1$wghtpew)
# subsetKlein1$age <- as.numeric(subsetKlein1$age)
# subsetKlein1$inc <- as.numeric(subsetKlein1$inc)
# 
# View(subsetKlein1)
# subsetKlein1 <- na.omit(subsetKlein1)
# 
# ## regression II
# 
# # null1
# ### --> für copypaste: nullmodel - totalmodel - stepAIC
# null1 <- glm(wahlabs~1, family = "binomial", data = subsetKlein1)
# summary(null1)
# #
# total1 <- glm(wahlabs~., family = "binomial", data = subsetKlein1)
# summary(null1)
# #
# stepAIC(null1, direction = "both", test = "Chisq", scope = list(upper = total1), data = subsetKlein1)




# subset.test <- subset(subsetKlein1, select = c("wahlabs", "sex", "age", "work", "vertrStaatKlein", "inc", "id02",
#                                                "va01", "pv03", "pe09", "pn16"))
# 
# 
# 
# summary(glm(wahlabs~., data = subset.test, family = "binomial"))
# 
# 
# 
# 
# summary(glm(wahlabs~., data = subsetKlein, family = "binomial", weights = subsetKlein$wghtpew))


########################### END





