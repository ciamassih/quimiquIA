:- ['elementos.pl'].

% RULES
remove_char(S,C,X) :- 
	atom_concat(L,R,S), 
	atom_concat(C,W,R), 
	atom_concat(L,W,X).

obtener_elementos(Compuesto, Elementos) :-
	atom_chars(Compuesto, Elementos).

obtener_nombres([X|R], Nombres) :-
	nombre_elemento(X, Nombres),
	obtener_nombres(R, Nombres).

% ----- TRY 2 -----
nomenclatura(Compuesto, Nombre) :-
	atom_chars(Compuesto, Elementos),
	renombrar_elementos(Elementos, Elementos2),
	pertenece(oxigeno, Elementos2),
	reverse(Elementos2, Elementos3),
	formulacion(Elementos3, Nombre).

renombrar_elementos([X|R], [E|S]) :- 
	nombre_elemento(X, E), 
	renombrar_elemento(R, S).

renombrar_elementos([X|R], [E|S]) :- 
	prefijo(X, E), 
	renombrar_elementos(R, S).

renombrar_elementos([X|R], ['oxido'|S]) :- 
	nombre_elemento(X, oxigeno), 
	renombrar_elementos(R,S).

pertenece(X, [_,Y]) :- pertenece(X,Y).

% ---- TRY 3 ----
cabeza_lista([X|_], X).
cola_lista([_|X], X).

inversa([], E, E).
inversa([X|R], E, Acc) :- inversa(R, E, [X|Acc]).

elemento_existente([], []).

elemento_existente([X|R], [E|S]) :-
	Cabeza = X,
	cabeza_lista(R, Cola),
	atom_concat(Cabeza, Cola, E),
	elemento(E),
	cola_lista(R, A),
	elemento_existente(A, S).

elemento_existente([X|R], [X|S]) :-
	prefijo(X, _),
	elemento_existente(R, S).

elemento_existente([X|R], [X|S]) :-
	elemento(X),
	elemento_existente(R, S).

es_oxido([X|R], X) :- cabeza_lista(R, o).
es_oxido([X|R], X) :- es_oxido(R, X).

simbolo_elemento([X|R], [E|S]) :-
	nombre_elemento(X, E),
	simbolo_elemento(R, S).

simbolo_elemento([X|R], [E|S]) :-
	prefijo(X,E),
	simbolo_elemento(R, S).

simbolo_elemento([X|R], [oxido|S]) :-
	nombre_elemento(X, oxigeno),
	simbolo_elemento(R, S).

% FACTS
prefijo(1, 'mono').
prefijo(2, 'di').
prefijo(3, 'tri').
prefijo(4, 'tetra').
