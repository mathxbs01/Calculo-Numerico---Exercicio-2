############ENTRADA############


A = [9 -2 3 2;2 8 -2 3;-3 2 11 -4;-2 3 2 10 ]

B = [54.5;-14;12.5;-21]

x0 = [0 ; 0; 0; 0]

#########DADOS########

KMAX = 100000;

EPSILON = 0.875;

#######INICIALIZAÇÃO#######

K = 1;

Dr = EPSILON + 1;

D = diag([9 8 11 10])

M = A - D;

while(K=KMAX & Dr > EPSILON)

####RESOLVA
X = D\(B - M*x0);

####CALCULE
Dr = max(abs(X-x0))/max(abs(X));

####ATUALIZE
x0 = X;
K = K+1;

endwhile

X
