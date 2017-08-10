# Logs Date-Wise

## 10-08-2017: Atlas Problem
* Calculating the info about the atlases, I found that I need to ensure that all the variables in matlab are in **double** format. Otherwise, you'll get the wrong answers. 
* The BrainNetome 2mm atlas gets overlayed on MNI space and they have same dimensions also. It can be checked by fsleyes. 
* If the data is given in 3mm format and while you are having the atlas in 2mm, then get the Transformation matrix by registering the subjects on **MNI152_T1_2mm_brain.nii.gz** with nearest neighbor interpolation ensured and then multiply the ROIs with the transformation matrix in order to get the ROI atlas in 3mm. Otherwise, you can straightaway work with atlas of 3mm.
