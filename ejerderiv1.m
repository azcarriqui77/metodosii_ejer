# EJERCICIO 1 DERIVACIÓN #

clear all;
clc;
more off;

function y=f(x)
  y=x.^3;
endfunction
%
formato='%d %14.10f %14.10f %14.10f %14.10f\n';
disp('k    h    Numerador    Aproximación    Error');
for i=1:20
  h=10^(-i);
  num=f(1+h)-f(1-h);
  aprox=num/(2*h);
  error=abs(aprox-3);
  printf(formato,i,h,num,aprox,error);
endfor
%

disp("==========================================================");
disp("");
disp("Explicacion del comportamiento.");
disp("La precision del ordenador es de unos 16 digitos.");
disp("Esto hace que para k entre 7 y 11 los errores de");
disp("truncatura y redondeo sean de magnitud similar.");
disp("A partir de k=12 el error de redondeo es muy superior,");
disp("llegando a producir un numerador nulo para k>=17.");
disp("");
disp("El valor optimo de h se obtiene para k=6. Teoricamente");
disp("se tendria que haber alcanzado en k=7 u 8, pero otros");
disp("errores de redondeo añadidos al evaluar la funcion f");
disp("podrian haber aumentado el error de la aproximacion.");
disp("==========================================================");
disp("==== FIN DEL EJERCICIO ====");