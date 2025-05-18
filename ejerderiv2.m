# EJERCICIO 2 DERIVACIÓN "

clear all;
clc;
more off;

disp('EJERICIO 2 RELACIÓN DERIVACION');
disp(" ");

disp('APARTADO A');

nodos=[-2 -1 0 1];
n=length(nodos);
#Escribo la matriz de Vandermonde
M=ones(n,n);
for i=1:n
  M(i,:)= nodos.^(i-1);
endfor
%
b=[0 0 2 -6]';
disp('Matriz de Vandermonde y terminos independientes');
disp([M b]);

x=M\b;
disp("Los pesos de la fórmula de tipo interpolatorio clasico son:");
disp([x]);


disp('APARTADO B');

nodos=[-1 -1/2 0 1];
n=length(nodos)-1;
#Matriz de Vandermonde
M=ones(n+1);
for i=1:n
  M(i+1,:) = nodos.^(i);
endfor
%
#Terminos independientes
k=1;
a=1;
b = zeros(n+1,1);
b(k+1,1) = factorial(k); %para evitar un posible 0^0
for i=k+1:n
  b(i+1,1) = factorial(i)/factorial(i-k)*a^(i-k);
endfor
%
printf("Matriz de Vandermonde y términos independientes:\n");
disp([M b]);
x = M\b;
printf("Pesos:\n");
disp(x);
