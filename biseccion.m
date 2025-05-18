clear all;
clc;
function y=f(x)
  y=x^3+x-3;
endfunction
a=1;
b=2;
eps=1e-6;
fa=f(a);
fb=f(b);
# COMPROBACION SIGNO #
disp('MÉTODO DE BISECCION')
disp('  n   a   b   m   f(m)    error')
formato='%3d %6.8f %6.8f %6.8f %9.2e %9.2e\n';
# %3d tres dígitos enteros en pantalla #
# %6.8f numero real con 6 caracteres, contando la coma, de los cuales 8 son decimales #
# %9.2e numero real de nueve caracteres en notacion cientifica y dos decimales #
printf(formato,0,a,b,(a+b)/2,f((a+b)/2),(b-a)/2);
n=0;
do
  n++;
  m=(a+b)/2; fm=f(m);
  printf(formato,n,a,b,(a+b)/2,f((a+b)/2),(b-a)/2);
  if fm==0
    disp('Eureka');
    return
  endif
  if fa*fm<0
    b=m; fb=fm;
  else
    a=m; fa=fm;
  endif
until b-a<=eps
# FIN DE PROGRAMA #