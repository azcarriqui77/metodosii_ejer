# EJERCICIO 3 RELACIÓN INTEGRACION #

clear all;
clc;
more off;

function y=f(x)
  y=x*exp(-x/3);
endfunction
%
a=0; b=3;
NC=0; T=0; S=0;
exacto=quad(@f,a,b);

disp("NEWTON-COTES ABIERTA DE TRES NODOS");
disp("N_intervalos   N_evaluaciones   Valor aproximado   Error");
do
  NC++; h=(b-a)/NC; aprox=0;
  for i=1:NC
  [nodos pesos]=integralNC(a+(i-1)*h,a+i*h,5,false,false);
  for j=1:length(nodos)
    aprox=aprox+pesos(j)*f(nodos(j));
  endfor
  endfor
until abs(aprox-exacto) < 1e-4;
%
printf("%3d  %3d  %18.14f  %8.4e\n",NC,3*NC,aprox,abs(aprox-exacto));



disp("SIMPSON");
disp("N_intervalos   N_evaluaciones   Valor aproximado   Error");
do
  S++; h=(b-a)/S; aprox=0;
  for i=1:S
    aprox=aprox+(h/6)*(f(a+(i-1)*h)+4*f((2*a+(2*i-1)*h)/2)+f(a+i*h));
  endfor
until abs(aprox-exacto) < 1e-4;
%
printf("%3d  %3d  %18.14f  %8.4e\n",S,3*S,aprox,abs(aprox-exacto));



disp("TRAPECIO");
disp("N_intervalos   N_evaluaciones   Valor aproximado   Error");
do
  T++; h=(b-a)/T; aprox=0;
  for i=1:T
    aprox=aprox+(h/2)*(f(a+(i-1)*h)+f(a+i*h));
  endfor
until abs(aprox-exacto) < 1e-4;
%
printf("%3d  %3d  %18.14f  %8.4e\n",T,2*T,aprox,abs(aprox-exacto));