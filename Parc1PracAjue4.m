## EJERCICIO 2 PARCIAL 1 OCTAVE ##

clc;
clear all;

function y=f(x)
  y=x.^3+9*x.^2-6*exp(cos(pi*x));
  endfunction
%
function y=g(x)
  y=x-0.016*f(x);
endfunction
%

x=linspace(0,1,500);
figure(1); clf;
hold on;
axis([0 1 -1 1]);
plot(x,f(x),'k;f;');
plot([0,1],[0,0],'r'); 
grid on;
hold off;

figure(2); clf;
hold on;
axis([0 1 0 1]);
plot(x,g(x),'k;g;');
plot(x,x,'r;bisectriz;');
grid on;
hold off;

disp('Como la gráfica de g corta a la bisectriz del primer cuadrante, la funcion g tiene un punto fijo');
disp('Este punto fijo coincide gráficamente con la raíz de f buscada');

x1=0.5;
formato='%2d %18.14f\n';
disp(' Numero iteracion    Aproximacion raiz');
printf(formato,0,x1);
for i=1:15
  x0=x1;
  x1=g(x0);
  printf(formato,i,x1);
  y(i)=x1;
endfor
%
figure(3); clf;
hold on;
for i=1:15
plot(y(i),f(y(i)));
endfor
plot([0,0.7],[0,0],'r');
hold off;
disp('Sí hay convergencia, como se muestra en la figura y ésta es escalonada');