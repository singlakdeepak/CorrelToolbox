#!/bin/bash

# Put the path for directory in INPUT
INPUT=$1
REFER=/usr/local/fsl/data/standard/MNI152_T1_2mm_brain
mkdir $INPUT/TransFiles
cd $INPUT
for filename in *.nii.gz; do
	echo $filename
	outname=${filename%.nii.gz}
	flirt -in $filename -ref $REFER -out TransFiles/$outname.nii.gz \
	-omat TransFiles/$outname.mat \
	-bins 256 -cost corratio -searchrx -90 90 -searchry -90 90 -searchrz -90 90 -dof 12  \
	-interp nearestneighbour
done
