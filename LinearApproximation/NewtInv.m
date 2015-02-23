function [Ainv] = NewtInv(A)


if det(A) == 0
    Ainv = 'NULL';
    disp('A is not invertible');
    return
end


%initial guess
X0 = transpose(A)/(norm(A,1)*norm(A,inf));
[n,n] = size(A);
I = eye(n);
Origin = I-A*X0;
err = norm(Origin,2);
TOL = 1.0000e-15;

%Now iteration 

while true
    X0 = X0 +X0*(Origin);
    Origin = I-A*X0;
    err = norm(Origin,2);
    if err < TOL
        break
end

Ainv = X0;

end