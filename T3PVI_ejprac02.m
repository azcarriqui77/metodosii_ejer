# EJERCICIO 2 RELACION PVI #

clear all;
clc;
more off;

function y =f1(t,x)
  y=x-t^2+1;
endfunction
%
function y=f(x)
  y=(x+1).^2-0.5*exp(x);
endfunction
%
x=0.5;
t=0;
n=0;
h=0.025;
a=0;
b=2;

figure(1); clf; hold on;
X(1)=x;
T(1)=t;

do
  n++;
  x1=x+h*f1(t,x);
  t=t+h;
  x=x1;
  X(n+1)=x;
  T(n+1)=t;  
until t>=b;
%
plot(T,X,'k;f;');
plot(T,f(T));
grid on;
hold off;

figure(2); clf; hold on;
plot(T,abs(X-f(T)));
grid on; hold off;