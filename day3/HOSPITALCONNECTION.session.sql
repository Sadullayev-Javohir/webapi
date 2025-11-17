CREATE TABLE Departments (
  department_id SERIAL PRIMARY KEY,
  department_name VARCHAR(100) NOT NULL,
  location VARCHAR(100) NOT NULL,
  phone VARCHAR(20)
);
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT,
  INSERT,
  UPDATE,
  DELETE ON TABLES TO me;
CREATE TABLE Doctors (
  doctor_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  specialty VARCHAR(100) NOT NULL,
  department_id INT NOT NULL,
  experience_year INT,
  salary DECIMAL(10, 2),
  FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);
CREATE TABLE Patients (
  patient_id serial primary key,
  first_name varchar(50) not null,
  last_name varchar(50) not null,
  date_of_birth DATE not null,
  gender varchar(10),
  phone varchar(20),
  email varchar(100),
  address TEXT
);
CREATE table Appointments (
  appointment_id serial primary key,
  patient_id int not null,
  doctor_id int not null,
  appointment_date timestamp not null,
  reason text,
  status varchar(20) default 'scheduled',
  FOREIGN KEY (patient_id) references Patients(patient_id),
  foreign key (doctor_id) references Doctors(doctor_id)
);
create table MedicalRecords(
  record_id serial primary key,
  appointment_id int unique not null,
  diagnosis text not null,
  treatment text,
  prescription text,
  notes text,
  foreign key (appointment_id) references Appointments(appointment_id)
);
-- Departments jadvali uchun 100 ta ma'lumot
INSERT INTO Departments (department_name, location, phone)
VALUES ('Kardiologiya', 'Bino A, 1-qavat', '901-0001'),
  ('Jarrohlik', 'Bino A, 2-qavat', '901-0002'),
  ('Pediatriya', 'Bino B, 1-qavat', '901-0003'),
  ('Nevrologiya', 'Bino B, 2-qavat', '901-0004'),
  ('Travmatologiya', 'Bino C, 1-qavat', '901-0005'),
  ('Onkologiya', 'Bino C, 2-qavat', '901-0006'),
  ('Stomatologiya', 'Bino D, 1-qavat', '901-0007'),
  ('Oftalmologiya', 'Bino D, 2-qavat', '901-0008'),
  (
    'ENT (Quloq, burun, tomoq)',
    'Bino E, 1-qavat',
    '901-0009'
  ),
  ('Pulmonologiya', 'Bino E, 2-qavat', '901-0010'),
  (
    'Gastroenterologiya',
    'Bino F, 1-qavat',
    '901-0011'
  ),
  ('Endokrinologiya', 'Bino F, 2-qavat', '901-0012'),
  ('Nefrologiya', 'Bino G, 1-qavat', '901-0013'),
  ('Reumatologiya', 'Bino G, 2-qavat', '901-0014'),
  ('Dermatologiya', 'Bino H, 1-qavat', '901-0015'),
  ('Psixiatriya', 'Bino H, 2-qavat', '901-0016'),
  ('Fizioterapiya', 'Bino I, 1-qavat', '901-0017'),
  ('Laboratoriya', 'Bino I, 2-qavat', '901-0018'),
  ('Rentgenologiya', 'Bino J, 1-qavat', '901-0019'),
  ('UZI bo''limi', 'Bino J, 2-qavat', '901-0020'),
  ('Kardiologiya', 'Bino K, 1-qavat', '901-0021'),
  (
    'Infeksion kasalliklari',
    'Bino K, 2-qavat',
    '901-0022'
  ),
  ('Immunologiya', 'Bino L, 1-qavat', '901-0023'),
  ('Allergologiya', 'Bino L, 2-qavat', '901-0024'),
  ('Andrologiya', 'Bino M, 1-qavat', '901-0025'),
  ('Ginekologiya', 'Bino M, 2-qavat', '901-0026'),
  ('Akusherlik', 'Bino N, 1-qavat', '901-0027'),
  ('Neonatologiya', 'Bino N, 2-qavat', '901-0028'),
  (
    'Pediatrik nevrologiya',
    'Bino O, 1-qavat',
    '901-0029'
  ),
  (
    'Pediatrik kardiologiya',
    'Bino O, 2-qavat',
    '901-0030'
  ),
  (
    'Stomatologik ortopediya',
    'Bino P, 1-qavat',
    '901-0031'
  ),
  (
    'Stomatologik jarrohlik',
    'Bino P, 2-qavat',
    '901-0032'
  ),
  (
    'Periodontal kasalliklari',
    'Bino Q, 1-qavat',
    '901-0033'
  ),
  ('Ortodontiya', 'Bino Q, 2-qavat', '901-0034'),
  (
    'Jarrohlik (Vaskular)',
    'Bino R, 1-qavat',
    '901-0035'
  ),
  (
    'Jarrohlik (Umumiy)',
    'Bino R, 2-qavat',
    '901-0036'
  ),
  (
    'Jarrohlik (Torakalni)',
    'Bino S, 1-qavat',
    '901-0037'
  ),
  (
    'Jarrohlik (Abdominalni)',
    'Bino S, 2-qavat',
    '901-0038'
  ),
  ('Neyrochirurgiya', 'Bino T, 1-qavat', '901-0039'),
  ('Urologiya', 'Bino T, 2-qavat', '901-0040'),
  (
    'Plasitik jarrohlik',
    'Bino U, 1-qavat',
    '901-0041'
  ),
  ('Kosmetologiya', 'Bino U, 2-qavat', '901-0042'),
  ('Proktologiya', 'Bino V, 1-qavat', '901-0043'),
  (
    'Anorektal kasalliklari',
    'Bino V, 2-qavat',
    '901-0044'
  ),
  (
    'Intensiv terapiya',
    'Bino W, 1-qavat',
    '901-0045'
  ),
  ('Reanimatsiya', 'Bino W, 2-qavat', '901-0046'),
  ('Anesteziya', 'Bino X, 1-qavat', '901-0047'),
  (
    'Terapiya (Umumiy)',
    'Bino X, 2-qavat',
    '901-0048'
  ),
  (
    'Kariyera tibbiyoti',
    'Bino Y, 1-qavat',
    '901-0049'
  ),
  (
    'Sportlarni tibbiyoti',
    'Bino Y, 2-qavat',
    '901-0050'
  ),
  ('Psixologiya', 'Bino Z, 1-qavat', '901-0051'),
  (
    'Refleksoterapiya',
    'Bino AA, 1-qavat',
    '901-0052'
  ),
  ('Akupunktura', 'Bino AA, 2-qavat', '901-0053'),
  ('Gidroterapiya', 'Bino BB, 1-qavat', '901-0054'),
  (
    'Massaj terapiya',
    'Bino BB, 2-qavat',
    '901-0055'
  ),
  (
    'Fiziokineziterapiya',
    'Bino CC, 1-qavat',
    '901-0056'
  ),
  (
    'Ishlov beruvchi terapiya',
    'Bino CC, 2-qavat',
    '901-0057'
  ),
  ('Nutritsiya', 'Bino DD, 1-qavat', '901-0058'),
  ('Dietetika', 'Bino DD, 2-qavat', '901-0059'),
  (
    'Laboratoriya (Himiyaviy analiz)',
    'Bino EE, 1-qavat',
    '901-0060'
  ),
  (
    'Laboratoriya (Mikrobiologiya)',
    'Bino EE, 2-qavat',
    '901-0061'
  ),
  (
    'Laboratoriya (Immunologiya)',
    'Bino FF, 1-qavat',
    '901-0062'
  ),
  (
    'Laboratoriya (Hematologiya)',
    'Bino FF, 2-qavat',
    '901-0063'
  ),
  ('Virusologiya', 'Bino GG, 1-qavat', '901-0064'),
  ('Bakteriologiya', 'Bino GG, 2-qavat', '901-0065'),
  ('Parazitologiya', 'Bino HH, 1-qavat', '901-0066'),
  ('Mikologiya', 'Bino HH, 2-qavat', '901-0067'),
  ('Patologiya', 'Bino II, 1-qavat', '901-0068'),
  (
    'Gistopatologiya',
    'Bino II, 2-qavat',
    '901-0069'
  ),
  ('Tsitologiya', 'Bino JJ, 1-qavat', '901-0070'),
  ('Genetika', 'Bino JJ, 2-qavat', '901-0071'),
  (
    'Radiyatsion oncologiya',
    'Bino KK, 1-qavat',
    '901-0072'
  ),
  ('Kemoterapiya', 'Bino KK, 2-qavat', '901-0073'),
  (
    'Hemato-Oncologiya',
    'Bino LL, 1-qavat',
    '901-0074'
  ),
  ('Immunoterapiya', 'Bino LL, 2-qavat', '901-0075'),
  (
    'Giperterma terapiya',
    'Bino MM, 1-qavat',
    '901-0076'
  ),
  (
    'Radionuklid terapiya',
    'Bino MM, 2-qavat',
    '901-0077'
  ),
  (
    'Fotodinamik terapiya',
    'Bino NN, 1-qavat',
    '901-0078'
  ),
  ('Laser terapiya', 'Bino NN, 2-qavat', '901-0079'),
  ('Krioterapiya', 'Bino OO, 1-qavat', '901-0080'),
  (
    'Ultrashumdagi likishlar',
    'Bino OO, 2-qavat',
    '901-0081'
  ),
  (
    'Radyofrekentsiyaviy ablatsiya',
    'Bino PP, 1-qavat',
    '901-0082'
  ),
  ('Embolizatsiya', 'Bino PP, 2-qavat', '901-0083'),
  ('Stenting', 'Bino QQ, 1-qavat', '901-0084'),
  ('Angiografiya', 'Bino QQ, 2-qavat', '901-0085'),
  ('Endoskopiya', 'Bino RR, 1-qavat', '901-0086'),
  ('Kolonoskopiya', 'Bino RR, 2-qavat', '901-0087'),
  ('Bronkoskopiya', 'Bino SS, 1-qavat', '901-0088'),
  ('Laryngoskopiya', 'Bino SS, 2-qavat', '901-0089'),
  ('Cystoskopiya', 'Bino TT, 1-qavat', '901-0090'),
  ('Laparoskopiya', 'Bino TT, 2-qavat', '901-0091'),
  ('Arthroskopiya', 'Bino UU, 1-qavat', '901-0092'),
  (
    'Spinal punksiya',
    'Bino UU, 2-qavat',
    '901-0093'
  ),
  ('Biopsiya', 'Bino VV, 1-qavat', '901-0094'),
  (
    'Tutunshumo qoldirish',
    'Bino VV, 2-qavat',
    '901-0095'
  ),
  (
    'Alkogol solishtirmaslantirish',
    'Bino WW, 1-qavat',
    '901-0096'
  ),
  (
    'Narkomaliyaga qarshi kurash',
    'Bino WW, 2-qavat',
    '901-0097'
  ),
  (
    'Uyg''unlashtirish terapiyasi',
    'Bino XX, 1-qavat',
    '901-0098'
  ),
  (
    'Shaxs hygienasi',
    'Bino XX, 2-qavat',
    '901-0099'
  ),
  ('Oila sog''ligi', 'Bino YY, 1-qavat', '901-0100');
-- Doctors jadvali uchun 100 ta ma'lumot
INSERT INTO Doctors (
    first_name,
    last_name,
    specialty,
    department_id,
    experience_year,
    salary
  )
VALUES ('Ali', 'Valiyev', 'Kardiolog', 1, 15, 8500000),
  (
    'Nodira',
    'Soliyeva',
    'Umumiy Jarroh',
    2,
    12,
    7200000
  ),
  ('Sanjar', 'Karimov', 'Pediatr', 3, 10, 6500000),
  ('Kamola', 'Azizova', 'Nevrolog', 4, 14, 8000000),
  ('Rustam', 'Ahmedov', 'Kardiolog', 1, 18, 9200000),
  ('Malika', 'Usmonova', 'Onkolog', 6, 16, 8800000),
  (
    'Timur',
    'Yusupov',
    'Travmatolog',
    5,
    13,
    7800000
  ),
  (
    'Zarina',
    'Abdullayeva',
    'Pediatr',
    3,
    11,
    6800000
  ),
  (
    'Bekzod',
    'Rahmatov',
    'Neyrochirurg',
    2,
    17,
    9500000
  ),
  (
    'Sarvinoz',
    'Olimova',
    'Stomatolog',
    7,
    9,
    6200000
  ),
  (
    'Mahmud',
    'Toshmatov',
    'Oftalmolog',
    8,
    12,
    7500000
  ),
  (
    'Gulnora',
    'Ibrahimova',
    'ENT shifokor',
    9,
    10,
    6700000
  ),
  (
    'Davron',
    'Mirjalilov',
    'Pulmonolog',
    10,
    14,
    8100000
  ),
  (
    'Shahnoza',
    'Qoriyeva',
    'Gastroenterolog',
    11,
    13,
    7900000
  ),
  (
    'Ismail',
    'Sheriyev',
    'Endokrinolog',
    12,
    15,
    8400000
  ),
  (
    'Fotima',
    'Abdulloyeva',
    'Nefrologiya',
    13,
    11,
    7100000
  ),
  (
    'Firdavs',
    'Raxmonov',
    'Revmatolog',
    14,
    12,
    7400000
  ),
  (
    'Nilufar',
    'Hasanova',
    'Dermatolog',
    15,
    10,
    6600000
  ),
  (
    'Anvar',
    'Tokhirov',
    'Psixiyatrist',
    16,
    16,
    8600000
  ),
  (
    'Gulzoda',
    'Mirzaeva',
    'Fiziolog',
    17,
    9,
    6100000
  ),
  (
    'Mirjon',
    'Begmatov',
    'Laboratoriya direktor',
    18,
    20,
    9800000
  ),
  (
    'Vosila',
    'Murodova',
    'Rentgenolog',
    19,
    14,
    8200000
  ),
  (
    'Olim',
    'Ziyoev',
    'UZI mutaxassisi',
    20,
    11,
    7000000
  ),
  (
    'Dildora',
    'Safoyeva',
    'Kardiolog',
    1,
    13,
    7900000
  ),
  (
    'Kholbabot',
    'Mansorov',
    'Infeksion kasalliklari',
    22,
    15,
    8300000
  ),
  ('Amina', 'Qodieva', 'Immunolog', 23, 10, 6800000),
  (
    'Bakhrom',
    'Nurov',
    'Allergiolog',
    24,
    9,
    6300000
  ),
  (
    'Celina',
    'Tursunovа',
    'Andrologiya shifokor',
    25,
    8,
    6000000
  ),
  (
    'Dilfuza',
    'Hasanova',
    'Ginekolog',
    26,
    14,
    8100000
  ),
  ('Emil', 'Karimov', 'Akusher', 27, 16, 8700000),
  (
    'Feruza',
    'Rasulovа',
    'Neonatolog',
    28,
    12,
    7600000
  ),
  (
    'Gazel',
    'Nurullayeva',
    'Pediatrik nevrolog',
    29,
    11,
    7200000
  ),
  (
    'Hafiz',
    'Hoshimov',
    'Pediatrik kardiolog',
    30,
    13,
    7800000
  ),
  (
    'Irina',
    'Beknazarova',
    'Stomatolog-ortopedu',
    31,
    10,
    6700000
  ),
  (
    'Jamil',
    'Teshayev',
    'Stomatolog-jarroh',
    32,
    12,
    7500000
  ),
  (
    'Kamron',
    'Abdurahimov',
    'Periodontolog',
    33,
    9,
    6400000
  ),
  ('Liliya', 'Sibaeva', 'Ortodont', 34, 8, 6100000),
  (
    'Mansur',
    'Sobitov',
    'Vaskulyar jarroh',
    35,
    17,
    9100000
  ),
  (
    'Nazira',
    'Komilova',
    'Umumiy jarroh',
    36,
    15,
    8400000
  ),
  (
    'Orkhan',
    'Rajabov',
    'Torakal jarroh',
    37,
    14,
    8200000
  ),
  (
    'Polina',
    'Volkova',
    'Abdominal jarroh',
    38,
    13,
    7900000
  ),
  (
    'Rasul',
    'Bayramov',
    'Neyrochirurg',
    39,
    18,
    9600000
  ),
  ('Sitora', 'Rahimova', 'Urolog', 40, 12, 7700000),
  (
    'Timbergen',
    'Tursunov',
    'Plastik jarroh',
    41,
    16,
    8900000
  ),
  (
    'Ulfat',
    'Karimova',
    'Kosmetolog',
    42,
    10,
    6900000
  ),
  (
    'Valentin',
    'Stepanov',
    'Proktolog',
    43,
    14,
    8300000
  ),
  (
    'Xanifa',
    'Tlegenova',
    'Anorektal shifokor',
    44,
    11,
    7300000
  ),
  (
    'Yasir',
    'Mahmudov',
    'Intensiv terapist',
    45,
    13,
    8000000
  ),
  (
    'Zulfiya',
    'Rasulovа',
    'Reanimatolog',
    46,
    15,
    8500000
  ),
  (
    'Aziz',
    'Abdullayev',
    'Anesteziyolog',
    47,
    17,
    9300000
  ),
  (
    'Betik',
    'Khusainov',
    'Terapeut',
    48,
    12,
    7600000
  ),
  (
    'Chulpan',
    'Koroleva',
    'Karyer tibbiyotchi',
    49,
    10,
    6800000
  ),
  (
    'Dushmirza',
    'Koremshin',
    'Sport tibbiyotchi',
    50,
    9,
    6500000
  ),
  (
    'Ekaterina',
    'Petrova',
    'Psixolog',
    51,
    8,
    6200000
  ),
  (
    'Filip',
    'Smirnov',
    'Refleksoterapist',
    52,
    11,
    7100000
  ),
  (
    'Galina',
    'Ivanova',
    'Akupunktura mutaxassisi',
    53,
    13,
    7700000
  ),
  ('Henrikh', 'Gurgen', 'Gidrolog', 54, 10, 6700000),
  (
    'Inessa',
    'Solovyova',
    'Massaj terapist',
    55,
    9,
    6400000
  ),
  (
    'Yanick',
    'Laurent',
    'Fiziokinez terapist',
    56,
    12,
    7500000
  ),
  (
    'Karina',
    'Fedotova',
    'Ishlov beruvchi',
    57,
    11,
    7200000
  ),
  (
    'Leonid',
    'Kulakov',
    'Nutritsiolog',
    58,
    14,
    8200000
  ),
  (
    'Minya',
    'Kuznetsova',
    'Dietolog',
    59,
    13,
    8000000
  ),
  (
    'Nicolai',
    'Volkov',
    'Lab. direktori (Kimya)',
    60,
    18,
    9100000
  ),
  (
    'Olga',
    'Smirnova',
    'Lab. direktori (Mikro)',
    61,
    16,
    8800000
  ),
  (
    'Pavel',
    'Petrov',
    'Immunolog laborant',
    62,
    12,
    7400000
  ),
  (
    'Roza',
    'Sharipova',
    'Hematolog',
    63,
    14,
    8100000
  ),
  (
    'Sofia',
    'Borisova',
    'Virusolog',
    64,
    13,
    7900000
  ),
  (
    'Tamara',
    'Golubeva',
    'Bakteriolog',
    65,
    12,
    7700000
  ),
  (
    'Ul''yana',
    'Egorova',
    'Parazitolog',
    66,
    10,
    6900000
  ),
  ('Vera', 'Novikova', 'Mikolog', 67, 9, 6500000),
  ('Wilhelm', 'Franz', 'Patolog', 68, 17, 9200000),
  (
    'Xenia',
    'Lehmann',
    'Gistopatolog',
    69,
    15,
    8400000
  ),
  ('Yana', 'Volkova', 'Tsitolog', 70, 13, 7900000),
  ('Zoe', 'Mueller', 'Genetist', 71, 14, 8200000),
  (
    'Adrian',
    'Rodriguez',
    'Radiyatsion onkolog',
    72,
    16,
    8900000
  ),
  (
    'Beatriz',
    'Garcia',
    'Kemoterapist',
    73,
    14,
    8300000
  ),
  (
    'Carlos',
    'Lopez',
    'Hemato-onkolog',
    74,
    15,
    8600000
  ),
  (
    'Diana',
    'Martinez',
    'Immunoterapiya mutaxassisi',
    75,
    12,
    7800000
  ),
  (
    'Eduardo',
    'Hernandez',
    'Giperterma spetsialisti',
    76,
    11,
    7400000
  ),
  (
    'Francisca',
    'Sanchez',
    'Radionuklid terapist',
    77,
    13,
    8000000
  ),
  (
    'Gregorio',
    'Ramirez',
    'Fotoodinamik mutaxassisi',
    78,
    10,
    6900000
  ),
  (
    'Herminia',
    'Torres',
    'Laser terapist',
    79,
    9,
    6600000
  ),
  ('Ignacio', 'Flores', 'Kriolog', 80, 8, 6300000),
  (
    'Josefina',
    'Rivera',
    'Ultrashumdagi likishlar',
    81,
    11,
    7100000
  ),
  (
    'Konstantin',
    'Karpov',
    'RFA spetsialisti',
    82,
    12,
    7600000
  ),
  (
    'Larisa',
    'Vasileva',
    'Embolizatsiya mutaxassisi',
    83,
    13,
    7900000
  ),
  (
    'Mikhail',
    'Orlov',
    'Stenting mutaxassisi',
    84,
    14,
    8200000
  ),
  (
    'Natalya',
    'Sokolova',
    'Angiografiya spetsialisti',
    85,
    15,
    8500000
  ),
  (
    'Oleg',
    'Frolov',
    'Endoskopiya mutaxassisi',
    86,
    13,
    8000000
  ),
  (
    'Polina',
    'Kuznetsova',
    'Kolonoskopiya spetsialisti',
    87,
    12,
    7700000
  ),
  (
    'Raisa',
    'Volkova',
    'Bronkoskopiya mutaxassisi',
    88,
    11,
    7300000
  ),
  (
    'Sergey',
    'Morozov',
    'Laryngoskopiya spetsialisti',
    89,
    10,
    6900000
  ),
  (
    'Tatyana',
    'Fedorova',
    'Tsistoskopiya mutaxassisi',
    90,
    12,
    7600000
  ),
  (
    'Ul''yan',
    'Nikitin',
    'Laparoskopiya spetsialisti',
    91,
    14,
    8300000
  ),
  (
    'Valentina',
    'Pavlova',
    'Artroskopiya mutaxassisi',
    92,
    13,
    8100000
  ),
  (
    'Vladimir',
    'Kirov',
    'Spinal punksiya spetsialisti',
    93,
    15,
    8600000
  ),
  (
    'Xristina',
    'Ivanova',
    'Biopsiya mutaxassisi',
    94,
    12,
    7700000
  ),
  (
    'Yaroslav',
    'Smirnov',
    'Tutunshumo qoldirish',
    95,
    10,
    6800000
  ),
  (
    'Zinaida',
    'Solovyova',
    'Alkogol advisory',
    96,
    11,
    7100000
  ),
  (
    'Aleksandr',
    'Vasiliev',
    'Narkolog',
    97,
    13,
    7900000
  ),
  (
    'Bozhena',
    'Kowalski',
    'Sosial ishi mutaxassisi',
    98,
    9,
    6400000
  ),
  (
    'Celestina',
    'Bonetti',
    'Reabilitatsiya mutaxassisi',
    99,
    10,
    6700000
  ),
  (
    'Dominik',
    'Richter',
    'Semya tibbiyoti',
    100,
    14,
    8200000
  );
-- Patients jadvali uchun 100 ta ma'lumot
INSERT INTO Patients (
    first_name,
    last_name,
    date_of_birth,
    gender,
    phone,
    email,
    address
  )
VALUES (
    'Salima',
    'Qosimova',
    '1985-05-15',
    'Ayol',
    '+998901234567',
    'salima.qosimova@mail.com',
    'Tashkent, Uchtepa tumani, 15-ko''cha'
  ),
  (
    'Botir',
    'Zokirov',
    '1990-11-20',
    'Erkak',
    '+998902345678',
    'botir.zokirov@mail.com',
    'Tashkent, Mirabad tumani, 23-ko''cha'
  ),
  (
    'Laylo',
    'Rustamova',
    '2018-02-10',
    'Ayol',
    '+998903456789',
    'laylo.rustamova@mail.com',
    'Tashkent, Sergeli tumani, 45-ko''cha'
  ),
  (
    'Anvar',
    'Saidov',
    '1976-09-01',
    'Erkak',
    '+998904567890',
    'anvar.saidov@mail.com',
    'Tashkent, Oqqo''rg''on tumani, 12-ko''cha'
  ),
  (
    'Gulchehra',
    'Ibrohimova',
    '1992-07-25',
    'Ayol',
    '+998905678901',
    'gulchehra.ibrohimova@mail.com',
    'Samarkand, Samarkand shahri, 78-ko''cha'
  ),
  (
    'Jasur',
    'Tojiyev',
    '1965-03-22',
    'Erkak',
    '+998906789012',
    'jasur.tojiyev@mail.com',
    'Bukhara, Bukhara shahri, 34-ko''cha'
  ),
  (
    'Sevara',
    'Nazirova',
    '2021-08-30',
    'Ayol',
    '+998907890123',
    'sevara.nazirova@mail.com',
    'Tashkent, Bektemir tumani, 56-ko''cha'
  ),
  (
    'Olim',
    'Ergashev',
    '1988-12-01',
    'Erkak',
    '+998908901234',
    'olim.ergashev@mail.com',
    'Andijan, Andijan shahri, 89-ko''cha'
  ),
  (
    'Dilnoza',
    'Hamidova',
    '1999-06-18',
    'Ayol',
    '+998909012345',
    'dilnoza.hamidova@mail.com',
    'Fergona, Fergona shahri, 11-ko''cha'
  ),
  (
    'Farrux',
    'Sobirov',
    '1979-01-05',
    'Erkak',
    '+998910123456',
    'farrux.sobirov@mail.com',
    'Karshi, Karshi shahri, 67-ko''cha'
  ),
  (
    'Gulnora',
    'Ahmadova',
    '1994-04-12',
    'Ayol',
    '+998911234567',
    'gulnora.ahmadova@mail.com',
    'Tashkent, Yakkasaroy tumani, 91-ko''cha'
  ),
  (
    'Mirjon',
    'Abdullayev',
    '1982-07-28',
    'Erkak',
    '+998912345678',
    'mirjon.abdullayev@mail.com',
    'Tashkent, Navoi tumani, 44-ko''cha'
  ),
  (
    'Nilufar',
    'Karimova',
    '1997-10-03',
    'Ayol',
    '+998913456789',
    'nilufar.karimova@mail.com',
    'Tashkent, Pskent tumani, 77-ko''cha'
  ),
  (
    'Firdavs',
    'Raxmonov',
    '1970-02-14',
    'Erkak',
    '+998914567890',
    'firdavs.raxmonov@mail.com',
    'Tashkent, Chinobod tumani, 22-ko''cha'
  ),
  (
    'Amina',
    'Rajabova',
    '2000-09-21',
    'Ayol',
    '+998915678901',
    'amina.rajabova@mail.com',
    'Qoqon, Qoqon shahri, 55-ko''cha'
  ),
  (
    'Kholbabot',
    'Mansurov',
    '1975-05-09',
    'Erkak',
    '+998916789012',
    'kholbabot.mansurov@mail.com',
    'Tashkent, Aqqo''rg''on tumani, 33-ko''cha'
  ),
  (
    'Dildora',
    'Safoyeva',
    '1989-03-17',
    'Ayol',
    '+998917890123',
    'dildora.safoyeva@mail.com',
    'Tashkent, Turtkul tumani, 88-ko''cha'
  ),
  (
    'Shavkat',
    'Nasriddinov',
    '1983-11-26',
    'Erkak',
    '+998918901234',
    'shavkat.nasriddinov@mail.com',
    'Tashkent, Zangiota tumani, 19-ko''cha'
  ),
  (
    'Feruza',
    'Alimova',
    '1996-08-05',
    'Ayol',
    '+998919012345',
    'feruza.alimova@mail.com',
    'Samarkand, Payariq tumani, 62-ko''cha'
  ),
  (
    'Emil',
    'Sharifov',
    '1972-01-19',
    'Erkak',
    '+998920123456',
    'emil.sharifov@mail.com',
    'Bukhara, Gijduvon tumani, 41-ko''cha'
  ),
  (
    'Gazel',
    'Murodova',
    '2002-06-11',
    'Ayol',
    '+998921234567',
    'gazel.murodova@mail.com',
    'Tashkent, Urgut tumani, 74-ko''cha'
  ),
  (
    'Hafiz',
    'Yuldashev',
    '1980-04-07',
    'Erkak',
    '+998922345678',
    'hafiz.yuldashev@mail.com',
    'Tashkent, Shahrukhiya tumani, 47-ko''cha'
  ),
  (
    'Irina',
    'Abdulloyeva',
    '1998-09-29',
    'Ayol',
    '+998923456789',
    'irina.abdulloyeva@mail.com',
    'Fergona, Kuva tumani, 26-ko''cha'
  ),
  (
    'Jamil',
    'Tashmatov',
    '1977-12-22',
    'Erkak',
    '+998924567890',
    'jamil.tashmatov@mail.com',
    'Andijan, Margilan tumani, 93-ko''cha'
  ),
  (
    'Kamron',
    'Hamdamov',
    '1995-02-14',
    'Erkak',
    '+998925678901',
    'kamron.hamdamov@mail.com',
    'Tashkent, Bostanliq tumani, 50-ko''cha'
  ),
  (
    'Liliya',
    'Vasileva',
    '2001-07-03',
    'Ayol',
    '+998926789012',
    'liliya.vasileva@mail.com',
    'Tashkent, Qibray tumani, 82-ko''cha'
  ),
  (
    'Mansur',
    'Qodirov',
    '1974-05-28',
    'Erkak',
    '+998927890123',
    'mansur.qodirov@mail.com',
    'Karshi, Kasbi tumani, 14-ko''cha'
  ),
  (
    'Nazira',
    'Ishanova',
    '1999-10-16',
    'Ayol',
    '+998928901234',
    'nazira.ishanova@mail.com',
    'Tashkent, Kibray tumani, 69-ko''cha'
  ),
  (
    'Orkhan',
    'Olimov',
    '1981-03-11',
    'Erkak',
    '+998929012345',
    'orkhan.olimov@mail.com',
    'Tashkent, Ohangaron tumani, 38-ko''cha'
  ),
  (
    'Polina',
    'Volkova',
    '2003-01-25',
    'Ayol',
    '+998930123456',
    'polina.volkova@mail.com',
    'Samarkand, Kattaqo''rg''on tumani, 71-ko''cha'
  ),
  (
    'Rasul',
    'Bayramov',
    '1978-08-04',
    'Erkak',
    '+998931234567',
    'rasul.bayramov@mail.com',
    'Bukhara, Romitan tumani, 25-ko''cha'
  ),
  (
    'Sitora',
    'Rahimova',
    '1993-06-20',
    'Ayol',
    '+998932345678',
    'sitora.rahimova@mail.com',
    'Tashkent, Qaragandin tumani, 53-ko''cha'
  ),
  (
    'Timur',
    'Tursunov',
    '1986-04-09',
    'Erkak',
    '+998933456789',
    'timur.tursunov@mail.com',
    'Fergona, Tashlak tumani, 31-ko''cha'
  ),
  (
    'Ulfat',
    'Karimova',
    '2002-11-14',
    'Ayol',
    '+998934567890',
    'ulfat.karimova@mail.com',
    'Andijan, Asaka tumani, 85-ko''cha'
  ),
  (
    'Valentin',
    'Stepanov',
    '1971-09-07',
    'Erkak',
    '+998935678901',
    'valentin.stepanov@mail.com',
    'Tashkent, Parkent tumani, 59-ko''cha'
  ),
  (
    'Xanifa',
    'Tlegenova',
    '1997-02-28',
    'Ayol',
    '+998936789012',
    'xanifa.tlegenova@mail.com',
    'Tashkent, Tashkent tumani, 17-ko''cha'
  ),
  (
    'Yasir',
    'Mahmudov',
    '1984-07-15',
    'Erkak',
    '+998937890123',
    'yasir.mahmudov@mail.com',
    'Karshi, Nishon tumani, 64-ko''cha'
  ),
  (
    'Zulfiya',
    'Rasulovа',
    '2000-05-10',
    'Ayol',
    '+998938901234',
    'zulfiya.rasulova@mail.com',
    'Tashkent, Yunusabad tumani, 42-ko''cha'
  ),
  (
    'Aziz',
    'Abdullayev',
    '1975-12-03',
    'Erkak',
    '+998939012345',
    'aziz.abdullayev@mail.com',
    'Tashkent, Olmaliq tumani, 76-ko''cha'
  ),
  (
    'Betik',
    'Khusainov',
    '1996-01-22',
    'Erkak',
    '+998940123456',
    'betik.khusainov@mail.com',
    'Samarkand, Payariq shahri, 21-ko''cha'
  ),
  (
    'Chulpan',
    'Koroleva',
    '2004-08-18',
    'Ayol',
    '+998941234567',
    'chulpan.koroleva@mail.com',
    'Bukhara, Shofirkon tumani, 39-ko''cha'
  ),
  (
    'Dushmirza',
    'Koremshin',
    '1980-11-29',
    'Erkak',
    '+998942345678',
    'dushmirza.koremshin@mail.com',
    'Tashkent, Buka tumani, 28-ko''cha'
  ),
  (
    'Ekaterina',
    'Petrova',
    '1998-04-06',
    'Ayol',
    '+998943456789',
    'ekaterina.petrova@mail.com',
    'Fergona, Beshariq tumani, 51-ko''cha'
  ),
  (
    'Filip',
    'Smirnov',
    '1973-09-14',
    'Erkak',
    '+998944567890',
    'filip.smirnov@mail.com',
    'Andijan, Baliqchi tumani, 83-ko''cha'
  ),
  (
    'Galina',
    'Ivanova',
    '1995-03-31',
    'Ayol',
    '+998945678901',
    'galina.ivanova@mail.com',
    'Tashkent, Bekabad tumani, 16-ko''cha'
  ),
  (
    'Henrikh',
    'Gurgen',
    '1987-06-23',
    'Erkak',
    '+998946789012',
    'henrikh.gurgen@mail.com',
    'Tashkent, Chimboy tumani, 72-ko''cha'
  ),
  (
    'Inessa',
    'Solovyova',
    '2001-12-09',
    'Ayol',
    '+998947890123',
    'inessa.solovyova@mail.com',
    'Karshi, Koson tumani, 43-ko''cha'
  ),
  (
    'Janick',
    'Laurent',
    '1982-05-16',
    'Erkak',
    '+998948901234',
    'janick.laurent@mail.com',
    'Tashkent, Chirchiq tumani, 36-ko''cha'
  ),
  (
    'Karina',
    'Fedotova',
    '1994-07-24',
    'Ayol',
    '+998949012345',
    'karina.fedotova@mail.com',
    'Samarkand, Panjshanbe tumani, 58-ko''cha'
  ),
  (
    'Leonid',
    'Kulakov',
    '1979-10-02',
    'Erkak',
    '+998950123456',
    'leonid.kulakov@mail.com',
    'Bukhara, Gazli tumani, 19-ko''cha'
  ),
  (
    'Minya',
    'Kuznetsova',
    '2003-02-20',
    'Ayol',
    '+998951234567',
    'minya.kuznetsova@mail.com',
    'Tashkent, Gazalkent tumani, 65-ko''cha'
  ),
  (
    'Nicolai',
    'Volkov',
    '1968-04-11',
    'Erkak',
    '+998952345678',
    'nicolai.volkov@mail.com',
    'Fergona, Qo''qon tumani, 24-ko''cha'
  ),
  (
    'Olga',
    'Smirnova',
    '1992-08-27',
    'Ayol',
    '+998953456789',
    'olga.smirnova@mail.com',
    'Andijan, Shahrikhon tumani, 87-ko''cha'
  ),
  (
    'Pavel',
    'Petrov',
    '1986-11-13',
    'Erkak',
    '+998954567890',
    'pavel.petrov@mail.com',
    'Tashkent, Khorezm tumani, 52-ko''cha'
  ),
  (
    'Roza',
    'Sharipova',
    '2000-03-05',
    'Ayol',
    '+998955678901',
    'roza.sharipova@mail.com',
    'Tashkent, Ustyurt tumani, 44-ko''cha'
  ),
  (
    'Sofia',
    'Borisova',
    '1976-09-18',
    'Ayol',
    '+998956789012',
    'sofia.borisova@mail.com',
    'Karshi, Jambay tumani, 13-ko''cha'
  ),
  (
    'Tamara',
    'Golubeva',
    '1999-01-30',
    'Ayol',
    '+998957890123',
    'tamara.golubeva@mail.com',
    'Tashkent, Namanagan tumani, 29-ko''cha'
  ),
  (
    'Ul''yana',
    'Egorova',
    '1981-06-07',
    'Ayol',
    '+998958901234',
    'ulyana.egorova@mail.com',
    'Samarkand, Aqdarya tumani, 68-ko''cha'
  ),
  (
    'Vera',
    'Novikova',
    '2002-10-22',
    'Ayol',
    '+998959012345',
    'vera.novikova@mail.com',
    'Bukhara, Vobkent tumani, 37-ko''cha'
  ),
  (
    'Wilhelm',
    'Franz',
    '1974-02-08',
    'Erkak',
    '+998960123456',
    'wilhelm.franz@mail.com',
    'Tashkent, Tuyoq tumani, 32-ko''cha'
  ),
  (
    'Xenia',
    'Lehmann',
    '1997-05-14',
    'Ayol',
    '+998961234567',
    'xenia.lehmann@mail.com',
    'Fergona, Uychi tumani, 79-ko''cha'
  ),
  (
    'Yana',
    'Volkova',
    '1988-09-25',
    'Ayol',
    '+998962345678',
    'yana.volkova@mail.com',
    'Andijan, Jo''juvoy tumani, 20-ko''cha'
  ),
  (
    'Zoe',
    'Mueller',
    '2004-12-03',
    'Ayol',
    '+998963456789',
    'zoe.mueller@mail.com',
    'Tashkent, Yuqorichirchiq tumani, 91-ko''cha'
  ),
  (
    'Adrian',
    'Rodriguez',
    '1977-03-19',
    'Erkak',
    '+998964567890',
    'adrian.rodriguez@mail.com',
    'Tashkent, Yangiyul tumani, 56-ko''cha'
  ),
  (
    'Beatriz',
    'Garcia',
    '1995-08-10',
    'Ayol',
    '+998965678901',
    'beatriz.garcia@mail.com',
    'Samarkand, Akrabat tumani, 27-ko''cha'
  ),
  (
    'Carlos',
    'Lopez',
    '1983-11-21',
    'Erkak',
    '+998966789012',
    'carlos.lopez@mail.com',
    'Bukhara, Takhtakupa tumani, 73-ko''cha'
  ),
  (
    'Diana',
    'Martinez',
    '2001-04-15',
    'Ayol',
    '+998967890123',
    'diana.martinez@mail.com',
    'Tashkent, Ugam tumani, 49-ko''cha'
  ),
  (
    'Eduardo',
    'Hernandez',
    '1972-07-06',
    'Erkak',
    '+998968901234',
    'eduardo.hernandez@mail.com',
    'Fergona, Isfayram tumani, 11-ko''cha'
  ),
  (
    'Francisca',
    'Sanchez',
    '1998-02-26',
    'Ayol',
    '+998969012345',
    'francisca.sanchez@mail.com',
    'Andijan, Qo''rg''ontepa tumani, 60-ko''cha'
  ),
  (
    'Gregorio',
    'Ramirez',
    '1984-06-12',
    'Erkak',
    '+998970123456',
    'gregorio.ramirez@mail.com',
    'Tashkent, Bo''stonliq tumani, 35-ko''cha'
  ),
  (
    'Herminia',
    'Torres',
    '2003-09-08',
    'Ayol',
    '+998971234567',
    'herminia.torres@mail.com',
    'Tashkent, Angren tumani, 84-ko''cha'
  ),
  (
    'Ignacio',
    'Flores',
    '1979-12-17',
    'Erkak',
    '+998972345678',
    'ignacio.flores@mail.com',
    'Karshi, Mubarek tumani, 30-ko''cha'
  ),
  (
    'Josefina',
    'Rivera',
    '1996-10-29',
    'Ayol',
    '+998973456789',
    'josefina.rivera@mail.com',
    'Tashkent, Nurafshon tumani, 23-ko''cha'
  ),
  (
    'Konstantin',
    'Karpov',
    '1975-01-04',
    'Erkak',
    '+998974567890',
    'konstantin.karpov@mail.com',
    'Samarkand, Qishloq tumani, 54-ko''cha'
  ),
  (
    'Larisa',
    'Vasileva',
    '1999-07-11',
    'Ayol',
    '+998975678901',
    'larisa.vasileva@mail.com',
    'Bukhara, Sardoba tumani, 18-ko''cha'
  ),
  (
    'Mikhail',
    'Orlov',
    '1987-04-23',
    'Erkak',
    '+998976789012',
    'mikhail.orlov@mail.com',
    'Tashkent, Isfishan tumani, 57-ko''cha'
  ),
  (
    'Natalya',
    'Sokolova',
    '2002-11-05',
    'Ayol',
    '+998977890123',
    'natalya.sokolova@mail.com',
    'Fergona, Vangash tumani, 10-ko''cha'
  ),
  (
    'Oleg',
    'Frolov',
    '1981-05-09',
    'Erkak',
    '+998978901234',
    'oleg.frolov@mail.com',
    'Andijan, So''x tumani, 46-ko''cha'
  ),
  (
    'Polina',
    'Kuznetsova',
    '1994-09-16',
    'Ayol',
    '+998979012345',
    'polina.kuznetsova@mail.com',
    'Tashkent, Fergona tumani, 92-ko''cha'
  ),
  (
    'Raisa',
    'Volkova',
    '1980-02-28',
    'Ayol',
    '+998980123456',
    'raisa.volkova@mail.com',
    'Tashkent, Hujand tumani, 34-ko''cha'
  ),
  (
    'Sergey',
    'Morozov',
    '1989-06-14',
    'Erkak',
    '+998981234567',
    'sergey.morozov@mail.com',
    'Karshi, Karshi shahri, 22-ko''cha'
  ),
  (
    'Tatyana',
    'Fedorova',
    '2001-10-20',
    'Ayol',
    '+998982345678',
    'tatyana.fedorova@mail.com',
    'Tashkent, Tojikiston tumani, 61-ko''cha'
  ),
  (
    'Ul''yan',
    'Nikitin',
    '1978-03-11',
    'Erkak',
    '+998983456789',
    'ulyan.nikitin@mail.com',
    'Samarkand, Samarkand tumani, 48-ko''cha'
  ),
  (
    'Valentina',
    'Pavlova',
    '1997-08-03',
    'Ayol',
    '+998984567890',
    'valentina.pavlova@mail.com',
    'Bukhara, Buxoro tumani, 63-ko''cha'
  ),
  (
    'Vladimir',
    'Kirov',
    '1973-12-22',
    'Erkak',
    '+998985678901',
    'vladimir.kirov@mail.com',
    'Tashkent, Turtkul tumani, 40-ko''cha'
  ),
  (
    'Xristina',
    'Ivanova',
    '1991-04-09',
    'Ayol',
    '+998986789012',
    'xristina.ivanova@mail.com',
    'Fergona, Rishton tumani, 15-ko''cha'
  ),
  (
    'Yaroslav',
    'Smirnov',
    '1985-07-18',
    'Erkak',
    '+998987890123',
    'yaroslav.smirnov@mail.com',
    'Andijan, Ulugnor tumani, 9-ko''cha'
  ),
  (
    'Zinaida',
    'Solovyova',
    '2000-01-27',
    'Ayol',
    '+998988901234',
    'zinaida.solovyova@mail.com',
    'Tashkent, Chusttepa tumani, 75-ko''cha'
  ),
  (
    'Aleksandr',
    'Vasiliev',
    '1976-05-06',
    'Erkak',
    '+998989012345',
    'aleksandr.vasiliev@mail.com',
    'Tashkent, Kattakurgan tumani, 12-ko''cha'
  ),
  (
    'Bozhena',
    'Kowalski',
    '1998-11-14',
    'Ayol',
    '+998990123456',
    'bozhena.kowalski@mail.com',
    'Karshi, Qushkupir tumani, 66-ko''cha'
  ),
  (
    'Celestina',
    'Bonetti',
    '1982-09-02',
    'Ayol',
    '+998991234567',
    'celestina.bonetti@mail.com',
    'Tashkent, Toza tumani, 28-ko''cha'
  );
-- Appointments jadvali uchun 100 ta ma'lumot
INSERT INTO Appointments (
    patient_id,
    doctor_id,
    appointment_date,
    reason,
    status
  )
VALUES (
    1,
    1,
    '2025-11-10 09:00:00',
    'Yurak og''rig''i',
    'completed'
  ),
  (
    2,
    2,
    '2025-11-10 11:30:00',
    'Operatsiyadan oldingi konsultatsiya',
    'completed'
  ),
  (
    3,
    3,
    '2025-11-10 14:00:00',
    'Shamollash',
    'scheduled'
  ),
  (
    4,
    4,
    '2025-11-10 15:00:00',
    'Kuchli bosh og''rig''i',
    'scheduled'
  ),
  (
    5,
    1,
    '2025-11-11 10:00:00',
    'Qon bosimini tekshirish',
    'completed'
  ),
  (
    6,
    7,
    '2025-11-11 12:00:00',
    'Oyoq sinishi shubhasi',
    'scheduled'
  ),
  (
    7,
    3,
    '2025-11-11 14:30:00',
    'Boladagi yo''tal',
    'scheduled'
  ),
  (
    8,
    1,
    '2025-11-12 09:30:00',
    'Yurak sohasidagi bezovtalik',
    'completed'
  ),
  (
    9,
    2,
    '2025-11-12 11:00:00',
    'Operatsiyadan keyingi tekshiruv',
    'scheduled'
  ),
  (
    10,
    4,
    '2025-11-12 13:00:00',
    'Uyqusizlik',
    'scheduled'
  ),
  (
    11,
    6,
    '2025-11-12 15:30:00',
    'Onkologik tekshiruv',
    'scheduled'
  ),
  (
    12,
    3,
    '2025-11-13 10:00:00',
    'Qaytadan ko''rik',
    'completed'
  ),
  (
    1,
    5,
    '2025-11-13 11:00:00',
    'Takroriy kardiogramma',
    'scheduled'
  ),
  (
    13,
    10,
    '2025-11-13 16:00:00',
    'Tish og''rig''i',
    'scheduled'
  ),
  (
    2,
    1,
    '2025-11-14 09:00:00',
    'Umumiy ko''rik',
    'completed'
  ),
  (
    14,
    8,
    '2025-11-14 10:30:00',
    'Shamollash va gippotermiya',
    'scheduled'
  ),
  (
    15,
    7,
    '2025-11-14 13:00:00',
    'Ruxsat olingan to''qnash',
    'scheduled'
  ),
  (
    3,
    4,
    '2025-11-14 14:00:00',
    'Nevrolog konsultatsiyasi',
    'completed'
  ),
  (
    16,
    2,
    '2025-11-15 09:00:00',
    'Operatsiyagan oldingi tekshiruv',
    'scheduled'
  ),
  (
    17,
    6,
    '2025-11-15 11:00:00',
    'Kimoterapiya kursasi',
    'scheduled'
  ),
  (
    18,
    5,
    '2025-11-15 12:30:00',
    'EKG va echo',
    'completed'
  ),
  (
    19,
    3,
    '2025-11-15 14:00:00',
    'Bola tibbiyoti konsultatsiyasi',
    'scheduled'
  ),
  (
    20,
    10,
    '2025-11-16 09:30:00',
    'Tish bo''yash',
    'scheduled'
  ),
  (
    21,
    1,
    '2025-11-16 11:00:00',
    'Qon bosimi tekshirish',
    'completed'
  ),
  (
    22,
    7,
    '2025-11-16 13:00:00',
    'Oyoq kuyma shubhasi',
    'scheduled'
  ),
  (
    4,
    2,
    '2025-11-16 14:30:00',
    'Jarrohlik konsultatsiyasi',
    'scheduled'
  ),
  (
    23,
    4,
    '2025-11-17 09:00:00',
    'Migren terapiyasi',
    'completed'
  ),
  (
    24,
    8,
    '2025-11-17 10:00:00',
    'Shamollash nasayai',
    'scheduled'
  ),
  (
    25,
    6,
    '2025-11-17 11:30:00',
    'Onkologik testlari',
    'scheduled'
  ),
  (
    26,
    1,
    '2025-11-17 13:00:00',
    'Gipertoniya tekshirish',
    'completed'
  ),
  (
    27,
    3,
    '2025-11-17 14:00:00',
    'Pediatrik tekshirish',
    'scheduled'
  ),
  (
    28,
    10,
    '2025-11-18 09:00:00',
    'Tish plombasini almashtrish',
    'scheduled'
  ),
  (
    29,
    7,
    '2025-11-18 10:30:00',
    'Travm traumatolog ko''rigi',
    'completed'
  ),
  (
    30,
    2,
    '2025-11-18 12:00:00',
    'Qo''shimcha tekshiruvlar',
    'scheduled'
  ),
  (
    31,
    5,
    '2025-11-18 13:30:00',
    'Yurak kasalligi tekshirish',
    'scheduled'
  ),
  (
    32,
    4,
    '2025-11-19 09:00:00',
    'Migren dorilarini o''zgartirish',
    'completed'
  ),
  (
    33,
    6,
    '2025-11-19 10:00:00',
    'Kimoterapiya qabuli',
    'scheduled'
  ),
  (
    34,
    1,
    '2025-11-19 11:00:00',
    'Stent tekshirish',
    'scheduled'
  ),
  (
    35,
    3,
    '2025-11-19 12:30:00',
    'Bola o''smasi tekshirish',
    'completed'
  ),
  (
    36,
    8,
    '2025-11-19 14:00:00',
    'Bronxitdan tiklanish',
    'scheduled'
  ),
  (
    37,
    10,
    '2025-11-20 09:00:00',
    'Plombaning to''g''riligi tekshirish',
    'scheduled'
  ),
  (
    38,
    7,
    '2025-11-20 10:30:00',
    'Oyoq rentgeni tekshirish',
    'completed'
  ),
  (
    39,
    2,
    '2025-11-20 12:00:00',
    'Operatsiyagа oid savollar',
    'scheduled'
  ),
  (
    40,
    5,
    '2025-11-20 13:00:00',
    'Yurak ritmi tekshirish',
    'scheduled'
  ),
  (
    41,
    4,
    '2025-11-21 09:00:00',
    'Neurolog tekshirish',
    'completed'
  ),
  (
    42,
    6,
    '2025-11-21 10:00:00',
    'Onkolog tekshirish',
    'scheduled'
  ),
  (
    43,
    1,
    '2025-11-21 11:30:00',
    'Yurak kasalliklarinin taqsimoti',
    'scheduled'
  ),
  (
    44,
    3,
    '2025-11-21 13:00:00',
    'Bola gastroenterologiyasi',
    'completed'
  ),
  (
    45,
    8,
    '2025-11-21 14:30:00',
    'Shartnomani parvo berish',
    'scheduled'
  ),
  (
    46,
    10,
    '2025-11-22 09:00:00',
    'Oral gigiyena darslar',
    'scheduled'
  ),
  (
    47,
    7,
    '2025-11-22 10:00:00',
    'Travma diagnostikasi',
    'completed'
  ),
  (
    48,
    2,
    '2025-11-22 11:00:00',
    'Operatsiy ortasidan mos ta''tilga chiqis',
    'scheduled'
  ),
  (
    49,
    5,
    '2025-11-22 12:30:00',
    'Antiaritmiya dorilar',
    'scheduled'
  ),
  (
    50,
    4,
    '2025-11-22 14:00:00',
    'Psixiatrik konsultatsiya',
    'completed'
  ),
  (
    51,
    6,
    '2025-11-23 09:00:00',
    'Imunokorreksiyani davomi',
    'scheduled'
  ),
  (
    52,
    1,
    '2025-11-23 10:30:00',
    'Qon tomiri rentgeni',
    'scheduled'
  ),
  (
    53,
    3,
    '2025-11-23 12:00:00',
    'Pediatrik infeksiyalar',
    'completed'
  ),
  (
    54,
    8,
    '2025-11-23 13:30:00',
    'Surunkali bronxit terapiyasi',
    'scheduled'
  ),
  (
    55,
    10,
    '2025-11-23 15:00:00',
    'Qadoqlanuvchi tish tekshirish',
    'scheduled'
  ),
  (
    56,
    7,
    '2025-11-24 09:00:00',
    'Ortopedik prishvat',
    'completed'
  ),
  (
    57,
    2,
    '2025-11-24 10:00:00',
    'Jarrohlik stoli takoyergi',
    'scheduled'
  ),
  (
    58,
    5,
    '2025-11-24 11:30:00',
    'Vaskular xususiyatlari',
    'scheduled'
  ),
  (
    59,
    4,
    '2025-11-24 13:00:00',
    'Depressiyaning terapiyasi',
    'completed'
  ),
  (
    60,
    6,
    '2025-11-24 14:30:00',
    'Kanserning bosqichini tekshirish',
    'scheduled'
  ),
  (
    61,
    1,
    '2025-11-25 09:00:00',
    'Kardiologik profylaktika',
    'scheduled'
  );
-- 1-MASALA: JOIN + GROUP BY + COUNT (AGGREGATE)
-- 📋 Masala Matni:
-- "Har bir bo'limda nechta shifokor ishlaydi? Bo'lim nomi, shifokorlar soni va bo'limning manzili ko'rsatilsin. Natijalari shifokorlar soni bo'yicha kamida 5 ta shifokorga ega bo'lganlarini ko'rsating."
