--DROP TABLE owner;
--DROP TABLE pet;
--DROP TABLE visit;
--DROP TABLE procedure;


BEGIN TRANSACTION;

CREATE TABLE owner (
   owner_id serial NOT NULL,
   first_name varchar(45) NOT NULL,
   last_name varchar(45) NOT NULL,
   
   CONSTRAINT pk_owner PRIMARY KEY (owner_id)
 );  
  
 CREATE TABLE pet (
   pet_id serial NOT NULL,
   owner_id int NOT NULL,
   pet_name varchar(45) NOT NULL,
   pet_age int NOT NULL,
   pet_type varchar(45) NOT NULL,
   
   CONSTRAINT pk_pet PRIMARY KEY (pet_id)
 );
 
 CREATE TABLE visit (
    visit_id serial NOT NULL,
    pet_id int NOT NULL,
    visit_date timestamp NOT NULL,
    
    CONSTRAINT pk_visit PRIMARY KEY (visit_id)
 );
 
 CREATE TABLE procedure (
    procedure_id serial NOT NULL,
    pet_id int NOT NULL,
    
    
    CONSTRAINT pk_procedure PRIMARY KEY (procedure_id)
 );
 
  ALTER TABLE visit
    ADD CONSTRAINT fk_visit_pet FOREIGN KEY (pet_id) REFERENCES pet(pet_id);  
    
  ALTER TABLE procedure
    ADD CONSTRAINT fk_procedure_pet FOREIGN KEY (pet_id) REFERENCES pet(pet_id);  
    
  ALTER TABLE pet
   ADD CONSTRAINT fk_pet_owner FOREIGN KEY (owner_id) REFERENCES owner(owner_id);
    
 COMMIT TRANSACTION;