% Parte 1

pelicula(inception,ciencia_ficcion). % a)
actor(leonardo_dicaprio,inception). % b)
director(christopher_nolan,inception). % c)
actor(tom_hanks,forrest_gump). % d)
pelicula(forrest_gump,drama). % e)
director(steven_spielberg,jurassic_park). % f)
pelicula(jurassic_park,aventura). % g)

%Hechos extras
actor(leonardo_dicaprio,jurassic_park).

% Parte 2 - Consultas sobre Hechos

% a) 
% ?-director(chisthoper_nolan,TituloPelicula).
% Devuelve: TituloPelicula = inception

% b) 
% ?-pelicula(TituloPelicula, ciencia_ficcion), actor(NombreActor, TituloPelicula). 
% Devuelve: TituloPelicula = inception, NombreActor = leonardo_dicaprio.


% c) 
% ?- pelicula(TituloPelicula, Genero). 
% Devuelve: 
% ?- pelicula(TituloPelicula,Genero).
% TituloPelicula = inception,
% Genero = ciencia_ficcion ;
% TituloPelicula = forrest_gump,
% Genero = drama ;
% TituloPelicula = jurassic_park,
% Genero = aventura.

% d)
% ?-actor(NombreActor,inception),actor(NombreActor,OtraPelicula), OtraPelicula \= inception
% Devuelve: NO SE PUDO, NO ME PERMITE EJECUTAR

% Parte 3 - Definir reglas