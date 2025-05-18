## EJERCICIO 10 ##


clc;
clear all;

disp('Ejercicio 10. Relacion de problemas.');
## APARTADO A ##

function y=f(x)
  y=exp(x/4)+cos(pi*x)-1.5;
endfunction
%

function [s,n]=triseccion(a,b,e)
  n=ceil(log((b-a)/e)/log(3)-1);
  for i=1:n
    m1=a+((b-a)/3);
    m2=a+(2*(b-a)/3);
    if f(m1)*f(a)<0
      b=m1;
    elseif f(m2)*f(a)<0
      b=m2;
      a=m1;
    else
      a=m2;
    endif
  endfor
  s=(a+b)/2;
endfunction
%

## APARTADO B ##

%Representación grafica funcion
x=linspace(0,5,500);
figure(1); clf;
hold on;
axis([0 5 -2 2]);
plot(x,f(x),'k;f;');
plot ([0,5],[0,0],'r'); 
grid on;
hold off;

disp('Se han encontrado cuatro soluciones positivas para la ecuacion f(x)=0');
disp('Los intervalos de amplitud uno para cada una de las soluciones son:');
disp('[0,1]');
disp('[1,2]');
disp('[2,3]');
disp('[3,4]');


## APARTADO C ##
formato='%1d %1d %14.10f %4d\n';
disp('Extremo inicial   Extremo final   Aproximacion   Niteraciones');
for i=1:4
  [s n]=triseccion(i-1,i,1e-08);
  printf(formato,i-1,i,s,n);
endfor
%
