#repurposing class code to test my models

library(tidyverse)
library(plyr)
library(stats)

load("model_fit_data.Rdata")

cc <- fop

p <- ggplot(data = cc,
             aes(x = Area_Cm, y = Clearance_Rate,)) +
  geom_smooth(method = "gam", color="black",fill="grey65") +
  geom_line(stat="smooth",method="gam", alpha=0.4) +
  geom_point(alpha=0.75) +
  geom_point(alpha=0.75, shape=1,colour="black") +
  scale_y_continuous(name = " Clearance Rate", trans = "log10") +
  scale_x_continuous(name = "Area_Cm", trans = "log10")
p
y <- cc$Clearance_Rate
x <- cc$Area_Cm

#linear model
fit  <- lm(formula = y~x)
plot(fit)
summary(fit)
r2.fit <- summary(fit)$r.squared


#polynomial 2nd degree
fit2 <- lm(formula = y~poly(x,2,raw=TRUE))
plot(fit2)
summary(fit2)
r2.fit2 <- summary(fit2)$r.squared


#polynomial 3 degree
fit3 <- lm(y~poly(x,3,raw=TRUE))
summary(fit3)
r2.fit3 <- summary(fit3)$r.squared

#visually compare model fits
plot(x = x, y = y, pch=19)
lines(0:5, predict(fit, data.frame(x=0:5)), col="red")
lines(0:5, predict(fit2, data.frame(x=0:5)), col="blue")
lines(0:5, predict(fit3, data.frame(x=0:5)), col="green")

#compare R squared values
print(r2.fit); print(r2.fit2); print(r2.fit3)
