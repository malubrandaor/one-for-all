SELECT ar.artists_name AS artista, al.album_name AS album 
FROM SpotifyClone.artists_table AS ar
INNER JOIN SpotifyClone.album_table AS al ON ar.artist_id = al.artist_id 
WHERE artists_name = 'Elis Regina';