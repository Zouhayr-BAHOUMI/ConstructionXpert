select * from Tache;
Select * from Projet;

Select * from Ressource;

CREATE TABLE projet (
  id_projet SERIAL PRIMARY KEY,
  nom_projet VARCHAR(255) NOT NULL,
  description VARCHAR(255),
  date_debut DATE,
  date_fin DATE
);

CREATE TABLE tache (
  id_tache SERIAL PRIMARY KEY,
  description VARCHAR(255) NOT NULL,
  date_debut VARCHAR(255) NOT NULL,
  date_fin VARCHAR(255) NOT NULL,
  status VARCHAR(255) NOT NULL,
  id_projet INTEGER NOT NULL,
  FOREIGN KEY (id_projet) REFERENCES projet(id_projet) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Ressource (
  id_ressource SERIAL PRIMARY KEY,
  nom_ressource VARCHAR(255) NOT NULL,
  type_ressource VARCHAR(255) NOT NULL,
  quantité FLOAT NOT NULL,
  nom_fournisseur VARCHAR(255) NOT NULL,
  contact_fournisseur VARCHAR(255) NOT NULL,
  adresse VARCHAR(255) NOT NULL,
  id_tache INTEGER NOT NULL,
  FOREIGN KEY (id_tache) REFERENCES tache(id_tache) ON DELETE CASCADE ON UPDATE CASCADE
);