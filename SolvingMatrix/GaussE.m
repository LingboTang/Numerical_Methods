function [A] = GaussE(A);
[n,n] = size(A);
for k=1:n-1 % forward elimination
    for i=k+1:n
        mult = A(i,k)/A(k,k);
        for j=k:n
            A(i,j) = A(i,j)-mult*A(k,j);
        end
    end
end
end