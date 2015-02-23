function [x,flag] = SafeNewton1D(x0,f,g,TOL)

%Newton:(Taylor)
%First order Taylor approx
% f(x+delta_x) ~~ f(x)+delta_x*f'(x)
% f(x)+delta_x*f'(x) = y
% delta_x = (y-f(x))/f'(x) s.t. f'(x) ~= 0
% Newton 1D
    % x_k+1 = x_k+delta_x
    % delta_x = (y-f(x_k))/f'(x)

    
%Calculate the flag at first
flag = 1;
Max_iter = 10000;

a = x0;
b = x0+1;
iter = 0;

if f(x0) == 0
    x = x0;
    return
end
    
while f(a)*f(b) > 0
    a = b;
    b = b+1;
    iter = iter+1;
    if (iter > Max_iter)
        break
    end
end


if f(a)*f(b) > 0
    a = x0;
    b = x0-1;
    iter = 0;
    while f(a)*(b) > 0
        a = b;
        b = b-1;
        iter = iter + 1;
        if (iter > Max_iter)
            flag =-1;
            x = 'Null';
            break
        end
    end
    a = a+1;
    b = b+1;
end
        
%k = 1;
err = (b-a)/2;


if a > b
    temp = b;
    b = a;
    a = temp;
end

x=(a+b)/2;

while (abs(f(x)) > TOL)
    x = x-f(x)/g(x);
    if (x < a || b < x)
        midpoint = a+(b-a)/2;
        if (sign(f(a)) == sign(f(midpoint)))
            a = midpoint;
        else
            b = midpoint;
        end
        x = a+(b-a)/2;
    else
        if (sign(f(x)) == sign(f(a)))
            a = x;
        else
            b= x;
        end
    end
    
end

end
