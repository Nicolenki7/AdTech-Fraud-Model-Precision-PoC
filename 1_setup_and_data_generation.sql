-- 1. ROBUST SETUP ()
USE ROLE SYSADMIN;

-- Create the Warehouse if it doesn't exist
CREATE WAREHOUSE IF NOT EXISTS FRAUD_ANALYSIS_WH 
    WAREHOUSE_SIZE = 'XSMALL' 
    AUTO_SUSPEND = 60 
    AUTO_RESUME = TRUE;

-- Create the Database if it doesn't exist
CREATE DATABASE IF NOT EXISTS FRAUD_DETECTION_DB;

-- Set the context to the Database
USE DATABASE FRAUD_DETECTION_DB;

-- Create the Schema if it doesn't exist
CREATE SCHEMA IF NOT EXISTS RAW_LOGS;

-- Set the context to the Schema
USE SCHEMA RAW_LOGS;

-- 2. CREATE TABLE WITH "GROUND TRUTH"
CREATE OR REPLACE TABLE TRAFFIC_EVALUATION (
    IP_ADDRESS VARCHAR,
    TOTAL_CLICKS INT,
    IS_ACTUALLY_BOT BOOLEAN, 
    USER_TYPE VARCHAR
);

-- 3. INSERT DATA
INSERT INTO TRAFFIC_EVALUATION (IP_ADDRESS, TOTAL_CLICKS, IS_ACTUALLY_BOT, USER_TYPE)
VALUES
    ('10.1.1.1', 150, TRUE, 'Script_Bot'),
    ('10.1.1.2', 200, TRUE, 'Script_Bot'),
    ('10.1.1.3', 80, TRUE, 'Script_Bot'),
    ('10.1.1.4', 95, TRUE, 'Script_Bot'),
    ('192.168.1.1', 5, FALSE, 'Normal_User'),
    ('192.168.1.2', 12, FALSE, 'Normal_User'),
    ('192.168.1.3', 25, FALSE, 'Normal_User'),
    ('192.168.1.4', 8, FALSE, 'Normal_User'),
    ('172.16.0.1', 55, FALSE, 'Gamer_User'),
    ('172.16.0.2', 62, FALSE, 'Heavy_Shopper'),
    ('172.16.0.3', 51, FALSE, 'Family_Shared_IP'),
    ('10.9.9.1', 45, TRUE, 'Low_and_Slow_Bot'),
    ('10.9.9.2', 48, TRUE, 'Mimic_Bot'),
    ('10.9.9.3', 49, TRUE, 'AI_Crawler');

-- VERIFY
SELECT * FROM TRAFFIC_EVALUATION;
