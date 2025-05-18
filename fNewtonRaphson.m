## FUNCION METODO NUMERICO NEWTON-RAPHSON ##

## LOS ARGUMENTOS DE ENTRADA SON LA FUNCIÓN, SU DERIVADA, LA SEMILLA ##
## LA TOLERANCIA RELATIVA Y UN LIMITE DE ITERACIONES ##

## DEVUELVE LA APROXIMACION A LA RAIZ, EL NUMERO DE ITERACIONES ##
## Y UN MENSAJE DE SI CONVERGE O NO CONVERGE ##

function [s,n,msg] = fNewtonRaphson(f,f1,x0,TOL,N)
  n=0;
  aux=x0;
  do 
    n++;
    x1=aux;
    x2=x1-f(x1)/f1(x1);
    aux=x2;
  until (abs((x2-x1)/x2)<=TOL || n>N)
  %
  if abs(x2-x1)<=TOL
    msg='La sucesion de Newton-Raphson converge.';
  else
    msg='La sucesion de Newton-Raphson no converge.';
  endif
  s=x2;
  endfunction