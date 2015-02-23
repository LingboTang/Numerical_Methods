function [yhat] = predictdualgen(Xtest,X,kernelfun,a2)
    yhat = kernelfun(X,Xtest)'*a2;
end
