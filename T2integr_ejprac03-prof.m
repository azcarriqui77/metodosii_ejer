  ###########################################
### Ejercicios practicos de integracion ###
###########################################
clear all; clc; more off; % preparacion
disp("EJERCICIOS PRACTICOS -- INTEGRACION");
disp("");
%
% Ejercicio 3
%
disp("Ejercicio 3)-");
%
function y = f(x)
  y = x.*exp(-x/3);
endfunction
a = 0; b = 3;
exacto = quad(@f,a,b);

disp("=============================");
disp("Formula      n Eval      aprox       error");
disp("----------- -- ---  ------------- ---------");
formato = "%11s %2d %3d %14.8f %9.2e\n";


%NC= (b-a)/3*(2f(x1)-f(x2)+2f(x3))
n = 0;
do
  n++; h = (b-a)/n; s = 0;
  for i = 1:n
    [nodos pesos] = integralNC(a+(i-1)*h,a+i*h,4,false,false);
    s = s + pesos*f(nodos)';
  endfor
until abs(s-exacto) < 1e-4;
printf(formato,"NewtonCotes",n,n*3,s,abs(s-exacto));

% Simpson
n = 0;
do
  n+=2; h = (b-a)/n;
  s4 = sum(f(linspace(a+h,b-h,n/2)));
  s2 = sum(f(linspace(a+2*h,b-2*h,n/2-1)));
  s = h/3*(f(a) + 4*s4 + 2*s2 + f(b));
until abs(s-exacto) < 1e-4;
printf(formato,"Simpson    ",n,n+1,s,abs(s-exacto));

% Trapecio
n = 0;
do
  n++; h = (b-a)/n;
  s = h/2*(f(a) + 2*sum(f(linspace(a+h,b-h,n-1))) + f(b));
until abs(s-exacto) < 1e-4;
printf(formato,"Trapecio   ",n,n+1,s,abs(s-exacto));
disp("=============================");
disp("");
disp("Trapecio es muy poco eficiente.");
disp("Newton Cotes está bien pero es complicada.");
disp("Simpson es mas sencilla y precisa.");
disp("==========================================================");
disp("==== FIN DEL EJERCICIO ====");