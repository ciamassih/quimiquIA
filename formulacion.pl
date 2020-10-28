:- [elementos.pl]

% RULES
remove_char(S,C,X) :- 
	atom_concat(L,R,S), 
	atom_concat(C,W,R), 
	atom_concat(L,W,X).

obtener_elementos(Compuesto, Elementos) :-
	atom_chars(Compuesto, Elementos).

obtener_nombres([X|R], Nombres) :-
	nombre_elemento(X, Nombres)
	obtener_nombres(R, Nombres).

reverse([],Z,Z).
reverse([H|T],Z,Acc) :- reverse(T,Z,[H|Acc]).

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


% FACTS
prefijo(1, 'mono').
prefijo(2, 'di').
prefijo(3, 'tri').
prefijo(4, 'tetra').
