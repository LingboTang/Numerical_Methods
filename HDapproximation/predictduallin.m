function [yhat] = predictduallin(Xtest,X,a1) 
    yhat = Xtest*X'*a1;
end 
