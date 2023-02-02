SELECT us.user_name AS 'usuario', 
COUNT(st.single_id) AS 'qt_de_musicas_ouvidas', 
ROUND(SUM(sg.singles_duration/60), 2) AS 'total_minutos'
FROM SpotifyClone.user AS us
INNER JOIN SpotifyClone.streamings_table AS st ON us.user_id = st.user_id
INNER JOIN SpotifyClone.singles_table AS sg ON st.single_id = sg.single_id
GROUP BY us.user_name
ORDER BY us.user_name;