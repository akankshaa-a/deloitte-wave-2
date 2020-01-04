
--------------Instrument table----------------------
----------------------------------------------------
CREATE TABLE INSTRUMENT(INSTR_ID NUMBER(3) PRIMARY KEY,
						INSTR_NAME VARCHAR2(25),
						KEY VARCHAR2(25),
						COST_PER_SESSION  NUMBER(8,2));

----------------Musician table----------------------
----------------------------------------------------
CREATE TABLE MUSICIAN(SSN VARCHAR2(25) PRIMARY KEY,
					  FIRST_NAME VARCHAR2(25),
					  LAST_NAME VARCHAR2(25),
					  PHONE NUMBER(10),
					  EMAIL_ID VARCHAR2(30),
					  ADDRESS_LINE1 VARCHAR2(100),
					  ADDRESS_LINE2 VARCHAR2(100),
					  PIN NUMBER(8),
					  CITY VARCHAR2(30),
					  STATE VARCHAR2(30));

--------------Album table--------------------------
----------------------------------------------------
CREATE TABLE ALBUM(ALBUM_ID NUMBER(8) PRIMARY KEY,
				   A_TITLE VARCHAR2(50),
				   A_CR_DATE DATE,
				   A_FORMAT VARCHAR2(10),
				   GENRE VARCHAR2(25),
				   PRODUCER VARCHAR2(25),
				   FOREIGN KEY (PRODUCER) REFERENCES MUSICIAN(SSN)
				   );

--------------Song table----------------------------
----------------------------------------------------
CREATE TABLE SONG(SONG_ID NUMBER(8) PRIMARY KEY,
				  TITLE VARCHAR2(50),
				  AUTHOR VARCHAR2(50),
				  ALBUM_ID NUMBER(8),
				  FOREIGN KEY (ALBUM_ID) REFERENCES ALBUM(ALBUM_ID)
				  ); 

--------------Studio table--------------------------
----------------------------------------------------
CREATE TABLE STUDIO(STUDIO_ID NUMBER(8) PRIMARY KEY,
					ROOM_TYPE VARCHAR2(25),
					COST NUMBER(8,2),
                    CITY VARCHAR2(25)
					);

--------------Studio Slots table--------------------------
----------------------------------------------------
CREATE TABLE SLOTS(SLOT_ID VARCHAR2(25) PRIMARY KEY,
				   FROM_TIME VARCHAR2(25),
				   TO_TIME VARCHAR2(25));

--------------Booking table--------------------------
----------------------------------------------------
CREATE TABLE BOOKING(BOOKING_ID NUMBER(8) PRIMARY KEY,
					 STUDIO_ID NUMBER(8),
					 SLOT_ID VARCHAR2(25),
					 MUSICIAN_ID VARCHAR2(25),
					 BOOKING_DATE DATE,
					 COST NUMBER,
					 FOREIGN KEY (STUDIO_ID) REFERENCES STUDIO(STUDIO_ID),
					 FOREIGN KEY (SLOT_ID) REFERENCES SLOTS(SLOT_ID),
					 FOREIGN KEY (MUSICIAN_ID) REFERENCES MUSICIAN(SSN));



--------------BRIDGE Table - Musician plays Instrument--------------------------
--------------------------------------------------------------------------------
CREATE TABLE MUSICIAN_INSTRUMENT(MUSICIAN_ID VARCHAR2(25),
								 INSTR_ID NUMBER(3),
								 FOREIGN KEY (MUSICIAN_ID) REFERENCES MUSICIAN(SSN),
								 FOREIGN KEY (INSTR_ID) REFERENCES INSTRUMENT(INSTR_ID));


--------------BRIDGE Table - Musician composes Song-----------------------------
--------------------------------------------------------------------------------
CREATE TABLE MUSICIAN_SONGS(MUSICIAN_ID VARCHAR2(25),
							SONG_ID NUMBER(8),
							FOREIGN KEY (MUSICIAN_ID) REFERENCES MUSICIAN(SSN),
							FOREIGN KEY (SONG_ID) REFERENCES SONG(SONG_ID));

