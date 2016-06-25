function [X, Gamma] = getEMLabels( Y, M, K, X, u, s, beta, show_values )
   [r, c] = size(Y);
   
   Gamma = zeros(r, c, K);
   membership_beta = beta;
   
   for count = 1:25
       [X, u, s] = getIcmLabels( Y, M, K, X, u, s, beta, show_values);
       
       for i = 2:r-1
           for j = 2:c-1
               if (M(i, j) == 0)
                   continue;
               end;
                   
               memberships = zeros(1, K);
               for x = 1:K
                   prior = getPrior(X, x, i, j, M, membership_beta);
                   posterior = exp(- ( 1 - membership_beta ) * (Y(i, j) - u(1, x))^2 / (2 * s(1, x) * s(1, x)));
                   memberships(1, x) = prior * posterior;
               end;
               
                memberships = memberships ./ sum(memberships(:));
                if (sum(isnan(memberships)) > 0)
                    Gamma(i,j,:) = Gamma(i,j,:);
                else
                    Gamma(i,j,:) = memberships;
                end
               
           end;
       end;
       
       for label = 1:K
           D = sum(sum(Gamma(:, :, label)));
           S = Gamma(:, :, label) .* Y(:, :);
           S = sum(S(:));
           u(1, label) = S / D;

           S = (Y(:, :) - u(1,label)).^2;
           S = Gamma(:, :, label) .* S;
           S = sum(S(:));
           s(1, label) = sqrt(S / D);
       end;
   end; 

end

