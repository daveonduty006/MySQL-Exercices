CREATE DATABASE IF NOT EXISTS ARCHITECTURECENTER;
USE ARCHITECTURECENTER;
DROP TABLE IF EXISTS quartier;
DROP TABLE IF EXISTS immeuble;
DROP TABLE IF EXISTS architecte;
DROP TABLE IF EXISTS realise;
CREATE TABLE quartier (
	NomQuartier       VARCHAR(80) NOT NULL,
	Localisation      VARCHAR(80) NOT NULL,
	NombreRues        INTEGER NOT NULL,
	NombreImmeubles   INTEGER NOT NULL,
    CONSTRAINT quartier_NomQuartier_PK PRIMARY KEY(NomQuartier));
CREATE TABLE immeuble (
	IDImmeuble        INTEGER NOT NULL,
	NomQuartier       VARCHAR(80) NOT NULL,
	Adresse           VARCHAR(80) NOT NULL,
	NombreEtages      INTEGER NOT NULL,
	Ascenseur         BOOLEAN NOT NULL,
    CONSTRAINT immeuble_IDI_NoQ_PK PRIMARY KEY(IDImmeuble, NomQuartier),
    CONSTRAINT immeuble_NomQuartier_FK FOREIGN KEY(NomQuartier) REFERENCES quartier(NomQuartier));
CREATE TABLE architecte (
	IDArchitecte      INTEGER NOT NULL,
	Nom               VARCHAR(80) NOT NULL,
	Prenom            VARCHAR(80) NOT NULL,
	SecteurActivite   VARCHAR(80) NOT NULL,
    CONSTRAINT	architecte_IDArchitecte_PK PRIMARY KEY(IDArchitecte));
CREATE TABLE Realise (
	NomQuartier       VARCHAR(80) NOT NULL,
	IDImmeuble        INTEGER NOT NULL,
	IDArchitecte      INTEGER NOT NULL,
	DateDebutTravaux  DATE NOT NULL,
	TypeTravaux       ENUM("RC", "CO", "RE") NOT NULL,
    CONSTRAINT realise_NoQ_IDI_IDA_PK PRIMARY KEY(NomQuartier, IDImmeuble, IDArchitecte),
    CONSTRAINT realise_NomQuartier_FK FOREIGN KEY(NomQuartier) REFERENCES quartier(NomQuartier),
    CONSTRAINT realise_IDArchitecte_FK FOREIGN KEY(IDArchitecte) REFERENCES architecte(IDArchitecte));


	
 
