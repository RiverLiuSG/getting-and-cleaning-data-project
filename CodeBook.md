CodeBook
This is a code book that describes the variables, the data, and any transformations or work that I perform to clean up the data.

The data source
•	Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
•	Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The data
The dataset includes the following files:
•	'README.txt'
•	'features_info.txt': Shows information about the variables used on the feature vector.
•	'features.txt': List of all features.
•	'activity_labels.txt': Links the class labels with their activity name.
•	'train/X_train.txt': Training set.
•	'train/y_train.txt': Training labels.
•	'test/X_test.txt': Test set.
•	'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.
•	'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
•	'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
•	'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.
•	'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

Transformation details
There are 5 parts:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

How dcproject.R implements the above steps:
•	Load the package of “reshape”
•	Load both test and train data, combine them into one data set, extract the measurements on the mean and standard deviation.
•	Load the subjects and activity labels, create one subject and activity data set and combine with data set
•	Transform the shape of data set from wide to long with melt() function and use cast() function to calculate the average regarding the subject and the activity. The shape will change back to wide 
from long
•	Generate tidy data set

Variables in the tidy dataset

subject
This is the numeric ID that denotes the subject (person) whose activity was measured. Values are from 1 to 30.

activity
The type of activity. Values are WALKING,WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING

features
All measurement features come from either the accelerometer (measured in g's [9.80665 m/seg2]) or the gyroscope (measured in rad/sec) measurements normalized to [-1,1] and averaged for all data in a single subject for each activity type

The different variable names contain information about its meaning by combining all the name parts
1.	t at the beginning means that is a measurement based on the "time" domain. Measurements taken from the phone were measured at a frequency of 50Hz, meaning 50 discrete measurements per second.
2.	f at the beginning means that is a measurement based on the "frequency" domain, taken as a Fast Fourier Transform of the time-based signals.
3.	Body means that signal is based on the body of the subject, one of two components derived from the time based signals on the phone's accelerometer
4.	Gravity means that signal is based on gravity. Gravity is the second of the two measurement components derived from the phone's accelerometer.
5.	Gyro means that signal is taken from the gyroscope on the phone.
6.	Jerk means that is a measurement of sudden movement, based on body acceleration and angular velocity.
7.	Mag indicates a measurement of the magnitude of the Euclidean norm of a three-dimensional signal.
8.	X indicates that measurement was taken along the "X" dimension of the phone, as in a three-dimensional Cartesian coordinate system of X, Y and Z.
9.	Y indicates that measurement was taken along the "Y" dimension of the phone, as in a three-dimensional Cartesian coordinate system of X, Y and Z.
10.	Z indicates that measurement was taken along the "Z" dimension of the phone, as in a three-dimensional Cartesian coordinate system of X, Y and Z.
11.	mean() indicates that the measurement is a mean in the original dataset
12.	std() indicates that the measurement is a standard deviation in the original dataset.

