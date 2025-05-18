## EJERCICIO 5 ##
disp('EJERCICIO 5');
clc;
clear all;

%Definicion funcion
function y=f(x)
  y=x.^3+9*x+9;
endfunction
%
function y=f1(x)
  y=3*x.^2+9;
endfunction
%
%Método de Newton-Raphson y tabla de resultados
formato='%14.10f %14.10f %3d %s\n';
disp('Semilla     Aproximacion     N iteraciones     Mensaje');
v=linspace(-3, 0, 11);

for i=1:11
  s=0;
  msg='';
  [s n msg] = fNewtonRaphson(@f,@f1,v(i),1e-08,1000);
  printf(formato,v(i),s,n,msg);
endfor