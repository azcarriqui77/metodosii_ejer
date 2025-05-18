# EJERCICIO 8 RELACION PVI #

clear all;
clc;
more off;

function y=F(t,x)
  y = [x(1)*(2-0.05*x(1)-x(2)/3),x(2)*(-2+0.5*x(1))];
endfunction
%
a=0; b=25; h=0.1;
n=(b-a)/h;
x=ones(2,n+1);
t=zeros(1,n+1);
x(1,1)=2;
x(2,1)=1;

for i=2:n+1
  t(i)=t(i-1)+h;
  x(1:2,i)=[x(1,i-1),x(2,i-1)]+h/4*(F(t(i-1),x(1:2,i-1))+3*F(t(i-1)+2/3*h,x(1:2,i-1)+2/3*h*F(t(i-1),x(1:2,i-1))));
endfor
%
figure(1); clf; hold on;
plot(t(:),x(1,:));
plot(t(:),x(2,:));
hold off;

figure(2); clf; hold on;
plot(x(1,:),x(2,:));
hold off;