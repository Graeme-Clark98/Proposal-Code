#Frame pixel to cm calculator
op <- read.csv(file = "Calculator Outputs/test_out.csv")
#Index, subset, re-ordering, cbind, joining data frames, summarizing data.

#sensor width mm
sw <- 13.2 

#focal length mm
fl <- 8.5

#height m
h <- 10 

#image width pixels
iw <- 3480

#image height pixels
ih <- 2160 

#Function to calculate Ground Sample Distance 
cal = function(sw,h,iw,fl){
  e <- (sw * h * 100)/(iw * fl)
  ef <- e
  return(ef)
}

#calling function call
cal(sw = 13.2, h = 10, iw = op$X19.5, fl = 8.5)

#Creating a column for CM/Pixel in a new dataframe
fop <- cbind(op, cal(sw = 13.2, h = 10, iw = op$X19.5, fl = 8.5))

#changing column names
colnames(fop) <- c("BB_Number","File_Name","Height(P)","Width(P)","Area(P)","CM/Pixel")

#converting area to CM
acm <- fop$"Area(P)" / fop$"CM/Pixel"  

#creating a column for Area Cm
fop <- cbind(fop, acm)

#Changing names again
colnames(fop) <- c("BB_Number","File_Name","Height(P)","Width(P)","Area(P)","CM/Pixel", "Area(Cm)")

#Calculating diameter 
r1 <- acm / 3.14
r2 <- sqrt(r1)
di <- r2 * 2

#adding diameter to final dataframe
fop <- cbind(fop, di)

#Name change
colnames(fop) <- c("BB_Number","File_Name","Height_P","Width_P","A_P","CM/Pixel", "A_Cm", "Diameters")

#calculating Clearance rate from Bell diameter
cr <- -1.5 + (1.5 * di)

#adding clearance rate
fop <- cbind(fop, cr)

#Name Change
colnames(fop) <- c("BB_Number","File_Name","Height_P","Width_P","Area_P","CM/Pixel", "Area_Cm", "Diameters", "Clearance_Rate")

#summarizing data
summary(fop)

#sorting Data
sorted_fop <- lapply(X = fop, sort, decreasing =TRUE)
#writing csv
write.csv(x = fop, file = "Calculator Outputs/Test_Out_GSD.csv")
