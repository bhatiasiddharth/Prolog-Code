# Prolog-Code


## Simplifying algebraic expressions

Simplify algebraic expressions to its normal form (an expression in which cannot be simplified by further application of algebraic identities).

* simplify(x* x,Y).
Y = x^2

* simplify(x* x* x* 2,Y).
Y = x^3* 2 

* simplify(2* x+3* x,Y).
Y = 5* x 

* simplify(0+x,Y).
Y = x 

* simplify(5* x^2+2* x^5,Y).
Y = x^2*  (5+2* x^3)

* simplify(5* x^2+2* x^2,Y).
Y = 7* x^2

* simplify(x^0,Y).
Y = 1 

* simplify(x/0,Y).
Y = undefined 

* simplify(0/x,Y).
Y = 0 

* simplify(7* x^2/5* x^3,Y).
Y = 1.4* x^ -1 

* simplify(7* x^5* 8* x^3,Y).
Y = 56* x^8 

* equality(7* x^2, 7* x^2, Y).
Y = 1.

* simplify(x^2* 5+x^5* 3,Y).
Y = x^2*  (5+3* x^3)

* simplify(5* x^2-3* x^5,Y).
Y = x^2*  (5-3* x^3)

* simplify(5* x^2-3* x^5+2* x^4,Y).
Y = x^4*  ((5-3* x^3)* x^ -2+2)

* simplify(x^6* 4/5* x^2, Y).
Y = 0.8* x^4 

* simplify(-4* x^6* 5* x^2, Y).
Y = -20* x^8

## Express the academic regulations of BITS Pilani

Rules 3.1 t0 3.20 (refer section-3 of the academic regulations) in prolog. Program answers possible queries on regulations such as

1. Is a student eligible for doing PS course?
2. Is a first degree student eligible for doing a higher degree course?
3. Is a duel degree student eligible for doing a core course on his second degree?
4. Is there a conflict in the list of courses scheduled for a student?
