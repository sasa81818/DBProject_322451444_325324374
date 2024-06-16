-- Create/Recreate primary, unique and foreign key constraints 
alter table TRAINEE
  drop constraint SYS_C00708859;
alter table TRAINEE
  add foreign key (PERSON_ID)
  references PERSON (PERSON_ID) on delete cascade;



-- Create/Recreate primary, unique and foreign key constraints 
alter table TRAINER
  drop constraint SYS_C00708853;
alter table TRAINER
  add foreign key (PERSON_ID)
  references PERSON (PERSON_ID) on delete cascade;

-- Create/Recreate primary, unique and foreign key constraints 
alter table PERSON_ANOTHER_PHONE
  drop constraint SYS_C00708899;
alter table PERSON_ANOTHER_PHONE
  add foreign key (PERSON_ID)
  references PERSON (PERSON_ID) on delete cascade;

-- Create/Recreate primary, unique and foreign key constraints 
alter table ACTUAL_TRAINING
  drop constraint SYS_C00711869;
alter table ACTUAL_TRAINING
  add foreign key (PERSON_ID1)
  references TRAINEE (PERSON_ID) on delete cascade;
alter table ACTUAL_TRAINING
  drop constraint SYS_C00711870;
alter table ACTUAL_TRAINING
  add foreign key (PERSON_ID2)
  references TRAINER (PERSON_ID) on delete cascade;



-- Add/modify columns 
alter table ITEM modify purpose not null;



-- Add/modify columns 
alter table TRAINING modify constrains default "no-constaints";



-- Create/Recreate check constraints 
alter table ACTUAL_TRAINING
  add constraint different_ids
  check (PERSON_ID1<>PERSON_ID2);
  
  
 











