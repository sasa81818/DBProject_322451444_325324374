![תמונה של WhatsApp‏ 2024-05-20 בשעה 23 00 39_bd5457db](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/91e6cd1f-f118-4031-967f-59346bd6ec59)## מיני פרויקט בבסיסי נתונים- ניהול מערכת תכניות אימון (כושר) אישיות
מגישות:
טובה רוטנשטיין-322451444
ושרי זילברליכט-325324374

# תוכן עניינים
- [מבוא](#מבוא)
- [שלב 1](#שלב-1)
  - [דיאגרמת ERD](#דיאגרמת-erd)
  - [דיאגרמת DSD](#דיאגרמת-dsd)
  - [תוכן קובץ ה-CreateTables](#תוכן-קובץ-ה-createtables)
  - [הפעלת פקודות DESC](#הפעלת-פקודות-description)
  - [ייבוא נתונים](#ייבוא-נתונים)
    - [ייבוא נתונים מקובץ טקסט](#ייבוא-נתונים-מקובץ-טקסט)
    - [הכנסת נתונים ע"י Data Generator](#הכנסת-נתונים-עי-data-generator)
    - [הכנסת נתונים ע"י תוכנית Python](#הכנסת-נתונים-עי-תוכנית-python)
  - [יצירת קובץ הגיבוי](#יצירת-קובץ-הגיבוי)

## מבוא 
המערכת שלנו עוסקת בניהול מערכות המידע של תכניות אימון (כושר) אישיות, וכוללת את הישויות הבאות:
מדריכים, מתאמנים, אימונים (כגון פילאטיס, אירובי), אימונים בפועל (אימון מסויים בין מאמן ומתאמן) וכן את אביזרי הכושר עבור כל אימון.
בהמשך נציג שאילתות שונות שיעזרו לנו לדלות מידע מהנתונים וכן לערוך שינויים על הטבלאות הקיימות..

#


## שלב 1

### דיאגרמת ERD

![תמונה של WhatsApp‏ 2024-05-20 בשעה 23 00 39_bd5457db](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/924d2061-f5b3-4c5e-b851-159f159a4ab9)




### דיאגרמת DSD
<img src="https://github.com/EsterNadler/DataBase-Project/assets/116155777/1d3dc8c2-b440-410f-8765-046a4418abf9" alt="2דיאגרמה" width="1000">

### פקודת CreateTables:
```sh
 CREATE TABLE Person
(
  Person_ID NUMERIC(9) NOT NULL,
  First_Name VARCHAR2(30) NOT NULL,
  Last_Name VARCHAR2(30) NOT NULL,
  Birth_Date DATE NOT NULL,
  City VARCHAR2(30) NULL,
  Street VARCHAR2(30) NULL,
  House_Number NUMERIC(5) NOT NULL,
  Email VARCHAR2(35),
  Main_Phone NUMERIC(13) NOT NULL,
  PRIMARY KEY (Person_ID)
);

CREATE TABLE Trainer
(
  Seniority NUMERIC(2) NOT NULL,
  Salary DECIMAL(7,2) NOT NULL,
  Rating NUMERIC(1) NOT NULL,
  Person_ID NUMERIC(9) NOT NULL,
  PRIMARY KEY (Person_ID),
  FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID)
);

CREATE TABLE Trainee
(
  Joining_Date DATE NOT NULL,
  Membership_Length NUMERIC(4) NOT NULL,
  Health_Condition VARCHAR2(20) NOT NULL,
  Person_ID NUMERIC(9) NOT NULL,
  PRIMARY KEY (Person_ID),
  FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID)
);

CREATE TABLE Training
(
  Training_Code NUMERIC(5) NOT NULL,
  Training_Type VARCHAR2(20) NOT NULL,
  Duration NUMERIC(3) NOT NULL,
  Constrains VARCHAR2(40),
  PRIMARY KEY (Training_Code)
);

CREATE TABLE Item
(
  Item_Code NUMERIC(5) NOT NULL,
  Item_Name VARCHAR2 (40) NOT NULL,
  Purpose VARCHAR2 (40),
  Weight DECIMAL(5,2),
  Item_Length DECIMAL(5,2),
  PRIMARY KEY (Item_Code)
);

CREATE TABLE Uses
(
  Training_Code NUMERIC(5) NOT NULL,
  Item_Code NUMERIC(5) NOT NULL,
  PRIMARY KEY (Training_Code, Item_Code),
  FOREIGN KEY (Training_Code) REFERENCES Training(Training_Code),
  FOREIGN KEY (Item_Code) REFERENCES Item(Item_Code)
);

CREATE TABLE Person_Another_Phone
(
  Another_Phone NUMERIC(13) NOT NULL,
  Person_ID NUMERIC(9) NOT NULL,
  PRIMARY KEY (Another_Phone, Person_ID),
  FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID)
);

CREATE TABLE Actual_Training
(
  Training_Hour DECIMAL(4,2) NOT NULL,
  Training_Date DATE NOT NULL,
  Training_Location VARCHAR2(30) NOT NULL,
  Training_Cost DECIMAL(5,2) NOT NULL,
  Actual_Training_Code NUMERIC(5) NOT NULL,
  Person_ID1 NUMERIC(9) NOT NULL,
  Person_ID2 NUMERIC(9) NOT NULL,
  Training_Code NUMERIC(5) NOT NULL,
  PRIMARY KEY (Actual_Training_Code),
  FOREIGN KEY (Person_ID1) REFERENCES Trainee(Person_ID),
  FOREIGN KEY (Person_ID2) REFERENCES Trainer(Person_ID),
  FOREIGN KEY (Training_Code) REFERENCES Training(Training_Code)
);


```
### הפעלת פקודות Description:
![image](https://github.com/EsterNadler/DataBase-Project/assets/116155777/4e0e344e-bda2-47ca-b6b3-353eadf30069)
![image](https://github.com/EsterNadler/DataBase-Project/assets/116155777/ff488dbe-5bb9-4308-b4eb-fe552bcc0c5a)
![image](https://github.com/EsterNadler/DataBase-Project/assets/116155777/a72fb1d2-b7b1-4413-939c-5fb6a105ca3c)
![image](https://github.com/EsterNadler/DataBase-Project/assets/116155777/8e0ad917-7ed4-4aa9-a27c-703c9f67c954)
![image](https://github.com/EsterNadler/DataBase-Project/assets/116155777/f028d449-b7ee-4b96-9596-0b7508b8794a)
![image](https://github.com/EsterNadler/DataBase-Project/assets/116155777/18fdd636-feb1-43e9-bc48-3c6f7936d191)
![image](https://github.com/EsterNadler/DataBase-Project/assets/116155777/9928c246-1fcd-49b2-89bc-4bcf2c649b71)
![image](https://github.com/EsterNadler/DataBase-Project/assets/116155777/cfd0e628-d6d2-44ea-8f9f-a9e377f54ad4)
![image](https://github.com/EsterNadler/DataBase-Project/assets/116155777/1a367893-eb72-427b-86e1-f184195d4aa3)
![image](https://github.com/EsterNadler/DataBase-Project/assets/116155777/1a4485e7-5275-4745-89f7-b7effffee812)

## ייבוא נתונים
### ייבוא נתונים מקובץ טקסט:
--------------------------------------------------------------------------לטבלה ROOM------------------------------------------------------------------
קובץ הטקסט:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/31001be1-07ee-4318-9499-d582967315dc)
קובץ ה Importer:
![צילום מסך 2024-05-25 210951](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/6d1ea58d-35c0-404f-bf9c-cb8b73f6bab6)

### הכנסת נתונים ע"י Data Generator:
--------לטבלה PERSON----------
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/c32fe676-113e-4802-a2a6-df156c4e62e7)

--------לטבלה TRAINER---------
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/b99c730b-8fdb-4ce4-b348-0d534b4191db)

-------לטבלה MEMBER_MEDICAL_CONSTRAINS--------
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/31689c49-fcb4-4c2f-b1e4-8c221113c65c)

-------לטבלה CLASS_MEDICAL_CONSTRAINS--------

![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/cba7355f-c2ba-4474-be33-a78923ba4baa)
---------------לטבלה LESSON---------------
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/8d855673-c46b-4b05-bac2-27e7de0c57ec)

-------לטבלה PERSON_PHONE--------
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/7f21812f-00c4-4696-a005-d84c2d4d92bb)


### הכנסת נתונים ע"י תוכנית Python:
הרצת התוכנית שמייצרת את פקודות הINSERT:
![צילום מסך 2024-05-27 121645](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/66d30f73-ac43-48a6-86f2-0552557f4b57)
הקובץ המתקבל:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/352a4cd5-d879-4266-8ae0-8eb4a4fa6b2b)


## יצירת קובץ הגיבוי:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/fa4fd4b3-460e-429b-8d52-57647c84bab3)
### שחזור קובץ הגיבוי:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/87d94d92-8f1f-4896-a6c3-470c4eaf2699)








