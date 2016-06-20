--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

-- Started on 2016-04-09 14:03:47

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 24657)
-- Name: AVA; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "AVA";


ALTER SCHEMA "AVA" OWNER TO postgres;

--
-- TOC entry 1 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2186 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = "AVA", pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 187 (class 1259 OID 24680)
-- Name: anno_accademico; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE anno_accademico (
    k_anno_accademico integer NOT NULL,
    codice_anno text,
    nome_anno_x text,
    nome_anno_x_uno text,
    nome_anno_x_uno_x text
);


ALTER TABLE anno_accademico OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 24678)
-- Name: anno_accademico_k_anno_accademico_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE anno_accademico_k_anno_accademico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE anno_accademico_k_anno_accademico_seq OWNER TO postgres;

--
-- TOC entry 2187 (class 0 OID 0)
-- Dependencies: 186
-- Name: anno_accademico_k_anno_accademico_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE anno_accademico_k_anno_accademico_seq OWNED BY anno_accademico.k_anno_accademico;


--
-- TOC entry 193 (class 1259 OID 24714)
-- Name: corso; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE corso (
    k_corso integer NOT NULL,
    nome_corso text,
    numero_cfu numeric,
    ssd text,
    codice_corso text
);


ALTER TABLE corso OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 24691)
-- Name: corso_di_studi; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE corso_di_studi (
    k_corso_di_studi integer NOT NULL,
    data_inizio text,
    data_fine text,
    nome_cds text,
    tipo_cds text,
    nome_dipartimento text,
    codice_dipartimento text,
    durata_legale numeric,
    codice_ateneo text,
    codice_corso_di_studi integer
);


ALTER TABLE corso_di_studi OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 24689)
-- Name: corso_di_studi_k_corso_di_studi_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE corso_di_studi_k_corso_di_studi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE corso_di_studi_k_corso_di_studi_seq OWNER TO postgres;

--
-- TOC entry 2188 (class 0 OID 0)
-- Dependencies: 188
-- Name: corso_di_studi_k_corso_di_studi_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE corso_di_studi_k_corso_di_studi_seq OWNED BY corso_di_studi.k_corso_di_studi;


--
-- TOC entry 192 (class 1259 OID 24712)
-- Name: corso_k_corso_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE corso_k_corso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE corso_k_corso_seq OWNER TO postgres;

--
-- TOC entry 2189 (class 0 OID 0)
-- Dependencies: 192
-- Name: corso_k_corso_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE corso_k_corso_seq OWNED BY corso.k_corso;


--
-- TOC entry 181 (class 1259 OID 24658)
-- Name: esami_fact; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE esami_fact (
    k_studente integer NOT NULL,
    k_anno_accademico integer NOT NULL,
    k_corso_di_studi integer NOT NULL,
    k_corso integer NOT NULL,
    k_tempo integer NOT NULL,
    voto_esame integer,
    cfu_esame integer
);


ALTER TABLE esami_fact OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 24661)
-- Name: ingressi_fact; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE ingressi_fact (
    k_studente integer NOT NULL,
    k_anno_accademico integer NOT NULL,
    k_corso_di_studi integer NOT NULL,
    k_tipo_di_immatricolazione integer NOT NULL,
    k_tempo integer NOT NULL,
    punteggio_test_ammissione integer,
    immatricolato text
);


ALTER TABLE ingressi_fact OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 24664)
-- Name: lauree_fact; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE lauree_fact (
    k_anno_accademico integer NOT NULL,
    k_corso_di_studi integer NOT NULL,
    k_tempo integer NOT NULL,
    voto_laurea integer,
    k_studente integer
);


ALTER TABLE lauree_fact OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 24669)
-- Name: studente; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE studente (
    k_studente integer NOT NULL,
    data_di_nascita text,
    coorte numeric,
    titolo_di_studio text,
    sesso text,
    regione_residenza text,
    provincia_residenza text,
    comune_residenza text,
    stato_residenza text,
    cittadinanza text,
    codice_fiscale text,
    nazione_diploma text,
    tipo_scuola_media_superiore text,
    istituto_scuola_media_superiore text,
    anno_diploma numeric,
    voto_scuola_media_superiore text
);


ALTER TABLE studente OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 24667)
-- Name: studente_k_studente_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE studente_k_studente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE studente_k_studente_seq OWNER TO postgres;

--
-- TOC entry 2190 (class 0 OID 0)
-- Dependencies: 184
-- Name: studente_k_studente_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE studente_k_studente_seq OWNED BY studente.k_studente;


--
-- TOC entry 195 (class 1259 OID 24725)
-- Name: tempo; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE tempo (
    k_tempo integer NOT NULL,
    anno numeric,
    mese numeric,
    giorno numeric
);


ALTER TABLE tempo OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 24723)
-- Name: tempo_k_tempo_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE tempo_k_tempo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tempo_k_tempo_seq OWNER TO postgres;

--
-- TOC entry 2191 (class 0 OID 0)
-- Dependencies: 194
-- Name: tempo_k_tempo_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE tempo_k_tempo_seq OWNED BY tempo.k_tempo;


--
-- TOC entry 191 (class 1259 OID 24702)
-- Name: tipo_immatricolazione; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE tipo_immatricolazione (
    k_tipo_immatricolazione integer NOT NULL,
    tipo_immatricolazione text,
    id_tipo_immatricolazione text
);


ALTER TABLE tipo_immatricolazione OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 24700)
-- Name: tipo_immatricolazione_k_tipo_immatricolazione_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE tipo_immatricolazione_k_tipo_immatricolazione_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_immatricolazione_k_tipo_immatricolazione_seq OWNER TO postgres;

--
-- TOC entry 2192 (class 0 OID 0)
-- Dependencies: 190
-- Name: tipo_immatricolazione_k_tipo_immatricolazione_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE tipo_immatricolazione_k_tipo_immatricolazione_seq OWNED BY tipo_immatricolazione.k_tipo_immatricolazione;


--
-- TOC entry 2032 (class 2604 OID 24683)
-- Name: k_anno_accademico; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY anno_accademico ALTER COLUMN k_anno_accademico SET DEFAULT nextval('anno_accademico_k_anno_accademico_seq'::regclass);


--
-- TOC entry 2035 (class 2604 OID 24717)
-- Name: k_corso; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY corso ALTER COLUMN k_corso SET DEFAULT nextval('corso_k_corso_seq'::regclass);


--
-- TOC entry 2033 (class 2604 OID 24694)
-- Name: k_corso_di_studi; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY corso_di_studi ALTER COLUMN k_corso_di_studi SET DEFAULT nextval('corso_di_studi_k_corso_di_studi_seq'::regclass);


--
-- TOC entry 2031 (class 2604 OID 24672)
-- Name: k_studente; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY studente ALTER COLUMN k_studente SET DEFAULT nextval('studente_k_studente_seq'::regclass);


--
-- TOC entry 2036 (class 2604 OID 24728)
-- Name: k_tempo; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY tempo ALTER COLUMN k_tempo SET DEFAULT nextval('tempo_k_tempo_seq'::regclass);


--
-- TOC entry 2034 (class 2604 OID 24705)
-- Name: k_tipo_immatricolazione; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY tipo_immatricolazione ALTER COLUMN k_tipo_immatricolazione SET DEFAULT nextval('tipo_immatricolazione_k_tipo_immatricolazione_seq'::regclass);


--
-- TOC entry 2044 (class 2606 OID 24688)
-- Name: anno_accademico_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY anno_accademico
    ADD CONSTRAINT anno_accademico_pkey PRIMARY KEY (k_anno_accademico);


--
-- TOC entry 2046 (class 2606 OID 24699)
-- Name: corso_di_studi_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY corso_di_studi
    ADD CONSTRAINT corso_di_studi_pkey PRIMARY KEY (k_corso_di_studi);


--
-- TOC entry 2050 (class 2606 OID 24722)
-- Name: corso_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY corso
    ADD CONSTRAINT corso_pkey PRIMARY KEY (k_corso);


--
-- TOC entry 2038 (class 2606 OID 24805)
-- Name: esami_fact_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY esami_fact
    ADD CONSTRAINT esami_fact_pkey PRIMARY KEY (k_studente, k_anno_accademico, k_corso_di_studi, k_corso, k_tempo);


--
-- TOC entry 2040 (class 2606 OID 24807)
-- Name: ingressi_fact_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY ingressi_fact
    ADD CONSTRAINT ingressi_fact_pkey PRIMARY KEY (k_studente, k_anno_accademico, k_corso_di_studi, k_tipo_di_immatricolazione, k_tempo);


--
-- TOC entry 2042 (class 2606 OID 24677)
-- Name: studente_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY studente
    ADD CONSTRAINT studente_pkey PRIMARY KEY (k_studente);


--
-- TOC entry 2052 (class 2606 OID 24733)
-- Name: tempo_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY tempo
    ADD CONSTRAINT tempo_pkey PRIMARY KEY (k_tempo);


--
-- TOC entry 2048 (class 2606 OID 24710)
-- Name: tipo_immatricolazione_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY tipo_immatricolazione
    ADD CONSTRAINT tipo_immatricolazione_pkey PRIMARY KEY (k_tipo_immatricolazione);


--
-- TOC entry 2054 (class 2606 OID 24739)
-- Name: esami_fact_k_anno_accademico_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY esami_fact
    ADD CONSTRAINT esami_fact_k_anno_accademico_fkey FOREIGN KEY (k_anno_accademico) REFERENCES anno_accademico(k_anno_accademico);


--
-- TOC entry 2055 (class 2606 OID 24744)
-- Name: esami_fact_k_corso_di_studi_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY esami_fact
    ADD CONSTRAINT esami_fact_k_corso_di_studi_fkey FOREIGN KEY (k_corso_di_studi) REFERENCES corso_di_studi(k_corso_di_studi);


--
-- TOC entry 2056 (class 2606 OID 24749)
-- Name: esami_fact_k_corso_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY esami_fact
    ADD CONSTRAINT esami_fact_k_corso_fkey FOREIGN KEY (k_corso) REFERENCES corso(k_corso);


--
-- TOC entry 2053 (class 2606 OID 24734)
-- Name: esami_fact_k_studente_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY esami_fact
    ADD CONSTRAINT esami_fact_k_studente_fkey FOREIGN KEY (k_studente) REFERENCES studente(k_studente);


--
-- TOC entry 2057 (class 2606 OID 24754)
-- Name: esami_fact_k_tempo_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY esami_fact
    ADD CONSTRAINT esami_fact_k_tempo_fkey FOREIGN KEY (k_tempo) REFERENCES tempo(k_tempo);


--
-- TOC entry 2059 (class 2606 OID 24764)
-- Name: ingressi_fact_k_anno_accademico_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY ingressi_fact
    ADD CONSTRAINT ingressi_fact_k_anno_accademico_fkey FOREIGN KEY (k_anno_accademico) REFERENCES anno_accademico(k_anno_accademico);


--
-- TOC entry 2060 (class 2606 OID 24769)
-- Name: ingressi_fact_k_corso_di_studi_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY ingressi_fact
    ADD CONSTRAINT ingressi_fact_k_corso_di_studi_fkey FOREIGN KEY (k_corso_di_studi) REFERENCES corso_di_studi(k_corso_di_studi);


--
-- TOC entry 2058 (class 2606 OID 24759)
-- Name: ingressi_fact_k_studente_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY ingressi_fact
    ADD CONSTRAINT ingressi_fact_k_studente_fkey FOREIGN KEY (k_studente) REFERENCES studente(k_studente);


--
-- TOC entry 2062 (class 2606 OID 24779)
-- Name: ingressi_fact_k_tempo_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY ingressi_fact
    ADD CONSTRAINT ingressi_fact_k_tempo_fkey FOREIGN KEY (k_tempo) REFERENCES tempo(k_tempo);


--
-- TOC entry 2061 (class 2606 OID 24774)
-- Name: ingressi_fact_k_tipo_di_immatricolazione_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY ingressi_fact
    ADD CONSTRAINT ingressi_fact_k_tipo_di_immatricolazione_fkey FOREIGN KEY (k_tipo_di_immatricolazione) REFERENCES tipo_immatricolazione(k_tipo_immatricolazione);


--
-- TOC entry 2063 (class 2606 OID 24789)
-- Name: lauree_fact_k_anno_accademico_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY lauree_fact
    ADD CONSTRAINT lauree_fact_k_anno_accademico_fkey FOREIGN KEY (k_anno_accademico) REFERENCES anno_accademico(k_anno_accademico);


--
-- TOC entry 2064 (class 2606 OID 24794)
-- Name: lauree_fact_k_corso_di_studi_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY lauree_fact
    ADD CONSTRAINT lauree_fact_k_corso_di_studi_fkey FOREIGN KEY (k_corso_di_studi) REFERENCES corso_di_studi(k_corso_di_studi);


--
-- TOC entry 2065 (class 2606 OID 24799)
-- Name: lauree_fact_k_tempo_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY lauree_fact
    ADD CONSTRAINT lauree_fact_k_tempo_fkey FOREIGN KEY (k_tempo) REFERENCES tempo(k_tempo);


--
-- TOC entry 2066 (class 2606 OID 24836)
-- Name: stud; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY lauree_fact
    ADD CONSTRAINT stud FOREIGN KEY (k_studente) REFERENCES studente(k_studente);


-- Completed on 2016-04-09 14:03:48

--
-- PostgreSQL database dump complete
--

