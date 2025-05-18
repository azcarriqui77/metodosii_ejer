# EJERCICIO 1 RELACIÓN PVI #

clear all;
clc;
more off;
disp(" EJERCICIO 1 RELACION PVI");
function y=f(x,t)
  y=-9.8-0.002/0.11*x*abs(x);
endfunction
%
h=0.2;
s=0;
n=0;
t=0;
v=30;
formato="%1d   %4.2f   %5.2f   %5.2f\n";

disp(" ");
disp("A) METODO DE EULER");
disp(" ");
disp("n   t       v(t)    s(t)");
printf(formato,n,t,v,s);

do 
  n++;
  v1=v+h*f(v,t);
  s=s+h/2*(v1+v);
  t=t+h;
  v=v1;
  printf(formato,n,t,v1,s);
until s<0;
%

h=0.2;
s=0;
n=0;
t=0;
v=30;

disp(" ");
disp("B) METODO DE EULER IMPLICITO");
disp(" ");
disp("n    t       v(t)    s(t)");
printf(formato,n,t,v,s);

do 
  n++;
  t=t+h;
  v1=fsolve(@(u) u-v-h*f(u,t),v);
  s=s+h/2*(v1+v);
  v=v1;
  printf(formato,n,t,v1,s);
until s<0;
%

h=0.2;
s=0;
n=0;
t=0;
v=30;

disp(" ");
disp("C) METODO DE HEUN");
disp(" ");
disp("n    t       v(t)    s(t)");
printf(formato,n,t,v,s);

do 
  n++;
  t1=t+h;
  v1=v+h/2*(f(v,t)+f(v+h*f(v,t),t1));
  s=s+h/2*(v1+v);
  v=v1;
  t=t1;
  printf(formato,n,t1,v1,s);
until s<0;
%


h=0.2;
s=0;
n=0;
t=0;
v=30;

disp(" ");
disp("D) METODO DE RK2");
disp(" ");
disp("n    t       v(t)    s(t)");
printf(formato,n,t,v,s);
do 
  n++;
  K1=f(v,t);
  K2=f(v+2/5*h*K1,t+2/5*h);
  v1=v+h*(-1/4*K1+5/4*K2);
  s=s+h/2*(v1+v);
  v=v1;
  t=t+h;
  printf(formato,n,t1,v1,s);
until s<0;