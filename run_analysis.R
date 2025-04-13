# Load necessary library
library(dplyr)


# Read feature and activity label info
features <- read.table("C:/Users/Admin/Desktop/my shit/Data Science Coursera/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt", col.names = c("index", "feature"))
activities <- read.table("C:/Users/Admin/Desktop/my shit/Data Science Coursera/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

# Read training data
subject_train <- read.table("C:/Users/Admin/Desktop/my shit/Data Science Coursera/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("C:/Users/Admin/Desktop/my shit/Data Science Coursera/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
y_train <- read.table("C:/Users/Admin/Desktop/my shit/Data Science Coursera/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", col.names = "code")

# Read test data
subject_test <- read.table("C:/Users/Admin/Desktop/my shit/Data Science Coursera/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("C:/Users/Admin/Desktop/my shit/Data Science Coursera/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
y_test <- read.table("C:/Users/Admin/Desktop/my shit/Data Science Coursera/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", col.names = "code")


# Combine training and test sets
subject_all <- rbind(subject_train, subject_test)
x_all <- rbind(x_train, x_test)
y_all <- rbind(y_train, y_test)

# Combine into one dataset
merged_data <- cbind(subject_all, y_all, x_all)


tidy_data <- merged_data %>%
  select(subject, code, contains("mean"), contains("std"))


tidy_data$code <- activities[tidy_data$code, "activity"]
names(tidy_data)[2] <- "activity"


names(tidy_data) <- names(tidy_data) %>%
  gsub("Acc", "Accelerometer", .) %>%
  gsub("Gyro", "Gyroscope", .) %>%
  gsub("BodyBody", "Body", .) %>%
  gsub("Mag", "Magnitude", .) %>%
  gsub("^t", "Time", .) %>%
  gsub("^f", "Frequency", .) %>%
  gsub("tBody", "TimeBody", .) %>%
  gsub("-mean\\(\\)", "Mean", ., ignore.case = TRUE) %>%
  gsub("-std\\(\\)", "STD", ., ignore.case = TRUE) %>%
  gsub("-freq\\(\\)", "Frequency", ., ignore.case = TRUE) %>%
  gsub("angle", "Angle", .) %>%
  gsub("gravity", "Gravity", .)


final_data <- tidy_data %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

# Save the final tidy dataset
write.table(final_data, "tidy_dataset.txt", row.name = FALSE)

