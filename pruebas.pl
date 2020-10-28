resto([X|_] , X).
resto2([_|R], R).	

funcion1([X|R], Union) :-
	resto(R, Resto),
	atom_concat(X,Resto,Union).

es_oxido([_|R], S) :-
	resto(R, o).

es_oxido([_|R], S) :- es_oxido(R,S).

elemento(o, oxigeno).

obtener_nombre([X|_], [oxido|S]) :-
	elemento(X, oxigeno).

formulacion([X|R], S) :-
	resto(R, E),
	atom_concat(X,E,S),
	resto2(R, ListaRestos),
	formulacion(ListaRestos, W).
