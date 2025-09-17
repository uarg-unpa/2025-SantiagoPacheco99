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

% --------------------PARTE 2 - Uso de CUT para Control de Flujo-------------------

producto(laptop, 800).  % producto(Nombre, Precio) 
producto(celular, 300). 
producto(tablet, 150). 







