-- PART 1: Identifying the Environmental, Lifestyle and Demographic Factors Associated with Skin Cancer

SELECT * from table1;
SELECT * from table2;

-- Joining patient demographic records with lesion-level diagnostic data 
SELECT table1.age,
table1.gender,
table1.skin_cancer_history,
table2.diagnostic,
table2.lesion_id
FROM table1
INNER JOIN table2 ON table1.patient_id = table2.patient_id;

-- Lifestyle Factors
SELECT table1.smoke,
table1.drink,
table2.diagnostic,
table2.lesion_id
FROM table1
INNER JOIN table2 ON table1.patient_id = table2.patient_id;


-- Environmental Factors
SELECT table1.pesticide,
table1.has_piped_water,
table1.has_sewage_system,
table2.diagnostic,
table2.lesion_id
FROM table1
INNER JOIN table2 ON table1.patient_id = table2.patient_id;


-- Demographics summary by diagnosis
SELECT
  t2.diagnostic,
  t1.gender,
  COUNT(*) AS n_records
FROM table1 t1
JOIN table2 t2 ON t1.patient_id = t2.patient_id
GROUP BY t2.diagnostic, t1.gender
ORDER BY t2.diagnostic, n_records DESC;


-- Lifestyle summary by diagnosis
SELECT
  t2.diagnostic,
  t1.smoke,
  t1.drink,
  COUNT(*) AS n_records,
  ROUND(
    100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY t2.diagnostic),
    2
  ) AS pct_within_diagnosis
FROM table1 t1
JOIN table2 t2 
ON t1.patient_id = t2.patient_id
GROUP BY t2.diagnostic, t1.smoke, t1.drink
ORDER BY t2.diagnostic, n_records DESC;


-- Environmental summary by diagnosis
SELECT
  t2.diagnostic,
  t1.pesticide,
  t1.has_piped_water,
  t1.has_sewage_system,
  COUNT(*) AS n_records
FROM table1 t1
JOIN table2 t2 ON t1.patient_id = t2.patient_id
GROUP BY
  t2.diagnostic,
  t1.pesticide,
  t1.has_piped_water,
  t1.has_sewage_system
ORDER BY t2.diagnostic, n_records DESC;


SELECT diagnostic, COUNT(*) AS n_records
FROM table2
GROUP BY diagnostic
ORDER BY n_records DESC;


SELECT DISTINCT diagnostic from table2


-- Relationship Between Gender and Cancer Diagnosis
SELECT 
    table1.gender,
    table2.diagnostic,
    COUNT(*) AS case_count
FROM table1
INNER JOIN table2 
    ON table1.patient_id = table2.patient_id
GROUP BY table1.gender, table2.diagnostic
ORDER BY case_count DESC;
-- We observe that there are more cases of Melanoma in female than Males


-- Relastionship between Smoking and Cancer Diagnosis
SELECT 
    table1.smoke,
	table1.drink,
    table2.diagnostic,
    COUNT(*) AS case_count
FROM table1
INNER JOIN table2 
    ON table1.patient_id = table2.patient_id
GROUP BY table1.smoke, table1.drink, table2.diagnostic
ORDER BY case_count DESC;
-- No clear pattern observed between smoking and skin cancer lesions in this dataset output


-- Relationshp between Piped water and Skin Cancer Diagnosis
SELECT 
    table1.has_piped_water,
    table2.diagnostic,
    COUNT(*) AS case_count
FROM table1
INNER JOIN table2 
    ON table1.patient_id = table2.patient_id
GROUP BY table1.has_piped_water, table2.diagnostic
ORDER BY case_count DESC;
-- No clear pattern observed between piped water and skin cancer lesions in this dataset output


-- Relationship between Sewage System and Skin Cancer Diagnosis
SELECT 
    table1.has_sewage_system,
    table2.diagnostic,
    COUNT(*) AS case_count
FROM table1
INNER JOIN table2 
    ON table1.patient_id = table2.patient_id
GROUP BY table1.has_sewage_system, table2.diagnostic
ORDER BY case_count DESC;
-- No clear pattern observed between sewage systems and skin cancer lesions in this dataset output


-- Relationship between Pesticide Exposure and Skin Cancer Diagnosis
SELECT 
    table1.pesticide,
    table2.diagnostic,
    COUNT(*) AS case_count
FROM table1
INNER JOIN table2 
    ON table1.patient_id = table2.patient_id
GROUP BY table1.pesticide, table2.diagnostic
ORDER BY case_count DESC;
-- No clear pattern observed between pesticides and skin cancer lesions in this dataset output



-- Grouping The Age Groups Into Bins to Ensure Better Analysis
SELECT DISTINCT diagnostic FROM table2;

SELECT age FROM table1;
SELECT MAX(age) AS max_age FROM table1;
SELECT MIN(age) AS min_age FROM table1;
-- Minimum age is 6
-- Maximum age is 94

SELECT * FROM table2;

-- 6 years to 18 years = Teenagers 
-- 19 years to 40 years = Adults
-- 41 years to 60 years = Old Adults 
-- 61 Years and above = Aged 
-- Relatiosnhip Between the Frequency of Skin Cancer in Different Age Groups
SELECT
    CASE 
        WHEN table1.age < 18 then 'Teenagers' 
        WHEN table1.age between 18 and 40 then 'Adults'
        WHEN table1.age between 41 and 60 then 'Old_Adults'
        WHEN table1.age between 61 and 94 then 'Aged' 
    END AS age_group,
    table2.diagnostic,
    COUNT(*) AS case_count
FROM table1
INNER JOIN table2
    ON table1.patient_id = table2.patient_id
GROUP BY age_group, table2.diagnostic
ORDER BY age_group, case_count DESC;
-- Aged has cases of Melanoma
-- Old Adults also has cases of Melanoma
-- Teenagers have no cases of Melanoma 
-- We observe that individuals from age 41 and above have more cases of Melanoma compared to Teenagers and Adults frm age 6-40



-- Cancer Types               Risk Level
-- NEV- Nevus (Mole)- Benign - Very Low
-- SEK - Seborrheic Keratosis - Benign - Very Low 
-- ACK - Actinic Keratosis - Precancerous - Low to Moderate
-- BCC - Basal Cell Carcinoma - Cancer - Low
-- SCC - Squamous Cell Carcinoma - Cancer - Moderate
-- MEL - Melanoma - Cancer - High

-- Grouping the Skin Cancer Diagnosis by Levels of Severiy
SELECT
    CASE 
        WHEN table2.diagnostic = 'NEV' then 'Benign' 
        WHEN table2.diagnostic = 'SEK' then 'Benign'
        WHEN table2.diagnostic = 'ACK' then 'Moderately Severe'
		WHEN table2.diagnostic = 'BCC' then 'Moderately Severe'
		WHEN table2.diagnostic = 'SCC' then 'Moderately Severe'
		WHEN table2.diagnostic = 'MEL' then 'Severe' 
    END AS Cancer_Severity,
    table1.gender,
    COUNT(*) AS case_count
FROM table1
INNER JOIN table2
    ON table1.patient_id = table2.patient_id
GROUP BY Cancer_Severity, table1.gender
ORDER BY Cancer_Severity, case_count DESC;


-- Relationship between smoking and skin cancer using the Level of Severity
SELECT
    CASE 
        WHEN table2.diagnostic = 'NEV' then 'Benign' 
        WHEN table2.diagnostic = 'SEK' then 'Benign'
        WHEN table2.diagnostic = 'ACK' then 'Moderately Severe'
		WHEN table2.diagnostic = 'BCC' then 'Moderately Severe'
		WHEN table2.diagnostic = 'SCC' then 'Moderately Severe'
		WHEN table2.diagnostic = 'MEL' then 'Severe' 
    END AS Cancer_Severity,
    table1.smoke,
    COUNT(*) AS case_count
FROM table1
INNER JOIN table2
    ON table1.patient_id = table2.patient_id
GROUP BY Cancer_Severity, table1.smoke
ORDER BY Cancer_Severity, case_count DESC;



-- Relationship betweeen Age and Skin Cancer using the Level of Severity
SELECT
    CASE 
        WHEN table2.diagnostic = 'NEV' then 'Benign' 
        WHEN table2.diagnostic = 'SEK' then 'Benign'
        WHEN table2.diagnostic = 'ACK' then 'Moderately Severe'
		WHEN table2.diagnostic = 'BCC' then 'Moderately Severe'
		WHEN table2.diagnostic = 'SCC' then 'Moderately Severe'
		WHEN table2.diagnostic = 'MEL' then 'Severe' 
    END AS Cancer_Severity,
    table1.age,  
  COUNT(*) AS case_count
FROM table1
INNER JOIN table2
    ON table1.patient_id = table2.patient_id
GROUP BY Cancer_Severity, table1.age
ORDER BY Cancer_Severity, case_count DESC;



-- PART 2: Identifying Skin Cancer Lesions

SELECT * FROM table2


-- Identifying Skin Cancer Lesions by Itch, Grew, Hurt, Bleed, Elevatio and Biopsy
SELECT
    CASE
        WHEN diagnostic IN ('NEV','SEK') THEN 'Benign'
        WHEN diagnostic IN ('ACK','BCC','SCC') THEN 'Moderately Severe'
        WHEN diagnostic = 'MEL' THEN 'Severe'
    END AS Cancer_Severity,
table2.itch,
table2.grew,
table2.hurt,
table2.bleed,
table2.elevation,
table2.biopsed,
  COUNT(*) AS case_count
FROM table1
INNER JOIN table2
    ON table1.patient_id = table2.patient_id
GROUP BY Cancer_Severity, table2.itch, table2.grew,table2.hurt, table2.bleed, table2.elevation, table2.biopsed
ORDER BY Cancer_Severity, table2.itch, table2.grew,table2.hurt, table2.bleed, table2.elevation, table2.biopsed, case_count DESC;
-- We observed that for severe cancer cases, the biopsy always turned out to be true
-- Severe cancer cases did not hurt or bleed
-- Most Benign skin cancer lesions had an elevation and in some cases could result in itching
-- Moderately severe skin cancer lesions had cases of 'true' with the biopsy as well as elevations, itching and bleeding. 

-- Identifying Skin Cancer Lesions by Diameter

SELECT
    CASE
        WHEN diagnostic IN ('NEV','SEK') THEN 'Benign'
        WHEN diagnostic IN ('ACK','BCC','SCC') THEN 'Moderately Severe'
        WHEN diagnostic = 'MEL' THEN 'Severe'
    END AS Cancer_Severity,
table2.diameter_1,
table2.diameter_2,
  COUNT(*) AS case_count
FROM table1
INNER JOIN table2
    ON table1.patient_id = table2.patient_id
GROUP BY Cancer_Severity, table2.diameter_1, table2.diameter_2
ORDER BY Cancer_Severity, table2.diameter_1, table2.diameter_2, case_count DESC;
-- Benign Skin Lesions had a diameter between 0-20mm
-- Cancerous Skin Lesions had a diameter of 20mm and above

SELECT
    CASE
        WHEN diagnostic IN ('NEV','SEK') THEN 'Benign'
        WHEN diagnostic IN ('ACK','BCC','SCC') THEN 'Moderately Severe'
        WHEN diagnostic = 'MEL' THEN 'Severe'
    END AS severity,
    COUNT(*) FILTER (WHERE itch = true) AS itchy_count,
    COUNT(*) FILTER (WHERE grew = true) AS grew_count,
    COUNT(*) FILTER (WHERE bleed = true) AS bleed_count,
    COUNT(*) FILTER (WHERE biopsed = true) AS biopsied_count
FROM table2
GROUP BY severity;
-- We obseved that there are more Moderately Severe Cancer cases that Benign and Severe Cases