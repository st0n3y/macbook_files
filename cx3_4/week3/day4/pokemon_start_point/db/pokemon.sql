DROP TABLE ownedpokemons;
DROP TABLE pokemons;
DROP TABLE trainers;

CREATE TABLE trainers (
  id SERIAL4 primary key,
  name VARCHAR(255)
);

CREATE TABLE pokemons (
  id SERIAL4 primary key,
  name VARCHAR(255)
);

CREATE TABLE ownedpokemons (
  id SERIAL4 primary key,
  pokemon_id INT4 REFERENCES pokemons( id ),
  trainer_id INT4 REFERENCES trainers( id )
);