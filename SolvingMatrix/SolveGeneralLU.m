function [x,flag] = SolveGeneralLU(A,y)

%[h,u] = size(y);
%if h == 1
    %y = transpose(y);
%end

x = [];
if det(A) == 0
    flag = 0;
    return

else
    %t1 = clock;
    %flag = 1;
    [L,U,P] = LUfactor(A);
    %Substitution
    R = P*y;
    %PA = LU, solve Ux at first
    %Then solve the x by sovle upper tri
    [ x,flag ] = SolveLowerTri( L,R );
    [ x,flag ] = SolveUpperTri( U,x );
    %t2 = clock;
    %etime(t2,t1)
end    
    
end
