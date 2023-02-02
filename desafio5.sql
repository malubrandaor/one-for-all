SELECT st.singles_name AS 'cancao',
COUNT(streaming.single_id) AS 'reproducoes' FROM SpotifyClone.singles_table AS st INNER JOIN SpotifyClone.streamings_table AS streaming
ON streaming.single_id = st.single_id
GROUP BY st.singles_name
ORDER BY COUNT(streaming.single_id) DESC, st.singles_name
LIMIT 2;