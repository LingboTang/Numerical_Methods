options = odeset('RelTol',1e-6);
tic;
 
[t,y] = ode45(@predator, [0 25], [25,10]);

toc; 
 %plot x vs y graph 
 plot(y(:,1),y(:,2))
 %plot t vs y graph
 %plot(t,y(:,2))
 %hold on
 %plot t vs x graph  
 %plot(t,y(:,1))
 %hold off   
 %plot(t2,yend(:,1));
 
 %plot(t2,yend(:,2));
 %hold off;
