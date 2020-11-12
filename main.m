clear all;
% %% 
% 
% 
% 
% 
% 
% %TEST_MAIN LIVESCRIPT BENUTZEN
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
%% print analytical solution f =1
u_ana1 = @(x) -0.5*(x-0.5).^2 +1/8;

fplot(u_ana1,[0 1]);
hold all
%print analytical solution f = 2* dirac(x-0.5)
u_ana2 = @(x) x + (1 - 2*x).*heaviside(-1 + 2*x);

fplot(u_ana2,[0 1]);


%% finite elements in 1 D

 x1 =0;
 xn =1;
 dx = 0.1;
 
 x = grid(x1,xn,dx);
 
 
 f1 = @(x) 1;
 f2 = @(x) 2*dirac(x-0.5);
 

 [D,b] = assmbleMatrix(x,f1);
 u1 = linEqsSolver(D,b);
 
 plot(x,u1); 
 
 [D,b] = assmbleMatrix(x,f2);
 u2 = linEqsSolver(D,b);
 
 plot(x,u2); 
 
 xlabel('x')
 ylabel('y')
 title('1D FEM vs Analytical Solution')
 
hold off

%%  convergence behavior
% val1 = l2Error(f1,u_ana1,x1,xn);
% loglog(val1(:,1),val1(:,2));
% 
% hold on
% val2 = l2Error(f2,u_ana2,x1,xn);
% loglog(val2(:,2),val2(:,1));
% 

 
