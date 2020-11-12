function [val] = l2Error(f,u_ana,x1,xn)

for i=1:100
    dx = 1/(10*i);
    x = grid(x1,xn,dx);
    n = length(x);
    [D,b] = assmbleMatrix(x,f);
    u = linEqsSolver(D,b);

    integral = 0;
    for j=1:n
        integral = integral + dx*(u(i)*u_ana(i*dx));
    end
    l2error = sqrt(integral);
    val(i,1) = l2error;
    val(i,2) = n;
end

end

