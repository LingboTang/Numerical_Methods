function [x,flag] = SteepDescent(x0,f,g,TOL) 

%Maxiter = 1000;
xnew = x0;


while norm(g(xnew),2) > TOL 
    dir = (-1)*g(xnew);
    [x,flag] = LineSearch(xnew,dir,f,g,TOL);
    xnew = x;
end


end