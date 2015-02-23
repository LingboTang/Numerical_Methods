function [yhat] = predictgen(Xtest, featurefun,w3)
    yhat = featurefun(Xtest)*w3; 
end
