#Random Sample Code 

d <- list.files(pattern = ".jpg")
s <- sample(d, size = 150, replace = F)
foldername = sprintf(fmt = "Sample_AUG20_58")
for (f in unique(foldername)) {dir.create(f)}

for (i in 1:length(s)) {
  file.copy(s[i],to = foldername) 
}
