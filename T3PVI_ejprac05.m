# EJERCICIO 5 RELACION PVI #

clear all;
clc;
more off;




disp("EJERCICIO 5. MÉTODO DE EULER IMPLÍCITO.");

figure(1); clf; hold on;
a=0; b=10; h=0.1;
n=(b-a)/h;
x0=0; t0=0;
for i=1:n
  t1(i)=t0+h;
  x1(i)= fsolve(@(u) x0+h*(u^2+t1*u-exp(-u)-t1)-u,x0);
  t0=t1(i); x0=x1(i);
endfor
%
plot(t1(:),x1(:),'k;Euler;');
hold off;