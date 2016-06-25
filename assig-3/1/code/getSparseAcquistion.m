function N = getSparseAcquistion( imageKspaceData, estimate, imageKspaceMask )
    N = abs(imageKspaceData-imageKspaceMask*fft2(estimate)).^2;
end

