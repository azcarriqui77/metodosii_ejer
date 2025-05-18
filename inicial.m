# Para escribir comentarios
% También para escribir comentarios
%{ Comentario para varias líneas %}
clear all; % esta orden limpia toda la memoria
           % antes de iniciar el programa
clc; %limpia la ventana de comandos

##FUNCIONES##
#PRIMERA FORMA DE DEFINIR UNA FUNCION
function valor=fun1(x) %fun1 es el nombre de la funcion
              % x es la varibale de entrada
              %valor es el resultado que devuelve
              %ninguna de estas variables tiene relacion con alguna
              %variable que se haya definido fuera
              valor=x.^2+1+cos(pi*x)
              %el punto se usa para hacer la potencia elemento a elemento
              %se usa mucho para evaluaciones vectoriales
endfunction
fun1(3)
fun1(4)
fun1([2 3 4])

#SEGUNDA FORMA DE DEFINIR UNA FUNCION
fun2=@(x)x.^2+1+cos(pi*x);
fun2(3)

#TERCERA FORMA DE DEFINIR UNA FUNCION
fun3=inline('x.^2+1+cos(pi*x)','x');
fun3(3)

##CONSTRUCCIÓN DE UNA GRÁFICA##
clear x y;
x=linspace(-1,5,50); %entre -1 y 5 crea 50 puntos equiespaciados en un vector
y=fun1(x);

figure(1);
plot (x,y)
plot (x,y,'g',x,y,'--r','linewidth',4);
%pinta una línea verde y encima una línea discontínua de grosor 4 roja
legend('fun1','location','southeast');
axis([-2 6 -3 30]) %escala ejes x e y

figure(2);
t=0:0.2:6.3;
plot(t,cos(t), "or;cos(t);",'markersize',5, t, sin(t), "-b;sin(t);");


##VECTORES Y MATRICES##
v=[1 2 3 -5];
A=[1 2; 2 3; 0 -1];
fprintf("matriz 3x2\n")
disp(A)

ones(3) %matrix 3x3 con todos sus elementos 1
eye(4) %matriz identidad de orden 4
b=[1 1 1]'; %vector columna
x=A\b %da una solucion de Ax=b


##BUCLES##
s=0;
for n=1:20
  m=2*n-1
  s=s+m^2;

endfor
printf("La suma total de los cudrados de los 20 primeros impares es %i\n", s)