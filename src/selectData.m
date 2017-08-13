function timeSeriesmat = selectData(inp_image,inds, volumes)
timeSeriesmat = zeros(volumes, length(inds));
for i =1: volumes
    tempSlice = inp_image(:,:,:,i);
    timeSeriesmat(i,:)= tempSlice(inds);
end
end