# EJERCICIO 9 RELACION PVI #

clear all;
clc;
more off;

function y=f(t,x)
  y=-t*x-5*cos(t);
endfunction
%
a=1; b=11;
h=[2 1 0.5 0.25 0.1];
figure(1); clf; hold on;

for i=1:length(h)
  n=ceil((b-a)/h(i));
  x=zeros(1,n);
  t=zeros(1,n);
  x(1)=5;
  t(1)=1;
  aux=f(t(1),x(1));
  for j=1:n-1
    K1=fsolve(@(u) f(t(j)+h(i)/2,x(j)+h(i)/2*u)-u,aux);
    K2=f(t(j)+h(i)/2,x(j)+h(i)/2*K1);
    x(j+1)=x(j)+h(i)*K2;
    t(j+1)=t(j)+h(i);
    aux=(x(j+1)-x(j))/h(i);
  endfor
  plot(t,x,[';h= ' num2str(h(i)) ';']);
endfor
hold off;
