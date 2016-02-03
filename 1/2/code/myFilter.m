function [ filteredImage ] = myFilter( image,fraction, filterId )
%% Apply the filters to the image in f-Domain

filteredFreqImage = fft(image);
N = size(image,1);

w = 2*pi/N*(0:N-1);
w = (w-w(round(N/2)))';

L = pi*fraction;

% Ram-Lak filter
if filterId == 1
    frequencyFilterMask = abs(w);
    frequencyFilterMask(abs(w)> L) = 0;
    
% Shepp-Logan filter
elseif filterId == 2
    frequencyFilterMask = abs(w).*sin(0.5*pi*w/L)./(0.5*pi*w/L);
    frequencyFilterMask(w == 0) = 0;
    frequencyFilterMask(abs(w)> L) = 0;

% Cosine filter     
elseif filterId == 3
    frequencyFilterMask = abs(w).*cos(0.5*pi*w/L);
    frequencyFilterMask(abs(w)> L) = 0;       
end

frequencyFilterMask = repmat(ifftshift(frequencyFilterMask),1,size(image,2));
filteredImage = real(ifft(filteredFreqImage.*frequencyFilterMask));    
end