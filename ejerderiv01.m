### EJERCICIO DERIVACION 1 ###

clc;
clear all;
more off; %sin interrupcion en pantalla

function y=f(x)
  y=x^3;
endfunction
%

function y=f1(x)
  y=3*x^2;
endfunction
%

a=1;
formato='%2d %10.2e %14.6e %18.14f %10.2e\n';
disp('  k     h         numerador    aproximacion       error');

for i=1:20
  h=10^(-i);
  numerador=f(a+h)-f(a-h);
  aprox=numerador/(2*h);
  printf(formato,i,h,numerador,aprox,aprox-3);
endfor
%