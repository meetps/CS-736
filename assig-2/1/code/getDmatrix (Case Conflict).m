function [D,L,objective,d1,d2,d3,d4] = getDMatrix(l1,l2,l3)

g = [[1, 0]; [0.866, 0.5]; [0.5, 0.866]; [0, 1]; [-0.5, 0.866]; [-0.866, 0.5]];
Sg = [0.5045 - 1i*0.0217, 0.6874 + 1i*0.0171, 0.3632 + 1i*0.1789, 0.3483 + 1i*0.1385, 0.2606 - 1i*0.0675, 0.2407 + 1i*0.1517];

d1 = [];
d2 = [];
d3 = [];
d4 = [];
objective = [];

theta = [l1; l2; l3];
J = zeros(6,3);
iter =1;
delta_error = -10;
    while ((delta_error < 0))
        [out,delta] = estimate(theta(1),theta(2),theta(3),1,g,Sg);
        thetaNew = double(theta + delta);
        [outNew,deltaNew] = estimate(thetaNew(1),thetaNew(2),thetaNew(3),0,g,Sg);    
        theta = thetaNew;
        objective(iter) = log(outNew);
        delta_error = (outNew-out);
        iter = iter + 1;
        L = [theta(1),0;theta(2),theta(3)];
        D = L*L';
        d1(iter) = D(1,1);
        d2(iter) = D(1,2);
        d3(iter) = D(2,1);
        d4(iter) = D(2,2);
    end    

L = [theta(1),0;theta(2),theta(3)];
D = L*L';
end