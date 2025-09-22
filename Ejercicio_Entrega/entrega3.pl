% Implementa un predicado recursivo para imprimir N números aleatorios entre 1 y 100, 
% usando iteración recursiva. 

% Caso base:

imprimir(1) :-  
    random(1, 100, A),  
    write(A), nl,  
    write('fin'), nl,  
    !.  % Cut para cortar al final 

imprimir(X) :-  
    X > 1,  
    random(1, 100, A),  
    write(A), nl,  
    X1 is X - 1,  
    imprimir(X1). 

% Explicacion de caso base:
% Si es 1, solo se genera un numero aleatorio,
% posteriormente se escribe "fin" y, por último,
% se implementa el cut (!) para cortar con el flujo.

% -------------- Ejercicio adicional --------------


tabla(N, 10) :-
    R is N * 10,
    write(N), write(' * 10 = '), write(R), nl,
    write('fin'), nl, !.

% Caso recursivo: mientras M < 10
tabla(N, M) :-
    M < 10,
    R is N * M,
    write(N), write(' * '), write(M), write(' = '), write(R), nl,
    M1 is M + 1,
    tabla(N, M1).

% -------------- Parte 4 --------------

% 1. Crear la base de conocimientos con al menos 6 productos, asignando nombres, precios y 
% categorías (por ejemplo, ‘E’, ‘F’, etc.). 
:- dynamic producto/3.

producto(leche, 150, e).
producto(pan, 50, f).
producto(huevo, 200, e).
producto(manzana, 120, g).
producto(queso, 300, e).
producto(jugo, 80, f).

listar_productos :-
    producto(Nombre,Precio,Categoria),
    write("Producto: "), write(Nombre), write(", Precio: "),write(Precio), write(" y Categoría: "), write(Categoria), nl,
    fail.
listar_productos.

% 2) Implementar un predicado recursivo “aumento_productos” que aplique un aumento del 
% 5% a todos los productos de la categoría E, actualizando sus precios en la base de hechos 
% utilizando retract y assert. 

% Caso base
aumentar_productos :-
    \+ producto(_, _, e), !.

aumentar_productos :-
    producto(Nombre, Precio, e),
    retract(producto(Nombre, Precio, e)),   % Elimina el producto de la base de hechos
    PrecioNuevo is Precio * 1.05, 
    retractall(producto(Nombre, _, e_nuevo)),  % Elimina duplicados previos
    assertz(producto(Nombre, PrecioNuevo, e_nuevo)),
    aumentar_productos.

% Primero ponemos "listar_productos."
% Luego ponemos "aumentar_productos."
% Por último, volvemos a poner "listar_productos." --> Muestra los precios actualizados de la categoria E        

