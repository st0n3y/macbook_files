CREATE TABLE artists (
  id SERIAL4 primary key,
  name VARCHAR(255)
);

CREATE TABLE albums (
  id SERIAL4 primary key,
  name VARCHAR(255),
  artists_id INT4 REFERENCES artists(id) --Creates foreign key, taking key from other table as parameter.
);