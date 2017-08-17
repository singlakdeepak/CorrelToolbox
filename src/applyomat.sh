#!/bin/bash

DATADIR=~/Desktop/CorrelToolbox/data/cocaine/
FURTHDIR=/session_1/rest_1/pre_rest_linearMNI3mm.feat
OUTDIRNAME=INPUTFILES
cd $DATADIR

for filename in *; do
	echo $filename
	mv $filename$FURTHDIR/reg/example_func2standard.mat $filename.mat 
done

mkdir $OUTDIRNAME
mv *.mat $OUTDIRNAME/
