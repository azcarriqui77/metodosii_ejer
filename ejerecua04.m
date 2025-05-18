## EJERCICIO 4 ##
disp('EJERCICIO 4');
## APARTADO A ##

disp('Apartado a');
%Definicion funcion
function y=f(x)
  y=(exp(-x^2)+0.75*x)^3;
endfunction
%

%Valores iniciales y tolerancia
x0=-0.75;
x1=-0.76;
TOL=1e-6;

%Metodo de la secante
n=0;
x2=0;

do
  n=n+1;
  x2=x1-(f(x1)*(x1-x0))/(f(x1)-f(x0));
  x0=x1;
  x1=x2;
until abs(x1-x0)<TOL
%

printf('En %d iteraciones, se obtuvo un valor %14.10f\n',n,x1);

## APARTADO B ##
disp('Apartado b');

x0=-0.75;
x1=-0.76;
n=0;

formato1='%3d %14.10f Secante \n';
formato2='%3d %14.10f Aitken \n';

printf('%14.10f\n',x0);
printf('%14.10f\n',x1);

do
  for i=1:2
    n=n+1;
    x2=x1-(f(x1)*(x1-x0))/(f(x1)-f(x0));
    x0=x1;
    x1=x2;
    printf(formato1,n,x2);
  endfor
  n=n+1;
  x2=x1-(f(x1)*(x1-x0))/(f(x1)-f(x0));
  printf(formato1,n,x2);
  n=n+1;
  a0=x0-(x1-x0)^2/(x2-2*x1+x0);
  printf(formato2,n,a0);
 
  x0=x2;
  x1=a0;
  
  until abs(x2-a0)<TOL