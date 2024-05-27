
[General]
Version=1

[Preferences]
Username=
Password=2530
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=TRAINER
Count=500

[Record]
Name=SENIORITY
Type=NUMBER
Size=2
Data=Random(1,20)
Master=

[Record]
Name=SALARY
Type=NUMBER
Size=7,2
Data=Random(2200.00,25000.00)
Master=

[Record]
Name=RATING
Type=NUMBER
Size=1
Data=Random(1,5)
Master=

[Record]
Name=PERSON_ID
Type=NUMBER
Size=9
Data=List(select Person_ID from Person)
Master=

