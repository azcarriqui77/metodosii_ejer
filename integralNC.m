# FUNCIÓN integralNC #
# RECIBE EXTREMOS DEL INTERVALO, NÚMERO DE NODOS Y #
# Y SI ES ABIERTA/CERRADA POR IZQUIERDA/DERECHA #

function [nodos pesos] = integralNC(a,b,n,izqd,derch)
  nodos=linspace(a,b,n);
  if derch==false
    nodos(n) = [];
    n--;
  endif
  if izqd==false
    nodos(1) = [];
    n--;
  endif
  %
  #Matriz de Vandermonde
  M=ones(n);
  M(2,:)=nodos;
  for i=3:n
    M(i,:)=nodos.^(i-1);
  endfor
  c=zeros(n,1);
  for i=1:n
    c(i,1)=(b^i-a^i)/i;
  endfor
 pesos=M\c;
 endfunction