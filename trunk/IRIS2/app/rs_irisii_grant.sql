-- Sample / Demonstration IRIS2 DQT and GBR Database Install Script
-- Ollie Cronk, AEA
-- Version 0.2 06/12/2010

-- DQT Database
CREATE database irisii_dqt_app;

GRANT
-- Only required for install: GRANT
CREATE, DROP, ALTER, INDEX,
-- Required at all times:
SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES, LOCK TABLES
ON irisii_dqt_app.*
TO irisii_dqt_user@localhost IDENTIFIED BY 'dqt-dqt<>';

-- GBR Database
CREATE database irisii_gbr_app;

GRANT
-- Only required for install:
CREATE, DROP, ALTER, INDEX, INSERT,
-- Required at all times (and for operation): GRANT
SELECT, CREATE TEMPORARY TABLES, LOCK TABLES

ON irisii_gbr_app.* TO irisii_gbr_user@localhost IDENTIFIED BY 'gbr-gbr><';

FLUSH PRIVILEGES;
