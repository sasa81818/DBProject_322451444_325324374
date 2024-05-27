
[General]
Version=1

[Preferences]
Username=
Password=2268
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=USES
Count=500

[Record]
Name=TRAINING_CODE
Type=NUMBER
Size=5
Data=List(select Training_Code from Training)
Master=

[Record]
Name=ITEM_CODE
Type=NUMBER
Size=5
Data=List(select Item_Code from Item)
Master=

