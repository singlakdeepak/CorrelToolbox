#!/bin/bash

INPUTDIR=$1
OUTDIR=$2
cd $INPUTDIR

for filename in *.nii.gz; do
	echo "Processing the file: $filename"
	bet $filename $OUTDIR$filename 
done

