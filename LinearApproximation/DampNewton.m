function [x,flag] = DampNewton(x0,f,g,h,TOL) 


xnew = x0;
flag = 1;

%tic;
if norm(g(xnew),2) == 0
    x = x0;
    return
end


while norm(g(xnew),2) > TOL
    ng = (-1)*g(xnew);
    dir = h(xnew)\ng;
    [x,flag] = LineSearch(xnew,dir,f,g,TOL);
    xnew = x;
end
%toc;

end