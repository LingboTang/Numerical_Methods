function [x] = slash( A,y )



t1 = clock;
x = A\y;
t2= clock;etime(t2,t1)

end
