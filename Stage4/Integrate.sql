--rename our tables (the relevant):

rename PERSON to PERSON_1;
rename TRAINEE to TRAINEE_1;

-- Add/modify columns in person_1
alter table PERSON_1 modify person_id NUMBER(10);
alter table PERSON_1 modify first_name VARCHAR2(50);
alter table PERSON_1 modify last_name null;
alter table PERSON_1 modify birth_date null;
alter table PERSON_1 modify street VARCHAR2(50);
alter table PERSON_1 modify house_number null;
alter table PERSON_1 modify email VARCHAR2(50);
alter table PERSON_1 add gender VARCHAR2(15);

-- Add/modify columns in trainee_1
alter table TRAINEE_1 modify health_condition VARCHAR2(50);
alter table TRAINEE_1 modify person_id NUMBER(10);
alter table TRAINEE_1 add payment_details VARCHAR2(50);
alter table TRAINEE_1 add training_plan VARCHAR2(50);

-- Add/modify columns in trainer
alter table TRAINER modify salary NUMBER(15,2);
alter table TRAINER modify rating null;
alter table TRAINER modify person_id NUMBER(10);
alter table TRAINER add speciality VARCHAR2(50);
alter table TRAINER add experience VARCHAR2(50);
--change the seniority to expirience
update trainer set experience = TO_CHAR(seniority);
select * from trainer;
alter table trainer drop column seniority;

--checking the tables 
select * from person_1;
select * from person;
select count(*) from person_1;
select count(*) from person;

select subscription from trainee group by subscription;
select * from trainee_1;
select * from trainee;
select count(*) from trainee_1;
select count(*) from trainee;

select * from trainer;
select * from coach;
select count(*) from trainer;
select count(*) from coach;

--check if there are same id's
select count(*)
from person
where person.person_id in (select person_id from person_1);


--Insert into person_1 the data from person
insert into person_1 (person_id, first_name, last_name, birth_date, city, street, house_number, email, main_phone, gender)
select person_id, full_name as first_name, NULL as last_name, NULL as birth_date, NULL as city, address as street, NULL as house_number, email, phone as main_phone, gender
from person;


--Insert into trainee_1 the data from trainee
--subscription->membership_length
insert into trainee_1 (joining_date, membership_length, health_condition,person_id,payment_details,training_plan)
select joining_date, 
       case subscription
         when 'Basic Membership' then 6
         when 'Standard Membership' then 12
         when 'Family Membership' then 8
         when 'Personal Training Membership' then 3
         when 'Premium Membership' then 24
         else 1
       end as  membership_length,
         health as health_condition,
         person_id,
         payment_details,
         training_plan
from trainee;



--Insert into trainer the data from coach
insert into trainer (salary, rating, person_id, speciality, experience)
select salary, NULL as rating, person_id, speciality, experience
from coach;




-- Create/Recreate primary, unique and foreign key constraints class_lesson
alter table CLASS_LESSON
  drop constraint SYS_C00722244;
alter table CLASS_LESSON
  add foreign key (PERSON_ID)
  references trainer (PERSON_ID);


-- Create/Recreate primary, unique and foreign key constraints takes
alter table TAKES
  drop constraint SYS_C00722266;
alter table TAKES
  add foreign key (PERSON_ID)
  references trainee_1 (PERSON_ID);


-- Create/Recreate primary, unique and foreign key constraints trains_in
alter table TRAINS_IN
  drop constraint SYS_C00722272;
alter table TRAINS_IN
  add foreign key (PERSON_ID)
  references trainee_1 (PERSON_ID);
  



--drop tables that are not used anymore:
drop table trainee;
drop table coach;
drop table person;


--rename back:
rename PERSON_1 to PERSON;
rename TRAINEE_1 to TRAINEE;



