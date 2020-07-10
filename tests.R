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
(endmodelLRM)
#
endmodelGLM <- glm(formula = wahlabs ~ ps01 + va01 + pt12 + fn02 + pa12 + pd11 +
                     pn16 + pv03 + pt08 + pn01 + pa08a, family = "binomial", data = subsetKlein)
anova(endmodelGLM)

###########################################################

kableUnivarWahlabs <- kable(fre(allbus18$wahlabs, weight = allbus18$wghtpew))

# rmarkdown::paged_table(fre(allbus18$wahlabs, weight = allbus18$wghtpew))
# fre(allbus18$wahlabs, weight = allbus18$wghtpew)

