function [Y,v,T]=Heun(f,t0,tend,y0,stepsize)
    
    % we divide the domain as each stepsize
    
    
    t = t0;
    n = 1;
    v(n,:) = y0;
    T = t0:stepsize:tend;
    while (t<tend)
        k1 = f(t,v(n,:))';
        k2 = f(t+1,v(n,:)+stepsize*k1)';
        v(n+1,:) = v(n,:)+(stepsize/2)*(k1+k2);
        t = t0+stepsize*n;
        n = n+1;
    end
    Y = v(n,:);
end
