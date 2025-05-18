###################################
### Ejercicios practicos de PVI ###
###################################
clear all; clc; more off; % preparacion
disp("EJERCICIOS PRACTICOS -- PVI");
disp("");
%
% Ejercicio 4
%
disp("Ejercicio 4)-");
%
function y = f(t,x)
  y = -x+sin(2*t);
endfunction
a = 0; b = 10; mu = 5; ah = [2 1 0.5 0.25];

Butcher_a = [0 0;0 1]; %matriz aij
Butcher_b = [1/2 1/2]; %para combinar los Ki
Butcher_c = [0 1];     %avances de tn

disp("Arreglo de Butcher");
disp([Butcher_c' Butcher_a; 0 Butcher_b]);

figure(1); clf; hold on;
for i=1:length(ah)
  h = ah(i);
  N = (b-a)/h;
  t = a*ones(1,N+1);  %lista de tn preparada
  x = mu*ones(1,N+1); %lista de xn preparada
  for n=1:N
    [t(n+1) x(n+1)] = ButcherSemi(Butcher_a,Butcher_b,Butcher_c,t(n),x(n),h);
  endfor
  plot(t,x,[';h=' num2str(h) ';']);
endfor
hold off;

disp("==== FIN DEL EJERCICIO ====");