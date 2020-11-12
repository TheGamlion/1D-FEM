function [D,b] = assmbleMatrix(x,f)
    n = length(x);
    dx = x(2)-x(1);
    D =2*diag(ones(n,1));
    M = 4*diag(ones(n,1));
    for i=1:n-1
        D(i,i+1)=-1;
        D(i+1,i)=-1;
        M(i,i+1)=1;
        M(i+1,i)=1;
    end
    
    f_temp = zeros(n,1);
    for i=1:n
        f_temp(i) = f(i*dx);
    end
    
    idx = f_temp == Inf; % find Inf
    f_temp(idx) = 2;     % set Inf to finite value
    
    
    b = (M*f_temp*dx^2/6);


    D(1,:)=0;
    D(1,1)=-1;
    D(n,:)=0;
    D(n,n)=1;

    uL = 0;
    b(1) = uL;
    uR = 0;
    b(n) = uR;
end

