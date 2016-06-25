function N = getSparseAcquisitionDerivative( imageKspaceData, estimate , imageKspaceMask)
    N = 2*(ifft2(imageKspaceMask'*imageKspaceMask*fft2(estimate)) - ifft2(imageKspaceMask'*imageKspaceData));
end

