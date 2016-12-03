-- CREATE TABLE pets(
--   id SERIAL8,
--   name VARCHAR(255),
--   owner VARCHAR(255),
--   date_of_birth DATE,
--   expiry_date DATE
-- );

-- INSERT INTO pets ( name, owner, date_of_birth )
-- VALUES ( 'Huckleberry', 'Valerie', '12 Jun 2004' );

-- INSERT INTO pets ( name, owner, date_of_birth )
-- VALUES ( 'Sputnik', 'Valerie', '12 Jun 2015' );

DROP TABLE pets;
DROP TABLE people;

CREATE TABLE people(
  id SERIAL8 primary key,
  name VARCHAR(255),
  age INT2,
  sex CHAR(1)
);

CREATE TABLE pets(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  owner_id INT8 references people(id),
  date_of_birth DATE not null default '1970-01-01',
  expiry_date DATE check ( expiry_date >= date_of_birth )
);

ALTER TABLE pets
  ADD CONSTRAINT unique_owner_name UNIQUE( name );

  INSERT INTO people ( name, age, sex ) VALUES ( 'Rick', 27, 'M' );
  INSERT INTO people ( name, age, sex ) VALUES ( 'Ray', 32, 'M' );
  INSERT INTO people ( name, age, sex ) VALUES ( 'Valerie', 30, 'F' );