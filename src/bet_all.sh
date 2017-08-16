#!/bin/bash

echo "Hello, "$USER". Please enter the directory where the files are kept"
read DATADIR
echo "Please give the output directory where files are to be kept after brain extraction"
read OUTDIRNAME
#DATADIR=/Users/deepaksingla/Desktop/CorrelToolbox/data/cocaine/
#FURTHDIR=/session_1/rest_1/pre_rest_linearMNI3mm.feat
cd $DATADIR

for filename in *.nii.gz; do
	echo "Processing the file: $filename"
	bet $filename $OUTDIRNAME/$filename 
done

