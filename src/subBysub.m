function ROIsFile= subBysub(subjects, path, indicesROI, NumROIs)

for k = 1: length(subjects)
    basesubBrain = subjects(k).name;
    fullsubBrainName = fullfile(path, basesubBrain);
    input = load_untouch_nii(fullsubBrainName);
    %inp_hdr = input.hdr;
    inp_image = double(input.img);
    f = size(inp_image);

    N_vols =f(4);
    %N = 1:N_vols;
    %N_slices = f(3);
    ROIsFile = zeros(f(1),f(2),f(3),NumROIs);
    for i = 1:(NumROIs-1)
        fprintf('Working on %i th ROI\n',i);
        thisROIinds = indicesROI{i};
        thisROI_Timeseries = selectData(inp_image, thisROIinds,N_vols);
        put_in_this_ROIimg = ROIsFile(:,:,:,i);
        for j = (i+1):NumROIs
            put_in_that_ROIimg = ROIsFile(:,:,:,j);
            thatROIinds = indicesROI{j};
            thatROI_Timeseries = selectData(inp_image, thatROIinds, N_vols);
            CorrelbwROIs = corr(thisROI_Timeseries,thatROI_Timeseries);
            CorrelbwROIs(isnan(CorrelbwROIs)) = 0 ;
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % Now we want some function for calculating the mean correl-
            % ation along direction 1. For now, I'll use simple mean 
            % of all the correlation values.
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            put_in_this_ROIimg(thatROIinds) = mean(CorrelbwROIs,1);
            put_in_that_ROIimg(thisROIinds) = mean(CorrelbwROIs,2);
            ROIsFile(:,:,:,j) = put_in_that_ROIimg;
            
            % For seeing the mean values, put CorrelbwROIs as the output
        end 
    end
    
end
end
