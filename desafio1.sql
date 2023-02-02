DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

-- ALL SET TABLE_PLAN w/ VALUES
  CREATE TABLE SpotifyClone.table_plan(
      plan_table_id INT PRIMARY KEY AUTO_INCREMENT,
      user_plan VARCHAR(100) NOT NULL,
      plan_numbers DECIMAL(5, 2) NOT NULL
  ) engine = InnoDB;


  INSERT INTO SpotifyClone.table_plan (user_plan, plan_numbers)
  VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitario', 5.99),
    ('pessoal', 6.99);

-- ALL SET USER w/ VALUES
 CREATE TABLE SpotifyClone.user(
      user_id INT PRIMARY KEY AUTO_INCREMENT,
      user_name VARCHAR(100) NOT NULL,
      user_age INT NOT NULL,
      plan_table_id INT NOT NULL,
      user_signing_date DATETIME,
      FOREIGN KEY (plan_table_id) REFERENCES table_plan (plan_table_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.user (user_name, user_age, plan_table_id, user_signing_date)
  VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 2, '2017-12-30'),
    ('Martin Fowler', 46, 2, '2017-01-17'),
    ('Sandi Metz', 58, 2, '2018-04-29'),
    ('Paulo Freire', 19, 3, '2018-02-14'),
    ('Bell Hooks', 26, 3, '2018-01-05'),
    ('Christopher Alexander', 85, 4, '2019-06-05'),
    ('Judith Butler', 45, 4, '2020-05-13'),
    ('Jorge Amado', 58, 4, '2017-02-17');
  
  -- ALL SET ARTISTS_TABLE w/ VALUES 

  CREATE TABLE SpotifyClone.artists_table(
      artist_id INT PRIMARY KEY AUTO_INCREMENT,
      artists_name VARCHAR(100) NOT NULL
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.artists_table ( artists_name ) 
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');
  

  -- ALL SET ALBUMS_TABLE w/ VALUES

  CREATE TABLE SpotifyClone.album_table(
      album_id INT PRIMARY KEY AUTO_INCREMENT,
      album_name VARCHAR(100) NOT NULL,
      release_date INT NOT NULL,
      artist_id INT NOT NULL,
      FOREIGN KEY (artist_id) REFERENCES artists_table (artist_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.album_table ( album_name, release_date, artist_id ) 
  VALUES
    ('Renaissance', 2022, 1),
    ('Jazz', 1978, 2),
    ('Hot Space', 1982, 2),
    ('Falso Brilhante', 1998, 3),
    ('Vento de Maio', 2001, 3),
    ('QVVJFA?', 2003, 4),
    ('Somewhere Far Beyond', 2007, 5),
    ('I Put A Spell On You', 2012, 6);
  
   -- ALL SET SINGLES_TABLE w/ VALUES

  CREATE TABLE SpotifyClone.singles_table(
      single_id INT PRIMARY KEY AUTO_INCREMENT,
      singles_name VARCHAR(100) NOT NULL,
      singles_duration INT NOT NULL,
      album_id INT NOT NULL,
      FOREIGN KEY (album_id) REFERENCES album_table (album_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.singles_table (singles_name, singles_duration, album_id) 
  VALUES
    ("BREAK MY SOUL", 279, 1),
    ("VIRGO’S GROOVE", 369, 1),
    ("ALIEN SUPERSTAR", 116, 1),
    ("Don’t Stop Me Now", 203, 2),
    ("Under Pressure", 152, 3),
    ("Como Nossos Pais", 105, 4),
    ("O Medo de Amar é o Medo de Ser Livre", 207, 5),
    ("Samba em Paris", 267, 6),
    ("The Bard’s Song", 244, 7),
    ("Feeling Good", 100, 8);
  
  -- ALL SET STREAMINGS_TABLE w/ VALUES

  CREATE TABLE SpotifyClone.streamings_table(
      streamings_table_name INT AUTO_INCREMENT,
      user_id INT,
      single_id INT,
      streaming_date DATETIME,
      PRIMARY KEY (streamings_table_name, user_id),
      FOREIGN KEY (user_id) REFERENCES user (user_id),
      FOREIGN KEY (single_id) REFERENCES singles_table (single_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.streamings_table (user_id, single_id, streaming_date) 
  VALUES
      (1, 8, '2022-02-28 10:45:55'),
      (1, 2, '2020-05-02 05:30:35'),
      (1, 10, '2020-03-06 11:22:33'),
      (2, 10, '2022-08-05 08:05:17'),
      (2, 7, '2020-01-02 07:40:33'),
      (3, 10, '2020-11-13 16:55:13'),
      (3, 2, '2020-12-05 18:38:30'),
      (4, 8, '2021-08-15 17:10:10'),
      (5, 8, '2022-01-09 01:44:33'),
      (5, 5, '2020-08-06 15:23:43'),
      (6, 7, '2017-01-24 00:31:17'),
      (6, 1, '2017-10-12 12:35:20'),
      (7, 4, '2011-12-15 22:30:49'),
      (8, 4, '2012-03-17 14:56:41'),
      (9, 9, '2022-02-24 21:14:22'),
      (10, 3, '2015-12-13 08:30:22');
  
  -- ALL SET SOCIAL_MEDIA_TABLE w/ VALUES

  CREATE TABLE SpotifyClone.social_media_table(
      social_media_name INT AUTO_INCREMENT,
      user_id INT,
      artist_id INT,
      PRIMARY KEY (social_media_name, user_id),
      FOREIGN KEY (user_id) REFERENCES user  (user_id),
      FOREIGN KEY (artist_id) REFERENCES artists_table (artist_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.social_media_table (user_id, artist_id) 
  VALUES
      (1, 1),
      (1, 2),
      (1, 3),
      (2, 1),
      (2, 3),
      (3, 2),
      (4, 4),
      (5, 5),
      (5, 6),
      (6, 1),
      (6, 6),
      (7, 6),
      (9, 3),
      (10, 2);