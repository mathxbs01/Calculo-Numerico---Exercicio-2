function [x,Dr]=MetodoGaussSeidel(A,b,x0,kmax,tau);

# Definia x0 = [0;0;...;0] se nao for apresentada uma aproximacao inicial.


A = [ 9 -2 3 2; 2 8 -2 3; -3 2 11 -4; -2 3 2 10];
b = [ 54.5; -14; 12.5; -21];
if nargin<3
  x0 = zeros(size(b));
end 

# Definia kmax=100 se o numero maximo de iteracoes nao for definido.
if nargin<4
  kmax = 100;
end 

# Definia tau=1.e-6 se a tolerancia nao for definida.
if nargin<5
  tau = 1.e-6;
end 

# Defina as matrizes D e M;
L = tril(A);
U = A-L;

# Inicialize;
k = 1; 	# não é permitido indice 0 para vetores! 
Dr(k) = tau+1;
while (k<=kmax)&(Dr(k)>tau)
  interacao="interacao";
  ktxt=mat2str(k);
  puts(ktxt);
  puts(" Interação ");
  k = k+1;
  x = L\(b-U*x0);
   puts(" ");
  puts(" Resultado: ")
  disp(x);
  Dr(k) = norm(x-x0,inf)/norm(x,inf);
  x0 = x;
  
 
end

# Excluir a primeira componente de Dr;
Dr=Dr(2:end);
