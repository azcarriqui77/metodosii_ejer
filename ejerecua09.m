## EJERCICIO 9 ##

clear all;
clc;

disp('Ejercicio 9. Relacion de problemas');

function y=f(x)
  y=1-x+0.3*cos(x);
endfunction
%
function y=f1(x)
  y=-1-0.3*sin(x);
endfunction
%
function y=f2(x)
  y=-0.3*cos(x);
endfunction
%

function y=NR2(x0)
  h1=(-f1(x0)+sqrt((f1(x0))^2-2*f2(x0)*f(x0)))/f2(x0);
  h2=(-f1(x0)-sqrt((f1(x0))^2-2*f2(x0)*f(x0)))/f2(x0);
  if abs(h1)<abs(h2)
    y=x0+h1;
  else
    y=x0+h2;
  endif
endfunction
%

x0=1.5;
printf('%14.10f\n',x0);
for i=1:6
  x1=NR2(x0);
  printf('%14.10f\n',x1);
  x0=x1;
endfor
%