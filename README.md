## מיני פרויקט בבסיסי נתונים- ניהול מערכת תכניות אימון (כושר) אישיות
מגישות:
טובה רוטנשטיין-322451444
ושרי זילברליכט-325324374

### תוכן עניינים
- [מבוא](#מבוא)
- [שלב א](#שלב-א)
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
- [שלב ב](#שלב-ב)
  - [הרצת השאילתות](#הרצת-השאילתות)
    - [הרצת שאילתות ללא פרמטרים](#הרצת-שאילתות-ללא-פרמטרים)
    - [הרצת שאילתות עם פרמטרים](#הרצת-שאילתות-עם-פרמטרים)
    - [הרצת שאילתות עדכון](#הרצת-שאילתות-עדכון)
    - [הרצת שאילתות מחיקה](#הרצת-שאילתות-מחיקה)
  - [הוספת constrains](#הוספת-constrains)
-  [שלב ג](#שלב-ג)
    - [פונקציות](#פונקציות)
      - [פונקציה א](#פונקציה-א)
      - [פונקציה ב](#פונקציה-ב)
    - [פרוצדורות](#פרוצדורות)
      - [פרוצדורה א](#פרוצדורה-א)
      - [פרוצדורה ב](#פרוצדורה-ב)
    - [תכניות ראשיות](#תכניות-ראשיות)
      - [תכנית ראשית א](#תכנית-ראשית-א)
      - [תכנית ראשית ב](#תכנית-ראשית-ב)
- [שלב ד](#שלב-ד) 
    - [שחזור המידע](#שחזור-המידע)
      - [שינוי שם בטבלאות חופפות](#שינוי-שם-בטבלאות-חופפות)
      - [העלאת הגיבוי](#העלאת-הגיבוי)
      - [שחזור DSD](#שחזור-DSD)
      - [שחזור ERD](#שחזור-ERD)
    - [אינטגרציה](#אינטגרציה)
      - [יצירת ERD משותף](#יצירת-ERD-משותף)
      - [יצירת DSD משותף](#יצירת-DSD-משותף)
      - [העברת המידע](#העברת-המידע)
    - [מבטים](#מבטים)
      - [מבט א](#מבט-א)
        -  [יצירה](#יצירה)
        - [שאילתות](#שאילתות) 
      - [מבט ב](#מבט-ב)
        -  [יצירה](#יצירה)
        - [שאילתות](#שאילתות) 

## מבוא 
המערכת שלנו עוסקת בניהול מערכות המידע של תכניות אימון (כושר) אישיות, וכוללת את הישויות הבאות:
מדריכים, מתאמנים, אימונים (סוגי אימון - זומבה, יוגה...), אימונים בפועל (אימון מסויים בין מאמן ומתאמן) וכן את אביזרי הכושר עבור כל אימון.
בהמשך נציג שאילתות שונות שיעזרו לנו לדלות מידע מהנתונים וכן לערוך שינויים על הטבלאות הקיימות..

#


## שלב א

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


## שלב ב

## הרצת השאילתות
### הרצת שאילתות ללא פרמטרים
  -  שאילתא למציאת השכר הממוצע, המינימימלי והמקסימלי של מאמנים שאימנו בשנה האחרונה, עבור כל רמת ותק במיון בסדר עולה לפי רמת הותק: 
![ממוצע](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/7bdc8fcc-91be-442b-a19d-892909ab3b76)

  - שאילתא למציאת סוג האימון המשתמש במשקל הכולל הכבד ביותר של פריטים, מהו המשקל הכולל, וכמה פעמים נלקח סוג האימון הזה בפועל:
![משקל מקסימלי](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/6d27d22d-73bf-4c74-b4ad-6ff879354a5c)

  - שאילתא למציאת זוגות תעודות זהות של מאמנים ומתאמנים כך שהמאמן אימן את המתאמן יותר מפעם אחת, וכמה פעמים בפועל הם התאמנו יחד:
![יותרמאימוןאחד](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/5f00e28c-456a-4e30-9b58-982ff0065de7)

  - שאילתא למציאת החודש שבו סוג אימון מסוים חזר על עצמו הכי הרבה פעמים, סוג האימון וכמה פעמים הוא בוצע:
![חודש פופולארי](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/da46f084-dc6c-4647-8a02-921b6b90ebec)


### הרצת שאילתות עם פרמטרים

- שאילתא למציאת סוג האימון, משך האימונים הממוצע מסוג זה ומספר האימונים בפועל מסוג אימון ספציפי:
  - הרצה:
  ![הרצה1](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/94393a61-c2d4-4c1b-a570-b72e44d40bea)

  - תוצאה:
 ![תוצאה 1](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/ccdcaea3-962d-4ced-96ad-b6d0cba19bf1)

  
- שאילתא למציאת השם הפרטי, שם המשפחה, סוג האימון ותאריך האימון עבור כל האימונים בפועל שהתרחשו בטווח תאריכים מסויים:
  - הרצה:
  ![הרצה2](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/ca215009-1485-4179-b15f-2d867b3c2f64)

  - תוצאה:
  ![תוצאה2](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/0ee356d4-67ec-471b-856d-4ec4250b95dc)

- שאילתא למציאת שם הפריט, המטרה ומספר האימונים המשתמשים בפריט, מתוך רשימת קודי אימונים:
  - הרצה:
 ![הרצה3](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/3331e4e2-f2c5-4174-9fdd-b97de267c42e)

  - תוצאה:
  - ![תוצאה3](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/ccfa4d20-3b1a-461e-a765-a07634c72af5)

- שאילתא להצגת פרטי מאמנים שהדירוג שלהם גדול או שווה לערך דירוג מינימלי, עם אפשרות למיון בסדר עולה\יורד לפי ותק ודירוג:
  - הרצה:
  ![הרצה4](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/712f44b2-df4b-4963-a85e-e54232622f94)

  - תוצאה:
![תוצאה4](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/02a29108-498d-4cdf-9f4a-b36d26840f74)

### הרצת שאילתות עדכון
- שאילתא המעלה את השכר ב-10% למאמנים בעלי הוותק והדירוג הגבוהים ביותר:
 ![עדכון1](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/70ae2863-7d6b-472e-9258-97ed782dd6a7)

 
  - בסיס הנתונים לפני העדכון:
    ![עדכון לפני 1](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/2ae6165e-e921-438d-beb6-e4299bf3108c)

  - בסיס הנתונים אחרי העדכון:
    ![עדכון אחרי 1](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/1d0d4742-21e7-4854-a4cf-04db0e25814d)


- שאילתא לעדכון עלות האימון (50% הנחה) עבור מפגשים עתידיים שבהם למתאמן יש יום הולדת באותו החודש של האימון:
![עדכון2](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/b67928e7-8aa5-449d-88a9-23bca3fb36ed)

  - בסיס הנתונים לפני העדכון:
![עדכון 2 טבלת אנשים](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/189b9719-2b20-45ae-8c4c-7b2234bda25b)
![עדכון לפני 2](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/b18ec517-62dd-4acd-bf14-c592488d0d9d)

  - בסיס הנתונים אחרי העדכון:
![עדכון אחרי 2](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/a5f5e039-eff3-4ede-8df4-91a2ddfa64e0)


### הרצת שאילתות מחיקה
- שאילתא למחיקת מאמנים מעל גיל 90 ומתאמנים מגיל 120:
- ![מחיקה 1](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/54fd879f-0a0a-4aa2-8e0b-b5c7e1c056af)

  - בסיס הנתונים לפני המחיקה:
![מחיקה לפני 1](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/79acaefa-4d42-41af-bd03-9c4388d1821c)

  - בסיס הנתונים אחרי המחיקה:
![מחיקה אחרי 1](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/13d1b4f7-88f0-44fb-a350-be362a9f569b)



- שאילתא למחיקת פריטים שלא השתמשו בהם באף אימון, אין להם משקל ויש לפחות 50 פריטים מאותו סוג:
![מחיקה 2](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/62ac6440-a3b1-46f6-b6f9-5f2b6f7e489a)

  - בסיס הנתונים לפני המחיקה:
![מחיקה לפני 2](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/c04bcdb0-d0ee-405e-9bf0-580141553656)

  - בסיס הנתונים אחרי המחיקה:
![מחיקה אחרי 2](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/b396fc94-9c73-41c9-9a51-0da88418667e)


## הוספת constrains
- תנאי לבדיקה שמטרת הפריט (ITEM.PURPOSE) אינה NULL:
- 
![אילוץ1אלטר](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/40460673-86ca-435a-9bea-0bdd2dc68460)

 - הפרת התנאי:
 - 
![אילוץ1](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/71fa34ec-f79e-44ae-8570-e89696bb5ab1)


- תנאי להשמת ערך ברירת מחדל "no-constraints" במקרה ולא הוכנס ערך לשדה constraint באימון:
- 
![אילוץ2אלטר](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/4ff229c6-8cd5-4755-9ecd-2c5e0b076f27)

 - ביצוע התנאי:
 - 
![אילוץ2](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/5382824b-499f-4a34-a104-afa317dd2bd3)


- תנאי לבדיקה שבאימון בפועל מאמן לא מאמן את עצמו:
- 
![אילוץ3אלטר](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/cd2d50d3-f914-4317-af09-6b73d434e028)

- הפרת התנאי:
- 
![אילוץ3](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/79e7bef5-d78c-43bd-bb3e-e01dfd925b2a)



## שלב ג 

### פונקציות

### פונקציה א:
 - הפונקציה מחזירה תז של אדם שהשתתף באימון הכי הרבה פעמים בין תאריכים המוכנסים כקלט (או מאמן שאימן הכי הרבה אימונים או מתאמן שהתאמן הכי הרבה פעמים).

   - קוד הפונקציה:

 
![part1](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/8cc0c6d9-4446-43aa-adac-3d3d1d916691)

![part2](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/630e4757-9bc1-4b38-96c8-74c232314414)

![part3](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/db153df1-52b9-4c99-832f-ca508960bc24)


  - הרצת הפונקציה:
    

![run](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/ee54d00a-958c-47b6-9d2c-b2fd6bc00fbd)

  - תוצאה:
      
![result](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/47aa9987-3a63-4f24-a18f-66a4b88cd5fb)



### פונקציה ב:
 - הפונקציה מקבלת תז של מאמן. אם התז לא שייכת למאמן היא זורקת חריגה. עבור אותו מאמן, הפונקציה מחזירה טבלה עבור חמשת החודשים האחרונים ועבור כל חודש סך ההכנסות ממנו נטו (כלומר כמה הרוויחו משיעורים שנתן פחות כמה שילמו לו).

   - קוד הפונקציה:
     
![part1](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/ddacc5d1-f87b-44cf-a045-a09ad35d8e7f)

 ![part2](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/8af801a7-6eaf-4335-8b2d-3e6277a02dfd)



  - הרצת הפונקציה:    

![run](https://github.com/sasa81818/DBProject_322451444_325324374/assets/101480321/849c28cc-6a37-4318-8772-34d4a74c8a66)

  - תוצאה:

![res](https://github.com/sasa81818/DBProject_322451444_325324374/assets/101480321/71fb765e-c59c-4145-ac1f-2092a535a3f0)

 - הרצת הפונקציה עם תז שגויה:
    
![error](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/51c57f58-2790-4d08-bffe-8867964c608c)


### פרוצדורות

### פרוצדורה א:
 - פרוצדורה המקבלת כקלט חודש, מספר אימונים ושנה. הפרוצדורה בודקת תקינות קלט, במידה והקלט לא תקין זורק חריגה. הפרוצדורה מעדכנת עבור מאמנים שבחודש שנשלח בשנה שנשלחה אימנו כמס' הפעמים שנשלח או יותר את הדירוג שלהם. במידה והדירוג הינו כבר המקסימלי המאמן מקבל העלאה של 5% בשכר. הפרוצדורה מדפיסה הודעה מתאימה וכן סיכום של המאמנים שעודכנו. במידה ולא נמצאו מאמנים הפרוצדורה זורקת חריגה.

   - קוד הפרוצדורה:

![proc1 part1](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/6f2c680d-6c56-47e6-a834-50fdea7192da)
  
![proc1 part2](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/8aa59a1a-ee5b-45fe-a8dc-d8a25846b360)

 ![proc1 part3](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/9fce8a45-c1c7-4600-b30d-140745848f00)

![proc1 part4](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/5a9886c4-1fe8-4dfc-9891-d7240803ab5d)




   ####  בסיס הנתונים לפני הרצת הפרוצדורה:
   -  שאילתת עזר:

 ![help procedure 1](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/eef0558c-7594-4bdd-b889-f9104992b3ed)

   - פרטי המאמנים והאימונים:

![details of trainers before procedure 1](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/183746e3-fef0-4efd-82bc-fe683ed50076)


![procedure 1 names of coaches](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/c568a71b-c1cd-4923-8f7c-a98cbf820d24)


![procedure 1 actual training show relevant ids](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/96e481b3-cdda-4916-82b0-dc006698f613)



  - הרצת הפרוצדורה:
    
![test run procedure 1](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/77c2dcb7-aa94-439f-abee-46cb3db61488)


  - תוצאה:
      
![test result procedure 1](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/5b7bccd8-0f59-41e5-b04f-58dd3bb4248f)

  - בסיס הנתונים לאחר העדכון:

![procedure 1 after](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/46139791-0a4d-44a6-9453-5833c80ed2f5)

   - הרצת הפרוצדורה עם חודש שבו אין מאמנים מתאימים:
  
![procedure 1 error](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/16b3de59-f5db-445c-baa2-1004f44a7872)




### פרוצדורה ב:
- פרוצדורה המקבלת כקלט סוג אימון וחודש. הפרוצדורה בודקת תקינות קלט, במידה והקלט לא תקין זורקת חריגה. הפרוצדורה נותנת הנחה של 20% עבור אימונים בפועל מסוג האימון שנשלח בחודש הנתון בשנה הקרובה. הפרוצדורה מדפיסה הודעה מתאימה עם מס' האימונים שקיבלו הנחה. במידה ולא נמצאו אימונים שמגיעה להם הנחה, הפרוצדורה זורקת חריגה.
   
   - קוד הפרוצדורה:
     
![part1](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/bd223a78-32b0-41a3-838d-523c202dbdc5)


![part2](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/0299ba4b-18a0-4e88-acc9-a5da303c9011)


![part3](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/4f3870af-2a91-49cf-8d15-c781daf81750)



   ####  בסיס הנתונים לפני הרצת הפרוצדורה:
  
   - פרטי האימונים:
     
![procedure 2 training code](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/df7fa215-bccc-452c-a56a-d5d1975b2006)


![actual training procedure 2 before](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/e859f75c-c2db-4460-b32d-fe84b84ede23)



  - הרצת הפרוצדורה:

![test](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/c96816e0-121e-4d1c-a480-86ec61c4a211)



  - תוצאה:

  ![test results](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/34cf1b5f-5d8d-4a5c-a3a6-f81873c1f4cd)


 - בסיס הנתונים לאחר העדכון:

![procedure 2 after](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/75c17f69-2e7d-4b82-a7c2-71958a5214b8)



 - הרצת הפרוצדורה עם חודש שבו אין אימונים מתאימים:
      
![error](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/227e92b6-4d10-4bce-9f0d-c2d6fe4e1dbc)


### תכניות ראשיות



### תכנית ראשית א:
 - התכנית הראשית קוראת לפונקציה-mostActivePerson כדי למצוא את האדם הפעיל ביותר ב-12 החודשים האחרונים. אם האדם הפעיל ביותר הוא (גם) מאמן, היא מוצאת את החודש והשנה עם המספר המרבי של אימונים עבור מאמן זה. לאחר מכן הוא קורא לפרוצדורה UpdateCoachRatings עם מספר החודשים, השנה וספירת האימונים שנמצאו (כך שבטוח הוא יתעדכן). אם האדם הפעיל ביותר אינו מאמן, היא רק מדפיסה הודעה מתאימה. לבסוף, היא מחזירה את תעודת הזהות של האדם הפעיל ביותר.

   - קוד התכנית:

![part1](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/e519c258-1b89-4eee-8dad-8361612a5d7e)


![part2](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/762b9737-0767-43a3-abf1-96a7143825e5)



   ####  בסיס הנתונים לפני הרצת התכנית:
   

   - פרטי המאמנים והאימונים:
     
![before](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/92dede21-786a-4dfd-b2f3-f562d90630a3)

![before 2](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/594a930b-cbf1-4a4e-9b93-5f933b2d3ea2)



  - הרצת התכנית:

![test](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/5f77303f-2880-4d83-a14f-b0dd7d4cf2ea)


  - תוצאה:
      
![result](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/9e55a8dc-48a4-4265-86c2-9927ef772a6d)


  - בסיס הנתונים לאחר העדכון:


![after](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/26ecdb81-7af0-4c24-92a4-68ddd9b00da2)


### תכנית ראשית ב:
- התכנית הראשית קוראת לGet_Trainer_Net_Earning עבור כל המאמנים בבסיס הנתונים ובודקת מי המאמן עם ממוצע הרווחים הגבוה ביותר. עבורו היא מחפשת את סוג האימון שהוא נותן הכי הרבה פעמים בשנה הקרובה, ועבור סוג אימון זה קוראת לפרוצדורה apply_training_discount בחודש אוגוסט. (מבצע קיץ)
   
   - קוד התכנית:     

![part1](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/eee6ca21-6b45-4915-a7ea-317bbc346fd4)

![part2](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/25f38706-4144-4e74-a269-03f62ecc9ce3)

![part3](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/b8b3a38c-f986-471a-ac50-7cce6780b7b6)

![part4](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/8a106a61-b32a-413e-930a-e7c374f65349)



   ####  בסיס הנתונים לפני הרצת התכנית:
  
   - פרטי האימונים (שאילתת עזר):
     
![before](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/13ab625a-aae5-4fb9-9741-1a99cc314c75)




  - הרצת התכנית:

![image](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/733f4ff6-67a6-404e-9a4f-b58d0dc5889a)



  - תוצאה:

![image (1)](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/a35120f1-9d41-48bd-998e-0dfad825826b)




 - בסיס הנתונים לאחר העדכון:


![Screenshot 2024-06-24 175552](https://github.com/sasa81818/DBProject_322451444_325324374/assets/116828618/a6daf774-49b2-426c-93e2-c382c1d79734)


## שלב ד

### שחזור המידע

### שינוי שם בטבלאות חופפות

בטבלאות שקיבלנו היו שתי טבלאות עם שמות חופפים, בכדי לא לדרוס את המידע השמור בטבלאות שלנו, שיננו להן את השם באופן זמני:

![rename](https://github.com/user-attachments/assets/7f385ee3-651a-4436-892f-960372f86907)

### העלאת הגיבוי

![import](https://github.com/user-attachments/assets/e5a8e19b-a305-4173-8611-7a9865e07617)

### שחזור DSD

![ERD נועה](https://github.com/user-attachments/assets/a7be57a9-b8a9-40ad-977e-3d4c1415c9fe)

### שחזור ERD
על סמך הקשרים בDSD והמפתחות הזרים, הסקנו שיש קשר של ירושה בין PERSON לTRAINEE וCOACH. הסקנו סכמות של קשרים מסוג רבים לרבים מטבלאות בעלות מפתחות בלבד. הסקנו קשרים של "בדיוק אחד" כאשר לא היתה טבלה לקשר והיה מפתח זר באחד מהן (וכן לפי ההגיון). הסקנו קשר חלש בעקבות השימוש במפתחות של שתי הטבלאות כמפתח הטבלה הראשי:

 ![ERD משוחזר תמונה](https://github.com/user-attachments/assets/cbc08c26-edfd-4e2c-addd-fdc3ab63004d)


### אינטגרציה

### יצירת ERD משותף
נושא הפרויקט שקיבלנו הינו "ניהול חדרי כושר", והנושא שלנו היה "אימונים אישיים". בחרנו לשלב את הפרויקטים כך שהמאמנים והמתאמנים שלנו יהיו גם כן המאמנים והמתאמנים בחדר הכושר של הפרויקט שקיבלנו (פירוט לגבי שיקול הדעת בנוגע לשדות הישויות הרלוונטיות יפורט להלן).

  ![united](https://github.com/user-attachments/assets/f0c62533-db57-4410-9a00-4dd47714f2ab)

### יצירת DSD משותף

![DSD מאוחד](https://github.com/user-attachments/assets/a41e900f-f0ee-464a-995a-bbf72f4b8c8f)

### העברת המידע

הטבלאות בינהן היינו צריכות להעביר מידע היו PERSON, COACH וTRAINEE

#### PERSON
- הטבלה שקיבלנו:

    ![פרסון שלהם](https://github.com/user-attachments/assets/b0c148d8-be17-4117-ab85-8fef1ef4d21f)

- הטבלה שלנו:
    
    ![פרסון לפני השינויים](https://github.com/user-attachments/assets/16775084-ee18-4387-9fdc-55888145a05d)

- השינויים:
  
    ![פרסון אחרי השינויים](https://github.com/user-attachments/assets/12745292-969d-4be4-b7df-36f3fc0b3d1a)

    ![השינויים של פרסון](https://github.com/user-attachments/assets/3dbcefd0-5953-4909-b1b9-6322be5b4a12)

- השיקולים: בכל השדות עם הגבלת הגודל שינינו לגדול מבין 2 הטבלאות (כגון מ9 ל10 ומ30 ל50 וכו). שדות שלנו שהשארנו ולא היו להן הפכנו לnullable כדי שלא תהיה בעיה בהעברת המידע שלהן אלינו. וכן הוספנו שדה חדש nullable מהטבלה שלהן (מגדר). בחרנו להכניס את full name שלהן לfirst name שלנו, ולהפוך את שם משפחה לnullable וכן את הכתובות שלהן להכניס לstreet שלנו (מבחינת הנתונים בטבלה זה היה הגיוני) ולהפוך את city ו house number לnullable.

- בדיקת כמות הנתונים קודם העברת הנתונים:
  
![כמות בפרסון1](https://github.com/user-attachments/assets/33d76e68-2533-4b85-b824-0b1f6df20906)

![כמות בפרסון](https://github.com/user-attachments/assets/1366de31-b24e-428d-8407-576663be497b)

- בדיקה שאין מפתחות חופפים (כפילויות במפתח):

![אין מידע חופף מבחינת מפתח](https://github.com/user-attachments/assets/465b195b-f4ae-4bda-98f0-17c903fa6c29)

- העברת הנתונים:
  
![הכנסה לפרסון1](https://github.com/user-attachments/assets/2d746bbb-faae-4150-98af-cb921d6f2ff4)

- בדיקה:

![הפריטים נוספו לפרסון1](https://github.com/user-attachments/assets/08a67c0d-2dd4-43ef-b0c9-dddedcde929e)

- הטבלה המאוחדת:

![הטבלה המאוחדת פרסון](https://github.com/user-attachments/assets/7f614d0a-6771-4f89-8480-6c6dd83ff95f)


#### TRAINEE

- הטבלה שקיבלנו:
- 
![טרייני שלהם](https://github.com/user-attachments/assets/19e56e88-a27f-40e1-b0e7-3cd7751b7909)

- הטבלה שלנו:
- 
    ![טרייני לפני השינויים](https://github.com/user-attachments/assets/1959fec2-cffd-4142-9008-9ccb40617327)

- השינויים:
- 
  ![טרייני אחרי השינויים](https://github.com/user-attachments/assets/074638b4-1d5d-4ab0-b5b5-d481ad6f4a07)
  
![השינויים של טרייני](https://github.com/user-attachments/assets/d9facbd4-211f-49b2-a3eb-797ec5b5d972)


- השיקולים: בכל השדות עם הגבלת הגודל שינינו לגדול מבין 2 הטבלאות (כגון מ9 ל10 ומ30 ל50 וכו). הוספנו שדות חדשים nullable מהטבלה שלהן (פרטי תשלום ותכנית אימון). ויתרנו על השדה "גיל" שלהן כיוון שיש לנו בPerson שדה "תאריך לידה"
- בחרנו להמיר את סוג המנוי שלהן למשך מנוי שלנו. לשם כך בדקנו מהם סוגי המנוי שלהן:
  
![בדיקה בשביל טרייני](https://github.com/user-attachments/assets/eb31f0e4-976f-49d0-9ab8-40adcee32899)

- בדיקת כמות הנתונים קודם העברת הנתונים:

  ![כמות בטרייני1](https://github.com/user-attachments/assets/c1ea20a5-d727-413e-b1c5-7b76d76439b8)

![כמות בטרייני](https://github.com/user-attachments/assets/95226b3f-3fea-4121-8db9-68a757698445)

- העברת הנתונים

![הכנסה לטרייני1](https://github.com/user-attachments/assets/61db3ba9-8bd1-4a19-8b55-ef096a57bd36)
  
- בדיקה:

![הפריטים נוספו לטרייני 1](https://github.com/user-attachments/assets/bd991461-6de3-494e-b13d-a7213544dec5)

- הטבלה המאוחדת:
  
![הטבלה המאוחדת טרייני](https://github.com/user-attachments/assets/21dc6455-7d42-4824-a044-3ee7c39388f2)


#### TRAINER

- הטבלה שקיבלנו:
- 
  ![Screenshot 2024-07-21 014406](https://github.com/user-attachments/assets/e497fdf6-2c71-49cf-876f-2a978db74a49)

- הטבלה שלנו:
  
  ![טריינר לפני השינוי](https://github.com/user-attachments/assets/7c49c09f-5e9b-48a9-aa10-f6144b16d04b)

- השינויים:
  
![טריינר אחרי שינויים](https://github.com/user-attachments/assets/5654697b-4874-4f85-8071-db53b155f291)

![השינויים של טריינר](https://github.com/user-attachments/assets/d17e9499-4352-4878-8487-6519d51f7f89)

- השיקולים: בכל השדות עם הגבלת הגודל שינינו לגדול מבין 2 הטבלאות (כגון מ9 ל10 ומ7 ל15 וכו). הוספנו שדות חדשים nullable מהטבלה שלהן (התמחות וניסיון). את השדה "רייטינג" שלנו הפכנו לnullable. 
- כיוון שלהן היה "ניסיון" כמחרוזת, ולנו היה "ותק" כמס' (שנים) בחרנו להמיר את המידע שלנו למחרוזת ולמחוק את העמודה המקורית שלנו:
    - המרה למחרוזת:
 ![המרת הניסיון לוותק שלב 1](https://github.com/user-attachments/assets/9f613fe1-e031-4c7d-8ce9-dd710d47bce3)

    - מחיקת העמודה המקורית:
 
      ![המרת הניסיון לוותק שלב 2](https://github.com/user-attachments/assets/d377c29f-a652-4438-99aa-71c465ba75ba)

  - הטבלה אחרי השינויים הנוספים:
  - 
![טריינר אחרי השינויים הנוספים](https://github.com/user-attachments/assets/5f30e931-d35b-44f0-9436-da8876fa133b)

- בדיקת כמות הנתונים קודם העברת הנתונים:
  
![כמות בטריינר](https://github.com/user-attachments/assets/fde2ff61-b2c2-4ec6-b5df-aa7a3a9ef0a4)

  ![כמות בקואצ](https://github.com/user-attachments/assets/ee8cc080-b939-4099-8ec2-a7348677b9e4)

- העברת הנתונים

  ![הכנסה לטריינר](https://github.com/user-attachments/assets/5c0e56bd-b080-463f-857e-b0ec28b13046)

- בדיקה:

![הפריטים נוספו לטריינר](https://github.com/user-attachments/assets/caf6b937-845f-4d9c-a469-54c3e45da5f1)

- הטבלה המאוחדת:

![הטבלה המאוחדת טריינר](https://github.com/user-attachments/assets/7a488191-6f57-43b1-9bbd-3a2db04a2ea5)


#### טיפול במפתחות זרים לאחר שינוי הטבלאות:
- בטבלאות בהן המפתחות של אחת הטבלאות הרלוונטיות היוו מפתחות זרים, מחקנו את המפתחות המקוריים ויצרנו מפתח זר חדש לטבלאות שלנו אליהן העברנו את המידע:
- הטבלה takes:
  
  ![טייקס עם מפתח זר לטרייני](https://github.com/user-attachments/assets/34647d86-5c03-4094-b615-8732718c54eb)
  
![טיפול במפתח זר בטייקס](https://github.com/user-attachments/assets/70523999-b70c-4c5d-95b6-a99dc7a3bbe0)

![מחיקת מפתח זר ישן טייקס](https://github.com/user-attachments/assets/86da8a1d-b733-4b6b-aaea-2fa5c7637a61)

![המפתח הזר עודכן בטייקס](https://github.com/user-attachments/assets/78fa9742-d3ed-491e-97bf-3c64aec5ff6f)


- הטבלה trains in:
  
 ![טריינס אין לפני שינוי מפתח זר](https://github.com/user-attachments/assets/edc96a11-ebe5-4dc1-8b87-7626481a6c29)

![קוד של שינוי מפתח זר טריינס אין](https://github.com/user-attachments/assets/00f1f20c-7611-4457-85cf-0e784acb82db)

![מפתח זר טריינס אין הוסר](https://github.com/user-attachments/assets/1f1b7730-54d4-4dff-ae80-cc12b994f2ef)

![מפתח זר בטריינס אין עודכן](https://github.com/user-attachments/assets/0cdaaea7-4174-466f-ac67-a801013896ed)


- הטבלה class lesson:
  
![קלאסלסון מפתח זר](https://github.com/user-attachments/assets/4fb79c53-809b-4daa-9bf5-4a9945ebe8b7)

![קוד של שינוי מפתח זר קלאסלסון](https://github.com/user-attachments/assets/37c09038-1b02-4fc4-8f4c-0048b2de959c)

![מפתח זר חדש קלאסלסון](https://github.com/user-attachments/assets/c9f75277-5ab2-4f93-a443-412433533ae9)

#### מחיקת הטבלאות המיותרות:

![מחיקת הטבלאות המיותרות](https://github.com/user-attachments/assets/edec27b7-8906-42cf-9e2d-b921201ef954)

#### החזרת השמות המקוריים:

![החזרת השמות המקוריים](https://github.com/user-attachments/assets/568215c1-851d-4478-8d9d-32e2ec82c6a6)

#### בדיקה שכל הקשרים נשמרו לאחר העברת המידע:

![בדיקה שכל הקשרים נשמרו](https://github.com/user-attachments/assets/f94193df-0078-4e9a-b643-72330cb74d45)


### בדיקת השאילתות:
- הבעייתיות היחידה בשאילתות הקיימות שלנו הייתה המרת השדה "ותק" ל"ניסיון":
- 
![כנל שימוש בסניוריטי שאילתות פרמטרים](https://github.com/user-attachments/assets/30baf54c-aa84-438f-aeba-4f3e9161aa59)

![כנל שימוש בסניוריטי](https://github.com/user-attachments/assets/c508a6d0-7695-45eb-bb18-b11c0bc1ffed)

![עדכון שאילתא שהשתמשה בסניוריטי](https://github.com/user-attachments/assets/0082bc37-e4d0-43b6-9f9b-3b18834cc5ee)


## מבטים


### מבט א
מבט המחזיר נתונים של אימונים אישיים. כולל שמות ותז של המאמן והמתאמן, תאריך, שעת ומיקום האימון. מחיר, סוג ומשך האימון בדקות, וכן פריט אימון שנמצא בשימוש באימון זה ומטרתו. 
### יצירה

![create view 1](https://github.com/user-attachments/assets/ab2f1ffd-ca34-475a-bcb7-5adce4088aee)

![view1](https://github.com/user-attachments/assets/a8f2c09f-b32b-4710-9238-ae6fcd82879d)


### שאילתות
- שאילתא א: מחזירה עבור כל מאמן את התז, שמו הפרטי ושם משפחתו וכן את ממוצע המחירים של האימונים שאותו מאמן אימן, ממויין בסדר יורד לפי הממוצע הנ"ל:

- ![query1 view 1](https://github.com/user-attachments/assets/a41104b2-7c86-4a5c-b4c0-862780329df2)

- שאילתא ב: מחזירה עבור כל מתאמן את התז, שמו הפרטי ושם משפחתו וכן את מספר סוגי האימונים בהם השתתף, ממויין בסדר יורד לפי מספר האימונים הנ"ל:
  
![query2 view 1](https://github.com/user-attachments/assets/353bd3b1-5b5c-4fed-8ff5-22dff9f208ce)


### מבט ב
מבט המחזיר נתונים לגבי שיעורים בחדר כושר. מחזיר את מספר השיעור, שמו, היום בשבוע והשעה בה הוא חל. וכן את התז ושמו של המאמן של אותו שיעור, מספר הרשומים לשיעור, מספר ושם חדר הכושר בו השיעור חל וכן מספר המכשירים בהם משתמשים בשיעור.
### יצירה
![create view 2](https://github.com/user-attachments/assets/7894e096-8d06-4a50-9d4b-ddb9a2d85290)

![view2](https://github.com/user-attachments/assets/c8000f3a-d059-4a7d-a33e-98e02ecb3277)


### שאילתות
- שאילתא א: מחזירה את השם והתז של המאמן שמאמן הכי הרבה שיעורים, מספר השיעורים שמאמן וממוצע המשתתפים בשיעורים שלו:
- 
![מבט 2 שאילתא א](https://github.com/user-attachments/assets/bdb22051-3243-4dfa-8ef4-b9d6ef335c4e)

- שאילתא ב: מחזירה לכל חדר כושר את שמו, מספר הזיהוי שלו, מס' סוגי השיעורים השונים שניתנים בו ומתוכם מהו השיעור הפופולארי ביותר (שמתוך סך השיעורים הוא ניתן הכי הרבה), ממויין בסדר יורד לפי מס' השיעורים השונים:
  
![athk,t2](https://github.com/user-attachments/assets/b9ede5c4-7844-4d82-9bdb-6fd40e29ad20)


    
