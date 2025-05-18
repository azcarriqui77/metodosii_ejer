##EJERCICIO PROPUESTO 1##
clc;
clear all;

%DEFINICIÓN DE LA FUNCIÓN
function y=f(x)
  y=x.*exp(-x./3)-0.5;
endfunction

%REPRESENTACIÓN GRÁFICA
a=-1; b=20;
x=linspace (a,b,200);
figure(1); clf;
hold on;
axis([a b -1 5]);
plot (x,f(x),'k;f;');
plot ([a,b],[0,0],'r'); %linea horizontal roja en y=0
grid on;
hold off;

%INTERVALO AMPLITUD 3
a1=7; b1=10;

%MÉTODO DE BISECCION
disp(' MÉTODO DE BISECCIÓN: APARTADO C ');
err=0.05;
n=((log(b1-a1)-log(err))/log(2))-1;
N=ceil(n);
disp(' a    b   m   f(m)');
formato='%9.6f %9.6f %9.6f %9.6f\n';
n=-1;

do  
n++;
m=(a1+b1)/2; fm=f(m);
printf(formato,a1,b1,m,fm); 

if fm==0
  return;
endif
if fm*f(a1)>0
  a1=m;
else
  b1=m;
endif
until n>N
%MÉTODO DE NEWTON RAPHSON
disp(' MÉTODO DE NEWTON-RAPHSON: APARTADO D ');
function y=f1(x)
  y=exp(-x./3)*(1-(x./3));
  endfunction
err=10^(-6);
x1=m;
x0=0;
do
  x0=x1;
  x1=x0-f(x0)/f1(x0);
until abs(x1-x0)/abs(x0)<err
printf(' Las dos ultimas aproximaciones son: ');
disp(x0);
disp(x1);