function [w3] = fitgenreg(y,X,featurefun,lambda)

w3 = featurefun(X)'*(featurefun(X))+lambda*eye(n)\featurefun(X)'*y

end
