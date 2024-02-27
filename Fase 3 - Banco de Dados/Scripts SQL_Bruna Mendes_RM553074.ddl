-- Gerado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   em:        2023-11-02 23:34:50 BRT
--   site:      Oracle Database 12c
--   tipo:      Oracle Database 12c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE t_fin_code (
    id_code              VARCHAR2(18) NOT NULL,
    t_fin_email_id_email VARCHAR2(18) NOT NULL,
    nr_code              NUMBER(6) NOT NULL,
    dt_exp               DATE NOT NULL,
    hr_exp               DATE NOT NULL
);

ALTER TABLE t_fin_code ADD CONSTRAINT t_fin_code_pk PRIMARY KEY ( id_code );

CREATE TABLE t_fin_deb (
    id_deb              VARCHAR2(18) NOT NULL,
    t_fin_s_at_id_s_atu VARCHAR2(18) NOT NULL,
    dt_deb              DATE NOT NULL,
    vl_deb              NUMBER(10, 2) NOT NULL,
    ds_detal            VARCHAR2(30)
);

CREATE UNIQUE INDEX t_fin_deb__idx ON
    t_fin_deb (
        t_fin_s_at_id_s_atu
    ASC );

ALTER TABLE t_fin_deb ADD CONSTRAINT t_fin_deb_pk PRIMARY KEY ( id_deb );

CREATE TABLE t_fin_email (
    id_email           VARCHAR2(18) NOT NULL,
    t_fin_user_id_user VARCHAR2(18) NOT NULL,
    ds_email           VARCHAR2(256) NOT NULL
);

CREATE UNIQUE INDEX t_fin_email__idx ON
    t_fin_email (
        t_fin_user_id_user
    ASC );

ALTER TABLE t_fin_email ADD CONSTRAINT t_fin_email_pk PRIMARY KEY ( id_email );

CREATE TABLE t_fin_log (
    id_log             VARCHAR2(18) NOT NULL,
    t_fin_user_id_user VARCHAR2(18) NOT NULL,
    dt_time            DATE NOT NULL
);

COMMENT ON COLUMN t_fin_log.dt_time IS
    'Data e hora do log';

ALTER TABLE t_fin_log ADD CONSTRAINT t_fin_log_pk PRIMARY KEY ( id_log );

CREATE TABLE t_fin_meta (
    id_meta             VARCHAR2(18) NOT NULL,
    t_fin_s_at_id_s_atu VARCHAR2(18),
    ds_meta             VARCHAR2(30),
    vl_meta             NUMBER(10, 2) NOT NULL,
    dt_inc              DATE NOT NULL,
    dt_fim              DATE NOT NULL,
    vl_guard            NUMBER(10, 2) NOT NULL
);

ALTER TABLE t_fin_meta ADD CONSTRAINT t_fin_meta_pk PRIMARY KEY ( id_meta );

CREATE TABLE t_fin_p_user (
    id_p_user VARCHAR2(18) NOT NULL,
    vl_plano  NUMBER(10, 2) NOT NULL,
    dt_vig    DATE NOT NULL
);

ALTER TABLE t_fin_p_user ADD CONSTRAINT t_fin_p_user_pk PRIMARY KEY ( id_p_user );

CREATE TABLE t_fin_plan (
    id_plan                VARCHAR2(18) NOT NULL,
    t_fin_user_id_user     VARCHAR2(18) NOT NULL,
    t_fin_p_user_id_p_user VARCHAR2(18) NOT NULL,
    tp_plan                VARCHAR2(30) NOT NULL,
    ds_plan                VARCHAR2(30) NOT NULL
);

ALTER TABLE t_fin_plan ADD CONSTRAINT t_fin_plan_pk PRIMARY KEY ( id_plan );

CREATE TABLE t_fin_rec (
    id_rec                 VARCHAR2(18) NOT NULL,
    t_fin_p_user_id_p_user VARCHAR2(18),
    t_fin_deb_id_deb       VARCHAR2(18) NOT NULL,
    dt_rec                 DATE NOT NULL,
    vl_rec                 NUMBER(10, 2) NOT NULL,
    ds_detal               VARCHAR2(30)
);

COMMENT ON COLUMN t_fin_rec.dt_rec IS
    'Data da transação';

COMMENT ON COLUMN t_fin_rec.vl_rec IS
    'Valor da entrada';

ALTER TABLE t_fin_rec ADD CONSTRAINT t_fin_rec_pk PRIMARY KEY ( id_rec );

CREATE TABLE t_fin_rec_s (
    id_s_rec            VARCHAR2(18) NOT NULL,
    t_fin_s_at_id_s_atu VARCHAR2(18) NOT NULL,
    vl_soma_r           NUMBER(10, 2) NOT NULL
);

CREATE UNIQUE INDEX t_fin_rec_s__idx ON
    t_fin_rec_s (
        t_fin_s_at_id_s_atu
    ASC );

ALTER TABLE t_fin_rec_s ADD CONSTRAINT t_fin_rec_s_pk PRIMARY KEY ( id_s_rec );

CREATE TABLE t_fin_s_at (
    id_s_atu             VARCHAR2(18) NOT NULL,
    t_fin_rec_s_id_s_rec VARCHAR2(18) NOT NULL,
    t_fin_deb_id_deb     VARCHAR2(18) NOT NULL,
    vl_s_atu             NUMBER(10, 2) NOT NULL
);

CREATE UNIQUE INDEX t_fin_s_at__idx ON
    t_fin_s_at (
        t_fin_rec_s_id_s_rec
    ASC );

CREATE UNIQUE INDEX t_fin_s_at__idxv1 ON
    t_fin_s_at (
        t_fin_deb_id_deb
    ASC );

ALTER TABLE t_fin_s_at ADD CONSTRAINT t_fin_s_at_pk PRIMARY KEY ( id_s_atu );

CREATE TABLE t_fin_s_deb (
    id_s_deb               VARCHAR2(18) NOT NULL,
    t_fin_p_user_id_p_user VARCHAR2(18),
    t_fin_rec_s_id_s_rec   VARCHAR2(18) NOT NULL,
    vl_s_deb               NUMBER(10, 2) NOT NULL
);

ALTER TABLE t_fin_s_deb ADD CONSTRAINT t_fin_s_deb_pk PRIMARY KEY ( id_s_deb );

CREATE TABLE t_fin_senha (
    id_senha           VARCHAR2(18) NOT NULL,
    t_fin_user_id_user VARCHAR2(18) NOT NULL,
    ds_senha           VARCHAR2(12) NOT NULL
);

CREATE UNIQUE INDEX t_fin_senha__idx ON
    t_fin_senha (
        t_fin_user_id_user
    ASC );

ALTER TABLE t_fin_senha ADD CONSTRAINT t_fin_senha_pk PRIMARY KEY ( id_senha );

CREATE TABLE t_fin_user (
    id_user              VARCHAR2(18) NOT NULL,
    t_fin_email_id_email VARCHAR2(18) NOT NULL,
    t_fin_senha_id_senha VARCHAR2(18) NOT NULL,
    nm_user              VARCHAR2(30) NOT NULL,
    nm_cpf               NUMBER(11) NOT NULL,
    dt_nasc              DATE
);

CREATE UNIQUE INDEX t_fin_user__idx ON
    t_fin_user (
        t_fin_email_id_email
    ASC );

CREATE UNIQUE INDEX t_fin_user__idxv1 ON
    t_fin_user (
        t_fin_senha_id_senha
    ASC );

ALTER TABLE t_fin_user ADD CONSTRAINT t_fin_user_pk PRIMARY KEY ( id_user );

CREATE TABLE t_fin_valp (
    id_valp            VARCHAR2(18) NOT NULL,
    t_fin_plan_id_plan VARCHAR2(18) NOT NULL,
    vl_plano           NUMBER(10, 2) NOT NULL,
    dt_vigencia        DATE NOT NULL
);

COMMENT ON COLUMN t_fin_valp.id_valp IS
    'Valor do plano';

ALTER TABLE t_fin_valp ADD CONSTRAINT t_fin_valp_pk PRIMARY KEY ( id_valp );

ALTER TABLE t_fin_code
    ADD CONSTRAINT t_fin_code_t_fin_email_fk FOREIGN KEY ( t_fin_email_id_email )
        REFERENCES t_fin_email ( id_email );

ALTER TABLE t_fin_deb
    ADD CONSTRAINT t_fin_deb_t_fin_s_at_fk FOREIGN KEY ( t_fin_s_at_id_s_atu )
        REFERENCES t_fin_s_at ( id_s_atu );

ALTER TABLE t_fin_email
    ADD CONSTRAINT t_fin_email_t_fin_user_fk FOREIGN KEY ( t_fin_user_id_user )
        REFERENCES t_fin_user ( id_user );

ALTER TABLE t_fin_log
    ADD CONSTRAINT t_fin_log_t_fin_user_fk FOREIGN KEY ( t_fin_user_id_user )
        REFERENCES t_fin_user ( id_user );

ALTER TABLE t_fin_meta
    ADD CONSTRAINT t_fin_meta_t_fin_s_at_fk FOREIGN KEY ( t_fin_s_at_id_s_atu )
        REFERENCES t_fin_s_at ( id_s_atu );

ALTER TABLE t_fin_plan
    ADD CONSTRAINT t_fin_plan_t_fin_p_user_fk FOREIGN KEY ( t_fin_p_user_id_p_user )
        REFERENCES t_fin_p_user ( id_p_user );

ALTER TABLE t_fin_plan
    ADD CONSTRAINT t_fin_plan_t_fin_user_fk FOREIGN KEY ( t_fin_user_id_user )
        REFERENCES t_fin_user ( id_user );

ALTER TABLE t_fin_rec_s
    ADD CONSTRAINT t_fin_rec_s_t_fin_s_at_fk FOREIGN KEY ( t_fin_s_at_id_s_atu )
        REFERENCES t_fin_s_at ( id_s_atu );

ALTER TABLE t_fin_rec
    ADD CONSTRAINT t_fin_rec_t_fin_deb_fk FOREIGN KEY ( t_fin_deb_id_deb )
        REFERENCES t_fin_deb ( id_deb );

ALTER TABLE t_fin_rec
    ADD CONSTRAINT t_fin_rec_t_fin_p_user_fk FOREIGN KEY ( t_fin_p_user_id_p_user )
        REFERENCES t_fin_p_user ( id_p_user );

ALTER TABLE t_fin_s_at
    ADD CONSTRAINT t_fin_s_at_t_fin_deb_fk FOREIGN KEY ( t_fin_deb_id_deb )
        REFERENCES t_fin_deb ( id_deb );

ALTER TABLE t_fin_s_at
    ADD CONSTRAINT t_fin_s_at_t_fin_rec_s_fk FOREIGN KEY ( t_fin_rec_s_id_s_rec )
        REFERENCES t_fin_rec_s ( id_s_rec );

ALTER TABLE t_fin_s_deb
    ADD CONSTRAINT t_fin_s_deb_t_fin_p_user_fk FOREIGN KEY ( t_fin_p_user_id_p_user )
        REFERENCES t_fin_p_user ( id_p_user );

ALTER TABLE t_fin_s_deb
    ADD CONSTRAINT t_fin_s_deb_t_fin_rec_s_fk FOREIGN KEY ( t_fin_rec_s_id_s_rec )
        REFERENCES t_fin_rec_s ( id_s_rec );

ALTER TABLE t_fin_senha
    ADD CONSTRAINT t_fin_senha_t_fin_user_fk FOREIGN KEY ( t_fin_user_id_user )
        REFERENCES t_fin_user ( id_user );

ALTER TABLE t_fin_user
    ADD CONSTRAINT t_fin_user_t_fin_email_fk FOREIGN KEY ( t_fin_email_id_email )
        REFERENCES t_fin_email ( id_email );

ALTER TABLE t_fin_user
    ADD CONSTRAINT t_fin_user_t_fin_senha_fk FOREIGN KEY ( t_fin_senha_id_senha )
        REFERENCES t_fin_senha ( id_senha );

ALTER TABLE t_fin_valp
    ADD CONSTRAINT t_fin_valp_t_fin_plan_fk FOREIGN KEY ( t_fin_plan_id_plan )
        REFERENCES t_fin_plan ( id_plan );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            14
-- CREATE INDEX                             8
-- ALTER TABLE                             32
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- TSDP POLICY                              0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
