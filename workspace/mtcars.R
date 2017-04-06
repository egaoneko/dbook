source("dbook.R")
load.packages(c("stringr", "ggplot2", "dplyr", "knitr"))

summary(mtcars)

write.table(mtcars, "workspace/mtcars_new.txt")
cars = read.table("workspace/mtcars_new.txt", header = T)

head(cars)
head(cars, n = 10)
tail(cars)

rownames(cars)
colnames(cars)
cars$mpg

cars$model = rownames(cars)
rownames(cars) = NULL
head(cars)
cars$maker = word(cars$model, 1)
head(cars)

cars.small.narrow = 
  cars %>%
  filter(cyl == 4) %>%
  select(maker, model, mpg, cyl)
cars.small.narrow

makers =
  cars %>%
  group_by(maker) %>%
  summarise(maker.mpg = mean(mpg))
head(makers)

cars.makers = merge(cars, makers, by="maker")
head(cars.makers)

table(cars$cyl)
table(cars$gear, cars$cyl)

hist(cars$mpg)
plot(cars$wt, cars$mpg)

qplot(wt, mpg, data = cars, shape = factor(cyl))
