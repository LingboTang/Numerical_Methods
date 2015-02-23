function [w1] = fitlin(X,y)

w1 = X'X\X'y;

end
