#!/bin/bash

INPUTDIR=$1
REFER=$2
OUTDIR=$3
cd $INPUTDIR
for filename in *.nii.gz; do
	matname=${filename%.nii.gz}
        echo "Processing the file: $filename"
	flirt -in $filename \
	-applyxfm -init $matname.mat \
	-out $OUTDIR$filename -paddingsize 0.0 -interp trilinear \
	-ref $REFER
done
