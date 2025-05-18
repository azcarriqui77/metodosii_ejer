# EJERCICIO 11 RELACION PVI #

clear all;
clc;
more off;

function y=f(t,x)
  y=[x(2),-4*x(2)-5*x(1)];
endfunction

function x=ft(t)
  x=3*exp(-2*t).*cos(t)+exp(-2*t).*sin(t);
  endfunction
%
x(1,1)=3; x(2,1)=-5; t(1)=0;
a=0; b=5; h=0.1; n=50;

for i=1:n-1
  K1=f(t(i),x(1:2,i));
  K2=f(t(i)+h/2,x(1:2,i)+h/2*K1);
  K3=f(t(i)+h/2,x(1:2,i)+h/2*K2);
  K4=f(t(i)+h,x(1:2,i)+h*K3);
  x(1:2,i+1)=x(1:2,i)+h/6*(K1+2*K2+2*K3+K4)';
  t(i+1)=t(i)+h;
endfor
%
figure(1); clf; hold on;
plot(t,x(1,:),'k;RK4;');
t=linspace(a,b,51);
plot(t,ft(t),'r;Funcion teorica;');
hold off;