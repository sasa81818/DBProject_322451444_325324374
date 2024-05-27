
[General]
Version=1

[Preferences]
Username=
Password=2448
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=ACTUAL_TRAINING
Count=500

[Record]
Name=TRAINING_HOUR
Type=NUMBER
Size=4,2
Data=Random(00.00,23.59)
Master=

[Record]
Name=TRAINING_DATE
Type=DATE
Size=
Data=Random(01/01/2020,01/01/2025)
Master=

[Record]
Name=TRAINING_LOCATION
Type=VARCHAR2
Size=30
Data=﻿List('New York City 1 Wall Street', 'London 8 Canada Square', 'Tokyo 3-14-1 Nishi-Shinjuku Shinjuku-ku', 'Paris 11 Cour Défense Seine Puteaux', 'Singapore 1 Marina Boulevard', 'Sydney 1 Alfred Street Circular Quay',
=  'Berlin Unter den Linden 67-68', 'Dubai Sheikh Zayed Road Emirates Towers', 'Amsterdam Strawinskylaan 3011', 'Barcelona Avinguda Diagonal 408',
=  'Rome Via dei Congressi 33', 'Los Angeles 10233 Constellation Blvd Century City', 'Chicago 200 South Wacker Drive', 'Toronto 125 King Street West', 'San Francisco 1650 Hanover Street Mountain View', 'Buenos Aires Juana Manso 1670 Puerto Madero',
=  'Sֳ£o Paulo Avenida Berrini 660', 'Mexico City Avenida Santa Fe 133 Santa Fe', 'Seoul 50 Yeoksam-dong Gangnam-gu', 'Mumbai G Block Bandra Kurla Complex', 'Shanghai 88 Xinza Road Lujiazui',
=  'Bangkok 990 Silom Road', 'Istanbul Bֳ¼yֳ¼kdere Cadde No:185 Levent', 'Jakarta Jalan Sudirman Kav 52-53', 'Las Vegas 3645 Las Vegas Blvd S Las Vegas Strip', 'Miami 1001 Brickell Ave',
=  'Seattle 520 Westlake Avenue South', 'Denver 1775 Sherman Street Denver Tech Center', 'Austin 9800 Metric Blvd', 'Boston 50 Seaport Boulevard', 'Washington D.C. 1775 K Street NW',
=  'Atlanta 3333 Peachtree Road NE', 'Dallas 2001 McKinney Ave Uptown', 'Detroit 400 Renaissance Center Drive', 'Philadelphia 1500 Market Street',
=  'Phoenix 2400 Biltmore Fashion Park Blvd', 'Houston 3 Greenway Plaza', 'San Diego 1110 Sorrento Valley Blvd', 'Orlando 8282 International Drive', 'Montreal 9100 Boulevard de l Aֳ©roport',
=  'Vancouver 1000 Mainland Street Coal Harbour', 'Calgary 250 Eau Claire Avenue SW', 'Dublin Barrow Street Silicon Docks', 'Vienna Schottenring 16 Vienna 1', 'Brussels Rue de la Loi 175 European Quarter', 'Prague Na Pankrֳ¡ci 178/180 Pankrֳ¡c')
Master=

[Record]
Name=TRAINING_COST
Type=NUMBER
Size=5,2
Data=Random(100.00,600.00)
Master=

[Record]
Name=ACTUAL_TRAINING_CODE
Type=NUMBER
Size=5
Data=Sequence(100, 1)
Master=

[Record]
Name=PERSON_ID1
Type=NUMBER
Size=9
Data=List(select Person_ID from Trainee)
Master=

[Record]
Name=PERSON_ID2
Type=NUMBER
Size=9
Data=List(select Person_ID from Trainer)
Master=

[Record]
Name=TRAINING_CODE
Type=NUMBER
Size=5
Data=List(select Training_Code from Training)
Master=

