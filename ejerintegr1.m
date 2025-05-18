# EJERCICIO 1 RELACIÓN INTEGRACIÓN #

clear all;
clc;
more off;

disp("EJERCICIO 1 INTEGRACIÓN NUMÉRICA");

function y = f(x)
  y=exp(-x.^2/3);
endfunction
%
a=0; b=4;
exacto=quad(@f,a,b);

disp("APARTADO A: ABIERTA CON CUATRO NODOS");
izq=false;
drch=false;
[nodos pesos]=integralNC(a,b,6,izq,drch);
aprox=0;
for i=1:length(nodos)
  aprox=aprox+pesos(i)*f(nodos(i));
endfor
%
disp("Nodos: "); disp(nodos);
disp("Pesos: "); disp(pesos);
disp("Aproximación: "); printf("%18.14f\n",aprox);
disp("Error: "); printf("%8.4f\n",abs(aprox-exacto));

disp("APARTADO B: CERRADA CON CUATRO NODOS");
izq=true;
drch=true;
[nodos pesos]=integralNC(a,b,4,izq,drch);
aprox=0;
for i=1:length(nodos)
  aprox=aprox+pesos(i)*f(nodos(i));
endfor
%
disp("Nodos: "); disp(nodos);
disp("Pesos: "); disp(pesos);
disp("Aproximación: "); printf("%18.14f\n",aprox);
disp("Error: "); printf("%8.4f\n",abs(aprox-exacto));


disp("APARTADO C: ABIERTA IZQUIERDA CON CUATRO NODOS");
izq=false;
drch=true;
[nodos pesos]=integralNC(a,b,5,izq,drch);
aprox=0;
for i=1:length(nodos)
  aprox=aprox+pesos(i)*f(nodos(i));
endfor
%
disp("Nodos: "); disp(nodos);
disp("Pesos: "); disp(pesos);
disp("Aproximación: "); printf("%18.14f\n",aprox);
disp("Error: "); printf("%8.4f\n",abs(aprox-exacto));


disp("APARTADO D: ABIERTA DERECHA CON CUATRO NODOS");
izq=true;
drch=false;
[nodos pesos]=integralNC(a,b,5,izq,drch);
aprox=0;
for i=1:length(nodos)
  aprox=aprox+pesos(i)*f(nodos(i));
endfor
%
disp("Nodos: "); disp(nodos);
disp("Pesos: "); disp(pesos);
disp("Aproximación: "); printf("%18.14f\n",aprox);
disp("Error: "); printf("%8.4f\n",abs(aprox-exacto));
