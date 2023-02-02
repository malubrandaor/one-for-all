SELECT us.user_name AS 'usuario',
    IF (YEAR(MAX(streaming.streaming_date)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS 'status_usuario'
FROM SpotifyClone.user AS us INNER JOIN SpotifyClone.streamings_table AS streaming ON us.user_id = streaming.user_id
GROUP BY us.user_id
ORDER BY us.user_name;