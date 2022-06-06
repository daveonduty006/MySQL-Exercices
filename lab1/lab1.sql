/*Realise (NomQuartier, IdImmeuble, IdArchitecte, DateDébutTravaux, TypeTravaux)
 *RC' pour reconstruction, 'CO' pour construction ou bien 'RE' pour rénovation
 */


 
CREATE TABLE REALISE (
	NomQuartier: VARCHAR(80) NOT NULL,
	IDImmeuble: INTEGER NOT NULL,
	IDArchitecte: INTEGER NOT NULL,
	DateDebutTravaux: DATE NOT NULL,
	TypeTravaux: ENUM("RC", "CO", "RE"),
	CONSTRAINT REALISE_NomQ_IDI_IDA_PK PRIMARY KEY(NomQuartier, IDImmeuble, IDArchitecte),
	CONSTRAINT REALISE_NomQuartier_FK FOREIGN KEY(NomQuartier) REFERENCES QUARTIER(NomQuartier),
	CONSTRAINT REALISE_IDArchitecte_FK FOREIGN KEY(IDArchitecte) REFERENCES ARCHITECTE(IDArchitecte),
);
