# quimiquIA

## PROBLEMA A SOLUCIONAR
El problema que se ha decidido solucionar es el de la *formulacion de compuestos quimicos*, unicamente óxidos, mediante el uso de prolog.
El funcionamiento del programa es simple y es el siguiente: Al iniciar prolog es necesario iniciarlo con la base de conocimientos formulacion.pl y una vez iniciado se pregunta el compuesto del que deseamos conocer la formulacion mediante la regla *compuesto_quimico*.

## REGLAS
La regla *invertir_elemento* es la encargada de dar la vuelta a los elementos, reordenandolos de manera que la formulacion salga de manera correcta y coherente.

La regla *string_elemento* es la encargada de convertir los caracteres en enteros.

La regla *es_oxido* se encarga de comprobar que el compuesto que hemos introducido es un óxido y para ello ha de buscar si está presente el oxígeno en la formula introducida. Como los oxidos unicamente están formados por un elemento adicional al oxígeno, buscará dicho oxígeno en la segunda posición o tercera para el caso de que el primer elemento tenga dos letras.

La regla *elemento_nombre* es la encargada de asignar a cada elemento de la formula introducida su correspondiente nombre de la tabla periodica, para ello se hace uso de una base de conocimiento adicional añadida en la cual se reflejan los principales elementos químicos junto con su abreviación
La regla formular 

Por último la regla *compuesto_quimico* hace uso de todas las reglas anteriores para dar salida a la formulación exacta del compuesto químico

## FACTS
Aqui se añade las posibilidades de tipos de óxidos que existen, siendo estos: mono, di, tri y tetra siendo uno, dos, tres y cuatro respectivamente
