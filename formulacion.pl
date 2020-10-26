:- [elementos.pl]

atom_chars(co2, L).

remove_char(S,C,X) :- 
	atom_concat(L,R,S), 
	atom_concat(C,W,R), 
	atom_concat(L,W,X).


append('Di', 'oxido ', 'de ', 'carbono').

formulacion_oxidos(C, F) : -
	atom_chars(C, L),


prefijo(1, 'mono').
prefijo(2, 'di').
prefijo(3, 'tri').
prefijo(4, 'tetra').
