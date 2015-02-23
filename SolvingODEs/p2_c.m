function yprime = p2_c(t,y)
% Computes the derivatives involved in solving Lorenz equations. 
% Computes the derivatives involved in solving Lorenz equations.
%{
sigma  = 10;
beta = 8/3;
r = 28;
% system of first oder linear DE. 
yprime=[sigma*(y(2)-y(1)); r*y(1)-y(2)-y(1)*y(3); -beta*y(3) + y(1)*y(2)]; 
%}

alpha  = 0.04;
beta = 10000;
gamma = 30000000;
% system of first oder linear DE. 
yprime=[-alpha*y(1)+beta*y(2)*y(3); alpha*y(1)-beta*y(2)*y(3)-gamma*(y(2)^2); gamma*(y(2)^2)]; 

end