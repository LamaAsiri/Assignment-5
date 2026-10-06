male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

parent(abraham, herb).
parent(abraham, homer).
parent(mona, herb).
parent(mona, homer).

parent(clancy, marge).
parent(clancy, patty).
parent(clancy, selma).
parent(jackie, marge).
parent(jackie, patty).
parent(jackie, selma).

parent(homer, bart).
parent(homer, lisa).
parent(homer, maggie).
parent(marge, bart).
parent(marge, lisa).
parent(marge, maggie).

parent(selma, ling).

father(F, C) :- parent(F, C), male(F).
mother(M, C) :- parent(M, C), female(M).

son(S, P) :- parent(P, S), male(S).
daughter(D, P) :- parent(P, D), female(D).

brother(B, Sibling) :- parent(P, B), parent(P, Sibling), male(B), B \= Sibling.
sister(S, Sibling) :- parent(P, S), parent(P, Sibling), female(S), S \= Sibling.

grandfather(GF, GC) :- parent(GF, P), parent(P, GC), male(GF).

aunt(A, N) :- sister(A, P), parent(P, N).
uncle(U, N) :- brother(U, P), parent(P, N).

cousin(C, Person) :- parent(P1, C), parent(P2, Person), (brother(P1, P2) ; sister(P1, P2)), C \= Person.

ancestor(A, D) :- parent(A, D).
ancestor(A, D) :- parent(A, X), ancestor(X, D).