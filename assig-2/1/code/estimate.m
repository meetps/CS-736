function [objective,delta] = estimate(l1,l2,l3,t,g,Sg)
    J = zeros(6,3);
    s = 0.01; 
    lambda = 0.00005;
    L = [l1 0; l2 l3];
    for i=1:6
        err(i) = Sg(i) - exp(-0.1*g(i,:)*(L*L')*g(i,:)');
        J(i,:) = 0.2.*exp(-0.1*g(i,:)*(L*L')*g(i,:)').*[l1*g(i,1)^2 + l2*g(i,1)*g(i,2), l2*g(i,2)^2 + l1*g(i,1)*g(i,2), l3*g(i,2)^2 ];
    end

    objective = sum(abs(err.*err));
    if(t==1)
        delta = -s*inv(J'*J+lambda*diag(diag(J'*J)))*J'*err';
    else
        delta = 0;
    end     
end