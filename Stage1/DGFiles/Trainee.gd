
[General]
Version=1

[Preferences]
Username=
Password=2017
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=TRAINEE
Count=500

[Record]
Name=JOINING_DATE
Type=DATE
Size=
Data=Random(01/01/1964, 01/01/2008)
Master=

[Record]
Name=MEMBERSHIP_LENGTH
Type=NUMBER
Size=4
Data=Random(3,36)
Master=

[Record]
Name=HEALTH_CONDITION
Type=VARCHAR2
Size=20
Data=List('Excellent', 'Good', 'Fair', 'Poor', 'Unknown', 'Excellent, with chronic disease', 'Good, with occasional issues', 'Fair, with moderate health problems', 'Poor, with severe health issues', 'Disabled', 'Recovering from surgery', 'Undergoing treatment', 'Pregnant', 'Elderly', 'Athlete', 'Overweight', 'Underweight', 'Stressed', 'Anxious', 'Depressed', 'Healthy lifestyle', 'Unhealthy lifestyle')
=
=
Master=

[Record]
Name=PERSON_ID
Type=NUMBER
Size=9
Data=List(select Person_ID from Person)
Master=

