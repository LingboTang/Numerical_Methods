function [ x, flag ] = SolveLowerTri( L,y )
%You have to make y a column vector for matlab built-in function to get the
%rank of the combination matrix
%[nrow,ncol] = size(y);
%if nrow == 1
    %y = transpose(y);
h=length(y);
%h = length(y);
rankL = rank(L);
rankLy = rank([L,y]);
%x = [];

if rankL ~= rankLy
    flag =0;
    return
elseif rankL == rankLy
    if rankL < h
        flag = -1;
        return
    elseif rankL == h
        flag = 1;
        %t1 = clock;
        %forward substitution
        for i = 1:h
            x(i) = y(i)/L(i,i);
            y(i+1:h) = y(i+1:h)-L(i+1:h,i)*x(i);
        end
        %t2 = clock; etime(t2,t1)
    end
end
x =transpose(x);
