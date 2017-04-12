INSERT INTO BERNOCCHI.HERON_TERMS -- BLUEHERONMETADATA.HERON_TERMS
SELECT  
        1,
        '\i2b2\Allergy\' AS C_FULLNAME,
        'Allergy'       AS C_NAME,
        'N'             AS C_SYNONYM_CD,
        'FA'            AS C_VISUALATTRIBUTES,
        NULL            AS C_TOTALNUM,
        NULL            AS C_BASECODE,
        NULL            AS C_METADATAXML,
        'CONCEPT_CD'    AS C_FACTTABLECOLUMN,
        'CONCEPT_DIMENSION' AS  C_TABLENAME,
        'CONCEPT_PATH'  AS C_COLUMNNAME,
        'T'             AS C_COLUMNDATATYPE,
        'LIKE'          AS C_OPERATOR,  
        '\i2b2\Allergy\' AS C_DIMCODE,
        NULL            AS C_COMMENT,
        'Allergy'       AS C_TOOLTIP,
        '@'             AS M_APPLIED_PATH,
        SYSDATE         AS UPDATE_DATE,
        NULL            AS DOWNLOAD_DATE,
        SYSDATE         AS IMPORT_DATE,
        'UTHSCSA@UTHSCSA.com' AS SOURCESYSTEM_CD,
        NULL            AS VALUETYPE_CD,
        NULL            AS M_EXCLUSION_CD,
        NULL            AS C_PATH,
        NULL            AS C_SYMBOL
FROM DUAL;


INSERT INTO BERNOCCHI.HERON_TERMS -- BLUEHERONMETADATA.HERON_TERMS
SELECT DISTINCT 
        2,
        '\i2b2\Allergy\' || CLASS AS C_FULLNAME,
        SUBSTR(CLASS,1,1) || LOWER(SUBSTR(CLASS,2)) AS C_NAME,
        'N'             AS C_SYNONYM_CD,
        'FA'            AS C_VISUALATTRIBUTES,
        NULL            AS C_TOTALNUM,
        NULL            AS C_BASECODE,
        NULL            AS C_METADATAXML,
        'CONCEPT_CD'    AS C_FACTTABLECOLUMN,
        'CONCEPT_DIMENSION' AS  C_TABLENAME,
        'CONCEPT_PATH'  AS C_COLUMNNAME,
        'T'             AS C_COLUMNDATATYPE,
        'LIKE'          AS C_OPERATOR,  
        '\i2b2\Allergy\' || CLASS AS C_DIMCODE,
        NULL            AS C_COMMENT,
        'Allergy'       AS C_TOOLTIP,
        '@'             AS M_APPLIED_PATH,
        SYSDATE         AS UPDATE_DATE,
        NULL            AS DOWNLOAD_DATE,
        SYSDATE         AS IMPORT_DATE,
        'UTHSCSA@UTHSCSA.com' AS SOURCESYSTEM_CD,
        NULL            AS VALUETYPE_CD,
        NULL            AS M_EXCLUSION_CD,
        NULL            AS C_PATH,
        NULL            AS C_SYMBOL
FROM    ETL.ALLERGY_MAPPING
ORDER BY '\i2b2\Allergy\' || CLASS;




INSERT INTO BERNOCCHI.HERON_TERMS -- BLUEHERONMETADATA.HERON_TERMS
SELECT  3,
        '\i2b2\Allergy\' || CLASS || '\' || NAME AS C_FULLNAME,
        SUBSTR(NAME,1,1) || LOWER(SUBSTR(NAME,2)) AS C_NAME,
        'N'             AS C_SYNONYM_CD,
        'FA'            AS C_VISUALATTRIBUTES,
        NULL            AS C_TOTALNUM,
        CONCEPT_CD      AS C_BASECODE,
        NULL            AS C_METADATAXML,
        'CONCEPT_CD'    AS C_FACTTABLECOLUMN,
        'CONCEPT_DIMENSION' AS  C_TABLENAME,
        'CONCEPT_PATH'  AS C_COLUMNNAME,
        'T'             AS C_COLUMNDATATYPE,
        'LIKE'          AS C_OPERATOR,  
        '\i2b2\Allergy\' || CLASS || '\' || NAME AS C_DIMCODE,
        NULL            AS C_COMMENT,
        'Allergy\' || CLASS || '\' || NAME || ' - ' || CONCEPT_CD AS C_TOOLTIP,
        '@'             AS M_APPLIED_PATH,
        SYSDATE         AS UPDATE_DATE,
        NULL            AS DOWNLOAD_DATE,
        SYSDATE         AS IMPORT_DATE,
        'UTHSCSA@UTHSCSA.com' AS SOURCESYSTEM_CD,
        NULL            AS VALUETYPE_CD,
        NULL            AS M_EXCLUSION_CD,
        NULL            AS C_PATH,
        NULL            AS C_SYMBOL
FROM    ETL.ALLERGY_MAPPING
WHERE   CLASS NOT IN ('DRUG', 'DRUG INGREDIENT')
ORDER BY '\i2b2\Allergy\' || CLASS || '\' || NAME
;


INSERT INTO BERNOCCHI.HERON_TERMS -- BLUEHERONMETADATA.HERON_TERMS
SELECT  DISTINCT
        3,
        '\i2b2\Allergy\' || CLASS || '\' || SUBSTR(NAME,1,1) AS C_FULLNAME,
         SUBSTR(NAME,1,1) AS C_NAME,
        'N'             AS C_SYNONYM_CD,
        'FA'            AS C_VISUALATTRIBUTES,
        NULL            AS C_TOTALNUM,
        NULL            AS C_BASECODE,
        NULL            AS C_METADATAXML,
        'CONCEPT_CD'    AS C_FACTTABLECOLUMN,
        'CONCEPT_DIMENSION' AS  C_TABLENAME,
        'CONCEPT_PATH'  AS C_COLUMNNAME,
        'T'             AS C_COLUMNDATATYPE,
        'LIKE'          AS C_OPERATOR,  
        '\i2b2\Allergy\' || CLASS || '\' ||SUBSTR(NAME,1,1) AS C_DIMCODE,
        NULL            AS C_COMMENT,
        'Allergy\' || CLASS || '\' ||SUBSTR(NAME,1,1)       AS C_TOOLTIP,
        '@'             AS M_APPLIED_PATH,
        SYSDATE         AS UPDATE_DATE,
        NULL            AS DOWNLOAD_DATE,
        SYSDATE         AS IMPORT_DATE,
        'UTHSCSA@UTHSCSA.com' AS SOURCESYSTEM_CD,
        NULL            AS VALUETYPE_CD,
        NULL            AS M_EXCLUSION_CD,
        NULL            AS C_PATH,
        NULL            AS C_SYMBOL
FROM    ETL.ALLERGY_MAPPING
WHERE   CLASS IN ('DRUG', 'DRUG INGREDIENT')
AND     SUBSTR(NAME,1,1) NOT IN (',','`','~','!','@','#','$','%','^','&','*','(',')','-','_','=','+','\','"',';',':',',','<','.','>')
ORDER BY '\i2b2\Allergy\' || CLASS || '\' || SUBSTR(NAME,1,1)
;




INSERT INTO BERNOCCHI.HERON_TERMS -- BLUEHERONMETADATA.HERON_TERMS
SELECT  DISTINCT
        4,
        '\i2b2\Allergy\' || CLASS || '\' || SUBSTR(NAME,1,1) || '\' || NAME AS C_FULLNAME,
         SUBSTR(NAME,1,1) || LOWER(SUBSTR(NAME,2)) AS C_NAME,
        'N'             AS C_SYNONYM_CD,
        'FA'            AS C_VISUALATTRIBUTES,
        NULL            AS C_TOTALNUM,
        CONCEPT_CD      AS C_BASECODE,
        NULL            AS C_METADATAXML,
        'CONCEPT_CD'    AS C_FACTTABLECOLUMN,
        'CONCEPT_DIMENSION' AS  C_TABLENAME,
        'CONCEPT_PATH'  AS C_COLUMNNAME,
        'T'             AS C_COLUMNDATATYPE,
        'LIKE'          AS C_OPERATOR,  
        '\i2b2\Allergy\' || CLASS || '\' ||SUBSTR(NAME,1,1) || '\' || NAME  AS C_DIMCODE,
        NULL            AS C_COMMENT,
        'Allergy\' || CLASS || '\' ||SUBSTR(NAME,1,1) || '\' || NAME || ' - ' || CONCEPT_CD AS C_TOOLTIP,
        '@'             AS M_APPLIED_PATH,
        SYSDATE         AS UPDATE_DATE,
        NULL            AS DOWNLOAD_DATE,
        SYSDATE         AS IMPORT_DATE,
        'UTHSCSA@UTHSCSA.com' AS SOURCESYSTEM_CD,
        NULL            AS VALUETYPE_CD,
        NULL            AS M_EXCLUSION_CD,
        NULL            AS C_PATH,
        NULL            AS C_SYMBOL
FROM    ETL.ALLERGY_MAPPING
WHERE   CLASS IN ('DRUG', 'DRUG INGREDIENT')
-- There are some names with just punctuation characters
AND     SUBSTR(NAME,1,1) NOT IN (',','`','~','!','@','#','$','%','^','&','*','(',')','-','_','=','+','\','"',';',':',',','<','.','>')
ORDER BY '\i2b2\Allergy\' || CLASS || '\' || SUBSTR(NAME,1,1) || '\' || NAME
