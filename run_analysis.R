# run_analysis.R
#   John C McDavid
#   Getting and Cleaning Data - Coursera Course
#   Course Project
#   09-30-2016, rev 10-16-2016

# Sec 1. sets the working directory, reads in files and does some data exploration, exploratory analysis

setwd("C:\\Users\\jcmcd\\Coursera - Getting and Cleaning Data (II)")

# files were directly downloaded, unzipped into working directory
list.files("./UCI HAR Dataset")
list.files("./UCI HAR Dataset/train")
list.files("./UCI HAR Dataset/test")

# read features
features <- read.table("./UCI HAR Dataset/features.txt")  # 561 x 2
dim(features)

# read activity labels
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")  # 6 x 2  col 1 = #, col 2 = word descr
dim(activity)

# reads in x_train dataset
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")  # 7352 x 561
dim(xtrain)
# str(xtrain)
max(xtrain)  # 1    this shows data was normalized to [-1, 1] as described and expected
min(xtrain)  # -1
xtrain[1:10, 1:10]

# reads in x_test dataset
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")  # 2947 x 561
dim(xtest)
# str(xtest)
max(xtest)  # 1    this shows data was normalized to [-1, 1] as described and expected
min(xtest)  # -1
xtest[1:10, 1:10]

#reads activity codes for each obs
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")  # 7352 x 1, identifies activ 1-6
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")     # 2947 x 1, identifies activ 1-6
dim(ytrain)
dim(ytest)
unique(ytrain)
unique(ytest)

# reads subject id for each obs
subtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")  # 7352 x 1, # subj in each obs
subtest <- read.table("./UCI HAR Dataset/test/subject_test.txt")     # 2947 x 1, # subj in each obs
unique(subtrain)
dim(unique(subtrain))   # 21 subjects (70%)
unique(subtest)
dim(unique(subtest))    # 9 subjects (30%)

# Sec II. extract vars "mean" and "std" from names; subset datasets to selected vars; combine train, test datasets

#   - there are 33 mean, 33 std, 13 meanFreq, 1 Accmean, 6 gravitymean
#   * There's some discussion abt what to include, specifically re: "mean" vars
#        Orig I decided to include 33 mean vars, but on reconsideration I will also include the 13 meanFreq vars
#        The other variables with "mean" in the text are not appropriate to include (angle vars)
#   - alt code below is available if other combin of vars were desired to be included, see notes and ReadMe.md file
#   - decision to extract 33 means, 33 std, and 13 meanfreq; but not other vars w "mean" in it (7)

###  The code block below examines and gives code to extract various combin of "mean", "std"; looks at names in features
grep("mean",features[,2], ignore.case = TRUE)         # 53
# [1]   1   2   3  41  42  43  81  82  83 121 122 123 161 162 163 201 214 227 240 253 266 267 268 294 295 296 345 346 347 373
# [31] 374 375 424 425 426 452 453 454 503 513 516 526 529 539 542 552 555 556 557 558 559 560 561
grep("-mean",features[,2], ignore.case = TRUE)        # 46
# [1]   1   2   3  41  42  43  81  82  83 121 122 123 161 162 163 201 214 227 240 253 266 267 268 294 295 296 345 346 347 373
# [31] 374 375 424 425 426 452 453 454 503 513 516 526 529 539 542 552
grep("meanFreq",features[,2], ignore.case = TRUE)     # 13
# [1] 294 295 296 373 374 375 452 453 454 513 526 539 552
grep("-mean\\(\\)",features[,2], ignore.case = TRUE)  # 33 mean
# [1]   1   2   3  41  42  43  81  82  83 121 122 123 161 162 163 201 214 227 240 253 266 267 268 345 346 347 424 425 426 503
# [31] 516 529 542
grep("std",features[,2], ignore.case = TRUE)          # 33 std
# [1]   4   5   6  44  45  46  84  85  86 124 125 126 164 165 166 202 215 228 241 254 269 270 271 348 349 350 427 428 429 504
# [31] 517 530 543

# below... grep only returns row #s, length of grep returns # elmts
length(grep("-mean\\(\\)",features[,2], ignore.case = TRUE))      # 33 mean     have to use escape chars \\ for ()
length(grep("-meanfreq\\(\\)",features[,2], ignore.case = TRUE))  # 13 meanfreq
length(grep("-mean",features[,2], ignore.case = TRUE))            # 46 gets mean, meanfreq
length(grep("mean",features[,2], ignore.case = TRUE))             # 53 gets mean, meanfreq, Accmean (1), gravitymean (6)
length(grep("std",features[,2], ignore.case = TRUE))              # 33 std
###  end examining, extracting code block for various alternatives


# only need xtrain, ytrain, subtrain; same 3 vars for test  (81 = 33 mean, 33 std, 13 meanFreq, 1 id, 1 activ)
# select only nec cols from xtrain, xtest (used mean, std, meanfreq, but not gravitymean (6), Accmean (1) vars)
#   - the purist in me wants to only select 33 mean, 33 std
#   - made decision to extract 33 means, 33 std, 13 meanFreq; and not to extract other vars w "mean" in it (7) - see above
# 1. use grep to pull mean, std col #s; and combine all nec col #s
# 2. subset to xtrain2, xtest2
# 3. combine by rbind to single dataset
# orig was only going to incl 33 mean, 33 std vars but upon reconsideration, decided to also incl 13 meanFreq vars,
#    so next line not used, and line following that was used instead (actually easier)
# n_mean <- grep("-mean\\(\\)",features[,2], ignore.case = TRUE)   # 33 mean     have to use escape chars \\ for ()
n_mean <- grep("-mean",features[,2], ignore.case = TRUE)           # 46 mean, meanFreq
n_std <- grep("std",features[,2], ignore.case = TRUE)              # 33 std
n_all <- c(n_mean, n_std)           # note that this puts all mean (incl meanFreq) first, then all std
n_all <- sort(n_all)                # sorts indices, so order is per order of orig dataset
xtrain2 <- xtrain[ , n_all]
xtest2 <- xtest[ , n_all]
dim(xtrain2)     # 7352 x 79
dim(xtest2)      # 2947 x 79

# cbind subtrain, ytrain, xtrain2 to get subject #, activity #, data cols; then same for test, layout is same
alltrain <- cbind(subtrain, ytrain, xtrain2)
alltest <- cbind(subtest, ytest, xtest2)

dim(alltrain)  # 7352 x 81
dim(alltest)   # 2947 x 81

#rbind alltrain, alltest - combine datasets
master <- rbind(alltrain, alltest)

master3 <- master
dim(master3)    # [1] 10299    81

# add descriptive var names to master3 dataset (from orig research study, feature ds)
fnames <- as.character(features[n_all,2])
fnames2 <- c("Subject ID", "Activity Label", fnames[1:79])
names(master3) <- fnames2

nr <- nrow(master3)     # 10299
# replace col 2 w descriptive label for activity instead of number
for (i in 1:nr) {
    master3[i,2] <- as.character(activity[master[i,2],2])
}

# Sec 3. Prepare summary tidy dataset...means of all vars
# using aggregate method
Signals3 <- aggregate(master3[,3:81], by = list(master3[,2], master3[,1]), FUN = mean)
names(Signals3)     # note these names are from predecessor ds, need to b chgd to reflect mean fcn

Signals4 <- Signals3[,c(2,1,3:81)]    # reorder cols 1, 2 (preference)...want subject # first, then activity desc
dim(Signals4)       # [1] 180  81

# add names to summary tidy dataset, Signals4
fnamesB <- paste("Avg.",fnames,sep="")          # for final tidy data set, mod col names
fnamesB2 <- c("Subject ID", "Activity Label", fnamesB[1:79])
names(Signals4) <- fnamesB2                     # replace w final set names


# write table to disk
write.table(Signals4, file = "Signals4.txt", row.names = FALSE)

# cmd to read file in as a table and View it...
Signals4Rd <- read.table(file = "Signals4.txt", header = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
View(Signals4Rd)

# verify read table is same as written table
library(compare)
compare(Signals4, Signals4Rd)
# TRUE

### end code