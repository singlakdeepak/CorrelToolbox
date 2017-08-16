#!/bin/bash

#echo "Hello, "$USER". Please enter the directory where the files are kept"
#read DATADIR
DATADIR=~/Desktop/CorrelToolbox/data/cocaine/
FURTHDIR=/session_1/rest_1/pre_rest_linearMNI3mm.feat
OUTDIRNAME=INPUTFILES
cd $DATADIR

for filename in *; do
	echo $filename
	bet $filename$FURTHDIR/fslmaths_filtered_func_data.nii.gz $filename.nii.gz 
done

mkdir $OUTDIRNAME
mv *.nii.gz $OUTDIRNAME/
