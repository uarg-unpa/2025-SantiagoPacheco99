:- dynamic libro/2.
:- dynamic prestado/2.


libro("el_principito", "antoine_de_saint_exupery").
libro("1984", "george_orwell").
libro("orgullo_y_prejuicio", "jane_austen").
libro("cien_anios_de_soledad", "gabriel_garcia_marquez").
libro("don_quijote_de_la_mancha", "miguel_de_cervantes").
libro("moby_dick", "herman_melville").
libro("la_odisea", "homero").
libro("crimen_y_castigo", "fiodor_dostoievski").
libro("la_divina_comedia", "dante_alighieri").
libro("el_gran_gatsby", "f_scott_fitzgerald").
libro("los_juegos_del_hambre", "suzanne_collins").
libro("harry_potter_y_la_piedra_filosofal", "j_k_rowling").
libro("el_senior_de_los_anillos", "j_r_r_tolkien").

prestado("el_principito", "juan").

listar_libros :- 
    libro(Titulo, Autor), 
    write('Libro: '), write(Titulo), write(', Autor: '), write(Autor), nl,
    fail.  % Fuerza backtracking para listar todos
listar_libros.  % Clausula vacía para terminar

% Procedimiento para eliminar un Libro (ENTREGA)

eliminar_libro(Titulo) :- 
libro(Titulo, _),  
\+ prestado(Titulo, _),  
retract(libro(Titulo, _)),  
write('Libro eliminado: '), write(Titulo), nl. 

eliminar_libro(Titulo) :-  
prestado(Titulo, _),  
write('Error: Libro '), write(Titulo), write(' está prestado.'), nl,  
fail.  % Fuerza fracaso si está prestado 

eliminar_libro(Titulo) :-  
\+ libro(Titulo, _),  
write('Error: Libro '), write(Titulo), write(' no existe.'), nl,  
fail.  % Fuerza fracaso si no existe 

% TENEMOS QUE EJECUTAR

% Ejecuta ?- eliminar_libro("1984"). y ?- eliminar_libro("el_principito"). Explica cada 
% ejecución. 

% Eliminamos el libro 1984
% Se ejecuta --> Libro eliminado: 1984

% Eliminamos el libro "el_principito"
% Se ejecuta --> Libro el_principito está prestado

% Ejercicio Adicional: Agrega un procedimiento propio eliminar_prestamo(Titulo) usando 
% retract(prestado(Titulo, _)) y pruébalo (e.g., ?- eliminar_prestamo("el_principito").). 

eliminar_prestamo(Titulo) :- 
    retract(prestado(Titulo,_)).

% Nos permite eliminar el prestamo del libro "el_principito"
% Entonces cuando eliminamos el libro, nos lo permitirá hacer

% --------------------PARTE 2 - Uso de CUT para Control de Flujo-------------------

producto(laptop, 800).  % producto(Nombre, Precio) 
producto(celular, 300). 
producto(tablet, 150). 


:- dynamic producto/2.
clasificar(Producto, Categoria) :-  
producto(Producto, Precio),  
Precio > 500,  
Categoria = caro,
!. % cut: no seguir probando mas reglas si ya fue clasificado (No backtrack si caro)

clasificar(Producto, Categoria) :-  
producto(Producto, Precio),  
Precio >= 200, Precio =< 500,  
Categoria = medio,
!.  % Cut: No backtrack si medio

clasificar(Producto, Categoria) :-  
producto(Producto, Precio),  
Precio < 200,  
Categoria = barato. 

% Prueba: Ejecuta ?- clasificar(laptop, C).  
% Explica qué pasa sin cut 
% Elimina un cut y prueba para ver la diferencia. 

% Prueba sin cut:
% clasificar(laptop, C).
% Salida: C=caro; 
% false

% Prueba con cut:
% clasificar(laptop, C).
% Salida: C=caro; 

% La diferencia es que sin el cut se realiza el backtracking, probando las demás reglas.
% En cambio, con el cut servirá para controlar el flujo y evitar respuestas multiples innecesarias.

% Ejercicio Adicional: Agrega una regla propia con cut,, es_oferta(Producto) si precio < 300, 
% usando cut para cortar si no es oferta. 

es_oferta(Producto) :- 
producto(Producto, Precio), 
Precio < 300, 
!,
write(Producto), write(" está en oferta"),nl.

es_oferta(Producto) :-
    write(Producto), write(" NO está en oferta"),nl.

% Aplicado al producto tablet:

% es_oferta(tables).
% Saldia: tablet está en oferta