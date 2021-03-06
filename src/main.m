%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Date: 09-08-2017                                  Author: Deepak Singla 
% This file accepts the following inputs:               `               %
% 1. fMRI data for n subjects for 2 groups.                             %
% 2. Structural data                                                    %
% 3. ROIs files with r ROIs.                                            %
%                                                                       %
% Output:                                                               %
% 1. r p-value map files.                                               %
% 2. r correlation differnece files.                                    %
% 3. r q-value map files.                                               %
%                                                                       %
%                                                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

path = '/Users/deepaksingla/Desktop/CorrelToolbox/data/cocaine/INPUTFILES/';
AtlasFile = '/Users/deepaksingla/Desktop/CorrelToolbox/data/BN_Atlas_246_3mm.nii.gz';
subjects = dir(fullfile(path,'*.nii.gz'));
AtlasFileinp = load_untouch_nii(AtlasFile);
ROIs = AtlasFileinp.img;
NumROIs = max(max(max(ROIs)));
Nvoxels = zeros(NumROIs,1);

for j = 1:NumROIs
     temp = find(ROIs==j);
     indicesROI{j} = temp;
     Nvoxels(j) = length(temp);
     
%     for i = (j+1):NumROIs
%         indicesROIi = find(ROIs==i);
%     end
end

[MinvoxelsinROI,placemin] = min(Nvoxels);
[MaxvoxelsinROI,placemax] = max(Nvoxels);

allInds = find(ROIs>0);

averagevoxels = mean(Nvoxels);
stddevVoxels = std(Nvoxels);

l = double(1:NumROIs);
A =[l ;Nvoxels'];

FID=fopen('infoFile_2mm.txt','w');
fprintf(FID,  'Minimum ROI voxels: %d , ROI Number: %d\n',[MinvoxelsinROI, placemin]);
fprintf(FID,  'Maximum ROI voxels: %d , ROI Number: %d\n',[MaxvoxelsinROI, placemax]);
fprintf(FID, 'Average Number of voxels in each ROI: %d\n', averagevoxels);
fprintf(FID, 'Standard Deviation of ROIs: %d\n', stddevVoxels);
fprintf(FID, 'No of voxels according to ROIs\n');
fprintf(FID, '%d %d\r\n', A);


fclose(FID);


