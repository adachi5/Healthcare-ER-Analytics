-- ==========================================================
-- Healthcare Emergency Room Analytics Project
-- Author: Adachi Iwobi
-- Database: healthcare_sql_project
-- Table: emergency_room_visits
-- ==========================================================


-- ==========================================================
-- DATA QUALITY CHECKS
-- ==========================================================

-- Preview the data
SELECT *
FROM emergency_room_visits
LIMIT 10;

-- Check for missing patient ages
SELECT *
FROM emergency_room_visits
WHERE patient_age IS NULL;

-- Check for invalid patient ages
SELECT *
FROM emergency_room_visits
WHERE patient_age < 0;

-- Check for negative wait times
SELECT *
FROM emergency_room_visits
WHERE patient_waittime < 0;

-- Review gender categories
SELECT
    patient_gender,
    COUNT(*) AS total_patients
FROM emergency_room_visits
GROUP BY patient_gender
ORDER BY total_patients DESC;


-- ==========================================================
-- BUSINESS ANALYSIS
-- ==========================================================

-- Total emergency room visits
SELECT
    COUNT(patient_id) AS total_visits
FROM emergency_room_visits;

-- Patients by referral department
SELECT
    department_referral,
    COUNT(patient_id) AS total_patients
FROM emergency_room_visits
GROUP BY department_referral
ORDER BY total_patients DESC;

-- Average wait time by referral department
SELECT
    department_referral,
    ROUND(AVG(patient_waittime),1) AS average_wait_time
FROM emergency_room_visits
GROUP BY department_referral
ORDER BY average_wait_time DESC;

-- Average wait time by gender
SELECT
    patient_gender,
    ROUND(AVG(patient_waittime),1) AS average_wait_time
FROM emergency_room_visits
GROUP BY patient_gender
ORDER BY average_wait_time DESC;

-- Average patient satisfaction by race
SELECT
    patient_race,
    ROUND(AVG(patient_satisfaction_score),2) AS average_satisfaction
FROM emergency_room_visits
GROUP BY patient_race
ORDER BY average_satisfaction DESC;

-- Patient admissions
SELECT
    patient_admission_flag,
    COUNT(patient_id) AS total_admissions
FROM emergency_room_visits
GROUP BY patient_admission_flag
ORDER BY total_admissions DESC;

-- Average wait time by admission status
SELECT
    patient_admission_flag,
    ROUND(AVG(patient_waittime),1) AS average_wait_time
FROM emergency_room_visits
GROUP BY patient_admission_flag
ORDER BY average_wait_time DESC;

-- Emergency room visits by admission date
-- (Tableau groups this field by Month)
SELECT
    patient_admission_date,
    COUNT(patient_id) AS total_visits
FROM emergency_room_visits
GROUP BY patient_admission_date
ORDER BY patient_admission_date;
