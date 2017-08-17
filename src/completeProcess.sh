#bash applyomat.sh
#bash applyinterpol.sh "/Users/deepaksingla/Desktop/Correlate/cocaine/INPUTFILES"
INPUTDIR="/Users/deepaksingla/Desktop/CorrelToolbox/data/cocaine/INPUTFILES/"
BETDIR="/Users/deepaksingla/Desktop/CorrelToolbox/data/BET_Files/"
REFER="/Users/deepaksingla/Desktop/CorrelToolbox/data/standardReference.nii.gz"
OUTDIR="/Users/deepaksingla/Desktop/CorrelToolbox/data/REG_Files/"
mkdir BETDIR
mkdir OUTDIR
cp $INPUTDIR*.mat $BETDIR
bash bet_all.sh $INPUTDIR $BETDIR
bash reg_all.sh $BETDIR $REFER $OUTDIR
