################################### MULTIVARIATE ANALYSE - HYPOTHESENTEST

hypomod <- glm(wahlabs~., data = sub, family = "binomial")
summary(hypomod)
anova(hypomod, test = "Chisq")
str(sub)
fre(sub$staatl)
