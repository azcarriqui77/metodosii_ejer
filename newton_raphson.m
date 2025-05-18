clc;

function y=f(x)
  y=x.^3+x-3;
endfunction
function y=f1(x)
  y=3*x.^2+1;
endfunction

disp ("M�todo de Newton-Raphson");
[s msg] = fNewtonRaphson(@f,@f1,1.5,1e-8);
printf("Soluci�n s = %.8f %s\:n",s,msg);