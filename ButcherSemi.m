###########################################
### Ejercicios practicos de PVI ###########
###########################################
%
% funcion para evaluar un metodo RK dado
% su arreglo de Butcher, que puede ser
% expl�cito o semi-implicito
%
% este archivo es la definicion de una
% funcion. Por tanto la primera instruccion
% ejecutable es la palabra function
function [t1 x1] = ButcherSemi(a,b,c,t,x,h)
  m = length(c); %n�mero de evaluaciones del metodo
  K(1) = f(t+c(1)*h,x); % K1 tiene que ir aparte
  if a(1,1)
    K(1) = fsolve(@(u)f(t+c(1)*h,x+h*a(1,1)*u)-u,K(1));
  endif
  for i=2:m
    K(i) = f(t+c(i)*h,x+h*a(i,1:i-1)*K(1:i-1)'); %explicito o semilla
    if a(i,i)
      K(i) = fsolve(@(u)f(t+c(i)*h,x+h*a(i,1:i-1)*K(1:i-1)'+h*a(i,i)*u)-u,K(i));
    endif
  endfor
  t1 = t + h;
  x1 = x + h*b*K';
endfunction
