simplify(X,X):-atomic(X).

simplify(A+B,Z):-integer(A),integer(B),Z is A+B.%integer add.
simplify(A*B,Z):-integer(A),integer(B),Z is A*B.%integer mult.
simplify(A-B,Z):-integer(A),integer(B),Z is A-B.%integer sub.
simplify(A/B,Z):-B==0->Z=undefined;integer(A),integer(B),Z is A/B .%integer div. and checking divison by 0




simplify(X+0,Y):-simplify(X,Y).
simplify(0+X,Y):-simplify(X,Y).
simplify(X+X,2*X).

simplify(X+A*X,B*X):-integer(A),B is A+1.%addition like x+2*x
simplify(X+X*A,B*X):-integer(A),B is A+1.%addition like x+x*2
simplify(A*X+X,B*X):-integer(A),B is A+1.
simplify(X*A+X,B*X):-integer(A),B is A+1.

simplify(A*X+B*X,C*X):-integer(A),integer(B),C is A+B.%repeated addition like x+2*x+3*x
simplify(X*A+X*B,C*X):-integer(A),integer(B),C is A+B.%repeated addition like x+x*2+x*3



simplify(X^A+X,X*(X^B+1)):-integer(A),B is A-1.%taking x common
simplify(X+X^A,X*(1+X^B)):-integer(A),B is A-1.%taking x common


simplify(X^A+X^B,X^C*(D+E)):-integer(A),integer(B), A<B -> C is A,D is 1,C1 is B-C,E=X^C1;C is B,C1 is A-C,D=X^C1,E is 1. %taking minimum power of x common

simplify(M*X^A+N*X^B, X^C*(D+E)):-integer(A), integer(B), A<B -> C is A, D is M, C1 is B-C, E=N*X^C1; C is B, C1 is A-C, D=M*X^C1, E is N.

simplify(X^A*M+X^B*N, X^C*(D+E)):-integer(A), integer(B), A<B -> C is A, D is M, C1 is B-C, E=N*X^C1; C is B, C1 is A-C, D=M*X^C1, E is N.

simplify(M*X^A+X^B*N, X^C*(D+E)):-integer(A), integer(B), A<B -> C is A, D is M, C1 is B-C, E=N*X^C1; C is B, C1 is A-C, D=M*X^C1, E is N.

simplify(X^A*M+N*X^B, X^C*(D+E)):-integer(A), integer(B), A<B -> C is A, D is M, C1 is B-C, E=N*X^C1; C is B, C1 is A-C, D=M*X^C1, E is N.





simplify(X-0,Y):-simplify(X,Y).%X-0=X
simplify(0-X,Y):-simplify(-1*X,Y).%0-X=-X
simplify(X-X,0).%X-X=0
simplify(X-A*X,B*X):-integer(A),B is 1-A.
simplify(X-X*A,B*X):-integer(A),B is 1-A.
simplify(A*X-X,B*X):-integer(A),B is A-1.
simplify(X*A-X,B*X):-integer(A),B is A-1.


simplify(A*X-B*X,C*X):-integer(A),integer(B),C is A-B.%repeated subtraction
simplify(X*A-X*B,C*X):-integer(A),integer(B),C is A-B.%repeated subtraction


simplify(X^A-X^B,X^C*(D-E)):-integer(A),integer(B), A<B -> C is A,D is 1,C1 is B-C,E=X^C1;C is B,C1 is A-C,D=X^C1,E is 1. %taking minimum power of x common

simplify(M*X^A-N*X^B, X^C*(D-E)):-integer(A), integer(B), A<B -> C is A, D is M, C1 is B-C, E=N*X^C1; C is B, C1 is A-C, D=M*X^C1, E is N.

simplify(M*X^A-X^B*N, X^C*(D-E)):-integer(A), integer(B), A<B -> C is A, D is M, C1 is B-C, E=N*X^C1; C is B, C1 is A-C, D=M*X^C1, E is N.

simplify(X^A*M-N*X^B, X^C*(D-E)):-integer(A), integer(B), A<B -> C is A, D is M, C1 is B-C, E=N*X^C1; C is B, C1 is A-C, D=M*X^C1, E is N.

simplify(X^A*M-X^B*N, X^C*(D-E)):-integer(A), integer(B), A<B -> C is A, D is M, C1 is B-C, E=N*X^C1; C is B, C1 is A-C, D=M*X^C1, E is N.




simplify(X*1,Y):-simplify(X,Y).
simplify(1*X,Y):-simplify(X,Y).
simplify(X*0,Y):-simplify(0,Y).
simplify(0*X,Y):-simplify(0,Y).



simplify(0/X,0).
simplify(X/1,Y):-simplify(X,Y).
simplify(X/X,1).


simplify(X^0,Y):-simplify(1,Y).
simplify(X^1,Y):-simplify(X,Y).
simplify(X^A,X^A):-integer(A).


simplify(X*X,X^2).
simplify(X*X^A,X^B):-integer(A),B is A+1.%higher powers of x
simplify(C*X*X^A,C*X^B):-integer(A),B is A+1.%higher powers of x


simplify(X^A*X,X^B):-integer(A),B is A+1.
simplify(X^A*X^B,X^C):-integer(A),integer(B),C is A+B.
simplify(M*X^A*X^B,M*X^C):-integer(A),integer(B),C is A+B.
simplify(X^A*N*X^B,N*X^C):-integer(A),integer(B),C is A+B.
simplify(M*X^A*N*X^B,Z*X^C):-integer(A),integer(B),C is A+B, Z is M*N.
simplify(X^A*M*N*X^B,Z*X^C):-integer(A),integer(B),C is A+B, Z is M*N.
simplify(X^A*M*X^B*N,Z*X^C):-integer(A),integer(B),C is A+B, Z is M*N.
simplify(M*X^A*X^B*N,Z*X^C):-integer(A),integer(B),C is A+B, Z is M*N.





simplify(X^A/X^B,X^C):-integer(A),integer(B),C is A-B.
simplify(M*X^A/X^B,M*X^C):-integer(A),integer(B),C is A-B.
simplify(X^A/M*X^B,(1/M)*X^C):-integer(A),integer(B),C is A-B.
simplify(M*X^A/N*X^B,Z*X^C):-integer(A),integer(B),C is A-B, Z is M/N.
simplify(X^A*M/N*X^B,Z*X^C):-integer(A),integer(B),C is A-B, Z is M/N.
simplify(M*X^A/X^B*N,Z*X^C):-integer(A),integer(B),C is A-B, Z is M/N.
simplify(X^A*M/X^B*N,Z*X^C):-integer(A),integer(B),C is A-B, Z is M/N.







simplify(X-Y,Z):- simplify(X,A),simplify(Y,B),(A==X,B==Y->Z=X-Y; simplify(A-B,Z)).%recursive subtraction


simplify(X+Y,Z):-C=X,D=Y,simplify(X,A),simplify(Y,B),( A==C,B==D -> Z=X+Y   ;  simplify(A+B,Z)).%recursive addition-Order imp. because precedence of multiplication & divison more than addition and subtraction.


simplify(X*Y,Z):- simplify(X,A),simplify(Y,B),(A==X,B==Y->Z=X*Y; simplify(A*B,Z)).%recursive multiplication


simplify(X/Y,Z):- simplify(X,A),simplify(Y,B),(A==X,B==Y->Z=X/Y; simplify(A/B,Z)).%recursive divison




equality(X,Y,Z):-simplify(X,A),simplify(Y,B),A==B->Z is 1;Z is 0.














