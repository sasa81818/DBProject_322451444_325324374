
[General]
Version=1

[Preferences]
Username=
Password=2773
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=PERSON_ANOTHER_PHONE
Count=500

[Record]
Name=ANOTHER_PHONE
Type=NUMBER
Size=13
Data=Random(100000000,999999999)
Master=

[Record]
Name=PERSON_ID
Type=NUMBER
Size=9
Data=List(select Person_ID from Person)
Master=

