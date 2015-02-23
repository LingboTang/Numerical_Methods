function [x, flag] = SolveUpperTri(U,y)
%input y in column vector form
%You have to make y a column vector for matlab built-in function to get the
%rank of the combination matrix
%[nrow,ncol] = size(y);
%if nrow == 1
    %y = transpose(y);
h = length(y);
w = length(y);
rankU = rank(U);
rankUy = rank([U,y]);
x = [];
b=zeros(h,1);

if rankU ~= rankUy
    flag =0;
    return
elseif rankU == rankUy
    if rankU < h
        flag = -1;
        return 
    elseif rankU == h
        flag = 1;
        %backward substitution
        for i=h:-1:2
            x(i) = y(i)/U(i,i);
            y(1:i-1) = y(1:i-1)-x(i)*U(1:i-1,i);
        end
        x(1)=y(1)/U(1,1);
    end
end
x = transpose(x);
end
