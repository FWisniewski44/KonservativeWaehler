# Erstellung add. Index "Bürgerpflichten"
## Variablen:
### pe09 (WAHLBETEILIGUNG IST BÜRGERPFLICHT)
### pe13 (REGELMAESSIG UEBER POLITIK INFORMIEREN)

allbus18$pe09 <- as.numeric(allbus18$pe09)
fre(allbus18$pe09)
class(allbus18$pe09)
pe09 <- allbus18$pe09
#
allbus18$pe13 <- as.numeric(allbus18$pe13)
fre(allbus18$pe13)
class(allbus18$pe13)
pe13 <- allbus18$pe13
#

## Index:
buergerpfl <- (pe09 + pe13)
allbus18$buergerpfl <- buergerpfl
fre(allbus18$buergerpfl)
class(allbus18$buergerpfl)

## näher Index:
# allbus18 <- relevel(allbus18$buergerpfl, ref = "2")
# ref-level unnötig, da numeric/quasi-metrischer index
##############################################################################################



