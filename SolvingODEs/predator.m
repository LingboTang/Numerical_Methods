function yprime = predator(t,y) 
alpha1 = 1;
beta1 = 0.1;
alpha2 = 0.5;
beta2 = 0.02;
yprime = [alpha1*y(1)-beta1*y(1)*y(2);-alpha2*y(2)+beta2*y(1)*y(2)];
end