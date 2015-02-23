function [xold,flag] = SolveGeneralGS(A,y,x0,TOL)


r = y-A*x0;
err = norm(r);
xold = x0;
D = diag(diag(A));
L = tril(A)-D;
U = triu(A)-D;

while err  > TOL
    W= y- U*xold;
    T = D+ L;
    [x,flag] = SolveLowerTri(T,W);
    xold = x;
    size(xold)
    r = y-A*xold;
    err = norm(r);
end



end
