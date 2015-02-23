function yprime = p3_c(t,y)
% Computes the derivatives involved in solving Lorenz equations. 
m1  = 40000;
m2= 10000;
m3 = 30000;
G=6.67e-5;
% system of first oder linear DE. 
yprime=[-G*m2*(y(1)-y(2))/(abs(y(1)-y(2))).^3-G*m3*(y(1)-y(3))/(abs(y(1)-y(3))).^3;-G*m3*(y(2)-y(3))/(abs(y(2)-y(3))).^3-G*m1*(y(2)-y(1))/(abs(y(2)-y(1))).^3;-G*m1*(y(3)-y(1))/(abs(y(3)-y(1))).^3-G*m3*(y(3)-y(2))/(abs(y(3)-y(2))).^3]; 
end

