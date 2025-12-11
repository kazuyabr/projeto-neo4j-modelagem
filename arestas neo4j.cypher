// Usuários Ouviram Músicas
MATCH (u1:User {id: 'U1'}), (m1:Song {id: 'M1'}), (m2:Song {id: 'M2'})
CREATE (u1)-[:LISTENED_TO]->(m1),
       (u1)-[:LISTENED_TO]->(m2);

MATCH (u2:User {id: 'U2'}), (m2:Song {id: 'M2'}), (m3:Song {id: 'M3'})
CREATE (u2)-[:LISTENED_TO]->(m2),
       (u2)-[:LISTENED_TO]->(m3);

MATCH (u3:User {id: 'U3'}), (m4:Song {id: 'M4'}), (m5:Song {id: 'M5'})
CREATE (u3)-[:LISTENED_TO]->(m4),
       (u3)-[:LISTENED_TO]->(m5);

// Músicas Pertencem a Artistas
MATCH (m1:Song {id: 'M1'}), (m2:Song {id: 'M2'}), (m3:Song {id: 'M3'}), (a1:Artist {id: 'A1'})
CREATE (m1)-[:IS_FROM]->(a1),
       (m2)-[:IS_FROM]->(a1),
       (m3)-[:IS_FROM]->(a1);

MATCH (m4:Song {id: 'M4'}), (m5:Song {id: 'M5'}), (a2:Artist {id: 'A2'})
CREATE (m4)-[:IS_FROM]->(a2),
       (m5)-[:IS_FROM]->(a2);