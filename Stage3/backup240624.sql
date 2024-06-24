prompt Creating PERSON...
create table PERSON
(
  person_id    NUMBER(9) not null,
  first_name   VARCHAR2(30) not null,
  last_name    VARCHAR2(30) not null,
  birth_date   DATE not null,
  city         VARCHAR2(30),
  street       VARCHAR2(30),
  house_number NUMBER(5) not null,
  email        VARCHAR2(35),
  main_phone   NUMBER(13) not null
)
;
alter table PERSON
  add primary key (PERSON_ID);

prompt Creating TRAINEE...
create table TRAINEE
(
  joining_date      DATE not null,
  membership_length NUMBER(4) not null,
  health_condition  VARCHAR2(20) not null,
  person_id         NUMBER(9) not null
)
;
alter table TRAINEE
  add primary key (PERSON_ID);
alter table TRAINEE
  add foreign key (PERSON_ID)
  references PERSON (PERSON_ID) on delete cascade;

prompt Creating TRAINER...
create table TRAINER
(
  seniority NUMBER(2) not null,
  salary    NUMBER(7,2) not null,
  rating    NUMBER(1) not null,
  person_id NUMBER(9) not null
)
;
alter table TRAINER
  add primary key (PERSON_ID);
alter table TRAINER
  add foreign key (PERSON_ID)
  references PERSON (PERSON_ID) on delete cascade;

prompt Creating TRAINING...
create table TRAINING
(
  training_code NUMBER(5) not null,
  training_type VARCHAR2(20) not null,
  duration      NUMBER(3) not null,
  constrains    VARCHAR2(40) default 'no-constaints'
)
;
alter table TRAINING
  add primary key (TRAINING_CODE);

prompt Creating ACTUAL_TRAINING...
create table ACTUAL_TRAINING
(
  training_hour        NUMBER(4,2) not null,
  training_date        DATE not null,
  training_location    VARCHAR2(30) not null,
  training_cost        NUMBER(5,2) not null,
  actual_training_code NUMBER(5) not null,
  person_id1           NUMBER(9) not null,
  person_id2           NUMBER(9) not null,
  training_code        NUMBER(5) not null
)
;
alter table ACTUAL_TRAINING
  add primary key (ACTUAL_TRAINING_CODE);
alter table ACTUAL_TRAINING
  add foreign key (TRAINING_CODE)
  references TRAINING (TRAINING_CODE);
alter table ACTUAL_TRAINING
  add foreign key (PERSON_ID1)
  references TRAINEE (PERSON_ID) on delete cascade;
alter table ACTUAL_TRAINING
  add foreign key (PERSON_ID2)
  references TRAINER (PERSON_ID) on delete cascade;
alter table ACTUAL_TRAINING
  add constraint DIFFERENT_IDS
  check (PERSON_ID1<>PERSON_ID2);

prompt Creating ITEM...
create table ITEM
(
  item_code   NUMBER(5) not null,
  item_name   VARCHAR2(40) not null,
  purpose     VARCHAR2(40) not null,
  weight      NUMBER(5,2),
  item_length NUMBER(5,2)
)
;
alter table ITEM
  add primary key (ITEM_CODE);

prompt Creating PERSON_ANOTHER_PHONE...
create table PERSON_ANOTHER_PHONE
(
  another_phone NUMBER(13) not null,
  person_id     NUMBER(9) not null
)
;
alter table PERSON_ANOTHER_PHONE
  add primary key (ANOTHER_PHONE, PERSON_ID);
alter table PERSON_ANOTHER_PHONE
  add foreign key (PERSON_ID)
  references PERSON (PERSON_ID) on delete cascade;

prompt Creating USES...
create table USES
(
  training_code NUMBER(5) not null,
  item_code     NUMBER(5) not null
)
;
alter table USES
  add primary key (TRAINING_CODE, ITEM_CODE);
alter table USES
  add foreign key (TRAINING_CODE)
  references TRAINING (TRAINING_CODE);
alter table USES
  add foreign key (ITEM_CODE)
  references ITEM (ITEM_CODE);

prompt Disabling triggers for PERSON...
alter table PERSON disable all triggers;
prompt Disabling triggers for TRAINEE...
alter table TRAINEE disable all triggers;
prompt Disabling triggers for TRAINER...
alter table TRAINER disable all triggers;
prompt Disabling triggers for TRAINING...
alter table TRAINING disable all triggers;
prompt Disabling triggers for ACTUAL_TRAINING...
alter table ACTUAL_TRAINING disable all triggers;
prompt Disabling triggers for ITEM...
alter table ITEM disable all triggers;
prompt Disabling triggers for PERSON_ANOTHER_PHONE...
alter table PERSON_ANOTHER_PHONE disable all triggers;
prompt Disabling triggers for USES...
alter table USES disable all triggers;
prompt Disabling foreign key constraints for TRAINEE...
alter table TRAINEE disable constraint SYS_C00716578;
prompt Disabling foreign key constraints for TRAINER...
alter table TRAINER disable constraint SYS_C00716577;
prompt Disabling foreign key constraints for ACTUAL_TRAINING...
alter table ACTUAL_TRAINING disable constraint SYS_C00711871;
alter table ACTUAL_TRAINING disable constraint SYS_C00716580;
alter table ACTUAL_TRAINING disable constraint SYS_C00716581;
prompt Disabling foreign key constraints for PERSON_ANOTHER_PHONE...
alter table PERSON_ANOTHER_PHONE disable constraint SYS_C00716579;
prompt Disabling foreign key constraints for USES...
alter table USES disable constraint SYS_C00708894;
alter table USES disable constraint SYS_C00708895;
prompt Deleting USES...
delete from USES;
commit;
prompt Deleting PERSON_ANOTHER_PHONE...
delete from PERSON_ANOTHER_PHONE;
commit;
prompt Deleting ITEM...
delete from ITEM;
commit;
prompt Deleting ACTUAL_TRAINING...
delete from ACTUAL_TRAINING;
commit;
prompt Deleting TRAINING...
delete from TRAINING;
commit;
prompt Deleting TRAINER...
delete from TRAINER;
commit;
prompt Deleting TRAINEE...
delete from TRAINEE;
commit;
prompt Deleting PERSON...
delete from PERSON;
commit;
prompt Loading PERSON...
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (489630456, 'Cyndia', 'Whayman', to_date('23-05-2002', 'dd-mm-yyyy'), 'Daxi', 'Delaware', 1432, 'cwhayman1@desdev.cn', 3504939693);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (743881857, 'Netta', 'Vasichev', to_date('28-03-1956', 'dd-mm-yyyy'), 'Semenivka', 'Sugar', 2, 'nvasichev2@icio.us', 3737905032);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (479467077, 'Collie', 'Claige', to_date('24-03-1974', 'dd-mm-yyyy'), 'Zyukayka', 'Carey', 18, 'cclaige3@ehow.com', 3067495417);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (829145191, 'Ora', 'Snodden', to_date('09-05-1928', 'dd-mm-yyyy'), 'Alcanena', 'Montana', 374, 'osnodden4@aol.com', 8337036718);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (841180795, 'MerPerson_IDith', 'Goodyear', to_date('27-08-2006', 'dd-mm-yyyy'), 'Labo', 'Melvin', 906, 'mgoodyear5@rakuten.co.jp', 7867800810);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (928999987, 'Chrysa', 'Malcolmson', to_date('23-04-1957', 'dd-mm-yyyy'), 'Archis', 'Norway Maple', 5, 'cmalcolmson6@goo.ne.jp', 1418892824);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (765927503, 'Elli', 'Spata', to_date('30-06-1946', 'dd-mm-yyyy'), 'Longyuanba', 'Prairieview', 90055, 'espata7@arizona.edu', 6956025106);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (623674412, 'Consuelo', 'Pashenkov', to_date('02-07-2000', 'dd-mm-yyyy'), 'Pelabuhanratu', 'Katie', 95, 'cpashenkov8@adobe.com', 6083180009);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (126638060, 'Claudell', 'Nozzolinii', to_date('24-09-1925', 'dd-mm-yyyy'), 'Bitam', 'Oak Valley', 387, 'cnozzolinii9@rediff.com', 1383128193);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (412832580, 'Ysabel', 'Beyer', to_date('28-08-1963', 'dd-mm-yyyy'), 'Batouri', 'Duke', 11310, 'ybeyera@epa.gov', 5886755329);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (435897536, 'Gertie', 'Dureden', to_date('18-03-1935', 'dd-mm-yyyy'), 'Nalinggou', 'Melrose', 6536, 'gduredenb@dion.ne.jp', 4869946444);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (604967584, 'Papageno', 'Canby', to_date('05-05-1951', 'dd-mm-yyyy'), 'Hostomice', 'Monterey', 696, 'pcanbyc@msn.com', 1639987927);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (683756135, 'Lexy', 'Stuckford', to_date('09-01-1972', 'dd-mm-yyyy'), 'Pelem', 'Daystar', 11, 'lstuckfordd@de.vu', 2575691931);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (344533634, 'Hagen', 'Hubatsch', to_date('07-09-1995', 'dd-mm-yyyy'), 'Khemarat', 'Iowa', 29, 'hhubatsche@1688.com', 9323009995);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (897043979, 'Casey', 'Westfalen', to_date('25-07-1957', 'dd-mm-yyyy'), 'Labney', 'Union', 12, 'cwestfalenf@reddit.com', 5276645892);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (999747607, 'Hillyer', 'Kocher', to_date('16-10-1979', 'dd-mm-yyyy'), 'Atap', 'RPerson_IDgeway', 9707, 'hkocherg@hatena.ne.jp', 4666210134);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (837026985, 'Eustace', 'Jell', to_date('03-03-1962', 'dd-mm-yyyy'), 'Osasco', 'Shasta', 2, 'ejellh@kickstarter.com', 8024532487);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (331469551, 'Thekla', 'Ahrens', to_date('12-06-1991', 'dd-mm-yyyy'), 'Maan?t', 'Pierstorff', 80, 'tahrensi@cbslocal.com', 3643212921);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (295318534, 'Krispin', 'Hames', to_date('30-09-1952', 'dd-mm-yyyy'), 'Margate', 'Victoria', 98953, 'khamesj@woothemes.com', 4069067814);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (980173326, 'Masha', 'Ballinghall', to_date('08-03-1969', 'dd-mm-yyyy'), 'Kraton', 'Hooker', 3563, 'mballinghallk@unicef.org', 8548972659);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (124964227, 'Madlen', 'Reiling', to_date('25-07-1931', 'dd-mm-yyyy'), 'Baykonyr', 'Village', 8, 'mreilingl@blog.com', 3269843627);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (128003805, 'Bliss', 'Fearey', to_date('26-09-1938', 'dd-mm-yyyy'), 'La Valette-du-Var', 'Schurz', 76, 'bfeareym@friendfeed.com', 2134966278);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (254414972, 'Davey', 'Peniman', to_date('24-05-1944', 'dd-mm-yyyy'), 'Songyuan', 'Ohio', 3, 'dpenimann@nps.gov', 8562713801);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (295295075, 'Jereme', 'Saiger', to_date('02-04-1998', 'dd-mm-yyyy'), 'Zama', 'Evergreen', 1454, 'jsaigero@indiegogo.com', 9475872776);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (209716187, 'Ivett', 'Pallent', to_date('27-12-1924', 'dd-mm-yyyy'), 'Xibu', 'Oak', 40337, 'ipallentp@infoseek.co.jp', 6372049663);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (152300229, 'Shurlocke', 'Hinemoor', to_date('27-05-1943', 'dd-mm-yyyy'), 'Champaign', 'Arkansas', 5, 'shinemoorq@prnewswire.com', 2175504372);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (830160294, 'Jobey', 'Propper', to_date('13-11-1937', 'dd-mm-yyyy'), 'V?stervik', 'Springview', 16, 'jpropperr@sohu.com', 5652454117);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (557038448, 'Jarred', 'Igo', to_date('26-04-1999', 'dd-mm-yyyy'), 'Hougang', 'Johnson', 47087, 'jigos@nasa.gov', 2908864878);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (675296909, 'Shepard', 'Da Costa', to_date('25-01-1972', 'dd-mm-yyyy'), 'Nagrog', 'Alpine', 21, 'sdacostat@miibeian.gov.cn', 8301704673);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (605591541, 'Whitby', 'Jumonet', to_date('25-11-1961', 'dd-mm-yyyy'), 'Carora', 'Scoville', 8001, 'wjumonetu@unc.edu', 5067780450);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (478380949, 'Ira', 'Crawley', to_date('21-06-1954', 'dd-mm-yyyy'), 'Bur?m', 'Village Green', 73909, 'icrawleyv@cnet.com', 6822298335);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (925132120, 'Jany', 'Narbett', to_date('07-12-1994', 'dd-mm-yyyy'), 'Guangshan Chengguanzhen', 'Elka', 4702, 'jnarbettw@xing.com', 5833740824);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (732473732, 'Madelyn', 'BrPerson_IDger', to_date('19-06-1995', 'dd-mm-yyyy'), 'Iwkowa', 'Maple Wood', 35, 'mbrPerson_IDgerx@hostgator.com', 2483179507);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (980200311, 'Chloette', 'Keese', to_date('27-11-1974', 'dd-mm-yyyy'), 'Youdian', 'Lake View', 240, 'ckeesey@cbslocal.com', 8397883372);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (592162027, 'Marla', 'Vassay', to_date('02-08-1934', 'dd-mm-yyyy'), 'Liberia', 'Russell', 6, 'mvassayz@edublogs.org', 6608113984);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (815735034, 'Anna', 'Kahn', to_date('05-06-1936', 'dd-mm-yyyy'), 'Bayamo', 'Corry', 1940, 'akahn10@woothemes.com', 8347134026);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (649768071, 'Inga', 'Eddie', to_date('02-07-1944', 'dd-mm-yyyy'), 'Milano', 'Thackeray', 41, 'ieddie11@nps.gov', 6131875328);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (466069898, 'Robinia', 'Mephan', to_date('10-05-1931', 'dd-mm-yyyy'), 'Peruc', 'Dixon', 39, 'rmephan12@nifty.com', 3496240613);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (592163243, 'Josepha', 'Saunders', to_date('11-02-1941', 'dd-mm-yyyy'), 'Nishinomiya-hama', 'Kings', 706, 'jsaunders13@blinklist.com', 2971180252);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (542098274, 'Teodor', 'Pentin', to_date('30-04-1961', 'dd-mm-yyyy'), 'Canchayllo', 'Manufacturers', 7, 'tpentin14@intel.com', 6924470007);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (920426797, 'Gilburt', 'Melpuss', to_date('12-06-1948', 'dd-mm-yyyy'), 'Dasht-e Arch?', 'Goodland', 43982, 'gmelpuss15@hc360.com', 4406265526);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (640588003, 'Cele', 'Habens', to_date('19-05-1993', 'dd-mm-yyyy'), 'Volodarsk', 'Milwaukee', 751, 'chabens16@uol.com.br', 6666745572);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (357964464, 'Marillin', 'Rey', to_date('05-06-1970', 'dd-mm-yyyy'), 'Pamplona', 'Barby', 0, 'mrey17@bloglovin.com', 1565434451);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (843068367, 'NativPerson_IDad', 'Hargrove', to_date('23-02-1970', 'dd-mm-yyyy'), 'Tomteboda', 'Atwood', 852, 'nhargrove18@foxnews.com', 2375738043);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (392078118, 'Amie', 'Joskovitch', to_date('01-08-1978', 'dd-mm-yyyy'), 'Wulijie', 'Nelson', 572, 'ajoskovitch19@cdbaby.com', 9062896231);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (596082387, 'Xymenes', 'Durtnell', to_date('19-05-1929', 'dd-mm-yyyy'), 'Krajan Dua Padomasan', 'Westend', 4, 'xdurtnell1a@hubpages.com', 4719915071);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (292421869, 'Wolfy', 'Limmer', to_date('04-05-2005', 'dd-mm-yyyy'), 'Ust?-Kut', 'Forster', 2266, 'wlimmer1b@usgs.gov', 2812998726);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (595483134, 'Jewell', 'Sange', to_date('28-10-1962', 'dd-mm-yyyy'), 'Paris 15', 'Holy Cross', 5, 'jsange1c@hhs.gov', 1054104814);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (908730507, 'Keen', 'Lestrange', to_date('30-04-1989', 'dd-mm-yyyy'), 'Santa Apolonia', 'Texas', 2, 'klestrange1d@ehow.com', 4636509135);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (173200754, 'Arvie', 'Maciak', to_date('26-06-2003', 'dd-mm-yyyy'), 'S?o Jos? de Ribamar', 'Thierer', 24948, 'amaciak1e@unc.edu', 3062686509);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (848074639, 'Deeanne', 'Mathely', to_date('27-01-2004', 'dd-mm-yyyy'), 'Quint?es', 'Stang', 908, 'dmathely1f@newsvine.com', 2431316153);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (970138584, 'Stephi', 'Polsin', to_date('07-05-2001', 'dd-mm-yyyy'), 'Maying', 'Corry', 927, 'spolsin1g@dion.ne.jp', 4964381399);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (625556109, 'Jaynell', 'Hallan', to_date('21-05-1932', 'dd-mm-yyyy'), 'Caijiang', 'Melody', 40720, 'jhallan1h@hubpages.com', 5752065451);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (901931967, 'Phillie', 'Golley', to_date('21-11-1938', 'dd-mm-yyyy'), 'Sumberan', 'Kenwood', 43989, 'pgolley1i@purevolume.com', 1792299487);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (434172398, 'Claudio', 'Hammell', to_date('05-05-1936', 'dd-mm-yyyy'), 'Galamares', 'Sloan', 7, 'chammell1j@washingtonpost.com', 1899196079);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (481541006, 'Kendell', 'Hanniger', to_date('17-10-1951', 'dd-mm-yyyy'), 'Pel?pion', 'Holmberg', 90227, 'khanniger1k@sphinn.com', 7816174286);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (199766274, 'Mayne', 'Goosey', to_date('02-08-1989', 'dd-mm-yyyy'), 'Xiaolan', 'Corben', 5552, 'mgoosey1l@cdbaby.com', 9526636232);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (376109089, 'Jimmy', 'Summerlee', to_date('01-02-1998', 'dd-mm-yyyy'), 'Comal', 'Nevada', 97, 'jsummerlee1m@examiner.com', 4411400434);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (618692425, 'Jdavie', 'Scawton', to_date('05-10-1954', 'dd-mm-yyyy'), 'Tonkino', 'Marcy', 49, 'jscawton1n@is.gd', 8986046056);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (525527704, 'Lorene', 'Cheverell', to_date('26-01-1932', 'dd-mm-yyyy'), 'Santo Domingo de los Colorados', 'Jana', 70164, 'lcheverell1o@sogou.com', 8744936860);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (466025294, 'Maryrose', 'Swinley', to_date('28-06-1930', 'dd-mm-yyyy'), 'Kaji', 'Cody', 4, 'mswinley1p@elpais.com', 1634001667);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (754755023, 'Timmi', 'Albinson', to_date('16-08-1938', 'dd-mm-yyyy'), 'Tapel', 'Shelley', 188, 'talbinson1q@fotki.com', 3188170474);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (923597583, 'Viki', 'Karpe', to_date('28-12-1977', 'dd-mm-yyyy'), 'Zlat? Hory', 'Katie', 952, 'vkarpe1r@exblog.jp', 4047850651);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (240883177, 'Agosto', 'Tice', to_date('25-02-1926', 'dd-mm-yyyy'), 'Kowale', 'Independence', 2, 'atice1s@loc.gov', 6938198388);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (179779567, 'Pamelina', 'Moan', to_date('17-10-1940', 'dd-mm-yyyy'), 'Verkhniye Kigi', 'Carpenter', 39877, 'pmoan1t@spotify.com', 8909242719);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (137211133, 'Christean', 'Brewood', to_date('30-12-1986', 'dd-mm-yyyy'), 'Ransang', 'Moland', 8, 'cbrewood1u@geocities.com', 2336087607);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (509483133, 'Margette', 'Barrus', to_date('10-07-1953', 'dd-mm-yyyy'), 'New Panamao', 'Warner', 59, 'mbarrus1v@hostgator.com', 9452126794);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (478902541, 'Daune', 'Enos', to_date('18-05-1984', 'dd-mm-yyyy'), 'Purorejo', 'Fallview', 2, 'denos1w@privacy.gov.au', 9375820235);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (352072255, 'Herbie', 'Mayho', to_date('02-02-1939', 'dd-mm-yyyy'), 'Kigali', 'Lien', 134, 'hmayho1x@instagram.com', 6738274418);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (911045673, 'Sofie', 'Meffan', to_date('18-12-2006', 'dd-mm-yyyy'), 'Tunggulsari', 'Loomis', 29975, 'smeffan1y@e-recht24.de', 3599586947);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (256244114, 'Omar', 'Paur', to_date('02-11-1971', 'dd-mm-yyyy'), 'La Uni?n', 'Clemons', 2255, 'opaur1z@amazonaws.com', 3223313890);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (254163307, 'Kitti', 'Taffrey', to_date('03-05-1956', 'dd-mm-yyyy'), 'Duy?n H?i', 'Ronald Regan', 0, 'ktaffrey20@sourceforge.net', 2172729583);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (324668142, 'Dylan', 'Perago', to_date('29-05-1972', 'dd-mm-yyyy'), 'Nagbalaye', 'Mosinee', 92501, 'dperago21@theguardian.com', 7496987698);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (854442670, 'Charissa', 'Ginni', to_date('16-06-1924', 'dd-mm-yyyy'), 'Dagushan', 'Red Cloud', 7210, 'cginni22@marriott.com', 2187472294);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (334399647, 'Cori', 'Packe', to_date('30-09-1951', 'dd-mm-yyyy'), 'Shijak', 'Fieldstone', 15, 'cpacke23@pen.io', 1707881566);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (769795766, 'Mendel', 'Redmire', to_date('09-09-1998', 'dd-mm-yyyy'), 'Honolulu', 'Grayhawk', 33722, 'mredmire24@ezinearticles.com', 8086842654);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (220627730, 'Karoline', 'Addlestone', to_date('13-10-1988', 'dd-mm-yyyy'), 'Noenoni', 'Tennessee', 71, 'kaddlestone25@google.ru', 2782351272);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (115518036, 'Jephthah', 'Swabey', to_date('09-10-1965', 'dd-mm-yyyy'), 'Fatumuti', 'Bowman', 6, 'jswabey26@irs.gov', 4871879710);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (154015286, 'Dicky', 'Van Dalen', to_date('23-06-1988', 'dd-mm-yyyy'), 'Muang Xay', 'Laurel', 33, 'dvandalen27@pcworld.com', 4382192396);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (226625742, 'Celia', 'Preece', to_date('14-11-1959', 'dd-mm-yyyy'), 'Sibayo', 'Independence', 379, 'cpreece28@linkedin.com', 8977759270);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (293747357, 'Forrest', 'Oles', to_date('07-10-1940', 'dd-mm-yyyy'), 'Quixad?', 'Graceland', 5, 'foles29@utexas.edu', 3708626548);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (199724940, 'Elisabeth', 'Lafflin', to_date('23-07-1945', 'dd-mm-yyyy'), 'Cola', 'Loeprich', 8397, 'elafflin2a@un.org', 4304228666);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (873456697, 'Cello', 'Cruttenden', to_date('05-04-1965', 'dd-mm-yyyy'), 'Vale de A?ores', 'Evergreen', 39, 'ccruttenden0@phoca.cz', 3846050636);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (236436336, 'Stefan', 'Mapp', to_date('17-07-1988', 'dd-mm-yyyy'), 'San Mateo', 'Norway Maple', 40130, 'smapp2b@multiply.com', 4381990450);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (408406962, 'Lanie', 'Osborn', to_date('24-08-1949', 'dd-mm-yyyy'), 'Bukhovo', 'Corscot', 7943, 'losborn2c@goo.gl', 6259081717);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (363744559, 'Terrill', 'Girling', to_date('21-04-1937', 'dd-mm-yyyy'), 'Nakonde', 'Melby', 44, 'tgirling6z@pinterest.com', 8429968675);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (755809998, 'Torry', 'Bleackly', to_date('19-04-1991', 'dd-mm-yyyy'), 'Qabaq??l', 'Eggendart', 1116, 'tbleackly70@npr.org', 2003928356);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (742101151, 'Jervis', 'Hallex', to_date('12-11-1940', 'dd-mm-yyyy'), 'Hengyang', 'Armistice', 9, 'jhallex71@google.com', 1562319991);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (343418940, 'Lazare', 'Gerrie', to_date('01-10-1953', 'dd-mm-yyyy'), 'Muara Dua', 'Kedzie', 6, 'lgerrie72@epa.gov', 4414698532);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (206629316, 'Trudy', 'Eddington', to_date('11-03-1956', 'dd-mm-yyyy'), 'Dalang', 'Barnett', 24070, 'teddington73@google.com.au', 9732819543);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (271828792, 'Carri', 'Stodit', to_date('15-11-2005', 'dd-mm-yyyy'), 'Sadahayu', 'Memorial', 8, 'cstodit74@webeden.co.uk', 6735827289);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (815956026, 'Ruperta', 'Murby', to_date('31-03-1978', 'dd-mm-yyyy'), 'Mishixiang', 'Mendota', 9, 'rmurby75@theglobeandmail.com', 9256749292);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (937095285, 'Symon', 'Oldham', to_date('21-01-1945', 'dd-mm-yyyy'), 'Rakitnoye', '8th', 64331, 'soldham76@addthis.com', 1301375587);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (936658377, 'Kikelia', 'Yosevitz', to_date('02-04-1984', 'dd-mm-yyyy'), 'Babahoyo', 'Lillian', 0, 'kyosevitz77@seesaa.net', 8054530621);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (197251348, 'Nollie', 'Gouldstraw', to_date('11-09-1999', 'dd-mm-yyyy'), 'Mariatana', 'Pennsylvania', 2643, 'ngouldstraw78@jimdo.com', 9001724600);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (462724078, 'Asher', 'Scanterbury', to_date('18-03-1975', 'dd-mm-yyyy'), 'Tha Muang', 'Lakewood Gardens', 3, 'ascanterbury79@gnu.org', 6892227063);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (576328517, 'Mattie', 'Getcliff', to_date('16-12-1961', 'dd-mm-yyyy'), 'Krajan Tengah', 'Corben', 26, 'mgetcliff7a@ebay.co.uk', 8437736445);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (386432436, 'Farand', 'Menaul', to_date('28-12-1999', 'dd-mm-yyyy'), 'Brejo Santo', 'Lakewood Gardens', 54982, 'fmenaul7b@kickstarter.com', 1492880655);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (731197644, 'Zerk', 'Inglesent', to_date('08-03-1946', 'dd-mm-yyyy'), 'Slatina', 'Burrows', 40, 'zinglesent7c@cafepress.com', 1653812592);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (501705989, 'Ermengarde', 'Eadmeades', to_date('03-06-1955', 'dd-mm-yyyy'), 'G?teborg', 'Leroy', 96, 'eeadmeades7d@rambler.ru', 4921809507);
commit;
prompt 100 records committed...
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (894045375, 'Towney', 'Kirby', to_date('14-04-1975', 'dd-mm-yyyy'), 'Xiangzikou', 'Debra', 186, 'tkirby7e@wix.com', 3687394626);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (252401236, 'Augustine', 'Dominichelli', to_date('30-03-1973', 'dd-mm-yyyy'), 'Vincennes', 'Tomscot', 6962, 'adominichelli7f@redcross.org', 3475557081);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (252975811, 'Kennith', 'Tissell', to_date('24-05-1998', 'dd-mm-yyyy'), 'Quinocay', 'Crownhardt', 27, 'ktissell7g@loc.gov', 8193875123);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (181050162, 'Horten', 'Gentle', to_date('04-04-1936', 'dd-mm-yyyy'), 'U?cim?w Stary', 'Macpherson', 5821, 'hgentle7h@sakura.ne.jp', 6646322232);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (811445548, 'Ellery', 'Lacase', to_date('02-07-1958', 'dd-mm-yyyy'), 'Juripiranga', 'Warrior', 93, 'elacase7i@ox.ac.uk', 7354314979);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (829092435, 'Margery', 'Antosch', to_date('07-11-1965', 'dd-mm-yyyy'), 'Fengchuan', 'Saint Paul', 4438, 'mantosch7j@fema.gov', 2943200577);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (540381721, 'Krista', 'Dearth', to_date('20-05-1970', 'dd-mm-yyyy'), 'Xixiang', 'Toban', 9, 'kdearth7k@globo.com', 9306738094);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (424357965, 'AlPerson_IDia', 'Shadrack', to_date('28-06-1987', 'dd-mm-yyyy'), 'Borbon', 'Chinook', 315, 'ashadrack7l@si.edu', 8382413121);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (280206586, 'Ethyl', 'Sangwine', to_date('08-09-1992', 'dd-mm-yyyy'), 'Usarin', 'Badeau', 9, 'esangwine7m@merriam-webster.com', 4456670674);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (229177674, 'Kenton', 'McTerry', to_date('23-05-1968', 'dd-mm-yyyy'), 'Xiangdong', 'Briar Crest', 4645, 'kmcterry7n@webmd.com', 4857863618);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (826589049, 'Gram', 'Noddles', to_date('29-12-1984', 'dd-mm-yyyy'), 'Cama Juan', 'Mandrake', 92, 'gnoddles7o@homestead.com', 3149689055);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (456191540, 'Melva', 'Scobie', to_date('14-03-1927', 'dd-mm-yyyy'), 'Yanhe', 'Oak', 8362, 'mscobie7p@naver.com', 6963214346);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (153938151, 'Judith', 'Hallsworth', to_date('09-10-1971', 'dd-mm-yyyy'), 'Revolucion Verde', 'Blackbird', 32, 'jhallsworth7q@baPerson_IDu.com', 5703476124);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (482412253, 'Merrielle', 'Hoffmann', to_date('16-11-1995', 'dd-mm-yyyy'), 'Nanjing', 'Bartillon', 252, 'mhoffmann7r@examiner.com', 4242352041);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (866183544, 'Maude', 'Marusik', to_date('11-12-1946', 'dd-mm-yyyy'), 'Yuxin', 'Gerald', 62074, 'mmarusik7s@java.com', 7169297776);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (305981991, 'Agosto', 'Latus', to_date('27-09-1925', 'dd-mm-yyyy'), 'Hermanus', 'Prentice', 282, 'alatus7t@sakura.ne.jp', 2922276780);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (411702990, 'Esteban', 'Rumbelow', to_date('25-01-1976', 'dd-mm-yyyy'), 'N?gata', 'Mayer', 8, 'erumbelow7u@mayoclinic.com', 4283079137);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (474084615, 'Leora', 'Bissiker', to_date('12-02-1979', 'dd-mm-yyyy'), 'Lashkar G?h', 'Mendota', 4793, 'lbissiker7v@sun.com', 7102856110);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (610512281, 'Jobi', 'Foran', to_date('23-08-1954', 'dd-mm-yyyy'), 'Puerto Esperanza', 'Canary', 1, 'jforan7w@nature.com', 7695924148);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (978982125, 'Kienan', 'Oyley', to_date('19-04-1950', 'dd-mm-yyyy'), 'Santiago', 'Menomonie', 96207, 'koyley7x@behance.net', 4473235568);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (467275290, 'Jana', 'Eykelhof', to_date('16-03-1960', 'dd-mm-yyyy'), 'Gaohe', 'Gale', 618, 'jeykelhof7y@ft.com', 1318316998);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (742220858, 'Daveta', 'Largen', to_date('24-09-1973', 'dd-mm-yyyy'), 'Medina', 'Pepper Wood', 4, 'dlargen7z@tiny.cc', 2181274546);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (129186647, 'Byram', 'Waison', to_date('18-03-1925', 'dd-mm-yyyy'), 'Zhongguanyi', 'Washington', 32, 'bwaison80@jiathis.com', 6184040785);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (786226109, 'Kyle', 'Palphreyman', to_date('16-11-1962', 'dd-mm-yyyy'), 'Sari', 'NorthrPerson_IDge', 70395, 'kpalphreyman81@ox.ac.uk', 6835161603);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (199280229, 'Hannie', 'Dewi', to_date('05-01-1928', 'dd-mm-yyyy'), 'San Vicente', 'Hermina', 51429, 'hdewi82@networksolutions.com', 9221754529);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (349700908, 'Ian', 'Bartak', to_date('29-04-1958', 'dd-mm-yyyy'), 'Wentang', 'Iowa', 251, 'ibartak83@seesaa.net', 9686559218);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (193012006, 'Putnem', 'Peiro', to_date('06-01-1965', 'dd-mm-yyyy'), 'P?ibyslav', 'Spenser', 4481, 'ppeiro84@mapquest.com', 6665198777);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (558402416, 'Lauretta', 'Dendle', to_date('11-08-1965', 'dd-mm-yyyy'), 'Marolambo', 'RPerson_IDge Oak', 56334, 'ldendle85@msn.com', 4545926225);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (617937771, 'Charlton', 'Jellico', to_date('26-07-1988', 'dd-mm-yyyy'), 'Tropar?vo', 'Hanson', 8690, 'cjellico86@google.com.br', 7793300866);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (624917762, 'Conrad', 'Union', to_date('13-08-1970', 'dd-mm-yyyy'), 'Corral', 'Sauthoff', 665, 'cunion87@wired.com', 1445794626);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (675194468, 'Leonhard', 'Cocklin', to_date('03-08-1958', 'dd-mm-yyyy'), 'Copa', 'Bashford', 6982, 'lcocklin88@guardian.co.uk', 2612761975);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (207996683, 'Lucretia', 'Cheese', to_date('11-12-1943', 'dd-mm-yyyy'), 'Kota Kinabalu', 'Rusk', 633, 'lcheese89@behance.net', 8663300026);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (726402722, 'Dareen', 'Leask', to_date('18-12-1968', 'dd-mm-yyyy'), 'Ko?czyg?owy', 'High Crossing', 4222, 'dleask8a@diigo.com', 5192290794);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (827216964, 'Ilario', 'Zaple', to_date('15-12-1946', 'dd-mm-yyyy'), 'LeonPerson_IDovo', 'Oak', 9012, 'izaple8b@nifty.com', 8755173883);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (846419707, 'Janey', 'Ackers', to_date('15-03-1970', 'dd-mm-yyyy'), 'Bar-le-Duc', 'Crescent Oaks', 94544, 'jackers8c@google.com', 6895812735);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (191471146, 'Cookie', 'Gallimore', to_date('05-11-1994', 'dd-mm-yyyy'), 'Spas?ke', 'Amoth', 988, 'cgallimore8d@bravesites.com', 3647514681);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (834137712, 'Estella', 'Pellington', to_date('09-12-1935', 'dd-mm-yyyy'), 'Bromma', 'Jackson', 97707, 'epellington8e@blog.com', 3702189090);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (687150404, 'Adena', 'Thonger', to_date('19-05-1985', 'dd-mm-yyyy'), 'Pinglin', 'Boyd', 7641, 'athonger8f@sphinn.com', 8921107667);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (982228959, 'Anthe', 'Sawkin', to_date('10-03-2001', 'dd-mm-yyyy'), 'Jinshan', 'Delladonna', 920, 'asawkin8g@networksolutions.com', 1269465430);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (395672304, 'Julie', 'Ordelt', to_date('29-06-1975', 'dd-mm-yyyy'), 'Kunmi Erdi', 'East', 18, 'jordelt8h@cloudflare.com', 9593606975);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (782064933, 'Elyn', 'Corradini', to_date('02-03-1973', 'dd-mm-yyyy'), 'Seremban', 'Spenser', 86, 'ecorradini8i@cnet.com', 8375962046);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (991512349, 'Fredrick', 'Whetnell', to_date('04-04-1988', 'dd-mm-yyyy'), 'Tomasz?w Mazowiecki', 'American', 675, 'fwhetnell8j@infoseek.co.jp', 9755737135);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (573698524, 'Nial', 'Breffitt', to_date('14-02-2000', 'dd-mm-yyyy'), 'Bajia', 'Longview', 76, 'nbreffitt8k@nsw.gov.au', 2817222710);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (523866118, 'Devan', 'Benito', to_date('16-12-1983', 'dd-mm-yyyy'), 'Camacha', 'Larry', 383, 'dbenito8l@over-blog.com', 8524626918);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (916416877, 'Margi', 'Vlasov', to_date('29-09-2001', 'dd-mm-yyyy'), 'Link?ping', 'Maryland', 1279, 'mvlasov8m@scientificamerican.com', 5178288487);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (331610494, 'Joellen', 'Wiggin', to_date('19-03-1979', 'dd-mm-yyyy'), 'Huangzhuang', 'Maple Wood', 2, 'jwiggin8n@deliciousdays.com', 1944671776);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (238646522, 'Julius', 'Langforth', to_date('23-06-2000', 'dd-mm-yyyy'), 'Ibat?', 'Thompson', 6444, 'jlangforth8o@uiuc.edu', 7613981526);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (598823879, 'Whitney', 'Imorts', to_date('10-10-1949', 'dd-mm-yyyy'), 'Franco da Rocha', 'Morning', 14, 'wimorts8p@aol.com', 2507588041);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (105654067, 'Stanislas', 'Overnell', to_date('05-01-1989', 'dd-mm-yyyy'), 'Shanghuang', 'Prairie Rose', 12, 'sovernell8q@pbs.org', 3712778664);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (677966690, 'Sutherland', 'Asplen', to_date('25-03-1974', 'dd-mm-yyyy'), 'Bagiktinggang', 'School', 90619, 'sasplen8r@indiatimes.com', 8347151041);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (273396102, 'Josias', 'Tuckley', to_date('07-03-1976', 'dd-mm-yyyy'), 'Shitun', 'Pearson', 38, 'jtuckley8s@cbc.ca', 4643014697);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (160302987, 'Brendon', 'Winthrop', to_date('17-07-1977', 'dd-mm-yyyy'), 'Nikolayevka', 'Sloan', 9577, 'bwinthrop8t@tiny.cc', 7792239661);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (714330119, 'Seth', 'Mellsop', to_date('25-04-1944', 'dd-mm-yyyy'), 'Zhyrovichy', 'Trailsway', 19, 'smellsop8u@dropbox.com', 5477674372);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (963758267, 'Taddeusz', 'Hughlin', to_date('25-08-1981', 'dd-mm-yyyy'), 'Kudang', 'Hazelcrest', 519, 'thughlin8v@merriam-webster.com', 9002294545);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (383440042, 'Danie', 'Kretchmer', to_date('21-04-1949', 'dd-mm-yyyy'), 'Kushikino', 'Spohn', 5, 'dkretchmer8w@friendfeed.com', 3501313993);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (505169218, 'Dorotea', 'Kohnen', to_date('22-03-1926', 'dd-mm-yyyy'), 'Bakalang', 'Del Mar', 4908, 'dkohnen8x@domainmarket.com', 1572442290);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (554526290, 'Jacinta', 'Alekseicik', to_date('20-10-1984', 'dd-mm-yyyy'), 'P?tan', 'Nobel', 28, 'jalekseicik8y@dropbox.com', 1803174300);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (146924485, 'Reeba', 'Winspurr', to_date('24-06-1937', 'dd-mm-yyyy'), 'Arnprior', 'Jana', 157, 'rwinspurr8z@earthlink.net', 9401859064);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (677684763, 'Clarice', 'Furminger', to_date('25-04-1996', 'dd-mm-yyyy'), 'CPerson_IDamar', 'Little Fleur', 0, 'cfurminger90@a8.net', 7853947569);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (339168131, 'Arline', 'Bulfield', to_date('06-12-1982', 'dd-mm-yyyy'), 'La Jagua de Ibirico', 'Old Gate', 6180, 'abulfield91@a8.net', 4952995555);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (862511399, 'Rand', 'BrPerson_IDal', to_date('16-10-1999', 'dd-mm-yyyy'), 'Chanhe', 'CoolPerson_IDge', 7838, 'rbrPerson_IDal92@mapy.cz', 9789623766);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (817616991, 'Arthur', 'Stubbin', to_date('05-06-1950', 'dd-mm-yyyy'), 'Bueng Sam Phan', 'Stephen', 91, 'astubbin93@intel.com', 9433725322);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (168836760, 'Benedicta', 'Bakeup', to_date('26-12-1951', 'dd-mm-yyyy'), 'Sigiriya', 'Aberg', 68317, 'bbakeup94@latimes.com', 7146443218);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (851536797, 'Ivor', 'Tilt', to_date('01-09-1984', 'dd-mm-yyyy'), 'Protecci?n', 'Pond', 0, 'itilt95@blogs.com', 1712176310);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (849129256, 'Boone', 'Inkle', to_date('02-05-1989', 'dd-mm-yyyy'), 'Cibinong Satu', 'Troy', 5, 'binkle96@360.cn', 1257387641);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (243572499, 'Deloria', 'RPerson_IDdall', to_date('26-12-1960', 'dd-mm-yyyy'), 'Sula', 'Harper', 4697, 'drPerson_IDdall97@loc.gov', 6208064964);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (124985854, 'Bat', 'Soppit', to_date('08-08-1936', 'dd-mm-yyyy'), 'Tadrart', 'Mosinee', 586, 'bsoppit2d@hatena.ne.jp', 7921514743);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (698519392, 'HePerson_IDi', 'Trime', to_date('24-08-1998', 'dd-mm-yyyy'), '?epan', 'Victoria', 4792, 'htrime99@nymag.com', 7187801358);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (392223508, 'Karissa', 'Polye', to_date('15-04-1927', 'dd-mm-yyyy'), 'Bantarsari Kulon', 'Banding', 89, 'kpolye9a@senate.gov', 9002158844);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (725176793, 'Karen', 'Gotter', to_date('28-08-2002', 'dd-mm-yyyy'), 'HuaPerson_IDian', 'Sundown', 37, 'kgotter9b@npr.org', 9539127699);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (927761034, 'Rabi', 'Simmen', to_date('25-09-1977', 'dd-mm-yyyy'), 'Odoyev', 'Ilene', 64, 'rsimmen9c@google.it', 6169805840);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (610907411, 'Moses', 'Aronovitz', to_date('23-11-1946', 'dd-mm-yyyy'), 'Shen?ao', 'Gale', 9, 'maronovitz9d@ow.ly', 3238577070);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (182111971, 'Sherlock', 'Mayling', to_date('26-10-1971', 'dd-mm-yyyy'), 'Rennes', 'Dorton', 5535, 'smayling9e@google.ca', 4058922857);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (721297891, 'Aloisia', 'Sweetzer', to_date('13-04-1988', 'dd-mm-yyyy'), 'Yangfang', 'Bluejay', 7898, 'asweetzer9f@phoca.cz', 4263080399);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (735626560, 'Baillie', 'Fills', to_date('14-08-1989', 'dd-mm-yyyy'), 'Yanshou', 'Artisan', 3831, 'bfills9g@nbcnews.com', 7738740643);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (613127663, 'Jermain', 'Manklow', to_date('27-05-1993', 'dd-mm-yyyy'), 'Ladysmith', 'Sunbrook', 3, 'jmanklow9h@com.com', 5908396944);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (443970722, 'Maxie', 'Sewall', to_date('31-12-1979', 'dd-mm-yyyy'), 'Unden', 'Valley Edge', 721, 'msewall9i@phoca.cz', 6062584724);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (811670082, 'Daune', 'Saberton', to_date('01-09-1935', 'dd-mm-yyyy'), 'Bantu', 'Brentwood', 38852, 'dsaberton9j@businessweek.com', 6139978107);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (153951230, 'Fulvia', 'Stoffers', to_date('04-02-1977', 'dd-mm-yyyy'), 'Czechowice-Dziedzice', 'Meadow Vale', 8006, 'fstoffers9k@usda.gov', 6018142881);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (403050636, 'Anabelle', 'Yonge', to_date('11-05-1930', 'dd-mm-yyyy'), 'Popay?n', 'North', 8, 'ayonge9l@marketwatch.com', 7339709096);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (183537357, 'Luther', 'Dashkovich', to_date('26-05-1953', 'dd-mm-yyyy'), 'Borino', 'Shasta', 8, 'ldashkovich9m@nydailynews.com', 6261623535);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (830941935, 'Junina', 'Apperley', to_date('10-02-1966', 'dd-mm-yyyy'), 'Chengxi', 'Bellgrove', 3, 'japperley9n@google.co.jp', 1793448125);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (375154552, 'Viva', 'Espie', to_date('28-07-1951', 'dd-mm-yyyy'), 'Zalesnoye', 'Orin', 63141, 'vespie9o@canalblog.com', 9511784161);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (738596862, 'Effie', 'Byrd', to_date('22-04-1927', 'dd-mm-yyyy'), 'Purabaya', 'Oak', 6, 'ebyrd9p@tripod.com', 4842900934);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (923811818, 'Thor', 'Kinnane', to_date('28-03-1996', 'dd-mm-yyyy'), 'Akhaltsikhe', 'Bluestem', 2298, 'tkinnane9q@addtoany.com', 6782368292);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (962827621, 'Sandie', 'Hotchkin', to_date('12-07-1947', 'dd-mm-yyyy'), 'Kasugai', 'Old Gate', 1, 'shotchkin9r@acquirethisname.com', 6513234278);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (856415343, 'Ed', 'Merrill', to_date('22-11-1989', 'dd-mm-yyyy'), 'Dushanbe', 'Harbort', 27565, 'emerrill9s@facebook.com', 9942956734);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (196382662, 'Elsey', 'Kleszinski', to_date('30-03-1980', 'dd-mm-yyyy'), 'Stockholm', 'Golden Leaf', 1, 'ekleszinski9t@bing.com', 6713753850);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (786496745, 'Laura', 'Aldine', to_date('22-05-1957', 'dd-mm-yyyy'), 'Ashk?sham', 'Twin Pines', 3780, 'laldine9u@yolasite.com', 5248163826);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (870513504, 'Bobina', 'Konerding', to_date('25-02-1996', 'dd-mm-yyyy'), 'Quetigny', 'Reinke', 57067, 'bkonerding9v@feedburner.com', 7044297405);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (250161276, 'Ashley', 'Morgue', to_date('13-04-1925', 'dd-mm-yyyy'), 'Zhongzi', 'Namekagon', 87565, 'amorgue9w@360.cn', 8575470418);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (455403379, 'Gun', 'Pinnion', to_date('13-09-1967', 'dd-mm-yyyy'), 'Hangkou', 'Lawn', 56524, 'gpinnion9x@csmonitor.com', 9172491435);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (835284851, 'Deeyn', 'Pyle', to_date('28-02-1946', 'dd-mm-yyyy'), 'Rajal Norte', 'Reinke', 8, 'dpyle9y@sciencedaily.com', 3617225309);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (451092501, 'Vere', 'Grioli', to_date('22-09-1960', 'dd-mm-yyyy'), 'Link?ping', 'Dryden', 3, 'vgriolia0@fema.gov', 9935487593);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (425058356, 'Alexia', 'Mould', to_date('09-01-1928', 'dd-mm-yyyy'), 'Chengui', 'Sachtjen', 7, 'amoulda1@huffingtonpost.com', 8319329979);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (763764233, 'Bronnie', 'Jirsa', to_date('31-08-1938', 'dd-mm-yyyy'), 'Los Charr?as', 'Armistice', 1038, 'bjirsaa2@archive.org', 5677277722);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (572285340, 'Zahara', 'McPaike', to_date('15-09-1972', 'dd-mm-yyyy'), 'Jequitinhonha', 'Mifflin', 4771, 'zmcpaikea3@naver.com', 6927568608);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (307865478, 'Melantha', 'Gyver', to_date('31-05-2007', 'dd-mm-yyyy'), 'Kawage', 'Eliot', 449, 'mgyvera4@answers.com', 6703635431);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (645800410, 'Dalston', 'Fishwick', to_date('20-04-1961', 'dd-mm-yyyy'), 'Siao', 'Monterey', 59985, 'dfishwicka5@mozilla.com', 8266877676);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (836251609, 'Eula', 'Timberlake', to_date('26-12-2001', 'dd-mm-yyyy'), 'Tsovazard', 'Alpine', 32, 'etimberlakea6@soup.io', 6539219815);
commit;
prompt 200 records committed...
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (296165656, 'Tirrell', 'Stiff', to_date('10-03-1951', 'dd-mm-yyyy'), 'Pregradnoye', 'Harper', 1, 'tstiffa7@marketwatch.com', 3241892864);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (816155341, 'Osgood', 'Innerstone', to_date('17-07-1981', 'dd-mm-yyyy'), 'P?tan', 'Dahle', 24751, 'oinnerstonea8@alibaba.com', 3071393644);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (955638737, 'Tulley', 'Clemenzi', to_date('29-05-1924', 'dd-mm-yyyy'), 'Syrostan', 'Declaration', 3069, 'tclemenzia9@epa.gov', 9668521786);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (992554869, 'Joyous', 'Drysdale', to_date('20-11-1959', 'dd-mm-yyyy'), 'San Jos?', 'Kim', 315, 'jdrysdaleaa@scientificamerican.com', 2359952439);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (194835218, 'Carolus', 'Hegden', to_date('22-01-2007', 'dd-mm-yyyy'), 'Bordeaux', 'Macpherson', 4101, 'chegdenab@goo.gl', 3573352488);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (725240443, 'Shaina', 'Beaves', to_date('03-01-1991', 'dd-mm-yyyy'), '?rt Khw?jah', 'Kinsman', 79, 'sbeavesac@xinhuanet.com', 5322891006);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (208588663, 'Liv', 'Duckhouse', to_date('28-08-1967', 'dd-mm-yyyy'), 'Iwye', 'Declaration', 618, 'lduckhousead@example.com', 7517217357);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (558026645, 'Yancey', 'Baldrick', to_date('12-08-1974', 'dd-mm-yyyy'), 'Guanta', 'Basil', 29762, 'ybaldrickae@163.com', 8856059865);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (831558139, 'Chiquia', 'O''Hear', to_date('07-06-2006', 'dd-mm-yyyy'), 'Kaffrine', 'Jana', 80, 'cohearaf@ucsd.edu', 6722723263);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (913311862, 'Bill', 'Rawsthorne', to_date('10-05-1957', 'dd-mm-yyyy'), 'Ashiya', 'SouthrPerson_IDge', 0, 'brawsthorneag@ca.gov', 6074002696);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (948133904, 'Gillan', 'Tiler', to_date('06-05-1989', 'dd-mm-yyyy'), 'Vailoatai', 'Jackson', 212, 'gtilerah@amazon.co.uk', 4379645319);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (936984007, 'Craig', 'Carsey', to_date('18-02-1987', 'dd-mm-yyyy'), 'Watuweri', 'Vera', 96, 'ccarseyai@wp.com', 1447173430);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (170042836, 'Ingelbert', 'Whinney', to_date('11-09-1972', 'dd-mm-yyyy'), 'Caijiapu', 'WestrPerson_IDge', 6555, 'iwhinneyaj@bbc.co.uk', 4797405168);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (646684699, 'Madelyn', 'Dockery', to_date('22-12-1963', 'dd-mm-yyyy'), 'Cran-Gevrier', 'North', 9755, 'mdockeryak@hugedomains.com', 3237220975);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (172274041, 'Carmina', 'Newbegin', to_date('18-05-1943', 'dd-mm-yyyy'), 'Alukama', 'Lindbergh', 21958, 'cnewbeginal@facebook.com', 5203164031);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (932610681, 'Florry', 'Micheau', to_date('16-02-1973', 'dd-mm-yyyy'), 'Porto Salvo', 'Johnson', 54032, 'fmicheauam@acquirethisname.com', 6686959929);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (379652390, 'Elizabet', 'Larwell', to_date('29-03-1964', 'dd-mm-yyyy'), 'Tirmiz', 'Memorial', 6, 'elarwellan@ifeng.com', 5998269399);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (726029513, 'Tiler', 'Colyer', to_date('18-05-1960', 'dd-mm-yyyy'), 'Botoh', 'New Castle', 7, 'tcolyerao@youtu.be', 4996542907);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (662635024, 'Vanna', 'Dowker', to_date('23-12-1986', 'dd-mm-yyyy'), 'Jiebu', 'Merchant', 986, 'vdowkerap@tmall.com', 5904712277);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (811411011, 'Jocelyne', 'Laphorn', to_date('02-07-1995', 'dd-mm-yyyy'), 'Ibaraki', 'Sommers', 93, 'jlaphornaq@usnews.com', 2353430855);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (463724524, 'Archy', 'Longmuir', to_date('26-11-1958', 'dd-mm-yyyy'), 'Otterburn Park', 'Doe Crossing', 8317, 'alongmuirar@rambler.ru', 3908968766);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (400352077, 'Arte', 'Zaczek', to_date('18-05-1951', 'dd-mm-yyyy'), 'Mojogajeh', 'American Ash', 78035, 'azaczekas@hostgator.com', 3878674177);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (610737497, 'Brynna', 'Edghinn', to_date('14-03-1929', 'dd-mm-yyyy'), 'Zhouzhuang', 'Tennyson', 2, 'bedghinnat@usgs.gov', 8381258218);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (398601481, 'Herculie', 'Vanyarkin', to_date('03-02-1994', 'dd-mm-yyyy'), 'Chicago', 'Brown', 63, 'hvanyarkinau@fema.gov', 6303061895);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (210963470, 'Natassia', 'Leebetter', to_date('11-05-1996', 'dd-mm-yyyy'), 'Maric?', 'Johnson', 17385, 'nleebetterav@globo.com', 2466105074);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (861440050, 'Dominique', 'Charlson', to_date('28-05-1974', 'dd-mm-yyyy'), 'Batsari', 'Corscot', 1, 'dcharlsonaw@dot.gov', 9348062438);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (607570811, 'Opalina', 'Mattsson', to_date('18-06-1995', 'dd-mm-yyyy'), 'Cicurug', 'Trailsway', 458, 'omattssonax@xing.com', 8061957686);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (774448110, 'Yule', 'Tilly', to_date('15-07-1995', 'dd-mm-yyyy'), 'Bremerhaven', '6th', 9722, 'ytillyay@utexas.edu', 6464358883);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (264615737, 'ToiboPerson_ID', 'Klink', to_date('21-11-1958', 'dd-mm-yyyy'), 'Yudai', 'Sloan', 3, 'tklinkaz@dion.ne.jp', 8683361413);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (696374837, 'Samson', 'Ferbrache', to_date('06-04-1939', 'dd-mm-yyyy'), 'Kut Chap', 'Nancy', 7, 'sferbracheb0@arizona.edu', 9357631615);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (709751915, 'Reinhard', 'Kibbey', to_date('24-03-1930', 'dd-mm-yyyy'), 'Cliza', 'RiversPerson_IDe', 45, 'rkibbeyb1@tuttocitta.it', 7081244270);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (670045074, 'Blake', 'Abrahamovitz', to_date('22-04-1992', 'dd-mm-yyyy'), 'S?o Gon?alo do Sapuca?', 'Bay', 0, 'babrahamovitzb2@ustream.tv', 1568703940);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (695020064, 'Elvera', 'Girtin', to_date('27-03-1951', 'dd-mm-yyyy'), 'Tlogoagung', 'Hoard', 0, 'egirtinb3@51.la', 6673319007);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (372751059, 'Kizzie', 'Clotworthy', to_date('25-09-1980', 'dd-mm-yyyy'), 'Bendo', 'International', 6, 'kclotworthyb4@myspace.com', 5784648161);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (637214817, 'Elga', 'McKearnen', to_date('30-03-2005', 'dd-mm-yyyy'), 'Ustynivka', 'Nobel', 8, 'emckearnenb5@bbb.org', 5431821981);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (325077153, 'Herschel', 'Williamson', to_date('16-06-1944', 'dd-mm-yyyy'), 'Ribeir?polis', 'Golf Course', 36793, 'hwilliamsonb6@mac.com', 7931581833);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (944654806, 'Nan', 'Corringham', to_date('26-06-2003', 'dd-mm-yyyy'), 'Requena', 'Northwestern', 41536, 'ncorringhamb7@time.com', 9802141368);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (490765532, 'Margaretha', 'Stirzaker', to_date('16-02-1972', 'dd-mm-yyyy'), 'Valpara?so', 'Anthes', 1, 'mstirzakerb8@51.la', 5406000188);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (838534272, 'Gordon', 'Bauman', to_date('24-04-1974', 'dd-mm-yyyy'), 'Maogou', 'Thackeray', 270, 'gbaumanb9@livejournal.com', 6526841794);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (823910760, 'Haskel', 'Faye', to_date('24-07-2002', 'dd-mm-yyyy'), '?a?inci', 'Hanson', 63, 'hfayeba@admin.ch', 8614353854);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (940410755, 'Edna', 'Lodo', to_date('08-12-1968', 'dd-mm-yyyy'), 'Wenhe', 'Trailsway', 0, 'elodobb@eventbrite.com', 4799633175);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (867765371, 'Clementine', 'Vignaux', to_date('31-01-1980', 'dd-mm-yyyy'), 'Akankpa', 'Bowman', 63326, 'cvignauxbc@baPerson_IDu.com', 8281391744);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (517199517, 'Florry', 'Braunds', to_date('14-05-1985', 'dd-mm-yyyy'), 'Rudong', 'Jay', 377, 'fbraundsbd@imdb.com', 4863298672);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (556099069, 'Carlo', 'Lunny', to_date('11-06-1957', 'dd-mm-yyyy'), 'Lajarik', 'Dahle', 33489, 'clunnybe@51.la', 7477650448);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (933857373, 'Bronny', 'Moral', to_date('07-10-1997', 'dd-mm-yyyy'), 'Hongwei', 'Loeprich', 96, 'bmoralbf@artisteer.com', 6775868772);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (496082620, 'Dolph', 'Hibling', to_date('21-11-1973', 'dd-mm-yyyy'), 'Cochabamba', 'Fieldstone', 2088, 'dhiblingbg@mysql.com', 7996757367);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (151674046, 'Ranee', 'Woollett', to_date('21-03-1937', 'dd-mm-yyyy'), 'Hagonoy', 'Spohn', 72, 'rwoollettbh@facebook.com', 7239878691);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (810251423, 'Jodi', 'Blonfield', to_date('06-09-1965', 'dd-mm-yyyy'), 'Nyala', 'Buena Vista', 4050, 'jblonfieldbi@amazon.co.uk', 4097229456);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (221358829, 'Donall', 'Berdale', to_date('30-11-1996', 'dd-mm-yyyy'), 'Salvacion', 'Briar Crest', 4607, 'dberdalebj@miibeian.gov.cn', 6694510675);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (837311276, 'Kelwin', 'Abby', to_date('20-10-1925', 'dd-mm-yyyy'), 'Noyon', 'Forest', 79442, 'kabbybk@clickbank.net', 2043434734);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (756961200, 'Lisha', 'Raymond', to_date('22-03-1925', 'dd-mm-yyyy'), 'Peukanbada', 'Sunfield', 2166, 'lraymond98@facebook.com', 2369884335);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (719859226, 'Mikaela', 'Bercher', to_date('25-01-1976', 'dd-mm-yyyy'), 'Przybor?w', '4th', 31682, 'mbercher2f@123-reg.co.uk', 5992884592);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (592049227, 'Corilla', 'Castanyer', to_date('01-06-1936', 'dd-mm-yyyy'), 'Bang Kaeo', 'Continental', 7769, 'ccastanyer2g@microsoft.com', 9048783825);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (844229081, 'Joann', 'Snelman', to_date('28-12-1984', 'dd-mm-yyyy'), 'Sintansin', 'Maryland', 90267, 'jsnelman2h@g.co', 7944615921);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (402413501, 'Cori', 'Scotchbrook', to_date('26-10-1982', 'dd-mm-yyyy'), 'Damulog', '8th', 2020, 'cscotchbrook2i@taobao.com', 4895389131);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (457655167, 'Vyky', 'Padkin', to_date('05-10-1944', 'dd-mm-yyyy'), 'Zarechnyy', 'Kipling', 9, 'vpadkin2j@themeforest.net', 7782977874);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (317285847, 'Wakefield', 'Perritt', to_date('23-04-1987', 'dd-mm-yyyy'), 'Z?tor', 'Hauk', 229, 'wperritt2k@psu.edu', 1378354892);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (454434252, 'Sherrie', 'Blinkhorn', to_date('13-08-1967', 'dd-mm-yyyy'), 'Zhongshu', 'Grasskamp', 20, 'sblinkhorn2l@tamu.edu', 5194223565);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (882145843, 'Brittaney', 'Brookwood', to_date('09-03-1954', 'dd-mm-yyyy'), 'Zhangdian', 'Karstens', 11, 'bbrookwood2m@soundcloud.com', 4494067908);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (975459822, 'Cecilius', 'Coltart', to_date('03-02-1951', 'dd-mm-yyyy'), 'Pakokku', 'Shopko', 503, 'ccoltart2n@google.com.au', 7708527871);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (119798937, 'Moise', 'Colebeck', to_date('18-01-2005', 'dd-mm-yyyy'), 'Balabac', 'Monica', 2, 'mcolebeck2o@wikia.com', 6159038669);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (543584585, 'Rae', 'Showler', to_date('23-09-1994', 'dd-mm-yyyy'), 'Karangjaladri', 'Hoffman', 1, 'rshowler2p@godaddy.com', 9273739664);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (126356435, 'Rodi', 'Cranstoun', to_date('11-04-1961', 'dd-mm-yyyy'), 'Matwa?', 'Hazelcrest', 8, 'rcranstoun2q@dyndns.org', 2419800689);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (783080526, 'Vanya', 'Merrien', to_date('16-02-1973', 'dd-mm-yyyy'), 'Kaynardzha', 'Hovde', 92, 'vmerrien2r@jiathis.com', 8445893909);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (235281661, 'Randene', 'Danniel', to_date('22-01-1940', 'dd-mm-yyyy'), 'Podu', 'Arkansas', 0, 'rdanniel2s@wired.com', 9018657358);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (121799050, 'Tabina', 'Gisborne', to_date('20-11-1925', 'dd-mm-yyyy'), 'Doujia', 'Karstens', 6, 'tgisborne2t@auda.org.au', 5656997714);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (375351719, 'Dom', 'Olifaunt', to_date('25-11-1963', 'dd-mm-yyyy'), 'Anding', 'Merry', 188, 'dolifaunt2u@craigslist.org', 5883027152);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (880022583, 'Jeddy', 'Trenfield', to_date('07-11-2002', 'dd-mm-yyyy'), 'Norzagaray', 'Mitchell', 79, 'jtrenfield2v@nationalgeographic.com', 7824084431);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (540043332, 'Monah', 'Sirey', to_date('23-07-1989', 'dd-mm-yyyy'), 'Lantian', 'Morning', 0, 'msirey2w@purevolume.com', 8571016109);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (457984284, 'Valentino', 'Puttick', to_date('27-12-1957', 'dd-mm-yyyy'), 'Gemblengmulyo', 'Prentice', 9855, 'vputtick2x@jalbum.net', 2945270244);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (373631073, 'Brendan', 'Comins', to_date('29-02-1996', 'dd-mm-yyyy'), 'Angers', 'Texas', 4634, 'bcomins2y@taobao.com', 6359674282);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (758646772, 'Mellie', 'Maslin', to_date('21-11-1958', 'dd-mm-yyyy'), 'Bagiktinggang', 'Erie', 930, 'mmaslin2z@dell.com', 4776113046);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (374025072, 'Kerstin', 'Candish', to_date('06-08-2004', 'dd-mm-yyyy'), 'Sm?landsstenar', 'Marcy', 11590, 'kcandish30@sun.com', 1827676670);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (562010577, 'Gertrudis', 'Abbots', to_date('27-09-1939', 'dd-mm-yyyy'), 'Bangilan', 'Scott', 9, 'gabbots31@apache.org', 2818521506);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (988576299, 'Leonhard', 'Manueau', to_date('05-11-1931', 'dd-mm-yyyy'), 'Pasuruan', 'Butterfield', 1723, 'lmanueau32@reddit.com', 8254661209);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (276176732, 'Reinwald', 'Saffin', to_date('23-04-1945', 'dd-mm-yyyy'), 'Berezayka', 'Roxbury', 62904, 'rsaffin33@t-online.de', 1593887273);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (556888328, 'Eryn', 'Parkisson', to_date('24-07-1949', 'dd-mm-yyyy'), 'Terrugem', 'Atwood', 58, 'eparkisson34@theatlantic.com', 5161550762);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (923766112, 'Prudy', 'Corrison', to_date('28-06-1969', 'dd-mm-yyyy'), 'Donghai', 'Brown', 5069, 'pcorrison35@mediafire.com', 9615109563);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (241957656, 'Jessi', 'Papez', to_date('21-10-1977', 'dd-mm-yyyy'), 'Shangping', 'Nova', 62, 'jpapez36@pen.io', 4253411691);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (496569875, 'Zilvia', 'Brecknock', to_date('03-09-1957', 'dd-mm-yyyy'), 'Shixian', 'Anderson', 3134, 'zbrecknock37@123-reg.co.uk', 4139264612);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (769542199, 'Lolly', 'Carnie', to_date('26-03-1972', 'dd-mm-yyyy'), 'Jianjun', 'Meadow Valley', 49, 'lcarnie38@narod.ru', 9594643873);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (558821746, 'Sibeal', 'Melville', to_date('13-05-1953', 'dd-mm-yyyy'), '?Ayn al Bay??', 'Redwing', 844, 'smelville39@opensource.org', 2612462660);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (408324895, 'Rubin', 'Krug', to_date('13-05-1942', 'dd-mm-yyyy'), 'Cibeuti', 'Harbort', 414, 'rkrug3a@google.it', 1194279514);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (787927993, 'Sheff', 'Duggary', to_date('18-08-2006', 'dd-mm-yyyy'), 'Vybor', 'Sommers', 5162, 'sduggary3b@imageshack.us', 4962691224);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (953151798, 'Kitty', 'Borth', to_date('23-12-1947', 'dd-mm-yyyy'), '?? T?h', 'Ilene', 6, 'kborth3c@npr.org', 6666654580);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (584791610, 'Gayleen', 'Tutchener', to_date('14-11-1927', 'dd-mm-yyyy'), 'Bar?o de S?o Miguel', 'Daystar', 90347, 'gtutchener3d@wp.com', 2512329746);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (511271917, 'Briney', 'Scrane', to_date('14-11-1959', 'dd-mm-yyyy'), 'Amherstburg', 'Hanover', 64, 'bscrane3e@theatlantic.com', 4457517729);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (256539670, 'Udall', 'McGlaud', to_date('13-08-1983', 'dd-mm-yyyy'), 'Oslomej', 'Stephen', 582, 'umcglaud3f@qq.com', 4953123054);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (812609164, 'Riccardo', 'Hazeldene', to_date('28-02-1969', 'dd-mm-yyyy'), 'V?emina', 'Pierstorff', 1181, 'rhazeldene3g@ifeng.com', 4427492955);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (372097171, 'Margo', 'Gostling', to_date('11-02-1976', 'dd-mm-yyyy'), 'Po???? nad S?zavou', 'Doe Crossing', 51837, 'mgostling3h@usa.gov', 4195230271);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (660886697, 'Andree', 'Geffe', to_date('22-11-1984', 'dd-mm-yyyy'), 'Ebute Ikorodu', 'Bunker Hill', 2351, 'ageffe3i@51.la', 7463617611);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (885971333, 'Ade', 'Mashro', to_date('18-07-1984', 'dd-mm-yyyy'), 'Katyuzhanka', 'Summerview', 96, 'amashro3j@typepad.com', 6292110816);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (692865868, 'Kacey', 'Pearlman', to_date('04-07-1947', 'dd-mm-yyyy'), 'Letovice', 'New Castle', 720, 'kpearlman3k@hp.com', 5009111376);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (753286200, 'Tarah', 'Blofeld', to_date('11-05-1996', 'dd-mm-yyyy'), 'Goascor?n', 'Sunbrook', 1506, 'tblofeld3l@gizmodo.com', 2189351822);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (572513020, 'Edsel', 'Fundell', to_date('21-06-1993', 'dd-mm-yyyy'), 'Angoul?me', 'Nobel', 0, 'efundell3m@naver.com', 5099270384);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (526237352, 'Scotty', 'Curnnokk', to_date('16-03-1934', 'dd-mm-yyyy'), 'Bachaquero', 'Buell', 50, 'scurnnokk3n@vimeo.com', 6251634250);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (571442515, 'Christoper', 'Rycroft', to_date('04-04-2000', 'dd-mm-yyyy'), 'Zemlyansk', 'Fordem', 71, 'crycroft3o@latimes.com', 5488607007);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (325527961, 'Stefan', 'Rove', to_date('24-02-1993', 'dd-mm-yyyy'), 'Xuebu', 'Almo', 67353, 'srove3p@sfgate.com', 7524277694);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (616052079, 'Drucill', 'Lakenden', to_date('07-04-2006', 'dd-mm-yyyy'), 'San Antonio', 'Sauthoff', 5142, 'dlakenden3q@so-net.ne.jp', 5432264879);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (557756293, 'Timi', 'Ainscow', to_date('08-04-1924', 'dd-mm-yyyy'), 'Al Mars?', 'Roth', 437, 'tainscow3r@home.pl', 6381123167);
commit;
prompt 300 records committed...
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (168520613, 'April', 'Fysh', to_date('18-04-1929', 'dd-mm-yyyy'), 'La Paz', 'ParksPerson_IDe', 5892, 'afysh3s@privacy.gov.au', 8065741156);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (620742770, 'Waylen', 'Coxwell', to_date('21-04-1970', 'dd-mm-yyyy'), 'Kalengwa', 'Thackeray', 4, 'wcoxwell3t@tuttocitta.it', 8429184429);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (246305254, 'Fara', 'Sydes', to_date('19-11-2002', 'dd-mm-yyyy'), 'N??any', 'Cascade', 20647, 'fsydes3u@facebook.com', 3685168729);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (570441676, 'Robbie', 'Grinaway', to_date('06-06-1992', 'dd-mm-yyyy'), 'San Jose', 'Pawling', 9, 'rgrinaway3v@flickr.com', 9432818503);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (920460836, 'Aggi', 'Cavy', to_date('06-01-2006', 'dd-mm-yyyy'), 'Sukhobuzimskoye', 'SouthrPerson_IDge', 89910, 'acavy3w@ameblo.jp', 9556509171);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (825772129, 'Alanson', 'Blazdell', to_date('23-09-1936', 'dd-mm-yyyy'), 'Ciseuseupan', 'Muir', 0, 'ablazdell3x@hexun.com', 7112067816);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (392633660, 'Pablo', 'McTear', to_date('15-06-1966', 'dd-mm-yyyy'), 'Y?n B?i', 'Doe Crossing', 61, 'pmctear3y@wunderground.com', 1862075872);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (282610851, 'Cecil', 'Habard', to_date('16-09-1948', 'dd-mm-yyyy'), 'Mekarsari', 'Summer RPerson_IDge', 83, 'chabard3z@alexa.com', 2839961290);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (703786319, 'Lorilyn', 'Ivanovic', to_date('08-04-1942', 'dd-mm-yyyy'), 'Krasnoznamensk', 'Leroy', 186, 'livanovic40@163.com', 6523228142);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (100171750, 'Mario', 'Deely', to_date('28-11-1956', 'dd-mm-yyyy'), 'Cuman?', 'Kensington', 406, 'mdeely41@tmall.com', 1024224146);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (939636403, 'Drucill', 'MacGrath', to_date('08-05-1968', 'dd-mm-yyyy'), 'Kuala Terengganu', 'Sugar', 6, 'dmacgrath42@dot.gov', 6185044384);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (584468952, 'Calla', 'Scorah', to_date('13-09-1956', 'dd-mm-yyyy'), 'El Paraiso', 'American', 590, 'cscorah43@netscape.com', 1225800216);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (104937452, 'Sollie', 'Pendreigh', to_date('13-08-1950', 'dd-mm-yyyy'), 'Batal', 'Clarendon', 4158, 'spendreigh44@google.com.br', 6551735136);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (348524922, 'Malorie', 'Henlon', to_date('10-10-2001', 'dd-mm-yyyy'), 'Ajasse Ipo', 'Tennyson', 4, 'mhenlon45@cbslocal.com', 8784210622);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (145376110, 'Martino', 'Dudson', to_date('03-10-1974', 'dd-mm-yyyy'), 'S?o Martinho', 'Miller', 9381, 'mdudson46@wikimedia.org', 4177717958);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (275393212, 'Waylen', 'McKniely', to_date('23-12-1949', 'dd-mm-yyyy'), 'Lianghe', 'Bay', 5, 'wmckniely47@lulu.com', 4897060595);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (194442862, 'FPerson_IDelio', 'Chamberlen', to_date('04-03-1933', 'dd-mm-yyyy'), 'Magtangol', 'Dayton', 2760, 'fchamberlen48@nba.com', 3384484809);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (847656702, 'Lucine', 'Alsop', to_date('06-10-1950', 'dd-mm-yyyy'), 'Lunao', 'Upham', 3, 'lalsop49@dedecms.com', 6324456136);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (920943612, 'Bryna', 'Fricker', to_date('21-05-1975', 'dd-mm-yyyy'), 'Tullinge', 'Summit', 741, 'bfricker4a@bravesites.com', 7855271366);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (289832097, 'Friedrich', 'Hainey`', to_date('26-09-1945', 'dd-mm-yyyy'), 'Villa Mercedes', 'Walton', 77, 'fhainey4b@fotki.com', 2999185175);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (552548536, 'Lyndel', 'Oldacre', to_date('25-08-2004', 'dd-mm-yyyy'), 'Bor?s', 'Straubel', 82, 'loldacre4c@dmoz.org', 2089045831);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (160062237, 'Aurel', 'Finicj', to_date('27-11-1927', 'dd-mm-yyyy'), 'Jialu', 'Ronald Regan', 178, 'afinicj4d@wikimedia.org', 7018218441);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (875272623, 'Godwin', 'Clynmans', to_date('06-10-1951', 'dd-mm-yyyy'), 'Xa?maz', 'Fairview', 2126, 'gclynmans4e@odnoklassniki.ru', 5263544567);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (720995190, 'Tova', 'Pullinger', to_date('08-04-1951', 'dd-mm-yyyy'), 'Leping', 'Merrick', 7, 'tpullinger4f@discuz.net', 7195993093);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (935524399, 'William', 'Beartup', to_date('22-12-1995', 'dd-mm-yyyy'), 'Dostoyevka', 'Schiller', 41536, 'wbeartup4g@creativecommons.org', 1103755348);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (840761695, 'Malissa', 'Hoffner', to_date('07-03-1995', 'dd-mm-yyyy'), 'Oebobo', '6th', 37671, 'mhoffner4h@miibeian.gov.cn', 2401517299);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (931203266, 'Wilek', 'Findlater', to_date('08-07-1945', 'dd-mm-yyyy'), 'Czarne', 'Pleasure', 7043, 'wfindlater4i@biglobe.ne.jp', 6648851210);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (487726448, 'Olenka', 'Kennerley', to_date('17-07-1969', 'dd-mm-yyyy'), 'Altenberg bei Linz', 'Garrison', 8, 'okennerley4j@ebay.com', 5181983498);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (378103171, 'Patrizio', 'Crocket', to_date('21-12-1971', 'dd-mm-yyyy'), 'Ichnya', '6th', 8491, 'pcrocket4k@microsoft.com', 1658481847);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (973326469, 'Rory', 'Dyet', to_date('21-02-1964', 'dd-mm-yyyy'), 'Debelets', 'Veith', 29042, 'rdyet4l@domainmarket.com', 2196453104);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (787378023, 'Nehemiah', 'BouldstrPerson_IDge', to_date('15-04-1991', 'dd-mm-yyyy'), 'Christchurch', 'Marquette', 2173, 'nbouldstrPerson_IDge4m@disqus.com', 1535526285);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (501348097, 'Ban', 'MacRierie', to_date('13-03-1972', 'dd-mm-yyyy'), 'N?a Pl?gia', 'Rowland', 321, 'bmacrierie4n@xrea.com', 6699147335);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (141837640, 'Clari', 'Rankling', to_date('09-06-1994', 'dd-mm-yyyy'), 'Antsiranana', 'South', 3729, 'crankling4o@google.ru', 9271309508);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (822240474, 'Maxy', 'Hadigate', to_date('21-07-1942', 'dd-mm-yyyy'), 'Praia da Barra', 'Di Loreto', 1, 'mhadigate2e@xinhuanet.com', 1872360787);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (666205340, 'Magdalen', 'Garard', to_date('24-10-2005', 'dd-mm-yyyy'), 'Bailingnao', 'John Wall', 27, 'mgarard4p@va.gov', 3425166513);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (438455310, 'Dani', 'Acomb', to_date('17-03-1932', 'dd-mm-yyyy'), 'Umbulan', 'Kedzie', 2, 'dacomb4q@blogger.com', 6809215408);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (309422947, 'Fee', 'Gonsalvo', to_date('02-08-1937', 'dd-mm-yyyy'), 'Le Chambon-Feugerolles', 'Coleman', 23, 'fgonsalvo4r@creativecommons.org', 6756034155);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (554350368, 'Ilka', 'ducarme', to_date('11-02-1927', 'dd-mm-yyyy'), 'Boucherville', 'SutterPerson_IDge', 4092, 'Person_IDucarme4s@nasa.gov', 6689155521);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (515674654, 'Lazaro', 'Bettenay', to_date('28-03-1966', 'dd-mm-yyyy'), 'Huangjin', 'CoolPerson_IDge', 7600, 'lbettenay4t@facebook.com', 7132639660);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (118520760, 'Glynn', 'Youde', to_date('16-05-1956', 'dd-mm-yyyy'), 'Yushu', 'Dexter', 90534, 'gyoude4u@angelfire.com', 4505876165);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (667027263, 'Rossy', 'Lackeye', to_date('24-10-1960', 'dd-mm-yyyy'), 'S?awoborze', 'Eagan', 45682, 'rlackeye4v@multiply.com', 2443105581);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (176771449, 'Renie', 'Lansdown', to_date('12-08-1941', 'dd-mm-yyyy'), 'Magnitka', 'Anzinger', 2531, 'rlansdown4w@nba.com', 8407235099);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (981055942, 'Adolphus', 'Cantor', to_date('17-02-1948', 'dd-mm-yyyy'), 'Palmas De Gran Canaria, Las', 'Goodland', 99, 'acantor4x@4shared.com', 8023011611);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (509662169, 'Theobald', 'Gillcrist', to_date('30-01-1962', 'dd-mm-yyyy'), 'Kushelevka', 'Kedzie', 645, 'tgillcrist4y@jugem.jp', 5309804574);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (741975218, 'Aimee', 'Bowland', to_date('25-08-1988', 'dd-mm-yyyy'), 'Alexandria', 'Pennsylvania', 29558, 'abowland4z@home.pl', 5719895995);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (194690926, 'Jeane', 'Seller', to_date('26-07-1931', 'dd-mm-yyyy'), 'Nauk??ni', 'Eggendart', 2786, 'jseller50@japanpost.jp', 9571184513);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (199129162, 'Phip', 'Drivers', to_date('17-08-1995', 'dd-mm-yyyy'), 'Maticmatic', 'Brentwood', 89, 'pdrivers51@psu.edu', 2852404192);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (205825700, 'Edmon', 'Gather', to_date('26-02-1982', 'dd-mm-yyyy'), 'Bagroy', 'Chive', 410, 'egather52@amazonaws.com', 3092001709);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (281169657, 'Odell', 'Flockhart', to_date('01-01-1980', 'dd-mm-yyyy'), 'Senador Pompeu', 'Melby', 64, 'oflockhart53@icq.com', 8394630737);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (213459388, 'Benn', 'Coulsen', to_date('20-07-1934', 'dd-mm-yyyy'), 'Lemahputih', 'Roxbury', 494, 'bcoulsen54@redcross.org', 7458703603);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (708105307, 'Linet', 'Nacey', to_date('06-11-1999', 'dd-mm-yyyy'), 'Tan Sum', 'Bunting', 75, 'lnacey55@wikia.com', 2724643373);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (582445416, 'Carling', 'Matkovic', to_date('28-11-1993', 'dd-mm-yyyy'), 'Umbulan', 'Stone Corner', 833, 'cmatkovic56@spiegel.de', 9795025041);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (175910686, 'Rodney', 'McAreavey', to_date('07-03-1948', 'dd-mm-yyyy'), '?l?m', 'Talmadge', 40923, 'rmcareavey57@devhub.com', 9445994911);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (194505717, 'Morganica', 'Race', to_date('06-11-1926', 'dd-mm-yyyy'), 'L?pas', 'Dawn', 2, 'mrace58@state.tx.us', 1302746172);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (648466322, 'Erroll', 'Hendin', to_date('16-07-1999', 'dd-mm-yyyy'), 'Kedungtulup', 'Dennis', 624, 'ehendin59@spotify.com', 2779657994);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (317822031, 'Aggie', 'Kingerby', to_date('31-08-1966', 'dd-mm-yyyy'), 'Karagach', 'Rutledge', 87016, 'akingerby5a@china.com.cn', 7968023192);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (447040488, 'Davis', 'Geertje', to_date('02-05-1961', 'dd-mm-yyyy'), 'General Luna', 'Hoepker', 7, 'dgeertje5b@mapy.cz', 5781449308);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (559165794, 'Mildred', 'Drewet', to_date('22-04-1994', 'dd-mm-yyyy'), 'Su?oszowa', 'Longview', 447, 'mdrewet5c@behance.net', 9053508993);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (439643727, 'Vivia', 'Kingcote', to_date('29-10-1944', 'dd-mm-yyyy'), 'Bellevue', 'Heffernan', 29536, 'vkingcote5d@com.com', 4253831856);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (123599375, 'Garrick', 'O''Dea', to_date('29-09-1984', 'dd-mm-yyyy'), 'Huangshi', 'Melvin', 46666, 'godea5e@sphinn.com', 8319180463);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (245348975, 'Penn', 'Livsey', to_date('29-04-1971', 'dd-mm-yyyy'), 'Tuanshansi', 'Ronald Regan', 2, 'plivsey5f@scribd.com', 8959927164);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (696983605, 'Oralee', 'Akhurst', to_date('25-11-1954', 'dd-mm-yyyy'), 'Bogojevo', 'Bartelt', 7, 'oakhurst5g@yahoo.co.jp', 5096687913);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (698587684, 'Ninetta', 'Levensky', to_date('03-12-1997', 'dd-mm-yyyy'), 'D?evohostice', 'Fairview', 7, 'nlevensky5h@nyu.edu', 4944674308);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (144642188, 'Kurt', 'Poker', to_date('31-05-2002', 'dd-mm-yyyy'), 'Los Santos', 'Russell', 7497, 'kpoker5i@ox.ac.uk', 8663224823);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (924964324, 'Yasmin', 'Kynett', to_date('10-06-1945', 'dd-mm-yyyy'), 'Garanhuns', 'Arizona', 44, 'ykynett5j@intel.com', 4926368302);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (162220250, 'Maxie', 'Brock', to_date('11-02-1953', 'dd-mm-yyyy'), 'Pasireurih', 'Gerald', 61, 'mbrock5k@moonfruit.com', 9709723849);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (851470156, 'Lilli', 'Moncreiffe', to_date('26-11-1974', 'dd-mm-yyyy'), 'Anse ? Galets', 'SutterPerson_IDge', 675, 'lmoncreiffe5l@pbs.org', 7203376930);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (474421059, 'Fenelia', 'Parffrey', to_date('25-03-1966', 'dd-mm-yyyy'), 'Garanhuns', 'Maywood', 8300, 'fparffrey5m@twitter.com', 3567626837);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (492316527, 'Cristian', 'Dressel', to_date('15-08-1978', 'dd-mm-yyyy'), 'Sandymount', 'Lakewood', 9611, 'cdressel5n@soup.io', 6673188258);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (914334290, 'Mahala', 'Sharpin', to_date('31-03-1993', 'dd-mm-yyyy'), 'Yamaranguila', 'International', 359, 'msharpin5o@wired.com', 6154370207);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (918096886, 'Heindrick', 'Wickersley', to_date('02-12-1981', 'dd-mm-yyyy'), 'Ny?regyh?za', 'Grover', 973, 'hwickersley5p@yelp.com', 9852335523);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (382781490, 'Quinta', 'Tieman', to_date('13-12-1942', 'dd-mm-yyyy'), 'Derbent', 'Reindahl', 80550, 'qtieman5q@whitehouse.gov', 9963271714);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (596818423, 'Cristal', 'Mc Andrew', to_date('03-12-1946', 'dd-mm-yyyy'), 'H?nefoss', 'Calypso', 1, 'cmcandrew5r@paypal.com', 2717106596);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (959338316, 'Yasmeen', 'Kuban', to_date('13-12-1988', 'dd-mm-yyyy'), 'Kotel?niki', 'Scoville', 6, 'ykuban5s@usa.gov', 8617560214);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (773115408, 'Obediah', 'Perkinson', to_date('07-02-1971', 'dd-mm-yyyy'), 'Li?an', 'Mitchell', 88, 'operkinson5t@moonfruit.com', 2605977637);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (977191746, 'Torie', 'Dumper', to_date('18-06-1998', 'dd-mm-yyyy'), 'Sussex', 'Eagle Crest', 57, 'tdumper5u@merriam-webster.com', 2844241549);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (799006955, 'Merralee', 'Harsent', to_date('07-06-2004', 'dd-mm-yyyy'), 'Parrita', 'Loftsgordon', 6, 'mharsent5v@intel.com', 4636606711);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (907256920, 'Travis', 'May', to_date('30-04-1982', 'dd-mm-yyyy'), 'Sambongpari', 'Stoughton', 6, 'tmay5w@tripod.com', 5044331707);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (957557141, 'Halley', 'Bythway', to_date('03-03-1965', 'dd-mm-yyyy'), 'Apa?e', 'Dunning', 20, 'hbythway5x@eventbrite.com', 6046525827);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (539551740, 'Avery', 'Delicate', to_date('23-06-1980', 'dd-mm-yyyy'), 'Diavat?s', 'Eastwood', 4, 'adelicate5y@cpanel.net', 3962657849);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (170243739, 'Anthea', 'Kurton', to_date('25-04-1968', 'dd-mm-yyyy'), 'Shuangyang', 'Raven', 138, 'akurton5z@nymag.com', 3485678173);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (264728817, 'Indira', 'Howett', to_date('02-12-1953', 'dd-mm-yyyy'), 'Hroch?v T?nec', 'Fuller', 2, 'ihowett60@addtoany.com', 1566823865);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (883043356, 'Edward', 'Castan', to_date('26-03-1959', 'dd-mm-yyyy'), 'Dmitriyevka', 'Clove', 64, 'ecastan61@nasa.gov', 2593630531);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (776564831, 'Scarlett', 'Dietsche', to_date('01-09-1952', 'dd-mm-yyyy'), 'Ouangani', 'Valley Edge', 568, 'sdietsche62@edublogs.org', 2208533327);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (764787755, 'Leopold', 'Szymonowicz', to_date('01-07-1967', 'dd-mm-yyyy'), 'Xilanqi', 'Summerview', 33096, 'lszymonowicz63@cam.ac.uk', 1059436119);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (785455181, 'Hazlett', 'Packman', to_date('06-01-1978', 'dd-mm-yyyy'), 'Sokolovyy', 'Dexter', 8572, 'hpackman64@mozilla.com', 1045047258);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (967021982, 'Cynthie', 'Deekes', to_date('08-05-1991', 'dd-mm-yyyy'), 'Ventanas', 'Green RPerson_IDge', 163, 'cdeekes65@photobucket.com', 9767967919);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (631847604, 'Andres', 'Dysart', to_date('30-07-1992', 'dd-mm-yyyy'), 'El Plan', 'Sauthoff', 4917, 'adysart66@apache.org', 8295786332);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (178726838, 'Kerry', 'Ortiger', to_date('07-09-1954', 'dd-mm-yyyy'), '?awall?', 'Troy', 4820, 'kortiger67@mysql.com', 1308377544);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (402379540, 'Miguela', 'Cantillon', to_date('23-02-1952', 'dd-mm-yyyy'), 'Mueang Suang', 'Scofield', 198, 'mcantillon68@scribd.com', 2019451264);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (583024899, 'Hieronymus', 'Chisman', to_date('09-03-1960', 'dd-mm-yyyy'), 'Salt Lake City', 'Little Fleur', 90177, 'hchisman69@rambler.ru', 8014446228);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (565571169, 'Bryant', 'Katte', to_date('22-03-1989', 'dd-mm-yyyy'), 'Ngantru', 'SouthrPerson_IDge', 25, 'bkatte6a@people.com.cn', 3624876076);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (716184718, 'Ezequiel', 'Arnke', to_date('28-05-1933', 'dd-mm-yyyy'), 'Baomin', 'Esker', 4, 'earnke6b@mysql.com', 6561943785);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (775393164, 'Ag', 'Le Grice', to_date('10-11-1982', 'dd-mm-yyyy'), 'Tanjungkerta', 'Harper', 1352, 'alegrice6c@thetimes.co.uk', 2591855562);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (433213790, 'Deni', 'Escritt', to_date('03-02-2003', 'dd-mm-yyyy'), 'La Charit?-sur-Loire', 'Marquette', 660, 'descritt6d@youtube.com', 1266089424);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (542004169, 'Gail', 'Kilban', to_date('15-01-1927', 'dd-mm-yyyy'), 'Banisilan', 'Marcy', 10706, 'gkilban6e@github.io', 8341346947);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (373839373, 'Tracee', 'Brogini', to_date('13-07-1962', 'dd-mm-yyyy'), 'Yushugou', 'Eggendart', 69516, 'tbrogini6f@ameblo.jp', 6779415625);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (637966728, 'Mathias', 'Kingswood', to_date('29-08-1966', 'dd-mm-yyyy'), 'Flores da Cunha', 'Merry', 62, 'mkingswood6g@examiner.com', 2704846113);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (617803786, 'Reena', 'Peyes', to_date('02-09-1961', 'dd-mm-yyyy'), 'Sedan', 'Lunder', 9989, 'rpeyes6h@blogs.com', 2373725423);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (200589852, 'Sly', 'Sheran', to_date('29-03-1965', 'dd-mm-yyyy'), 'Norrk?ping', 'Columbus', 50757, 'ssheran6i@biblegateway.com', 3888125383);
commit;
prompt 400 records committed...
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (922428251, 'Lindi', 'Bollam', to_date('05-08-1976', 'dd-mm-yyyy'), 'Mojocoya', 'Spenser', 3, 'lbollam6j@dedecms.com', 5235859280);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (595283787, 'Danica', 'Reubbens', to_date('23-12-1953', 'dd-mm-yyyy'), 'Pojan', 'Garrison', 216, 'dreubbens6k@tuttocitta.it', 5289199777);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (597219131, 'Harwilll', 'Sumnall', to_date('18-10-2001', 'dd-mm-yyyy'), 'Lanckorona', 'Homewood', 67, 'hsumnall6l@guardian.co.uk', 3891281232);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (641170597, 'Napoleon', 'Harries', to_date('21-10-1977', 'dd-mm-yyyy'), 'Liverpool', 'Dapin', 96, 'nharries6m@smugmug.com', 4145469897);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (208612657, 'Marcelline', 'Goatcher', to_date('05-04-1927', 'dd-mm-yyyy'), 'El Mirador', 'Nelson', 0, 'mgoatcher6n@example.com', 4774124019);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (527655639, 'Gaile', 'Manueau', to_date('08-04-1970', 'dd-mm-yyyy'), 'Prengtale', 'Village Green', 6, 'gmanueau6o@addthis.com', 3697696393);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (250146889, 'Shane', 'Hazeman', to_date('18-05-1953', 'dd-mm-yyyy'), 'Villa Nueva', 'Warner', 4267, 'shazeman6p@squPerson_IDoo.com', 8526043566);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (283643146, 'Marlo', 'Eggle', to_date('16-02-1978', 'dd-mm-yyyy'), 'Pasiripis', 'Helena', 35895, 'meggle6q@marketwatch.com', 5973919472);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (942622933, 'Terence', 'Durling', to_date('07-03-2001', 'dd-mm-yyyy'), 'Anren Chengguanzhen', 'Dawn', 9, 'tdurling6r@webs.com', 2251181509);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (129756457, 'Zsa zsa', 'Knappe', to_date('27-12-1970', 'dd-mm-yyyy'), 'Watulabara', 'Jackson', 448, 'zknappe6s@oakley.com', 1924076062);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (744557849, 'Melanie', 'Cassella', to_date('18-02-1954', 'dd-mm-yyyy'), 'Bejsce', 'Stone Corner', 6, 'mcassella6t@wikia.com', 4146302395);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (626464892, 'Ingelbert', 'Senechault', to_date('05-10-1984', 'dd-mm-yyyy'), 'Pingding', 'Warner', 69, 'isenechault6u@ucoz.com', 1778408415);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (145389736, 'Ly', 'Levy', to_date('28-04-1975', 'dd-mm-yyyy'), 'Orenburg', 'Summit', 835, 'llevy6v@fda.gov', 9396003806);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (608510484, 'Joaquin', 'Wells', to_date('24-10-1982', 'dd-mm-yyyy'), 'Taiyigong', 'Lien', 3899, 'jwells6w@infoseek.co.jp', 7894667630);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (148778614, 'Gerty', 'Flockhart', to_date('30-09-2006', 'dd-mm-yyyy'), 'Ngozi', 'Harbort', 81937, 'gflockhart6x@narod.ru', 2995259024);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (253406712, 'Bryan', 'Heffron', to_date('28-02-1970', 'dd-mm-yyyy'), 'Mesa', 'Little Fleur', 98707, 'bheffron6y@mtv.com', 6023207674);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (426365238, 'Magdalen', 'Nestle', to_date('23-04-1997', 'dd-mm-yyyy'), 'Tulaghi', 'WestrPerson_IDge', 2, 'mnestlebl@umn.edu', 9034753304);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (124888863, 'Nydia', 'Piggens', to_date('29-04-1944', 'dd-mm-yyyy'), 'Guanzhuang', 'Dawn', 0, 'npiggensbm@bravesites.com', 5145038751);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (200281225, 'Laughton', 'Gringley', to_date('23-08-1981', 'dd-mm-yyyy'), 'Samburat', 'Petterle', 72, 'lgringleybn@weebly.com', 9079493566);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (428261058, 'Sherill', 'Percifer', to_date('22-02-1951', 'dd-mm-yyyy'), 'Shuigou?ao', 'Gale', 8344, 'sperciferbo@yale.edu', 4462230226);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (453477723, 'Kerrie', 'O''Crigane', to_date('14-11-1932', 'dd-mm-yyyy'), 'Balogo', 'Quincy', 3, 'kocriganebp@chron.com', 8235278745);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (302400433, 'Wendeline', 'De Few', to_date('16-07-1999', 'dd-mm-yyyy'), 'Yankou', 'Cardinal', 5835, 'wdefewbq@psu.edu', 6073330071);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (679393117, 'Hans', 'Lembrick', to_date('18-04-1992', 'dd-mm-yyyy'), 'Wang Sai Phun', 'Crescent Oaks', 8, 'hlembrickbr@weather.com', 7002949418);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (189643742, 'Trumaine', 'Smillie', to_date('31-07-2002', 'dd-mm-yyyy'), 'Corumb?', 'Monument', 3, 'tsmilliebs@xing.com', 3848505106);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (222410846, 'Etta', 'Mooring', to_date('26-02-1958', 'dd-mm-yyyy'), 'San Cristobal', 'BaysPerson_IDe', 87, 'emooringbt@ycombinator.com', 5744014688);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (807686151, 'Risa', 'Manicom', to_date('18-09-1929', 'dd-mm-yyyy'), 'Snizhne', 'Loeprich', 0, 'rmanicombu@mozilla.com', 6156361247);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (758061612, 'Donny', 'Loweth', to_date('01-01-1987', 'dd-mm-yyyy'), 'Rosso', 'Dovetail', 4, 'dlowethbv@intel.com', 9267020520);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (317838008, 'Wait', 'Southwick', to_date('11-09-1962', 'dd-mm-yyyy'), 'Pirassununga', 'Hanson', 19226, 'wsouthwickbw@whitehouse.gov', 1806224286);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (558220660, 'Selena', 'Cheney', to_date('09-01-1969', 'dd-mm-yyyy'), 'Marau', 'Kim', 0, 'scheneybx@google.ca', 4474736158);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (364757858, 'Eliot', 'Lathwood', to_date('02-02-1942', 'dd-mm-yyyy'), 'Haishan', 'Namekagon', 904, 'elathwoodby@dmoz.org', 8811351370);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (853017499, 'Koralle', 'Clemon', to_date('10-02-1991', 'dd-mm-yyyy'), 'T?m Vu', 'Leroy', 7855, 'kclemonbz@tripadvisor.com', 1755351838);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (495997339, 'Cathyleen', 'Costi', to_date('06-06-1982', 'dd-mm-yyyy'), 'Bandaran', 'Chinook', 72246, 'ccostic0@tinyurl.com', 8617833468);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (500056959, 'Franny', 'Daniels', to_date('11-11-1927', 'dd-mm-yyyy'), 'Oslo', 'Warbler', 422, 'fdanielsc1@1und1.de', 3772567816);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (777648477, 'Lee', 'Kinzett', to_date('15-11-1947', 'dd-mm-yyyy'), 'Marm?rion', 'Moulton', 42391, 'lkinzettc2@timesonline.co.uk', 5972007155);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (534848455, 'Almeta', 'Pratte', to_date('10-06-1943', 'dd-mm-yyyy'), 'Perz?w', 'CambrPerson_IDge', 8610, 'aprattec3@jiathis.com', 8478805004);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (639106141, 'Valentin', 'Densham', to_date('07-06-1944', 'dd-mm-yyyy'), 'Mikhaylovskoye', 'Moland', 0, 'vdenshamc4@rambler.ru', 1681815841);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (698757041, 'Lynnea', 'Dayment', to_date('23-03-1997', 'dd-mm-yyyy'), 'Xinxu', 'Nova', 13, 'ldaymentc5@nature.com', 3153351355);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (548962651, 'Gwendolyn', 'Haugg', to_date('21-09-1989', 'dd-mm-yyyy'), 'Gangsha', 'Hollow RPerson_IDge', 9331, 'ghauggc6@goodreads.com', 9852583804);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (700069359, 'Carolyn', 'Roughley', to_date('20-09-1957', 'dd-mm-yyyy'), 'Gary', 'Oak', 769, 'croughleyc7@opera.com', 2199195449);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (730016698, 'Carolee', 'Tatlowe', to_date('06-05-1945', 'dd-mm-yyyy'), 'Argotirto Krajan', 'Mesta', 24, 'ctatlowec8@parallels.com', 1908793401);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (503031840, 'Porter', 'Ewin', to_date('17-03-1938', 'dd-mm-yyyy'), 'Chencun', 'Boyd', 6127, 'pewinc9@state.gov', 4448054153);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (943746739, 'Gerta', 'Champkin', to_date('02-03-1990', 'dd-mm-yyyy'), 'Bradashesh', 'Holmberg', 4057, 'gchampkinca@goodreads.com', 3467974807);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (568212072, 'Rudolf', 'Vango', to_date('18-12-1948', 'dd-mm-yyyy'), 'Z?rich', 'Summerview', 5749, 'rvangocb@skyrock.com', 1477086301);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (601180013, 'Roosevelt', 'Dunbobbin', to_date('06-12-1957', 'dd-mm-yyyy'), 'Czy?owice', 'Quincy', 365, 'rdunbobbincc@lulu.com', 2983445777);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (441448733, 'Amanda', 'Deevey', to_date('30-09-1962', 'dd-mm-yyyy'), 'Person_IDenao', 'Northland', 163, 'adeeveycd@hhs.gov', 8719015081);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (330031171, 'Wilt', 'Bimrose', to_date('02-04-1925', 'dd-mm-yyyy'), 'Paitan Norte', 'Bowman', 61, 'wbimrosece@fotki.com', 3115462958);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (728518500, 'Chrystal', 'Fawks', to_date('04-01-1963', 'dd-mm-yyyy'), 'Lindavista', 'Cottonwood', 31, 'cfawkscf@princeton.edu', 4012767416);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (178906385, 'Isac', 'Arblaster', to_date('24-04-1966', 'dd-mm-yyyy'), 'Taivalkoski', 'Anniversary', 39986, 'iarblastercg@myspace.com', 9533357372);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (921188608, 'Dore', 'Senett', to_date('09-03-1964', 'dd-mm-yyyy'), 'Shaowu', 'Grover', 52350, 'dsenettch@seattletimes.com', 9781774547);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (767094858, 'Olvan', 'Rainton', to_date('17-10-1926', 'dd-mm-yyyy'), 'Nanterre', 'Farmco', 6501, 'oraintonci@go.com', 4117589840);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (915122110, 'Peder', 'McGirl', to_date('24-08-2002', 'dd-mm-yyyy'), 'Sumberrejo', 'Anniversary', 2, 'pmcgirlcj@fc2.com', 8512932030);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (904929173, 'Yvor', 'Gaylard', to_date('26-08-1985', 'dd-mm-yyyy'), 'Kovrov', 'Lotheville', 193, 'ygaylardck@ustream.tv', 1569127975);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (336348974, 'Blakeley', 'Tennewell', to_date('17-02-1983', 'dd-mm-yyyy'), 'Opol', 'Atwood', 88, 'btennewellcl@bbb.org', 8745881450);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (378682852, 'Leonore', 'Popham', to_date('23-09-1934', 'dd-mm-yyyy'), 'Aksu', 'Cody', 4, 'lpophamcm@goodreads.com', 1123665663);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (934662057, 'Revkah', 'Tolomelli', to_date('10-01-1928', 'dd-mm-yyyy'), 'Stockholm', 'John Wall', 27863, 'rtolomellicn@usa.gov', 1995488755);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (188014768, 'Shawn', 'Bolden', to_date('18-01-1965', 'dd-mm-yyyy'), 'Ban Thaen', 'Mayfield', 11509, 'sboldenco@wikispaces.com', 4456885991);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (544043768, 'Berri', 'MacDwyer', to_date('21-12-1948', 'dd-mm-yyyy'), 'Cergy-Pontoise', 'Weeping Birch', 3289, 'bmacdwyercp@amazon.com', 9337572725);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (648883310, 'Dannie', 'Storror', to_date('02-07-1939', 'dd-mm-yyyy'), 'Currais', 'Banding', 667, 'dstorrorcq@usatoday.com', 6483874173);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (715945176, 'Christophorus', 'Keatley', to_date('15-12-1995', 'dd-mm-yyyy'), 'Bojong', 'Farragut', 521, 'ckeatleycr@1und1.de', 8279954988);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (317827346, 'Ruthe', 'Stobart', to_date('04-03-1997', 'dd-mm-yyyy'), 'Rog??no', 'Jenna', 432, 'rstobartcs@discovery.com', 9624620702);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (491367469, 'Sena', 'Turmell', to_date('18-05-2000', 'dd-mm-yyyy'), 'Los Tangos', 'Lukken', 14, 'sturmellct@twitpic.com', 8452657823);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (358572361, 'Kellby', 'Joret', to_date('12-08-1996', 'dd-mm-yyyy'), 'Th? Tr?n H? Trung', '8th', 554, 'kjoretcu@purevolume.com', 3832020571);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (594211402, 'Suzi', 'Coddrington', to_date('07-11-1979', 'dd-mm-yyyy'), 'Sesheke', 'South', 7, 'scoddringtoncv@jalbum.net', 3173582619);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (610960397, 'Artus', 'Summerley', to_date('01-09-2004', 'dd-mm-yyyy'), 'Chengzhai', 'Blue Bill Park', 867, 'asummerleycx@techcrunch.com', 6422882633);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (656950868, 'Jobyna', 'Ransbury', to_date('29-05-1931', 'dd-mm-yyyy'), 'Kapan', 'Di Loreto', 8825, 'jransburycy@cpanel.net', 2449084718);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (405114344, 'Quintina', 'Rubbens', to_date('13-07-1933', 'dd-mm-yyyy'), 'Washington', 'Bowman', 9347, 'qrubbenscz@flavors.me', 2024457315);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (955659426, 'Tyne', 'Krates', to_date('15-09-1938', 'dd-mm-yyyy'), 'Me?giew', 'Waubesa', 7694, 'tkratesd0@ted.com', 3519150893);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (236372769, 'Rubia', 'Noar', to_date('04-05-1984', 'dd-mm-yyyy'), 'Bondo', 'Iowa', 2, 'rnoard1@alibaba.com', 5539431274);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (770792852, 'Karin', 'Hargrove', to_date('21-09-1983', 'dd-mm-yyyy'), 'Xingtan', 'Gerald', 52367, 'khargroved2@dyndns.org', 2405147645);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (721397520, 'Saree', 'Dredge', to_date('21-08-1994', 'dd-mm-yyyy'), 'Hamanoichi', 'Bobwhite', 37911, 'sdredged3@harvard.edu', 8508384863);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (662847896, 'Linnie', 'Petren', to_date('10-10-1998', 'dd-mm-yyyy'), 'Pomahan', 'Merry', 9509, 'lpetrend4@google.co.jp', 8911334688);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (109491053, 'Alwyn', 'Fynan', to_date('03-10-1956', 'dd-mm-yyyy'), 'Zhongba', 'Jenna', 7, 'afynand5@ox.ac.uk', 1649001049);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (299788152, 'Amye', 'Willeson', to_date('05-04-1931', 'dd-mm-yyyy'), 'Sumberan', 'Maywood', 9485, 'awillesond6@epa.gov', 2602396255);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (537375804, 'Luce', 'Curgenven', to_date('30-05-1955', 'dd-mm-yyyy'), 'Chunjing', 'Northfield', 238, 'lcurgenvend7@simplemachines.org', 1236389803);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (792670982, 'Jillana', 'Isenor', to_date('08-10-1993', 'dd-mm-yyyy'), 'Palma De Mallorca', 'Fisk', 3, 'jisenord8@unblog.fr', 3721812359);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (891325545, 'Kristy', 'Ramsier', to_date('29-12-1952', 'dd-mm-yyyy'), 'Biguo', 'School', 2, 'kramsierd9@rambler.ru', 1569684018);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (873682714, 'Martguerita', 'Skahill', to_date('23-01-1931', 'dd-mm-yyyy'), 'Blantyre', 'Express', 9, 'mskahillda@youtube.com', 4191774590);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (703260999, 'Danielle', 'Thornber', to_date('29-04-1948', 'dd-mm-yyyy'), 'Armenta', 'Hayes', 5756, 'dthornberdb@bloglovin.com', 6855620941);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (800480327, 'FPerson_IDelity', 'Tampen', to_date('16-11-1962', 'dd-mm-yyyy'), 'Nova Igua?u', 'Rowland', 710, 'ftampendc@friendfeed.com', 6603444543);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (218057742, 'Scott', 'Luppitt', to_date('04-06-1987', 'dd-mm-yyyy'), 'Bordeaux', 'Buena Vista', 8145, 'sluppittdd@unicef.org', 2963047563);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (792537826, 'Cathleen', 'Baldocci', to_date('28-05-1930', 'dd-mm-yyyy'), 'Kuala Terengganu', 'Judy', 59, 'cbaldoccPerson_IDe@mysql.com', 3054831734);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (492752692, 'Jourdan', 'Mutton', to_date('10-02-1976', 'dd-mm-yyyy'), 'Zhongpai', 'SherPerson_IDan', 77156, 'jmuttondf@zdnet.com', 6424472428);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (965940603, 'Nappie', 'Eland', to_date('29-10-1956', 'dd-mm-yyyy'), 'Satipo', 'Shasta', 1, 'nelanddg@4shared.com', 8994396508);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (624127356, 'Maybelle', 'Scholey', to_date('29-04-1977', 'dd-mm-yyyy'), 'Lujiao', 'Di Loreto', 23872, 'mscholeydh@skyrock.com', 2719581902);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (208738794, 'Darrick', 'Fellini', to_date('12-10-1936', 'dd-mm-yyyy'), 'Bendo', 'Bowman', 19, 'dfellinPerson_IDi@theatlantic.com', 3409497164);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (353251821, 'Ricky', 'Stothert', to_date('16-05-1947', 'dd-mm-yyyy'), 'El Hamma', 'Old Gate', 1, 'rstothertdj@zimbio.com', 5927390037);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (166246954, 'Vicki', 'Spohr', to_date('09-10-1960', 'dd-mm-yyyy'), 'Wulijie', 'Burrows', 631, 'vspohrdk@archive.org', 9866500502);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (119196872, 'Margalo', 'Bellwood', to_date('27-07-1947', 'dd-mm-yyyy'), 'Gimo', 'Waubesa', 1, 'mbellwooddl@sourceforge.net', 3888218098);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (834466751, 'Simmonds', 'Helks', to_date('30-12-1984', 'dd-mm-yyyy'), 'Kashmor', 'Laurel', 37926, 'shelksdm@twitpic.com', 7052423093);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (117293621, 'Dorie', 'Mityashin', to_date('23-01-1985', 'dd-mm-yyyy'), 'Santa Rosa', 'Dryden', 42, 'dmityashindn@howstuffworks.com', 1781371216);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (264816972, 'Lizbeth', 'Burgan', to_date('25-10-1973', 'dd-mm-yyyy'), 'White Rock', 'Loeprich', 9331, 'lburgando@oracle.com', 8666321865);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (375506538, 'Torrey', 'McIlvaney', to_date('08-07-1955', 'dd-mm-yyyy'), 'Metchosin', 'Glendale', 182, 'tmcilvaneydp@g.co', 1428920698);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (950034758, 'Donni', 'Gerrie', to_date('17-02-1972', 'dd-mm-yyyy'), 'Adtugan', 'Milwaukee', 1871, 'dgerriedq@pinterest.com', 4124588584);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (158277278, 'Phaedra', 'Bannister', to_date('12-12-1988', 'dd-mm-yyyy'), 'Lokea', 'Express', 958, 'pbannisterdr@quantcast.com', 3954411542);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (237832955, 'Cherish', 'Entissle', to_date('02-06-1988', 'dd-mm-yyyy'), 'V?rzea da Palma', 'Eggendart', 2775, 'centissleds@plala.or.jp', 2119640816);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (610286655, 'Angel', 'Story', to_date('31-08-1950', 'dd-mm-yyyy'), 'Lijiapu', 'American Ash', 2963, 'astorydt@is.gd', 7711947490);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (914453711, 'Lorenza', 'Stapleton', to_date('26-07-2003', 'dd-mm-yyyy'), 'Iwye', 'Golden Leaf', 259, 'lstapletondu@t.co', 4603746125);
insert into PERSON (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone)
values (505637388, 'Kerk', 'Swire', to_date('06-05-1966', 'dd-mm-yyyy'), 'Kawanishi', 'Calypso', 34, 'kswiredv@jimdo.com', 3279154544);
commit;
prompt 498 records loaded
prompt Loading TRAINEE...
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('22-07-1995', 'dd-mm-yyyy'), 17, 'with severe health i', 517199517);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('16-03-1989', 'dd-mm-yyyy'), 7, 'Poor', 221358829);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('15-06-2006', 'dd-mm-yyyy'), 22, 'Recovering from surg', 173200754);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('06-05-1975', 'dd-mm-yyyy'), 23, 'Fair', 373839373);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('02-10-2004', 'dd-mm-yyyy'), 15, 'Anxious', 441448733);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('10-10-1990', 'dd-mm-yyyy'), 10, 'Depressed', 403050636);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('02-02-1995', 'dd-mm-yyyy'), 28, 'Pregnant', 556888328);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('18-05-1978', 'dd-mm-yyyy'), 30, 'with severe health i', 153951230);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('15-04-1984', 'dd-mm-yyyy'), 18, '''Excellent', 728518500);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('19-11-2005', 'dd-mm-yyyy'), 19, '''Fair', 558402416);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('06-12-1992', 'dd-mm-yyyy'), 35, 'Unknown', 141837640);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('25-02-1995', 'dd-mm-yyyy'), 9, 'with moderate health', 490765532);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('19-11-1986', 'dd-mm-yyyy'), 30, 'Stressed', 245348975);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('22-05-1975', 'dd-mm-yyyy'), 12, 'Depressed', 119798937);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('24-02-2003', 'dd-mm-yyyy'), 6, 'Pregnant', 641170597);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('25-12-1973', 'dd-mm-yyyy'), 15, 'Fair', 695020064);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('23-12-1984', 'dd-mm-yyyy'), 25, 'with moderate health', 925132120);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('19-12-1968', 'dd-mm-yyyy'), 34, '''Good', 336348974);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('24-10-1977', 'dd-mm-yyyy'), 22, 'Unknown', 700069359);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('03-01-1978', 'dd-mm-yyyy'), 31, 'Underweight', 617803786);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('27-02-2007', 'dd-mm-yyyy'), 15, 'Recovering from surg', 509483133);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('11-05-1990', 'dd-mm-yyyy'), 21, 'Fair', 556099069);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('10-03-2003', 'dd-mm-yyyy'), 7, 'Disabled', 754755023);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('08-11-1968', 'dd-mm-yyyy'), 5, 'Poor', 200281225);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('14-03-1970', 'dd-mm-yyyy'), 34, 'with occasional issu', 126638060);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('08-01-1982', 'dd-mm-yyyy'), 35, 'Unhealthy lifestyle', 823910760);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('03-06-1982', 'dd-mm-yyyy'), 5, 'Overweight', 264816972);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('14-05-2007', 'dd-mm-yyyy'), 7, 'Anxious', 317822031);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('06-05-1977', 'dd-mm-yyyy'), 16, 'with occasional issu', 862511399);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('19-12-2002', 'dd-mm-yyyy'), 19, '''Poor', 100171750);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('04-01-1983', 'dd-mm-yyyy'), 22, 'with chronic disease', 182111971);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('12-04-1980', 'dd-mm-yyyy'), 21, 'Underweight', 539551740);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('03-04-1964', 'dd-mm-yyyy'), 10, 'Good', 199280229);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('17-06-1970', 'dd-mm-yyyy'), 31, 'Healthy lifestyle', 375351719);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('10-04-1977', 'dd-mm-yyyy'), 19, 'Stressed', 400352077);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('23-01-2000', 'dd-mm-yyyy'), 14, 'Excellent', 840761695);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('26-05-1989', 'dd-mm-yyyy'), 16, 'Underweight', 453477723);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('20-03-1967', 'dd-mm-yyyy'), 21, 'Athlete', 210963470);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('29-08-1965', 'dd-mm-yyyy'), 32, 'Disabled', 119196872);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('12-07-2004', 'dd-mm-yyyy'), 24, 'Undergoing treatment', 299788152);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('14-01-2002', 'dd-mm-yyyy'), 25, 'Undergoing treatment', 810251423);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('03-10-1964', 'dd-mm-yyyy'), 6, 'Anxious', 741975218);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('15-07-1977', 'dd-mm-yyyy'), 3, 'Healthy lifestyle', 481541006);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('21-03-1965', 'dd-mm-yyyy'), 19, 'Elderly', 505169218);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('16-12-2000', 'dd-mm-yyyy'), 13, 'Pregnant', 281169657);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('17-12-1966', 'dd-mm-yyyy'), 27, 'Healthy lifestyle', 158277278);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('11-06-1980', 'dd-mm-yyyy'), 11, '''Poor', 194835218);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('29-08-1972', 'dd-mm-yyyy'), 16, 'Excellent', 241957656);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('04-10-1987', 'dd-mm-yyyy'), 5, 'Elderly', 607570811);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('23-04-2007', 'dd-mm-yyyy'), 33, '''Fair', 496082620);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('02-05-1965', 'dd-mm-yyyy'), 19, 'Overweight', 334399647);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('09-08-1969', 'dd-mm-yyyy'), 6, '''Poor', 474084615);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('23-01-1964', 'dd-mm-yyyy'), 22, '''Poor', 787378023);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('20-02-1970', 'dd-mm-yyyy'), 10, 'Elderly', 372097171);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('30-10-1987', 'dd-mm-yyyy'), 6, '''Good', 742101151);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('15-04-1968', 'dd-mm-yyyy'), 10, 'with chronic disease', 505637388);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('19-10-1972', 'dd-mm-yyyy'), 9, 'Unknown', 178726838);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('24-11-1983', 'dd-mm-yyyy'), 5, '''Good', 670045074);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('20-06-1989', 'dd-mm-yyyy'), 15, 'Athlete', 246305254);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('04-09-2003', 'dd-mm-yyyy'), 35, 'Elderly', 276176732);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('10-06-2007', 'dd-mm-yyyy'), 25, 'Excellent', 392633660);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('19-05-1978', 'dd-mm-yyyy'), 7, 'Undergoing treatment', 172274041);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('18-12-1970', 'dd-mm-yyyy'), 15, 'with chronic disease', 595283787);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('17-09-1998', 'dd-mm-yyyy'), 30, 'with chronic disease', 466025294);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('28-03-1965', 'dd-mm-yyyy'), 30, '''Poor', 928999987);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('28-12-1989', 'dd-mm-yyyy'), 15, 'Pregnant', 220627730);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('09-06-1989', 'dd-mm-yyyy'), 23, '''Excellent', 914453711);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('28-07-1981', 'dd-mm-yyyy'), 8, '''Fair', 639106141);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('03-07-1996', 'dd-mm-yyyy'), 9, 'Elderly', 273396102);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('30-12-1982', 'dd-mm-yyyy'), 15, 'with severe health i', 457984284);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('09-09-1979', 'dd-mm-yyyy'), 24, 'with moderate health', 846419707);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('01-12-1994', 'dd-mm-yyyy'), 7, 'Recovering from surg', 637966728);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('01-11-1973', 'dd-mm-yyyy'), 30, '''Excellent', 616052079);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('05-06-1971', 'dd-mm-yyyy'), 30, 'Disabled', 625556109);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('15-02-2005', 'dd-mm-yyyy'), 8, 'Fair', 542004169);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('14-05-1973', 'dd-mm-yyyy'), 30, 'Fair', 696983605);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('28-12-1964', 'dd-mm-yyyy'), 22, '''Good', 873456697);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('12-07-1998', 'dd-mm-yyyy'), 36, 'Elderly', 317285847);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('30-07-1987', 'dd-mm-yyyy'), 24, 'with occasional issu', 838534272);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('13-01-1964', 'dd-mm-yyyy'), 7, 'Undergoing treatment', 562010577);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('11-01-1981', 'dd-mm-yyyy'), 14, 'with occasional issu', 181050162);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('18-04-1964', 'dd-mm-yyyy'), 7, 'Overweight', 921188608);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('10-11-1967', 'dd-mm-yyyy'), 27, 'Fair', 943746739);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('12-09-1990', 'dd-mm-yyyy'), 7, 'Depressed', 916416877);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('20-01-1975', 'dd-mm-yyyy'), 36, '''Fair', 129756457);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('22-12-1989', 'dd-mm-yyyy'), 29, 'Poor', 206629316);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('09-05-1973', 'dd-mm-yyyy'), 24, '''Fair', 765927503);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('12-08-1975', 'dd-mm-yyyy'), 13, 'Unhealthy lifestyle', 940410755);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('20-12-1994', 'dd-mm-yyyy'), 36, 'with occasional issu', 425058356);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('26-07-1997', 'dd-mm-yyyy'), 4, 'with chronic disease', 511271917);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('04-02-1986', 'dd-mm-yyyy'), 13, 'Anxious', 438455310);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('25-05-1967', 'dd-mm-yyyy'), 8, 'Poor', 491367469);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('23-06-1974', 'dd-mm-yyyy'), 32, 'Elderly', 847656702);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('11-12-1965', 'dd-mm-yyyy'), 9, '''Excellent', 196382662);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('25-01-1998', 'dd-mm-yyyy'), 32, 'Recovering from surg', 965940603);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('04-08-2002', 'dd-mm-yyyy'), 33, 'Good', 457655167);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('24-04-1993', 'dd-mm-yyyy'), 16, 'Unknown', 703786319);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('06-05-1986', 'dd-mm-yyyy'), 21, 'Overweight', 408324895);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('17-01-1973', 'dd-mm-yyyy'), 23, 'Disabled', 933857373);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('28-03-1977', 'dd-mm-yyyy'), 3, 'Excellent', 837026985);
commit;
prompt 100 records committed...
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('06-08-1965', 'dd-mm-yyyy'), 22, 'Excellent', 317838008);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('23-11-1964', 'dd-mm-yyyy'), 36, 'Undergoing treatment', 168836760);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('16-11-1981', 'dd-mm-yyyy'), 32, 'Unhealthy lifestyle', 208612657);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('15-08-1999', 'dd-mm-yyyy'), 31, '''Fair', 339168131);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('27-04-1977', 'dd-mm-yyyy'), 29, 'Unhealthy lifestyle', 462724078);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('21-11-1997', 'dd-mm-yyyy'), 10, 'with moderate health', 738596862);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('02-04-1985', 'dd-mm-yyyy'), 21, '''Good', 395672304);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('07-02-1964', 'dd-mm-yyyy'), 33, '''Fair', 191471146);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('17-12-1997', 'dd-mm-yyyy'), 28, 'Disabled', 479467077);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('08-05-1964', 'dd-mm-yyyy'), 23, 'Undergoing treatment', 283643146);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('12-11-1996', 'dd-mm-yyyy'), 32, 'Overweight', 907256920);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('27-12-1970', 'dd-mm-yyyy'), 23, 'Stressed', 199129162);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('21-11-1973', 'dd-mm-yyyy'), 5, 'with occasional issu', 443970722);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('06-11-1980', 'dd-mm-yyyy'), 19, '''Fair', 982228959);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('05-07-2006', 'dd-mm-yyyy'), 14, 'Underweight', 121799050);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('27-05-1964', 'dd-mm-yyyy'), 12, 'Unknown', 834466751);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('08-09-1966', 'dd-mm-yyyy'), 21, 'Unknown', 557756293);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('23-01-1984', 'dd-mm-yyyy'), 12, 'Anxious', 637214817);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('29-06-1979', 'dd-mm-yyyy'), 10, 'with occasional issu', 252975811);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('13-08-2002', 'dd-mm-yyyy'), 22, 'Underweight', 200589852);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('22-06-2002', 'dd-mm-yyyy'), 9, 'Anxious', 178906385);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('17-06-2005', 'dd-mm-yyyy'), 36, 'Underweight', 924964324);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('26-07-2004', 'dd-mm-yyyy'), 35, 'Good', 830160294);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('29-09-1982', 'dd-mm-yyyy'), 8, 'Excellent', 501348097);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('26-02-1976', 'dd-mm-yyyy'), 18, 'Poor', 594211402);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('08-03-2006', 'dd-mm-yyyy'), 5, 'Athlete', 584791610);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('22-12-1983', 'dd-mm-yyyy'), 16, 'Poor', 197251348);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('13-10-1964', 'dd-mm-yyyy'), 29, 'Fair', 831558139);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('19-08-1972', 'dd-mm-yyyy'), 3, 'Overweight', 660886697);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('14-10-2005', 'dd-mm-yyyy'), 29, 'Healthy lifestyle', 931203266);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('09-10-1967', 'dd-mm-yyyy'), 33, 'Overweight', 375154552);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('21-01-1991', 'dd-mm-yyyy'), 16, 'Healthy lifestyle', 583024899);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('25-12-1967', 'dd-mm-yyyy'), 23, 'Poor', 489630456);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('16-02-1992', 'dd-mm-yyyy'), 12, 'with moderate health', 123599375);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('26-05-1986', 'dd-mm-yyyy'), 10, 'Depressed', 455403379);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('27-01-1999', 'dd-mm-yyyy'), 10, 'Poor', 927761034);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('01-05-1991', 'dd-mm-yyyy'), 18, 'Elderly', 735626560);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('22-09-2005', 'dd-mm-yyyy'), 5, '''Excellent', 799006955);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('09-05-1972', 'dd-mm-yyyy'), 19, 'Depressed', 463724524);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('07-08-2004', 'dd-mm-yyyy'), 22, 'Undergoing treatment', 105654067);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('16-03-1979', 'dd-mm-yyyy'), 14, 'Anxious', 168520613);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('16-07-1978', 'dd-mm-yyyy'), 20, 'with moderate health', 382781490);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('19-02-1983', 'dd-mm-yyyy'), 35, 'Athlete', 774448110);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('07-02-1981', 'dd-mm-yyyy'), 15, 'Elderly', 557038448);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('09-07-1964', 'dd-mm-yyyy'), 13, 'Fair', 325077153);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('26-02-1996', 'dd-mm-yyyy'), 21, 'Overweight', 426365238);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('27-04-1972', 'dd-mm-yyyy'), 9, 'Depressed', 175910686);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('26-09-1983', 'dd-mm-yyyy'), 8, 'Overweight', 975459822);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('16-08-1964', 'dd-mm-yyyy'), 7, 'Recovering from surg', 496569875);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('11-03-1983', 'dd-mm-yyyy'), 28, 'Undergoing treatment', 439643727);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('16-12-1973', 'dd-mm-yyyy'), 25, 'Overweight', 527655639);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('16-12-1992', 'dd-mm-yyyy'), 13, 'Pregnant', 617937771);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('05-05-1964', 'dd-mm-yyyy'), 34, 'Undergoing treatment', 478380949);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('07-04-1979', 'dd-mm-yyyy'), 14, 'Excellent', 571442515);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('05-11-1976', 'dd-mm-yyyy'), 34, '''Excellent', 692865868);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('30-10-2004', 'dd-mm-yyyy'), 36, '''Excellent', 775393164);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('13-06-1993', 'dd-mm-yyyy'), 23, 'Disabled', 183537357);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('07-12-1989', 'dd-mm-yyyy'), 6, 'Fair', 901931967);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('07-05-1998', 'dd-mm-yyyy'), 11, '''Fair', 687150404);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('30-05-2006', 'dd-mm-yyyy'), 18, 'Poor', 129186647);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('16-10-2003', 'dd-mm-yyyy'), 13, '''Excellent', 918096886);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('15-06-1994', 'dd-mm-yyyy'), 28, 'Depressed', 769795766);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('11-09-1993', 'dd-mm-yyyy'), 24, 'Pregnant', 716184718);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('26-04-1990', 'dd-mm-yyyy'), 5, '''Fair', 357964464);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('16-07-1978', 'dd-mm-yyyy'), 29, 'with moderate health', 610286655);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('19-11-1969', 'dd-mm-yyyy'), 35, 'Fair', 719859226);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('27-11-1965', 'dd-mm-yyyy'), 29, '''Fair', 592162027);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('24-01-1988', 'dd-mm-yyyy'), 14, 'Anxious', 598823879);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('27-10-1981', 'dd-mm-yyyy'), 3, 'Disabled', 920943612);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('18-04-1984', 'dd-mm-yyyy'), 6, 'Poor', 542098274);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('25-11-1987', 'dd-mm-yyyy'), 20, '''Good', 188014768);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('15-10-1974', 'dd-mm-yyyy'), 16, 'Poor', 124985854);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('10-12-1993', 'dd-mm-yyyy'), 5, '''Good', 604967584);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('11-10-1984', 'dd-mm-yyyy'), 27, 'Athlete', 153938151);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('19-03-1999', 'dd-mm-yyyy'), 20, 'Fair', 870513504);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('01-07-1985', 'dd-mm-yyyy'), 18, 'Recovering from surg', 944654806);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('10-12-1978', 'dd-mm-yyyy'), 34, 'Pregnant', 755809998);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('19-03-1985', 'dd-mm-yyyy'), 34, 'with moderate health', 726402722);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('10-12-1992', 'dd-mm-yyyy'), 14, 'Pregnant', 240883177);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('28-08-1964', 'dd-mm-yyyy'), 21, 'Fair', 959338316);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('11-04-1968', 'dd-mm-yyyy'), 26, 'Stressed', 402379540);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('07-12-1994', 'dd-mm-yyyy'), 12, 'Good', 816155341);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('14-07-2003', 'dd-mm-yyyy'), 11, '''Fair', 957557141);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('28-01-1977', 'dd-mm-yyyy'), 17, 'Excellent', 170042836);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('21-07-1981', 'dd-mm-yyyy'), 27, 'Recovering from surg', 154015286);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('08-01-1986', 'dd-mm-yyyy'), 26, 'with occasional issu', 783080526);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('07-11-1992', 'dd-mm-yyyy'), 14, 'Elderly', 631847604);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('03-03-1973', 'dd-mm-yyyy'), 13, '''Good', 451092501);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('02-04-1993', 'dd-mm-yyyy'), 6, '''Fair', 115518036);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('10-11-1980', 'dd-mm-yyyy'), 25, 'with moderate health', 725176793);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('22-03-1996', 'dd-mm-yyyy'), 12, 'Pregnant', 829145191);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('11-05-1983', 'dd-mm-yyyy'), 28, 'Stressed', 256244114);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('27-01-1989', 'dd-mm-yyyy'), 29, 'Good', 148778614);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('07-03-2003', 'dd-mm-yyyy'), 10, '''Good', 822240474);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('01-10-2007', 'dd-mm-yyyy'), 6, 'Underweight', 849129256);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('29-03-1970', 'dd-mm-yyyy'), 13, 'Undergoing treatment', 867765371);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('28-10-1964', 'dd-mm-yyyy'), 11, 'with chronic disease', 920460836);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('26-06-1999', 'dd-mm-yyyy'), 30, 'with severe health i', 456191540);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('26-02-1988', 'dd-mm-yyyy'), 11, '''Poor', 582445416);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('24-06-1967', 'dd-mm-yyyy'), 10, 'Depressed', 769542199);
commit;
prompt 200 records committed...
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('23-04-1990', 'dd-mm-yyyy'), 5, 'Fair', 649768071);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('28-04-1986', 'dd-mm-yyyy'), 32, 'Healthy lifestyle', 683756135);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('30-09-1998', 'dd-mm-yyyy'), 28, 'Excellent', 904929173);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('02-09-1990', 'dd-mm-yyyy'), 4, 'Pregnant', 837311276);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('10-08-1973', 'dd-mm-yyyy'), 36, 'with moderate health', 526237352);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('26-05-1973', 'dd-mm-yyyy'), 6, 'Good', 152300229);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('05-02-1993', 'dd-mm-yyyy'), 8, 'Depressed', 732473732);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('18-05-1989', 'dd-mm-yyyy'), 13, 'with moderate health', 675296909);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('17-08-1994', 'dd-mm-yyyy'), 4, '''Poor', 293747357);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('02-11-1994', 'dd-mm-yyyy'), 15, 'Athlete', 967021982);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('18-09-1965', 'dd-mm-yyyy'), 18, 'Recovering from surg', 782064933);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('13-04-1999', 'dd-mm-yyyy'), 14, 'Unknown', 854442670);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('09-08-2007', 'dd-mm-yyyy'), 11, 'Good', 576328517);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('20-04-2005', 'dd-mm-yyyy'), 16, 'Fair', 645800410);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('07-05-2001', 'dd-mm-yyyy'), 10, 'Pregnant', 662847896);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('21-02-1975', 'dd-mm-yyyy'), 23, 'Poor', 104937452);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('05-11-1966', 'dd-mm-yyyy'), 25, 'Pregnant', 595483134);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('04-05-1988', 'dd-mm-yyyy'), 4, 'Overweight', 264615737);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('26-07-1968', 'dd-mm-yyyy'), 8, 'Underweight', 758061612);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('30-12-1992', 'dd-mm-yyyy'), 21, 'Unknown', 773115408);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('30-08-1985', 'dd-mm-yyyy'), 18, 'Pregnant', 763764233);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('18-10-1998', 'dd-mm-yyyy'), 22, '''Poor', 937095285);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('09-10-2006', 'dd-mm-yyyy'), 23, 'Fair', 834137712);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('18-09-2005', 'dd-mm-yyyy'), 15, 'Recovering from surg', 501705989);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('22-02-1964', 'dd-mm-yyyy'), 26, '''Poor', 250161276);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('01-08-1987', 'dd-mm-yyyy'), 5, 'with chronic disease', 992554869);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('07-05-1974', 'dd-mm-yyyy'), 32, 'Poor', 254163307);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('02-04-2006', 'dd-mm-yyyy'), 9, 'with occasional issu', 433213790);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('23-02-1994', 'dd-mm-yyyy'), 4, 'Fair', 193012006);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('22-01-1969', 'dd-mm-yyyy'), 29, 'Disabled', 980200311);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('22-09-2000', 'dd-mm-yyyy'), 15, 'Disabled', 908730507);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('25-11-2007', 'dd-mm-yyyy'), 20, 'Anxious', 948133904);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('24-08-1995', 'dd-mm-yyyy'), 3, 'Undergoing treatment', 398601481);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('16-07-1992', 'dd-mm-yyyy'), 16, 'Stressed', 742220858);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('22-10-2003', 'dd-mm-yyyy'), 15, 'Unknown', 378103171);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('27-07-1981', 'dd-mm-yyyy'), 10, '''Good', 252401236);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('13-10-1996', 'dd-mm-yyyy'), 17, 'Unhealthy lifestyle', 128003805);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('03-05-1984', 'dd-mm-yyyy'), 29, 'with occasional issu', 851470156);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('20-12-1976', 'dd-mm-yyyy'), 13, 'Overweight', 923766112);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('08-11-1975', 'dd-mm-yyyy'), 34, 'Unhealthy lifestyle', 330031171);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('22-01-1982', 'dd-mm-yyyy'), 17, '''Excellent', 584468952);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('06-01-1984', 'dd-mm-yyyy'), 17, 'Disabled', 515674654);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('12-04-2005', 'dd-mm-yyyy'), 21, '''Poor', 302400433);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('16-03-1992', 'dd-mm-yyyy'), 26, 'Unhealthy lifestyle', 597219131);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('29-10-1984', 'dd-mm-yyyy'), 14, 'Excellent', 523866118);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('20-03-1991', 'dd-mm-yyyy'), 15, 'Healthy lifestyle', 939636403);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('05-05-1989', 'dd-mm-yyyy'), 9, 'with occasional issu', 374025072);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('15-09-2006', 'dd-mm-yyyy'), 31, '''Poor', 646684699);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('17-11-1967', 'dd-mm-yyyy'), 23, 'Pregnant', 978982125);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('20-02-1988', 'dd-mm-yyyy'), 16, 'with severe health i', 848074639);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('03-06-1976', 'dd-mm-yyyy'), 4, '''Good', 812609164);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('28-06-1978', 'dd-mm-yyyy'), 6, '''Fair', 572513020);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('09-04-2006', 'dd-mm-yyyy'), 6, 'with moderate health', 911045673);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('11-08-2000', 'dd-mm-yyyy'), 16, 'Disabled', 378682852);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('03-09-1975', 'dd-mm-yyyy'), 14, '''Excellent', 145376110);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('03-09-1992', 'dd-mm-yyyy'), 10, '''Good', 811670082);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('11-04-2002', 'dd-mm-yyyy'), 20, 'Healthy lifestyle', 932610681);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('10-12-1970', 'dd-mm-yyyy'), 15, 'Poor', 770792852);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('31-01-2005', 'dd-mm-yyyy'), 19, '''Good', 166246954);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('29-07-1986', 'dd-mm-yyyy'), 28, 'Healthy lifestyle', 543584585);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('16-12-1985', 'dd-mm-yyyy'), 13, 'Athlete', 662635024);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('21-03-1970', 'dd-mm-yyyy'), 14, 'Excellent', 970138584);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('23-08-1993', 'dd-mm-yyyy'), 29, 'Athlete', 573698524);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('30-03-1990', 'dd-mm-yyyy'), 31, 'Underweight', 730016698);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('25-08-1979', 'dd-mm-yyyy'), 31, 'Overweight', 392078118);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('02-12-2007', 'dd-mm-yyyy'), 11, 'Good', 434172398);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('21-08-1976', 'dd-mm-yyyy'), 21, 'Anxious', 811445548);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('24-03-2001', 'dd-mm-yyyy'), 23, 'Athlete', 428261058);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('27-09-1988', 'dd-mm-yyyy'), 19, 'with severe health i', 344533634);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('28-04-1988', 'dd-mm-yyyy'), 28, 'Stressed', 613127663);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('16-03-2002', 'dd-mm-yyyy'), 16, 'Unknown', 936984007);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('18-10-1989', 'dd-mm-yyyy'), 21, 'Recovering from surg', 295318534);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('16-05-2002', 'dd-mm-yyyy'), 25, 'with occasional issu', 667027263);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('06-06-1988', 'dd-mm-yyyy'), 35, 'Fair', 610737497);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('11-10-1971', 'dd-mm-yyyy'), 7, 'Good', 254414972);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('05-05-2004', 'dd-mm-yyyy'), 26, 'Healthy lifestyle', 237832955);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('03-06-2006', 'dd-mm-yyyy'), 7, 'with moderate health', 601180013);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('06-05-1971', 'dd-mm-yyyy'), 32, 'Pregnant', 559165794);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('19-06-1995', 'dd-mm-yyyy'), 10, 'Elderly', 509662169);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('21-03-1966', 'dd-mm-yyyy'), 15, 'Poor', 408406962);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('14-03-1971', 'dd-mm-yyyy'), 33, 'Undergoing treatment', 677684763);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('17-09-1970', 'dd-mm-yyyy'), 16, 'Unhealthy lifestyle', 962827621);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('19-11-1988', 'dd-mm-yyyy'), 9, '''Fair', 800480327);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('12-07-1975', 'dd-mm-yyyy'), 24, 'Unhealthy lifestyle', 623674412);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('19-04-1976', 'dd-mm-yyyy'), 6, 'Disabled', 677966690);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('05-12-1987', 'dd-mm-yyyy'), 19, 'with occasional issu', 256539670);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('25-02-1987', 'dd-mm-yyyy'), 21, 'Underweight', 229177674);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('16-12-1966', 'dd-mm-yyyy'), 18, 'Excellent', 540043332);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('04-01-2003', 'dd-mm-yyyy'), 9, 'with severe health i', 208588663);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('11-05-2002', 'dd-mm-yyyy'), 19, 'with moderate health', 253406712);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('09-11-1996', 'dd-mm-yyyy'), 15, 'Elderly', 679393117);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('30-11-1970', 'dd-mm-yyyy'), 19, '''Excellent', 383440042);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('27-11-1965', 'dd-mm-yyyy'), 34, 'Disabled', 282610851);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('01-04-1988', 'dd-mm-yyyy'), 12, 'with severe health i', 189643742);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('11-06-2003', 'dd-mm-yyyy'), 16, 'Elderly', 487726448);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('26-11-1987', 'dd-mm-yyyy'), 23, 'Depressed', 411702990);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('31-03-1999', 'dd-mm-yyyy'), 18, '''Fair', 936658377);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('04-06-1969', 'dd-mm-yyyy'), 5, 'Depressed', 999747607);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('06-05-1965', 'dd-mm-yyyy'), 27, 'Elderly', 250146889);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('24-12-1978', 'dd-mm-yyyy'), 13, 'Unknown', 920426797);
commit;
prompt 300 records committed...
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('02-02-1989', 'dd-mm-yyyy'), 13, 'Underweight', 482412253);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('29-05-1974', 'dd-mm-yyyy'), 32, 'Disabled', 866183544);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('18-06-1991', 'dd-mm-yyyy'), 12, 'Elderly', 375506538);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('07-08-1972', 'dd-mm-yyyy'), 25, 'Depressed', 853017499);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('30-07-1988', 'dd-mm-yyyy'), 32, 'Depressed', 703260999);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('26-12-2004', 'dd-mm-yyyy'), 27, 'with severe health i', 292421869);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('05-12-2002', 'dd-mm-yyyy'), 29, 'Elderly', 715945176);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('01-05-2004', 'dd-mm-yyyy'), 24, 'with severe health i', 592163243);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('09-09-2002', 'dd-mm-yyyy'), 19, 'Undergoing treatment', 721297891);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('13-05-1992', 'dd-mm-yyyy'), 34, 'Good', 610907411);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('21-05-1988', 'dd-mm-yyyy'), 31, 'Disabled', 758646772);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('05-08-1999', 'dd-mm-yyyy'), 24, '''Excellent', 923597583);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('03-08-1987', 'dd-mm-yyyy'), 6, 'Athlete', 786226109);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('26-11-1976', 'dd-mm-yyyy'), 32, 'Overweight', 454434252);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('21-03-1979', 'dd-mm-yyyy'), 21, 'Undergoing treatment', 349700908);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('17-08-1976', 'dd-mm-yyyy'), 34, 'with moderate health', 753286200);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('10-03-1973', 'dd-mm-yyyy'), 33, 'Underweight', 648466322);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('27-04-1965', 'dd-mm-yyyy'), 26, 'Undergoing treatment', 570441676);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('24-05-1996', 'dd-mm-yyyy'), 19, 'Poor', 922428251);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('14-04-1976', 'dd-mm-yyyy'), 6, 'Stressed', 492316527);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('03-11-1986', 'dd-mm-yyyy'), 27, 'with moderate health', 725240443);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('27-06-1974', 'dd-mm-yyyy'), 3, 'Excellent', 170243739);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('07-09-1975', 'dd-mm-yyyy'), 18, 'with chronic disease', 503031840);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('24-02-1969', 'dd-mm-yyyy'), 8, 'Recovering from surg', 743881857);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('14-12-1973', 'dd-mm-yyyy'), 20, 'Excellent', 500056959);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('13-06-1981', 'dd-mm-yyyy'), 12, 'Unknown', 709751915);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('10-02-1986', 'dd-mm-yyyy'), 24, 'Elderly', 891325545);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('25-10-1978', 'dd-mm-yyyy'), 8, 'Recovering from surg', 466069898);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('10-05-1988', 'dd-mm-yyyy'), 25, 'Athlete', 331610494);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('30-04-1965', 'dd-mm-yyyy'), 13, 'Unhealthy lifestyle', 914334290);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('31-05-1978', 'dd-mm-yyyy'), 4, '''Good', 620742770);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('24-09-1989', 'dd-mm-yyyy'), 13, 'Recovering from surg', 991512349);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('28-09-1977', 'dd-mm-yyyy'), 16, 'Elderly', 883043356);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('02-03-1975', 'dd-mm-yyyy'), 3, 'Good', 923811818);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('13-04-1964', 'dd-mm-yyyy'), 21, 'Disabled', 379652390);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('26-12-2002', 'dd-mm-yyyy'), 4, 'with chronic disease', 626464892);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('15-11-1999', 'dd-mm-yyyy'), 32, 'Elderly', 325527961);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('28-10-1996', 'dd-mm-yyyy'), 6, 'Recovering from surg', 109491053);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('07-11-1995', 'dd-mm-yyyy'), 23, 'Pregnant', 213459388);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('10-08-1979', 'dd-mm-yyyy'), 7, 'Excellent', 162220250);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('22-06-1968', 'dd-mm-yyyy'), 7, 'Stressed', 825772129);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('21-12-1998', 'dd-mm-yyyy'), 33, 'with severe health i', 885971333);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('22-01-1997', 'dd-mm-yyyy'), 28, '''Good', 856415343);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('08-05-1981', 'dd-mm-yyyy'), 5, 'Anxious', 348524922);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('15-07-1966', 'dd-mm-yyyy'), 33, 'Poor', 894045375);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('08-06-1989', 'dd-mm-yyyy'), 8, '''Poor', 412832580);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('31-08-1982', 'dd-mm-yyyy'), 4, '''Excellent', 309422947);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('21-08-1991', 'dd-mm-yyyy'), 3, '''Fair', 666205340);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('07-12-1973', 'dd-mm-yyyy'), 28, 'with moderate health', 289832097);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('30-11-1976', 'dd-mm-yyyy'), 25, 'Athlete', 478902541);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('29-06-1991', 'dd-mm-yyyy'), 18, 'Fair', 785455181);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('15-12-2002', 'dd-mm-yyyy'), 6, '''Good', 851536797);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('12-02-2006', 'dd-mm-yyyy'), 20, 'Healthy lifestyle', 648883310);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('20-05-1965', 'dd-mm-yyyy'), 24, 'Good', 934662057);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('07-04-1970', 'dd-mm-yyyy'), 15, 'Pregnant', 572285340);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('29-10-1988', 'dd-mm-yyyy'), 30, 'Depressed', 194690926);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('07-11-1973', 'dd-mm-yyyy'), 3, 'Undergoing treatment', 835284851);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('05-12-1976', 'dd-mm-yyyy'), 15, 'Undergoing treatment', 953151798);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('12-01-1985', 'dd-mm-yyyy'), 19, 'with severe health i', 950034758);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('22-01-2004', 'dd-mm-yyyy'), 15, 'Underweight', 363744559);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('17-10-2000', 'dd-mm-yyyy'), 12, 'Excellent', 226625742);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('12-05-1998', 'dd-mm-yyyy'), 26, 'Fair', 495997339);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('29-04-1992', 'dd-mm-yyyy'), 21, 'Recovering from surg', 897043979);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('03-08-1985', 'dd-mm-yyyy'), 4, 'Stressed', 776564831);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('17-11-1980', 'dd-mm-yyyy'), 10, 'Disabled', 882145843);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('27-03-1972', 'dd-mm-yyyy'), 24, 'with moderate health', 817616991);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('30-07-1967', 'dd-mm-yyyy'), 30, '''Excellent', 592049227);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('23-02-1977', 'dd-mm-yyyy'), 8, 'Recovering from surg', 117293621);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('29-09-1997', 'dd-mm-yyyy'), 23, '''Excellent', 176771449);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('20-08-1975', 'dd-mm-yyyy'), 14, 'Poor', 146924485);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('10-07-1977', 'dd-mm-yyyy'), 33, '''Poor', 118520760);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('28-07-1978', 'dd-mm-yyyy'), 15, 'Recovering from surg', 537375804);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('03-10-1978', 'dd-mm-yyyy'), 8, 'Stressed', 955638737);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('24-04-1977', 'dd-mm-yyyy'), 23, 'Stressed', 558821746);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('30-06-1966', 'dd-mm-yyyy'), 20, 'Pregnant', 160302987);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('01-03-1971', 'dd-mm-yyyy'), 28, 'Poor', 880022583);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('18-07-1990', 'dd-mm-yyyy'), 29, 'Depressed', 353251821);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('16-11-1993', 'dd-mm-yyyy'), 10, 'with severe health i', 714330119);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('04-06-2007', 'dd-mm-yyyy'), 18, 'Unhealthy lifestyle', 624917762);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('14-03-2002', 'dd-mm-yyyy'), 7, 'Disabled', 942622933);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('27-12-1972', 'dd-mm-yyyy'), 13, 'Underweight', 608510484);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('16-03-1998', 'dd-mm-yyyy'), 19, 'Undergoing treatment', 552548536);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('10-05-1982', 'dd-mm-yyyy'), 23, 'Recovering from surg', 843068367);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('22-07-1998', 'dd-mm-yyyy'), 3, 'Recovering from surg', 209716187);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('20-01-1983', 'dd-mm-yyyy'), 11, 'Elderly', 160062237);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('12-10-1992', 'dd-mm-yyyy'), 32, 'Pregnant', 435897536);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('10-08-1990', 'dd-mm-yyyy'), 30, 'Recovering from surg', 447040488);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('02-02-1971', 'dd-mm-yyyy'), 33, 'Depressed', 540381721);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('21-02-1975', 'dd-mm-yyyy'), 8, 'Overweight', 610960397);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('15-05-1993', 'dd-mm-yyyy'), 32, 'Elderly', 144642188);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('10-09-1972', 'dd-mm-yyyy'), 28, 'Poor', 236372769);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('03-03-2006', 'dd-mm-yyyy'), 28, 'Underweight', 402413501);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('09-11-1983', 'dd-mm-yyyy'), 21, 'Stressed', 565571169);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('16-06-1965', 'dd-mm-yyyy'), 31, 'Athlete', 830941935);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('04-03-1986', 'dd-mm-yyyy'), 27, 'Recovering from surg', 373631073);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('10-03-1993', 'dd-mm-yyyy'), 3, 'Unknown', 554350368);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('29-12-2000', 'dd-mm-yyyy'), 4, '''Good', 913311862);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('20-07-1964', 'dd-mm-yyyy'), 5, 'Healthy lifestyle', 544043768);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('27-11-1972', 'dd-mm-yyyy'), 13, 'Undergoing treatment', 720995190);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('24-06-1975', 'dd-mm-yyyy'), 20, 'with moderate health', 194505717);
commit;
prompt 400 records committed...
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('02-06-1980', 'dd-mm-yyyy'), 34, 'Unhealthy lifestyle', 698757041);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('09-05-1989', 'dd-mm-yyyy'), 11, 'with severe health i', 124964227);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('29-09-2000', 'dd-mm-yyyy'), 12, '''Poor', 698519392);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('21-06-1990', 'dd-mm-yyyy'), 35, '''Poor', 238646522);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('10-12-1981', 'dd-mm-yyyy'), 34, 'with chronic disease', 827216964);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('25-09-1983', 'dd-mm-yyyy'), 19, 'Poor', 767094858);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('04-08-1971', 'dd-mm-yyyy'), 24, 'with occasional issu', 554526290);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('02-05-1988', 'dd-mm-yyyy'), 25, 'Unknown', 792537826);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('21-11-1993', 'dd-mm-yyyy'), 14, 'with severe health i', 698587684);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('17-02-1991', 'dd-mm-yyyy'), 25, '''Poor', 596818423);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('13-02-1999', 'dd-mm-yyyy'), 11, 'with moderate health', 811411011);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('28-02-1968', 'dd-mm-yyyy'), 10, '''Poor', 815956026);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('26-08-1979', 'dd-mm-yyyy'), 3, 'Undergoing treatment', 744557849);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('09-08-1981', 'dd-mm-yyyy'), 9, 'with moderate health', 973326469);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('01-10-1992', 'dd-mm-yyyy'), 20, 'Underweight', 844229081);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('30-03-1997', 'dd-mm-yyyy'), 28, 'Good', 721397520);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('24-06-2006', 'dd-mm-yyyy'), 9, '''Fair', 875272623);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('24-08-1990', 'dd-mm-yyyy'), 25, 'Poor', 405114344);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('30-11-1984', 'dd-mm-yyyy'), 5, 'Overweight', 208738794);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('19-08-1965', 'dd-mm-yyyy'), 31, 'with severe health i', 386432436);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('04-11-1974', 'dd-mm-yyyy'), 33, 'Depressed', 726029513);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('14-06-2001', 'dd-mm-yyyy'), 19, 'Elderly', 807686151);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('13-05-1974', 'dd-mm-yyyy'), 24, 'Overweight', 124888863);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('27-06-1989', 'dd-mm-yyyy'), 18, 'Stressed', 424357965);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('07-11-2004', 'dd-mm-yyyy'), 30, 'Unhealthy lifestyle', 137211133);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('23-08-2007', 'dd-mm-yyyy'), 31, 'Anxious', 194442862);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('19-12-1979', 'dd-mm-yyyy'), 5, 'Recovering from surg', 610512281);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('15-01-1973', 'dd-mm-yyyy'), 29, 'Unknown', 836251609);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('11-05-1988', 'dd-mm-yyyy'), 28, 'Unknown', 205825700);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('20-03-1980', 'dd-mm-yyyy'), 27, 'Anxious', 364757858);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('02-01-1991', 'dd-mm-yyyy'), 9, 'Athlete', 915122110);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('24-07-2005', 'dd-mm-yyyy'), 15, '''Poor', 955659426);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('27-06-1998', 'dd-mm-yyyy'), 23, 'Underweight', 271828792);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('23-04-1973', 'dd-mm-yyyy'), 24, '''Poor', 317827346);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('20-01-1975', 'dd-mm-yyyy'), 27, 'Stressed', 596082387);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('03-08-1973', 'dd-mm-yyyy'), 14, 'Depressed', 548962651);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('01-11-1997', 'dd-mm-yyyy'), 5, 'Unknown', 307865478);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('26-09-1977', 'dd-mm-yyyy'), 17, 'Elderly', 829092435);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('18-12-1987', 'dd-mm-yyyy'), 16, 'Healthy lifestyle', 815735034);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('28-04-1980', 'dd-mm-yyyy'), 20, '''Excellent', 207996683);
insert into TRAINEE (joining_date, membership_length, health_condition, person_id)
values (to_date('10-08-1985', 'dd-mm-yyyy'), 33, 'with severe health i', 605591541);
commit;
prompt 441 records loaded
prompt Loading TRAINER...
insert into TRAINER (seniority, salary, rating, person_id)
values (1, 17885.48, 4, 505169218);
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 23277.36, 4, 730016698);
insert into TRAINER (seniority, salary, rating, person_id)
values (12, 10418.41, 1, 914334290);
insert into TRAINER (seniority, salary, rating, person_id)
values (13, 3470.83, 4, 640588003);
insert into TRAINER (seniority, salary, rating, person_id)
values (8, 14177.97, 2, 119196872);
insert into TRAINER (seniority, salary, rating, person_id)
values (12, 13080.39, 4, 348524922);
insert into TRAINER (seniority, salary, rating, person_id)
values (17, 20374.9, 4, 981055942);
insert into TRAINER (seniority, salary, rating, person_id)
values (17, 23925.57, 2, 252401236);
insert into TRAINER (seniority, salary, rating, person_id)
values (16, 7645.46, 4, 392633660);
insert into TRAINER (seniority, salary, rating, person_id)
values (6, 14367.78, 5, 189643742);
insert into TRAINER (seniority, salary, rating, person_id)
values (16, 13425.25, 4, 200281225);
insert into TRAINER (seniority, salary, rating, person_id)
values (1, 10056.45, 3, 807686151);
insert into TRAINER (seniority, salary, rating, person_id)
values (13, 18657.81, 5, 726402722);
insert into TRAINER (seniority, salary, rating, person_id)
values (12, 6400.12, 5, 916416877);
insert into TRAINER (seniority, salary, rating, person_id)
values (5, 10628.2, 5, 441448733);
insert into TRAINER (seniority, salary, rating, person_id)
values (1, 24740.67, 5, 542004169);
insert into TRAINER (seniority, salary, rating, person_id)
values (4, 18721.63, 4, 841180795);
insert into TRAINER (seniority, salary, rating, person_id)
values (3, 20383.75, 2, 424357965);
insert into TRAINER (seniority, salary, rating, person_id)
values (17, 9106.98, 4, 582445416);
insert into TRAINER (seniority, salary, rating, person_id)
values (5, 9226.15, 1, 276176732);
insert into TRAINER (seniority, salary, rating, person_id)
values (16, 3302.75, 5, 610907411);
insert into TRAINER (seniority, salary, rating, person_id)
values (19, 6945.67, 4, 822240474);
insert into TRAINER (seniority, salary, rating, person_id)
values (7, 9124.24, 4, 861440050);
insert into TRAINER (seniority, salary, rating, person_id)
values (8, 4387.78, 4, 482412253);
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 18114.89, 1, 573698524);
insert into TRAINER (seniority, salary, rating, person_id)
values (20, 22808.62, 1, 901931967);
insert into TRAINER (seniority, salary, rating, person_id)
values (7, 18357.11, 5, 770792852);
insert into TRAINER (seniority, salary, rating, person_id)
values (17, 6421.12, 1, 698519392);
insert into TRAINER (seniority, salary, rating, person_id)
values (16, 5367.31, 5, 800480327);
insert into TRAINER (seniority, salary, rating, person_id)
values (13, 7066.02, 3, 378103171);
insert into TRAINER (seniority, salary, rating, person_id)
values (7, 10572.15, 5, 457655167);
insert into TRAINER (seniority, salary, rating, person_id)
values (20, 22608.07, 2, 462724078);
insert into TRAINER (seniority, salary, rating, person_id)
values (16, 11667.18, 1, 608510484);
insert into TRAINER (seniority, salary, rating, person_id)
values (19, 13457.01, 4, 540381721);
insert into TRAINER (seniority, salary, rating, person_id)
values (11, 23263.19, 5, 559165794);
insert into TRAINER (seniority, salary, rating, person_id)
values (18, 6013.74, 3, 667027263);
insert into TRAINER (seniority, salary, rating, person_id)
values (16, 10680.87, 1, 980200311);
insert into TRAINER (seniority, salary, rating, person_id)
values (9, 9441.4, 4, 213459388);
insert into TRAINER (seniority, salary, rating, person_id)
values (1, 14312.32, 2, 991512349);
insert into TRAINER (seniority, salary, rating, person_id)
values (9, 19361.45, 2, 648466322);
insert into TRAINER (seniority, salary, rating, person_id)
values (13, 21251.7, 2, 721397520);
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 17274.75, 1, 282610851);
insert into TRAINER (seniority, salary, rating, person_id)
values (8, 24692.84, 2, 683756135);
insert into TRAINER (seniority, salary, rating, person_id)
values (19, 11307.69, 5, 568212072);
insert into TRAINER (seniority, salary, rating, person_id)
values (19, 20474.97, 3, 558026645);
insert into TRAINER (seniority, salary, rating, person_id)
values (3, 4283.28, 1, 392078118);
insert into TRAINER (seniority, salary, rating, person_id)
values (19, 24316.36, 3, 817616991);
insert into TRAINER (seniority, salary, rating, person_id)
values (12, 3117.2, 2, 194505717);
insert into TRAINER (seniority, salary, rating, person_id)
values (5, 16372.9, 5, 254163307);
insert into TRAINER (seniority, salary, rating, person_id)
values (7, 18321.7, 2, 816155341);
insert into TRAINER (seniority, salary, rating, person_id)
values (20, 17245.48, 3, 719859226);
insert into TRAINER (seniority, salary, rating, person_id)
values (4, 24061.88, 5, 405114344);
insert into TRAINER (seniority, salary, rating, person_id)
values (12, 13924.26, 1, 145376110);
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 9874.44, 5, 753286200);
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 23650.36, 4, 353251821);
insert into TRAINER (seniority, salary, rating, person_id)
values (3, 17688.39, 5, 500056959);
insert into TRAINER (seniority, salary, rating, person_id)
values (8, 22472.89, 2, 646684699);
insert into TRAINER (seniority, salary, rating, person_id)
values (15, 12726.87, 4, 700069359);
insert into TRAINER (seniority, salary, rating, person_id)
values (20, 18037.28, 4, 562010577);
insert into TRAINER (seniority, salary, rating, person_id)
values (1, 14408.95, 2, 641170597);
insert into TRAINER (seniority, salary, rating, person_id)
values (8, 11517.57, 4, 221358829);
insert into TRAINER (seniority, salary, rating, person_id)
values (4, 7878.81, 4, 526237352);
insert into TRAINER (seniority, salary, rating, person_id)
values (12, 14520.58, 2, 439643727);
insert into TRAINER (seniority, salary, rating, person_id)
values (6, 10922.95, 5, 953151798);
insert into TRAINER (seniority, salary, rating, person_id)
values (20, 15998.68, 1, 408324895);
insert into TRAINER (seniority, salary, rating, person_id)
values (7, 19666.94, 1, 495997339);
insert into TRAINER (seniority, salary, rating, person_id)
values (8, 5813.35, 2, 935524399);
insert into TRAINER (seniority, salary, rating, person_id)
values (7, 23811.33, 4, 763764233);
insert into TRAINER (seniority, salary, rating, person_id)
values (19, 13273.57, 1, 557756293);
insert into TRAINER (seniority, salary, rating, person_id)
values (11, 4402.28, 1, 408406962);
insert into TRAINER (seniority, salary, rating, person_id)
values (17, 22407.03, 2, 856415343);
insert into TRAINER (seniority, salary, rating, person_id)
values (10, 10558.94, 5, 601180013);
insert into TRAINER (seniority, salary, rating, person_id)
values (17, 23749.92, 2, 175910686);
insert into TRAINER (seniority, salary, rating, person_id)
values (16, 15325.76, 2, 378682852);
insert into TRAINER (seniority, salary, rating, person_id)
values (7, 8694.75, 5, 331469551);
insert into TRAINER (seniority, salary, rating, person_id)
values (15, 20930.8, 5, 613127663);
insert into TRAINER (seniority, salary, rating, person_id)
values (6, 18256.14, 1, 769542199);
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 9934.89, 2, 509483133);
insert into TRAINER (seniority, salary, rating, person_id)
values (8, 24216.61, 4, 317285847);
insert into TRAINER (seniority, salary, rating, person_id)
values (8, 5989.82, 5, 253406712);
insert into TRAINER (seniority, salary, rating, person_id)
values (14, 4735.91, 2, 374025072);
insert into TRAINER (seniority, salary, rating, person_id)
values (9, 14805.27, 1, 834137712);
insert into TRAINER (seniority, salary, rating, person_id)
values (11, 6309.48, 1, 490765532);
insert into TRAINER (seniority, salary, rating, person_id)
values (15, 6623.21, 1, 124888863);
insert into TRAINER (seniority, salary, rating, person_id)
values (8, 6989.66, 4, 738596862);
insert into TRAINER (seniority, salary, rating, person_id)
values (4, 21623.29, 1, 883043356);
insert into TRAINER (seniority, salary, rating, person_id)
values (19, 16803.56, 3, 936658377);
insert into TRAINER (seniority, salary, rating, person_id)
values (14, 3153.38, 2, 848074639);
insert into TRAINER (seniority, salary, rating, person_id)
values (11, 19996.14, 2, 336348974);
insert into TRAINER (seniority, salary, rating, person_id)
values (9, 4279.39, 5, 199766274);
insert into TRAINER (seniority, salary, rating, person_id)
values (11, 20116.72, 2, 117293621);
insert into TRAINER (seniority, salary, rating, person_id)
values (15, 4513.78, 1, 256539670);
insert into TRAINER (seniority, salary, rating, person_id)
values (9, 22600.45, 3, 166246954);
insert into TRAINER (seniority, salary, rating, person_id)
values (8, 17461.95, 3, 637966728);
insert into TRAINER (seniority, salary, rating, person_id)
values (12, 6350, 2, 271828792);
insert into TRAINER (seniority, salary, rating, person_id)
values (12, 22807.59, 4, 256244114);
insert into TRAINER (seniority, salary, rating, person_id)
values (15, 8495.52, 4, 105654067);
insert into TRAINER (seniority, salary, rating, person_id)
values (18, 6339.81, 5, 866183544);
insert into TRAINER (seniority, salary, rating, person_id)
values (14, 9118.45, 1, 662635024);
insert into TRAINER (seniority, salary, rating, person_id)
values (3, 8906.42, 3, 922428251);
commit;
prompt 100 records committed...
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 23297.62, 2, 742220858);
insert into TRAINER (seniority, salary, rating, person_id)
values (16, 16822.54, 2, 146924485);
insert into TRAINER (seniority, salary, rating, person_id)
values (5, 17370.43, 3, 250146889);
insert into TRAINER (seniority, salary, rating, person_id)
values (5, 5936.82, 4, 584468952);
insert into TRAINER (seniority, salary, rating, person_id)
values (1, 5055.17, 3, 583024899);
insert into TRAINER (seniority, salary, rating, person_id)
values (18, 23888.63, 4, 679393117);
insert into TRAINER (seniority, salary, rating, person_id)
values (4, 14671.77, 1, 773115408);
insert into TRAINER (seniority, salary, rating, person_id)
values (5, 16084.7, 4, 558402416);
insert into TRAINER (seniority, salary, rating, person_id)
values (11, 4984.79, 2, 774448110);
insert into TRAINER (seniority, salary, rating, person_id)
values (18, 22511.67, 4, 317822031);
insert into TRAINER (seniority, salary, rating, person_id)
values (15, 13932.86, 4, 373839373);
insert into TRAINER (seniority, salary, rating, person_id)
values (16, 2264.94, 1, 379652390);
insert into TRAINER (seniority, salary, rating, person_id)
values (14, 14626.29, 5, 732473732);
insert into TRAINER (seniority, salary, rating, person_id)
values (16, 15861.93, 5, 478902541);
insert into TRAINER (seniority, salary, rating, person_id)
values (8, 4301.82, 1, 623674412);
insert into TRAINER (seniority, salary, rating, person_id)
values (4, 3495.15, 4, 867765371);
insert into TRAINER (seniority, salary, rating, person_id)
values (1, 2824.45, 3, 894045375);
insert into TRAINER (seniority, salary, rating, person_id)
values (9, 22947, 2, 931203266);
insert into TRAINER (seniority, salary, rating, person_id)
values (11, 5323.67, 5, 124985854);
insert into TRAINER (seniority, salary, rating, person_id)
values (8, 15725.77, 5, 741975218);
insert into TRAINER (seniority, salary, rating, person_id)
values (5, 19527.91, 3, 264816972);
insert into TRAINER (seniority, salary, rating, person_id)
values (12, 7442.84, 1, 358572361);
insert into TRAINER (seniority, salary, rating, person_id)
values (1, 3511.76, 2, 933857373);
insert into TRAINER (seniority, salary, rating, person_id)
values (19, 24141.04, 2, 999747607);
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 12037.05, 5, 222410846);
insert into TRAINER (seniority, salary, rating, person_id)
values (17, 15997.31, 3, 438455310);
insert into TRAINER (seniority, salary, rating, person_id)
values (20, 14494.74, 2, 176771449);
insert into TRAINER (seniority, salary, rating, person_id)
values (19, 24758.99, 2, 154015286);
insert into TRAINER (seniority, salary, rating, person_id)
values (20, 13601.9, 3, 726029513);
insert into TRAINER (seniority, salary, rating, person_id)
values (4, 23101.51, 2, 292421869);
insert into TRAINER (seniority, salary, rating, person_id)
values (17, 20940.2, 5, 851536797);
insert into TRAINER (seniority, salary, rating, person_id)
values (16, 8413.91, 3, 479467077);
insert into TRAINER (seniority, salary, rating, person_id)
values (5, 9654.12, 4, 153938151);
insert into TRAINER (seniority, salary, rating, person_id)
values (5, 3822.43, 2, 264615737);
insert into TRAINER (seniority, salary, rating, person_id)
values (20, 55606.39, 5, 501705989);
insert into TRAINER (seniority, salary, rating, person_id)
values (7, 18129.25, 4, 152300229);
insert into TRAINER (seniority, salary, rating, person_id)
values (14, 14931.47, 1, 957557141);
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 18784.35, 4, 309422947);
insert into TRAINER (seniority, salary, rating, person_id)
values (9, 12050.63, 5, 618692425);
insert into TRAINER (seniority, salary, rating, person_id)
values (16, 17899.13, 3, 104937452);
insert into TRAINER (seniority, salary, rating, person_id)
values (18, 7939.47, 4, 765927503);
insert into TRAINER (seniority, salary, rating, person_id)
values (6, 12120.45, 5, 923766112);
insert into TRAINER (seniority, salary, rating, person_id)
values (7, 15022.76, 5, 330031171);
insert into TRAINER (seniority, salary, rating, person_id)
values (10, 22236.68, 5, 786496745);
insert into TRAINER (seniority, salary, rating, person_id)
values (14, 16134.09, 1, 375506538);
insert into TRAINER (seniority, salary, rating, person_id)
values (15, 5145.4, 2, 194690926);
insert into TRAINER (seniority, salary, rating, person_id)
values (20, 15090.79, 2, 241957656);
insert into TRAINER (seniority, salary, rating, person_id)
values (20, 18752.71, 2, 238646522);
insert into TRAINER (seniority, salary, rating, person_id)
values (7, 7811.19, 1, 811670082);
insert into TRAINER (seniority, salary, rating, person_id)
values (1, 19314.93, 4, 443970722);
insert into TRAINER (seniority, salary, rating, person_id)
values (20, 4698.82, 1, 141837640);
insert into TRAINER (seniority, salary, rating, person_id)
values (19, 9818.22, 3, 731197644);
insert into TRAINER (seniority, salary, rating, person_id)
values (9, 3570.24, 1, 237832955);
insert into TRAINER (seniority, salary, rating, person_id)
values (9, 2846.34, 4, 977191746);
insert into TRAINER (seniority, salary, rating, person_id)
values (17, 9868.39, 1, 392223508);
insert into TRAINER (seniority, salary, rating, person_id)
values (15, 17578.3, 4, 246305254);
insert into TRAINER (seniority, salary, rating, person_id)
values (4, 3041.96, 3, 181050162);
insert into TRAINER (seniority, salary, rating, person_id)
values (14, 2200.52, 1, 677684763);
insert into TRAINER (seniority, salary, rating, person_id)
values (13, 22120.17, 2, 607570811);
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 24639.76, 1, 172274041);
insert into TRAINER (seniority, salary, rating, person_id)
values (16, 6634.69, 2, 687150404);
insert into TRAINER (seniority, salary, rating, person_id)
values (17, 9949.12, 4, 466025294);
insert into TRAINER (seniority, salary, rating, person_id)
values (17, 11946.87, 2, 534848455);
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 13710.69, 5, 913311862);
insert into TRAINER (seniority, salary, rating, person_id)
values (16, 13489.51, 3, 496569875);
insert into TRAINER (seniority, salary, rating, person_id)
values (5, 15084.55, 3, 978982125);
insert into TRAINER (seniority, salary, rating, person_id)
values (20, 21057.33, 1, 505637388);
insert into TRAINER (seniority, salary, rating, person_id)
values (12, 19811.96, 3, 637214817);
insert into TRAINER (seniority, salary, rating, person_id)
values (17, 24338.71, 3, 854442670);
insert into TRAINER (seniority, salary, rating, person_id)
values (14, 15156.72, 2, 982228959);
insert into TRAINER (seniority, salary, rating, person_id)
values (3, 19595.24, 4, 428261058);
insert into TRAINER (seniority, salary, rating, person_id)
values (20, 6045.65, 1, 129186647);
insert into TRAINER (seniority, salary, rating, person_id)
values (7, 24005.81, 3, 792537826);
insert into TRAINER (seniority, salary, rating, person_id)
values (13, 4384.36, 5, 250161276);
insert into TRAINER (seniority, salary, rating, person_id)
values (15, 8008.32, 1, 882145843);
insert into TRAINER (seniority, salary, rating, person_id)
values (13, 14549.92, 5, 199129162);
insert into TRAINER (seniority, salary, rating, person_id)
values (8, 21378.54, 3, 170042836);
insert into TRAINER (seniority, salary, rating, person_id)
values (3, 21130, 3, 675194468);
insert into TRAINER (seniority, salary, rating, person_id)
values (6, 8729.61, 1, 721297891);
insert into TRAINER (seniority, salary, rating, person_id)
values (19, 8976.77, 5, 144642188);
insert into TRAINER (seniority, salary, rating, person_id)
values (7, 6959.15, 1, 811445548);
insert into TRAINER (seniority, salary, rating, person_id)
values (11, 14277.79, 5, 383440042);
insert into TRAINER (seniority, salary, rating, person_id)
values (20, 16081.34, 3, 918096886);
insert into TRAINER (seniority, salary, rating, person_id)
values (16, 24996.11, 4, 576328517);
insert into TRAINER (seniority, salary, rating, person_id)
values (16, 2236.17, 3, 151674046);
insert into TRAINER (seniority, salary, rating, person_id)
values (5, 22500.64, 5, 240883177);
insert into TRAINER (seniority, salary, rating, person_id)
values (16, 9922.3, 1, 168836760);
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 17807.64, 1, 920426797);
insert into TRAINER (seniority, salary, rating, person_id)
values (15, 17379.7, 4, 840761695);
insert into TRAINER (seniority, salary, rating, person_id)
values (1, 15566.83, 1, 527655639);
insert into TRAINER (seniority, salary, rating, person_id)
values (4, 18185.48, 5, 835284851);
insert into TRAINER (seniority, salary, rating, person_id)
values (18, 5127.12, 5, 373631073);
insert into TRAINER (seniority, salary, rating, person_id)
values (20, 10214.25, 3, 305981991);
insert into TRAINER (seniority, salary, rating, person_id)
values (4, 21287.45, 3, 955659426);
insert into TRAINER (seniority, salary, rating, person_id)
values (18, 14230.17, 2, 720995190);
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 14367.59, 5, 168520613);
insert into TRAINER (seniority, salary, rating, person_id)
values (7, 18457.45, 1, 317838008);
insert into TRAINER (seniority, salary, rating, person_id)
values (12, 11289.83, 4, 662847896);
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 4057.32, 2, 908730507);
insert into TRAINER (seniority, salary, rating, person_id)
values (18, 14415.83, 4, 936984007);
commit;
prompt 200 records committed...
insert into TRAINER (seniority, salary, rating, person_id)
values (15, 15181.89, 3, 556099069);
insert into TRAINER (seniority, salary, rating, person_id)
values (11, 15037.91, 5, 208588663);
insert into TRAINER (seniority, salary, rating, person_id)
values (11, 11344.57, 2, 357964464);
insert into TRAINER (seniority, salary, rating, person_id)
values (13, 3074.24, 5, 412832580);
insert into TRAINER (seniority, salary, rating, person_id)
values (14, 7388.88, 5, 372751059);
insert into TRAINER (seniority, salary, rating, person_id)
values (10, 17756.55, 3, 666205340);
insert into TRAINER (seniority, salary, rating, person_id)
values (5, 22107.46, 3, 124964227);
insert into TRAINER (seniority, salary, rating, person_id)
values (1, 13422.73, 2, 787927993);
insert into TRAINER (seniority, salary, rating, person_id)
values (14, 2627.89, 3, 826589049);
insert into TRAINER (seniority, salary, rating, person_id)
values (1, 10302.55, 1, 639106141);
insert into TRAINER (seniority, salary, rating, person_id)
values (18, 9825.75, 2, 944654806);
insert into TRAINER (seniority, salary, rating, person_id)
values (4, 18747.47, 4, 548962651);
insert into TRAINER (seniority, salary, rating, person_id)
values (13, 21069.01, 5, 834466751);
insert into TRAINER (seniority, salary, rating, person_id)
values (10, 19220.75, 2, 950034758);
insert into TRAINER (seniority, salary, rating, person_id)
values (5, 24430.88, 4, 179779567);
insert into TRAINER (seniority, salary, rating, person_id)
values (5, 23527.41, 4, 245348975);
insert into TRAINER (seniority, salary, rating, person_id)
values (17, 22426.88, 2, 511271917);
insert into TRAINER (seniority, salary, rating, person_id)
values (3, 3985.4, 4, 426365238);
insert into TRAINER (seniority, salary, rating, person_id)
values (14, 15335.38, 3, 626464892);
insert into TRAINER (seniority, salary, rating, person_id)
values (17, 3529.59, 5, 928999987);
insert into TRAINER (seniority, salary, rating, person_id)
values (18, 21356.26, 4, 293747357);
insert into TRAINER (seniority, salary, rating, person_id)
values (6, 9029.6, 4, 363744559);
insert into TRAINER (seniority, salary, rating, person_id)
values (17, 3402.89, 5, 847656702);
insert into TRAINER (seniority, salary, rating, person_id)
values (10, 9259.39, 4, 920460836);
insert into TRAINER (seniority, salary, rating, person_id)
values (17, 23554.51, 1, 743881857);
insert into TRAINER (seniority, salary, rating, person_id)
values (6, 21125.79, 2, 911045673);
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 14149.35, 5, 235281661);
insert into TRAINER (seniority, salary, rating, person_id)
values (9, 7361.89, 3, 206629316);
insert into TRAINER (seniority, salary, rating, person_id)
values (6, 22674.99, 1, 375154552);
insert into TRAINER (seniority, salary, rating, person_id)
values (12, 6437.83, 1, 264728817);
insert into TRAINER (seniority, salary, rating, person_id)
values (8, 15631.58, 1, 299788152);
insert into TRAINER (seniority, salary, rating, person_id)
values (9, 19480.99, 4, 782064933);
insert into TRAINER (seniority, salary, rating, person_id)
values (17, 3213.8, 4, 434172398);
insert into TRAINER (seniority, salary, rating, person_id)
values (14, 8311.41, 5, 696983605);
insert into TRAINER (seniority, salary, rating, person_id)
values (11, 6761.93, 3, 273396102);
insert into TRAINER (seniority, salary, rating, person_id)
values (17, 5838.67, 2, 457984284);
insert into TRAINER (seniority, salary, rating, person_id)
values (10, 9393.02, 4, 509662169);
insert into TRAINER (seniority, salary, rating, person_id)
values (20, 12775.65, 2, 435897536);
insert into TRAINER (seniority, salary, rating, person_id)
values (11, 2453.81, 1, 967021982);
insert into TRAINER (seniority, salary, rating, person_id)
values (11, 21228.12, 3, 491367469);
insert into TRAINER (seniority, salary, rating, person_id)
values (19, 18591.96, 4, 481541006);
insert into TRAINER (seniority, salary, rating, person_id)
values (11, 2913.66, 3, 128003805);
insert into TRAINER (seniority, salary, rating, person_id)
values (1, 3345.54, 4, 708105307);
insert into TRAINER (seniority, salary, rating, person_id)
values (15, 10640.7, 1, 963758267);
insert into TRAINER (seniority, salary, rating, person_id)
values (1, 8870.43, 1, 188014768);
insert into TRAINER (seniority, salary, rating, person_id)
values (20, 10583.96, 4, 649768071);
insert into TRAINER (seniority, salary, rating, person_id)
values (6, 8715.73, 4, 696374837);
insert into TRAINER (seniority, salary, rating, person_id)
values (20, 20947.49, 3, 862511399);
insert into TRAINER (seniority, salary, rating, person_id)
values (15, 16363.39, 5, 592162027);
insert into TRAINER (seniority, salary, rating, person_id)
values (9, 2792.7, 3, 252975811);
insert into TRAINER (seniority, salary, rating, person_id)
values (3, 18029.91, 4, 126356435);
insert into TRAINER (seniority, salary, rating, person_id)
values (6, 14685.85, 4, 799006955);
insert into TRAINER (seniority, salary, rating, person_id)
values (14, 14101.39, 1, 980173326);
insert into TRAINER (seniority, salary, rating, person_id)
values (6, 21920.99, 3, 920943612);
insert into TRAINER (seniority, salary, rating, person_id)
values (3, 10530.11, 1, 595483134);
insert into TRAINER (seniority, salary, rating, person_id)
values (7, 4504.44, 2, 296165656);
insert into TRAINER (seniority, salary, rating, person_id)
values (18, 7212.22, 3, 970138584);
insert into TRAINER (seniority, salary, rating, person_id)
values (3, 13133.48, 2, 838534272);
insert into TRAINER (seniority, salary, rating, person_id)
values (4, 12400.54, 5, 572513020);
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 24917.33, 1, 352072255);
insert into TRAINER (seniority, salary, rating, person_id)
values (17, 16972.25, 1, 907256920);
insert into TRAINER (seniority, salary, rating, person_id)
values (10, 23795.92, 4, 616052079);
insert into TRAINER (seniority, salary, rating, person_id)
values (7, 17682.01, 4, 815735034);
insert into TRAINER (seniority, salary, rating, person_id)
values (4, 23447.83, 5, 837311276);
insert into TRAINER (seniority, salary, rating, person_id)
values (6, 23745.61, 3, 703786319);
insert into TRAINER (seniority, salary, rating, person_id)
values (9, 2446.68, 3, 403050636);
insert into TRAINER (seniority, salary, rating, person_id)
values (16, 6955.38, 4, 289832097);
insert into TRAINER (seniority, salary, rating, person_id)
values (3, 23505.32, 1, 656950868);
insert into TRAINER (seniority, salary, rating, person_id)
values (15, 18211.71, 1, 552548536);
insert into TRAINER (seniority, salary, rating, person_id)
values (9, 8898.76, 5, 170243739);
insert into TRAINER (seniority, salary, rating, person_id)
values (10, 4752.11, 3, 115518036);
insert into TRAINER (seniority, salary, rating, person_id)
values (18, 15699.22, 3, 193012006);
insert into TRAINER (seniority, salary, rating, person_id)
values (19, 22742.35, 2, 126638060);
insert into TRAINER (seniority, salary, rating, person_id)
values (17, 2649.88, 3, 517199517);
insert into TRAINER (seniority, salary, rating, person_id)
values (14, 5780.38, 2, 331610494);
insert into TRAINER (seniority, salary, rating, person_id)
values (5, 4234.12, 1, 915122110);
insert into TRAINER (seniority, salary, rating, person_id)
values (14, 5003.32, 5, 334399647);
insert into TRAINER (seniority, salary, rating, person_id)
values (15, 12535.31, 1, 295318534);
insert into TRAINER (seniority, salary, rating, person_id)
values (18, 8983.29, 5, 829092435);
insert into TRAINER (seniority, salary, rating, person_id)
values (15, 19933.66, 1, 837026985);
insert into TRAINER (seniority, salary, rating, person_id)
values (6, 20114.33, 3, 325527961);
insert into TRAINER (seniority, salary, rating, person_id)
values (10, 5216.18, 5, 503031840);
insert into TRAINER (seniority, salary, rating, person_id)
values (7, 21955.48, 2, 923597583);
insert into TRAINER (seniority, salary, rating, person_id)
values (7, 11713.96, 3, 463724524);
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 21194.89, 5, 955638737);
insert into TRAINER (seniority, salary, rating, person_id)
values (3, 24827.26, 4, 831558139);
insert into TRAINER (seniority, salary, rating, person_id)
values (14, 7880.87, 4, 783080526);
insert into TRAINER (seniority, salary, rating, person_id)
values (1, 15835.4, 2, 675296909);
insert into TRAINER (seniority, salary, rating, person_id)
values (4, 6646.12, 2, 617803786);
insert into TRAINER (seniority, salary, rating, person_id)
values (12, 5528.78, 5, 395672304);
insert into TRAINER (seniority, salary, rating, person_id)
values (20, 13605.01, 4, 145389736);
insert into TRAINER (seniority, salary, rating, person_id)
values (18, 7105.06, 3, 317827346);
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 16459.22, 3, 229177674);
insert into TRAINER (seniority, salary, rating, person_id)
values (14, 17298.46, 3, 220627730);
insert into TRAINER (seniority, salary, rating, person_id)
values (13, 24834.23, 3, 210963470);
insert into TRAINER (seniority, salary, rating, person_id)
values (11, 23663.33, 4, 764787755);
insert into TRAINER (seniority, salary, rating, person_id)
values (7, 24376.72, 2, 557038448);
insert into TRAINER (seniority, salary, rating, person_id)
values (16, 12415.58, 2, 844229081);
insert into TRAINER (seniority, salary, rating, person_id)
values (17, 23807.73, 3, 596818423);
insert into TRAINER (seniority, salary, rating, person_id)
values (15, 4409.61, 2, 556888328);
commit;
prompt 300 records committed...
insert into TRAINER (seniority, salary, rating, person_id)
values (10, 19105.74, 1, 698757041);
insert into TRAINER (seniority, salary, rating, person_id)
values (12, 5903.85, 1, 554350368);
insert into TRAINER (seniority, salary, rating, person_id)
values (14, 7501.44, 5, 515674654);
insert into TRAINER (seniority, salary, rating, person_id)
values (13, 5975.42, 3, 349700908);
insert into TRAINER (seniority, salary, rating, person_id)
values (13, 12961.77, 2, 123599375);
insert into TRAINER (seniority, salary, rating, person_id)
values (19, 13325.43, 3, 375351719);
insert into TRAINER (seniority, salary, rating, person_id)
values (15, 20204.24, 4, 539551740);
insert into TRAINER (seniority, salary, rating, person_id)
values (12, 20993.07, 4, 851470156);
insert into TRAINER (seniority, salary, rating, person_id)
values (5, 14620.24, 1, 992554869);
insert into TRAINER (seniority, salary, rating, person_id)
values (18, 24978.76, 5, 756961200);
insert into TRAINER (seniority, salary, rating, person_id)
values (1, 13481.07, 5, 178906385);
insert into TRAINER (seniority, salary, rating, person_id)
values (3, 24926.98, 5, 478380949);
insert into TRAINER (seniority, salary, rating, person_id)
values (1, 23561.36, 3, 153951230);
insert into TRAINER (seniority, salary, rating, person_id)
values (16, 3078.02, 3, 325077153);
insert into TRAINER (seniority, salary, rating, person_id)
values (9, 6627.49, 5, 226625742);
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 22535.25, 1, 767094858);
insert into TRAINER (seniority, salary, rating, person_id)
values (17, 12264.63, 3, 425058356);
insert into TRAINER (seniority, salary, rating, person_id)
values (13, 16970.9, 3, 744557849);
insert into TRAINER (seniority, salary, rating, person_id)
values (19, 18653.44, 5, 467275290);
insert into TRAINER (seniority, salary, rating, person_id)
values (7, 12363.65, 4, 554526290);
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 24030.7, 4, 948133904);
insert into TRAINER (seniority, salary, rating, person_id)
values (15, 20538.72, 2, 875272623);
insert into TRAINER (seniority, salary, rating, person_id)
values (18, 13809.66, 3, 121799050);
insert into TRAINER (seniority, salary, rating, person_id)
values (1, 2562.32, 2, 565571169);
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 13392.88, 5, 914453711);
insert into TRAINER (seniority, salary, rating, person_id)
values (8, 9671.81, 2, 411702990);
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 4320.92, 5, 109491053);
insert into TRAINER (seniority, salary, rating, person_id)
values (1, 19505.4, 3, 173200754);
insert into TRAINER (seniority, salary, rating, person_id)
values (5, 2349.84, 1, 786226109);
insert into TRAINER (seniority, salary, rating, person_id)
values (19, 16440.67, 3, 492752692);
insert into TRAINER (seniority, salary, rating, person_id)
values (1, 18655.45, 1, 525527704);
insert into TRAINER (seniority, salary, rating, person_id)
values (10, 22781.69, 1, 787378023);
insert into TRAINER (seniority, salary, rating, person_id)
values (14, 21384.83, 2, 570441676);
insert into TRAINER (seniority, salary, rating, person_id)
values (6, 14518.94, 2, 376109089);
insert into TRAINER (seniority, salary, rating, person_id)
values (11, 18469.91, 1, 280206586);
insert into TRAINER (seniority, salary, rating, person_id)
values (8, 9548.43, 4, 402379540);
insert into TRAINER (seniority, salary, rating, person_id)
values (9, 21104.77, 5, 372097171);
insert into TRAINER (seniority, salary, rating, person_id)
values (4, 8909.78, 1, 275393212);
insert into TRAINER (seniority, salary, rating, person_id)
values (11, 21478.68, 1, 677966690);
insert into TRAINER (seniority, salary, rating, person_id)
values (11, 24496.28, 3, 830160294);
insert into TRAINER (seniority, salary, rating, person_id)
values (11, 21210.1, 2, 934662057);
insert into TRAINER (seniority, salary, rating, person_id)
values (7, 8877.22, 2, 925132120);
insert into TRAINER (seniority, salary, rating, person_id)
values (8, 3993.35, 3, 183537357);
insert into TRAINER (seniority, salary, rating, person_id)
values (10, 21686.89, 1, 283643146);
insert into TRAINER (seniority, salary, rating, person_id)
values (18, 15296.41, 1, 307865478);
insert into TRAINER (seniority, salary, rating, person_id)
values (17, 24316.65, 3, 182111971);
insert into TRAINER (seniority, salary, rating, person_id)
values (9, 8906.29, 4, 728518500);
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 16100.56, 4, 199280229);
insert into TRAINER (seniority, salary, rating, person_id)
values (6, 19866.02, 3, 943746739);
insert into TRAINER (seniority, salary, rating, person_id)
values (4, 6873.16, 5, 625556109);
insert into TRAINER (seniority, salary, rating, person_id)
values (13, 18141.27, 2, 492316527);
insert into TRAINER (seniority, salary, rating, person_id)
values (4, 5959.41, 4, 558220660);
insert into TRAINER (seniority, salary, rating, person_id)
values (11, 23472.21, 2, 209716187);
insert into TRAINER (seniority, salary, rating, person_id)
values (15, 22707.39, 3, 208738794);
insert into TRAINER (seniority, salary, rating, person_id)
values (18, 19582.94, 1, 398601481);
insert into TRAINER (seniority, salary, rating, person_id)
values (7, 24063.17, 1, 148778614);
insert into TRAINER (seniority, salary, rating, person_id)
values (17, 8594.11, 5, 100171750);
insert into TRAINER (seniority, salary, rating, person_id)
values (14, 24755.98, 2, 324668142);
insert into TRAINER (seniority, salary, rating, person_id)
values (12, 5488.16, 2, 927761034);
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 3616.83, 3, 776564831);
insert into TRAINER (seniority, salary, rating, person_id)
values (9, 21343.35, 1, 200589852);
insert into TRAINER (seniority, salary, rating, person_id)
values (19, 16890.1, 4, 775393164);
insert into TRAINER (seniority, salary, rating, person_id)
values (10, 11552.03, 2, 891325545);
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 6557.6, 1, 725240443);
insert into TRAINER (seniority, salary, rating, person_id)
values (12, 17986.31, 5, 455403379);
insert into TRAINER (seniority, salary, rating, person_id)
values (14, 20482.8, 5, 742101151);
insert into TRAINER (seniority, salary, rating, person_id)
values (15, 22959.07, 5, 715945176);
insert into TRAINER (seniority, salary, rating, person_id)
values (16, 12808.03, 3, 617937771);
insert into TRAINER (seniority, salary, rating, person_id)
values (10, 6691.02, 5, 703260999);
insert into TRAINER (seniority, salary, rating, person_id)
values (16, 23578.2, 2, 645800410);
insert into TRAINER (seniority, salary, rating, person_id)
values (20, 4543.93, 3, 897043979);
insert into TRAINER (seniority, salary, rating, person_id)
values (19, 17126.36, 4, 501348097);
insert into TRAINER (seniority, salary, rating, person_id)
values (10, 22317.2, 1, 716184718);
insert into TRAINER (seniority, salary, rating, person_id)
values (18, 5473.49, 1, 812609164);
insert into TRAINER (seniority, salary, rating, person_id)
values (4, 6503.96, 4, 975459822);
insert into TRAINER (seniority, salary, rating, person_id)
values (1, 16140.19, 2, 191471146);
insert into TRAINER (seniority, salary, rating, person_id)
values (19, 16205.71, 4, 537375804);
insert into TRAINER (seniority, salary, rating, person_id)
values (19, 13273.92, 4, 870513504);
insert into TRAINER (seniority, salary, rating, person_id)
values (7, 23632.86, 1, 433213790);
insert into TRAINER (seniority, salary, rating, person_id)
values (18, 16773.59, 3, 544043768);
insert into TRAINER (seniority, salary, rating, person_id)
values (18, 13634.21, 1, 466069898);
insert into TRAINER (seniority, salary, rating, person_id)
values (6, 7920.16, 2, 660886697);
insert into TRAINER (seniority, salary, rating, person_id)
values (5, 2433.05, 2, 904929173);
insert into TRAINER (seniority, salary, rating, person_id)
values (12, 19335.88, 3, 823910760);
insert into TRAINER (seniority, salary, rating, person_id)
values (8, 4935.09, 5, 610512281);
insert into TRAINER (seniority, salary, rating, person_id)
values (20, 9543, 3, 873456697);
insert into TRAINER (seniority, salary, rating, person_id)
values (9, 2367.86, 1, 973326469);
insert into TRAINER (seniority, salary, rating, person_id)
values (6, 24377.86, 5, 158277278);
insert into TRAINER (seniority, salary, rating, person_id)
values (15, 8278.59, 4, 605591541);
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 17014.94, 4, 205825700);
insert into TRAINER (seniority, salary, rating, person_id)
values (13, 23451.45, 2, 830941935);
insert into TRAINER (seniority, salary, rating, person_id)
values (19, 17546.18, 2, 295295075);
insert into TRAINER (seniority, salary, rating, person_id)
values (8, 23037.59, 4, 923811818);
insert into TRAINER (seniority, salary, rating, person_id)
values (5, 12121.46, 4, 596082387);
insert into TRAINER (seniority, salary, rating, person_id)
values (15, 3774.49, 5, 218057742);
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 21887.74, 5, 344533634);
insert into TRAINER (seniority, salary, rating, person_id)
values (16, 7909.91, 5, 597219131);
insert into TRAINER (seniority, salary, rating, person_id)
values (4, 6391.59, 4, 236436336);
insert into TRAINER (seniority, salary, rating, person_id)
values (1, 7207.13, 1, 339168131);
insert into TRAINER (seniority, salary, rating, person_id)
values (19, 11641.38, 3, 496082620);
commit;
prompt 400 records committed...
insert into TRAINER (seniority, salary, rating, person_id)
values (16, 7775.68, 2, 836251609);
insert into TRAINER (seniority, salary, rating, person_id)
values (17, 16089.42, 5, 610286655);
insert into TRAINER (seniority, salary, rating, person_id)
values (15, 6050.25, 4, 451092501);
insert into TRAINER (seniority, salary, rating, person_id)
values (8, 14928.54, 3, 137211133);
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 7887.34, 2, 447040488);
insert into TRAINER (seniority, salary, rating, person_id)
values (16, 9347.98, 2, 474084615);
insert into TRAINER (seniority, salary, rating, person_id)
values (7, 21951.74, 2, 160062237);
insert into TRAINER (seniority, salary, rating, person_id)
values (12, 15345.18, 3, 343418940);
insert into TRAINER (seniority, salary, rating, person_id)
values (3, 22553.51, 4, 758646772);
insert into TRAINER (seniority, salary, rating, person_id)
values (1, 14318.18, 4, 815956026);
insert into TRAINER (seniority, salary, rating, person_id)
values (15, 24969.67, 5, 631847604);
insert into TRAINER (seniority, salary, rating, person_id)
values (13, 19934.76, 3, 489630456);
insert into TRAINER (seniority, salary, rating, person_id)
values (20, 92663.15, 5, 942622933);
insert into TRAINER (seniority, salary, rating, person_id)
values (16, 22832.6, 5, 178726838);
insert into TRAINER (seniority, salary, rating, person_id)
values (7, 5437.77, 4, 558821746);
insert into TRAINER (seniority, salary, rating, person_id)
values (20, 2274.56, 1, 624127356);
insert into TRAINER (seniority, salary, rating, person_id)
values (9, 18731.22, 1, 829145191);
insert into TRAINER (seniority, salary, rating, person_id)
values (16, 13665.38, 4, 543584585);
insert into TRAINER (seniority, salary, rating, person_id)
values (3, 21622.78, 4, 610737497);
insert into TRAINER (seniority, salary, rating, person_id)
values (6, 20676.8, 2, 129756457);
insert into TRAINER (seniority, salary, rating, person_id)
values (1, 6457.1, 4, 402413501);
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 5719.65, 5, 453477723);
insert into TRAINER (seniority, salary, rating, person_id)
values (14, 4155.98, 3, 709751915);
insert into TRAINER (seniority, salary, rating, person_id)
values (16, 20780.13, 4, 695020064);
insert into TRAINER (seniority, salary, rating, person_id)
values (2, 16883.31, 3, 849129256);
insert into TRAINER (seniority, salary, rating, person_id)
values (4, 20910.56, 1, 755809998);
insert into TRAINER (seniority, salary, rating, person_id)
values (9, 4559.62, 2, 846419707);
insert into TRAINER (seniority, salary, rating, person_id)
values (5, 5859.32, 1, 207996683);
insert into TRAINER (seniority, salary, rating, person_id)
values (4, 20921.07, 3, 811411011);
insert into TRAINER (seniority, salary, rating, person_id)
values (3, 24197.62, 4, 670045074);
insert into TRAINER (seniority, salary, rating, person_id)
values (3, 3098.13, 3, 571442515);
insert into TRAINER (seniority, salary, rating, person_id)
values (20, 12871.09, 2, 940410755);
insert into TRAINER (seniority, salary, rating, person_id)
values (6, 18100.02, 4, 595283787);
insert into TRAINER (seniority, salary, rating, person_id)
values (15, 12607.94, 4, 487726448);
insert into TRAINER (seniority, salary, rating, person_id)
values (19, 5110.75, 4, 758061612);
insert into TRAINER (seniority, salary, rating, person_id)
values (7, 16276.43, 2, 160302987);
insert into TRAINER (seniority, salary, rating, person_id)
values (6, 17314.55, 5, 199724940);
insert into TRAINER (seniority, salary, rating, person_id)
values (15, 17904.82, 3, 118520760);
insert into TRAINER (seniority, salary, rating, person_id)
values (20, 16723.3, 3, 542098274);
insert into TRAINER (seniority, salary, rating, person_id)
values (19, 24547.63, 3, 598823879);
insert into TRAINER (seniority, salary, rating, person_id)
values (7, 17818.37, 3, 624917762);
insert into TRAINER (seniority, salary, rating, person_id)
values (10, 16891.39, 4, 648883310);
insert into TRAINER (seniority, salary, rating, person_id)
values (17, 5664.87, 5, 873682714);
insert into TRAINER (seniority, salary, rating, person_id)
values (12, 3885.88, 3, 382781490);
insert into TRAINER (seniority, salary, rating, person_id)
values (12, 22747.07, 2, 932610681);
commit;
prompt 445 records loaded
prompt Loading TRAINING...
insert into TRAINING (training_code, training_type, duration, constrains)
values (196, 'Cardio', 70, 'health condition heart condition');
insert into TRAINING (training_code, training_type, duration, constrains)
values (197, 'Yoga', 105, 'experience expert');
insert into TRAINING (training_code, training_type, duration, constrains)
values (198, 'Strength Training', 84, 'age between 18 and 40');
insert into TRAINING (training_code, training_type, duration, constrains)
values (199, 'Pilates', 85, 'physical state healthy');
insert into TRAINING (training_code, training_type, duration, constrains)
values (200, 'Boxing', 60, 'physical state healthy');
insert into TRAINING (training_code, training_type, duration, constrains)
values (201, 'Pilates', 91, 'physical state recovering');
insert into TRAINING (training_code, training_type, duration, constrains)
values (202, 'Strength Training', 58, 'age below 60');
insert into TRAINING (training_code, training_type, duration, constrains)
values (203, 'Dance', 40, 'physical state pregnant');
insert into TRAINING (training_code, training_type, duration, constrains)
values (204, 'CrossFit', 39, 'age between 18 and 40');
insert into TRAINING (training_code, training_type, duration, constrains)
values (205, 'Boxing', 71, 'age below 50');
insert into TRAINING (training_code, training_type, duration, constrains)
values (206, 'Boxing', 64, 'physical state healthy');
insert into TRAINING (training_code, training_type, duration, constrains)
values (207, 'Yoga', 73, 'age between 18 and 40');
insert into TRAINING (training_code, training_type, duration, constrains)
values (208, 'Cardio', 72, 'health condition asthma');
insert into TRAINING (training_code, training_type, duration, constrains)
values (209, 'Yoga', 48, 'health condition heart condition');
insert into TRAINING (training_code, training_type, duration, constrains)
values (210, 'Dance', 89, 'physical state pregnant');
insert into TRAINING (training_code, training_type, duration, constrains)
values (211, 'Cardio', 52, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (212, 'Cardio', 67, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (213, 'Spinning', 52, 'health condition obesity');
insert into TRAINING (training_code, training_type, duration, constrains)
values (214, 'Cardio', 40, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (215, 'Yoga', 35, 'physical state disabled');
insert into TRAINING (training_code, training_type, duration, constrains)
values (216, 'HIIT', 73, 'physical state injured');
insert into TRAINING (training_code, training_type, duration, constrains)
values (217, 'Zumba', 84, 'age above 12');
insert into TRAINING (training_code, training_type, duration, constrains)
values (218, 'Zumba', 69, 'physical state injured');
insert into TRAINING (training_code, training_type, duration, constrains)
values (219, 'Yoga', 74, 'age above 8');
insert into TRAINING (training_code, training_type, duration, constrains)
values (220, 'Pilates', 38, 'age above 8');
insert into TRAINING (training_code, training_type, duration, constrains)
values (221, 'Zumba', 85, 'experience expert');
insert into TRAINING (training_code, training_type, duration, constrains)
values (222, 'Boxing', 69, 'age above 12');
insert into TRAINING (training_code, training_type, duration, constrains)
values (223, 'Yoga', 42, 'age above 8');
insert into TRAINING (training_code, training_type, duration, constrains)
values (224, 'Yoga', 87, 'age below 50');
insert into TRAINING (training_code, training_type, duration, constrains)
values (225, 'Pilates', 34, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (226, 'Yoga', 41, 'age between 18 and 40');
insert into TRAINING (training_code, training_type, duration, constrains)
values (227, 'Pilates', 30, 'health condition heart condition');
insert into TRAINING (training_code, training_type, duration, constrains)
values (228, 'Boxing', 98, 'health condition hypertension');
insert into TRAINING (training_code, training_type, duration, constrains)
values (229, 'Pilates', 66, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (230, 'Pilates', 91, 'health condition diabetes');
insert into TRAINING (training_code, training_type, duration, constrains)
values (231, 'CrossFit', 89, 'age between 18 and 40');
insert into TRAINING (training_code, training_type, duration, constrains)
values (232, 'CrossFit', 94, 'experience expert');
insert into TRAINING (training_code, training_type, duration, constrains)
values (233, 'Spinning', 93, 'age below 60');
insert into TRAINING (training_code, training_type, duration, constrains)
values (234, 'Boxing', 82, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (235, 'HIIT', 67, 'physical state healthy');
insert into TRAINING (training_code, training_type, duration, constrains)
values (236, 'Boxing', 48, 'physical state disabled');
insert into TRAINING (training_code, training_type, duration, constrains)
values (237, 'Dance', 102, 'health condition asthma');
insert into TRAINING (training_code, training_type, duration, constrains)
values (238, 'CrossFit', 70, 'age below 60');
insert into TRAINING (training_code, training_type, duration, constrains)
values (239, 'Yoga', 54, 'age below 60');
insert into TRAINING (training_code, training_type, duration, constrains)
values (240, 'Pilates', 44, 'physical state disabled');
insert into TRAINING (training_code, training_type, duration, constrains)
values (241, 'HIIT', 55, 'physical state injured');
insert into TRAINING (training_code, training_type, duration, constrains)
values (242, 'Dance', 115, 'age above 8');
insert into TRAINING (training_code, training_type, duration, constrains)
values (243, 'Yoga', 49, 'experience expert');
insert into TRAINING (training_code, training_type, duration, constrains)
values (244, 'Boxing', 91, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (245, 'Zumba', 77, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (246, 'Dance', 84, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (247, 'Dance', 97, 'experience expert');
insert into TRAINING (training_code, training_type, duration, constrains)
values (248, 'HIIT', 52, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (249, 'Dance', 32, 'age above 8');
insert into TRAINING (training_code, training_type, duration, constrains)
values (250, 'CrossFit', 39, 'age above 12');
insert into TRAINING (training_code, training_type, duration, constrains)
values (251, 'Boxing', 33, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (252, 'Yoga', 50, 'experience expert');
insert into TRAINING (training_code, training_type, duration, constrains)
values (253, 'Cardio', 34, 'health condition hypertension');
insert into TRAINING (training_code, training_type, duration, constrains)
values (254, 'Spinning', 82, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (255, 'Spinning', 100, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (256, 'HIIT', 97, 'age above 12');
insert into TRAINING (training_code, training_type, duration, constrains)
values (257, 'HIIT', 78, 'physical state pregnant');
insert into TRAINING (training_code, training_type, duration, constrains)
values (258, 'Strength Training', 46, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (259, 'Strength Training', 81, 'physical state injured');
insert into TRAINING (training_code, training_type, duration, constrains)
values (260, 'Spinning', 44, 'age above 12');
insert into TRAINING (training_code, training_type, duration, constrains)
values (261, 'Dance', 100, 'health condition diabetes');
insert into TRAINING (training_code, training_type, duration, constrains)
values (262, 'Dance', 31, 'age above 12');
insert into TRAINING (training_code, training_type, duration, constrains)
values (263, 'Dance', 86, 'health condition obesity');
insert into TRAINING (training_code, training_type, duration, constrains)
values (264, 'Spinning', 57, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (265, 'Zumba', 60, 'health condition diabetes');
insert into TRAINING (training_code, training_type, duration, constrains)
values (266, 'HIIT', 45, 'health condition asthma');
insert into TRAINING (training_code, training_type, duration, constrains)
values (267, 'Yoga', 113, 'physical state recovering');
insert into TRAINING (training_code, training_type, duration, constrains)
values (268, 'Pilates', 30, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (269, 'Boxing', 45, 'age above 8');
insert into TRAINING (training_code, training_type, duration, constrains)
values (270, 'Spinning', 115, 'age below 50');
insert into TRAINING (training_code, training_type, duration, constrains)
values (271, 'Dance', 114, 'health condition heart condition');
insert into TRAINING (training_code, training_type, duration, constrains)
values (272, 'HIIT', 46, 'physical state disabled');
insert into TRAINING (training_code, training_type, duration, constrains)
values (273, 'Dance', 54, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (274, 'Yoga', 109, 'experience expert');
insert into TRAINING (training_code, training_type, duration, constrains)
values (275, 'Spinning', 94, 'physical state healthy');
insert into TRAINING (training_code, training_type, duration, constrains)
values (276, 'Strength Training', 116, 'physical state disabled');
insert into TRAINING (training_code, training_type, duration, constrains)
values (277, 'Pilates', 82, 'age above 12');
insert into TRAINING (training_code, training_type, duration, constrains)
values (278, 'HIIT', 71, 'age below 60');
insert into TRAINING (training_code, training_type, duration, constrains)
values (279, 'Cardio', 54, 'age above 8');
insert into TRAINING (training_code, training_type, duration, constrains)
values (280, 'Yoga', 57, 'experience expert');
insert into TRAINING (training_code, training_type, duration, constrains)
values (281, 'CrossFit', 47, 'age above 8');
insert into TRAINING (training_code, training_type, duration, constrains)
values (282, 'Yoga', 86, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (283, 'Cardio', 38, 'age between 18 and 40');
insert into TRAINING (training_code, training_type, duration, constrains)
values (284, 'Spinning', 31, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (285, 'Zumba', 93, 'experience expert');
insert into TRAINING (training_code, training_type, duration, constrains)
values (286, 'Zumba', 53, 'age above 8');
insert into TRAINING (training_code, training_type, duration, constrains)
values (287, 'Yoga', 101, 'age between 18 and 40');
insert into TRAINING (training_code, training_type, duration, constrains)
values (288, 'CrossFit', 105, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (289, 'Cardio', 114, 'health condition heart condition');
insert into TRAINING (training_code, training_type, duration, constrains)
values (290, 'Strength Training', 81, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (291, 'Cardio', 67, 'physical state healthy');
insert into TRAINING (training_code, training_type, duration, constrains)
values (292, 'Strength Training', 87, 'physical state disabled');
insert into TRAINING (training_code, training_type, duration, constrains)
values (293, 'Pilates', 74, 'physical state pregnant');
insert into TRAINING (training_code, training_type, duration, constrains)
values (294, 'Cardio', 105, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (295, 'HIIT', 33, 'fitness level intermediate');
commit;
prompt 100 records committed...
insert into TRAINING (training_code, training_type, duration, constrains)
values (296, 'Dance', 72, 'physical state recovering');
insert into TRAINING (training_code, training_type, duration, constrains)
values (297, 'Spinning', 95, 'experience expert');
insert into TRAINING (training_code, training_type, duration, constrains)
values (298, 'Cardio', 83, 'physical state pregnant');
insert into TRAINING (training_code, training_type, duration, constrains)
values (299, 'CrossFit', 69, 'health condition diabetes');
insert into TRAINING (training_code, training_type, duration, constrains)
values (300, 'Pilates', 69, 'health condition obesity');
insert into TRAINING (training_code, training_type, duration, constrains)
values (301, 'Pilates', 61, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (302, 'Zumba', 34, 'physical state disabled');
insert into TRAINING (training_code, training_type, duration, constrains)
values (303, 'Strength Training', 57, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (304, 'CrossFit', 107, 'age above 8');
insert into TRAINING (training_code, training_type, duration, constrains)
values (305, 'HIIT', 80, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (306, 'HIIT', 86, 'experience expert');
insert into TRAINING (training_code, training_type, duration, constrains)
values (307, 'Strength Training', 59, 'physical state pregnant');
insert into TRAINING (training_code, training_type, duration, constrains)
values (308, 'Strength Training', 95, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (309, 'Strength Training', 80, 'age below 60');
insert into TRAINING (training_code, training_type, duration, constrains)
values (310, 'Cardio', 113, 'physical state healthy');
insert into TRAINING (training_code, training_type, duration, constrains)
values (311, 'Zumba', 77, 'age above 8');
insert into TRAINING (training_code, training_type, duration, constrains)
values (312, 'Yoga', 67, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (313, 'CrossFit', 119, 'health condition heart condition');
insert into TRAINING (training_code, training_type, duration, constrains)
values (314, 'Yoga', 92, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (315, 'Dance', 99, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (316, 'Boxing', 61, 'experience expert');
insert into TRAINING (training_code, training_type, duration, constrains)
values (317, 'Dance', 58, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (318, 'HIIT', 56, 'physical state recovering');
insert into TRAINING (training_code, training_type, duration, constrains)
values (319, 'Boxing', 39, 'age below 60');
insert into TRAINING (training_code, training_type, duration, constrains)
values (320, 'Pilates', 103, 'physical state disabled');
insert into TRAINING (training_code, training_type, duration, constrains)
values (321, 'HIIT', 52, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (322, 'Boxing', 36, 'age between 18 and 40');
insert into TRAINING (training_code, training_type, duration, constrains)
values (323, 'Cardio', 69, 'physical state healthy');
insert into TRAINING (training_code, training_type, duration, constrains)
values (324, 'HIIT', 57, 'health condition hypertension');
insert into TRAINING (training_code, training_type, duration, constrains)
values (325, 'HIIT', 61, 'health condition asthma');
insert into TRAINING (training_code, training_type, duration, constrains)
values (326, 'Boxing', 38, 'age between 18 and 40');
insert into TRAINING (training_code, training_type, duration, constrains)
values (327, 'Yoga', 102, 'physical state pregnant');
insert into TRAINING (training_code, training_type, duration, constrains)
values (328, 'Spinning', 62, 'health condition diabetes');
insert into TRAINING (training_code, training_type, duration, constrains)
values (329, 'Zumba', 78, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (330, 'Dance', 34, 'age between 18 and 40');
insert into TRAINING (training_code, training_type, duration, constrains)
values (331, 'Yoga', 46, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (332, 'Pilates', 70, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (333, 'Pilates', 65, 'experience expert');
insert into TRAINING (training_code, training_type, duration, constrains)
values (334, 'Cardio', 120, 'physical state recovering');
insert into TRAINING (training_code, training_type, duration, constrains)
values (335, 'Yoga', 84, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (336, 'Spinning', 50, 'age below 60');
insert into TRAINING (training_code, training_type, duration, constrains)
values (337, 'Dance', 104, 'health condition asthma');
insert into TRAINING (training_code, training_type, duration, constrains)
values (338, 'Cardio', 87, 'health condition asthma');
insert into TRAINING (training_code, training_type, duration, constrains)
values (339, 'Yoga', 119, 'health condition asthma');
insert into TRAINING (training_code, training_type, duration, constrains)
values (340, 'CrossFit', 93, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (341, 'Spinning', 40, 'age below 60');
insert into TRAINING (training_code, training_type, duration, constrains)
values (342, 'Zumba', 58, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (343, 'Dance', 47, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (344, 'CrossFit', 44, 'experience expert');
insert into TRAINING (training_code, training_type, duration, constrains)
values (345, 'Zumba', 90, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (174, 'Strength Training', 119, 'physical state injured');
insert into TRAINING (training_code, training_type, duration, constrains)
values (175, 'Dance', 110, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (176, 'Strength Training', 85, 'age below 50');
insert into TRAINING (training_code, training_type, duration, constrains)
values (177, 'Pilates', 64, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (178, 'Spinning', 115, 'age below 60');
insert into TRAINING (training_code, training_type, duration, constrains)
values (179, 'Dance', 117, 'physical state injured');
insert into TRAINING (training_code, training_type, duration, constrains)
values (180, 'Strength Training', 120, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (181, 'Pilates', 44, 'health condition obesity');
insert into TRAINING (training_code, training_type, duration, constrains)
values (182, 'Zumba', 63, 'experience expert');
insert into TRAINING (training_code, training_type, duration, constrains)
values (183, 'Yoga', 76, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (184, 'Cardio', 55, 'physical state recovering');
insert into TRAINING (training_code, training_type, duration, constrains)
values (185, 'Dance', 59, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (186, 'Pilates', 115, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (187, 'Strength Training', 118, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (188, 'Spinning', 97, 'health condition heart condition');
insert into TRAINING (training_code, training_type, duration, constrains)
values (189, 'Yoga', 35, 'physical state healthy');
insert into TRAINING (training_code, training_type, duration, constrains)
values (190, 'Yoga', 38, 'physical state recovering');
insert into TRAINING (training_code, training_type, duration, constrains)
values (191, 'HIIT', 65, 'age above 8');
insert into TRAINING (training_code, training_type, duration, constrains)
values (192, 'Yoga', 41, 'age between 18 and 40');
insert into TRAINING (training_code, training_type, duration, constrains)
values (193, 'Spinning', 90, 'health condition obesity');
insert into TRAINING (training_code, training_type, duration, constrains)
values (194, 'Spinning', 61, 'physical state disabled');
insert into TRAINING (training_code, training_type, duration, constrains)
values (195, 'Dance', 89, 'health condition hypertension');
insert into TRAINING (training_code, training_type, duration, constrains)
values (346, 'Cardio', 61, 'physical state healthy');
insert into TRAINING (training_code, training_type, duration, constrains)
values (347, 'Zumba', 70, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (348, 'Yoga', 77, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (349, 'HIIT', 36, 'health condition obesity');
insert into TRAINING (training_code, training_type, duration, constrains)
values (350, 'HIIT', 31, 'age above 12');
insert into TRAINING (training_code, training_type, duration, constrains)
values (351, 'Strength Training', 65, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (352, 'Spinning', 110, 'age below 50');
insert into TRAINING (training_code, training_type, duration, constrains)
values (353, 'HIIT', 43, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (354, 'Boxing', 45, 'age below 60');
insert into TRAINING (training_code, training_type, duration, constrains)
values (355, 'HIIT', 73, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (356, 'Zumba', 120, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (357, 'Pilates', 74, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (358, 'Pilates', 74, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (359, 'Spinning', 110, 'physical state injured');
insert into TRAINING (training_code, training_type, duration, constrains)
values (360, 'CrossFit', 38, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (361, 'Boxing', 43, 'age between 18 and 40');
insert into TRAINING (training_code, training_type, duration, constrains)
values (362, 'Spinning', 101, 'age above 12');
insert into TRAINING (training_code, training_type, duration, constrains)
values (363, 'Zumba', 110, 'physical state healthy');
insert into TRAINING (training_code, training_type, duration, constrains)
values (364, 'Strength Training', 39, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (365, 'Zumba', 80, 'physical state disabled');
insert into TRAINING (training_code, training_type, duration, constrains)
values (366, 'Zumba', 86, 'age below 50');
insert into TRAINING (training_code, training_type, duration, constrains)
values (367, 'Spinning', 66, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (368, 'Zumba', 79, 'age above 12');
insert into TRAINING (training_code, training_type, duration, constrains)
values (369, 'HIIT', 116, 'health condition asthma');
insert into TRAINING (training_code, training_type, duration, constrains)
values (370, 'Spinning', 78, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (371, 'CrossFit', 45, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (372, 'Cardio', 85, 'physical state injured');
insert into TRAINING (training_code, training_type, duration, constrains)
values (373, 'Cardio', 43, 'health condition obesity');
commit;
prompt 200 records committed...
insert into TRAINING (training_code, training_type, duration, constrains)
values (374, 'Yoga', 64, 'physical state disabled');
insert into TRAINING (training_code, training_type, duration, constrains)
values (375, 'Dance', 103, 'age above 8');
insert into TRAINING (training_code, training_type, duration, constrains)
values (376, 'Strength Training', 55, 'physical state pregnant');
insert into TRAINING (training_code, training_type, duration, constrains)
values (377, 'Yoga', 86, 'experience expert');
insert into TRAINING (training_code, training_type, duration, constrains)
values (378, 'HIIT', 78, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (379, 'Yoga', 48, 'health condition hypertension');
insert into TRAINING (training_code, training_type, duration, constrains)
values (380, 'Strength Training', 91, 'physical state disabled');
insert into TRAINING (training_code, training_type, duration, constrains)
values (381, 'Dance', 110, 'physical state injured');
insert into TRAINING (training_code, training_type, duration, constrains)
values (382, 'Strength Training', 77, 'physical state recovering');
insert into TRAINING (training_code, training_type, duration, constrains)
values (383, 'Strength Training', 80, 'physical state healthy');
insert into TRAINING (training_code, training_type, duration, constrains)
values (384, 'Zumba', 43, 'age below 50');
insert into TRAINING (training_code, training_type, duration, constrains)
values (385, 'HIIT', 30, 'physical state injured');
insert into TRAINING (training_code, training_type, duration, constrains)
values (386, 'Strength Training', 79, 'age below 50');
insert into TRAINING (training_code, training_type, duration, constrains)
values (387, 'CrossFit', 112, 'physical state recovering');
insert into TRAINING (training_code, training_type, duration, constrains)
values (388, 'HIIT', 105, 'health condition obesity');
insert into TRAINING (training_code, training_type, duration, constrains)
values (389, 'Yoga', 80, 'physical state pregnant');
insert into TRAINING (training_code, training_type, duration, constrains)
values (390, 'Zumba', 93, 'physical state pregnant');
insert into TRAINING (training_code, training_type, duration, constrains)
values (391, 'Pilates', 30, 'age above 12');
insert into TRAINING (training_code, training_type, duration, constrains)
values (392, 'CrossFit', 93, 'age between 18 and 40');
insert into TRAINING (training_code, training_type, duration, constrains)
values (393, 'Pilates', 54, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (394, 'Yoga', 114, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (395, 'Spinning', 95, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (396, 'Strength Training', 80, 'age above 8');
insert into TRAINING (training_code, training_type, duration, constrains)
values (397, 'Spinning', 50, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (398, 'HIIT', 78, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (399, 'Spinning', 113, 'health condition asthma');
insert into TRAINING (training_code, training_type, duration, constrains)
values (400, 'Yoga', 55, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (401, 'Dance', 42, 'age above 8');
insert into TRAINING (training_code, training_type, duration, constrains)
values (402, 'HIIT', 47, 'physical state recovering');
insert into TRAINING (training_code, training_type, duration, constrains)
values (403, 'Boxing', 89, 'physical state injured');
insert into TRAINING (training_code, training_type, duration, constrains)
values (404, 'Pilates', 76, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (405, 'Yoga', 61, 'physical state recovering');
insert into TRAINING (training_code, training_type, duration, constrains)
values (406, 'Spinning', 65, 'health condition heart condition');
insert into TRAINING (training_code, training_type, duration, constrains)
values (407, 'Pilates', 34, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (408, 'Boxing', 46, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (409, 'Cardio', 52, 'age below 50');
insert into TRAINING (training_code, training_type, duration, constrains)
values (410, 'Spinning', 80, 'experience expert');
insert into TRAINING (training_code, training_type, duration, constrains)
values (411, 'Boxing', 70, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (412, 'Zumba', 113, 'age between 18 and 40');
insert into TRAINING (training_code, training_type, duration, constrains)
values (413, 'Strength Training', 79, 'health condition hypertension');
insert into TRAINING (training_code, training_type, duration, constrains)
values (414, 'CrossFit', 39, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (415, 'Strength Training', 100, 'physical state injured');
insert into TRAINING (training_code, training_type, duration, constrains)
values (416, 'Cardio', 68, 'physical state healthy');
insert into TRAINING (training_code, training_type, duration, constrains)
values (417, 'Dance', 49, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (418, 'Spinning', 39, 'age below 60');
insert into TRAINING (training_code, training_type, duration, constrains)
values (419, 'Strength Training', 114, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (420, 'Yoga', 67, 'experience expert');
insert into TRAINING (training_code, training_type, duration, constrains)
values (421, 'CrossFit', 55, 'health condition hypertension');
insert into TRAINING (training_code, training_type, duration, constrains)
values (422, 'Zumba', 104, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (423, 'Strength Training', 75, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (424, 'Spinning', 45, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (425, 'Zumba', 87, 'physical state recovering');
insert into TRAINING (training_code, training_type, duration, constrains)
values (426, 'Strength Training', 59, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (427, 'Pilates', 119, 'age above 8');
insert into TRAINING (training_code, training_type, duration, constrains)
values (428, 'Zumba', 119, 'physical state healthy');
insert into TRAINING (training_code, training_type, duration, constrains)
values (429, 'CrossFit', 54, 'experience expert');
insert into TRAINING (training_code, training_type, duration, constrains)
values (430, 'CrossFit', 76, 'health condition obesity');
insert into TRAINING (training_code, training_type, duration, constrains)
values (431, 'Pilates', 78, 'health condition heart condition');
insert into TRAINING (training_code, training_type, duration, constrains)
values (432, 'Pilates', 33, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (433, 'Dance', 102, 'physical state healthy');
insert into TRAINING (training_code, training_type, duration, constrains)
values (434, 'Yoga', 71, 'health condition asthma');
insert into TRAINING (training_code, training_type, duration, constrains)
values (435, 'Yoga', 76, 'age below 60');
insert into TRAINING (training_code, training_type, duration, constrains)
values (436, 'Boxing', 103, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (437, 'Strength Training', 114, 'experience expert');
insert into TRAINING (training_code, training_type, duration, constrains)
values (438, 'Boxing', 95, 'age above 8');
insert into TRAINING (training_code, training_type, duration, constrains)
values (439, 'Pilates', 108, 'health condition heart condition');
insert into TRAINING (training_code, training_type, duration, constrains)
values (440, 'Dance', 115, 'health condition obesity');
insert into TRAINING (training_code, training_type, duration, constrains)
values (441, 'Dance', 50, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (442, 'Yoga', 56, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (443, 'Strength Training', 110, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (444, 'CrossFit', 51, 'age above 12');
insert into TRAINING (training_code, training_type, duration, constrains)
values (445, 'Boxing', 81, 'physical state healthy');
insert into TRAINING (training_code, training_type, duration, constrains)
values (446, 'Boxing', 31, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (447, 'Spinning', 84, 'age between 18 and 40');
insert into TRAINING (training_code, training_type, duration, constrains)
values (448, 'Cardio', 113, 'age below 60');
insert into TRAINING (training_code, training_type, duration, constrains)
values (449, 'CrossFit', 107, 'health condition asthma');
insert into TRAINING (training_code, training_type, duration, constrains)
values (450, 'Spinning', 85, 'health condition hypertension');
insert into TRAINING (training_code, training_type, duration, constrains)
values (451, 'Boxing', 108, 'age above 8');
insert into TRAINING (training_code, training_type, duration, constrains)
values (452, 'Spinning', 114, 'age between 18 and 40');
insert into TRAINING (training_code, training_type, duration, constrains)
values (453, 'Strength Training', 60, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (454, 'Yoga', 102, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (455, 'Pilates', 81, 'age below 50');
insert into TRAINING (training_code, training_type, duration, constrains)
values (456, 'Cardio', 54, 'age below 60');
insert into TRAINING (training_code, training_type, duration, constrains)
values (457, 'Strength Training', 118, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (458, 'Spinning', 98, 'physical state healthy');
insert into TRAINING (training_code, training_type, duration, constrains)
values (459, 'Dance', 112, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (460, 'Spinning', 49, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (461, 'Pilates', 88, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (462, 'HIIT', 52, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (463, 'Boxing', 84, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (464, 'Cardio', 67, 'age above 12');
insert into TRAINING (training_code, training_type, duration, constrains)
values (465, 'Yoga', 102, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (466, 'Cardio', 68, 'health condition hypertension');
insert into TRAINING (training_code, training_type, duration, constrains)
values (467, 'Boxing', 39, 'age below 50');
insert into TRAINING (training_code, training_type, duration, constrains)
values (468, 'Cardio', 44, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (469, 'Zumba', 115, 'physical state healthy');
insert into TRAINING (training_code, training_type, duration, constrains)
values (470, 'HIIT', 69, 'health condition heart condition');
insert into TRAINING (training_code, training_type, duration, constrains)
values (471, 'Boxing', 116, 'physical state disabled');
insert into TRAINING (training_code, training_type, duration, constrains)
values (472, 'Cardio', 30, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (473, 'HIIT', 49, 'age between 18 and 40');
commit;
prompt 300 records committed...
insert into TRAINING (training_code, training_type, duration, constrains)
values (474, 'Zumba', 57, 'age below 50');
insert into TRAINING (training_code, training_type, duration, constrains)
values (475, 'HIIT', 107, 'age above 8');
insert into TRAINING (training_code, training_type, duration, constrains)
values (476, 'Pilates', 70, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (477, 'HIIT', 102, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (478, 'Pilates', 61, 'health condition diabetes');
insert into TRAINING (training_code, training_type, duration, constrains)
values (479, 'Pilates', 35, 'age below 50');
insert into TRAINING (training_code, training_type, duration, constrains)
values (480, 'Zumba', 58, 'age between 18 and 40');
insert into TRAINING (training_code, training_type, duration, constrains)
values (481, 'Spinning', 30, 'health condition asthma');
insert into TRAINING (training_code, training_type, duration, constrains)
values (482, 'Zumba', 77, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (483, 'Pilates', 96, 'health condition heart condition');
insert into TRAINING (training_code, training_type, duration, constrains)
values (484, 'Yoga', 104, 'age below 50');
insert into TRAINING (training_code, training_type, duration, constrains)
values (485, 'CrossFit', 39, 'physical state injured');
insert into TRAINING (training_code, training_type, duration, constrains)
values (486, 'CrossFit', 45, 'health condition heart condition');
insert into TRAINING (training_code, training_type, duration, constrains)
values (487, 'Cardio', 44, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (488, 'Pilates', 36, 'health condition obesity');
insert into TRAINING (training_code, training_type, duration, constrains)
values (489, 'Dance', 97, 'health condition diabetes');
insert into TRAINING (training_code, training_type, duration, constrains)
values (490, 'Strength Training', 39, 'health condition heart condition');
insert into TRAINING (training_code, training_type, duration, constrains)
values (491, 'Dance', 47, 'health condition obesity');
insert into TRAINING (training_code, training_type, duration, constrains)
values (492, 'Strength Training', 83, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (493, 'Boxing', 105, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (494, 'HIIT', 74, 'age above 12');
insert into TRAINING (training_code, training_type, duration, constrains)
values (495, 'HIIT', 32, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (496, 'Boxing', 92, 'age below 60');
insert into TRAINING (training_code, training_type, duration, constrains)
values (497, 'Boxing', 46, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (498, 'Yoga', 113, 'age below 60');
insert into TRAINING (training_code, training_type, duration, constrains)
values (499, 'HIIT', 87, 'experience expert');
insert into TRAINING (training_code, training_type, duration, constrains)
values (500, 'Yoga', 52, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (1, 'Spinning', 32, 'physical state recovering');
insert into TRAINING (training_code, training_type, duration, constrains)
values (2, 'Strength Training', 88, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (3, 'Boxing', 56, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (4, 'Yoga', 58, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (5, 'Yoga', 47, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (6, 'Yoga', 112, 'physical state healthy');
insert into TRAINING (training_code, training_type, duration, constrains)
values (7, 'CrossFit', 81, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (8, 'Spinning', 96, 'age below 50');
insert into TRAINING (training_code, training_type, duration, constrains)
values (9, 'Cardio', 101, 'experience expert');
insert into TRAINING (training_code, training_type, duration, constrains)
values (10, 'Spinning', 95, 'physical state healthy');
insert into TRAINING (training_code, training_type, duration, constrains)
values (11, 'HIIT', 40, 'physical state disabled');
insert into TRAINING (training_code, training_type, duration, constrains)
values (12, 'Dance', 61, 'age above 12');
insert into TRAINING (training_code, training_type, duration, constrains)
values (13, 'HIIT', 110, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (14, 'HIIT', 118, 'age between 18 and 40');
insert into TRAINING (training_code, training_type, duration, constrains)
values (15, 'Spinning', 83, 'health condition asthma');
insert into TRAINING (training_code, training_type, duration, constrains)
values (16, 'Yoga', 104, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (17, 'CrossFit', 61, 'age below 50');
insert into TRAINING (training_code, training_type, duration, constrains)
values (18, 'HIIT', 32, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (19, 'Boxing', 88, 'physical state recovering');
insert into TRAINING (training_code, training_type, duration, constrains)
values (20, 'Boxing', 31, 'age below 50');
insert into TRAINING (training_code, training_type, duration, constrains)
values (21, 'Pilates', 112, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (22, 'Spinning', 98, 'physical state recovering');
insert into TRAINING (training_code, training_type, duration, constrains)
values (23, 'Dance', 39, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (24, 'HIIT', 115, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (25, 'Dance', 72, 'physical state disabled');
insert into TRAINING (training_code, training_type, duration, constrains)
values (26, 'Pilates', 68, 'physical state pregnant');
insert into TRAINING (training_code, training_type, duration, constrains)
values (27, 'Pilates', 104, 'health condition obesity');
insert into TRAINING (training_code, training_type, duration, constrains)
values (28, 'Zumba', 31, 'physical state recovering');
insert into TRAINING (training_code, training_type, duration, constrains)
values (29, 'CrossFit', 75, 'age below 50');
insert into TRAINING (training_code, training_type, duration, constrains)
values (30, 'Strength Training', 97, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (31, 'Zumba', 98, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (32, 'Pilates', 85, 'age between 18 and 40');
insert into TRAINING (training_code, training_type, duration, constrains)
values (33, 'Zumba', 114, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (34, 'Cardio', 56, 'experience expert');
insert into TRAINING (training_code, training_type, duration, constrains)
values (35, 'Pilates', 114, 'age between 18 and 40');
insert into TRAINING (training_code, training_type, duration, constrains)
values (36, 'Cardio', 82, 'health condition diabetes');
insert into TRAINING (training_code, training_type, duration, constrains)
values (37, 'CrossFit', 69, 'age above 8');
insert into TRAINING (training_code, training_type, duration, constrains)
values (38, 'Boxing', 44, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (39, 'Strength Training', 92, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (40, 'CrossFit', 89, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (41, 'Spinning', 90, 'physical state injured');
insert into TRAINING (training_code, training_type, duration, constrains)
values (42, 'HIIT', 61, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (43, 'CrossFit', 58, 'physical state pregnant');
insert into TRAINING (training_code, training_type, duration, constrains)
values (44, 'Yoga', 55, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (45, 'Cardio', 46, 'health condition asthma');
insert into TRAINING (training_code, training_type, duration, constrains)
values (46, 'HIIT', 46, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (47, 'Cardio', 71, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (48, 'Spinning', 56, 'health condition heart condition');
insert into TRAINING (training_code, training_type, duration, constrains)
values (49, 'HIIT', 119, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (50, 'Boxing', 107, 'experience expert');
insert into TRAINING (training_code, training_type, duration, constrains)
values (51, 'Yoga', 113, 'age below 60');
insert into TRAINING (training_code, training_type, duration, constrains)
values (52, 'Dance', 87, 'physical state pregnant');
insert into TRAINING (training_code, training_type, duration, constrains)
values (53, 'Cardio', 112, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (54, 'Boxing', 69, 'age below 50');
insert into TRAINING (training_code, training_type, duration, constrains)
values (55, 'Dance', 67, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (56, 'Pilates', 71, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (57, 'Strength Training', 52, 'experience expert');
insert into TRAINING (training_code, training_type, duration, constrains)
values (58, 'Spinning', 63, 'health condition hypertension');
insert into TRAINING (training_code, training_type, duration, constrains)
values (59, 'CrossFit', 112, 'health condition asthma');
insert into TRAINING (training_code, training_type, duration, constrains)
values (60, 'HIIT', 60, 'age below 60');
insert into TRAINING (training_code, training_type, duration, constrains)
values (61, 'Zumba', 51, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (62, 'Boxing', 112, 'experience expert');
insert into TRAINING (training_code, training_type, duration, constrains)
values (63, 'Yoga', 107, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (64, 'Yoga', 113, 'age above 8');
insert into TRAINING (training_code, training_type, duration, constrains)
values (65, 'Cardio', 61, 'health condition asthma');
insert into TRAINING (training_code, training_type, duration, constrains)
values (66, 'Dance', 33, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (67, 'Boxing', 43, 'age below 60');
insert into TRAINING (training_code, training_type, duration, constrains)
values (68, 'Boxing', 35, 'physical state pregnant');
insert into TRAINING (training_code, training_type, duration, constrains)
values (69, 'Cardio', 103, 'health condition diabetes');
insert into TRAINING (training_code, training_type, duration, constrains)
values (70, 'Strength Training', 50, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (71, 'Cardio', 60, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (72, 'CrossFit', 98, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (73, 'Yoga', 68, 'physical state pregnant');
commit;
prompt 400 records committed...
insert into TRAINING (training_code, training_type, duration, constrains)
values (74, 'Boxing', 63, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (75, 'Strength Training', 108, 'health condition heart condition');
insert into TRAINING (training_code, training_type, duration, constrains)
values (76, 'Spinning', 81, 'health condition hypertension');
insert into TRAINING (training_code, training_type, duration, constrains)
values (77, 'Zumba', 63, 'health condition hypertension');
insert into TRAINING (training_code, training_type, duration, constrains)
values (78, 'CrossFit', 58, 'physical state pregnant');
insert into TRAINING (training_code, training_type, duration, constrains)
values (79, 'Dance', 102, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (80, 'CrossFit', 114, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (81, 'Spinning', 64, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (82, 'Yoga', 109, 'physical state recovering');
insert into TRAINING (training_code, training_type, duration, constrains)
values (83, 'Boxing', 72, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (84, 'Strength Training', 95, 'physical state pregnant');
insert into TRAINING (training_code, training_type, duration, constrains)
values (85, 'Cardio', 36, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (86, 'Spinning', 108, 'physical state disabled');
insert into TRAINING (training_code, training_type, duration, constrains)
values (87, 'Cardio', 61, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (88, 'HIIT', 107, 'health condition hypertension');
insert into TRAINING (training_code, training_type, duration, constrains)
values (89, 'Strength Training', 67, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (90, 'Yoga', 66, 'age above 8');
insert into TRAINING (training_code, training_type, duration, constrains)
values (91, 'Boxing', 54, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (92, 'CrossFit', 62, 'age between 18 and 40');
insert into TRAINING (training_code, training_type, duration, constrains)
values (93, 'Spinning', 86, 'age above 8');
insert into TRAINING (training_code, training_type, duration, constrains)
values (94, 'Dance', 31, 'age below 60');
insert into TRAINING (training_code, training_type, duration, constrains)
values (95, 'HIIT', 73, 'health condition asthma');
insert into TRAINING (training_code, training_type, duration, constrains)
values (96, 'Strength Training', 87, 'experience expert');
insert into TRAINING (training_code, training_type, duration, constrains)
values (97, 'Yoga', 52, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (98, 'Yoga', 60, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (99, 'Boxing', 75, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (100, 'Strength Training', 49, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (101, 'Zumba', 35, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (102, 'Yoga', 53, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (103, 'CrossFit', 108, 'experience expert');
insert into TRAINING (training_code, training_type, duration, constrains)
values (104, 'Pilates', 112, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (105, 'Strength Training', 41, 'health condition asthma');
insert into TRAINING (training_code, training_type, duration, constrains)
values (106, 'Zumba', 82, 'health condition asthma');
insert into TRAINING (training_code, training_type, duration, constrains)
values (107, 'Pilates', 59, 'physical state recovering');
insert into TRAINING (training_code, training_type, duration, constrains)
values (108, 'Dance', 35, 'physical state disabled');
insert into TRAINING (training_code, training_type, duration, constrains)
values (109, 'HIIT', 88, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (110, 'Cardio', 107, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (111, 'Strength Training', 88, 'age below 50');
insert into TRAINING (training_code, training_type, duration, constrains)
values (112, 'Zumba', 48, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (113, 'Dance', 107, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (114, 'Dance', 103, 'physical state healthy');
insert into TRAINING (training_code, training_type, duration, constrains)
values (115, 'Pilates', 118, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (116, 'CrossFit', 56, 'health condition obesity');
insert into TRAINING (training_code, training_type, duration, constrains)
values (117, 'Dance', 105, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (118, 'Cardio', 69, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (119, 'HIIT', 40, 'health condition heart condition');
insert into TRAINING (training_code, training_type, duration, constrains)
values (120, 'Zumba', 74, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (121, 'Boxing', 107, 'health condition heart condition');
insert into TRAINING (training_code, training_type, duration, constrains)
values (122, 'Pilates', 78, 'experience expert');
insert into TRAINING (training_code, training_type, duration, constrains)
values (123, 'Pilates', 30, 'health condition asthma');
insert into TRAINING (training_code, training_type, duration, constrains)
values (124, 'Pilates', 71, 'physical state healthy');
insert into TRAINING (training_code, training_type, duration, constrains)
values (125, 'Boxing', 66, 'age above 8');
insert into TRAINING (training_code, training_type, duration, constrains)
values (126, 'Pilates', 55, 'physical state recovering');
insert into TRAINING (training_code, training_type, duration, constrains)
values (127, 'HIIT', 71, 'physical state healthy');
insert into TRAINING (training_code, training_type, duration, constrains)
values (128, 'Zumba', 89, 'health condition heart condition');
insert into TRAINING (training_code, training_type, duration, constrains)
values (129, 'Pilates', 84, 'physical state recovering');
insert into TRAINING (training_code, training_type, duration, constrains)
values (130, 'CrossFit', 120, 'age below 50');
insert into TRAINING (training_code, training_type, duration, constrains)
values (131, 'Zumba', 47, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (132, 'HIIT', 62, 'physical state injured');
insert into TRAINING (training_code, training_type, duration, constrains)
values (133, 'Zumba', 62, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (134, 'Yoga', 80, 'health condition obesity');
insert into TRAINING (training_code, training_type, duration, constrains)
values (135, 'HIIT', 91, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (136, 'Zumba', 112, 'health condition hypertension');
insert into TRAINING (training_code, training_type, duration, constrains)
values (137, 'Zumba', 49, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (138, 'Yoga', 112, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (139, 'Spinning', 106, 'age below 50');
insert into TRAINING (training_code, training_type, duration, constrains)
values (140, 'CrossFit', 110, 'experience experienced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (141, 'Boxing', 46, 'health condition asthma');
insert into TRAINING (training_code, training_type, duration, constrains)
values (142, 'Spinning', 99, 'age above 12');
insert into TRAINING (training_code, training_type, duration, constrains)
values (143, 'HIIT', 113, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (144, 'Zumba', 97, 'physical state pregnant');
insert into TRAINING (training_code, training_type, duration, constrains)
values (145, 'Spinning', 48, 'health condition heart condition');
insert into TRAINING (training_code, training_type, duration, constrains)
values (146, 'Strength Training', 104, 'age below 50');
insert into TRAINING (training_code, training_type, duration, constrains)
values (147, 'Zumba', 84, 'health condition obesity');
insert into TRAINING (training_code, training_type, duration, constrains)
values (148, 'Cardio', 60, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (149, 'Boxing', 79, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (150, 'Pilates', 87, 'age below 50');
insert into TRAINING (training_code, training_type, duration, constrains)
values (151, 'Pilates', 90, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (152, 'Spinning', 87, 'health condition hypertension');
insert into TRAINING (training_code, training_type, duration, constrains)
values (153, 'Spinning', 118, 'age above 12');
insert into TRAINING (training_code, training_type, duration, constrains)
values (154, 'HIIT', 100, 'health condition heart condition');
insert into TRAINING (training_code, training_type, duration, constrains)
values (155, 'CrossFit', 103, 'fitness level beginner');
insert into TRAINING (training_code, training_type, duration, constrains)
values (156, 'Cardio', 101, 'age above 8');
insert into TRAINING (training_code, training_type, duration, constrains)
values (157, 'HIIT', 46, 'physical state pregnant');
insert into TRAINING (training_code, training_type, duration, constrains)
values (158, 'HIIT', 104, 'health condition obesity');
insert into TRAINING (training_code, training_type, duration, constrains)
values (159, 'Dance', 113, 'physical state disabled');
insert into TRAINING (training_code, training_type, duration, constrains)
values (160, 'Pilates', 113, 'physical state disabled');
insert into TRAINING (training_code, training_type, duration, constrains)
values (161, 'Spinning', 80, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (162, 'Cardio', 63, 'age below 60');
insert into TRAINING (training_code, training_type, duration, constrains)
values (163, 'HIIT', 100, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (164, 'Zumba', 89, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (165, 'Cardio', 109, 'fitness level advanced');
insert into TRAINING (training_code, training_type, duration, constrains)
values (166, 'Yoga', 100, 'fitness level intermediate');
insert into TRAINING (training_code, training_type, duration, constrains)
values (167, 'Dance', 84, 'health condition asthma');
insert into TRAINING (training_code, training_type, duration, constrains)
values (168, 'Boxing', 74, 'health condition heart condition');
insert into TRAINING (training_code, training_type, duration, constrains)
values (169, 'Spinning', 31, 'health condition asthma');
insert into TRAINING (training_code, training_type, duration, constrains)
values (170, 'Cardio', 76, 'age between 18 and 40');
insert into TRAINING (training_code, training_type, duration, constrains)
values (171, 'Strength Training', 83, 'physical state recovering');
insert into TRAINING (training_code, training_type, duration, constrains)
values (172, 'Yoga', 63, 'experience novice');
insert into TRAINING (training_code, training_type, duration, constrains)
values (173, 'Dance', 107, 'age above 8');
commit;
prompt 500 records loaded
prompt Loading ACTUAL_TRAINING...
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (3.17, to_date('16-12-2022', 'dd-mm-yyyy'), 'Vienna Schottenring 16 Vienna ', 397.16, 492, 382781490, 834466751, 457);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (15.06, to_date('12-05-2020', 'dd-mm-yyyy'), 'Boston 50 Seaport Boulevard', 364.64, 514, 894045375, 317285847, 6);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (15.39, to_date('08-08-2024', 'dd-mm-yyyy'), 'Jakarta Jalan Sudirman Kav 52-', 30.46, 515, 616052079, 967021982, 435);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (18.37, to_date('22-08-2023', 'dd-mm-yyyy'), 'Boston 50 Seaport Boulevard', 59.58, 493, 178726838, 856415343, 352);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (14.47, to_date('22-08-2023', 'dd-mm-yyyy'), 'Paris 11 Cour D?fense Seine Pu', 280.09, 494, 478902541, 160062237, 58);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (11.13, to_date('04-11-2020', 'dd-mm-yyyy'), 'Mumbai G Block Bandra Kurla Co', 545.85, 516, 172274041, 975459822, 443);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (21.98, to_date('16-10-2021', 'dd-mm-yyyy'), 'Rome Via dei Congressi 33', 32.83, 517, 330031171, 725240443, 11);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (23.49, to_date('22-10-2020', 'dd-mm-yyyy'), 'Toronto 125 King Street West', 428.84, 518, 648466322, 834466751, 346);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (15.88, to_date('24-10-2021', 'dd-mm-yyyy'), 'Washington D.C. 1775 K Street ', 195.16, 519, 799006955, 183537357, 447);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (19.99, to_date('24-12-2021', 'dd-mm-yyyy'), 'Singapore 1 Marina Boulevard', 505.59, 520, 317827346, 573698524, 158);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (15.69, to_date('07-12-2020', 'dd-mm-yyyy'), 'Jakarta Jalan Sudirman Kav 52-', 547.23, 495, 770792852, 392223508, 54);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (12.44, to_date('08-10-2021', 'dd-mm-yyyy'), 'Phoenix 2400 Biltmore Fashion ', 71.56, 521, 160302987, 173200754, 49);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (15.54, to_date('18-09-2024', 'dd-mm-yyyy'), 'S?£o Paulo Avenida Berrini 660', 32.53, 522, 758646772, 719859226, 463);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (11.09, to_date('11-07-2021', 'dd-mm-yyyy'), 'Calgary 250 Eau Claire Avenue ', 200.05, 523, 721297891, 220627730, 45);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (17.53, to_date('11-08-2021', 'dd-mm-yyyy'), 'Dallas 2001 McKinney Ave Uptow', 60.18, 524, 172274041, 170243739, 181);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (4.23, to_date('28-07-2024', 'dd-mm-yyyy'), 'Vienna Schottenring 16 Vienna ', 72.26, 496, 719859226, 932610681, 206);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (3.91, to_date('27-09-2022', 'dd-mm-yyyy'), 'Dublin Barrow Street Silicon D', 310.9, 525, 428261058, 571442515, 306);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (20.12, to_date('18-07-2021', 'dd-mm-yyyy'), 'San Diego 1110 Sorrento Valley', 524.52, 526, 835284851, 767094858, 17);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (6.09, to_date('17-04-2020', 'dd-mm-yyyy'), 'Buenos Aires Juana Manso 1670 ', 505.91, 527, 928999987, 129756457, 398);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (18.07, to_date('17-04-2020', 'dd-mm-yyyy'), 'Denver 1775 Sherman Street Den', 154.18, 528, 141837640, 229177674, 395);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (11.52, to_date('14-04-2021', 'dd-mm-yyyy'), 'Seoul 50 Yeoksam-dong Gangnam-', 64.87, 529, 208588663, 862511399, 320);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (5.81, to_date('20-01-2021', 'dd-mm-yyyy'), 'Rome Via dei Congressi 33', 570.5, 497, 891325545, 582445416, 124);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (11.78, to_date('18-03-2020', 'dd-mm-yyyy'), 'Buenos Aires Juana Manso 1670 ', 72.59, 530, 302400433, 849129256, 491);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (11.45, to_date('20-07-2020', 'dd-mm-yyyy'), 'Prague Na Pankr??ci 178/180 Pa', 521.14, 531, 240883177, 200589852, 331);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (4.81, to_date('20-09-2020', 'dd-mm-yyyy'), 'Jakarta Jalan Sudirman Kav 52-', 532.87, 532, 741975218, 411702990, 89);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (1, to_date('26-04-2020', 'dd-mm-yyyy'), 'Dublin Barrow Street Silicon D', 286.21, 533, 882145843, 837311276, 1);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (5.69, to_date('25-11-2020', 'dd-mm-yyyy'), 'Washington D.C. 1775 K Street ', 106.03, 534, 720995190, 293747357, 117);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (2.55, to_date('06-09-2024', 'dd-mm-yyyy'), 'Seattle 520 Westlake Avenue So', 43.96, 535, 597219131, 758061612, 243);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (3.32, to_date('23-10-2023', 'dd-mm-yyyy'), 'Detroit 400 Renaissance Center', 330.67, 536, 426365238, 252401236, 409);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (11.27, to_date('23-10-2023', 'dd-mm-yyyy'), 'Singapore 1 Marina Boulevard', 361.12, 537, 918096886, 295295075, 495);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (7.84, to_date('14-12-2020', 'dd-mm-yyyy'), 'Las Vegas 3645 Las Vegas Blvd ', 341.94, 538, 920943612, 914334290, 248);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.24, to_date('02-12-2021', 'dd-mm-yyyy'), 'Las Vegas 3645 Las Vegas Blvd ', 166.92, 498, 616052079, 613127663, 40);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (6.73, to_date('23-09-2023', 'dd-mm-yyyy'), 'Las Vegas 3645 Las Vegas Blvd ', 59.84, 499, 631847604, 645800410, 458);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (11.6, to_date('09-07-2022', 'dd-mm-yyyy'), 'Istanbul B?¼y?¼kdere Cadde No:', 345.6, 539, 226625742, 913311862, 76);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (5.42, to_date('09-08-2022', 'dd-mm-yyyy'), 'Philadelphia 1500 Market Stree', 505.37, 500, 920943612, 914453711, 436);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (20.16, to_date('08-12-2020', 'dd-mm-yyyy'), 'Philadelphia 1500 Market Stree', 339.28, 540, 601180013, 124985854, 128);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (17, to_date('26-07-2022', 'dd-mm-yyyy'), 'S?£o Paulo Avenida Berrini 660', 320.21, 541, 920943612, 100171750, 428);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (9.61, to_date('14-01-2022', 'dd-mm-yyyy'), 'Jakarta Jalan Sudirman Kav 52-', 122.55, 542, 500056959, 250146889, 200);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (18.52, to_date('18-03-2024', 'dd-mm-yyyy'), 'Sydney 1 Alfred Street Circula', 529.84, 543, 610737497, 923766112, 164);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (2.8, to_date('18-05-2024', 'dd-mm-yyyy'), 'Barcelona Avinguda Diagonal 40', 66.07, 544, 950034758, 199724940, 59);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (9.98, to_date('01-03-2021', 'dd-mm-yyyy'), 'Brussels Rue de la Loi 175 Eur', 177.86, 501, 405114344, 770792852, 473);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (16.19, to_date('26-10-2024', 'dd-mm-yyyy'), 'San Francisco 1650 Hanover Str', 491.63, 545, 624917762, 982228959, 453);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (6.2, to_date('06-03-2022', 'dd-mm-yyyy'), 'Vancouver 1000 Mainland Street', 476.57, 546, 758646772, 973326469, 189);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.37, to_date('07-08-2021', 'dd-mm-yyyy'), 'London 8 Canada Square', 55.57, 547, 194505717, 703260999, 451);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (7.4, to_date('07-08-2021', 'dd-mm-yyyy'), 'Rome Via dei Congressi 33', 27.79, 548, 911045673, 626464892, 41);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (17.45, to_date('01-10-2021', 'dd-mm-yyyy'), 'Washington D.C. 1775 K Street ', 453.56, 549, 295318534, 584468952, 134);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (.3, to_date('12-05-2022', 'dd-mm-yyyy'), 'Paris 11 Cour D?fense Seine Pu', 215.8, 550, 595483134, 325077153, 106);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (17.31, to_date('01-09-2022', 'dd-mm-yyyy'), 'Detroit 400 Renaissance Center', 510.08, 551, 773115408, 610512281, 177);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (22.7, to_date('23-06-2020', 'dd-mm-yyyy'), 'Washington D.C. 1775 K Street ', 328.41, 552, 479467077, 980200311, 86);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (16.09, to_date('23-08-2020', 'dd-mm-yyyy'), 'S?£o Paulo Avenida Berrini 660', 552.48, 553, 557038448, 109491053, 330);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (6.28, to_date('04-10-2023', 'dd-mm-yyyy'), 'Dallas 2001 McKinney Ave Uptow', 68.7, 554, 373839373, 955638737, 49);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.97, to_date('21-08-2021', 'dd-mm-yyyy'), 'Dallas 2001 McKinney Ave Uptow', 440.98, 502, 264615737, 838534272, 19);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (18.9, to_date('01-09-2024', 'dd-mm-yyyy'), 'Las Vegas 3645 Las Vegas Blvd ', 22.92, 555, 584791610, 124985854, 255);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.42, to_date('01-02-2023', 'dd-mm-yyyy'), 'Austin 9800 Metric Blvd', 27.79, 556, 965940603, 648466322, 372);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (5.64, to_date('01-02-2023', 'dd-mm-yyyy'), 'Philadelphia 1500 Market Stree', 63.99, 557, 982228959, 834137712, 377);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (4.43, to_date('23-10-2022', 'dd-mm-yyyy'), 'Shanghai 88 Xinza Road Lujiazu', 388.99, 558, 496082620, 373839373, 77);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (12.65, to_date('03-12-2022', 'dd-mm-yyyy'), 'Orlando 8282 International Dri', 286.24, 559, 188014768, 554350368, 197);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (16.58, to_date('25-09-2023', 'dd-mm-yyyy'), 'Las Vegas 3645 Las Vegas Blvd ', 512.75, 560, 982228959, 980173326, 399);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (5.86, to_date('08-04-2024', 'dd-mm-yyyy'), 'Dublin Barrow Street Silicon D', 40.83, 561, 901931967, 834466751, 469);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (17.89, to_date('08-06-2024', 'dd-mm-yyyy'), 'Mumbai G Block Bandra Kurla Co', 56.42, 503, 856415343, 838534272, 88);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (22.47, to_date('09-08-2021', 'dd-mm-yyyy'), 'Miami 1001 Brickell Ave', 413.08, 504, 882145843, 758646772, 268);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (16.48, to_date('25-09-2022', 'dd-mm-yyyy'), 'S?£o Paulo Avenida Berrini 660', 16.31, 562, 613127663, 170243739, 352);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (10.72, to_date('07-07-2023', 'dd-mm-yyyy'), 'Seoul 50 Yeoksam-dong Gangnam-', 64.35, 563, 830160294, 573698524, 59);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (6.09, to_date('04-01-2024', 'dd-mm-yyyy'), 'Washington D.C. 1775 K Street ', 540.5, 564, 558821746, 831558139, 266);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (22.08, to_date('04-03-2024', 'dd-mm-yyyy'), 'Seoul 50 Yeoksam-dong Gangnam-', 262.95, 565, 426365238, 920943612, 283);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (23.78, to_date('27-02-2021', 'dd-mm-yyyy'), 'Buenos Aires Juana Manso 1670 ', 331.99, 566, 695020064, 662635024, 410);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.55, to_date('12-04-2024', 'dd-mm-yyyy'), 'Vancouver 1000 Mainland Street', 32.56, 567, 894045375, 576328517, 11);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (15.08, to_date('09-02-2022', 'dd-mm-yyyy'), 'Vancouver 1000 Mainland Street', 161.11, 505, 544043768, 695020064, 373);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (22.98, to_date('23-06-2023', 'dd-mm-yyyy'), 'Seoul 50 Yeoksam-dong Gangnam-', 73.24, 568, 183537357, 605591541, 130);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (.65, to_date('23-06-2023', 'dd-mm-yyyy'), 'Brussels Rue de la Loi 175 Eur', 410.56, 569, 767094858, 336348974, 22);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (7.73, to_date('11-12-2024', 'dd-mm-yyyy'), 'Phoenix 2400 Biltmore Fashion ', 321.74, 570, 253406712, 403050636, 447);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (19.6, to_date('09-10-2024', 'dd-mm-yyyy'), 'Houston 3 Greenway Plaza', 29.41, 506, 168836760, 402379540, 319);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (7.4, to_date('06-11-2024', 'dd-mm-yyyy'), 'Istanbul B?¼y?¼kdere Cadde No:', 62.93, 571, 604967584, 967021982, 259);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.69, to_date('26-03-2020', 'dd-mm-yyyy'), 'Rome Via dei Congressi 33', 388.01, 572, 123599375, 562010577, 43);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (19.52, to_date('26-03-2020', 'dd-mm-yyyy'), 'Dubai Sheikh Zayed Road Emirat', 355.19, 573, 831558139, 624127356, 147);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (13.48, to_date('09-06-2024', 'dd-mm-yyyy'), 'Las Vegas 3645 Las Vegas Blvd ', 402.81, 574, 825772129, 168520613, 134);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (18.66, to_date('26-08-2022', 'dd-mm-yyyy'), 'Bangkok 990 Silom Road', 158.21, 575, 592162027, 392078118, 161);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (16.66, to_date('03-12-2021', 'dd-mm-yyyy'), 'Prague Na Pankr??ci 178/180 Pa', 201.1, 576, 487726448, 758061612, 489);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (22.67, to_date('29-11-2023', 'dd-mm-yyyy'), 'Calgary 250 Eau Claire Avenue ', 168.93, 577, 317827346, 307865478, 221);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (.58, to_date('29-01-2024', 'dd-mm-yyyy'), 'Berlin Unter den Linden 67-68', 443.22, 578, 317838008, 767094858, 82);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (9.66, to_date('15-02-2023', 'dd-mm-yyyy'), 'Brussels Rue de la Loi 175 Eur', 47.7, 579, 194442862, 199129162, 34);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (15.84, to_date('14-04-2021', 'dd-mm-yyyy'), 'Phoenix 2400 Biltmore Fashion ', 30.05, 580, 666205340, 490765532, 65);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (19.79, to_date('12-09-2020', 'dd-mm-yyyy'), 'Buenos Aires Juana Manso 1670 ', 26.85, 507, 867765371, 373839373, 272);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (21.41, to_date('20-09-2022', 'dd-mm-yyyy'), 'Chicago 200 South Wacker Drive', 537.38, 581, 537375804, 317285847, 410);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (17.82, to_date('20-09-2022', 'dd-mm-yyyy'), 'Buenos Aires Juana Manso 1670 ', 33.16, 582, 830941935, 916416877, 226);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (19.15, to_date('01-10-2020', 'dd-mm-yyyy'), 'Istanbul B?¼y?¼kdere Cadde No:', 139.65, 508, 496082620, 596818423, 467);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (21.14, to_date('15-07-2023', 'dd-mm-yyyy'), 'Buenos Aires Juana Manso 1670 ', 59.31, 583, 398601481, 641170597, 226);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (4.73, to_date('07-11-2024', 'dd-mm-yyyy'), 'Dubai Sheikh Zayed Road Emirat', 323.8, 509, 252401236, 296165656, 157);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (1.2, to_date('26-08-2021', 'dd-mm-yyyy'), 'Detroit 400 Renaissance Center', 493.43, 584, 253406712, 741975218, 382);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (11.35, to_date('26-09-2021', 'dd-mm-yyyy'), 'Paris 11 Cour D?fense Seine Pu', 469.4, 585, 302400433, 453477723, 290);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (21.66, to_date('12-06-2024', 'dd-mm-yyyy'), 'Dallas 2001 McKinney Ave Uptow', 373.05, 586, 767094858, 374025072, 6);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (19.93, to_date('02-03-2021', 'dd-mm-yyyy'), 'Vienna Schottenring 16 Vienna ', 16.97, 587, 509483133, 194690926, 209);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (9.9, to_date('15-01-2024', 'dd-mm-yyyy'), 'Mumbai G Block Bandra Kurla Co', 498.89, 588, 478380949, 662635024, 371);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (11.56, to_date('29-07-2024', 'dd-mm-yyyy'), 'Toronto 125 King Street West', 68.71, 510, 928999987, 709751915, 251);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (19.88, to_date('29-07-2024', 'dd-mm-yyyy'), 'San Francisco 1650 Hanover Str', 472.42, 511, 687150404, 405114344, 376);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (11.89, to_date('24-12-2021', 'dd-mm-yyyy'), 'Amsterdam Strawinskylaan 3011', 19.96, 589, 948133904, 957557141, 270);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (18.54, to_date('15-01-2023', 'dd-mm-yyyy'), 'Berlin Unter den Linden 67-68', 270.76, 512, 765927503, 870513504, 221);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (18.65, to_date('11-03-2021', 'dd-mm-yyyy'), 'Buenos Aires Juana Manso 1670 ', 267.78, 513, 466069898, 743881857, 264);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (14.71, to_date('14-10-2021', 'dd-mm-yyyy'), 'Philadelphia 1500 Market Stree', 66.94, 103, 616052079, 505169218, 3);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (15.9, to_date('14-11-2021', 'dd-mm-yyyy'), 'Philadelphia 1500 Market Stree', 22.95, 104, 299788152, 981055942, 349);
commit;
prompt 100 records committed...
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (4.46, to_date('08-02-2020', 'dd-mm-yyyy'), 'Mexico City Avenida Santa Fe 1', 308.7, 105, 173200754, 626464892, 248);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (14.58, to_date('15-09-2020', 'dd-mm-yyyy'), 'Singapore 1 Marina Boulevard', 475.75, 106, 613127663, 166246954, 4);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (12.34, to_date('01-08-2023', 'dd-mm-yyyy'), 'Las Vegas 3645 Las Vegas Blvd ', 133.92, 107, 238646522, 105654067, 62);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (20.6, to_date('17-03-2021', 'dd-mm-yyyy'), 'Philadelphia 1500 Market Stree', 156.01, 100, 500056959, 412832580, 44);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (11.55, to_date('17-03-2021', 'dd-mm-yyyy'), 'London 8 Canada Square', 572.46, 108, 758061612, 289832097, 398);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (2.44, to_date('03-07-2021', 'dd-mm-yyyy'), 'Phoenix 2400 Biltmore Fashion ', 477.28, 101, 914334290, 208588663, 180);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (3.91, to_date('31-10-2022', 'dd-mm-yyyy'), 'Austin 9800 Metric Blvd', 246.23, 109, 208612657, 344533634, 376);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (13.25, to_date('11-12-2021', 'dd-mm-yyyy'), 'Dublin Barrow Street Silicon D', 413.02, 110, 758646772, 955638737, 148);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (4.69, to_date('04-04-2021', 'dd-mm-yyyy'), 'Mexico City Avenida Santa Fe 1', 595.72, 111, 283643146, 482412253, 61);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (13.13, to_date('04-04-2021', 'dd-mm-yyyy'), 'Austin 9800 Metric Blvd', 138.07, 112, 725240443, 617937771, 135);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (19.95, to_date('28-04-2020', 'dd-mm-yyyy'), 'Tokyo 3-14-1 Nishi-Shinjuku Sh', 155.06, 113, 543584585, 246305254, 149);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (10.12, to_date('04-01-2021', 'dd-mm-yyyy'), 'Amsterdam Strawinskylaan 3011', 147.31, 114, 443970722, 295295075, 392);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (12.77, to_date('13-09-2021', 'dd-mm-yyyy'), 'Bangkok 990 Silom Road', 425.9, 115, 250161276, 392633660, 39);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (18.93, to_date('09-12-2022', 'dd-mm-yyyy'), 'Seoul 50 Yeoksam-dong Gangnam-', 107.66, 116, 866183544, 309422947, 455);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (22.71, to_date('09-01-2023', 'dd-mm-yyyy'), 'Dallas 2001 McKinney Ave Uptow', 145.13, 117, 325527961, 115518036, 282);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (2.65, to_date('10-02-2020', 'dd-mm-yyyy'), 'Berlin Unter den Linden 67-68', 234.81, 118, 726402722, 307865478, 266);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.01, to_date('16-04-2024', 'dd-mm-yyyy'), 'Las Vegas 3645 Las Vegas Blvd ', 24.12, 119, 236372769, 637214817, 109);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (10.64, to_date('10-04-2020', 'dd-mm-yyyy'), 'New York City 1 Wall Street', 357.43, 102, 207996683, 601180013, 368);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.63, to_date('10-09-2022', 'dd-mm-yyyy'), 'Toronto 125 King Street West', 318.66, 120, 302400433, 683756135, 114);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (19.69, to_date('10-09-2022', 'dd-mm-yyyy'), 'Sydney 1 Alfred Street Circula', 442.97, 121, 807686151, 466025294, 196);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.02, to_date('16-03-2021', 'dd-mm-yyyy'), 'Sydney 1 Alfred Street Circula', 41.56, 122, 862511399, 963758267, 281);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (20.66, to_date('25-05-2020', 'dd-mm-yyyy'), 'Sydney 1 Alfred Street Circula', 554.01, 123, 292421869, 252401236, 478);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (15.96, to_date('17-04-2020', 'dd-mm-yyyy'), 'Las Vegas 3645 Las Vegas Blvd ', 214.12, 124, 894045375, 474084615, 134);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (23.1, to_date('01-11-2020', 'dd-mm-yyyy'), 'Las Vegas 3645 Las Vegas Blvd ', 510.14, 125, 183537357, 534848455, 415);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (22.28, to_date('01-12-2020', 'dd-mm-yyyy'), 'Istanbul B?¼y?¼kdere Cadde No:', 441.77, 126, 765927503, 372097171, 125);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (19.92, to_date('10-02-2020', 'dd-mm-yyyy'), 'Washington D.C. 1775 K Street ', 359.36, 127, 548962651, 980173326, 298);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (15.69, to_date('28-09-2021', 'dd-mm-yyyy'), 'Washington D.C. 1775 K Street ', 62.61, 128, 348524922, 378103171, 34);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (23.3, to_date('28-07-2024', 'dd-mm-yyyy'), 'Chicago 200 South Wacker Drive', 12.95, 129, 434172398, 511271917, 201);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (12.34, to_date('28-11-2021', 'dd-mm-yyyy'), 'Brussels Rue de la Loi 175 Eur', 162.83, 130, 785455181, 882145843, 140);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (5.74, to_date('28-12-2021', 'dd-mm-yyyy'), 'S?£o Paulo Avenida Berrini 660', 42.81, 131, 146924485, 955638737, 313);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (3.49, to_date('02-12-2022', 'dd-mm-yyyy'), 'Amsterdam Strawinskylaan 3011', 40.22, 132, 897043979, 194505717, 338);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (2.89, to_date('12-10-2022', 'dd-mm-yyyy'), 'Boston 50 Seaport Boulevard', 74.77, 133, 451092501, 526237352, 469);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (22.17, to_date('04-07-2022', 'dd-mm-yyyy'), 'Prague Na Pankr??ci 178/180 Pa', 372.76, 134, 124964227, 200281225, 333);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (14.03, to_date('30-12-2021', 'dd-mm-yyyy'), 'Detroit 400 Renaissance Center', 66.22, 135, 373839373, 352072255, 420);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (4.82, to_date('30-12-2021', 'dd-mm-yyyy'), 'Boston 50 Seaport Boulevard', 52.34, 136, 617937771, 776564831, 412);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.55, to_date('26-03-2022', 'dd-mm-yyyy'), 'Phoenix 2400 Biltmore Fashion ', 516.56, 137, 698757041, 639106141, 133);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (.61, to_date('16-12-2023', 'dd-mm-yyyy'), 'Houston 3 Greenway Plaza', 45.93, 138, 154015286, 559165794, 321);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (7.35, to_date('14-05-2022', 'dd-mm-yyyy'), 'Phoenix 2400 Biltmore Fashion ', 15.96, 139, 648883310, 336348974, 352);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (19.48, to_date('11-02-2023', 'dd-mm-yyyy'), 'S?£o Paulo Avenida Berrini 660', 387.74, 140, 126638060, 331610494, 347);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (15.46, to_date('11-02-2023', 'dd-mm-yyyy'), 'Austin 9800 Metric Blvd', 42.2, 141, 975459822, 104937452, 191);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (20.14, to_date('13-03-2024', 'dd-mm-yyyy'), 'New York City 1 Wall Street', 16.31, 142, 783080526, 160302987, 194);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (12.7, to_date('16-07-2020', 'dd-mm-yyyy'), 'Dallas 2001 McKinney Ave Uptow', 268.72, 143, 189643742, 408324895, 350);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (9.92, to_date('27-02-2022', 'dd-mm-yyyy'), 'Calgary 250 Eau Claire Avenue ', 253.63, 144, 309422947, 667027263, 190);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (21.08, to_date('24-05-2024', 'dd-mm-yyyy'), 'Atlanta 3333 Peachtree Road NE', 34.59, 145, 834137712, 540381721, 446);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (1.93, to_date('24-06-2024', 'dd-mm-yyyy'), 'Vienna Schottenring 16 Vienna ', 519.46, 146, 601180013, 840761695, 447);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (10.56, to_date('14-03-2023', 'dd-mm-yyyy'), 'Istanbul B?¼y?¼kdere Cadde No:', 126.41, 147, 753286200, 455403379, 294);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (23.95, to_date('11-04-2022', 'dd-mm-yyyy'), 'Miami 1001 Brickell Ave', 213.89, 148, 815735034, 189643742, 486);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (19.27, to_date('02-10-2023', 'dd-mm-yyyy'), 'Toronto 125 King Street West', 360.91, 149, 571442515, 918096886, 409);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (12.68, to_date('29-05-2022', 'dd-mm-yyyy'), 'Toronto 125 King Street West', 281.64, 150, 965940603, 799006955, 232);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (20.86, to_date('29-06-2022', 'dd-mm-yyyy'), 'Bangkok 990 Silom Road', 66.19, 151, 482412253, 168520613, 393);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (19.98, to_date('24-12-2020', 'dd-mm-yyyy'), 'Vancouver 1000 Mainland Street', 530.57, 152, 610907411, 928999987, 177);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (15.61, to_date('30-09-2024', 'dd-mm-yyyy'), 'Las Vegas 3645 Las Vegas Blvd ', 30.23, 153, 206629316, 543584585, 56);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (20.48, to_date('05-05-2023', 'dd-mm-yyyy'), 'Miami 1001 Brickell Ave', 440.12, 154, 787378023, 296165656, 318);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (21.79, to_date('11-06-2024', 'dd-mm-yyyy'), 'New York City 1 Wall Street', 41.93, 155, 123599375, 253406712, 163);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (1.39, to_date('11-07-2024', 'dd-mm-yyyy'), 'San Francisco 1650 Hanover Str', 170.27, 156, 129756457, 495997339, 85);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (10.77, to_date('22-12-2024', 'dd-mm-yyyy'), 'Amsterdam Strawinskylaan 3011', 39.74, 157, 264816972, 554526290, 212);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (19.2, to_date('15-11-2024', 'dd-mm-yyyy'), 'Singapore 1 Marina Boulevard', 213.41, 158, 408406962, 126356435, 250);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (15.41, to_date('21-01-2021', 'dd-mm-yyyy'), 'Orlando 8282 International Dri', 444.22, 159, 548962651, 934662057, 44);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (16.22, to_date('05-06-2023', 'dd-mm-yyyy'), 'Las Vegas 3645 Las Vegas Blvd ', 419.21, 160, 208588663, 955638737, 266);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (4.74, to_date('05-06-2023', 'dd-mm-yyyy'), 'Barcelona Avinguda Diagonal 40', 361.59, 161, 544043768, 325077153, 486);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (20.62, to_date('03-06-2020', 'dd-mm-yyyy'), 'Philadelphia 1500 Market Stree', 257.7, 162, 662847896, 696983605, 368);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (7.88, to_date('16-01-2024', 'dd-mm-yyyy'), 'Dallas 2001 McKinney Ave Uptow', 461.82, 163, 474084615, 743881857, 134);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (16.68, to_date('01-06-2020', 'dd-mm-yyyy'), 'Austin 9800 Metric Blvd', 40.64, 164, 598823879, 152300229, 209);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.96, to_date('16-06-2021', 'dd-mm-yyyy'), 'Shanghai 88 Xinza Road Lujiazu', 470.38, 165, 146924485, 383440042, 297);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (19.86, to_date('16-06-2021', 'dd-mm-yyyy'), 'S?£o Paulo Avenida Berrini 660', 146.11, 166, 168836760, 492752692, 414);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (14.08, to_date('09-11-2024', 'dd-mm-yyyy'), 'Chicago 200 South Wacker Drive', 18.11, 167, 728518500, 121799050, 141);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (10.77, to_date('21-09-2024', 'dd-mm-yyyy'), 'Detroit 400 Renaissance Center', 110.55, 168, 916416877, 851470156, 434);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (11.1, to_date('22-07-2021', 'dd-mm-yyyy'), 'Amsterdam Strawinskylaan 3011', 36.06, 169, 254163307, 250146889, 152);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (21.37, to_date('28-03-2021', 'dd-mm-yyyy'), 'S?£o Paulo Avenida Berrini 660', 123.65, 170, 649768071, 373839373, 134);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (10.74, to_date('28-03-2021', 'dd-mm-yyyy'), 'Buenos Aires Juana Manso 1670 ', 48.14, 171, 509483133, 305981991, 275);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.5, to_date('15-10-2020', 'dd-mm-yyyy'), 'Denver 1775 Sherman Street Den', 60.12, 172, 237832955, 677684763, 181);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (11.34, to_date('30-10-2022', 'dd-mm-yyyy'), 'Vienna Schottenring 16 Vienna ', 568.29, 173, 523866118, 967021982, 462);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (2.83, to_date('24-04-2022', 'dd-mm-yyyy'), 'London 8 Canada Square', 302.21, 174, 831558139, 815735034, 370);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (7.72, to_date('24-03-2020', 'dd-mm-yyyy'), 'Mexico City Avenida Santa Fe 1', 116.15, 175, 109491053, 700069359, 440);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (14.88, to_date('24-05-2020', 'dd-mm-yyyy'), 'Vienna Schottenring 16 Vienna ', 73.67, 176, 317285847, 229177674, 29);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (15.17, to_date('24-03-2023', 'dd-mm-yyyy'), 'Dubai Sheikh Zayed Road Emirat', 268.51, 177, 276176732, 963758267, 318);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (12.5, to_date('05-06-2023', 'dd-mm-yyyy'), 'Toronto 125 King Street West', 73.08, 178, 554526290, 317822031, 272);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (5.44, to_date('25-12-2020', 'dd-mm-yyyy'), 'Sydney 1 Alfred Street Circula', 18.8, 179, 570441676, 936658377, 194);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (16.3, to_date('13-02-2024', 'dd-mm-yyyy'), 'Calgary 250 Eau Claire Avenue ', 116.89, 180, 454434252, 834466751, 371);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (17.4, to_date('13-02-2024', 'dd-mm-yyyy'), 'Detroit 400 Renaissance Center', 506.85, 181, 840761695, 914453711, 260);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (1.12, to_date('08-06-2023', 'dd-mm-yyyy'), 'Seoul 50 Yeoksam-dong Gangnam-', 231.42, 182, 730016698, 466069898, 399);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (20.26, to_date('18-03-2022', 'dd-mm-yyyy'), 'Buenos Aires Juana Manso 1670 ', 579.03, 183, 837026985, 708105307, 85);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.51, to_date('13-01-2020', 'dd-mm-yyyy'), 'Philadelphia 1500 Market Stree', 338.19, 184, 334399647, 124888863, 328);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (18.44, to_date('08-12-2024', 'dd-mm-yyyy'), 'Vancouver 1000 Mainland Street', 39.39, 185, 709751915, 353251821, 203);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (4.07, to_date('08-02-2025', 'dd-mm-yyyy'), 'Rome Via dei Congressi 33', 13.82, 186, 573698524, 897043979, 88);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (5.82, to_date('13-07-2024', 'dd-mm-yyyy'), 'Houston 3 Greenway Plaza', 492.71, 187, 915122110, 199280229, 87);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (.64, to_date('21-12-2023', 'dd-mm-yyyy'), 'Detroit 400 Renaissance Center', 29.69, 188, 721297891, 610907411, 285);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (23.57, to_date('09-03-2024', 'dd-mm-yyyy'), 'San Diego 1110 Sorrento Valley', 33.14, 189, 982228959, 457984284, 311);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (22.85, to_date('27-10-2021', 'dd-mm-yyyy'), 'Shanghai 88 Xinza Road Lujiazu', 292.25, 190, 398601481, 208588663, 91);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8, to_date('27-11-2021', 'dd-mm-yyyy'), 'Prague Na Pankr??ci 178/180 Pa', 405.92, 191, 160302987, 123599375, 488);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (7.59, to_date('09-07-2021', 'dd-mm-yyyy'), 'Houston 3 Greenway Plaza', 72.6, 192, 118520760, 428261058, 385);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (6.19, to_date('02-07-2022', 'dd-mm-yyyy'), 'Toronto 125 King Street West', 162.16, 193, 517199517, 554350368, 239);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (17.47, to_date('09-11-2022', 'dd-mm-yyyy'), 'Toronto 125 King Street West', 279.81, 194, 466025294, 191471146, 121);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (9.61, to_date('03-09-2021', 'dd-mm-yyyy'), 'Seoul 50 Yeoksam-dong Gangnam-', 49.1, 195, 511271917, 999747607, 201);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (1.21, to_date('03-11-2021', 'dd-mm-yyyy'), 'Chicago 200 South Wacker Drive', 127.34, 196, 282610851, 160062237, 416);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (13.79, to_date('04-07-2023', 'dd-mm-yyyy'), 'San Francisco 1650 Hanover Str', 125.37, 197, 462724078, 576328517, 265);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (19.06, to_date('20-01-2023', 'dd-mm-yyyy'), 'Buenos Aires Juana Manso 1670 ', 289.61, 198, 128003805, 378682852, 62);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (6.49, to_date('16-10-2024', 'dd-mm-yyyy'), 'Calgary 250 Eau Claire Avenue ', 70.87, 199, 811670082, 256539670, 115);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (23.02, to_date('03-03-2024', 'dd-mm-yyyy'), 'New York City 1 Wall Street', 163.77, 203, 434172398, 124964227, 193);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (12.65, to_date('03-04-2024', 'dd-mm-yyyy'), 'Chicago 200 South Wacker Drive', 456.57, 200, 856415343, 670045074, 158);
commit;
prompt 200 records committed...
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.17, to_date('27-12-2021', 'dd-mm-yyyy'), 'Phoenix 2400 Biltmore Fashion ', 512.47, 204, 441448733, 662847896, 395);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (17.39, to_date('13-11-2021', 'dd-mm-yyyy'), 'Phoenix 2400 Biltmore Fashion ', 174.78, 205, 121799050, 317827346, 423);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (9.01, to_date('29-07-2021', 'dd-mm-yyyy'), 'Vancouver 1000 Mainland Street', 33.61, 206, 925132120, 457655167, 194);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (20.88, to_date('12-11-2020', 'dd-mm-yyyy'), 'London 8 Canada Square', 107.31, 207, 773115408, 175910686, 182);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (6.97, to_date('12-11-2020', 'dd-mm-yyyy'), 'Singapore 1 Marina Boulevard', 73.97, 208, 816155341, 775393164, 411);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (1.71, to_date('18-05-2020', 'dd-mm-yyyy'), 'London 8 Canada Square', 500.29, 201, 639106141, 447040488, 495);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (20.04, to_date('05-07-2023', 'dd-mm-yyyy'), 'San Francisco 1650 Hanover Str', 492.84, 209, 509662169, 118520760, 250);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (4.79, to_date('06-04-2024', 'dd-mm-yyyy'), 'Vancouver 1000 Mainland Street', 12.78, 210, 457984284, 744557849, 253);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (20.88, to_date('20-08-2022', 'dd-mm-yyyy'), 'Paris 11 Cour D?fense Seine Pu', 569.71, 211, 489630456, 841180795, 405);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (3.11, to_date('20-08-2022', 'dd-mm-yyyy'), 'Dubai Sheikh Zayed Road Emirat', 127.51, 212, 451092501, 218057742, 404);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (18.66, to_date('12-06-2020', 'dd-mm-yyyy'), 'Vancouver 1000 Mainland Street', 586.93, 213, 443970722, 496569875, 21);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (17.98, to_date('07-11-2021', 'dd-mm-yyyy'), 'Philadelphia 1500 Market Stree', 119.35, 202, 637214817, 490765532, 233);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (2.99, to_date('16-04-2020', 'dd-mm-yyyy'), 'Amsterdam Strawinskylaan 3011', 465.8, 214, 353251821, 526237352, 410);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (19.81, to_date('21-11-2023', 'dd-mm-yyyy'), 'Jakarta Jalan Sudirman Kav 52-', 19.56, 215, 725176793, 462724078, 246);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (4.29, to_date('21-12-2023', 'dd-mm-yyyy'), 'Jakarta Jalan Sudirman Kav 52-', 30.6, 216, 957557141, 405114344, 407);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (17.2, to_date('25-05-2024', 'dd-mm-yyyy'), 'New York City 1 Wall Street', 71.75, 217, 610737497, 648466322, 223);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (18.59, to_date('22-10-2024', 'dd-mm-yyyy'), 'Detroit 400 Renaissance Center', 37.58, 218, 392633660, 991512349, 136);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (10.2, to_date('18-10-2022', 'dd-mm-yyyy'), 'Detroit 400 Renaissance Center', 474.66, 219, 537375804, 703786319, 37);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (1.47, to_date('11-03-2022', 'dd-mm-yyyy'), 'Chicago 200 South Wacker Drive', 189.48, 220, 205825700, 800480327, 389);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (5.79, to_date('11-03-2022', 'dd-mm-yyyy'), 'Austin 9800 Metric Blvd', 185.67, 221, 928999987, 191471146, 157);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (10.58, to_date('12-03-2024', 'dd-mm-yyyy'), 'Rome Via dei Congressi 33', 51.69, 222, 698587684, 675194468, 482);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.73, to_date('26-06-2022', 'dd-mm-yyyy'), 'Montreal 9100 Boulevard de l A', 58.47, 223, 667027263, 679393117, 218);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (1.99, to_date('29-04-2024', 'dd-mm-yyyy'), 'San Francisco 1650 Hanover Str', 357.98, 224, 292421869, 457984284, 378);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (2.91, to_date('29-07-2020', 'dd-mm-yyyy'), 'New York City 1 Wall Street', 527.8, 225, 675296909, 584468952, 465);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (18.55, to_date('29-09-2020', 'dd-mm-yyyy'), 'Sydney 1 Alfred Street Circula', 195.76, 226, 434172398, 829145191, 162);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (5.34, to_date('27-07-2024', 'dd-mm-yyyy'), 'Montreal 9100 Boulevard de l A', 523.49, 227, 273396102, 525527704, 233);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (.44, to_date('20-03-2022', 'dd-mm-yyyy'), 'Las Vegas 3645 Las Vegas Blvd ', 277.59, 228, 105654067, 866183544, 39);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (15.35, to_date('16-12-2024', 'dd-mm-yyyy'), 'Mexico City Avenida Santa Fe 1', 36.22, 229, 792537826, 708105307, 388);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (14.46, to_date('27-01-2023', 'dd-mm-yyyy'), 'Atlanta 3333 Peachtree Road NE', 25.56, 230, 596818423, 182111971, 364);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (14.79, to_date('27-02-2023', 'dd-mm-yyyy'), 'S?£o Paulo Avenida Berrini 660', 61.23, 231, 641170597, 811411011, 270);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (7.7, to_date('04-10-2022', 'dd-mm-yyyy'), 'Boston 50 Seaport Boulevard', 515.86, 232, 624917762, 172274041, 274);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (4.86, to_date('02-05-2022', 'dd-mm-yyyy'), 'Paris 11 Cour D?fense Seine Pu', 348.55, 233, 942622933, 334399647, 396);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (12.95, to_date('12-11-2024', 'dd-mm-yyyy'), 'Boston 50 Seaport Boulevard', 35.85, 234, 582445416, 610512281, 164);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (10.58, to_date('12-12-2023', 'dd-mm-yyyy'), 'Prague Na Pankr??ci 178/180 Pa', 353.79, 235, 457984284, 455403379, 69);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (.43, to_date('12-02-2024', 'dd-mm-yyyy'), 'Buenos Aires Juana Manso 1670 ', 14.93, 236, 639106141, 383440042, 55);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (4.32, to_date('28-07-2024', 'dd-mm-yyyy'), 'Orlando 8282 International Dri', 42.35, 237, 696983605, 246305254, 476);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (5.73, to_date('17-04-2023', 'dd-mm-yyyy'), 'Istanbul B?¼y?¼kdere Cadde No:', 51.26, 238, 592163243, 194505717, 65);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (7.17, to_date('09-09-2023', 'dd-mm-yyyy'), 'Paris 11 Cour D?fense Seine Pu', 58.67, 239, 730016698, 282610851, 151);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (19.55, to_date('15-07-2020', 'dd-mm-yyyy'), 'S?£o Paulo Avenida Berrini 660', 309.07, 240, 957557141, 148778614, 294);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (4.4, to_date('15-07-2020', 'dd-mm-yyyy'), 'Houston 3 Greenway Plaza', 382.38, 241, 932610681, 557038448, 14);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (11.17, to_date('11-07-2021', 'dd-mm-yyyy'), 'Boston 50 Seaport Boulevard', 496.01, 242, 191471146, 708105307, 283);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (10.23, to_date('07-09-2022', 'dd-mm-yyyy'), 'Prague Na Pankr??ci 178/180 Pa', 339, 243, 176771449, 144642188, 447);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (3.93, to_date('01-07-2020', 'dd-mm-yyyy'), 'Dublin Barrow Street Silicon D', 283.18, 244, 807686151, 317285847, 200);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (5.5, to_date('19-05-2020', 'dd-mm-yyyy'), 'Philadelphia 1500 Market Stree', 300.42, 245, 317838008, 763764233, 287);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.69, to_date('19-05-2020', 'dd-mm-yyyy'), 'Montreal 9100 Boulevard de l A', 19.44, 246, 146924485, 782064933, 42);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (16.96, to_date('13-04-2020', 'dd-mm-yyyy'), 'Austin 9800 Metric Blvd', 584.57, 247, 433213790, 662847896, 416);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (7.78, to_date('22-05-2022', 'dd-mm-yyyy'), 'Montreal 9100 Boulevard de l A', 13.13, 248, 891325545, 911045673, 203);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (11.82, to_date('04-03-2021', 'dd-mm-yyyy'), 'Paris 11 Cour D?fense Seine Pu', 250.11, 249, 374025072, 373631073, 244);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (13.23, to_date('07-10-2024', 'dd-mm-yyyy'), 'S?£o Paulo Avenida Berrini 660', 47.66, 250, 558821746, 434172398, 261);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (14.25, to_date('07-12-2024', 'dd-mm-yyyy'), 'Las Vegas 3645 Las Vegas Blvd ', 23.22, 251, 687150404, 236436336, 400);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (15.99, to_date('15-07-2020', 'dd-mm-yyyy'), 'Houston 3 Greenway Plaza', 276.6, 252, 610286655, 816155341, 124);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (14.57, to_date('26-09-2020', 'dd-mm-yyyy'), 'S?£o Paulo Avenida Berrini 660', 359.09, 253, 933857373, 883043356, 355);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (23.14, to_date('18-01-2020', 'dd-mm-yyyy'), 'Sydney 1 Alfred Street Circula', 351.26, 254, 741975218, 543584585, 138);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (.54, to_date('12-12-2022', 'dd-mm-yyyy'), 'Dublin Barrow Street Silicon D', 110.54, 255, 158277278, 199280229, 50);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (17.94, to_date('12-02-2023', 'dd-mm-yyyy'), 'Atlanta 3333 Peachtree Road NE', 224.72, 256, 206629316, 992554869, 424);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (17.05, to_date('13-09-2021', 'dd-mm-yyyy'), 'Dallas 2001 McKinney Ave Uptow', 551.35, 257, 160302987, 357964464, 454);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (12.9, to_date('30-06-2024', 'dd-mm-yyyy'), 'Singapore 1 Marina Boulevard', 136.23, 258, 511271917, 565571169, 265);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (15.37, to_date('26-12-2021', 'dd-mm-yyyy'), 'Bangkok 990 Silom Road', 125.08, 259, 594211402, 923811818, 299);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (22.08, to_date('11-12-2020', 'dd-mm-yyyy'), 'Boston 50 Seaport Boulevard', 68.95, 260, 375506538, 515674654, 476);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (16.54, to_date('11-01-2021', 'dd-mm-yyyy'), 'Calgary 250 Eau Claire Avenue ', 385.37, 261, 573698524, 175910686, 97);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (4.15, to_date('03-12-2024', 'dd-mm-yyyy'), 'Austin 9800 Metric Blvd', 72.61, 262, 194690926, 595283787, 38);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (22.38, to_date('06-08-2024', 'dd-mm-yyyy'), 'Washington D.C. 1775 K Street ', 115.2, 263, 392633660, 172274041, 6);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (11.57, to_date('29-12-2024', 'dd-mm-yyyy'), 'Seoul 50 Yeoksam-dong Gangnam-', 16.43, 264, 827216964, 742220858, 417);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (7.9, to_date('15-05-2022', 'dd-mm-yyyy'), 'Mexico City Avenida Santa Fe 1', 349.85, 265, 601180013, 928999987, 124);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (14.17, to_date('15-07-2022', 'dd-mm-yyyy'), 'Jakarta Jalan Sudirman Kav 52-', 398.67, 266, 129756457, 208738794, 233);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (1.67, to_date('25-07-2021', 'dd-mm-yyyy'), 'Prague Na Pankr??ci 178/180 Pa', 478.18, 267, 901931967, 758646772, 464);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (15.58, to_date('24-07-2022', 'dd-mm-yyyy'), 'Singapore 1 Marina Boulevard', 415.29, 268, 695020064, 696374837, 298);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (7.72, to_date('21-02-2021', 'dd-mm-yyyy'), 'Bangkok 990 Silom Road', 23.4, 269, 758061612, 428261058, 184);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (23.41, to_date('09-10-2024', 'dd-mm-yyyy'), 'Houston 3 Greenway Plaza', 144.64, 270, 505637388, 218057742, 265);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (13.44, to_date('09-12-2024', 'dd-mm-yyyy'), 'Las Vegas 3645 Las Vegas Blvd ', 23.39, 271, 853017499, 597219131, 152);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (20.35, to_date('02-09-2021', 'dd-mm-yyyy'), 'S?£o Paulo Avenida Berrini 660', 390.99, 272, 925132120, 830160294, 331);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (7.82, to_date('10-05-2024', 'dd-mm-yyyy'), 'Paris 11 Cour D?fense Seine Pu', 440.11, 273, 867765371, 841180795, 170);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (13.34, to_date('18-10-2021', 'dd-mm-yyyy'), 'San Diego 1110 Sorrento Valley', 353.71, 274, 237832955, 770792852, 262);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (.72, to_date('12-08-2022', 'dd-mm-yyyy'), 'Istanbul B?¼y?¼kdere Cadde No:', 295.74, 275, 153951230, 730016698, 190);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (2.65, to_date('12-10-2022', 'dd-mm-yyyy'), 'Atlanta 3333 Peachtree Road NE', 347.87, 276, 843068367, 584468952, 193);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (13.22, to_date('22-07-2024', 'dd-mm-yyyy'), 'Buenos Aires Juana Manso 1670 ', 67.74, 277, 597219131, 792537826, 71);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (11.99, to_date('30-06-2022', 'dd-mm-yyyy'), 'Rome Via dei Congressi 33', 260.3, 278, 325527961, 556888328, 205);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (17.05, to_date('29-01-2020', 'dd-mm-yyyy'), 'Bangkok 990 Silom Road', 194.05, 279, 331610494, 226625742, 111);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (13.79, to_date('04-01-2022', 'dd-mm-yyyy'), 'Washington D.C. 1775 K Street ', 125.42, 280, 698757041, 289832097, 447);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (13.1, to_date('04-03-2022', 'dd-mm-yyyy'), 'Seattle 520 Westlake Avenue So', 395.22, 281, 548962651, 241957656, 428);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (18.57, to_date('28-11-2020', 'dd-mm-yyyy'), 'Barcelona Avinguda Diagonal 40', 137.34, 282, 592162027, 557756293, 24);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (11.16, to_date('18-08-2024', 'dd-mm-yyyy'), 'Buenos Aires Juana Manso 1670 ', 46.48, 283, 758061612, 617937771, 167);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.69, to_date('26-08-2022', 'dd-mm-yyyy'), 'Miami 1001 Brickell Ave', 225.69, 284, 847656702, 282610851, 284);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (3.96, to_date('23-12-2020', 'dd-mm-yyyy'), 'Shanghai 88 Xinza Road Lujiazu', 510, 285, 457984284, 222410846, 178);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (20.63, to_date('23-12-2020', 'dd-mm-yyyy'), 'San Diego 1110 Sorrento Valley', 52.37, 286, 293747357, 624917762, 159);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (10.22, to_date('25-05-2024', 'dd-mm-yyyy'), 'Buenos Aires Juana Manso 1670 ', 71.67, 287, 920943612, 666205340, 23);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.37, to_date('21-06-2020', 'dd-mm-yyyy'), 'Singapore 1 Marina Boulevard', 256.52, 288, 206629316, 254163307, 398);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (21.62, to_date('21-11-2020', 'dd-mm-yyyy'), 'Istanbul B?¼y?¼kdere Cadde No:', 395.96, 289, 592162027, 210963470, 287);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (10.92, to_date('16-05-2024', 'dd-mm-yyyy'), 'Toronto 125 King Street West', 49.5, 290, 293747357, 317827346, 209);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (13.85, to_date('16-06-2024', 'dd-mm-yyyy'), 'Seattle 520 Westlake Avenue So', 43.93, 291, 162220250, 375506538, 321);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (14.21, to_date('03-05-2024', 'dd-mm-yyyy'), 'San Diego 1110 Sorrento Valley', 56.44, 292, 769542199, 299788152, 448);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (1.1, to_date('23-08-2020', 'dd-mm-yyyy'), 'Amsterdam Strawinskylaan 3011', 529.56, 293, 942622933, 914453711, 235);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (13.58, to_date('27-09-2020', 'dd-mm-yyyy'), 'Vienna Schottenring 16 Vienna ', 49.77, 294, 252975811, 870513504, 435);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (20.52, to_date('01-05-2024', 'dd-mm-yyyy'), 'Calgary 250 Eau Claire Avenue ', 19.09, 295, 200281225, 856415343, 204);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (10.27, to_date('01-06-2024', 'dd-mm-yyyy'), 'Rome Via dei Congressi 33', 30.38, 296, 716184718, 662847896, 167);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (9.09, to_date('09-10-2021', 'dd-mm-yyyy'), 'Mexico City Avenida Santa Fe 1', 341.17, 297, 904929173, 509662169, 488);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (10.46, to_date('17-05-2024', 'dd-mm-yyyy'), 'Rome Via dei Congressi 33', 62.92, 303, 783080526, 540381721, 213);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (7.49, to_date('11-03-2024', 'dd-mm-yyyy'), 'S?£o Paulo Avenida Berrini 660', 588.81, 304, 822240474, 837311276, 369);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (14.87, to_date('07-03-2023', 'dd-mm-yyyy'), 'Las Vegas 3645 Las Vegas Blvd ', 62.78, 298, 948133904, 305981991, 3);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (20.76, to_date('07-04-2023', 'dd-mm-yyyy'), 'Shanghai 88 Xinza Road Lujiazu', 239.34, 305, 153938151, 923597583, 70);
commit;
prompt 300 records committed...
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (14.41, to_date('07-12-2023', 'dd-mm-yyyy'), 'Orlando 8282 International Dri', 427.06, 306, 742220858, 800480327, 101);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (14.42, to_date('16-01-2024', 'dd-mm-yyyy'), 'Berlin Unter den Linden 67-68', 24.1, 299, 594211402, 176771449, 46);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (21.45, to_date('11-11-2020', 'dd-mm-yyyy'), 'Sydney 1 Alfred Street Circula', 160.18, 307, 683756135, 154015286, 355);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (19.55, to_date('11-05-2021', 'dd-mm-yyyy'), 'Phoenix 2400 Biltmore Fashion ', 312.11, 308, 170243739, 835284851, 138);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (10.02, to_date('11-07-2021', 'dd-mm-yyyy'), 'Phoenix 2400 Biltmore Fashion ', 401.31, 309, 372097171, 352072255, 298);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (10.02, to_date('15-08-2024', 'dd-mm-yyyy'), 'Las Vegas 3645 Las Vegas Blvd ', 66.13, 310, 978982125, 466025294, 441);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (9.3, to_date('26-02-2020', 'dd-mm-yyyy'), 'Tokyo 3-14-1 Nishi-Shinjuku Sh', 323.3, 311, 920460836, 226625742, 323);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (12.3, to_date('18-09-2021', 'dd-mm-yyyy'), 'Chicago 200 South Wacker Drive', 490.31, 300, 123599375, 451092501, 328);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (11.52, to_date('18-01-2020', 'dd-mm-yyyy'), 'Dublin Barrow Street Silicon D', 363.82, 312, 583024899, 548962651, 318);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (18.71, to_date('18-03-2020', 'dd-mm-yyyy'), 'Buenos Aires Juana Manso 1670 ', 381.44, 313, 959338316, 182111971, 481);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.06, to_date('10-05-2024', 'dd-mm-yyyy'), 'Seattle 520 Westlake Avenue So', 292.42, 301, 172274041, 696374837, 277);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (2.55, to_date('18-06-2020', 'dd-mm-yyyy'), 'Berlin Unter den Linden 67-68', 267.99, 314, 124985854, 639106141, 242);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.01, to_date('22-09-2024', 'dd-mm-yyyy'), 'Houston 3 Greenway Plaza', 348.58, 315, 375154552, 572513020, 428);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (16.45, to_date('24-07-2022', 'dd-mm-yyyy'), 'Los Angeles 10233 Constellatio', 240.19, 316, 660886697, 543584585, 238);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (16.85, to_date('24-07-2022', 'dd-mm-yyyy'), 'Houston 3 Greenway Plaza', 308.37, 317, 175910686, 743881857, 60);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (2.55, to_date('10-07-2024', 'dd-mm-yyyy'), 'London 8 Canada Square', 58.62, 318, 457655167, 840761695, 28);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (12.46, to_date('04-08-2023', 'dd-mm-yyyy'), 'Prague Na Pankr??ci 178/180 Pa', 44.08, 319, 325077153, 330031171, 407);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (4.57, to_date('13-08-2023', 'dd-mm-yyyy'), 'Seoul 50 Yeoksam-dong Gangnam-', 130.44, 320, 666205340, 179779567, 371);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (12.51, to_date('26-12-2021', 'dd-mm-yyyy'), 'San Francisco 1650 Hanover Str', 295.08, 321, 540381721, 129756457, 335);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (11.85, to_date('26-01-2022', 'dd-mm-yyyy'), 'Phoenix 2400 Biltmore Fashion ', 430.42, 302, 851536797, 675296909, 462);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (20.4, to_date('06-07-2024', 'dd-mm-yyyy'), 'Paris 11 Cour D?fense Seine Pu', 54.23, 322, 925132120, 246305254, 281);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (.82, to_date('07-03-2022', 'dd-mm-yyyy'), 'Bangkok 990 Silom Road', 29.89, 323, 400352077, 753286200, 71);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (9.29, to_date('30-10-2021', 'dd-mm-yyyy'), 'Sydney 1 Alfred Street Circula', 206.18, 324, 293747357, 897043979, 494);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (5.64, to_date('08-05-2022', 'dd-mm-yyyy'), 'Boston 50 Seaport Boulevard', 534.86, 325, 402379540, 970138584, 58);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (23.59, to_date('08-07-2022', 'dd-mm-yyyy'), 'Calgary 250 Eau Claire Avenue ', 424.64, 326, 154015286, 755809998, 39);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.38, to_date('12-11-2020', 'dd-mm-yyyy'), 'Bangkok 990 Silom Road', 319.65, 327, 439643727, 252975811, 220);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.18, to_date('02-03-2021', 'dd-mm-yyyy'), 'Dublin Barrow Street Silicon D', 34.59, 328, 924964324, 565571169, 49);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (17.51, to_date('28-02-2023', 'dd-mm-yyyy'), 'Houston 3 Greenway Plaza', 59.98, 329, 698587684, 963758267, 337);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (17.69, to_date('08-06-2020', 'dd-mm-yyyy'), 'Philadelphia 1500 Market Stree', 485.13, 330, 264816972, 698757041, 296);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.85, to_date('08-08-2020', 'dd-mm-yyyy'), 'New York City 1 Wall Street', 286.18, 331, 433213790, 220627730, 81);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (21.66, to_date('16-12-2023', 'dd-mm-yyyy'), 'Shanghai 88 Xinza Road Lujiazu', 51.4, 332, 126638060, 178726838, 422);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (2.69, to_date('28-07-2024', 'dd-mm-yyyy'), 'Boston 50 Seaport Boulevard', 21.52, 333, 145376110, 264615737, 145);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.22, to_date('23-05-2021', 'dd-mm-yyyy'), 'S?£o Paulo Avenida Berrini 660', 33.04, 334, 424357965, 709751915, 203);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (12.82, to_date('27-03-2023', 'dd-mm-yyyy'), 'Seattle 520 Westlake Avenue So', 52.34, 335, 595283787, 339168131, 90);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (9.42, to_date('27-03-2023', 'dd-mm-yyyy'), 'San Francisco 1650 Hanover Str', 31.92, 336, 744557849, 100171750, 451);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.55, to_date('22-01-2022', 'dd-mm-yyyy'), 'Tokyo 3-14-1 Nishi-Shinjuku Sh', 423.68, 337, 188014768, 252975811, 353);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (14.84, to_date('16-01-2024', 'dd-mm-yyyy'), 'Jakarta Jalan Sudirman Kav 52-', 16.49, 338, 559165794, 823910760, 215);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (7.39, to_date('29-10-2022', 'dd-mm-yyyy'), 'Seoul 50 Yeoksam-dong Gangnam-', 535.43, 339, 967021982, 592162027, 17);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (15.28, to_date('23-08-2024', 'dd-mm-yyyy'), 'Istanbul B?¼y?¼kdere Cadde No:', 98.26, 340, 408406962, 241957656, 110);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (16.94, to_date('23-10-2024', 'dd-mm-yyyy'), 'Rome Via dei Congressi 33', 163.84, 341, 503031840, 823910760, 308);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (3.3, to_date('22-02-2021', 'dd-mm-yyyy'), 'Denver 1775 Sherman Street Den', 499.59, 342, 339168131, 625556109, 427);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (14.77, to_date('09-08-2020', 'dd-mm-yyyy'), 'Denver 1775 Sherman Street Den', 318.59, 343, 914334290, 252975811, 22);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.55, to_date('06-01-2020', 'dd-mm-yyyy'), 'Phoenix 2400 Biltmore Fashion ', 229.72, 344, 250161276, 481541006, 439);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (13.19, to_date('26-09-2020', 'dd-mm-yyyy'), 'Jakarta Jalan Sudirman Kav 52-', 50.16, 345, 846419707, 944654806, 145);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (14.47, to_date('26-11-2020', 'dd-mm-yyyy'), 'Phoenix 2400 Biltmore Fashion ', 386.29, 346, 799006955, 610907411, 488);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (1.73, to_date('17-01-2021', 'dd-mm-yyyy'), 'Brussels Rue de la Loi 175 Eur', 34.17, 347, 364757858, 325077153, 375);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (4.5, to_date('10-09-2024', 'dd-mm-yyyy'), 'Vancouver 1000 Mainland Street', 62.52, 348, 408406962, 844229081, 420);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (17.02, to_date('28-06-2024', 'dd-mm-yyyy'), 'Vienna Schottenring 16 Vienna ', 369.51, 349, 425058356, 607570811, 101);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (7.76, to_date('04-05-2024', 'dd-mm-yyyy'), 'Istanbul B?¼y?¼kdere Cadde No:', 49.07, 350, 730016698, 121799050, 108);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (1.82, to_date('04-05-2024', 'dd-mm-yyyy'), 'Shanghai 88 Xinza Road Lujiazu', 202.92, 351, 787378023, 980173326, 196);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (20.21, to_date('25-01-2021', 'dd-mm-yyyy'), 'Singapore 1 Marina Boulevard', 125.09, 352, 982228959, 901931967, 107);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.49, to_date('30-08-2022', 'dd-mm-yyyy'), 'London 8 Canada Square', 552.5, 353, 126638060, 466025294, 257);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (22.49, to_date('28-11-2020', 'dd-mm-yyyy'), 'Paris 11 Cour D?fense Seine Pu', 372.5, 354, 463724524, 738596862, 277);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (2.2, to_date('29-03-2023', 'dd-mm-yyyy'), 'Mexico City Avenida Santa Fe 1', 25.97, 355, 637966728, 435897536, 173);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (4.17, to_date('29-03-2023', 'dd-mm-yyyy'), 'Jakarta Jalan Sudirman Kav 52-', 271.07, 356, 953151798, 478902541, 475);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (23.69, to_date('29-05-2023', 'dd-mm-yyyy'), 'Philadelphia 1500 Market Stree', 51.15, 357, 846419707, 953151798, 240);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (18.38, to_date('06-06-2020', 'dd-mm-yyyy'), 'Buenos Aires Juana Manso 1670 ', 217.86, 358, 932610681, 317285847, 467);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (16.96, to_date('24-08-2024', 'dd-mm-yyyy'), 'Vienna Schottenring 16 Vienna ', 42.65, 359, 443970722, 646684699, 385);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (4.07, to_date('19-08-2024', 'dd-mm-yyyy'), 'Bangkok 990 Silom Road', 73.37, 360, 816155341, 679393117, 35);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (5.16, to_date('19-08-2024', 'dd-mm-yyyy'), 'Atlanta 3333 Peachtree Road NE', 243.32, 361, 787378023, 624917762, 58);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (10.64, to_date('05-01-2024', 'dd-mm-yyyy'), 'Vancouver 1000 Mainland Street', 36.57, 362, 870513504, 925132120, 188);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (6.82, to_date('16-11-2023', 'dd-mm-yyyy'), 'Washington D.C. 1775 K Street ', 22.49, 363, 716184718, 305981991, 437);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (3.08, to_date('25-08-2022', 'dd-mm-yyyy'), 'Boston 50 Seaport Boulevard', 221.12, 364, 767094858, 256244114, 428);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (5.82, to_date('22-09-2024', 'dd-mm-yyyy'), 'Dallas 2001 McKinney Ave Uptow', 72.31, 365, 451092501, 457655167, 347);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (17.07, to_date('22-10-2024', 'dd-mm-yyyy'), 'Denver 1775 Sherman Street Den', 182.15, 366, 923811818, 374025072, 419);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (7.02, to_date('11-04-2021', 'dd-mm-yyyy'), 'San Diego 1110 Sorrento Valley', 191.43, 367, 921188608, 183537357, 267);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (13.02, to_date('12-03-2021', 'dd-mm-yyyy'), 'Philadelphia 1500 Market Stree', 345.04, 368, 873456697, 373839373, 316);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (7.37, to_date('08-01-2024', 'dd-mm-yyyy'), 'Montreal 9100 Boulevard de l A', 207.06, 369, 344533634, 626464892, 447);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (12.48, to_date('06-07-2020', 'dd-mm-yyyy'), 'Phoenix 2400 Biltmore Fashion ', 68.52, 370, 957557141, 158277278, 29);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (15.4, to_date('06-09-2020', 'dd-mm-yyyy'), 'Orlando 8282 International Dri', 407.39, 371, 160302987, 709751915, 101);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (10.87, to_date('27-03-2022', 'dd-mm-yyyy'), 'Brussels Rue de la Loi 175 Eur', 534.24, 372, 679393117, 151674046, 5);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (11.94, to_date('08-10-2022', 'dd-mm-yyyy'), 'Brussels Rue de la Loi 175 Eur', 310.03, 373, 927761034, 616052079, 354);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (19.74, to_date('02-10-2021', 'dd-mm-yyyy'), 'Atlanta 3333 Peachtree Road NE', 62.37, 374, 957557141, 721297891, 469);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (14.44, to_date('20-09-2024', 'dd-mm-yyyy'), 'Jakarta Jalan Sudirman Kav 52-', 66.75, 375, 897043979, 264615737, 152);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (6.83, to_date('20-10-2024', 'dd-mm-yyyy'), 'Istanbul B?¼y?¼kdere Cadde No:', 484.17, 376, 914334290, 373631073, 378);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (15.97, to_date('06-10-2023', 'dd-mm-yyyy'), 'Denver 1775 Sherman Street Den', 58.42, 377, 379652390, 645800410, 202);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (17.03, to_date('23-07-2022', 'dd-mm-yyyy'), 'Jakarta Jalan Sudirman Kav 52-', 519.39, 378, 648883310, 123599375, 96);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (3.15, to_date('26-12-2022', 'dd-mm-yyyy'), 'Buenos Aires Juana Manso 1670 ', 258.9, 379, 936658377, 698519392, 304);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (10.48, to_date('09-11-2023', 'dd-mm-yyyy'), 'Dublin Barrow Street Silicon D', 20.25, 380, 241957656, 405114344, 338);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (9.14, to_date('09-11-2023', 'dd-mm-yyyy'), 'Brussels Rue de la Loi 175 Eur', 31.76, 381, 883043356, 977191746, 65);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (18.5, to_date('12-01-2020', 'dd-mm-yyyy'), 'Vienna Schottenring 16 Vienna ', 120.29, 382, 181050162, 932610681, 147);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (16.71, to_date('15-09-2020', 'dd-mm-yyyy'), 'Prague Na Pankr??ci 178/180 Pa', 136.51, 383, 719859226, 696374837, 111);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (3.33, to_date('04-05-2024', 'dd-mm-yyyy'), 'Toronto 125 King Street West', 120.68, 384, 726029513, 831558139, 69);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (3.19, to_date('01-06-2024', 'dd-mm-yyyy'), 'Rome Via dei Congressi 33', 67.79, 385, 191471146, 250161276, 499);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (19.74, to_date('01-08-2024', 'dd-mm-yyyy'), 'Dubai Sheikh Zayed Road Emirat', 499.08, 386, 183537357, 490765532, 1);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (21.77, to_date('20-05-2020', 'dd-mm-yyyy'), 'Jakarta Jalan Sudirman Kav 52-', 559.59, 387, 144642188, 662635024, 104);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.06, to_date('02-05-2021', 'dd-mm-yyyy'), 'San Diego 1110 Sorrento Valley', 328.07, 388, 462724078, 238646522, 72);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (5.59, to_date('30-03-2020', 'dd-mm-yyyy'), 'Tokyo 3-14-1 Nishi-Shinjuku Sh', 355.56, 389, 675296909, 331610494, 365);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (9.53, to_date('01-03-2021', 'dd-mm-yyyy'), 'Las Vegas 3645 Las Vegas Blvd ', 124.26, 390, 914334290, 117293621, 468);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (13.18, to_date('01-03-2021', 'dd-mm-yyyy'), 'Paris 11 Cour D?fense Seine Pu', 450.28, 391, 646684699, 124888863, 9);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (15.07, to_date('07-12-2024', 'dd-mm-yyyy'), 'Dublin Barrow Street Silicon D', 485.59, 392, 980200311, 862511399, 39);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (2.89, to_date('22-12-2023', 'dd-mm-yyyy'), 'Bangkok 990 Silom Road', 53.71, 393, 378682852, 542004169, 79);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (15.08, to_date('18-10-2021', 'dd-mm-yyyy'), 'Bangkok 990 Silom Road', 283.51, 394, 200281225, 292421869, 18);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (20.1, to_date('10-07-2022', 'dd-mm-yyyy'), 'Denver 1775 Sherman Street Den', 428.1, 395, 221358829, 376109089, 85);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (12.37, to_date('10-08-2022', 'dd-mm-yyyy'), 'Barcelona Avinguda Diagonal 40', 440.01, 396, 928999987, 934662057, 262);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (.55, to_date('29-04-2020', 'dd-mm-yyyy'), 'Shanghai 88 Xinza Road Lujiazu', 69, 397, 317822031, 908730507, 102);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (10.34, to_date('13-04-2020', 'dd-mm-yyyy'), 'Shanghai 88 Xinza Road Lujiazu', 259.06, 398, 943746739, 572513020, 424);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (23.43, to_date('04-04-2023', 'dd-mm-yyyy'), 'Phoenix 2400 Biltmore Fashion ', 337.77, 399, 229177674, 126638060, 453);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (11.51, to_date('08-03-2021', 'dd-mm-yyyy'), 'Montreal 9100 Boulevard de l A', 413.83, 400, 496569875, 811670082, 398);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (4.32, to_date('08-04-2021', 'dd-mm-yyyy'), 'Washington D.C. 1775 K Street ', 373.72, 401, 559165794, 631847604, 70);
commit;
prompt 400 records committed...
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (2.56, to_date('28-12-2023', 'dd-mm-yyyy'), 'Vienna Schottenring 16 Vienna ', 419.68, 402, 252401236, 124985854, 474);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.2, to_date('20-03-2024', 'dd-mm-yyyy'), 'Houston 3 Greenway Plaza', 18.1, 403, 763764233, 220627730, 383);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (15.71, to_date('20-07-2024', 'dd-mm-yyyy'), 'Los Angeles 10233 Constellatio', 406.02, 404, 398601481, 275393212, 39);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (1.82, to_date('17-07-2024', 'dd-mm-yyyy'), 'S?£o Paulo Avenida Berrini 660', 64.47, 405, 698587684, 709751915, 105);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (18.59, to_date('17-08-2024', 'dd-mm-yyyy'), 'Washington D.C. 1775 K Street ', 35.8, 406, 915122110, 755809998, 9);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (21.14, to_date('29-12-2023', 'dd-mm-yyyy'), 'Shanghai 88 Xinza Road Lujiazu', 41.42, 407, 645800410, 592162027, 137);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (2.67, to_date('28-06-2020', 'dd-mm-yyyy'), 'Istanbul B?¼y?¼kdere Cadde No:', 239.77, 408, 466069898, 124985854, 148);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (9.34, to_date('27-03-2024', 'dd-mm-yyyy'), 'S?£o Paulo Avenida Berrini 660', 412.86, 409, 851536797, 980200311, 474);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (6.3, to_date('20-05-2023', 'dd-mm-yyyy'), 'Bangkok 990 Silom Road', 13.57, 410, 662847896, 317838008, 156);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (12.96, to_date('20-05-2023', 'dd-mm-yyyy'), 'Calgary 250 Eau Claire Avenue ', 550.94, 411, 867765371, 339168131, 110);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (.38, to_date('02-04-2020', 'dd-mm-yyyy'), 'Amsterdam Strawinskylaan 3011', 358.85, 412, 182111971, 927761034, 68);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (14.72, to_date('24-07-2022', 'dd-mm-yyyy'), 'Miami 1001 Brickell Ave', 467.8, 413, 862511399, 558220660, 378);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.37, to_date('28-09-2024', 'dd-mm-yyyy'), 'Amsterdam Strawinskylaan 3011', 121.75, 414, 923811818, 372097171, 277);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (19.45, to_date('22-08-2020', 'dd-mm-yyyy'), 'Austin 9800 Metric Blvd', 423.45, 415, 840761695, 141837640, 98);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (4.34, to_date('22-10-2020', 'dd-mm-yyyy'), 'Phoenix 2400 Biltmore Fashion ', 74.87, 416, 205825700, 280206586, 412);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (13.12, to_date('30-07-2022', 'dd-mm-yyyy'), 'S?£o Paulo Avenida Berrini 660', 208.84, 417, 336348974, 873682714, 301);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (12.05, to_date('23-10-2022', 'dd-mm-yyyy'), 'Jakarta Jalan Sudirman Kav 52-', 264.5, 418, 282610851, 205825700, 262);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (17.2, to_date('22-08-2022', 'dd-mm-yyyy'), 'New York City 1 Wall Street', 59.97, 419, 700069359, 104937452, 191);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (18.55, to_date('07-09-2021', 'dd-mm-yyyy'), 'Phoenix 2400 Biltmore Fashion ', 35.72, 420, 254414972, 849129256, 286);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (2.61, to_date('07-10-2021', 'dd-mm-yyyy'), 'Barcelona Avinguda Diagonal 40', 272.66, 421, 847656702, 160302987, 434);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (12, to_date('05-08-2024', 'dd-mm-yyyy'), 'San Francisco 1650 Hanover Str', 279.41, 422, 925132120, 141837640, 425);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (19.79, to_date('17-09-2021', 'dd-mm-yyyy'), 'Orlando 8282 International Dri', 48.47, 423, 660886697, 728518500, 377);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (4.68, to_date('09-09-2024', 'dd-mm-yyyy'), 'Seattle 520 Westlake Avenue So', 136.05, 424, 835284851, 605591541, 425);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (4.44, to_date('06-04-2020', 'dd-mm-yyyy'), 'Montreal 9100 Boulevard de l A', 19.64, 425, 631847604, 815956026, 364);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (13.78, to_date('06-04-2020', 'dd-mm-yyyy'), 'Philadelphia 1500 Market Stree', 231.44, 426, 466025294, 544043768, 380);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (2.33, to_date('10-08-2023', 'dd-mm-yyyy'), 'Phoenix 2400 Biltmore Fashion ', 27.25, 427, 837311276, 975459822, 95);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (9.71, to_date('24-10-2024', 'dd-mm-yyyy'), 'Vienna Schottenring 16 Vienna ', 70.54, 428, 295318534, 451092501, 411);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (10.85, to_date('21-06-2024', 'dd-mm-yyyy'), 'Tokyo 3-14-1 Nishi-Shinjuku Sh', 313.99, 429, 412832580, 656950868, 294);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (23.32, to_date('30-11-2020', 'dd-mm-yyyy'), 'Brussels Rue de la Loi 175 Eur', 109.09, 430, 271828792, 373631073, 415);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (16.29, to_date('30-11-2020', 'dd-mm-yyyy'), 'Paris 11 Cour D?fense Seine Pu', 16.46, 431, 226625742, 104937452, 83);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (4.49, to_date('26-07-2023', 'dd-mm-yyyy'), 'Jakarta Jalan Sudirman Kav 52-', 14.91, 432, 639106141, 607570811, 324);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (9.35, to_date('22-06-2022', 'dd-mm-yyyy'), 'London 8 Canada Square', 278.22, 433, 552548536, 241957656, 228);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (1.67, to_date('21-05-2022', 'dd-mm-yyyy'), 'Miami 1001 Brickell Ave', 19.33, 434, 870513504, 392223508, 491);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (22.39, to_date('12-03-2024', 'dd-mm-yyyy'), 'Atlanta 3333 Peachtree Road NE', 62.39, 435, 617937771, 829092435, 491);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (3.59, to_date('12-03-2024', 'dd-mm-yyyy'), 'Chicago 200 South Wacker Drive', 50.65, 436, 962827621, 769542199, 247);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (22.27, to_date('09-04-2021', 'dd-mm-yyyy'), 'Houston 3 Greenway Plaza', 152.05, 437, 511271917, 911045673, 143);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (10.51, to_date('04-07-2021', 'dd-mm-yyyy'), 'Orlando 8282 International Dri', 337.29, 438, 758646772, 275393212, 121);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (7.58, to_date('15-02-2023', 'dd-mm-yyyy'), 'Amsterdam Strawinskylaan 3011', 72.55, 439, 914334290, 940410755, 375);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (10.78, to_date('26-09-2023', 'dd-mm-yyyy'), 'Buenos Aires Juana Manso 1670 ', 57.59, 440, 936984007, 148778614, 210);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (10.47, to_date('26-10-2023', 'dd-mm-yyyy'), 'Brussels Rue de la Loi 175 Eur', 48.9, 441, 188014768, 982228959, 320);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (11.71, to_date('12-03-2024', 'dd-mm-yyyy'), 'Denver 1775 Sherman Street Den', 63.62, 442, 953151798, 357964464, 16);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (21.72, to_date('27-07-2023', 'dd-mm-yyyy'), 'Singapore 1 Marina Boulevard', 66, 443, 931203266, 331610494, 291);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (12.56, to_date('24-06-2024', 'dd-mm-yyyy'), 'Calgary 250 Eau Claire Avenue ', 200.53, 444, 847656702, 375154552, 260);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (.18, to_date('04-12-2021', 'dd-mm-yyyy'), 'Brussels Rue de la Loi 175 Eur', 462.12, 445, 928999987, 963758267, 134);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (14.37, to_date('04-02-2022', 'dd-mm-yyyy'), 'Vienna Schottenring 16 Vienna ', 405.51, 446, 882145843, 822240474, 9);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (16.2, to_date('07-05-2022', 'dd-mm-yyyy'), 'New York City 1 Wall Street', 591.65, 447, 662847896, 811445548, 334);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.04, to_date('16-07-2022', 'dd-mm-yyyy'), 'Dublin Barrow Street Silicon D', 17.9, 448, 835284851, 562010577, 487);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (5.69, to_date('19-04-2021', 'dd-mm-yyyy'), 'Dallas 2001 McKinney Ave Uptow', 566.87, 449, 792537826, 492752692, 187);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (20.7, to_date('21-08-2021', 'dd-mm-yyyy'), 'Miami 1001 Brickell Ave', 283.81, 450, 562010577, 846419707, 381);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (20.03, to_date('21-09-2021', 'dd-mm-yyyy'), 'Brussels Rue de la Loi 175 Eur', 536.18, 451, 282610851, 205825700, 112);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (21.6, to_date('22-10-2022', 'dd-mm-yyyy'), 'London 8 Canada Square', 279.02, 452, 457655167, 490765532, 438);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (22.87, to_date('22-05-2022', 'dd-mm-yyyy'), 'Dublin Barrow Street Silicon D', 254.22, 453, 565571169, 375506538, 360);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (20.11, to_date('07-06-2020', 'dd-mm-yyyy'), 'Tokyo 3-14-1 Nishi-Shinjuku Sh', 107.92, 454, 915122110, 837026985, 353);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (19.45, to_date('22-11-2021', 'dd-mm-yyyy'), 'Seoul 50 Yeoksam-dong Gangnam-', 402.11, 455, 104937452, 383440042, 250);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (2.81, to_date('22-12-2021', 'dd-mm-yyyy'), 'Phoenix 2400 Biltmore Fashion ', 553.27, 456, 117293621, 786496745, 497);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (14.41, to_date('09-04-2022', 'dd-mm-yyyy'), 'Calgary 250 Eau Claire Avenue ', 364.03, 457, 206629316, 726029513, 418);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (22.85, to_date('27-05-2020', 'dd-mm-yyyy'), 'Orlando 8282 International Dri', 323.6, 458, 194835218, 378682852, 125);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (17, to_date('28-05-2021', 'dd-mm-yyyy'), 'Miami 1001 Brickell Ave', 369.28, 459, 955659426, 537375804, 142);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (3.67, to_date('20-12-2021', 'dd-mm-yyyy'), 'Prague Na Pankr??ci 178/180 Pa', 566.79, 460, 970138584, 495997339, 434);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (5.55, to_date('20-02-2022', 'dd-mm-yyyy'), 'Buenos Aires Juana Manso 1670 ', 374.12, 461, 810251423, 817616991, 473);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (10.68, to_date('20-07-2021', 'dd-mm-yyyy'), 'Dubai Sheikh Zayed Road Emirat', 385.36, 462, 851536797, 571442515, 472);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (7.71, to_date('28-07-2021', 'dd-mm-yyyy'), 'Prague Na Pankr??ci 178/180 Pa', 13.12, 463, 428261058, 866183544, 321);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (21.94, to_date('13-03-2020', 'dd-mm-yyyy'), 'Dubai Sheikh Zayed Road Emirat', 27.56, 464, 645800410, 861440050, 420);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (7.28, to_date('11-10-2024', 'dd-mm-yyyy'), 'Bangkok 990 Silom Road', 43.18, 465, 617803786, 836251609, 218);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (23.78, to_date('11-11-2024', 'dd-mm-yyyy'), 'Seoul 50 Yeoksam-dong Gangnam-', 40.62, 466, 402413501, 838534272, 28);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (.45, to_date('24-12-2023', 'dd-mm-yyyy'), 'Orlando 8282 International Dri', 13.09, 467, 182111971, 618692425, 406);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (8.65, to_date('28-06-2024', 'dd-mm-yyyy'), 'Montreal 9100 Boulevard de l A', 19.37, 468, 542004169, 148778614, 487);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (17.84, to_date('30-04-2023', 'dd-mm-yyyy'), 'San Diego 1110 Sorrento Valley', 285.5, 469, 172274041, 829092435, 462);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (9.5, to_date('05-08-2022', 'dd-mm-yyyy'), 'Tokyo 3-14-1 Nishi-Shinjuku Sh', 34.44, 470, 100171750, 189643742, 11);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (2.34, to_date('05-08-2022', 'dd-mm-yyyy'), 'Phoenix 2400 Biltmore Fashion ', 19.83, 471, 698519392, 576328517, 241);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (16.24, to_date('14-05-2024', 'dd-mm-yyyy'), 'Philadelphia 1500 Market Stree', 57.84, 472, 411702990, 481541006, 466);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (23.41, to_date('27-11-2022', 'dd-mm-yyyy'), 'Vancouver 1000 Mainland Street', 46.99, 473, 950034758, 607570811, 141);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (.08, to_date('18-01-2021', 'dd-mm-yyyy'), 'Miami 1001 Brickell Ave', 490.06, 474, 953151798, 851470156, 283);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (9.9, to_date('09-04-2023', 'dd-mm-yyyy'), 'Houston 3 Greenway Plaza', 25.15, 475, 490765532, 515674654, 445);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (13.78, to_date('09-04-2023', 'dd-mm-yyyy'), 'Washington D.C. 1775 K Street ', 34.15, 476, 867765371, 148778614, 130);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (20.8, to_date('04-12-2024', 'dd-mm-yyyy'), 'London 8 Canada Square', 133.5, 477, 254163307, 492316527, 87);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (16.85, to_date('02-11-2023', 'dd-mm-yyyy'), 'Tokyo 3-14-1 Nishi-Shinjuku Sh', 64.91, 478, 129186647, 152300229, 241);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (9.04, to_date('29-01-2021', 'dd-mm-yyyy'), 'Las Vegas 3645 Las Vegas Blvd ', 426.8, 479, 129186647, 467275290, 217);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (5.59, to_date('04-09-2023', 'dd-mm-yyyy'), 'San Diego 1110 Sorrento Valley', 54.79, 480, 241957656, 273396102, 343);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (19.15, to_date('04-09-2023', 'dd-mm-yyyy'), 'Mexico City Avenida Santa Fe 1', 201.41, 481, 616052079, 439643727, 474);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (16.36, to_date('20-05-2023', 'dd-mm-yyyy'), 'Vienna Schottenring 16 Vienna ', 42.02, 482, 451092501, 765927503, 184);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (15.66, to_date('05-05-2023', 'dd-mm-yyyy'), 'Bangkok 990 Silom Road', 22.46, 483, 454434252, 834466751, 400);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (15.56, to_date('08-08-2023', 'dd-mm-yyyy'), 'Sydney 1 Alfred Street Circula', 169.67, 484, 240883177, 317822031, 170);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (7.37, to_date('11-12-2020', 'dd-mm-yyyy'), 'Brussels Rue de la Loi 175 Eur', 589.39, 485, 698587684, 726029513, 472);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (7.59, to_date('11-12-2020', 'dd-mm-yyyy'), 'Denver 1775 Sherman Street Den', 40.44, 486, 616052079, 352072255, 400);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (2.68, to_date('09-02-2023', 'dd-mm-yyyy'), 'Dubai Sheikh Zayed Road Emirat', 249.85, 487, 542004169, 973326469, 369);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (9.7, to_date('23-09-2023', 'dd-mm-yyyy'), 'Paris 11 Cour D?fense Seine Pu', 12.97, 488, 911045673, 128003805, 10);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (.29, to_date('31-03-2024', 'dd-mm-yyyy'), 'Brussels Rue de la Loi 175 Eur', 38.68, 489, 709751915, 457984284, 286);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (19.82, to_date('02-11-2020', 'dd-mm-yyyy'), 'Jakarta Jalan Sudirman Kav 52-', 161.37, 490, 959338316, 144642188, 363);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (21.5, to_date('02-12-2020', 'dd-mm-yyyy'), 'Orlando 8282 International Dri', 41.86, 491, 336348974, 725240443, 500);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (12.12, to_date('08-10-2021', 'dd-mm-yyyy'), 'somewhere', 15.38, 600, 592163243, 194505717, 65);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (12.12, to_date('08-10-2021', 'dd-mm-yyyy'), 'somewhere', 15.38, 607, 592163243, 194505717, 65);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (7.58, to_date('15-11-2022', 'dd-mm-yyyy'), 'Tokyo 3-14-1 Nishi-Shinjuku Sh', 182.89, 590, 931203266, 542004169, 350);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (16.99, to_date('16-10-2022', 'dd-mm-yyyy'), 'Dubai Sheikh Zayed Road Emirat', 451.26, 591, 123599375, 181050162, 17);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (7.22, to_date('16-12-2022', 'dd-mm-yyyy'), 'Houston 3 Greenway Plaza', 39.89, 592, 822240474, 922428251, 322);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (17.17, to_date('21-08-2022', 'dd-mm-yyyy'), 'Miami 1001 Brickell Ave', 199.49, 593, 334399647, 967021982, 22);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (1.81, to_date('23-09-2023', 'dd-mm-yyyy'), 'Istanbul B?¼y?¼kdere Cadde No:', 68.09, 594, 559165794, 963758267, 102);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (2.5, to_date('19-08-2023', 'dd-mm-yyyy'), 'Dublin Barrow Street Silicon D', 15.64, 595, 325527961, 403050636, 27);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (20.9, to_date('03-05-2020', 'dd-mm-yyyy'), 'Seattle 520 Westlake Avenue So', 557.85, 596, 271828792, 117293621, 103);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (13.29, to_date('03-07-2020', 'dd-mm-yyyy'), 'Los Angeles 10233 Constellatio', 455.81, 597, 453477723, 677684763, 471);
commit;
prompt 500 records committed...
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (18.79, to_date('12-09-2021', 'dd-mm-yyyy'), 'Boston 50 Seaport Boulevard', 58.66, 598, 325527961, 826589049, 136);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (23.95, to_date('09-04-2020', 'dd-mm-yyyy'), 'Amsterdam Strawinskylaan 3011', 586.64, 599, 146924485, 934662057, 175);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (19.36, to_date('27-12-2024', 'dd-mm-yyyy'), 'Istanbul B?³?¼y?³?¼kdere Cadde', 144.97, 700, 923597583, 867765371, 381);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (17.99, to_date('26-12-2024', 'dd-mm-yyyy'), 'Singapore 1 Marina Boulevard', 64.96, 701, 137211133, 775393164, 301);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (.6, to_date('26-01-2025', 'dd-mm-yyyy'), 'Seattle 520 Westlake Avenue So', 54.58, 702, 754755023, 505169218, 292);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (2.88, to_date('12-10-2024', 'dd-mm-yyyy'), 'Vancouver 1000 Mainland Street', 139.8, 704, 481541006, 517199517, 297);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (17.44, to_date('20-12-2024', 'dd-mm-yyyy'), 'park leumi ramat gan', 238.82, 710, 253406712, 554526290, 47);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (15.36, to_date('12-12-2024', 'dd-mm-yyyy'), 'park leumi ramat gan', 120.82, 711, 573698524, 775393164, 6);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (4.65, to_date('08-12-2024', 'dd-mm-yyyy'), 'park leumi ramat gan', 105.26, 712, 253406712, 554526290, 500);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (11.09, to_date('15-12-2024', 'dd-mm-yyyy'), '"pool of bne-brak"', 173.3, 713, 573698524, 554526290, 85);
insert into ACTUAL_TRAINING (training_hour, training_date, training_location, training_cost, actual_training_code, person_id1, person_id2, training_code)
values (12.7, to_date('27-12-2024', 'dd-mm-yyyy'), '"pool of bne-brak"', 212.2, 714, 980200311, 775393164, 125);
commit;
prompt 511 records loaded
prompt Loading ITEM...
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (129, ' ''Rope'' ', ' ''Strength Training'' ', null, 28.9);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (130, ' ''Pull-up Bar'' ', ' ''Climbing'' ', 13.8, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (131, ' ''Jump Rope'' ', ' ''Cardio'' ', 16.8, 15.2);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (132, ' ''Resistance Band'' ', ' ''Flexibility Training'' ', 16.9, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (133, ' ''Rope'' ', ' ''Climbing'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (134, ' ''Weightlift'' ', ' ''Climbing'' ', 17.1, 47.5);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (135, ' ''Pull-up Bar'' ', ' ''Flexibility Training'' ', 12.7, 23.6);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (136, ' ''Exercise Ball'' ', ' ''Climbing'' ', 11, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (137, ' ''Yoga Mat'' ', ' ''Cardio'' ', 10.6, 24.9);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (138, ' ''Jump Rope'' ', ' ''Strength Training'' ', 6.5, 32.5);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (139, ' ''Medicine Ball'' ', ' ''Cardio'' ', null, 41.6);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (140, ' ''Dumbbell'' ', ' ''Flexibility Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (141, ' ''Weightlift'' ', ' ''General Fitness'' ', 2.4, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (142, ' ''Medicine Ball'' ', ' ''Cardio'' ', 3, 8.4);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (143, ' ''Pull-up Bar'' ', ' ''Climbing'' ', null, 4.5);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (144, ' ''Dumbbell'' ', ' ''Climbing'' ', null, 14.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (145, ' ''Yoga Mat'' ', ' ''General Fitness'' ', null, 45.3);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (146, ' ''Medicine Ball'' ', ' ''Flexibility Training'' ', 1.4, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (147, ' ''Weightlift'' ', ' ''Strength Training'' ', 10.4, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (148, ' ''Dumbbell'' ', ' ''Flexibility Training'' ', 18.7, 34.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (149, ' ''Exercise Ball'' ', ' ''Strength Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (150, ' ''Pull-up Bar'' ', ' ''Climbing'' ', 6, 48.5);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (151, ' ''Resistance Band'' ', ' ''Strength Training'' ', null, 24.3);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (152, ' ''Kettlebell'' ', ' ''Climbing'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (153, ' ''Exercise Ball'' ', ' ''Flexibility Training'' ', null, 17.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (154, ' ''Jump Rope'' ', ' ''Strength Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (155, ' ''Dumbbell'' ', ' ''General Fitness'' ', null, 36.1);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (156, ' ''Rope'' ', ' ''General Fitness'' ', 10.4, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (157, ' ''Medicine Ball'' ', ' ''Flexibility Training'' ', 3.4, 22.3);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (158, ' ''Jump Rope'' ', ' ''Flexibility Training'' ', null, 17.8);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (159, ' ''Rope'' ', ' ''Flexibility Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (160, ' ''Exercise Ball'' ', ' ''Climbing'' ', 17.4, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (161, ' ''Dumbbell'' ', ' ''Flexibility Training'' ', 5.6, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (162, ' ''Dumbbell'' ', ' ''Flexibility Training'' ', null, 22.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (163, ' ''Weightlift'' ', ' ''Flexibility Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (164, ' ''Jump Rope'' ', ' ''Strength Training'' ', 8.4, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (165, ' ''Yoga Mat'' ', ' ''Strength Training'' ', 16.8, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (166, ' ''Pull-up Bar'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (167, ' ''Weightlift'' ', ' ''Flexibility Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (168, ' ''Kettlebell'' ', ' ''Climbing'' ', 6.1, 32.5);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (169, ' ''Yoga Mat'' ', ' ''Strength Training'' ', null, 34.5);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (170, ' ''Yoga Mat'' ', ' ''Cardio'' ', 14.3, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (171, ' ''Pull-up Bar'' ', ' ''Climbing'' ', 5.7, 1.1);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (172, ' ''Jump Rope'' ', ' ''Strength Training'' ', 17.6, 3.8);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (173, ' ''Rope'' ', ' ''Climbing'' ', 16.2, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (174, ' ''Weightlift'' ', ' ''Strength Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (175, ' ''Yoga Mat'' ', ' ''General Fitness'' ', 10.1, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (176, ' ''Kettlebell'' ', ' ''Flexibility Training'' ', null, 3.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (177, ' ''Rope'' ', ' ''Flexibility Training'' ', 16.5, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (178, ' ''Medicine Ball'' ', ' ''Flexibility Training'' ', 15.3, 2.5);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (179, ' ''Exercise Ball'' ', ' ''Cardio'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (180, ' ''Kettlebell'' ', ' ''Climbing'' ', 6.9, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (181, ' ''Weightlift'' ', ' ''Flexibility Training'' ', null, 9);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (182, ' ''Dumbbell'' ', ' ''Cardio'' ', 17, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (183, ' ''Resistance Band'' ', ' ''Climbing'' ', null, 32.8);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (184, ' ''Weightlift'' ', ' ''Strength Training'' ', 16.4, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (185, ' ''Dumbbell'' ', ' ''Strength Training'' ', 4.1, 41.6);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (186, ' ''Pull-up Bar'' ', ' ''Climbing'' ', null, 3.2);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (187, ' ''Kettlebell'' ', ' ''Strength Training'' ', null, 24.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (188, ' ''Dumbbell'' ', ' ''Climbing'' ', null, 7.5);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (189, ' ''Dumbbell'' ', ' ''Flexibility Training'' ', 17.7, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (190, ' ''Kettlebell'' ', ' ''Cardio'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (191, ' ''Rope'' ', ' ''Strength Training'' ', null, 19.5);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (192, ' ''Yoga Mat'' ', ' ''General Fitness'' ', null, 32.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (193, ' ''Yoga Mat'' ', ' ''Cardio'' ', 13.1, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (194, ' ''Weightlift'' ', ' ''Cardio'' ', 7.8, 14.4);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (195, ' ''Medicine Ball'' ', ' ''Strength Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (196, ' ''Weightlift'' ', ' ''Cardio'' ', 15.3, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (197, ' ''Weightlift'' ', ' ''Flexibility Training'' ', 3.5, 20.8);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (198, ' ''Medicine Ball'' ', ' ''General Fitness'' ', null, 10.1);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (199, ' ''Medicine Ball'' ', ' ''Climbing'' ', 6.3, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (200, ' ''Jump Rope'' ', ' ''Cardio'' ', 14.3, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (201, ' ''Weightlift'' ', ' ''Climbing'' ', 4.9, 31.5);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (202, ' ''Resistance Band'' ', ' ''Flexibility Training'' ', null, 32.1);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (203, ' ''Kettlebell'' ', ' ''Flexibility Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (204, ' ''Kettlebell'' ', ' ''Flexibility Training'' ', 16, 21.3);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (205, ' ''Medicine Ball'' ', ' ''Climbing'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (206, ' ''Resistance Band'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (207, ' ''Pull-up Bar'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (208, ' ''Rope'' ', ' ''Cardio'' ', 7.7, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (209, ' ''Kettlebell'' ', ' ''Climbing'' ', 19.1, 13.9);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (210, ' ''Medicine Ball'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (211, ' ''Pull-up Bar'' ', ' ''Flexibility Training'' ', 10.8, 18.2);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (212, ' ''Jump Rope'' ', ' ''General Fitness'' ', 16.6, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (213, ' ''Dumbbell'' ', ' ''Strength Training'' ', 14.2, 15.9);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (214, ' ''Exercise Ball'' ', ' ''Climbing'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (215, ' ''Yoga Mat'' ', ' ''Strength Training'' ', null, 44.2);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (216, ' ''Medicine Ball'' ', ' ''Climbing'' ', 10.2, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (217, ' ''Dumbbell'' ', ' ''Flexibility Training'' ', null, 42.6);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (218, ' ''Pull-up Bar'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (219, ' ''Pull-up Bar'' ', ' ''Climbing'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (220, ' ''Jump Rope'' ', ' ''Strength Training'' ', 17.3, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (221, ' ''Resistance Band'' ', ' ''Cardio'' ', 16.1, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (222, ' ''Jump Rope'' ', ' ''Strength Training'' ', 8.5, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (223, ' ''Jump Rope'' ', ' ''Flexibility Training'' ', 10.7, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (224, ' ''Exercise Ball'' ', ' ''Flexibility Training'' ', 6.1, 33);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (225, ' ''Yoga Mat'' ', ' ''Cardio'' ', 1.9, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (226, ' ''Medicine Ball'' ', ' ''Cardio'' ', null, 17.6);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (227, ' ''Weightlift'' ', ' ''Climbing'' ', 18.3, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (228, ' ''Dumbbell'' ', ' ''Strength Training'' ', 6.1, null);
commit;
prompt 100 records committed...
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (229, ' ''Jump Rope'' ', ' ''General Fitness'' ', null, 45.5);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (230, ' ''Kettlebell'' ', ' ''Cardio'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (231, ' ''Jump Rope'' ', ' ''Flexibility Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (232, ' ''Yoga Mat'' ', ' ''Climbing'' ', 18.8, 8.9);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (233, ' ''Exercise Ball'' ', ' ''Cardio'' ', 15.8, 20.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (234, ' ''Rope'' ', ' ''Flexibility Training'' ', 7.7, 46);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (235, ' ''Dumbbell'' ', ' ''General Fitness'' ', 1.4, 37.5);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (236, ' ''Resistance Band'' ', ' ''Strength Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (237, ' ''Yoga Mat'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (238, ' ''Resistance Band'' ', ' ''Cardio'' ', 7.3, 21.8);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (239, ' ''Exercise Ball'' ', ' ''Flexibility Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (240, ' ''Medicine Ball'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (241, ' ''Pull-up Bar'' ', ' ''Climbing'' ', 13.5, 47.2);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (242, ' ''Kettlebell'' ', ' ''Strength Training'' ', null, 11.2);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (243, ' ''Dumbbell'' ', ' ''Climbing'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (244, ' ''Weightlift'' ', ' ''Flexibility Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (245, ' ''Pull-up Bar'' ', ' ''Flexibility Training'' ', 9.1, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (246, ' ''Resistance Band'' ', ' ''Climbing'' ', null, 3);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (247, ' ''Resistance Band'' ', ' ''General Fitness'' ', null, 4.4);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (248, ' ''Kettlebell'' ', ' ''Strength Training'' ', 13.4, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (249, ' ''Medicine Ball'' ', ' ''Flexibility Training'' ', 9.4, 42.5);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (250, ' ''Jump Rope'' ', ' ''Flexibility Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (251, ' ''Jump Rope'' ', ' ''Cardio'' ', 3.6, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (252, ' ''Pull-up Bar'' ', ' ''Strength Training'' ', 12.4, 2.8);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (253, ' ''Jump Rope'' ', ' ''Climbing'' ', 13, 18.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (254, ' ''Medicine Ball'' ', ' ''Strength Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (255, ' ''Resistance Band'' ', ' ''General Fitness'' ', 9.3, 23.6);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (256, ' ''Kettlebell'' ', ' ''Cardio'' ', 11.3, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (257, ' ''Weightlift'' ', ' ''Strength Training'' ', 12.5, 50);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (258, ' ''Jump Rope'' ', ' ''Climbing'' ', 10.8, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (259, ' ''Resistance Band'' ', ' ''Flexibility Training'' ', 18.3, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (260, ' ''Resistance Band'' ', ' ''Flexibility Training'' ', 10.4, 6.9);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (261, ' ''Jump Rope'' ', ' ''Strength Training'' ', null, 34.6);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (262, ' ''Pull-up Bar'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (263, ' ''Dumbbell'' ', ' ''Flexibility Training'' ', 9, 11.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (264, ' ''Rope'' ', ' ''Climbing'' ', 15.8, 7.3);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (265, ' ''Exercise Ball'' ', ' ''Strength Training'' ', null, 29.9);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (266, ' ''Jump Rope'' ', ' ''Cardio'' ', 10, 38);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (267, ' ''Kettlebell'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (268, ' ''Pull-up Bar'' ', ' ''Flexibility Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (269, ' ''Kettlebell'' ', ' ''Flexibility Training'' ', null, 10.4);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (270, ' ''Kettlebell'' ', ' ''Flexibility Training'' ', 9.1, 2.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (271, ' ''Pull-up Bar'' ', ' ''General Fitness'' ', 16.3, 3.8);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (272, ' ''Pull-up Bar'' ', ' ''Climbing'' ', null, 3.3);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (273, ' ''Yoga Mat'' ', ' ''Strength Training'' ', null, 7.1);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (274, ' ''Kettlebell'' ', ' ''Flexibility Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (275, ' ''Exercise Ball'' ', ' ''Climbing'' ', null, 49.9);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (276, ' ''Kettlebell'' ', ' ''Flexibility Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (277, ' ''Weightlift'' ', ' ''Strength Training'' ', 4.5, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (278, ' ''Pull-up Bar'' ', ' ''Flexibility Training'' ', 8.7, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (279, ' ''Medicine Ball'' ', ' ''Cardio'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (280, ' ''Dumbbell'' ', ' ''Strength Training'' ', null, 8.8);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (281, ' ''Medicine Ball'' ', ' ''General Fitness'' ', null, 13.3);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (282, ' ''Exercise Ball'' ', ' ''Strength Training'' ', null, 35.6);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (283, ' ''Medicine Ball'' ', ' ''Cardio'' ', 10.9, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (284, ' ''Resistance Band'' ', ' ''Climbing'' ', null, 47);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (285, ' ''Jump Rope'' ', ' ''Flexibility Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (286, ' ''Exercise Ball'' ', ' ''Flexibility Training'' ', 16.2, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (287, ' ''Dumbbell'' ', ' ''Cardio'' ', 11.7, 31.5);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (288, ' ''Yoga Mat'' ', ' ''Flexibility Training'' ', 6.1, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (289, ' ''Jump Rope'' ', ' ''Flexibility Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (290, ' ''Yoga Mat'' ', ' ''Climbing'' ', 15.6, 42.4);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (291, ' ''Resistance Band'' ', ' ''Climbing'' ', 15.7, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (292, ' ''Dumbbell'' ', ' ''Strength Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (293, ' ''Medicine Ball'' ', ' ''Flexibility Training'' ', null, 49.3);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (294, ' ''Pull-up Bar'' ', ' ''Climbing'' ', 14.1, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (295, ' ''Rope'' ', ' ''Cardio'' ', null, 42.9);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (296, ' ''Exercise Ball'' ', ' ''Strength Training'' ', 19.4, 43.2);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (297, ' ''Rope'' ', ' ''Climbing'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (298, ' ''Resistance Band'' ', ' ''General Fitness'' ', null, 2.4);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (299, ' ''Pull-up Bar'' ', ' ''Flexibility Training'' ', 8.5, 49.9);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (300, ' ''Yoga Mat'' ', ' ''Strength Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (301, ' ''Jump Rope'' ', ' ''Climbing'' ', 13.3, 32.3);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (302, ' ''Exercise Ball'' ', ' ''Strength Training'' ', 3.4, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (303, ' ''Resistance Band'' ', ' ''Cardio'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (304, ' ''Rope'' ', ' ''Cardio'' ', 9.3, 40.2);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (305, ' ''Exercise Ball'' ', ' ''Cardio'' ', null, 4);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (306, ' ''Rope'' ', ' ''Cardio'' ', 15.7, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (307, ' ''Weightlift'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (308, ' ''Dumbbell'' ', ' ''General Fitness'' ', null, 21.6);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (309, ' ''Resistance Band'' ', ' ''Cardio'' ', null, 5.6);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (310, ' ''Exercise Ball'' ', ' ''Strength Training'' ', 18.9, 48.5);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (311, ' ''Dumbbell'' ', ' ''Cardio'' ', 6.6, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (312, ' ''Resistance Band'' ', ' ''Cardio'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (360, ' ''Rope'' ', ' ''Cardio'' ', 5.9, 43.9);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (361, ' ''Medicine Ball'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (362, ' ''Dumbbell'' ', ' ''Flexibility Training'' ', 6.4, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (363, ' ''Yoga Mat'' ', ' ''Cardio'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (364, ' ''Yoga Mat'' ', ' ''Climbing'' ', 9.5, 8.4);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (365, ' ''Resistance Band'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (366, ' ''Medicine Ball'' ', ' ''Climbing'' ', 12.6, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (367, ' ''Kettlebell'' ', ' ''General Fitness'' ', null, 24.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (368, ' ''Yoga Mat'' ', ' ''Flexibility Training'' ', 3.8, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (369, ' ''Medicine Ball'' ', ' ''Cardio'' ', 6.2, 35);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (370, ' ''Medicine Ball'' ', ' ''Cardio'' ', null, 25);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (371, ' ''Exercise Ball'' ', ' ''Flexibility Training'' ', 6.4, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (372, ' ''Jump Rope'' ', ' ''General Fitness'' ', 6.9, 30.9);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (373, ' ''Yoga Mat'' ', ' ''General Fitness'' ', 2.5, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (374, ' ''Kettlebell'' ', ' ''Climbing'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (375, ' ''Yoga Mat'' ', ' ''Cardio'' ', null, null);
commit;
prompt 200 records committed...
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (376, ' ''Pull-up Bar'' ', ' ''Climbing'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (377, ' ''Kettlebell'' ', ' ''Strength Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (378, ' ''Weightlift'' ', ' ''Cardio'' ', null, 47.3);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (379, ' ''Exercise Ball'' ', ' ''Climbing'' ', null, 45.2);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (380, ' ''Resistance Band'' ', ' ''Strength Training'' ', null, 37.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (381, ' ''Kettlebell'' ', ' ''Flexibility Training'' ', 19.2, 23.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (382, ' ''Yoga Mat'' ', ' ''Cardio'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (383, ' ''Yoga Mat'' ', ' ''Flexibility Training'' ', null, 2.4);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (384, ' ''Kettlebell'' ', ' ''Strength Training'' ', 4.9, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (385, ' ''Pull-up Bar'' ', ' ''Climbing'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (386, ' ''Dumbbell'' ', ' ''General Fitness'' ', null, 39);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (313, ' ''Weightlift'' ', ' ''Strength Training'' ', 2.5, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (314, ' ''Resistance Band'' ', ' ''Cardio'' ', 10.4, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (315, ' ''Medicine Ball'' ', ' ''Climbing'' ', 12.9, 23);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (316, ' ''Yoga Mat'' ', ' ''Cardio'' ', 13.1, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (317, ' ''Resistance Band'' ', ' ''Strength Training'' ', null, 47.4);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (318, ' ''Kettlebell'' ', ' ''Climbing'' ', null, 27.2);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (319, ' ''Rope'' ', ' ''Flexibility Training'' ', 15.6, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (320, ' ''Medicine Ball'' ', ' ''Flexibility Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (321, ' ''Exercise Ball'' ', ' ''Flexibility Training'' ', 3.6, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (322, ' ''Dumbbell'' ', ' ''Climbing'' ', 1.2, 26.1);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (323, ' ''Yoga Mat'' ', ' ''Strength Training'' ', 18.5, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (324, ' ''Kettlebell'' ', ' ''Climbing'' ', null, 17.8);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (325, ' ''Dumbbell'' ', ' ''Climbing'' ', 13.2, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (326, ' ''Rope'' ', ' ''Cardio'' ', null, 36.6);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (327, ' ''Rope'' ', ' ''Strength Training'' ', 10.8, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (328, ' ''Medicine Ball'' ', ' ''Climbing'' ', 2.4, 21.5);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (329, ' ''Dumbbell'' ', ' ''Flexibility Training'' ', null, 25.4);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (330, ' ''Kettlebell'' ', ' ''Strength Training'' ', 6.4, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (331, ' ''Kettlebell'' ', ' ''Strength Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (332, ' ''Resistance Band'' ', ' ''Cardio'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (333, ' ''Kettlebell'' ', ' ''Climbing'' ', null, 17.4);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (334, ' ''Weightlift'' ', ' ''Climbing'' ', 18.1, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (335, ' ''Pull-up Bar'' ', ' ''Cardio'' ', 13.3, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (336, ' ''Resistance Band'' ', ' ''Climbing'' ', null, 14.9);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (337, ' ''Yoga Mat'' ', ' ''Climbing'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (338, ' ''Medicine Ball'' ', ' ''General Fitness'' ', null, 9.4);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (339, ' ''Yoga Mat'' ', ' ''Flexibility Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (340, ' ''Resistance Band'' ', ' ''Climbing'' ', 16.7, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (341, ' ''Yoga Mat'' ', ' ''Strength Training'' ', null, 35.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (342, ' ''Yoga Mat'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (343, ' ''Exercise Ball'' ', ' ''General Fitness'' ', null, 47.6);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (344, ' ''Exercise Ball'' ', ' ''Climbing'' ', null, 11.1);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (345, ' ''Kettlebell'' ', ' ''General Fitness'' ', null, 49);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (346, ' ''Exercise Ball'' ', ' ''Flexibility Training'' ', 4.7, 18.9);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (347, ' ''Medicine Ball'' ', ' ''Flexibility Training'' ', null, 42.3);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (348, ' ''Dumbbell'' ', ' ''Cardio'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (349, ' ''Weightlift'' ', ' ''Cardio'' ', null, 20.4);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (350, ' ''Yoga Mat'' ', ' ''Climbing'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (351, ' ''Yoga Mat'' ', ' ''Cardio'' ', 5.6, 13);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (352, ' ''Weightlift'' ', ' ''Strength Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (353, ' ''Resistance Band'' ', ' ''Cardio'' ', null, 25.1);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (354, ' ''Kettlebell'' ', ' ''Cardio'' ', 13, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (355, ' ''Jump Rope'' ', ' ''Strength Training'' ', null, 29.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (356, ' ''Pull-up Bar'' ', ' ''General Fitness'' ', 15.1, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (357, ' ''Yoga Mat'' ', ' ''Strength Training'' ', 1, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (358, ' ''Jump Rope'' ', ' ''General Fitness'' ', 2, 22.4);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (359, ' ''Kettlebell'' ', ' ''Cardio'' ', null, 12.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (387, ' ''Medicine Ball'' ', ' ''Flexibility Training'' ', 2.6, 2.3);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (388, ' ''Pull-up Bar'' ', ' ''Climbing'' ', null, 18.2);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (389, ' ''Weightlift'' ', ' ''Cardio'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (390, ' ''Kettlebell'' ', ' ''Climbing'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (391, ' ''Weightlift'' ', ' ''Cardio'' ', 11, 31.3);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (392, ' ''Yoga Mat'' ', ' ''Strength Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (393, ' ''Weightlift'' ', ' ''Flexibility Training'' ', null, 23.4);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (394, ' ''Kettlebell'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (395, ' ''Kettlebell'' ', ' ''Strength Training'' ', 13.4, 14.5);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (396, ' ''Kettlebell'' ', ' ''Flexibility Training'' ', 6.5, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (397, ' ''Kettlebell'' ', ' ''General Fitness'' ', null, 30.4);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (398, ' ''Exercise Ball'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (399, ' ''Weightlift'' ', ' ''Climbing'' ', 14.5, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (400, ' ''Yoga Mat'' ', ' ''General Fitness'' ', 16.9, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (401, ' ''Exercise Ball'' ', ' ''Strength Training'' ', 10.3, 13);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (402, ' ''Rope'' ', ' ''Cardio'' ', 4, 41.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (403, ' ''Medicine Ball'' ', ' ''Cardio'' ', 17.1, 47.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (404, ' ''Medicine Ball'' ', ' ''Flexibility Training'' ', 9, 14.9);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (405, ' ''Kettlebell'' ', ' ''Cardio'' ', null, 11.9);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (406, ' ''Resistance Band'' ', ' ''Cardio'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (407, ' ''Weightlift'' ', ' ''General Fitness'' ', 4.3, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (408, ' ''Exercise Ball'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (409, ' ''Exercise Ball'' ', ' ''Strength Training'' ', 19.3, 23.9);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (410, ' ''Jump Rope'' ', ' ''Cardio'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (411, ' ''Dumbbell'' ', ' ''Cardio'' ', 2, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (412, ' ''Medicine Ball'' ', ' ''General Fitness'' ', null, 39.4);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (413, ' ''Resistance Band'' ', ' ''Flexibility Training'' ', 2.4, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (414, ' ''Exercise Ball'' ', ' ''Strength Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (415, ' ''Kettlebell'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (416, ' ''Dumbbell'' ', ' ''Climbing'' ', 16.1, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (417, ' ''Dumbbell'' ', ' ''Cardio'' ', 17.2, 38.5);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (418, ' ''Yoga Mat'' ', ' ''Strength Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (419, ' ''Medicine Ball'' ', ' ''Climbing'' ', 19.2, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (420, ' ''Medicine Ball'' ', ' ''Flexibility Training'' ', null, 39.1);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (421, ' ''Pull-up Bar'' ', ' ''Cardio'' ', 20, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (422, ' ''Medicine Ball'' ', ' ''General Fitness'' ', null, 1.1);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (423, ' ''Exercise Ball'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (424, ' ''Kettlebell'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (425, ' ''Jump Rope'' ', ' ''Climbing'' ', 1.6, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (426, ' ''Resistance Band'' ', ' ''Flexibility Training'' ', null, 17.2);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (427, ' ''Kettlebell'' ', ' ''Strength Training'' ', null, 21.8);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (428, ' ''Weightlift'' ', ' ''Cardio'' ', null, 40.7);
commit;
prompt 300 records committed...
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (429, ' ''Weightlift'' ', ' ''Strength Training'' ', 6.5, 13.6);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (430, ' ''Jump Rope'' ', ' ''Climbing'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (431, ' ''Rope'' ', ' ''Cardio'' ', null, 18.6);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (432, ' ''Kettlebell'' ', ' ''Cardio'' ', null, 41.8);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (433, ' ''Pull-up Bar'' ', ' ''Flexibility Training'' ', 6.6, 33.3);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (434, ' ''Dumbbell'' ', ' ''General Fitness'' ', 14.7, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (435, ' ''Rope'' ', ' ''General Fitness'' ', null, 22.2);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (436, ' ''Kettlebell'' ', ' ''Cardio'' ', 4.6, 38.1);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (437, ' ''Kettlebell'' ', ' ''General Fitness'' ', 2.3, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (438, ' ''Exercise Ball'' ', ' ''Cardio'' ', null, 44.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (439, ' ''Exercise Ball'' ', ' ''Climbing'' ', 13.2, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (440, ' ''Kettlebell'' ', ' ''Cardio'' ', 8.1, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (441, ' ''Exercise Ball'' ', ' ''Cardio'' ', 12.8, 16.9);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (442, ' ''Kettlebell'' ', ' ''Cardio'' ', null, 14.3);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (443, ' ''Yoga Mat'' ', ' ''Strength Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (444, ' ''Dumbbell'' ', ' ''General Fitness'' ', 1.1, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (445, ' ''Dumbbell'' ', ' ''Strength Training'' ', null, 6.6);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (446, ' ''Resistance Band'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (447, ' ''Weightlift'' ', ' ''Strength Training'' ', null, 9.6);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (448, ' ''Rope'' ', ' ''General Fitness'' ', 4.2, 27.4);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (449, ' ''Rope'' ', ' ''General Fitness'' ', null, 48.5);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (450, ' ''Pull-up Bar'' ', ' ''General Fitness'' ', 14.4, 9.6);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (451, ' ''Pull-up Bar'' ', ' ''General Fitness'' ', 18.5, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (452, ' ''Resistance Band'' ', ' ''Cardio'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (453, ' ''Medicine Ball'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (454, ' ''Medicine Ball'' ', ' ''Cardio'' ', 11.3, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (455, ' ''Pull-up Bar'' ', ' ''Cardio'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (456, ' ''Rope'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (457, ' ''Rope'' ', ' ''Flexibility Training'' ', 4, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (458, ' ''Medicine Ball'' ', ' ''Climbing'' ', null, 42);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (459, ' ''Rope'' ', ' ''Cardio'' ', 6.8, 17.4);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (460, ' ''Pull-up Bar'' ', ' ''Flexibility Training'' ', 2.2, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (461, ' ''Dumbbell'' ', ' ''Cardio'' ', null, 14.5);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (462, ' ''Pull-up Bar'' ', ' ''Strength Training'' ', 11.3, 43.8);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (463, ' ''Resistance Band'' ', ' ''Climbing'' ', null, 25.6);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (464, ' ''Weightlift'' ', ' ''Climbing'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (465, ' ''Jump Rope'' ', ' ''Strength Training'' ', 7.6, 40.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (466, ' ''Rope'' ', ' ''Cardio'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (467, ' ''Rope'' ', ' ''Strength Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (468, ' ''Resistance Band'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (469, ' ''Pull-up Bar'' ', ' ''Strength Training'' ', null, 47.4);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (470, ' ''Dumbbell'' ', ' ''Strength Training'' ', 5.8, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (471, ' ''Kettlebell'' ', ' ''Cardio'' ', 16.5, 49.6);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (472, ' ''Pull-up Bar'' ', ' ''Flexibility Training'' ', 4.9, 9.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (473, ' ''Rope'' ', ' ''Climbing'' ', 7.6, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (474, ' ''Resistance Band'' ', ' ''Strength Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (475, ' ''Yoga Mat'' ', ' ''General Fitness'' ', 1, 43.1);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (476, ' ''Yoga Mat'' ', ' ''Strength Training'' ', 2.7, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (477, ' ''Yoga Mat'' ', ' ''Flexibility Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (478, ' ''Dumbbell'' ', ' ''Flexibility Training'' ', null, 37.2);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (479, ' ''Resistance Band'' ', ' ''Flexibility Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (480, ' ''Medicine Ball'' ', ' ''Cardio'' ', null, 13.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (481, ' ''Medicine Ball'' ', ' ''Cardio'' ', null, 41.2);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (482, ' ''Resistance Band'' ', ' ''Climbing'' ', 8.2, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (483, ' ''Exercise Ball'' ', ' ''Strength Training'' ', 9, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (484, ' ''Weightlift'' ', ' ''Climbing'' ', null, 21.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (485, ' ''Resistance Band'' ', ' ''General Fitness'' ', 17.4, 9.6);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (486, ' ''Jump Rope'' ', ' ''Flexibility Training'' ', 3, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (487, ' ''Exercise Ball'' ', ' ''Flexibility Training'' ', 15.3, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (488, ' ''Kettlebell'' ', ' ''General Fitness'' ', 3.3, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (489, ' ''Medicine Ball'' ', ' ''General Fitness'' ', null, 4.3);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (490, ' ''Weightlift'' ', ' ''Climbing'' ', 18.8, 41.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (491, ' ''Exercise Ball'' ', ' ''General Fitness'' ', 18.1, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (492, ' ''Yoga Mat'' ', ' ''Flexibility Training'' ', 6.5, 8.6);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (493, ' ''Dumbbell'' ', ' ''Strength Training'' ', null, 30.3);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (494, ' ''Medicine Ball'' ', ' ''Strength Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (495, ' ''Kettlebell'' ', ' ''General Fitness'' ', 19.2, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (496, ' ''Weightlift'' ', ' ''Climbing'' ', null, 35.5);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (497, ' ''Yoga Mat'' ', ' ''General Fitness'' ', 13, 39.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (498, ' ''Resistance Band'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (499, ' ''Jump Rope'' ', ' ''Cardio'' ', 5.1, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (500, ' ''Kettlebell'' ', ' ''General Fitness'' ', null, 27.6);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (1, ' ''Yoga Mat'' ', ' ''Flexibility Training'' ', 11.9, 27);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (2, ' ''Jump Rope'' ', ' ''Cardio'' ', 3.3, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (3, ' ''Weightlift'' ', ' ''Cardio'' ', 17.3, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (4, ' ''Medicine Ball'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (5, ' ''Yoga Mat'' ', ' ''General Fitness'' ', 19.5, 2.1);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (6, ' ''Yoga Mat'' ', ' ''Strength Training'' ', null, 6.9);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (7, ' ''Resistance Band'' ', ' ''Cardio'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (8, ' ''Medicine Ball'' ', ' ''Cardio'' ', 15.2, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (9, ' ''Dumbbell'' ', ' ''General Fitness'' ', null, 37);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (10, ' ''Jump Rope'' ', ' ''Strength Training'' ', null, 5.1);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (11, ' ''Resistance Band'' ', ' ''Flexibility Training'' ', null, 18.1);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (12, ' ''Resistance Band'' ', ' ''General Fitness'' ', null, 40.1);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (13, ' ''Medicine Ball'' ', ' ''Cardio'' ', 13.9, 29.9);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (14, ' ''Exercise Ball'' ', ' ''Strength Training'' ', 16.5, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (15, ' ''Dumbbell'' ', ' ''Strength Training'' ', 15.7, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (16, ' ''Dumbbell'' ', ' ''General Fitness'' ', 17.2, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (17, ' ''Weightlift'' ', ' ''General Fitness'' ', 14.7, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (18, ' ''Yoga Mat'' ', ' ''Strength Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (19, ' ''Yoga Mat'' ', ' ''Cardio'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (20, ' ''Medicine Ball'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (21, ' ''Pull-up Bar'' ', ' ''Strength Training'' ', 4.6, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (22, ' ''Rope'' ', ' ''Cardio'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (23, ' ''Rope'' ', ' ''Cardio'' ', null, 16.4);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (24, ' ''Pull-up Bar'' ', ' ''Strength Training'' ', 12.3, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (25, ' ''Pull-up Bar'' ', ' ''Flexibility Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (26, ' ''Resistance Band'' ', ' ''Flexibility Training'' ', 12.4, 18.4);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (27, ' ''Jump Rope'' ', ' ''Strength Training'' ', 17.8, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (28, ' ''Rope'' ', ' ''Flexibility Training'' ', 9.3, null);
commit;
prompt 400 records committed...
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (29, ' ''Medicine Ball'' ', ' ''Flexibility Training'' ', 16.1, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (30, ' ''Yoga Mat'' ', ' ''Climbing'' ', 2.1, 2.5);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (31, ' ''Kettlebell'' ', ' ''Cardio'' ', 9.3, 46.1);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (32, ' ''Dumbbell'' ', ' ''Cardio'' ', null, 24.5);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (33, ' ''Yoga Mat'' ', ' ''Strength Training'' ', 13.3, 18.1);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (34, ' ''Exercise Ball'' ', ' ''Cardio'' ', 16.4, 42.1);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (35, ' ''Weightlift'' ', ' ''General Fitness'' ', 15.6, 4);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (36, ' ''Rope'' ', ' ''Flexibility Training'' ', null, 15);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (37, ' ''Yoga Mat'' ', ' ''General Fitness'' ', 13.7, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (38, ' ''Exercise Ball'' ', ' ''Cardio'' ', null, 39.9);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (39, ' ''Dumbbell'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (40, ' ''Resistance Band'' ', ' ''Flexibility Training'' ', null, 8.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (41, ' ''Resistance Band'' ', ' ''General Fitness'' ', null, 5.1);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (42, ' ''Yoga Mat'' ', ' ''Strength Training'' ', null, 37.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (43, ' ''Jump Rope'' ', ' ''Cardio'' ', 3.9, 9.8);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (44, ' ''Kettlebell'' ', ' ''Strength Training'' ', null, 12.6);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (45, ' ''Medicine Ball'' ', ' ''Flexibility Training'' ', null, 17.4);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (46, ' ''Yoga Mat'' ', ' ''General Fitness'' ', 3.7, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (47, ' ''Weightlift'' ', ' ''Cardio'' ', 2.8, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (48, ' ''Kettlebell'' ', ' ''Strength Training'' ', 6.9, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (49, ' ''Pull-up Bar'' ', ' ''Cardio'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (50, ' ''Pull-up Bar'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (51, ' ''Jump Rope'' ', ' ''Strength Training'' ', 2.3, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (52, ' ''Rope'' ', ' ''Cardio'' ', 11.2, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (53, ' ''Rope'' ', ' ''Cardio'' ', 3.6, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (54, ' ''Rope'' ', ' ''Climbing'' ', 11.3, 45.2);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (55, ' ''Exercise Ball'' ', ' ''Cardio'' ', 18.5, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (56, ' ''Kettlebell'' ', ' ''Strength Training'' ', null, 43.6);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (57, ' ''Jump Rope'' ', ' ''Flexibility Training'' ', null, 28.5);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (58, ' ''Yoga Mat'' ', ' ''Climbing'' ', null, 33.4);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (59, ' ''Yoga Mat'' ', ' ''Cardio'' ', 19.9, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (60, ' ''Resistance Band'' ', ' ''Strength Training'' ', 16.5, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (61, ' ''Weightlift'' ', ' ''Climbing'' ', null, 44.2);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (62, ' ''Pull-up Bar'' ', ' ''Climbing'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (63, ' ''Pull-up Bar'' ', ' ''Climbing'' ', null, 49.2);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (64, ' ''Dumbbell'' ', ' ''Strength Training'' ', 19.4, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (65, ' ''Resistance Band'' ', ' ''General Fitness'' ', null, 19.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (66, ' ''Medicine Ball'' ', ' ''Climbing'' ', 17.2, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (67, ' ''Resistance Band'' ', ' ''General Fitness'' ', 12.7, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (68, ' ''Medicine Ball'' ', ' ''General Fitness'' ', 18.2, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (69, ' ''Dumbbell'' ', ' ''General Fitness'' ', null, 41);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (70, ' ''Dumbbell'' ', ' ''Strength Training'' ', 7.5, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (71, ' ''Resistance Band'' ', ' ''Climbing'' ', 1.9, 11.3);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (72, ' ''Rope'' ', ' ''Strength Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (73, ' ''Dumbbell'' ', ' ''Strength Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (74, ' ''Medicine Ball'' ', ' ''Climbing'' ', 19.7, 35);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (75, ' ''Jump Rope'' ', ' ''Cardio'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (76, ' ''Exercise Ball'' ', ' ''Strength Training'' ', 5.5, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (77, ' ''Pull-up Bar'' ', ' ''Flexibility Training'' ', null, 20.8);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (78, ' ''Yoga Mat'' ', ' ''Cardio'' ', null, 37);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (79, ' ''Resistance Band'' ', ' ''Flexibility Training'' ', 4.4, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (80, ' ''Jump Rope'' ', ' ''Cardio'' ', null, 13.5);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (81, ' ''Pull-up Bar'' ', ' ''Cardio'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (82, ' ''Yoga Mat'' ', ' ''Flexibility Training'' ', null, 6);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (83, ' ''Resistance Band'' ', ' ''Strength Training'' ', null, 38.4);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (84, ' ''Dumbbell'' ', ' ''Flexibility Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (85, ' ''Jump Rope'' ', ' ''Strength Training'' ', 9.9, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (86, ' ''Rope'' ', ' ''Strength Training'' ', 12.9, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (87, ' ''Medicine Ball'' ', ' ''General Fitness'' ', 16.5, 43.8);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (88, ' ''Yoga Mat'' ', ' ''General Fitness'' ', null, 25.4);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (89, ' ''Yoga Mat'' ', ' ''Flexibility Training'' ', 16.7, 29.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (90, ' ''Yoga Mat'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (91, ' ''Exercise Ball'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (92, ' ''Yoga Mat'' ', ' ''General Fitness'' ', 2.5, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (93, ' ''Kettlebell'' ', ' ''Strength Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (94, ' ''Dumbbell'' ', ' ''Strength Training'' ', 13.1, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (95, ' ''Resistance Band'' ', ' ''Flexibility Training'' ', null, 25.2);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (96, ' ''Medicine Ball'' ', ' ''Climbing'' ', 2.9, 34.9);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (97, ' ''Rope'' ', ' ''Flexibility Training'' ', 17.8, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (98, ' ''Exercise Ball'' ', ' ''General Fitness'' ', 4.8, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (99, ' ''Jump Rope'' ', ' ''General Fitness'' ', null, 5.1);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (100, ' ''Dumbbell'' ', ' ''Strength Training'' ', null, 38);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (101, ' ''Dumbbell'' ', ' ''Climbing'' ', 7.2, 35.4);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (102, ' ''Pull-up Bar'' ', ' ''Climbing'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (103, ' ''Yoga Mat'' ', ' ''Flexibility Training'' ', null, 26.5);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (104, ' ''Kettlebell'' ', ' ''Climbing'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (105, ' ''Jump Rope'' ', ' ''Flexibility Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (106, ' ''Dumbbell'' ', ' ''Climbing'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (107, ' ''Pull-up Bar'' ', ' ''Flexibility Training'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (108, ' ''Yoga Mat'' ', ' ''Climbing'' ', 8.5, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (109, ' ''Rope'' ', ' ''Strength Training'' ', 11.9, 10.2);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (110, ' ''Pull-up Bar'' ', ' ''Climbing'' ', null, 44.5);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (111, ' ''Resistance Band'' ', ' ''Flexibility Training'' ', null, 38.8);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (112, ' ''Jump Rope'' ', ' ''Cardio'' ', 7.4, 33.7);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (113, ' ''Exercise Ball'' ', ' ''Strength Training'' ', null, 13.5);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (114, ' ''Resistance Band'' ', ' ''Flexibility Training'' ', 5.4, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (115, ' ''Jump Rope'' ', ' ''Strength Training'' ', 19.9, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (116, ' ''Pull-up Bar'' ', ' ''General Fitness'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (117, ' ''Yoga Mat'' ', ' ''Flexibility Training'' ', 11.5, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (118, ' ''Kettlebell'' ', ' ''Strength Training'' ', 19.5, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (119, ' ''Exercise Ball'' ', ' ''Cardio'' ', 11.1, 3.1);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (120, ' ''Yoga Mat'' ', ' ''Climbing'' ', 12.4, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (121, ' ''Yoga Mat'' ', ' ''Climbing'' ', null, 4.3);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (122, ' ''Rope'' ', ' ''Cardio'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (123, ' ''Resistance Band'' ', ' ''Cardio'' ', 15.2, 11.3);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (124, ' ''Weightlift'' ', ' ''Climbing'' ', 14.8, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (125, ' ''Weightlift'' ', ' ''Climbing'' ', null, 15.3);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (126, ' ''Kettlebell'' ', ' ''General Fitness'' ', 12.8, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (127, ' ''Yoga Mat'' ', ' ''Cardio'' ', null, null);
insert into ITEM (item_code, item_name, purpose, weight, item_length)
values (128, ' ''Dumbbell'' ', ' ''General Fitness'' ', null, 5.5);
commit;
prompt 500 records loaded
prompt Loading PERSON_ANOTHER_PHONE...
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (100764253, 703260999);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (102645386, 944654806);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (103553601, 162220250);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (104484382, 439643727);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (105174913, 935524399);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (111798924, 677966690);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (116214492, 843068367);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (118497476, 776564831);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (119423956, 158277278);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (119968374, 178906385);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (120596946, 375154552);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (120980869, 250146889);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (122684709, 763764233);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (124449054, 967021982);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (126651520, 273396102);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (127987532, 292421869);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (129716334, 883043356);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (130979952, 831558139);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (132350754, 696374837);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (133354673, 554526290);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (133659791, 199280229);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (136577344, 481541006);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (136969946, 870513504);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (137044682, 683756135);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (142113684, 344533634);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (146949805, 835284851);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (147334589, 548962651);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (148529631, 264816972);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (149309937, 731197644);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (149342646, 861440050);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (149676527, 841180795);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (153200521, 289832097);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (154696148, 698587684);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (155895833, 568212072);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (157393649, 870513504);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (157600947, 920426797);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (158530370, 870513504);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (158945650, 501348097);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (163623494, 738596862);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (163692767, 540381721);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (166120170, 317827346);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (166225165, 428261058);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (166598979, 479467077);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (168291364, 542004169);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (168555345, 923766112);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (168692557, 558402416);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (169276452, 455403379);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (169753007, 841180795);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (175456119, 193012006);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (178629018, 596082387);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (179121920, 199724940);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (180898002, 920426797);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (182796522, 137211133);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (183876046, 787378023);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (183941078, 343418940);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (184990997, 732473732);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (185368418, 825772129);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (185703035, 973326469);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (185820668, 715945176);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (189510775, 568212072);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (192575347, 915122110);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (195434658, 379652390);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (196002393, 194690926);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (196192344, 583024899);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (197195064, 776564831);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (198824637, 716184718);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (199306535, 500056959);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (206242913, 395672304);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (206581232, 882145843);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (207014622, 434172398);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (211364446, 543584585);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (216961744, 843068367);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (223818625, 152300229);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (228525670, 375351719);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (228630703, 992554869);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (228906707, 915122110);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (231041431, 726402722);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (232747432, 904929173);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (232810204, 197251348);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (239379989, 386432436);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (240640150, 601180013);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (243739177, 721297891);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (244831851, 601180013);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (249524588, 307865478);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (251153210, 843068367);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (252901827, 792537826);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (254696558, 489630456);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (254718750, 649768071);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (256642515, 220627730);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (258362449, 873682714);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (261450741, 466069898);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (262584301, 153951230);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (262938233, 756961200);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (267117575, 882145843);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (267685023, 720995190);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (269776271, 942622933);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (269807778, 238646522);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (270380689, 197251348);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (271414454, 403050636);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (272381585, 241957656);
commit;
prompt 100 records committed...
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (272836119, 179779567);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (274391864, 241957656);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (276072402, 336348974);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (277683361, 959338316);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (284247484, 280206586);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (287802484, 698519392);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (289523289, 849129256);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (290499093, 439643727);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (291462357, 991512349);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (291486750, 831558139);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (291654182, 939636403);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (295199003, 160302987);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (296045359, 741975218);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (297925361, 641170597);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (298853882, 558821746);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (300723130, 145389736);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (301672683, 598823879);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (301869292, 849129256);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (307291734, 523866118);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (308131959, 921188608);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (309743082, 173200754);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (315633980, 443970722);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (317448575, 698587684);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (317824705, 523866118);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (320039997, 525527704);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (320736685, 179779567);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (321111665, 721297891);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (321162445, 141837640);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (324199772, 592162027);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (324323708, 117293621);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (325256781, 283643146);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (332834027, 957557141);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (333421853, 540381721);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (338380146, 398601481);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (344340949, 920426797);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (346380666, 408406962);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (348323695, 742220858);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (348393445, 915122110);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (351060396, 222410846);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (351669896, 490765532);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (351694318, 610286655);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (351958485, 776564831);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (352453694, 787378023);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (353096168, 851470156);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (355569992, 282610851);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (356590665, 904929173);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (357362506, 885971333);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (358936944, 434172398);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (359014768, 662635024);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (363679285, 317822031);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (364042114, 194505717);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (365519535, 317838008);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (366548772, 595283787);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (367951586, 189643742);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (368239214, 695020064);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (372840465, 295318534);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (374840922, 463724524);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (377869665, 447040488);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (380436130, 840761695);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (381434880, 692865868);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (382601281, 296165656);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (385538185, 208612657);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (390553845, 911045673);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (391270844, 197251348);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (392060483, 271828792);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (392350328, 785455181);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (394249955, 679393117);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (397151947, 624127356);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (398606162, 582445416);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (400702319, 957557141);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (402611123, 235281661);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (405317053, 592162027);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (405536682, 289832097);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (406065924, 756961200);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (407025135, 466025294);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (417222990, 403050636);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (418238326, 901931967);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (420539113, 811411011);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (421678518, 783080526);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (422107716, 572513020);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (422942290, 815735034);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (423888689, 841180795);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (424319768, 331469551);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (425129605, 199724940);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (429783230, 666205340);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (431352766, 206629316);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (432470364, 537375804);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (433627808, 667027263);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (434167681, 210963470);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (435397913, 565571169);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (436983739, 443970722);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (439629903, 830160294);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (440866166, 478902541);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (441111693, 349700908);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (441144590, 656950868);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (441307764, 194505717);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (447105927, 339168131);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (449555129, 509662169);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (451296206, 331610494);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (453454073, 815735034);
commit;
prompt 200 records committed...
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (453971585, 667027263);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (461500429, 854442670);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (462126117, 336348974);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (462346075, 235281661);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (467847067, 648466322);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (468531177, 735626560);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (471474454, 197251348);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (472330339, 764787755);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (478787714, 542004169);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (482435983, 151674046);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (488253666, 382781490);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (491205358, 846419707);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (492143174, 656950868);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (494619448, 948133904);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (496539916, 677966690);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (497509864, 282610851);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (498207730, 474421059);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (501943726, 256244114);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (504289045, 843068367);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (508284342, 189643742);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (509615357, 807686151);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (510269669, 610907411);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (514678552, 880022583);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (514889059, 474421059);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (514930645, 936984007);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (516403845, 955659426);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (518628913, 957557141);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (518769504, 572513020);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (525096081, 221358829);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (525232865, 764787755);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (530530364, 928999987);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (534063884, 822240474);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (536209112, 637966728);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (540704466, 948133904);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (549896365, 240883177);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (551738040, 726402722);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (554434603, 501705989);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (555439573, 648883310);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (557120551, 595283787);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (557514661, 829092435);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (559417696, 194505717);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (561416201, 999747607);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (562394999, 940410755);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (563549728, 598823879);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (563648934, 786226109);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (572130777, 492752692);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (576394282, 206629316);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (576995266, 981055942);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (577206441, 783080526);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (580278748, 443970722);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (580437445, 478380949);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (580894629, 276176732);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (582049542, 500056959);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (583540071, 515674654);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (583905893, 645800410);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (584168031, 179779567);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (584824934, 885971333);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (584959991, 777648477);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (586307578, 324668142);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (588334768, 774448110);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (588540016, 840761695);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (589055707, 973326469);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (589669373, 940410755);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (592970624, 353251821);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (593888408, 339168131);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (594994766, 455403379);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (597626464, 631847604);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (597840470, 299788152);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (598204492, 849129256);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (600088092, 592163243);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (601851474, 726029513);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (602559238, 897043979);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (603068564, 955638737);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (606931876, 463724524);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (609971738, 618692425);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (613579598, 825772129);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (613873069, 402413501);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (614258716, 358572361);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (619031614, 153938151);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (620059918, 572285340);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (620714346, 787927993);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (623327712, 769542199);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (623957363, 495997339);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (626618781, 254163307);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (628243269, 755809998);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (631545393, 815735034);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (632037467, 425058356);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (634814470, 145376110);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (635203792, 402413501);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (637902629, 777648477);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (637999471, 870513504);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (638913712, 275393212);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (639245036, 363744559);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (639855451, 604967584);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (642045223, 924964324);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (642820249, 787378023);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (642929450, 703786319);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (643177035, 783080526);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (643709436, 331610494);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (644363099, 921188608);
commit;
prompt 300 records committed...
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (644803362, 640588003);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (646064249, 637214817);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (648024502, 331469551);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (649825054, 624917762);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (651905393, 281169657);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (652946422, 324668142);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (654083789, 962827621);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (654759368, 617937771);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (656773811, 226625742);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (659127386, 289832097);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (659498557, 511271917);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (660916663, 991512349);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (662578175, 973326469);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (663433660, 623674412);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (663683966, 193012006);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (663739462, 810251423);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (665083434, 763764233);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (666264347, 667027263);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (667422694, 182111971);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (672719275, 822240474);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (673987462, 154015286);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (674391705, 823910760);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (675326026, 289832097);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (679368148, 592162027);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (686727378, 911045673);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (686943864, 897043979);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (689352655, 607570811);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (690516869, 645800410);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (698703592, 810251423);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (698949494, 836251609);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (699257651, 625556109);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (699311358, 336348974);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (701766562, 364757858);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (702786638, 623674412);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (705763496, 843068367);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (706727384, 851536797);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (707665658, 289832097);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (709231703, 940410755);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (710118399, 592049227);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (710696218, 400352077);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (714464406, 959338316);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (718393401, 503031840);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (720221500, 126638060);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (721347602, 732473732);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (722826158, 862511399);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (723160224, 610960397);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (727180153, 557038448);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (727377688, 646684699);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (729674044, 936984007);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (731638772, 837026985);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (734948966, 331610494);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (740499953, 696983605);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (742544141, 601180013);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (744847511, 492752692);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (746363232, 891325545);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (747542415, 742101151);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (749561135, 894045375);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (750115300, 515674654);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (750279225, 542098274);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (754187203, 639106141);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (758113706, 126356435);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (759767679, 955659426);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (762533029, 720995190);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (763093292, 626464892);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (764235000, 443970722);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (764274573, 542098274);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (767872219, 236372769);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (770625449, 880022583);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (771082203, 283643146);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (771984374, 178726838);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (772053407, 915122110);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (773567550, 250146889);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (776643569, 825772129);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (780901197, 435897536);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (785019135, 447040488);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (785256167, 191471146);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (786002796, 534848455);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (787966314, 178726838);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (790797377, 305981991);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (793460720, 331610494);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (793497608, 392633660);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (793668822, 831558139);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (795439955, 617937771);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (797915307, 756961200);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (799648625, 764787755);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (799824575, 466069898);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (800953224, 571442515);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (803466981, 962827621);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (804059956, 490765532);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (804483495, 829145191);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (804750501, 250146889);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (805954336, 598823879);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (807882360, 924964324);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (811194310, 463724524);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (811748910, 295318534);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (812658823, 698519392);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (814162178, 451092501);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (815263657, 846419707);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (817123447, 119196872);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (820642860, 392078118);
commit;
prompt 400 records committed...
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (822296123, 100171750);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (825208346, 975459822);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (825449815, 276176732);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (825620970, 853017499);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (829227952, 683756135);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (834812248, 152300229);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (835496430, 891325545);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (840483316, 626464892);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (841466905, 837311276);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (847301399, 613127663);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (848093448, 755809998);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (853011439, 402413501);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (856612738, 144642188);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (858109268, 815956026);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (860307320, 181050162);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (861636330, 573698524);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (862041127, 353251821);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (864918669, 786226109);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (865822709, 540381721);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (866897801, 610907411);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (867736117, 178726838);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (868838438, 731197644);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (869985386, 289832097);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (871134641, 246305254);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (871544337, 596818423);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (871804408, 453477723);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (871804876, 490765532);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (873085748, 243572499);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (875501702, 554526290);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (875610205, 950034758);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (876446756, 254414972);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (876610791, 594211402);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (879946290, 648883310);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (880967555, 914334290);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (881704938, 683756135);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (882520698, 495997339);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (883077470, 601180013);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (884064511, 827216964);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (887929171, 252975811);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (888694210, 534848455);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (893135848, 837311276);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (893571362, 455403379);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (894612667, 754755023);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (895568698, 372097171);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (900116293, 714330119);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (901824458, 950034758);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (904224102, 848074639);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (906325663, 505169218);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (908038528, 617937771);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (908836742, 826589049);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (908985781, 583024899);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (911729985, 610907411);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (914653242, 943746739);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (917035198, 146924485);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (918940252, 649768071);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (919953888, 543584585);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (921134577, 829145191);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (924376873, 526237352);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (926019588, 637214817);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (926862268, 616052079);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (928140618, 695020064);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (929183310, 811445548);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (929478620, 744557849);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (931641011, 700069359);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (932092166, 645800410);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (932493171, 523866118);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (935631801, 256539670);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (936342153, 999747607);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (939517251, 826589049);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (941733712, 811411011);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (951737513, 118520760);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (953365204, 273396102);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (954532304, 554526290);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (954572310, 490765532);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (956443574, 959338316);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (958607484, 491367469);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (960728359, 378103171);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (962692212, 210963470);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (963911482, 955659426);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (965902607, 695020064);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (966340739, 466025294);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (966855588, 467275290);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (968980870, 474084615);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (969185394, 965940603);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (970404847, 273396102);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (972913095, 610286655);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (974170725, 816155341);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (974964506, 253406712);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (975109559, 118520760);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (978336387, 517199517);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (978495676, 188014768);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (979562137, 700069359);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (981014177, 885971333);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (981605817, 558026645);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (986651563, 695020064);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (988555835, 183537357);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (990375889, 800480327);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (991335644, 963758267);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (992919440, 907256920);
insert into PERSON_ANOTHER_PHONE (another_phone, person_id)
values (998789614, 732473732);
commit;
prompt 500 records loaded
prompt Loading USES...
insert into USES (training_code, item_code)
values (1, 54);
insert into USES (training_code, item_code)
values (1, 272);
insert into USES (training_code, item_code)
values (2, 126);
insert into USES (training_code, item_code)
values (3, 193);
insert into USES (training_code, item_code)
values (3, 330);
insert into USES (training_code, item_code)
values (3, 389);
insert into USES (training_code, item_code)
values (3, 445);
insert into USES (training_code, item_code)
values (4, 3);
insert into USES (training_code, item_code)
values (5, 446);
insert into USES (training_code, item_code)
values (6, 2);
insert into USES (training_code, item_code)
values (6, 112);
insert into USES (training_code, item_code)
values (7, 472);
insert into USES (training_code, item_code)
values (8, 182);
insert into USES (training_code, item_code)
values (9, 458);
insert into USES (training_code, item_code)
values (11, 79);
insert into USES (training_code, item_code)
values (12, 29);
insert into USES (training_code, item_code)
values (12, 115);
insert into USES (training_code, item_code)
values (13, 238);
insert into USES (training_code, item_code)
values (13, 437);
insert into USES (training_code, item_code)
values (19, 274);
insert into USES (training_code, item_code)
values (21, 495);
insert into USES (training_code, item_code)
values (22, 340);
insert into USES (training_code, item_code)
values (22, 436);
insert into USES (training_code, item_code)
values (23, 200);
insert into USES (training_code, item_code)
values (24, 118);
insert into USES (training_code, item_code)
values (25, 48);
insert into USES (training_code, item_code)
values (25, 388);
insert into USES (training_code, item_code)
values (25, 397);
insert into USES (training_code, item_code)
values (26, 87);
insert into USES (training_code, item_code)
values (26, 121);
insert into USES (training_code, item_code)
values (27, 234);
insert into USES (training_code, item_code)
values (28, 404);
insert into USES (training_code, item_code)
values (29, 385);
insert into USES (training_code, item_code)
values (29, 431);
insert into USES (training_code, item_code)
values (30, 74);
insert into USES (training_code, item_code)
values (30, 433);
insert into USES (training_code, item_code)
values (31, 386);
insert into USES (training_code, item_code)
values (32, 334);
insert into USES (training_code, item_code)
values (34, 279);
insert into USES (training_code, item_code)
values (34, 325);
insert into USES (training_code, item_code)
values (35, 280);
insert into USES (training_code, item_code)
values (36, 104);
insert into USES (training_code, item_code)
values (36, 340);
insert into USES (training_code, item_code)
values (36, 467);
insert into USES (training_code, item_code)
values (37, 422);
insert into USES (training_code, item_code)
values (38, 36);
insert into USES (training_code, item_code)
values (38, 403);
insert into USES (training_code, item_code)
values (39, 204);
insert into USES (training_code, item_code)
values (40, 69);
insert into USES (training_code, item_code)
values (44, 353);
insert into USES (training_code, item_code)
values (45, 175);
insert into USES (training_code, item_code)
values (45, 237);
insert into USES (training_code, item_code)
values (45, 254);
insert into USES (training_code, item_code)
values (46, 388);
insert into USES (training_code, item_code)
values (47, 406);
insert into USES (training_code, item_code)
values (49, 158);
insert into USES (training_code, item_code)
values (50, 291);
insert into USES (training_code, item_code)
values (51, 233);
insert into USES (training_code, item_code)
values (51, 492);
insert into USES (training_code, item_code)
values (53, 448);
insert into USES (training_code, item_code)
values (54, 294);
insert into USES (training_code, item_code)
values (55, 149);
insert into USES (training_code, item_code)
values (56, 92);
insert into USES (training_code, item_code)
values (56, 220);
insert into USES (training_code, item_code)
values (57, 281);
insert into USES (training_code, item_code)
values (58, 31);
insert into USES (training_code, item_code)
values (58, 75);
insert into USES (training_code, item_code)
values (59, 44);
insert into USES (training_code, item_code)
values (59, 59);
insert into USES (training_code, item_code)
values (60, 192);
insert into USES (training_code, item_code)
values (60, 243);
insert into USES (training_code, item_code)
values (60, 253);
insert into USES (training_code, item_code)
values (60, 303);
insert into USES (training_code, item_code)
values (61, 428);
insert into USES (training_code, item_code)
values (62, 183);
insert into USES (training_code, item_code)
values (64, 350);
insert into USES (training_code, item_code)
values (64, 485);
insert into USES (training_code, item_code)
values (65, 463);
insert into USES (training_code, item_code)
values (66, 334);
insert into USES (training_code, item_code)
values (66, 427);
insert into USES (training_code, item_code)
values (67, 270);
insert into USES (training_code, item_code)
values (68, 44);
insert into USES (training_code, item_code)
values (68, 135);
insert into USES (training_code, item_code)
values (71, 67);
insert into USES (training_code, item_code)
values (73, 81);
insert into USES (training_code, item_code)
values (74, 307);
insert into USES (training_code, item_code)
values (75, 269);
insert into USES (training_code, item_code)
values (75, 490);
insert into USES (training_code, item_code)
values (76, 122);
insert into USES (training_code, item_code)
values (76, 412);
insert into USES (training_code, item_code)
values (77, 339);
insert into USES (training_code, item_code)
values (78, 135);
insert into USES (training_code, item_code)
values (79, 161);
insert into USES (training_code, item_code)
values (79, 257);
insert into USES (training_code, item_code)
values (79, 353);
insert into USES (training_code, item_code)
values (80, 337);
insert into USES (training_code, item_code)
values (81, 316);
insert into USES (training_code, item_code)
values (82, 171);
insert into USES (training_code, item_code)
values (82, 415);
insert into USES (training_code, item_code)
values (82, 418);
commit;
prompt 100 records committed...
insert into USES (training_code, item_code)
values (83, 468);
insert into USES (training_code, item_code)
values (84, 20);
insert into USES (training_code, item_code)
values (84, 213);
insert into USES (training_code, item_code)
values (84, 271);
insert into USES (training_code, item_code)
values (86, 20);
insert into USES (training_code, item_code)
values (86, 426);
insert into USES (training_code, item_code)
values (89, 269);
insert into USES (training_code, item_code)
values (90, 190);
insert into USES (training_code, item_code)
values (90, 193);
insert into USES (training_code, item_code)
values (90, 368);
insert into USES (training_code, item_code)
values (91, 262);
insert into USES (training_code, item_code)
values (91, 272);
insert into USES (training_code, item_code)
values (91, 351);
insert into USES (training_code, item_code)
values (91, 398);
insert into USES (training_code, item_code)
values (92, 14);
insert into USES (training_code, item_code)
values (92, 226);
insert into USES (training_code, item_code)
values (94, 270);
insert into USES (training_code, item_code)
values (95, 223);
insert into USES (training_code, item_code)
values (95, 332);
insert into USES (training_code, item_code)
values (95, 389);
insert into USES (training_code, item_code)
values (96, 340);
insert into USES (training_code, item_code)
values (99, 67);
insert into USES (training_code, item_code)
values (101, 215);
insert into USES (training_code, item_code)
values (101, 226);
insert into USES (training_code, item_code)
values (101, 434);
insert into USES (training_code, item_code)
values (108, 414);
insert into USES (training_code, item_code)
values (109, 243);
insert into USES (training_code, item_code)
values (109, 320);
insert into USES (training_code, item_code)
values (110, 144);
insert into USES (training_code, item_code)
values (111, 157);
insert into USES (training_code, item_code)
values (111, 337);
insert into USES (training_code, item_code)
values (113, 135);
insert into USES (training_code, item_code)
values (113, 225);
insert into USES (training_code, item_code)
values (114, 180);
insert into USES (training_code, item_code)
values (114, 254);
insert into USES (training_code, item_code)
values (114, 258);
insert into USES (training_code, item_code)
values (115, 47);
insert into USES (training_code, item_code)
values (116, 457);
insert into USES (training_code, item_code)
values (118, 302);
insert into USES (training_code, item_code)
values (119, 138);
insert into USES (training_code, item_code)
values (119, 186);
insert into USES (training_code, item_code)
values (121, 306);
insert into USES (training_code, item_code)
values (122, 249);
insert into USES (training_code, item_code)
values (123, 120);
insert into USES (training_code, item_code)
values (125, 401);
insert into USES (training_code, item_code)
values (125, 466);
insert into USES (training_code, item_code)
values (126, 38);
insert into USES (training_code, item_code)
values (126, 273);
insert into USES (training_code, item_code)
values (127, 5);
insert into USES (training_code, item_code)
values (127, 277);
insert into USES (training_code, item_code)
values (128, 237);
insert into USES (training_code, item_code)
values (128, 256);
insert into USES (training_code, item_code)
values (130, 21);
insert into USES (training_code, item_code)
values (131, 113);
insert into USES (training_code, item_code)
values (131, 261);
insert into USES (training_code, item_code)
values (131, 263);
insert into USES (training_code, item_code)
values (131, 459);
insert into USES (training_code, item_code)
values (132, 251);
insert into USES (training_code, item_code)
values (133, 30);
insert into USES (training_code, item_code)
values (134, 364);
insert into USES (training_code, item_code)
values (135, 392);
insert into USES (training_code, item_code)
values (136, 228);
insert into USES (training_code, item_code)
values (141, 78);
insert into USES (training_code, item_code)
values (141, 473);
insert into USES (training_code, item_code)
values (142, 53);
insert into USES (training_code, item_code)
values (143, 256);
insert into USES (training_code, item_code)
values (145, 199);
insert into USES (training_code, item_code)
values (145, 219);
insert into USES (training_code, item_code)
values (146, 328);
insert into USES (training_code, item_code)
values (148, 401);
insert into USES (training_code, item_code)
values (149, 348);
insert into USES (training_code, item_code)
values (151, 402);
insert into USES (training_code, item_code)
values (152, 183);
insert into USES (training_code, item_code)
values (152, 235);
insert into USES (training_code, item_code)
values (152, 372);
insert into USES (training_code, item_code)
values (153, 293);
insert into USES (training_code, item_code)
values (154, 136);
insert into USES (training_code, item_code)
values (156, 225);
insert into USES (training_code, item_code)
values (156, 354);
insert into USES (training_code, item_code)
values (157, 463);
insert into USES (training_code, item_code)
values (158, 123);
insert into USES (training_code, item_code)
values (158, 420);
insert into USES (training_code, item_code)
values (159, 339);
insert into USES (training_code, item_code)
values (160, 186);
insert into USES (training_code, item_code)
values (160, 445);
insert into USES (training_code, item_code)
values (162, 105);
insert into USES (training_code, item_code)
values (162, 260);
insert into USES (training_code, item_code)
values (162, 317);
insert into USES (training_code, item_code)
values (165, 55);
insert into USES (training_code, item_code)
values (165, 303);
insert into USES (training_code, item_code)
values (166, 416);
insert into USES (training_code, item_code)
values (167, 151);
insert into USES (training_code, item_code)
values (167, 492);
insert into USES (training_code, item_code)
values (169, 188);
insert into USES (training_code, item_code)
values (171, 359);
insert into USES (training_code, item_code)
values (172, 393);
insert into USES (training_code, item_code)
values (174, 367);
insert into USES (training_code, item_code)
values (175, 142);
insert into USES (training_code, item_code)
values (175, 293);
insert into USES (training_code, item_code)
values (176, 27);
commit;
prompt 200 records committed...
insert into USES (training_code, item_code)
values (178, 86);
insert into USES (training_code, item_code)
values (178, 156);
insert into USES (training_code, item_code)
values (178, 431);
insert into USES (training_code, item_code)
values (179, 75);
insert into USES (training_code, item_code)
values (181, 305);
insert into USES (training_code, item_code)
values (182, 289);
insert into USES (training_code, item_code)
values (182, 452);
insert into USES (training_code, item_code)
values (183, 97);
insert into USES (training_code, item_code)
values (184, 91);
insert into USES (training_code, item_code)
values (184, 140);
insert into USES (training_code, item_code)
values (184, 280);
insert into USES (training_code, item_code)
values (184, 484);
insert into USES (training_code, item_code)
values (185, 236);
insert into USES (training_code, item_code)
values (188, 127);
insert into USES (training_code, item_code)
values (194, 44);
insert into USES (training_code, item_code)
values (195, 268);
insert into USES (training_code, item_code)
values (195, 400);
insert into USES (training_code, item_code)
values (198, 404);
insert into USES (training_code, item_code)
values (199, 182);
insert into USES (training_code, item_code)
values (199, 337);
insert into USES (training_code, item_code)
values (200, 386);
insert into USES (training_code, item_code)
values (201, 207);
insert into USES (training_code, item_code)
values (202, 409);
insert into USES (training_code, item_code)
values (203, 404);
insert into USES (training_code, item_code)
values (204, 298);
insert into USES (training_code, item_code)
values (205, 14);
insert into USES (training_code, item_code)
values (205, 399);
insert into USES (training_code, item_code)
values (206, 227);
insert into USES (training_code, item_code)
values (206, 416);
insert into USES (training_code, item_code)
values (207, 319);
insert into USES (training_code, item_code)
values (208, 17);
insert into USES (training_code, item_code)
values (210, 42);
insert into USES (training_code, item_code)
values (213, 21);
insert into USES (training_code, item_code)
values (219, 144);
insert into USES (training_code, item_code)
values (219, 452);
insert into USES (training_code, item_code)
values (222, 406);
insert into USES (training_code, item_code)
values (223, 227);
insert into USES (training_code, item_code)
values (225, 401);
insert into USES (training_code, item_code)
values (227, 298);
insert into USES (training_code, item_code)
values (228, 184);
insert into USES (training_code, item_code)
values (228, 214);
insert into USES (training_code, item_code)
values (230, 29);
insert into USES (training_code, item_code)
values (232, 211);
insert into USES (training_code, item_code)
values (232, 317);
insert into USES (training_code, item_code)
values (232, 376);
insert into USES (training_code, item_code)
values (234, 254);
insert into USES (training_code, item_code)
values (234, 312);
insert into USES (training_code, item_code)
values (235, 123);
insert into USES (training_code, item_code)
values (236, 28);
insert into USES (training_code, item_code)
values (236, 65);
insert into USES (training_code, item_code)
values (241, 14);
insert into USES (training_code, item_code)
values (241, 301);
insert into USES (training_code, item_code)
values (241, 359);
insert into USES (training_code, item_code)
values (241, 483);
insert into USES (training_code, item_code)
values (242, 220);
insert into USES (training_code, item_code)
values (243, 217);
insert into USES (training_code, item_code)
values (244, 403);
insert into USES (training_code, item_code)
values (245, 365);
insert into USES (training_code, item_code)
values (245, 488);
insert into USES (training_code, item_code)
values (247, 39);
insert into USES (training_code, item_code)
values (250, 73);
insert into USES (training_code, item_code)
values (251, 299);
insert into USES (training_code, item_code)
values (252, 63);
insert into USES (training_code, item_code)
values (253, 18);
insert into USES (training_code, item_code)
values (255, 21);
insert into USES (training_code, item_code)
values (255, 229);
insert into USES (training_code, item_code)
values (255, 255);
insert into USES (training_code, item_code)
values (256, 269);
insert into USES (training_code, item_code)
values (256, 500);
insert into USES (training_code, item_code)
values (257, 128);
insert into USES (training_code, item_code)
values (259, 92);
insert into USES (training_code, item_code)
values (261, 474);
insert into USES (training_code, item_code)
values (262, 247);
insert into USES (training_code, item_code)
values (267, 80);
insert into USES (training_code, item_code)
values (268, 234);
insert into USES (training_code, item_code)
values (269, 279);
insert into USES (training_code, item_code)
values (269, 454);
insert into USES (training_code, item_code)
values (270, 184);
insert into USES (training_code, item_code)
values (272, 481);
insert into USES (training_code, item_code)
values (273, 485);
insert into USES (training_code, item_code)
values (274, 11);
insert into USES (training_code, item_code)
values (275, 217);
insert into USES (training_code, item_code)
values (276, 468);
insert into USES (training_code, item_code)
values (278, 143);
insert into USES (training_code, item_code)
values (279, 56);
insert into USES (training_code, item_code)
values (281, 393);
insert into USES (training_code, item_code)
values (282, 182);
insert into USES (training_code, item_code)
values (282, 344);
insert into USES (training_code, item_code)
values (283, 23);
insert into USES (training_code, item_code)
values (283, 29);
insert into USES (training_code, item_code)
values (284, 279);
insert into USES (training_code, item_code)
values (286, 339);
insert into USES (training_code, item_code)
values (288, 187);
insert into USES (training_code, item_code)
values (289, 39);
insert into USES (training_code, item_code)
values (289, 50);
insert into USES (training_code, item_code)
values (291, 390);
insert into USES (training_code, item_code)
values (293, 102);
insert into USES (training_code, item_code)
values (293, 156);
insert into USES (training_code, item_code)
values (294, 122);
insert into USES (training_code, item_code)
values (295, 371);
commit;
prompt 300 records committed...
insert into USES (training_code, item_code)
values (297, 275);
insert into USES (training_code, item_code)
values (297, 492);
insert into USES (training_code, item_code)
values (298, 247);
insert into USES (training_code, item_code)
values (298, 400);
insert into USES (training_code, item_code)
values (298, 470);
insert into USES (training_code, item_code)
values (300, 301);
insert into USES (training_code, item_code)
values (300, 340);
insert into USES (training_code, item_code)
values (301, 303);
insert into USES (training_code, item_code)
values (302, 52);
insert into USES (training_code, item_code)
values (302, 95);
insert into USES (training_code, item_code)
values (304, 126);
insert into USES (training_code, item_code)
values (308, 449);
insert into USES (training_code, item_code)
values (309, 315);
insert into USES (training_code, item_code)
values (310, 82);
insert into USES (training_code, item_code)
values (310, 160);
insert into USES (training_code, item_code)
values (313, 90);
insert into USES (training_code, item_code)
values (313, 254);
insert into USES (training_code, item_code)
values (314, 352);
insert into USES (training_code, item_code)
values (315, 144);
insert into USES (training_code, item_code)
values (316, 116);
insert into USES (training_code, item_code)
values (316, 154);
insert into USES (training_code, item_code)
values (317, 208);
insert into USES (training_code, item_code)
values (320, 357);
insert into USES (training_code, item_code)
values (322, 60);
insert into USES (training_code, item_code)
values (322, 91);
insert into USES (training_code, item_code)
values (322, 213);
insert into USES (training_code, item_code)
values (322, 221);
insert into USES (training_code, item_code)
values (326, 321);
insert into USES (training_code, item_code)
values (326, 449);
insert into USES (training_code, item_code)
values (329, 229);
insert into USES (training_code, item_code)
values (329, 449);
insert into USES (training_code, item_code)
values (331, 439);
insert into USES (training_code, item_code)
values (332, 297);
insert into USES (training_code, item_code)
values (333, 269);
insert into USES (training_code, item_code)
values (334, 447);
insert into USES (training_code, item_code)
values (337, 131);
insert into USES (training_code, item_code)
values (337, 249);
insert into USES (training_code, item_code)
values (337, 462);
insert into USES (training_code, item_code)
values (339, 79);
insert into USES (training_code, item_code)
values (340, 158);
insert into USES (training_code, item_code)
values (340, 245);
insert into USES (training_code, item_code)
values (340, 363);
insert into USES (training_code, item_code)
values (340, 425);
insert into USES (training_code, item_code)
values (341, 134);
insert into USES (training_code, item_code)
values (341, 375);
insert into USES (training_code, item_code)
values (342, 103);
insert into USES (training_code, item_code)
values (343, 11);
insert into USES (training_code, item_code)
values (344, 425);
insert into USES (training_code, item_code)
values (346, 178);
insert into USES (training_code, item_code)
values (346, 206);
insert into USES (training_code, item_code)
values (347, 309);
insert into USES (training_code, item_code)
values (347, 432);
insert into USES (training_code, item_code)
values (348, 98);
insert into USES (training_code, item_code)
values (348, 489);
insert into USES (training_code, item_code)
values (349, 41);
insert into USES (training_code, item_code)
values (349, 187);
insert into USES (training_code, item_code)
values (350, 465);
insert into USES (training_code, item_code)
values (351, 135);
insert into USES (training_code, item_code)
values (353, 99);
insert into USES (training_code, item_code)
values (353, 355);
insert into USES (training_code, item_code)
values (356, 296);
insert into USES (training_code, item_code)
values (356, 355);
insert into USES (training_code, item_code)
values (357, 352);
insert into USES (training_code, item_code)
values (359, 100);
insert into USES (training_code, item_code)
values (359, 251);
insert into USES (training_code, item_code)
values (359, 459);
insert into USES (training_code, item_code)
values (361, 433);
insert into USES (training_code, item_code)
values (362, 247);
insert into USES (training_code, item_code)
values (364, 361);
insert into USES (training_code, item_code)
values (366, 444);
insert into USES (training_code, item_code)
values (366, 458);
insert into USES (training_code, item_code)
values (367, 160);
insert into USES (training_code, item_code)
values (370, 240);
insert into USES (training_code, item_code)
values (371, 371);
insert into USES (training_code, item_code)
values (371, 426);
insert into USES (training_code, item_code)
values (371, 438);
insert into USES (training_code, item_code)
values (373, 82);
insert into USES (training_code, item_code)
values (375, 287);
insert into USES (training_code, item_code)
values (376, 2);
insert into USES (training_code, item_code)
values (376, 500);
insert into USES (training_code, item_code)
values (381, 231);
insert into USES (training_code, item_code)
values (383, 326);
insert into USES (training_code, item_code)
values (383, 427);
insert into USES (training_code, item_code)
values (383, 453);
insert into USES (training_code, item_code)
values (383, 497);
insert into USES (training_code, item_code)
values (386, 471);
insert into USES (training_code, item_code)
values (387, 251);
insert into USES (training_code, item_code)
values (388, 118);
insert into USES (training_code, item_code)
values (388, 130);
insert into USES (training_code, item_code)
values (388, 339);
insert into USES (training_code, item_code)
values (389, 348);
insert into USES (training_code, item_code)
values (390, 52);
insert into USES (training_code, item_code)
values (390, 319);
insert into USES (training_code, item_code)
values (390, 337);
insert into USES (training_code, item_code)
values (392, 104);
insert into USES (training_code, item_code)
values (392, 305);
insert into USES (training_code, item_code)
values (392, 327);
insert into USES (training_code, item_code)
values (392, 496);
insert into USES (training_code, item_code)
values (393, 13);
insert into USES (training_code, item_code)
values (393, 114);
commit;
prompt 400 records committed...
insert into USES (training_code, item_code)
values (393, 273);
insert into USES (training_code, item_code)
values (393, 426);
insert into USES (training_code, item_code)
values (396, 260);
insert into USES (training_code, item_code)
values (396, 441);
insert into USES (training_code, item_code)
values (399, 399);
insert into USES (training_code, item_code)
values (400, 1);
insert into USES (training_code, item_code)
values (400, 38);
insert into USES (training_code, item_code)
values (401, 98);
insert into USES (training_code, item_code)
values (401, 358);
insert into USES (training_code, item_code)
values (403, 7);
insert into USES (training_code, item_code)
values (403, 174);
insert into USES (training_code, item_code)
values (403, 253);
insert into USES (training_code, item_code)
values (404, 254);
insert into USES (training_code, item_code)
values (407, 152);
insert into USES (training_code, item_code)
values (407, 396);
insert into USES (training_code, item_code)
values (408, 86);
insert into USES (training_code, item_code)
values (408, 210);
insert into USES (training_code, item_code)
values (408, 230);
insert into USES (training_code, item_code)
values (410, 45);
insert into USES (training_code, item_code)
values (410, 439);
insert into USES (training_code, item_code)
values (413, 183);
insert into USES (training_code, item_code)
values (419, 115);
insert into USES (training_code, item_code)
values (421, 163);
insert into USES (training_code, item_code)
values (421, 237);
insert into USES (training_code, item_code)
values (422, 12);
insert into USES (training_code, item_code)
values (422, 246);
insert into USES (training_code, item_code)
values (425, 402);
insert into USES (training_code, item_code)
values (425, 445);
insert into USES (training_code, item_code)
values (426, 6);
insert into USES (training_code, item_code)
values (426, 303);
insert into USES (training_code, item_code)
values (426, 355);
insert into USES (training_code, item_code)
values (426, 493);
insert into USES (training_code, item_code)
values (427, 28);
insert into USES (training_code, item_code)
values (428, 182);
insert into USES (training_code, item_code)
values (428, 355);
insert into USES (training_code, item_code)
values (431, 90);
insert into USES (training_code, item_code)
values (434, 329);
insert into USES (training_code, item_code)
values (434, 452);
insert into USES (training_code, item_code)
values (436, 148);
insert into USES (training_code, item_code)
values (437, 203);
insert into USES (training_code, item_code)
values (437, 463);
insert into USES (training_code, item_code)
values (440, 60);
insert into USES (training_code, item_code)
values (440, 386);
insert into USES (training_code, item_code)
values (441, 405);
insert into USES (training_code, item_code)
values (443, 205);
insert into USES (training_code, item_code)
values (443, 462);
insert into USES (training_code, item_code)
values (444, 442);
insert into USES (training_code, item_code)
values (445, 434);
insert into USES (training_code, item_code)
values (446, 435);
insert into USES (training_code, item_code)
values (447, 327);
insert into USES (training_code, item_code)
values (447, 487);
insert into USES (training_code, item_code)
values (450, 26);
insert into USES (training_code, item_code)
values (451, 133);
insert into USES (training_code, item_code)
values (453, 23);
insert into USES (training_code, item_code)
values (454, 57);
insert into USES (training_code, item_code)
values (454, 432);
insert into USES (training_code, item_code)
values (455, 121);
insert into USES (training_code, item_code)
values (455, 289);
insert into USES (training_code, item_code)
values (457, 36);
insert into USES (training_code, item_code)
values (457, 380);
insert into USES (training_code, item_code)
values (459, 124);
insert into USES (training_code, item_code)
values (462, 100);
insert into USES (training_code, item_code)
values (462, 217);
insert into USES (training_code, item_code)
values (462, 348);
insert into USES (training_code, item_code)
values (464, 132);
insert into USES (training_code, item_code)
values (465, 210);
insert into USES (training_code, item_code)
values (468, 26);
insert into USES (training_code, item_code)
values (471, 239);
insert into USES (training_code, item_code)
values (471, 421);
insert into USES (training_code, item_code)
values (472, 132);
insert into USES (training_code, item_code)
values (472, 235);
insert into USES (training_code, item_code)
values (472, 392);
insert into USES (training_code, item_code)
values (473, 78);
insert into USES (training_code, item_code)
values (473, 294);
insert into USES (training_code, item_code)
values (474, 389);
insert into USES (training_code, item_code)
values (476, 101);
insert into USES (training_code, item_code)
values (477, 198);
insert into USES (training_code, item_code)
values (480, 370);
insert into USES (training_code, item_code)
values (480, 469);
insert into USES (training_code, item_code)
values (481, 122);
insert into USES (training_code, item_code)
values (482, 40);
insert into USES (training_code, item_code)
values (483, 280);
insert into USES (training_code, item_code)
values (484, 29);
insert into USES (training_code, item_code)
values (484, 107);
insert into USES (training_code, item_code)
values (485, 67);
insert into USES (training_code, item_code)
values (487, 231);
insert into USES (training_code, item_code)
values (489, 151);
insert into USES (training_code, item_code)
values (489, 290);
insert into USES (training_code, item_code)
values (489, 319);
insert into USES (training_code, item_code)
values (491, 115);
insert into USES (training_code, item_code)
values (491, 437);
insert into USES (training_code, item_code)
values (494, 441);
insert into USES (training_code, item_code)
values (495, 93);
insert into USES (training_code, item_code)
values (496, 453);
insert into USES (training_code, item_code)
values (497, 95);
insert into USES (training_code, item_code)
values (497, 376);
insert into USES (training_code, item_code)
values (498, 465);
insert into USES (training_code, item_code)
values (500, 13);
insert into USES (training_code, item_code)
values (500, 190);
commit;
prompt 499 records loaded
prompt Enabling foreign key constraints for TRAINEE...
alter table TRAINEE enable constraint SYS_C00716578;
prompt Enabling foreign key constraints for TRAINER...
alter table TRAINER enable constraint SYS_C00716577;
prompt Enabling foreign key constraints for ACTUAL_TRAINING...
alter table ACTUAL_TRAINING enable constraint SYS_C00711871;
alter table ACTUAL_TRAINING enable constraint SYS_C00716580;
alter table ACTUAL_TRAINING enable constraint SYS_C00716581;
prompt Enabling foreign key constraints for PERSON_ANOTHER_PHONE...
alter table PERSON_ANOTHER_PHONE enable constraint SYS_C00716579;
prompt Enabling foreign key constraints for USES...
alter table USES enable constraint SYS_C00708894;
alter table USES enable constraint SYS_C00708895;
prompt Enabling triggers for PERSON...
alter table PERSON enable all triggers;
prompt Enabling triggers for TRAINEE...
alter table TRAINEE enable all triggers;
prompt Enabling triggers for TRAINER...
alter table TRAINER enable all triggers;
prompt Enabling triggers for TRAINING...
alter table TRAINING enable all triggers;
prompt Enabling triggers for ACTUAL_TRAINING...
alter table ACTUAL_TRAINING enable all triggers;
prompt Enabling triggers for ITEM...
alter table ITEM enable all triggers;
prompt Enabling triggers for PERSON_ANOTHER_PHONE...
alter table PERSON_ANOTHER_PHONE enable all triggers;
prompt Enabling triggers for USES...
alter table USES enable all triggers;
