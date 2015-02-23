
%[y,v] = Euler(@p2_c,0,3,[1+1e-10,0+1e-10,0+1e-10],1e-3);
clc;
y0 = [1.00001,0.00001,0.00001];
t0 = 1;
tend = 100;
stepsize = 1e-3;
%% Euler
%{
tic; 
[y,v1,t1] = Euler(@p2_c, t0, tend, y0, stepsize);
toc;

subplot(3,4,1);
plot(v1(:,1),v1(:,2));
title('y1(t) vs y2(t) Trajectories')
subplot(3,4,2);
plot(v1(:,1),v1(:,3));
title('y1(t) vs y3(t) Trajectories')
subplot(3,4,3);
plot(v1(:,2),v1(:,3)); 
title('y2(t) vs y3(t) Trajectories')
subplot(3,4,4);
plot3(v1(:,1),v1(:,2),v1(:,3)); 
title('3D Attractor y1 vs y2 vs y3 for Euler')
%}
%% Heun

tic;
[yend,v2,t2] = Heun(@p2_c, t0, tend, y0, stepsize);
toc;

subplot(3,4,5);
plot(v2(:,1),v2(:,2));
title('y1(t) vs y2(t) Trajectories')
subplot(3,4,6);
plot(v2(:,1),v2(:,3));
title('y1(t) vs y3(t) Trajectories')
subplot(3,4,7);
plot(v2(:,2),v2(:,3)); 
title('y2(t) vs y3(t) Trajectories')
subplot(3,4,8);
plot3(v2(:,1),v2(:,2),v2(:,3)); 
title('3D Attractor y1 vs y2 vs y3 for Heun')

%% verified the correctness by ode45
tic;
[yend2,v3,t3] = ode45(@p2_c, [0, 3], [1,0,0]);  
toc;
%{
subplot(3,4,9);
plot(v3(:,1),v3(:,2));
subplot(3,4,10);
plot(v3(:,1),v3(:,3));
subplot(3,4,11);
plot(v3(:,2),v3(:,3));
subplot(3,4,12);
plot3(v3(:,1),v3(:,2),v3(:,3));
title('3D Attractor y1 vs y2 vs y3 for ode45')
%}
%% Outputs
%v(size(v,1),:)
%v2(size(v2,1),:)
%v3(size(v3,1),:)


%% All of the three methodsn by Parts

%[y,v2] = Euler(@p2_c, t0, tend, y0, 1e-4);
%[y,v2] = Heun(@p2_c, t0, tend, y0, 1e-4);
%[y,v2] = ode45(@p2_c, [0, 3], [1,0,0]);
%{
subplot(2,2,1);
plot(v2(:,1),v2(:,2));
title('y1(t) vs y2(t) Trajectories')
subplot(2,2,2);
plot(v2(:,1),v2(:,3));
title('y1(t) vs y3(t) Trajectories')
subplot(2,2,3);
plot(v2(:,2),v2(:,3)); 
title('y2(t) vs y3(t) Trajectories')
subplot(2,2,4);
plot3(v2(:,1),v2(:,2),v2(:,3)); 
%}
%title('3D Attractor y1 vs y2 vs y3 for Euler')
%title('3D Attractor y1 vs y2 vs y3 for Heun')
%title('3D Attractor y1 vs y2 vs y3 for ode45')


%% y1,y2 and y3

%{
subplot(2,1,1);
hold on
plot(t1,v1(:,1));
plot(t1,v1(:,2));
plot(t1,v1(:,3));
title('y1,y2 and y3 vs t for Euler')
hold off

subplot(2,1,2);
hold on
plot(t2,v2(:,1));
plot(t2,v2(:,2));
plot(t2,v2(:,3));
title('y1,y2 and y3 vs t for Heun')
hold off
%}
