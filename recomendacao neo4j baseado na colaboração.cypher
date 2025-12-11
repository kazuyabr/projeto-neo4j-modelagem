MATCH (alice:User {name: 'Alice'})-[:LISTENED_TO]->(shared_song:Song)<-[:LISTENED_TO]-(neighbor:User)
WHERE alice <> neighbor // Garante que não é a própria Alice
WITH alice, neighbor
MATCH (neighbor)-[:LISTENED_TO]->(recommended_song:Song)
WHERE NOT (alice)-[:LISTENED_TO]->(recommended_song) // Músicas que Alice NÃO ouviu
RETURN recommended_song.title AS Recommendation_for_Alice, 'User Similarity' AS Type
LIMIT 5