## EJERCICIO 11 ##

clear all;
clc;

disp('Ejercicio 11.Relación de problemas');

%Definición de funciones
function y=f(x)
  y = [sin(x(1)*x(2))/2-x(2)/(4*pi)-x(1)/2; 
      (1-1/(4*pi))*(exp(2*x(1))-e)+e/pi*x(2)-2*e*x(1)];
endfunction
%

function M=J(x)
  M = [cos(x(1)*x(2))*x(2)/2-1/2, cos(x(1)*x(2))*x(1)/2-1/(4*pi);
      (1-1/(4*pi))*exp(2*x(1))*2-2*e, e/pi];
endfunction
%

formato='%d %d %3d %14.10f %14.10f\n';
tol=1e-08;
disp('Extremo izq   Extremo drch   Niter   x   y   ');

for i=1:5
  aux=[i-3;i-3];
  n=0;
  do
    n++;
    x0=aux;
    x1 = x0-J(x0)\f(x0);
    aux=x1;
  until (norm(x1-x0,"inf")/norm(x1,"inf"))<tol
  printf(formato,i-3,i-3,n,x1);
endfor
%
