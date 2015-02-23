function [a2] = fitdualgenreg(X,y,lambda,kernelfun)
    [n,~] = size(X);  
    a2 = (kernelfun(X,X)+ lambda*eye(n))\y;  
end
