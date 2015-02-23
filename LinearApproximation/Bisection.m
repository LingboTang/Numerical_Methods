function [x,flag] = Bisection(x0,f,TOL)
%Idea(1): Bisection (a,b)
%m = (a+b)/2 = a+(b-a)/2
%if sign(y-f(a))==sign(y-f(b))
    %a = m
%else 
    %b = m

% Let err_k  = x_k-x*

% After K iterations
% bracket size = (b-a)/2^k
% If want error absolute(b_k-a_k) <= epsilon
    %(b-a)/2^k <= epsilon <=> (b-a)/epsilon <=> log2(b-a/epsilon) <= k
% Order of convergence:
% Let err_k = x_k-x*
% Define order of convergence is P
% x_0->x_1->x_2->..../..
% err0->err1->err2->.....
% lim k->0 errk = 0 => Converges to a solution

% exist C<infinite ,exist K<infinite, s.t. for any k >= K
    %errk+1 <= c*absolute(errk)^p
%eg Bisection:
    %errk+1 <= 1/2*absolute order1
    
%Bigger P (Bigger than 1 is better)



% Order 2 shortly:
    %Exponentially faster.
%
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
    while f(a)*f(b) > 0
        a = b;
        b = b-1;
        iter = iter + 1;
        if (iter > Max_iter)
            flag =-1;
            x = 'Null';
            break
        end
    end
end
        
%k = 1;
err = (b-a)/2;

if a < b
     l = f(a);

elseif a > b
    temp = b;
    b = a;
    a = temp;
    l = f(a);
end

%err = abs(b-a);

while abs(b-a) > TOL
    m = (a+b)/2;
    y = f(m);
    %if y == 0.0
        %err = 0;
        %break
    %end
    if l*y <= 0
        b = m;
    else
        a = m;
    end
    %k = k+1;
    %err = (b-a)/2;
end

x = (a+b)/2;

end
