# Getting-and-Cleaning-Data

# Overview

This project involves the cleaning, merging, and summarization of the UCI HAR (Human Activity Recognition) dataset. The goal is to produce a tidy dataset where measurements from various sensors (accelerometers and gyroscopes) during different activities are summarized into a dataset that can be used for further analysis or machine learning.

The dataset was collected from 30 subjects performing six different activities. The activities include walking, sitting, standing, and more, measured using various sensors on the body.

# Files

1. **run_analysis.R**: R script that processes the raw dataset, cleans, merges, and summarizes it to generate the final tidy dataset.

2. **tidy_dataset.txt**: The final output of the run_analysis.R script, containing the tidy dataset with summarized mean values for sensor measurements.

3. **CodeBook.md**: Detailed explanation of the dataset variables and their meanings.

4. **README.md**: This file, which explains the project and provides context.

# Steps in the Analysis
1. **Data Reading**: The script begins by reading the necessary files that contain feature labels, activity labels, and the training/test data.

2. **Data Merging**: The training and test datasets are merged together to create one consolidated dataset.

3.**Variable Selection**: The script selects only the variables corresponding to mean and standard deviation measurements for further analysis.

4. **Activity Labeling**: Activity codes are replaced with descriptive activity names.

5. **Descriptive Naming**: The variable names are cleaned up to make them more readable and descriptive (e.g., replacing abbreviations like "Acc" with "Accelerometer").

6. **Tidy Dataset Creation**: The final dataset is created by calculating the mean of each variable for each subject and activity.

7. **Final Output**: The final tidy dataset is saved as tidy_dataset.txt.
