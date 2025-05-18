# EJERCICIO 3 RELACION DERIVACION #

clear all;
clc;
more off;

function y=f(x)
  y=x.*exp(-x/3);
endfunction
%

nodos=[-0.5 0.5 1 1.5 2];
a=0;
k=3;

alpha=pesosderiv(k,a,nodos);

disp("Los pesos son: \n");
disp([alpha]);

fx1=0;
for i=1:length(nodos)
  fx1=fx1+alpha(i)*f(nodos(i));
endfor
%
disp("La aproximación de la derivada por formula numerica de tipo interpolatorio es"),
printf("%14.10f\n",fx1);
