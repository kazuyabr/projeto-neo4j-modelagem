// 1. Criação dos Nós de Entidades
// --------------------------------------------------

// Usuários (10 Nós)
UNWIND [
    {id: 1, nome: 'Alice'}, {id: 2, nome: 'Bob'}, {id: 3, nome: 'Carol'}, {id: 4, nome: 'David'}, {id: 5, nome: 'Eve'},
    {id: 6, nome: 'Frank'}, {id: 7, nome: 'Grace'}, {id: 8, nome: 'Heidi'}, {id: 9, nome: 'Ivan'}, {id: 10, nome: 'Judy'}
] AS user
CREATE (u:User {userId: user.id, name: user.nome});

// Gêneros (5 Nós)
UNWIND ['Ação', 'Comédia', 'Drama', 'Ficção Científica', 'Terror'] AS genreName
CREATE (g:Genre {name: genreName});

// Atores (10 Nós)
UNWIND [
    {id: 101, nome: 'Tom Hanks'}, {id: 102, nome: 'Meryl Streep'}, {id: 103, nome: 'Leonardo DiCaprio'}, {id: 104, nome: 'Scarlett Johansson'}, {id: 105, nome: 'Denzel Washington'},
    {id: 106, nome: 'Gal Gadot'}, {id: 107, nome: 'Brad Pitt'}, {id: 108, nome: 'Natalie Portman'}, {id: 109, nome: 'Will Smith'}, {id: 110, nome: 'Cate Blanchett'}
] AS actor
CREATE (a:Actor {actorId: actor.id, name: actor.nome});

// Diretores (5 Nós)
UNWIND [
    {id: 201, nome: 'Steven Spielberg'}, {id: 202, nome: 'Greta Gerwig'}, {id: 203, nome: 'Christopher Nolan'}, {id: 204, nome: 'Patty Jenkins'}, {id: 205, nome: 'Quentin Tarantino'}
] AS director
CREATE (d:Director {directorId: director.id, name: director.nome});

// Filmes (10 Nós)
UNWIND [
    {id: 301, titulo: 'Inception', ano: 2010, genero: 'Ficção Científica', diretor: 'Christopher Nolan'},
    {id: 302, titulo: 'Forrest Gump', ano: 1994, genero: 'Drama', diretor: 'Steven Spielberg'},
    {id: 303, titulo: 'Wonder Woman', ano: 2017, genero: 'Ação', diretor: 'Patty Jenkins'},
    {id: 304, titulo: 'Pulp Fiction', ano: 1994, genero: 'Drama', diretor: 'Quentin Tarantino'},
    {id: 305, titulo: 'Barbie', ano: 2023, genero: 'Comédia', diretor: 'Greta Gerwig'},
    {id: 306, titulo: 'The Martian', ano: 2015, genero: 'Ficção Científica', diretor: 'Steven Spielberg'},
    {id: 307, titulo: 'Jaws', ano: 1975, genero: 'Terror', diretor: 'Steven Spielberg'},
    {id: 308, titulo: 'Titanic', ano: 1997, genero: 'Drama', diretor: 'Christopher Nolan'},
    {id: 309, titulo: 'Interstellar', ano: 2014, genero: 'Ficção Científica', diretor: 'Christopher Nolan'},
    {id: 310, titulo: 'The Devil Wears Prada', ano: 2006, genero: 'Comédia', diretor: 'Greta Gerwig'}
] AS movie
CREATE (m:Movie {movieId: movie.id, title: movie.titulo, releaseYear: movie.ano});

// Séries (5 Nós)
UNWIND [
    {id: 401, titulo: 'Stranger Things', ano: 2016, genero: 'Terror'},
    {id: 402, titulo: 'The Crown', ano: 2016, genero: 'Drama'},
    {id: 403, titulo: 'The Office', ano: 2005, genero: 'Comédia'},
    {id: 404, titulo: 'Black Mirror', ano: 2011, genero: 'Ficção Científica'},
    {id: 405, titulo: 'The Mandalorian', ano: 2019, genero: 'Ação'}
] AS series
CREATE (s:Series {seriesId: series.id, title: series.titulo, startYear: series.ano});

// 2. Criação dos Relacionamentos
// --------------------------------------------------

// Relacionamentos IN_GENRE (Filmes para Gêneros)
MATCH (m:Movie {title: 'Inception'}), (g:Genre {name: 'Ficção Científica'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title: 'Forrest Gump'}), (g:Genre {name: 'Drama'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title: 'Wonder Woman'}), (g:Genre {name: 'Ação'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title: 'Pulp Fiction'}), (g:Genre {name: 'Drama'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title: 'Barbie'}), (g:Genre {name: 'Comédia'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title: 'The Martian'}), (g:Genre {name: 'Ficção Científica'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title: 'Jaws'}), (g:Genre {name: 'Terror'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title: 'Titanic'}), (g:Genre {name: 'Drama'}) CREATE (m)-[:IN_GENRE]->(g);

// Relacionamentos IN_GENRE (Séries para Gêneros)
MATCH (s:Series {title: 'Stranger Things'}), (g:Genre {name: 'Terror'}) CREATE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {title: 'The Office'}), (g:Genre {name: 'Comédia'}) CREATE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {title: 'The Mandalorian'}), (g:Genre {name: 'Ação'}) CREATE (s)-[:IN_GENRE]->(g);

// Relacionamentos DIRECTED (Diretores para Filmes)
MATCH (d:Director {name: 'Christopher Nolan'}), (m:Movie {title: 'Inception'}) CREATE (d)-[:DIRECTED]->(m);
MATCH (d:Director {name: 'Steven Spielberg'}), (m:Movie {title: 'Forrest Gump'}) CREATE (d)-[:DIRECTED]->(m);
MATCH (d:Director {name: 'Patty Jenkins'}), (m:Movie {title: 'Wonder Woman'}) CREATE (d)-[:DIRECTED]->(m);
MATCH (d:Director {name: 'Quentin Tarantino'}), (m:Movie {title: 'Pulp Fiction'}) CREATE (d)-[:DIRECTED]->(m);
MATCH (d:Director {name: 'Greta Gerwig'}), (m:Movie {title: 'Barbie'}) CREATE (d)-[:DIRECTED]->(m);
MATCH (d:Director {name: 'Christopher Nolan'}), (m:Movie {title: 'Titanic'}) CREATE (d)-[:DIRECTED]->(m);

// Relacionamentos ACTED_IN (Atores para Filmes/Séries)
MATCH (a:Actor {name: 'Leonardo DiCaprio'}), (m:Movie {title: 'Inception'}) CREATE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {name: 'Tom Hanks'}), (m:Movie {title: 'Forrest Gump'}) CREATE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {name: 'Gal Gadot'}), (m:Movie {title: 'Wonder Woman'}) CREATE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {name: 'Brad Pitt'}), (m:Movie {title: 'Pulp Fiction'}) CREATE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {name: 'Meryl Streep'}), (m:Movie {title: 'The Devil Wears Prada'}) CREATE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {name: 'Will Smith'}), (s:Series {title: 'The Mandalorian'}) CREATE (a)-[:ACTED_IN]->(s);
MATCH (a:Actor {name: 'Scarlett Johansson'}), (s:Series {title: 'Black Mirror'}) CREATE (a)-[:ACTED_IN]->(s);

// Relacionamentos WATCHED (Usuários assistiram e deram nota)
// User 1 assistiu Inception e deu nota 5
MATCH (u:User {userId: 1}), (m:Movie {title: 'Inception'}) CREATE (u)-[:WATCHED {rating: 5}]->(m);
// User 2 assistiu The Office e deu nota 4
MATCH (u:User {userId: 2}), (s:Series {title: 'The Office'}) CREATE (u)-[:WATCHED {rating: 4}]->(s);
// User 3 assistiu Wonder Woman e deu nota 3
MATCH (u:User {userId: 3}), (m:Movie {title: 'Wonder Woman'}) CREATE (u)-[:WATCHED {rating: 3}]->(m);
// User 4 assistiu The Crown e deu nota 5
MATCH (u:User {userId: 4}), (s:Series {title: 'The Crown'}) CREATE (u)-[:WATCHED {rating: 5}]->(s);
// User 5 assistiu Barbie e deu nota 4
MATCH (u:User {userId: 5}), (m:Movie {title: 'Barbie'}) CREATE (u)-[:WATCHED {rating: 4}]->(m);
// User 6 assistiu Inception e deu nota 4
MATCH (u:User {userId: 6}), (m:Movie {title: 'Inception'}) CREATE (u)-[:WATCHED {rating: 4}]->(m);
// User 7 assistiu The Mandalorian e deu nota 5
MATCH (u:User {userId: 7}), (s:Series {title: 'The Mandalorian'}) CREATE (u)-[:WATCHED {rating: 5}]->(s);
// User 8 assistiu Titanic e deu nota 3
MATCH (u:User {userId: 8}), (m:Movie {title: 'Titanic'}) CREATE (u)-[:WATCHED {rating: 3}]->(m);
// User 9 assistiu Stranger Things e deu nota 5
MATCH (u:User {userId: 9}), (s:Series {title: 'Stranger Things'}) CREATE (u)-[:WATCHED {rating: 5}]->(s);
// User 10 assistiu Forrest Gump e deu nota 4
MATCH (u:User {userId: 10}), (m:Movie {title: 'Forrest Gump'}) CREATE (u)-[:WATCHED {rating: 4}]->(m);