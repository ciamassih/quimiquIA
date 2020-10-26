:- [elementos.pl]

% RULES

atom_chars(co2, L).

remove_char(S,C,X) :- 
	atom_concat(L,R,S), 
	atom_concat(C,W,R), 
	atom_concat(L,W,X).

obtener_nombre(Compuesto, Nombres) : -
	atom_chars(Compuesto, Nombres).

% FACTS

prefijo(1, 'mono').
prefijo(2, 'di').
prefijo(3, 'tri').
prefijo(4, 'tetra').
