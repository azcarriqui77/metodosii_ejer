##EJERCICIO EXAMEN PARCIAL 1 OCTAVE##

clc;
clear all;

function y=f(x)
  y=(x.^3).*exp(-x/3)-0.8*sin(x);
endfunction

function y=f1(x)
  y=exp(-x/3).*((3*x.^2)-(x.^3)/3)-0.8*cos(x);
  endfunction
%

%Aparatado a
x=linspace(0,50,500);
figure(1); clf;
hold on;
axis([0 50 1 4]);
plot(x,f(x));
plot([0,50],[3,3],'r'); 
grid on;
hold off;

%Apartado b
x1=linspace(25,30,500);
figure(2); clf;
hold on;
axis([25 30 1 4]);
plot (x,f(x));
plot([25,30],[3,3],'r');
grid on;
hold off;

disp('El intervalo de amplitud 1 que continene a la abscisa mayor es [25,26]');

%Apartado c
x1=25.5;
tol=1e-10;
n=0;
disp('Numero iteraciones      Criterio de tolerancia');
formato='%3d %18.14f\n';
do
  x0=x1;
  x1=x0-f(x0)/f1(x0);
  er=abs((x1-x0)/x0);
  n++;
  printf(formato,n,er);
until er<=tol
%
printf(['La aproximación es %14.10f\n'],x1);