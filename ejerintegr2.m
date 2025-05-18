# EJERCICIO 2 RELACION INTEGRACION #

clc;
clear all;
more off;

function y=f(x)
  y=1./(1+x.^2);
endfunction
%
a=-5;
b=5;
izquierda=true;
derecha=true;
exacto=quad(@f,a,b);

disp("N_intervalos   Aproximación   Error");

formato="%2d,%18.14f,%8.4f\n";

for i=1:6
  [nodos pesos]=integralNC(a,b,i+1,izquierda,derecha);
  aprox=0;
  for j=1:length(nodos)
    aprox=aprox+pesos(j)*f(nodos(j));
  endfor
  printf(formato,i,aprox,abs(aprox-exacto));
endfor
%

for i=10:5:20
  [nodos pesos]=integralNC(a,b,i+1,izquierda,derecha);
  aprox=0;
  for j=1:length(nodos)
    aprox=aprox+pesos(j)*f(nodos(j));
  endfor
  printf(formato,i,aprox,abs(aprox-exacto));
endfor
%
