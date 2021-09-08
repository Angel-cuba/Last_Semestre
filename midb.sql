
CREATE TABLE tyoteryhma (
                tuoteryhma VARCHAR(20) NOT NULL,
                CONSTRAINT tuoteryhma_pk PRIMARY KEY (tuoteryhma)
);


CREATE TABLE tuote (
                yksilointikoodi INTEGER NOT NULL,
                nimike VARCHAR(30) NOT NULL,
                malli VARCHAR(30) NOT NULL,
                merkki VARCHAR(40) NOT NULL,
                paivavuokra FLOAT NOT NULL,
                tuoteryhma VARCHAR(20) NOT NULL,
                CONSTRAINT tuote_pk PRIMARY KEY (yksilointikoodi)
);


CREATE TABLE yhetystyyppi (
                yhteystyyppi INTEGER NOT NULL,
                CONSTRAINT yhetystyyppi_pk PRIMARY KEY (yhteystyyppi)
);


CREATE TABLE asiakas (
                asiakasnumero INTEGER NOT NULL,
                yritys VARCHAR(30) NOT NULL,
                laskutusosoite VARCHAR NOT NULL,
                postinumero VARCHAR(10) NOT NULL,
                postitoimipaikka VARCHAR(30) NOT NULL,
                CONSTRAINT asiakas_pk PRIMARY KEY (asiakasnumero)
);
COMMENT ON TABLE asiakas IS 'Asiakkan perustiedot';
COMMENT ON COLUMN asiakas.laskutusosoite IS 'Yritys laskujan katu- tai PL-osoite';


CREATE TABLE vuokraus (
                tapahtumaid INTEGER NOT NULL,
                yksilointikoodi INTEGER NOT NULL,
                Alkamispiv DATE NOT NULL,
                paatymispaiva DATE NOT NULL,
                asiakasnumero INTEGER NOT NULL,
                CONSTRAINT vuokraus_pk PRIMARY KEY (tapahtumaid)
);


CREATE TABLE yritys_henkilo (
                yrityshenkilo_id INTEGER NOT NULL,
                etunimi VARCHAR(20) NOT NULL,
                sukunimi VARCHAR(30) NOT NULL,
                sahkoposti VARCHAR(40) NOT NULL,
                puhelin VARCHAR(15),
                yhteystyyppi INTEGER NOT NULL,
                asiakasnumero INTEGER NOT NULL,
                CONSTRAINT yritys_henkilo_pk PRIMARY KEY (yrityshenkilo_id)
);
COMMENT ON COLUMN yritys_henkilo.yrityshenkilo_id IS 'Dummy perusavain.';


ALTER TABLE tuote ADD CONSTRAINT tyoteryhma_tuote_fk
FOREIGN KEY (tuoteryhma)
REFERENCES tyoteryhma (tuoteryhma)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE vuokraus ADD CONSTRAINT tuote_vuokraus_fk
FOREIGN KEY (yksilointikoodi)
REFERENCES tuote (yksilointikoodi)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE yritys_henkilo ADD CONSTRAINT yhetystyyppi_yritys_henkilo_fk
FOREIGN KEY (yhteystyyppi)
REFERENCES yhetystyyppi (yhteystyyppi)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE yritys_henkilo ADD CONSTRAINT asiakas_yritys_henkilo_fk
FOREIGN KEY (asiakasnumero)
REFERENCES asiakas (asiakasnumero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE vuokraus ADD CONSTRAINT asiakas_vuokraus_fk
FOREIGN KEY (asiakasnumero)
REFERENCES asiakas (asiakasnumero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
