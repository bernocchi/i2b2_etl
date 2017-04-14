INSERT INTO NIGHTHERONDATA.MODIFIER_DIMENSION
(
        MODIFIER_PATH,
        MODIFIER_CD,
        NAME_CHAR,
        MODIFIER_BLOB,
        UPDATE_DATE,
        DOWNLOAD_DATE,
        IMPORT_DATE,
        SOURCESYSTEM_CD,
        UPLOAD_ID
)
VALUES
(
        '\Reaction\',
        NULL,
        'Reaction',
        NULL,
        SYSDATE,
        NULL,
        SYSDATE,
        NULL,
        NULL
)
;


INSERT INTO NIGHTHERONDATA.MODIFIER_DIMENSION
(
        MODIFIER_PATH,
        MODIFIER_CD,
        NAME_CHAR,
        MODIFIER_BLOB,
        UPDATE_DATE,
        DOWNLOAD_DATE,
        IMPORT_DATE,
        SOURCESYSTEM_CD,
        UPLOAD_ID
)
VALUES
(
        '\Reaction\Not Documented\',
        'ALLERGEN:REACTION:ND',
        'Reaction Not Documented',
        NULL,
        SYSDATE,
        NULL,
        SYSDATE,
        NULL,
        NULL
)
;

INSERT INTO NIGHTHERONDATA.MODIFIER_DIMENSION
(
        MODIFIER_PATH,
        MODIFIER_CD,
        NAME_CHAR,
        MODIFIER_BLOB,
        UPDATE_DATE,
        DOWNLOAD_DATE,
        IMPORT_DATE,
        SOURCESYSTEM_CD,
        UPLOAD_ID
)
VALUES
(
        '\Reaction\Documented\',
        NULL,
        'Reaction List',
        NULL,
        SYSDATE,
        NULL,
        SYSDATE,
        NULL,
        NULL
)
;

CREATE OR REPLACE ETL.ALLERG_REACT_LIST AS
SELECT  NAME
FROM    CLARITY.ZC_REACTION B
UNION
SELECT  DISTINCT SVRTYLEVELCODE AS NAME
FROM    SUNRISE.CV3ALLERGYDECLSVRTYLEVELXREF@CLARITY_AT_EPIC.MI
ORDER BY NAME
;

DROP SEQUENCE ETL.ALLERGY_REACT_SEQ
;
CREATE SEQUENCE ETL.ALLERGY_REACT_SEQ
;

INSERT INTO NIGHTHERONDATA.MODIFIER_DIMENSION 
SELECT  '\Reaction\Documented\' || ETL.ALLERGY_REACT_SEQ.NEXTVAL AS MODIFIER_PATH,
        'ALLERGEN:REACTION:'    || ETL.ALLERGY_REACT_SEQ         AS MODIFIER_CD,
        NAME                                                     AS NAME_CHAR,
        NULL                                                     AS MODIFIER_BLOB,
        SYSDATE                                                  AS UPDATE_DATE,
        NULL                                                     AS DOWNLOAD_DATE,
        SYSDATE                                                  AS IMPORT_DATE,
        'UTHSCSA@UTHSCSA.edu'                                    AS SOURCESYSTEM_CD,
        NULL                                                     AS UPLOAD_ID
FROM    ETL.ALLERG_REACT_LIST
;
