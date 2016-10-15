#Tidydata.txt Codebook

#Tidydata.txt - 14,220 observations.  10 variables.

##Creation of table 

The purpose of this assignment was to find the mean measurements of human activity as recorded by smartphones.  Only observations representing means and standard deviations were to be used for the final set.

The original datafiles on “Human Activity Recognition Using Smartphones”. came from datasets provided by the University of California Irvine’s Machine Learning Repository.

(URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Eight tables were used to create the desired result.  Three tables represented the “testing” set (subject_test, X_test, y_test), three represented the “training” set (subject_train, X_train, y_train), one provided the labels for activityid (activity_labels), while the last provided the labels for the 552 variables contained within the X tables (features).  The first six tables were read into R, then combined so that the subject id would be in column 1, activity id in column 2, and the variables from the X tables in subsequent columns to the right.  

Only the columns referring to measurements of mean, standard deviation, and meanFrequency (according to the features table) were then selected to be a part of the final dataset..  Mean and standard deviation were explicitly called out in the assignment, while “meanFrequency” ultimately satisfied the requirements for including “means” as well.  Columns referring to “angles”, even those measuring the angles created by means and standard deviations, were considered discrete measurements and left out of the final dataset.  

The remaining dataset was then “gathered” to ensure only one measured value appeared in each row.  The variable names were formatted into a column to identify what the measurement represented.  Using the features table, new columns containing the domain, source, tool, measurement method, whether or not jerk motion was measured, and whether or not the magnitude of motion was measured for each value were derived based upon the entry in the “variable” column.  More detail can be found in the “variables” section.

The resulting table was then formatted into a ten column table, keeping everything but the now unnecessary “variable” column.  The mean measurement for each existing combination of the nine identifying variables was then taken and printed into the tidydata.txt file.


##Variables

Each variable is named, with the following information provided:
- Definition: What the variable represents.
- Obtained: Where the information contained in the column was found, as well as how codes or abbreviations were translated.
- Format: Format of the variable as it appears in R.
- Values: The values that can be found within each variable.  Integers and numerics are represented as ranges (lowest value rounded to nearest integer:high number rounded to nearest integer)

###subjectid - 

####Definition: Numerical ID assigned to each participant (subject)
####Obtained: Assigned in original study
####Format: Integer
####Values: 1:30

###activityid - 

####Definition: Activity performed by subject to produce desired measurements.
####Obtained: Appeared as integers in original “y” table.  Values were assigned according to the activity labels provided in the original dataset.  1 = “walking”, 2 = “walkingupstairs”, 3 = “walkingdownstairs”, 4 = “sitting”, 5 = “standing”, 6 = “laying”.
####Format: Character
####Values: “laying”, “sitting”, “standing”, “walking”, “walkingdownstairs”, “walkingupstairs”.

###domain - 

####Definition: Denotes whether time or frequency was measured..
####Obtained: Listed as the prefix within the name assigned to the original variables.  Names with “t” prefix were coded as “time”, while those with “f” are coded as “frequency.”
####Format: Character
####Values: “frequency”,”time”


###source - 

####Definition: Denotes the source of the results - body or gravity.
####Obtained: Listed within the name assigned to the original variables.  Names with “Body” were coded as “body”, while those with “Gravity” are coded as “gravity.”
####Format: Character
####Values: “body”,”gravity”


###tool - 

####Definition: Denotes tool used to obtain results.
####Obtained: Listed within the name assigned to the original variables.  Names with “Acc” were coded as “accelerometer”, while those with “Gyro” are coded as “gyroscope.”
####Format: Character
####Values: “accelerometer”,”gyroscope”

###measurement - 

####Definition: Denotes the method of measurement.
####Obtained: Listed within the name assigned to the original variables (“mean”=”mean”, “std” = “standarddeviation”, “meanFreq” = “frequencymean”).
####Format: Character
####Values: “frequencymean”,”mean”,”standarddeviation”

###jerk - 

####Definition: Denotes whether jerk motion is measured
####Obtained: Listed within the name assigned to the original variables.  Variables with “Jerk” in name are marked “yes.”
####Format: Character
####Values: “yes”,”no”

###magnitude - 

####Definition: Denotes whether the magnitude of the three-dimensional motion is measured
####Obtained: Listed within the name assigned to the original variables.  Variables with “Mag” listed in name are marked “yes.”
####Format: Character
####Values: “yes”,”no”

###axis - 

####Definition: Denotes the axis on which the measurement took place (if applicable).
####Obtained: Listed as suffix in the name assigned to the original variables (listed as “x”,”y”, or “z”).  If no axis named, entry coded as NA.
####Format: Character
####Values: “x”, “y”, “z”, “NA”

###meanvalue - 

####Definition: Average of observed measurements across preceding variables.
####Obtained: Original values obtained in initial study.  Values then averaged according to the other nine variables.
####Format: Numeric
####Values: -1:1

