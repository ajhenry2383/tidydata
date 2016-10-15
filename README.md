# Recipe For Producing Tidydata.txt
## Loaded the plyr, dplyr, and tidyr packages necessary to run the script.

## Read the six relevant tables into R (X, y, and subject for training and testing sets)

## Renamed V1 in subject tables “subjectid”

## Renamed V1 in y tables “activityid”

## Used cbind to combine X, y, and subject tables into relevant “test” and “train” sets 
###(order: subject, y, X.  This puts the subject ID first, then the activity ID, then the results.)

## Used rbind to combine “test” and “train” into “data”

## Selected the following columns, called by column number (feature names in parentheses):
###-subjectid
###-activityid
###- V1 (tBodyAcc-mean()-x), V2 (tBodyAcc-mean()-y), V3 (tBodyAcc-mean()-z), V4 (tBodyAcc-std()-x), V5 (tBodyAcc-std()-y), V6 (tBodyAcc-std()-z) (6)
###-V41 (tGravityAcc-mean()-x), V42 (tGravityAcc-mean()-y), V43 (tGravityAcc-mean()-z), V44 (tGravityAcc-std()-x), V45 (tGravityAcc-std()-y), V46 (tGravityAcc-std()-z), (6) (Gravity)
###-V81 (tBodyAccJerk-mean()-x), V82 (tBodyAccJerk-mean()-y), V83 (tBodyAccJerk-mean()-z), V84 (tBodyAccJerk-std()-x), V85 (tBodyAccJerk-std()-y), V86 (tBodyAccJerk-std()-z) (6)
###-V121 (tBodyGyro-mean()-x), V122 (tBodyGyro-mean()-y), V123 (tBodyGyro-mean()-z), V124 (tBodyGyro-std()-x), V125 (tBodyGyro-std()-y), V126 (tBodyGyro-std()-z) (6)
###- V161 (tBodyGyroJerk-mean()-x), V162 (tBodyGyroJerk-mean()-y), V163 (tBodyGyroJerk-mean()-z), V164 (tBodyGyroJerk-std()-x), V165 (tBodyGyroJerk-std()-y), V166 (tBodyGyroJerk-std()-z)(6)
###- V201 (tBodyAccMag-mean()), V202 (tBodyAccMag-std()), (2)
###-V214 (tGravityAccMag-mean()), V215 (tGravityAccMag-std()) (2)
###- V227 (tBodyAccJerkMag-mean()), V228 (tBodyAccJerkMag-std()) (2)
###- V240 (tBodyGyroMag-mean()), V241 (tBodyGyroMag-std()) (2)
###- V253 (tBodyGyroJerkMag-mean()), V254 (tBodyGyroJerkMag-std())(2)
###- V266 (fBodyAcc-mean()-x), V267 (fBodyAcc-mean()-y), V268 (fBodyAcc-mean()-z), V269 (fBodyAcc-std()-x), V270 (fBodyAcc-std()-y), V271 (fBodyAcc-std()-z)(6)
###- V294 (fBodyAcc-meanFreq()-x), V295 (fBodyAcc-meanFreq()-y), V296 (fBodyAcc-meanFreq()-z), (3)
###- V345 (fBodyAccJerk-mean()-x), V346 (fBodyAccJerk-mean()-y), V347 (fBodyAccJerk-mean()-z), V348 (fBodyAccJerk-std()-x), V349 (fBodyAccJerk-std()-y), V350 (fBodyAccJerk-std()-z)(6)
###- V373 (fBodyAccJerk-meanFreq()-x), V374 (fBodyAccJerk-meanFreq()-y), V375 (fBodyAccJerk-meanFreq()-z)(3)
###- V424 (fBodyGyro-mean()-x), V425 (fBodyGyro-mean()-y), V426 (fBodyGyro-mean()-z), V427 (fBodyGyro-std()-x), V428 (fBodyGyro-std()-y), V429 (fBodyGyro-std()-z)(6)
###- V452 (fBodyGyro-meanFreq()-x), V453 (fBodyGyro-meanFreq()-y), V454 (fBodyGyro-meanFreq()-z)(3)
###- V503 (fBodyAccMag-mean()), V504 (fBodyAccMag-std()), (2)
###- V513 (fBodyAccMag-meanFreq()) (1)
###- V516 (fBodyBodyAccJerkMag-mean()), V517 (fBodyBodyAccJerkMag-std())(2)
###- V526 (fBodyBodyAccJerkMag-meanFreq())(1)
###- V529 (fBodyBodyGyroMag-mean()), V530 (fBodyBodyGyroMag-std())(2)
###- V539 (fBodyBodyGyroMag-meanFreq())(1)
###- V542 (fBodyBodyGyroJerkMag-mean()), V543 (fBodyBodyGyroJerkMag-std())(2)
###- V552 (fBodyBodyGyroJerkMag-meanFreq())(1)

## Passed result as data set, then mutated “activityid” column to replace numbers (1,2,3,4,5,6) with descriptors (walking, walking_upstairs, walking_downstairs, sitting, standing, laying)

## Passed result as data set, then gathered data to form a single “value” column, with variable names in new “variable” column

##Passed result as data set, then mutated new “domain” column to show either time (features with “t” prefix) or frequency (“f” prefix)

##Passed result as data set, then mutated new “source” column to show whether body movement (features with “Body” in feature name) or gravity (“Gravity” in name) is responsible for the measurement

##Passed result as data set, then mutated new “tool” column to show whether an accelerometer (“Acc” in feature name) or gyroscope (“Gyro” in name)

##Passed result as data set, then mutated new “measurement” column to indicate if the value represents the “mean” (“mean” in feature name), standard deviation (“std” in name), or the frequency mean (“meanFreq” in name)

##Passed result as data set, then mutated new “axis” column to indicate if the measurement took place on the x-axis (“x”suffix in feature name), y-axis (“y” suffix), z-axis (“z” suffix), or if the indicator is not applicable (NA)(no suffix)

##Passed result as data set, then mutated new “jerk” column to indicate if the value represented jerk signals as indicated by the feature name. (“Yes”/”No”)

##Passed result as data set, then mutated new “magnitude” column to indicate if the value represented the magnitude of the three dimensional signals as indicated by the feature name. (“Yes”/”No”)

##Passed result as data set, then used arrange to remove “variable” column and order the resulting matrix as: subjectid, activityid, domain, source, tool, magnitude, axis, value.

##Aggregated value column using mean, producing the average measurement per combination of the other nine variables.

## Renamed resulting “x” column as “meanvalue”

##Printed table to file “~/tidydata.txt”.
