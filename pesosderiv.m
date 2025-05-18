# FUNCION PESO DERIVACION QUE PROPORCIONA LOS PESOS DE UNA FORMULA #
# NUMERICA DE TIPO INTERPOLATORIO CLASICO EN n+1 NODOS DISTINTOS PARA #
# APROXIMAR f^(k)(a). ADMITE COMO PARÁMETROS DE ENTRADA k,a Y LA LISTA #
# DE NODOS {x_i}. DEVUELVE LA LISTA DE PESOS {\alpha_i}.#

function alpha=pesosderiv(k,a,nodos)
  n=length(nodos)-1;
  alpha=ones(n+1,1);
  
  #Matriz de Vandermonde
  M=ones(n+1);
  for i=1:n+1
    M(i,:)=nodos.^(i-1);
  endfor
  %

  #Termino independiente
  b=zeros(n+1,1);
  b(k+1,1)=factorial(k);
  for i=k+1:n
    b(i+1,1)=factorial(i)/factorial(i-k)*a^(i-k);
  endfor
  %
  alpha=M\b;
#FIN DEL PROGRAMA