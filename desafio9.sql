SELECT COUNT(streaming.user_id) AS 'quantidade_musicas_no_historico' 
FROM SpotifyClone.streamings_table AS streaming 
INNER JOIN SpotifyClone.user AS us ON streaming.user_id = us.user_id 
WHERE us.user_name = 'Barbara Liskov';