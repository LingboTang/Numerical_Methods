function [x,flag] = LineSearch(x0,dir,f,g,TOL)

step = 10*TOL;

t = @(alph)f(x0 + alph*dir);
flag = 1;
alpha = 0;

p0 = alpha;
p1 = alpha+step;
Max_iter = 100000;
iter1 = 0;
iter2 = 0;

if t(p0) > t(p1)
    while(t(p1)> t(p1+step))
        p0 = p0+step;
        p1 = p1+step;
        iter1 = iter1 + 1;
        if(iter1 == Max_iter)
            break
        end
    end
    
elseif t(p0) < t(p1)
    p1 = alpha;
    p0 = alpha-step;
    while (t(p0)> t(p0-step))
        p1 = p1-step;
        p0 = p0-step;
        iter2 = iter2+1;
        if(iter2 == Max_iter)
            break
        end
    end
    p1 = p1;
    p0 = p0-step;
end

if (iter1 == Max_iter || iter2 == Max_iter)
    x = x0;
    flag = -1;
    return
end
    
tau = (sqrt(5)-1)/2;

c = p0+(1-tau)*(p1-p0);
d = p0+tau*(p1-p0);

while (p1-p0) > TOL
    if t(c) > t(d)
        p0 = c;
        c = d;
        d = p0 + tau*(p1-p0);
    else
        p1 = d;
        d = c;
        c = p0+(1-tau)*(p1-p0);
    end
end


alpha = (c+d)/2;
x = x0 + alpha*dir;

end