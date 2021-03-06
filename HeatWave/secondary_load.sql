-- Copyright (c) 2020, Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/

   -- tpch reset comments
   alter table NATION secondary_engine NULL;
   alter table REGION secondary_engine NULL;
   alter table LINEITEM secondary_engine NULL;
   alter table SUPPLIER secondary_engine NULL;
   alter table ORDERS secondary_engine NULL;
   alter table CUSTOMER secondary_engine NULL;
   alter table PART secondary_engine NULL;
   alter table PARTSUPP secondary_engine NULL;

   -- optimal encodings
   alter table NATION change N_NAME N_NAME CHAR(25) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=SORTED';
   alter table NATION change N_COMMENT N_COMMENT VARCHAR(152) COMMENT 'RAPID_COLUMN=ENCODING=SORTED';
   alter table REGION change R_NAME R_NAME CHAR(25) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=SORTED';
   alter table REGION change R_COMMENT R_COMMENT VARCHAR(152) COMMENT 'RAPID_COLUMN=ENCODING=SORTED';
   alter table PART change P_NAME P_NAME VARCHAR(55) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=SORTED';
   alter table PART change P_MFGR P_MFGR CHAR(25) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=SORTED';
   alter table PART change P_BRAND P_BRAND CHAR(10) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=SORTED';
   alter table PART change P_TYPE P_TYPE VARCHAR(25) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=SORTED';
   alter table PART change P_CONTAINER P_CONTAINER CHAR(10) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=SORTED';
   alter table PART change P_COMMENT P_COMMENT VARCHAR(23) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=SORTED';
   alter table SUPPLIER change S_NAME S_NAME CHAR(25) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=SORTED';
   alter table SUPPLIER change S_ADDRESS S_ADDRESS VARCHAR(40) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=SORTED';
   alter table SUPPLIER change S_PHONE S_PHONE CHAR(15) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=SORTED';
   alter table SUPPLIER change S_COMMENT S_COMMENT VARCHAR(101) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=SORTED';
   alter table PARTSUPP change PS_COMMENT PS_COMMENT VARCHAR(199) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=SORTED';
   alter table CUSTOMER change C_NAME C_NAME VARCHAR(25) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=SORTED';
   alter table CUSTOMER change C_ADDRESS C_ADDRESS VARCHAR(40) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=SORTED';
   alter table CUSTOMER change C_PHONE C_PHONE CHAR(15) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=SORTED';
   alter table CUSTOMER change C_MKTSEGMENT C_MKTSEGMENT CHAR(10) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=SORTED';
   alter table CUSTOMER change C_COMMENT C_COMMENT VARCHAR(117) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=SORTED';
   alter table ORDERS change O_ORDERSTATUS O_ORDERSTATUS CHAR(1) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=SORTED';
   alter table ORDERS change O_ORDERPRIORITY O_ORDERPRIORITY CHAR(15) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=SORTED';
   alter table ORDERS change O_CLERK O_CLERK CHAR(15) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=SORTED';
   alter table ORDERS change O_COMMENT O_COMMENT VARCHAR(79) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=SORTED';
   alter table LINEITEM change L_RETURNFLAG L_RETURNFLAG CHAR(1) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=SORTED';
   alter table LINEITEM change L_LINESTATUS L_LINESTATUS CHAR(1) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=SORTED';
   alter table LINEITEM change L_SHIPINSTRUCT L_SHIPINSTRUCT CHAR(25) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=SORTED';
   alter table LINEITEM change L_COMMENT L_COMMENT VARCHAR(44) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=SORTED';
   alter table LINEITEM change L_SHIPMODE L_SHIPMODE CHAR(10) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=SORTED';
 
   alter table CUSTOMER change C_PHONE C_PHONE CHAR(15) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=VARLEN';
   alter table ORDERS change O_COMMENT O_COMMENT VARCHAR(79) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=VARLEN';
   alter table PART change P_NAME P_NAME VARCHAR(55) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=VARLEN';
   alter table PART change P_TYPE P_TYPE VARCHAR(25) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=VARLEN';
   alter table SUPPLIER change S_COMMENT S_COMMENT VARCHAR(101) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=VARLEN';

   -- optimal data placement
   alter table LINEITEM change L_ORDERKEY L_ORDERKEY BIGINT NOT NULL COMMENT 'RAPID_COLUMN=DATA_PLACEMENT_KEY=1';

   -- mark tables for RAPID
   alter table NATION secondary_engine RAPID;
   alter table REGION secondary_engine RAPID;
   alter table LINEITEM secondary_engine RAPID;
   alter table SUPPLIER secondary_engine RAPID;
   alter table ORDERS secondary_engine RAPID;
   alter table CUSTOMER secondary_engine RAPID;
   alter table PART secondary_engine RAPID;
   alter table PARTSUPP secondary_engine RAPID;

-- Secondary Load
-- Set Parallel reads threads to 32
set innodb_parallel_read_threads=32;
ALTER TABLE LINEITEM SECONDARY_LOAD;
ALTER TABLE ORDERS SECONDARY_LOAD;
ALTER TABLE CUSTOMER SECONDARY_LOAD;
ALTER TABLE SUPPLIER SECONDARY_LOAD;
ALTER TABLE NATION SECONDARY_LOAD;
ALTER TABLE REGION SECONDARY_LOAD;
ALTER TABLE PART SECONDARY_LOAD;
ALTER TABLE PARTSUPP SECONDARY_LOAD;
