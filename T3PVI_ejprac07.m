# EJERCICIO 7 #

clear all;
clc;
more off;

disp('EJERCICIO 7 PVI');

function y =f(t,x)
  y=0.05*x*(1-log(x));
  endfunction
%
a=0;
b=100;
mu=1;
ah=[20 0.25];

figure(1); hold on; 

for i=1:length(ah)
  h=ah(i);
  N=(b-a)/h;
  t=a*ones(1,N+1);
  x=mu*ones(1,N+1);
  for j=2:N+1
    t(j)=t(j-1)+ah(i);
    x(j)=x(j-1)+h/4*(f(t(j-1),x(j-1))+3*f(t(j-1)+2/3*h,x(j-1)+2/3*h*f(t(j-1),x(j-1))));
  endfor
  plot(t(:),x(:));
endfor
%
hold off;