function  [w2] = featurefun(X,y,lambda)

w2 = X'*X+lambda*eye(n)\X'*y;

end
