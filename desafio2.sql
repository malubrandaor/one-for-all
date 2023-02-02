SELECT 
(SELECT COUNT(*) FROM SpotifyClone.singles_table) AS 'cancoes',
(SELECT COUNT(*) FROM SpotifyClone.artists_table) AS 'artistas',
(SELECT COUNT(*) FROM SpotifyClone.album_table) AS 'albuns';