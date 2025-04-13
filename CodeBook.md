
# Codebook for Tidy Dataset

This codebook describes the variables in the tidy dataset created from the UCI Human Activity Recognition (HAR) dataset using the `run_analysis.R` script.

---

## Identifiers

- **subject**  
  *Description*: ID of the subject (participant) performing the activity.  
  *Type*: Integer (ranges from 1 to 30)

- **activity**  
  *Description*: Descriptive activity name corresponding to the coded activity.  
  *Type*: Factor (one of: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

---

## Features

The dataset includes the average of each measurement variable for each activity and each subject. These features were selected because they involve mean and standard deviation values, as per the project requirement.

Each feature is named using a consistent naming convention that indicates:

- The domain: Time (`Time`) or Frequency (`Frequency`)
- The source signal: Body or Gravity
- The instrument: Accelerometer or Gyroscope
- The type of signal: Jerk (rate of change) or Magnitude
- The axis: X, Y, or Z
- The statistic: Mean or STD (Standard Deviation)

Here are a few examples:

- `TimeBodyAccelerometerMeanX`: Mean of the time domain body acceleration signal in the X direction.
- `FrequencyBodyGyroscopeSTDZ`: Standard deviation of the frequency domain gyroscope signal in the Z direction.
- `TimeBodyAccelerometerJerkMagnitudeMean`: Mean of the magnitude of the jerk signal from the body accelerometer in time domain.

_Note: All measurement variables are numeric._

Due to the large number of variables, they follow the naming pattern:

```
<Domain><Signal><Statistic><Axis/Magnitude>
```

Where:
- `<Domain>`: Time or Frequency
- `<Signal>`: BodyAccelerometer, GravityAccelerometer, BodyGyroscope, etc.
- `<Statistic>`: Mean, STD
- `<Axis/Magnitude>`: X, Y, Z, or Magnitude

---

## Summary

This tidy dataset contains:
- One row for each combination of subject and activity
- One column for each of the 66 summarized feature measurements

There are 180 rows (30 subjects × 6 activities) and 88 columns (1 subject + 1 activity + 86 measurement features).

All feature names were cleaned to be descriptive and free of parentheses, dashes, and abbreviations.
