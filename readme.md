##Summary
This repo contains code to convert data from the UCI Human Activity Recognition Using Smartphones Data Set into a cleaner, consolidated format per the course project instructions in the Johns Hopkins Getting and Cleaning Data course hosted on Coursera.

##Script Description
All data transformations take place within the Run\_ Analysis.r file within this repository, which assumes the presence of the unzipped data set in the working directory. Run\_ Analysis.r works through the following sequence:

1. Load all data into R

2. Consolidate the various variables and labels into trainx and testx, convert subject and activity into factors

3. Merge trainx and testx

4. Prune unneeded variables

5. Clean up variables names

6. Reshape data set to averages sorted by subject and activity

7. output the data file

##Included Files
In addition to the readme, this file includes:
Run_Analysis.R, the primary script.
UCI HAR Averages.txt, the output file.
codebook.md, a description of the variables.