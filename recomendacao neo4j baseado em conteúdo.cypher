MATCH (bob:User {name: 'Bob'})-[:LISTENED_TO]->(song_bob_listened:Song)-[:IS_FROM]->(artist:Artist)
WITH bob, artist
MATCH (artist)<-[:IS_FROM]-(recommended_song:Song)
WHERE NOT (bob)-[:LISTENED_TO]->(recommended_song) // Músicas que Bob NÃO ouviu
RETURN recommended_song.title AS Recommendation_for_Bob, 'Content Similarity (Artist)' AS Type
LIMIT 5