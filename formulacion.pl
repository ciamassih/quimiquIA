:- ['elementos.pl'].

% RULES
% Regla para invertir los elementos correctamente
invertir_elemento([X,Y,Z|R], E) :-
	atom_concat(X,Y,W),
	elemento(W),
	nombre_elemento(Z, oxigeno), 
	reverse([Y,X,Z|R], E).

invertir_elemento([X,Y,Z,W|R], E) :-
	atom_concat(X,Y,Q),
	elemento(Q),
	prefijo(Z, _),
	nombre_elemento(W, oxigeno),
	reverse([Y,X,Z,W|R],E).

invertir_elemento([X|R], [E|S]) :-
	reverse([X|R], [E|S]),
	\+ (X = o).

% Regla para convertir los caracteres en números 
string_elemento([X|R] , [E|S]) :-
	atom_number(X, E),
	string_elemento(R, S).

string_elemento([X|R], [X|S]) :-
	string_elemento(R, S).

string_elemento([], []).

% Regla para comprobar que se trata de óxido
es_oxido([X|_], _) :-
	nombre_elemento(X, oxigeno).

es_oxido([X,Y|_], _) :-
	prefijo(X, _),
	nombre_elemento(Y, oxigeno).

% Regla para pasar de los elementos del compuesto a sus nombres 
elemento_nombre([X|R], [E|S]) :-
	prefijo(X, E),
	elemento_nombre(R, S).

elemento_nombre([o|R], [oxido,de|S]) :-
	elemento_nombre(R, S).

elemento_nombre([X,Y|R],[E|S]) :-
	atom_concat(X, Y, Z),
	nombre_elemento(Z, E),
	elemento_nombre(R,S).

elemento_nombre([X|R], [E|S]) :-
	nombre_elemento(X, E),
	elemento_nombre(R,S),
	\+ (X = o).

elemento_nombre([], []).

% Regla para añadir el prefijo 'mon' a los elementos con solo un átomo de 'oxígeno'
annadir_prefijo([oxido|R], S) :-
	prefijo(1, X),
	append([X],[oxido|R], S).

annadir_prefijo([X|R], [X|R]).

% Regla para formar el compuesto con sus nombres
formular([oxido,X,Y|_], E) :-
	nombre_elemento(_, Y),
	atomic_list_concat([oxido,X,Y], ' ', W),
	atom_string(W, E).

formular([X,oxido,Y,Z|_], E) :-
	prefijo(_, X),
	nombre_elemento(_, Z),
	atomic_list_concat([X,oxido,' ',Y,' ',Z], '', W),
	atom_string(W, E).

formular([oxido,X,Y,Z|_], E) :-
  atomic_list_concat([oxido,' ',X,' ',Y,Z], '', W),
	atom_string(W, E).

formular([X,oxido,Y,Z,Q|_], E) :-
	prefijo(_, X),
	atomic_list_concat([X,oxido,' ',Y,' ',Z,Q], '', W),
	atom_string(W, E).

% Componer el compuesto químico
compuesto_quimico(X, R) :-
	atom_chars(X, StringElementos),
	string_elemento(StringElementos, Elementos),
	invertir_elemento(Elementos, Elementos2),
	es_oxido(Elementos2, _),
	elemento_nombre(Elementos2, Elementos3),
	annadir_prefijo(Elementos3, Q),
	formular(Q,R).

% FACTS
prefijo(1, mon).
prefijo(2, di).
prefijo(3, tri).
prefijo(4, tetra).
