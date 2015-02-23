function [a1] = fitduallinreg(X,y,lambda)
    [~,n] = size(X); 
    a1 = (y - X*((X'*X)\(lambda*eye(n))) * X'*y) ./ lambda; 
end 
