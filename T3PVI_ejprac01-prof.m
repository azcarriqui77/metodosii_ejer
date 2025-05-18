###################################
### Ejercicios practicos de PVI ###
###################################
clear all; clc; more off; % preparacion
disp("EJERCICIOS PRACTICOS -- PVI");
disp("");
%
% Ejercicio 1
%
disp("Ejercicio 1)-");
%
function y = f(t,x)
  y = -9.8-0.002*x*abs(x)/0.11;
endfunction
a = 0; mu = 30; tol = 1e-6; h = 0.2;

function z = Euler(t,x,h)
  z = x + h*f(t,x);
endfunction

function z = EulerImpl(t,x,h,tol)
  x0 = x + h*f(t,x);
  x1 = x0;
  do
    x0 = x1;
    x1 = x + h*f(t+h,x0);
  until abs(x1-x0)<tol;
  z = x1;
endfunction

function z = Heun(t,x,h)
  v = f(t,x);
  z = x + h/2*(v+f(t+h,x+h*v));
endfunction

function z = RK2(t,x,h)
  K1 = f(t,x);
  K2 = f(t+2/5*h,x+2/5*h*K1);
  z = x + h*(-1/4*K1+5/4*K2);
endfunction

t0 = a; x0 = [mu mu mu mu]; s0 = [0 0 0 0];

fmt=" %6.2f";
disp(" n   t    v-Euler--s    v-EuImpl-s    v-Heun---s    v-RK2----s");
disp("-- ----  ------------  ------------  ------------  ------------");
printf(["%2d %4.2f" fmt fmt fmt fmt fmt fmt fmt fmt "\n"],0,t0,[x0;s0]);
t1 = t0; x1 = x0; s1 = s0; n=0;
do
  n++; t0 = t1; x0 = x1; s0 = s1;
  x1(1) = Euler(t0,x0(1),h);
  x1(2) = EulerImpl(t0,x0(2),h,tol);
  x1(3) = Heun(t0,x0(3),h);
  x1(4) = RK2(t0,x0(4),h);
  s1 = s0 + h/2*(x0+x1);
  t1 = t0 + h;
  printf(["%2d %4.2f" fmt fmt fmt fmt fmt fmt fmt fmt "\n"],n,t1,[x1;s1]);
until max(s1) < 0;
disp("-- ----  ------------  ------------  ------------  ------------");
disp("Altura máxima estimada: 25.2m, 28.7m, 27.1m, 27.2m)");
disp("Tiempo estimado de impacto: 4.5s, 4.9s, 4.7s, 4.7s");
disp("Velocidad estimada de impacto: 18m/s (los 4 coinciden)");
disp("El método que predice más tarde el impacto es Euler Implícito.");
disp("==== FIN DEL EJERCICIO ====");