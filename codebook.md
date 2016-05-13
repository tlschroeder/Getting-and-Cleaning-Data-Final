##Features

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 


##Included variables
With the exception of the 'subject' and 'activity' columns- which are fairly self-explanatory identifiers- all data is structured in the following fashion: 
'measurement type' 'force type' 'data source' 'measurement type, where applicable'- 'statistical type' - 'axis'

For example, the variable "timeBodyAccelerometerJerk-StandardDeviation-Z" is the standard deviation of a time-domain measurement of body jerk on the z-axis, taken from the accelerometer.

The final output file contains the following columns:
```
 [1] "subject"          
 [2] "activity"                                                 
 [3] "timeBodyAccelerometer-Mean-X"                             
 [4] "timeBodyAccelerometer-Mean-Y"                             
 [5] "timeBodyAccelerometer-Mean-Z"                             
 [6] "timeBodyAccelerometer-StandardDeviation-X"                
 [7] "timeBodyAccelerometer-StandardDeviation-Y"                
 [8] "timeBodyAccelerometer-StandardDeviation-Z"                
 [9] "timeGravityAccelerometer-Mean-X"                          
[10] "timeGravityAccelerometer-Mean-Y"                          
[11] "timeGravityAccelerometer-Mean-Z"                          
[12] "timeGravityAccelerometer-StandardDeviation-X"             
[13] "timeGravityAccelerometer-StandardDeviation-Y"             
[14] "timeGravityAccelerometer-StandardDeviation-Z"             
[15] "timeBodyAccelerometerJerk-Mean-X"                         
[16] "timeBodyAccelerometerJerk-Mean-Y"                         
[17] "timeBodyAccelerometerJerk-Mean-Z"                         
[18] "timeBodyAccelerometerJerk-StandardDeviation-X"            
[19] "timeBodyAccelerometerJerk-StandardDeviation-Y"            
[20] "timeBodyAccelerometerJerk-StandardDeviation-Z"            
[21] "timeBodyGyroscope-Mean-X"                                 
[22] "timeBodyGyroscope-Mean-Y"                                 
[23] "timeBodyGyroscope-Mean-Z"                                 
[24] "timeBodyGyroscope-StandardDeviation-X"                    
[25] "timeBodyGyroscope-StandardDeviation-Y"                    
[26] "timeBodyGyroscope-StandardDeviation-Z"                    
[27] "timeBodyGyroscopeJerk-Mean-X"                             
[28] "timeBodyGyroscopeJerk-Mean-Y"                             
[29] "timeBodyGyroscopeJerk-Mean-Z"                             
[30] "timeBodyGyroscopeJerk-StandardDeviation-X"                
[31] "timeBodyGyroscopeJerk-StandardDeviation-Y"                
[32] "timeBodyGyroscopeJerk-StandardDeviation-Z"                
[33] "timeBodyAccelerometerMagnitude-Mean"                      
[34] "timeBodyAccelerometerMagnitude-StandardDeviation"         
[35] "timeGravityAccelerometerMagnitude-Mean"                   
[36] "timeGravityAccelerometerMagnitude-StandardDeviation"      
[37] "timeBodyAccelerometerJerkMagnitude-Mean"                  
[38] "timeBodyAccelerometerJerkMagnitude-StandardDeviation"     
[39] "timeBodyGyroscopeMagnitude-Mean"                          
[40] "timeBodyGyroscopeMagnitude-StandardDeviation"             
[41] "timeBodyGyroscopeJerkMagnitude-Mean"                      
[42] "timeBodyGyroscopeJerkMagnitude-StandardDeviation"         
[43] "frequencyBodyAccelerometer-Mean-X"                        
[44] "frequencyBodyAccelerometer-Mean-Y"                        
[45] "frequencyBodyAccelerometer-Mean-Z"                        
[46] "frequencyBodyAccelerometer-StandardDeviation-X"           
[47] "frequencyBodyAccelerometer-StandardDeviation-Y"           
[48] "frequencyBodyAccelerometer-StandardDeviation-Z"           
[49] "frequencyBodyAccelerometerJerk-Mean-X"                    
[50] "frequencyBodyAccelerometerJerk-Mean-Y"                    
[51] "frequencyBodyAccelerometerJerk-Mean-Z"                    
[52] "frequencyBodyAccelerometerJerk-StandardDeviation-X"       
[53] "frequencyBodyAccelerometerJerk-StandardDeviation-Y"       
[54] "frequencyBodyAccelerometerJerk-StandardDeviation-Z"       
[55] "frequencyBodyGyroscope-Mean-X"                            
[56] "frequencyBodyGyroscope-Mean-Y"                            
[57] "frequencyBodyGyroscope-Mean-Z"                            
[58] "frequencyBodyGyroscope-StandardDeviation-X"               
[59] "frequencyBodyGyroscope-StandardDeviation-Y"               
[60] "frequencyBodyGyroscope-StandardDeviation-Z"               
[61] "frequencyBodyAccelerometerMagnitude-Mean"                 
[62] "frequencyBodyAccelerometerMagnitude-StandardDeviation"    
[63] "frequencyBodyAccelerometerJerkMagnitude-Mean"             
[64] "frequencyBodyAccelerometerJerkMagnitude-StandardDeviation"
[65] "frequencyBodyGyroscopeMagnitude-Mean"                     
[66] "frequencyBodyGyroscopeMagnitude-StandardDeviation"        
[67] "frequencyBodyGyroscopeJerkMagnitude-Mean"                 
[68] "frequencyBodyGyroscopeJerkMagnitude-StandardDeviation"
```

##Transformation Overview
Data was transformed from the original dataset via the Run\_ Analysis.R script, which operates as follows:

1. Load all data into R

2. Consolidate the various variables and labels into trainx and testx, convert subject and activity into factors

3. Merge trainx and testx

4. Prune unneeded variables

5. Clean up variables names

6. Reshape data set to averages sorted by subject and activity

7. output the data file