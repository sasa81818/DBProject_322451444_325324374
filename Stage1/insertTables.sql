--insert to Person:

insert into Person (Person_ID, First_Name, Last_Name, Birth_Date, City, Street, House_Number, Email, Main_Phone) 
values (873456655, 'Cello', 'Cruttenden', to_date('05-04-1965', 'dd-mm-yyyy'), 'Vale de Açores', 'Evergreen', '39', 'ccruttenden0@phoca.cz', 3846050636);

insert into Person (Person_ID, First_Name, Last_Name, Birth_Date, City, Street, House_Number, Email, Main_Phone) 
values (489630756, 'Cyndia', 'Whayman', to_date('23-05-2002', 'dd-mm-yyyy'), 'Daxi', 'Delaware', '1432', 'cwhayman1@desdev.cn', 3504939693);

insert into Person (Person_ID, First_Name, Last_Name, Birth_Date, City, Street, House_Number, Email, Main_Phone) 
values (743881786, 'Netta', 'Vasichev', to_date('28-03-1956', 'dd-mm-yyyy'), 'Semenivka', 'Sugar', '2', 'nvasichev2@icio.us', 3737905032);

insert into Person (Person_ID, First_Name, Last_Name, Birth_Date, City, Street, House_Number, Email, Main_Phone) 
values (485267077, 'Collie', 'Claige', to_date('24-03-1974', 'dd-mm-yyyy'), 'Zyukayka', 'Carey', '18', 'cclaige3@ehow.com', 3067495417);

insert into Person (Person_ID, First_Name, Last_Name, Birth_Date, City, Street, House_Number, Email, Main_Phone) 
values (829141231, 'Ora', 'Snodden', to_date('09-05-1928', 'dd-mm-yyyy'), 'Alcanena', 'Montana', '374', 'osnodden4@aol.com', 8337036718);

insert into Person (Person_ID, First_Name, Last_Name, Birth_Date, City, Street, House_Number, Email, Main_Phone) 
values (841195195, 'MerPerson_IDith', 'Goodyear', to_date('27-08-2006', 'dd-mm-yyyy'), 'Labo', 'Melvin', '906', 'mgoodyear5@rakuten.co.jp', 7867800810);

insert into Person (Person_ID, First_Name, Last_Name, Birth_Date, City, Street, House_Number, Email, Main_Phone) 
values (914799987, 'Chrysa', 'Malcolmson', to_date('23-04-1957', 'dd-mm-yyyy'), 'Archis', 'Norway Maple', '5', 'cmalcolmson6@goo.ne.jp', 1418892824);

insert into Person (Person_ID, First_Name, Last_Name, Birth_Date, City, Street, House_Number, Email, Main_Phone) 
values (765965803, 'Elli', 'Spata', to_date('30-06-1946', 'dd-mm-yyyy'), 'Longyuanba', 'Prairieview', '90055', 'espata7@arizona.edu', 6956025106);

insert into Person (Person_ID, First_Name, Last_Name, Birth_Date, City, Street, House_Number, Email, Main_Phone) 
values (623477712, 'Consuelo', 'Pashenkov', to_date('02-07-2000', 'dd-mm-yyyy'), 'Pelabuhanratu', 'Katie', '095', 'cpashenkov8@adobe.com', 6083180009);

insert into Person (Person_ID, First_Name, Last_Name, Birth_Date, City, Street, House_Number, Email, Main_Phone) 
values (126142060, 'Claudell', 'Nozzolinii', to_date('24-09-1925', 'dd-mm-yyyy'), 'Bitam', 'Oak Valley', '387', 'cnozzolinii9@rediff.com', 1383128193);

--insert to Trainer:

insert into TRAINER (SENIORITY, SALARY, RATING, PERSON_ID)
values (10, 13115.62, 4, 250146889);

insert into TRAINER (SENIORITY, SALARY, RATING, PERSON_ID)
values (3, 22565.25, 3, 152300229);

insert into TRAINER (SENIORITY, SALARY, RATING, PERSON_ID)
values (2, 14076.57, 2, 264728817);

insert into TRAINER (SENIORITY, SALARY, RATING, PERSON_ID)
values (19, 12044.82, 3, 939636403);

insert into TRAINER (SENIORITY, SALARY, RATING, PERSON_ID)
values (7, 7704.78, 5, 662635024);

insert into TRAINER (SENIORITY, SALARY, RATING, PERSON_ID)
values (19, 13663.20, 1, 915122110);

insert into TRAINER (SENIORITY, SALARY, RATING, PERSON_ID)
values (8, 19605.51, 4, 153951230);

insert into TRAINER (SENIORITY, SALARY, RATING, PERSON_ID)
values (13, 5291.96, 3, 210963470);

insert into TRAINER (SENIORITY, SALARY, RATING, PERSON_ID)
values (3, 9062.03, 2, 936658377);

insert into TRAINER (SENIORITY, SALARY, RATING, PERSON_ID)
values (15, 4965.70, 2, 181050162);

--insert to Trainee:

insert into TRAINEE (JOINING_DATE, MEMBERSHIP_LENGTH, HEALTH_CONDITION, PERSON_ID)
values (to_date('21-06-1974', 'dd-mm-yyyy'), 3, 'Healthy lifestyle', 353251821);

insert into TRAINEE (JOINING_DATE, MEMBERSHIP_LENGTH, HEALTH_CONDITION, PERSON_ID)
values (to_date('24-09-1965', 'dd-mm-yyyy'), 10, 'Good', 963758267);

insert into TRAINEE (JOINING_DATE, MEMBERSHIP_LENGTH, HEALTH_CONDITION, PERSON_ID)
values (to_date('25-11-2000', 'dd-mm-yyyy'), 28, 'Excellent', 753286200);

insert into TRAINEE (JOINING_DATE, MEMBERSHIP_LENGTH, HEALTH_CONDITION, PERSON_ID)
values (to_date('25-10-1983', 'dd-mm-yyyy'), 21, 'with chronic disease', 799006955);

insert into TRAINEE (JOINING_DATE, MEMBERSHIP_LENGTH, HEALTH_CONDITION, PERSON_ID)
values (to_date('16-01-1968', 'dd-mm-yyyy'), 11, 'Fair', 576328517);

insert into TRAINEE (JOINING_DATE, MEMBERSHIP_LENGTH, HEALTH_CONDITION, PERSON_ID)
values (to_date('07-09-2002', 'dd-mm-yyyy'), 34, 'Overweight', 373839373);

insert into TRAINEE (JOINING_DATE, MEMBERSHIP_LENGTH, HEALTH_CONDITION, PERSON_ID)
values (to_date('24-11-2006', 'dd-mm-yyyy'), 36, '''Fair', 273396102);

insert into TRAINEE (JOINING_DATE, MEMBERSHIP_LENGTH, HEALTH_CONDITION, PERSON_ID)
values (to_date('31-03-1967', 'dd-mm-yyyy'), 12, '''Fair', 200281225);

insert into TRAINEE (JOINING_DATE, MEMBERSHIP_LENGTH, HEALTH_CONDITION, PERSON_ID)
values (to_date('11-03-1984', 'dd-mm-yyyy'), 20, '''Poor', 173200754);

insert into TRAINEE (JOINING_DATE, MEMBERSHIP_LENGTH, HEALTH_CONDITION, PERSON_ID)
values (to_date('13-01-1969', 'dd-mm-yyyy'), 28, 'Pregnant', 624917762);

--insert to Training:

INSERT INTO Training (Training_Code , Training_Type , Duration , Constrains) VALUES
(1, 'Spinning', 32, 'physical state recovering');

INSERT INTO Training (Training_Code , Training_Type , Duration , Constrains) VALUES
(2, 'Strength Training', 88, 'experience novice');

INSERT INTO Training (Training_Code , Training_Type , Duration , Constrains) VALUES
(3, 'Boxing', 56, 'fitness level intermediate');

INSERT INTO Training (Training_Code , Training_Type , Duration , Constrains) VALUES
(4, 'Yoga', 58, 'experience novice');

INSERT INTO Training (Training_Code , Training_Type , Duration , Constrains) VALUES
(5, 'Yoga', 47, 'experience experienced');

INSERT INTO Training (Training_Code , Training_Type , Duration , Constrains) VALUES
(6, 'Yoga', 112, 'physical state healthy');

INSERT INTO Training (Training_Code , Training_Type , Duration , Constrains) VALUES
(7, 'CrossFit', 81, 'experience experienced');

INSERT INTO Training (Training_Code , Training_Type , Duration , Constrains) VALUES
(8, 'Spinning', 96, 'age below 50');

INSERT INTO Training (Training_Code , Training_Type , Duration , Constrains) VALUES
(9, 'Cardio', 101, 'experience expert');

INSERT INTO Training (Training_Code , Training_Type , Duration , Constrains) VALUES
(10, 'Spinning', 95, 'physical state healthy');

--insert to Item:

insert into item (item_code, item_name, purpose, weight, item_length)
values (00001, ' ''Yoga Mat'' ', ' ''Flexibility Training'' ', 11.9, 27.0);

insert into item (item_code, item_name, purpose, weight, item_length)
values (00002, ' ''Jump Rope'' ', ' ''Cardio'' ', 3.3, NULL);

insert into item (item_code, item_name, purpose, weight, item_length)
values (00003, ' ''Weightlift'' ', ' ''Cardio'' ', 17.3, NULL);

insert into item (item_code, item_name, purpose, weight, item_length)
values (00004, ' ''Medicine Ball'' ', ' ''General Fitness'' ', NULL, NULL);

insert into item (item_code, item_name, purpose, weight, item_length)
values (00005, ' ''Yoga Mat'' ', ' ''General Fitness'' ', 19.5, 2.1);

insert into item (item_code, item_name, purpose, weight, item_length)
values (00006, ' ''Yoga Mat'' ', ' ''Strength Training'' ', NULL, 6.9);

insert into item (item_code, item_name, purpose, weight, item_length)
values (00007, ' ''Resistance Band'' ', ' ''Cardio'' ', NULL, NULL);

insert into item (item_code, item_name, purpose, weight, item_length)
values (00008, ' ''Medicine Ball'' ', ' ''Cardio'' ', 15.2, NULL);

insert into item (item_code, item_name, purpose, weight, item_length)
values (00009, ' ''Dumbbell'' ', ' ''General Fitness'' ', NULL, 37.0);

insert into item (item_code, item_name, purpose, weight, item_length)
values (00010, ' ''Jump Rope'' ', ' ''Strength Training'' ', NULL, 5.1);


--insert to Uses:


insert into USES (TRAINING_CODE, ITEM_CODE)
values (493, 377);

insert into USES (TRAINING_CODE, ITEM_CODE)
values (488, 269);

insert into USES (TRAINING_CODE, ITEM_CODE)
values (37, 103);

insert into USES (TRAINING_CODE, ITEM_CODE)
values (151, 42);

insert into USES (TRAINING_CODE, ITEM_CODE)
values (219, 137);

insert into USES (TRAINING_CODE, ITEM_CODE)
values (207, 161);

insert into USES (TRAINING_CODE, ITEM_CODE)
values (12, 191);

insert into USES (TRAINING_CODE, ITEM_CODE)
values (418, 296);

insert into USES (TRAINING_CODE, ITEM_CODE)
values (488, 90);

insert into USES (TRAINING_CODE, ITEM_CODE)
values (36, 234);

--insert to PERSON_ANOTHER_PHONE:


insert into PERSON_ANOTHER_PHONE (ANOTHER_PHONE, PERSON_ID)
values (516169780, 786496745);

insert into PERSON_ANOTHER_PHONE (ANOTHER_PHONE, PERSON_ID)
values (699480586, 435897536);

insert into PERSON_ANOTHER_PHONE (ANOTHER_PHONE, PERSON_ID)
values (460825694, 765927503);

insert into PERSON_ANOTHER_PHONE (ANOTHER_PHONE, PERSON_ID)
values (141710155, 466025294);

insert into PERSON_ANOTHER_PHONE (ANOTHER_PHONE, PERSON_ID)
values (748170246, 873682714);

insert into PERSON_ANOTHER_PHONE (ANOTHER_PHONE, PERSON_ID)
values (791629290, 117293621);

insert into PERSON_ANOTHER_PHONE (ANOTHER_PHONE, PERSON_ID)
values (758079287, 811670082);

insert into PERSON_ANOTHER_PHONE (ANOTHER_PHONE, PERSON_ID)
values (295043613, 441448733);

insert into PERSON_ANOTHER_PHONE (ANOTHER_PHONE, PERSON_ID)
values (121191394, 568212072);

insert into PERSON_ANOTHER_PHONE (ANOTHER_PHONE, PERSON_ID)
values (755368686, 792537826);
