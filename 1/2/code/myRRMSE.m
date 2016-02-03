function [ e ] = myRRMSE( A,B )

e = sqrt(sum((A(:)-B(:)).^2)/sum((A(:)).^2));

end
