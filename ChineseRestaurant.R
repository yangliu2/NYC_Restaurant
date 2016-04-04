# import the data downloaded from NYC website
load("~/Dropbox/R/RStudio/Chinese Restaurant/NYC chinese restaurant.RData")
#newfile <- read.delim("~/Dropbox/R/RStudio/Chinese Restaurant/newfile.csv")
View(newfile)

# look at the data summary
summary(newfile)

# subset the data with only Chinese in Cuisine.description
data = newfile[newfile['CUISINE.DESCRIPTION'] == "Chinese",]
summary(data)

# subset further with only unique ID (column 2) and Grade (column 16)
grade=data[!duplicated(data[c(2, 16)]),]
View(grade)

# final subset with only unique grade 
final=grade[!duplicated(grade[2]),]
View(final)
summary(final)

# look at zipcodes with most Chinese restaurants in each BORO
# here just QUEENS with top 10 zipcodes
sort(table(final['ZIPCODE']),decreasing=TRUE)[1:10]

# subset each group accoding to BORO
queens = final[which(final['BORO'] == 'QUEENS'),]
View(queens)
sort(table(queens['ZIPCODE']),decreasing=TRUE)[1:10]

# same thing for other 4 BOROS
bronx = final[which(final['BORO'] == 'BRONX'),]
manh = final[which(final['BORO'] == 'MANHATTAN'),]
staten = final[which(final['BORO'] == 'STATEN ISLAND'),]
brooklyn = final[which(final['BORO'] == 'BROOKLYN'),]

# take a look at all of them together
sort(table(manh['ZIPCODE']),decreasing=TRUE)[1:10]
sort(table(queens['ZIPCODE']),decreasing=TRUE)[1:10]
sort(table(bronx['ZIPCODE']),decreasing=TRUE)[1:10]
sort(table(brooklyn['ZIPCODE']),decreasing=TRUE)[1:10]
sort(table(staten['ZIPCODE']),decreasing=TRUE)[1:10]

# look at restaurants with A, B or C grade in Manhattan
manh.A=manh[which(manh['GRADE'] == 'A'),]
manh.B=manh[which(manh['GRADE'] == 'B'),]
manh.C=manh[which(manh['GRADE'] == 'C'),]

# manually calculate the ratio of each grade in Manhattan
manh.ratio = c(347/497, 60/497, 5/497)

# do the same for other Boros
brooklyn.A=brooklyn[which(brooklyn['GRADE'] == 'A'),]
brooklyn.B=brooklyn[which(brooklyn['GRADE'] == 'B'),]
brooklyn.C=brooklyn[which(brooklyn['GRADE'] == 'C'),]
brooklyn.ratio = c(621/755, 40/755, 5/755)

queens.A=queens[which(queens['GRADE'] == 'A'),]
queens.B=queens[which(queens['GRADE'] == 'B'),]
queens.C=queens[which(queens['GRADE'] == 'C'),]
queens.ratio = c(593/731, 61/731, 4/731)

#some data transformation to put all ratios in one dataframe
test1 = list (brooklyn.ratio, manh.ratio, queens.ratio)
as.data.frame(test1)
ratio=as.data.frame(test1)
row.names(ratio) = c('Brooklyn', 'Manhattan', 'Queens')
colnames(ratio) = c('A.Percent', 'B.Percent', 'C.Percent')
View(ratio)

#plot bargraphs to compare each Boro
# graph shows Manhattan restaurants have lower ratio of Grade A
# this could mean they are dirty
# or restaurants in Queen and Brooklyn are newer restaurants

barplot(t)

