function [ val ] = Exp_approx( x )

%Not precise when exceeding the limit of the machine
val = 0;
i = -1;

while true
    i= i + 1;
    term = power(x,i)/factorial(i);
    val = val + term;
    %Stop critiria
    if (term == 0)
        return
    end
end



end
