#Making a plot using ggplot comparing bell diameter and clearance rate 

library(ggplot2)
install.packages("ggpubr")
library(ggpubr)\


a <- subset(x = fop, Area_Cm < 100, select = "Area_Cm")
max(a)            
cr <- subset(x = fop, Clearance_Rate < 20, select = "Clearance_Rate")

f <- data.frame(a, cr)

p <- ggplot(data = f, aes(x = Area_Cm, y = Clearance_Rate)) +
  geom_point() +
plot(p)
summary(p)

p2 <- ggplot(data = fop, aes(x = Diameters))+
  geom_histogram()
plot(p2)
ggsave("Diameter_Count.jpeg")


d <- subset(x = fop, select = c(Diameters))
d1 <- data.frame(d)
size <- data.frame(1:409)

for (size in length(df1)){
  df1 <- ifelse(df1$Diameters<6, yes = df1$Size <- "small",no = df1$Size <- "large")
}
df <- merge(x = d1, y = size, by=c("diameter"))
df1 <- subset(df, X1.409 < 2)
colnames(df1)[colnames(df1) == "X1.409"] <- "Size"

df2 <- cbind(d, df1)
colnames(df2)[colnames(df2) == "df1"] <- "Size"

p2 <- ggplot(data = fop, aes(x = df2$Size))+
  geom_bar()
plot(p2)
