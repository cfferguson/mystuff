# Libraries ----
library(tidyverse)
library(car)
library(foreign)
library(lme4)
library(MASS)
library(CCA)
library(psych)


# Data Sets ----
some_ed_data <- read_csv("some_ed_data.csv")
some_exercise_data <- read_csv("some_exercise_data.csv")
some_survey_data <- read_csv("some_survey_data.csv")


# Tests ----

# ~ ANCOVA (Analysis of Covariance) ----
summary(aov(some_ed_data$write ~ some_ed_data$prog + some_ed_data$read))


# ~ Binomial test ----
prop.test(sum(some_ed_data$female),
  length(some_ed_data$female),
  p = 0.5
)


# ~ Canonical Correlation ----
cc(
  cbind(
    some_ed_data$read,
    some_ed_data$write
  ),
  cbind(
    some_ed_data$math,
    some_ed_data$science
  )
)


# ~ Chi-square Test ----
chisq.test(table(some_ed_data$female, some_ed_data$schtyp))


# ~ Chi-square Goodness of Fit ----
chisq.test(table(some_ed_data$race),
  p = c(10, 10, 10, 70) / 100
)


# ~ Correlation ----
cor(
  some_ed_data$read,
  some_ed_data$write
)

cor.test(
  some_ed_data$read,
  some_ed_data$write
)


# ~ Discriminant Analysis ----
fit <- lda(factor(some_ed_data$prog) ~ some_ed_data$read + some_ed_data$write + some_ed_data$math,
  data = some_ed_data
)

fit


# ~ Factor Analysis ----
fa(
  r = cor(model.matrix(~ read + write + math + science + socst - 1,
    data = some_ed_data
  )),
  rotate = "none",
  fm = "pa", 2
)


# ~ Factorial Analysis of Variance (ANOVA) ----
anova(lm(write ~ female * ses,
  xdata = some_ed_data
))


# ~ Factorial Logistic Regression ----
summary(glm(female ~ prog * schtyp,
  data = some_ed_data,
  family = binomial
))

# ~ Friedman test
friedman.test(cbind(
  some_ed_data$read,
  some_ed_data$write,
  some_ed_data$math
))

# ~ Kruskal Wallis Test ----
kruskal.test(some_ed_data$write, some_ed_data$prog)

# ~ McNemar Test ----
made_up_matrixdata <- matrix(c(150, 22, 21, 12), 2, 2)
mcnemar.test(made_up_matrixdata)


# ~ Multiple Regression
lm(some_ed_data$write ~ some_ed_data$female + some_ed_data$read + some_ed_data$math + some_ed_data$science + some_ed_data$socst)


# ~ Multiple Logistic Regression
glm(some_ed_data$female ~ some_ed_data$read + some_ed_data$write,
  family = binomial
)

# ~ Multivariate Multiple Regression
mmrlm <- lm(cbind(write, read) ~ female + math + science + socst,
  data = some_ed_data
)

summary(Anova(mmrlm))


# ~ Non-parametric Correlation ----
cor.test(some_ed_data$read,
  some_ed_data$write,
  method = "spearman"
)


# ~ One Sample *t*-test ----
t.test(some_ed_data$read,
  mu = 50
)


# ~ One-way Analysis of Variance (ANOVA) ----
summary(aov(some_ed_data$read ~ some_ed_data$prog))


# ~ One-way Multivariate Analysis of Variance (MANOVA) ----
summary(manova(cbind(some_ed_data$read, some_ed_data$write, some_ed_data$math) ~ some_ed_data$prog))

# ~ One-way Repeated Measures Analysis of Variance (ANOVA) ----
model <- lm(gender ~ item_1 + item_2,
  data = some_survey_data
)

analysis <- Anova(model,
  idata = factor_surveydata,
  idesign = ~s
)

print(analysis)


# ~ Ordered Logistic Regression ----
some_ed_data$write3 <- cut(some_ed_data$write,
  c(0, 48, 57, 70),
  right = TRUE,
  labels = c(1, 2, 3)
)

table(some_ed_data$write3)

some_write_data <- polr(write3 ~ female + read + socst,
  data = some_ed_data,
  Hess = TRUE
)

summary(some_write_data)


# ~ Paired *t*-test ----
t.test(some_ed_data$write, some_ed_data$read, paired = TRUE)


# ~ Principal Components Analysis (PCA) ----
princomp(
  formula = ~ read + write + math + science + socst,
  data = some_ed_data
)


# ~ Repeated Measures Logistic Regression ----
glmer(highpulse ~ diet + (1 | id),
  data = some_exercise_data,
  family = binomial
)


# ~ Simple Linear Regression ----
lm(some_ed_data$write ~ some_ed_data$read)


# ~ Simple Logistic Regression
glm(some_ed_data$female ~ some_ed_data$read,
  family = binomial
)

# ~ Two Independent Samples *t*-test ----
t.test(some_ed_data$read ~ some_ed_data$female)


# ~ Wilcoxon-Mann-Whitney Test ----
wilcox.test(some_ed_data$read ~ some_ed_data$female)


# ~ Wilcoxon Signed Rank Sum Test ----
wilcox.test(some_ed_data$write,
  some_ed_data$read,
  paired = TRUE
)
