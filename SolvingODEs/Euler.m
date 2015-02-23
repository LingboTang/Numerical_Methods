function [Y,v,T] = Euler(f,t0,tend,y0,stepsize)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
  t = t0;
  n = 1;  
  v(n,:) = y0;      
  T = t0:stepsize:tend;
  while (t < tend) 
     v(n+1,:) = v(n,:) + stepsize*f(t,v(n,:))'; 
     t = t0 + stepsize*n; 
     n = n + 1; 
  end 
  Y = v(n,:); 

end