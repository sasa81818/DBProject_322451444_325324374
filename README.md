## מיני פרויקט בבסיסי נתונים- ניהול מערכת תכניות אימון (כושר) אישיות
מגישות:
טובה רוטנשטיין-322451444
ושרי זילברליכט-325324374

### תוכן עניינים
- [מבוא](#מבוא)
- [שלב 1](#שלב-1)
  - [דיאגרמת ERD](#דיאגרמת-erd)
  - [דיאגרמת DSD](#דיאגרמת-dsd)
  - [פקודת CreateTables](#פקודת-CreateTables)
  - [הפעלת פקודות DESC](#הפעלת-פקודות-description)
  - [ייבוא נתונים](#ייבוא-נתונים)
    - [ייבוא נתונים מקובץ טקסט](#ייבוא-נתונים-מקובץ-טקסט)
    - [הכנסת נתונים ע"י Data Generator](#הכנסת-נתונים-עי-data-generator)
    - [הכנסת נתונים ע"י תוכנית Python](#הכנסת-נתונים-עי-תוכנית-python)
    - [הכנסת נתונים ע"י אתר mockaroo](#הכנסת-נתונים-עי-אתר-mockaroo)

  - [יצירת קובץ הגיבוי](#יצירת-קובץ-הגיבוי)

## מבוא 
המערכת שלנו עוסקת בניהול מערכות המידע של תכניות אימון (כושר) אישיות, וכוללת את הישויות הבאות:
מדריכים, מתאמנים, אימונים (סוגי אימון - זומבה, יוגה...), אימונים בפועל (אימון מסויים בין מאמן ומתאמן) וכן את אביזרי הכושר עבור כל אימון.
בהמשך נציג שאילתות שונות שיעזרו לנו לדלות מידע מהנתונים וכן לערוך שינויים על הטבלאות הקיימות..

#


## שלב 1

### דיאגרמת ERD

![תמונה של WhatsApp‏ 2024-05-20 בשעה 23 00 39_bd5457db](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/924d2061-f5b3-4c5e-b851-159f159a4ab9)



### דיאגרמת DSD
![תמונה של WhatsApp‏ 2024-05-20 בשעה 23 00 40_68111b93](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/f02a4ab1-0b28-4189-835a-97dac078cedb)


### פקודת CreateTables
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

![Screenshot 2024-05-27 213901](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/b25ac61d-a0ea-4788-84ae-fc8f1bd92636)
![Screenshot 2024-05-27 214231](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/1a1bd032-6fef-4825-b9d2-5530c2a2e192)
![Screenshot 2024-05-27 214213](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/62b2c776-fb99-423a-81a9-6dbc73fee101)
![Screenshot 2024-05-27 214140](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/df449d56-a18f-4cf9-9e3f-a0779effc145)
![Screenshot 2024-05-27 214108](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/3bef91a0-7096-4e8e-89b5-76d3d2771785)
![Screenshot 2024-05-27 214050](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/e5079747-9e37-469a-9787-66e78fa96596)
![Screenshot 2024-05-27 214007](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/52a38c63-36fb-49b1-a6c4-1d038fb8231b)
![Screenshot 2024-05-27 213940](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/8aa05b78-3a36-402f-bd33-3643447ea948)




## ייבוא נתונים
### ייבוא נתונים מקובץ טקסט:
קובץ הטקסט:

![Screenshot 2024-05-27 214637](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/eb52328d-acca-4c98-ac00-0b614fa32c91)

קובץ ה Importer:
![Screenshot 2024-05-27 215039](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/9c6bf853-d0a8-4265-883a-0e4899628714)


### הכנסת נתונים ע"י Data Generator:


![Screenshot 2024-05-27 215531](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/8e6140e9-95a6-4cb3-87f4-311f7ca8ee2d)

![Screenshot 2024-05-27 215503](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/4437a09e-7a51-451e-adcb-4f951cd2fe09)

![Screenshot 2024-05-27 215427](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/e3fa70be-0fc6-43cf-8f9c-a478776294d6)

![Screenshot 2024-05-27 215621](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/7b9c139f-5965-4bc6-a2ff-8a3633a24001)

![Screenshot 2024-05-27 215558](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/0c5f5692-9e50-4ec0-96f7-394f63ac226c)


### הכנסת נתונים ע"י תוכנית Python:
התוכנית:

![Screenshot 2024-05-27 220022](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/303719cb-8586-4821-a455-5acdd7ab2e3b)



הקובץ המתקבל:

![Screenshot 2024-05-27 220120](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/3a6afb2b-7817-4e49-a5f7-54738b12b5bc)

### הכנסת נתונים ע"י אתר mockaroo:
האתר:
![Screenshot 2024-05-27 222733](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/b6838f34-e0fe-48f8-8356-73f8c687e429)


הקובץ המתקבל:
![Screenshot 2024-05-27 222823](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/814b449f-822b-4fa6-a527-a8790b5d68f0)


## יצירת קובץ הגיבוי:


![Screenshot 2024-05-27 220237](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/b2d7d269-c3eb-4629-83de-7d6e594967c9)


### שחזור קובץ הגיבוי:
הרצה על משתמש אחר, ניתן לראות כי הנתונים נשמרו:




![Screenshot 2024-05-27 221056](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/cead7bfe-7bee-42fd-a3a9-481b06c200bf)




