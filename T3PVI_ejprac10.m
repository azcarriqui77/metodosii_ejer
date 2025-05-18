# EJERCICIO 10 RELACION PVI #

clear all;
clc;
more off;

function y=f(t,x)
  y = [-4*x(1)+3*x(2)+6,-2.4*x(1)+1.6*x(2)+3.6];
endfunction
%
x(1,1)=0;
x(2,1)=0;
t(1)=0;
h=0.1;

for i=1:5
  K1=f(t(i),x(1:2,i));
  K2=f(t(i)+h/2,x(1:2,i)+h/2*K1');
  K3=f(t(i)+h/2,x(1:2,i)+h/2*K2');
  K4=f(t(i)+h,x(1:2,i)+h*K3');
  x(1:2,i+1)=x(1:2,i)+h/6*(K1+2*K2+2*K3+K4)';
  t(i+1)=t(i)+h;
endfor
%
figure(1); clf; hold on;
plot(t,x(1,:),'k;RK4-x1;');
plot(t,x(2,:),'k;RK4-x2;');
hold off;