function [L,U,P] = LUfactor(A)

[h,h] =size(A);
P = eye(h);
L = eye(h);
U = A;

for i=1:h
    [pivot t] = max(abs(U(i:h,i)));
    t = t+i-1;
    if t~=i
        U([i t],:) = U([t i],:);
        P([i t],:) = P([t i],:);
        if i>=2
            tmp = L(i,1:i-1);
            L(i,1:i-1) = L(t,1:i-1);
            L(t,1:i-1) = tmp;
        end
    end
    for j = i+1:h
        L(j,i) = U(j,i)/U(i,i);
        U(j,:) = U(j,:)-L(j,i)*U(i,:);
    end
end

end
