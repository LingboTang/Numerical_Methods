function [x,flag] = SolveDiag(d,y)

D = diag(d);
h = length(d);

for i = 1:h
    if (D(i,i) == 0 && (y(i)~=0))
        flag = 0;
        return
    elseif ((D(i,i) == 0) && (y(i) == 0))
        flag = -1;
        return
    else
        flag = 1;
        x(i) = y(i)/D(i,i);
    end
end
x=transpose(x);
end
