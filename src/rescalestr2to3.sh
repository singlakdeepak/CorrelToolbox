fslcreatehd 61 73 61 1 3 3 3 0 0 0 0 2 /Users/deepaksingla/Desktop/CorrelToolbox/data/ref_image_3mm.nii.gz
flirt -in /usr/local/fsl/data/standard/MNI152_T1_2mm_brain.nii.gz -applyxfm \
-init /usr/local/fsl/etc/flirtsch/ident.mat \
-out /Users/deepaksingla/Desktop/CorrelToolbox/data/MNI_3mm_new.nii.gz \
-paddingsize 0.0 -interp nearestneighbour \
-ref /Users/deepaksingla/Desktop/CorrelToolbox/data/ref_image_3mm.nii.gz
