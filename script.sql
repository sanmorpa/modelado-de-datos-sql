/*
	Titulo: Script Inicial Práctica
	Módulo: Práctica Modelado de datos y SQL
	Autora: Sandra Moreno Palacios
	correo: sanmorpa@gmail.com
*/

-- Borrado y Creación del esquema de trabajo --
DROP SCHEMA IF EXISTS sandra_moreno_palacios CASCADE;
CREATE SCHEMA sandra_moreno_palacios AUTHORIZATION oodhuafv;

-- Creación de tablas --

-- Tabla GRUPO EMPRESARIAL
CREATE TABLE sandra_moreno_palacios.grupo_empresarial
(
	id SERIAL NOT NULL, --PK
	grupo_empresarial VARCHAR(100) NOT NULL,
	CONSTRAINT grupo_empresarial_pk PRIMARY KEY(id)
);

-- Tabla MARCA
CREATE TABLE sandra_moreno_palacios.marca
(
	id SERIAL NOT NULL, --PK
	marca VARCHAR(50) NOT NULL,
	id_grupo_empresarial INTEGER NOT NULL, --FK
	CONSTRAINT marca_pk PRIMARY KEY(id),
	CONSTRAINT grupo_empresarial_fk FOREIGN KEY(id_grupo_empresarial) REFERENCES sandra_moreno_palacios.grupo_empresarial(id)
);

-- Tabla MODELO
CREATE TABLE sandra_moreno_palacios.modelo
(
	id SERIAL NOT NULL, --PK
	modelo VARCHAR(50) NOT NULL,
	id_marca INTEGER NOT NULL, --FK
	CONSTRAINT modelo_pk PRIMARY KEY(id),
	CONSTRAINT marca_fk FOREIGN KEY(id_marca) REFERENCES sandra_moreno_palacios.marca(id)
);

-- Tabla COLOR
CREATE TABLE sandra_moreno_palacios.color
(
	id SERIAL NOT NULL, --PK
	color VARCHAR(100) NOT NULL,
	CONSTRAINT color_pk PRIMARY KEY(id)
);

-- Tabla DIVISA
CREATE TABLE sandra_moreno_palacios.divisa
(
	id VARCHAR(3) NOT NULL, --PK (Código ISO 4217)
	divisa VARCHAR(30) NOT NULL,
	CONSTRAINT divisa_pk PRIMARY KEY(id)
);

-- Tabla ASEGURADORA
CREATE TABLE sandra_moreno_palacios.aseguradora
(
	id SERIAL NOT NULL, --PK
	aseguradora VARCHAR(100) NOT NULL,
	CONSTRAINT aseguradora_pk PRIMARY KEY(id)
);

-- Tabla POLIZA
CREATE TABLE sandra_moreno_palacios.poliza
(
	numero INTEGER NOT NULL, --PK
	id_aseguradora INTEGER NOT NULL, --FK
	CONSTRAINT poliza_pk PRIMARY KEY(numero),
	CONSTRAINT aseguradora_fk FOREIGN KEY(id_aseguradora) REFERENCES sandra_moreno_palacios.aseguradora(id)
);

-- tabla VEHICULOS
CREATE TABLE sandra_moreno_palacios.vehiculo
(
	matricula VARCHAR(10) NOT NULL, --PK
	kilometros INTEGER NOT NULL,
	id_modelo INTEGER NOT NULL, --FK
	id_color INTEGER NOT NULL, --FK
	numero_poliza INTEGER NOT NULL,
	fecha_compra DATE NOT NULL,
	CONSTRAINT vehiculo_pk PRIMARY KEY(matricula),
	CONSTRAINT modelo_fk FOREIGN KEY(id_modelo) REFERENCES sandra_moreno_palacios.modelo(id),
	CONSTRAINT color_fk FOREIGN KEY(id_color) REFERENCES sandra_moreno_palacios.color(id),
	CONSTRAINT poliza_fk FOREIGN KEY(numero_poliza) REFERENCES sandra_moreno_palacios.poliza(numero)
);

-- Tabla REVISIÓN
CREATE TABLE sandra_moreno_palacios.revision
(
	id SERIAL NOT NULL, --PK
	matricula VARCHAR(10) NOT NULL, --FK
	kilometros INTEGER NOT NULL,
	importe NUMERIC(7, 2) NOT NULL,
	id_divisa VARCHAR(30) NOT NULL, --FK
	fecha DATE NOT NULL,
	CONSTRAINT revision_pk PRIMARY KEY(id),
	CONSTRAINT divisa_fk FOREIGN KEY(id_divisa) REFERENCES sandra_moreno_palacios.divisa(id),
	CONSTRAINT vehiculo_fk FOREIGN KEY(matricula) REFERENCES sandra_moreno_palacios.vehiculo(matricula)
);

-- DML --
INSERT INTO
	sandra_moreno_palacios.aseguradora (aseguradora) VALUES ('Mapfre'),
	('Allianz'),
	('Mutua Madrileña'),
	('AXA'),
	('Linea Directa');

INSERT INTO
	sandra_moreno_palacios.poliza (numero, id_aseguradora)
VALUES
	(91874, 4),
	(13035, 3),
	(10939, 3),
	(96242, 2),
	(91984, 4),
	(82798, 1),
	(57988, 4),
	(37091, 2),
	(57781, 1),
	(52393, 1),
	(41943, 3),
	(40737, 4),
	(17160, 2),
	(67859, 3),
	(17992, 4),
	(94021, 1),
	(73176, 2),
	(30167, 2),
	(65859, 2),
	(62773, 4),
	(95076, 3),
	(77373, 3),
	(47493, 1),
	(93863, 4),
	(37031, 3),
	(29999, 3),
	(62441, 4),
	(41563, 2),
	(65146, 1),
	(45193, 2),
	(48558, 2),
	(88559, 2),
	(17656, 4),
	(99392, 2),
	(15012, 4),
	(84834, 2),
	(25562, 4),
	(61532, 4),
	(79647, 3),
	(54086, 4),
	(70293, 3),
	(76713, 1),
	(14708, 3),
	(63824, 4),
	(87700, 2),
	(80813, 3),
	(40788, 3),
	(30494, 3),
	(18606, 2),
	(69723, 3),
	(35174, 2),
	(79259, 2),
	(93362, 3),
	(16239, 3),
	(74438, 2),
	(51174, 4),
	(77688, 3),
	(31394, 2),
	(95156, 1),
	(24153, 3),
	(85686, 4),
	(71948, 4),
	(86734, 3),
	(89403, 1),
	(42633, 2),
	(61842, 2),
	(17954, 3),
	(98196, 3),
	(93735, 4),
	(60702, 3),
	(45830, 2),
	(55406, 2),
	(11097, 1),
	(35714, 3),
	(44371, 3),
	(72990, 3),
	(13552, 4),
	(43545, 4),
	(49457, 3),
	(36338, 2),
	(22199, 3),
	(69928, 3),
	(83148, 3),
	(11723, 1),
	(48537, 2),
	(76067, 2),
	(19613, 2),
	(38081, 4),
	(33266, 1),
	(64950, 2),
	(43777, 3),
	(79346, 1),
	(17422, 1),
	(29627, 4),
	(71237, 4),
	(61097, 2),
	(11098, 2),
	(98246, 4),
	(43298, 1),
	(84605, 4);

INSERT INTO
	sandra_moreno_palacios.divisa (id, divisa)
VALUES
	('EUR', 'Euro'),
	('USD', 'Dolar Estadounidense'),
	('JPY', 'Yen'),
	('KRW', 'Won'),
	('CAD', 'Dolar Canadiense'),
	('AUD', 'Dolar australiano');

INSERT INTO
	sandra_moreno_palacios.color (color)
VALUES
	('Rojo'),
	('Verde'),
	('Azul'),
	('Blanco'),
	('Negro'),
	('Gris');

INSERT INTO
	sandra_moreno_palacios.grupo_empresarial (grupo_empresarial)
VALUES
	('FCA'),
	('Hyundai'),
	('Renault Nissan');

INSERT INTO
	sandra_moreno_palacios.marca (marca, id_grupo_empresarial)
VALUES
	('Fiat', 1),
	('Jeep', 1),
	('Kia', 2),
	('Hyundai', 2),
	('Renault', 3),
	('Nissan', 3);

INSERT INTO
	sandra_moreno_palacios.modelo (modelo, id_marca)
VALUES
	('Panda', 1),
	('Cherokee', 2),
	('Sorento', 3),
	('Picanto', 3),
	('Tucson', 4),
	('Clio', 5),
	('Mégane', 5),
	('Pulsar', 6),
	('Micra', 6);

INSERT INTO
	sandra_moreno_palacios.vehiculo (matricula, kilometros, id_modelo, id_color, numero_poliza, fecha_compra)
VALUES
	('9748CSW', 1713, 4, 1, 91874, '8/22/2010'),
	('0519DFP', 12327, 5, 4, 13035, '2/17/2012'),
	('9809HXU', 14221, 4, 6, 10939, '7/27/2017'),
	('8620ABR', 11742, 2, 5, 96242, '10/5/2011'),
	('2428XAE', 2237, 3, 3, 91984, '11/20/2011'),
	('5647ZTR', 1213, 5, 2, 82798, '1/18/2011'),
	('1218WLT', 12136, 9, 6, 57988, '9/1/2019'),
	('6230XIT', 13219, 3, 6, 37091, '5/10/2012'),
	('8173XRT', 1225, 2, 5, 57781, '6/18/2013'),
	('1564DMR', 13841, 1, 5, 52393, '4/7/2019'),
	('6110GYN', 18872, 1, 6, 41943, '10/18/2013'),
	('5391MSB', 17532, 2, 3, 40737, '5/22/2014'),
	('8898RTS', 15430, 5, 3, 17160, '10/19/2016'),
	('4272SFF', 1912, 5, 2, 67859, '4/10/2019'),
	('4772IVI', 19642, 2, 2, 17992, '9/3/2010'),
	('4830AWZ', 14326, 5, 3, 94021, '12/27/2017'),
	('7566RTG', 15755, 2, 6, 73176, '5/2/2019'),
	('0501QMI', 2090, 9, 1, 30167, '5/10/2015'),
	('9187YJN', 17774, 2, 1, 65859, '11/14/2015'),
	('4027QWP', 13149, 4, 4, 62773, '9/28/2011'),
	('2859JPP', 43114, 7, 1, 95076, '11/9/2010'),
	('1982XOR', 14595, 9, 4, 77373, '7/6/2018'),
	('4501WTN', 1933, 8, 6, 47493, '11/11/2018'),
	('0170BLV', 1537, 9, 3, 93863, '12/12/2013'),
	('3855WXC', 1275, 8, 3, 37031, '9/14/2014'),
	('6683RAV', 11432, 7, 2, 29999, '5/22/2010'),
	('0431DPP', 1914, 1, 2, 62441, '8/1/2012'),
	('1282JQH', 11228, 9, 1, 41563, '10/16/2019'),
	('0463TKW', 1373, 1, 5, 65146, '8/11/2019'),
	('8811XZY', 11295, 3, 1, 45193, '12/1/2017'),
	('5601FQL', 11326, 6, 6, 48558, '11/17/2016'),
	('0586WMV', 1436, 8, 5, 88559, '3/24/2011'),
	('1332XKT', 1145, 1, 2, 17656, '11/9/2014'),
	('3671CZU', 14327, 1, 3, 99392, '1/7/2016'),
	('9073IYE', 133210, 3, 1, 15012, '3/15/2013'),
	('2978SOX', 13199, 7, 5, 84834, '6/2/2012'),
	('3124GLI', 12179, 7, 6, 25562, '8/20/2014'),
	('4855YVT', 53125, 9, 5, 61532, '2/7/2012'),
	('1597EVZ', 1861, 2, 1, 79647, '4/11/2017'),
	('6153DXH', 16576, 6, 4, 54086, '4/30/2019'),
	('3640DBH', 17082, 9, 2, 70293, '8/21/2013'),
	('5114ROV', 18575, 7, 1, 76713, '4/18/2013'),
	('3750WHS', 18542, 4, 3, 14708, '4/22/2019'),
	('4290MSR', 16758, 3, 3, 63824, '4/24/2019'),
	('7581TVZ', 18234, 7, 1, 87700, '3/15/2019'),
	('6337HHE', 12439, 4, 2, 80813, '4/14/2015'),
	('9655MLZ', 14649, 4, 6, 40788, '10/14/2018'),
	('4209NEK', 10767, 4, 6, 30494, '9/9/2015'),
	('5908ZPX', 12083, 6, 3, 18606, '6/15/2016'),
	('0050FUI', 17674, 9, 3, 69723, '12/3/2017'),
	('8349VRJ', 18530, 1, 6, 35174, '7/28/2016'),
	('4730WUA', 19153, 2, 2, 79259, '10/30/2012'),
	('1283DIW', 17546, 4, 1, 93362, '11/9/2012'),
	('9560LDM', 16469, 9, 3, 16239, '9/2/2010'),
	('0374TZN', 18076, 6, 3, 74438, '10/9/2010'),
	('4176JPP', 14061, 7, 2, 51174, '1/23/2014'),
	('8339FGV', 17649, 3, 2, 77688, '5/14/2013'),
	('6460UEM', 17619, 6, 2, 31394, '12/24/2017'),
	('3113MMW', 13873, 8, 3, 95156, '11/11/2012'),
	('7024DHB', 10538, 2, 2, 24153, '1/14/2015'),
	('6457QZL', 10140, 2, 5, 85686, '11/30/2014'),
	('4383YIN', 16533, 3, 4, 71948, '11/20/2019'),
	('4401BEJ', 13143, 1, 1, 86734, '5/18/2015'),
	('3190IEJ', 20121, 2, 6, 89403, '11/9/2015'),
	('2503NBH', 11437, 3, 4, 42633, '10/12/2015'),
	('7918WOE', 15430, 8, 4, 61842, '6/16/2018'),
	('9680HZM', 15140, 8, 5, 17954, '1/16/2016'),
	('1570XCP', 18753, 2, 4, 98196, '2/4/2011'),
	('3038XUB', 16428, 6, 1, 93735, '1/21/2018'),
	('6149NCQ', 13542, 5, 3, 60702, '12/28/2013'),
	('0747YDS', 15534, 9, 6, 45830, '5/6/2016'),
	('1034HZU', 12240, 6, 5, 55406, '2/8/2016'),
	('7093KNA', 18637, 7, 4, 11097, '10/14/2013'),
	('1198KZO', 17532, 1, 4, 35714, '4/16/2018'),
	('6267CNA', 12595, 7, 5, 44371, '8/23/2013'),
	('5869KYS', 10263, 8, 1, 72990, '6/20/2015'),
	('6145BSR', 11708, 5, 4, 13552, '10/20/2010'),
	('3166IPP', 17699, 8, 2, 43545, '1/22/2011'),
	('8138UOM', 13452, 7, 2, 49457, '8/2/2011'),
	('3035PJQ', 11269, 1, 1, 36338, '4/5/2015'),
	('9011TNC', 14952, 4, 1, 22199, '1/10/2018'),
	('8322APL', 18851, 1, 3, 69928, '6/6/2015'),
	('3706OMI', 12602, 6, 5, 83148, '9/21/2013'),
	('9820FAW', 16249, 4, 6, 11723, '9/7/2010'),
	('6020DHH', 15421, 5, 3, 48537, '5/21/2012'),
	('9958ASQ', 16335, 4, 5, 76067, '11/5/2018'),
	('3275KSW', 15198, 8, 5, 19613, '5/6/2014'),
	('5332YQN', 19641, 2, 4, 38081, '4/7/2011'),
	('5409TAB', 18568, 5, 4, 33266, '4/16/2019'),
	('0905BRN', 14268, 5, 2, 64950, '10/6/2011'),
	('7352OZL', 17467, 7, 2, 43777, '10/23/2018'),
	('7363GHY', 12542, 1, 4, 79346, '7/9/2013'),
	('9619NCD', 16430, 9, 5, 17422, '10/16/2016'),
	('7995MPZ', 17348, 1, 2, 29627, '2/11/2019'),
	('5165WCY', 16455, 2, 4, 71237, '2/7/2016'),
	('7866XRQ', 16368, 8, 3, 61097, '1/26/2019'),
	('2364YQR', 10913, 2, 5, 11098, '12/30/2016'),
	('8997IBX', 10934, 8, 6, 98246, '11/1/2011'),
	('8454MVR', 16071, 9, 3, 43298, '12/30/2012'),
	('2382OCX', 14078, 6, 6, 84605, '4/2/2016');

INSERT INTO
	sandra_moreno_palacios.revision (matricula, kilometros, importe, id_divisa, fecha)
VALUES
	('9748CSW', 3419, 467.41, 'KRW', '2/3/2001'),
	('0519DFP', 3388, 1940.27, 'KRW', '2/20/2009'),
	('9809HXU', 3564, 1024.35, 'CAD', '9/30/2002'),
	('8620ABR', 3038, 309.81, 'AUD', '1/3/2007'),
	('2428XAE', 3496, 1115.75, 'CAD', '7/31/2001'),
	('5647ZTR', 1637, 1554.32, 'EUR', '6/13/2005'),
	('1218WLT', 9966, 1407.56, 'KRW', '4/2/2008'),
	('6230XIT', 3798, 493.0, 'JPY', '1/26/2003'),
	('8173XRT', 5739, 1716.64, 'CAD', '1/1/2004'),
	('1564DMR', 8094, 662.22, 'USD', '2/25/2004'),
	('6110GYN', 1747, 1405.14, 'JPY', '12/2/2002'),
	('5391MSB', 2794, 1710.09, 'JPY', '10/13/2000'),
	('8898RTS', 4966, 1532.14, 'AUD', '8/27/2007'),
	('4272SFF', 3627, 460.21, 'USD', '7/11/2002'),
	('4772IVI', 3453, 1720.49, 'EUR', '10/1/2007'),
	('4830AWZ', 5448, 1632.62, 'JPY', '4/1/2007'),
	('7566RTG', 2240, 1457.62, 'KRW', '8/11/2003'),
	('0501QMI', 7801, 1702.36, 'CAD', '10/31/2001'),
	('9187YJN', 6584, 967.44, 'EUR', '7/30/2000'),
	('4027QWP', 7997, 1217.44, 'KRW', '4/22/2001'),
	('2859JPP', 8215, 1401.62, 'JPY', '3/18/2006'),
	('1982XOR', 3001, 849.19, 'EUR', '11/7/2008'),
	('4501WTN', 2901, 836.06, 'USD', '5/22/2006'),
	('0170BLV', 5110, 463.06, 'AUD', '12/2/2001'),
	('3855WXC', 6458, 1527.74, 'AUD', '1/6/2010'),
	('6683RAV', 9464, 105.3, 'EUR', '3/25/2002'),
	('0431DPP', 6354, 269.29, 'USD', '12/9/2006'),
	('1282JQH', 4099, 1566.67, 'USD', '12/24/2005'),
	('0463TKW', 7273, 1605.1, 'CAD', '3/10/2005'),
	('8811XZY', 5608, 288.74, 'KRW', '3/25/2006'),
	('5601FQL', 8138, 1890.4, 'EUR', '3/16/2009'),
	('0586WMV', 3059, 1142.71, 'KRW', '10/16/2004'),
	('1332XKT', 4971, 477.74, 'CAD', '5/28/2006'),
	('3671CZU', 2864, 1868.91, 'KRW', '7/30/2007'),
	('9073IYE', 6084, 1851.28, 'CAD', '11/12/2004'),
	('2978SOX', 6705, 823.63, 'JPY', '12/26/2004'),
	('3124GLI', 8844, 1014.87, 'CAD', '8/21/2003'),
	('4855YVT', 4526, 1432.96, 'EUR', '6/2/2010'),
	('1597EVZ', 3315, 132.67, 'JPY', '9/5/2005'),
	('6153DXH', 2458, 836.63, 'JPY', '3/25/2004'),
	('3640DBH', 9733, 1052.62, 'KRW', '3/18/2007'),
	('5114ROV', 6154, 224.43, 'EUR', '10/2/2000'),
	('3750WHS', 6651, 1528.54, 'KRW', '4/7/2006'),
	('4290MSR', 6980, 1460.51, 'JPY', '9/11/2007'),
	('7581TVZ', 4796, 135.03, 'USD', '11/19/2002'),
	('6337HHE', 8534, 774.28, 'KRW', '7/14/2006'),
	('9655MLZ', 8230, 1268.74, 'JPY', '7/12/2007'),
	('4209NEK', 9152, 701.34, 'CAD', '5/2/2000'),
	('5908ZPX', 2620, 1992.2, 'USD', '9/1/2005'),
	('0050FUI', 2852, 306.7, 'JPY', '3/28/2006'),
	('8349VRJ', 8657, 578.86, 'EUR', '4/11/2002'),
	('4730WUA', 3981, 1678.79, 'AUD', '4/26/2005'),
	('1283DIW', 5468, 644.38, 'KRW', '3/17/2004'),
	('9560LDM', 2707, 1533.07, 'EUR', '12/16/2003'),
	('0374TZN', 9632, 923.87, 'EUR', '5/2/2003'),
	('4176JPP', 9626, 1099.59, 'USD', '6/2/2010'),
	('8339FGV', 5854, 1845.87, 'JPY', '11/25/2003'),
	('6460UEM', 8196, 1164.93, 'CAD', '6/12/2003'),
	('3113MMW', 2237, 1648.5, 'KRW', '9/7/2002'),
	('7024DHB', 2150, 1711.08, 'USD', '1/3/2007'),
	('6457QZL', 2736, 729.9, 'JPY', '3/16/2010'),
	('4383YIN', 9321, 1117.8, 'USD', '7/15/2008'),
	('4401BEJ', 5400, 1915.02, 'AUD', '9/29/2010'),
	('3190IEJ', 2102, 688.05, 'CAD', '1/5/2006'),
	('2503NBH', 7859, 574.32, 'KRW', '11/27/2006'),
	('7918WOE', 2816, 1517.85, 'JPY', '1/16/2010'),
	('9680HZM', 4853, 197.23, 'CAD', '8/3/2003'),
	('1570XCP', 7652, 206.48, 'EUR', '8/26/2000'),
	('3038XUB', 8063, 1737.83, 'CAD', '9/11/2003'),
	('6149NCQ', 9338, 1079.65, 'AUD', '3/19/2010'),
	('0747YDS', 9469, 382.94, 'KRW', '4/26/2001'),
	('1034HZU', 2132, 1625.02, 'USD', '4/26/2004'),
	('7093KNA', 8919, 1737.65, 'CAD', '9/27/2009'),
	('1198KZO', 8371, 738.2, 'EUR', '7/31/2009'),
	('6267CNA', 5410, 1079.3, 'AUD', '12/27/2007'),
	('5869KYS', 8480, 1865.04, 'KRW', '8/28/2000'),
	('6145BSR', 3718, 111.14, 'KRW', '10/20/2004'),
	('3166IPP', 1604, 1166.38, 'JPY', '12/10/2000'),
	('8138UOM', 6254, 423.16, 'KRW', '4/24/2006'),
	('3035PJQ', 4093, 556.71, 'CAD', '12/28/2004'),
	('9011TNC', 9150, 1062.63, 'CAD', '8/15/2008'),
	('8322APL', 2632, 1428.5, 'CAD', '1/19/2001'),
	('3706OMI', 9945, 1958.28, 'CAD', '10/15/2007'),
	('9820FAW', 9457, 1392.79, 'KRW', '12/24/2004'),
	('6020DHH', 4622, 959.11, 'JPY', '2/25/2001'),
	('9958ASQ', 6839, 838.12, 'KRW', '10/26/2006'),
	('3275KSW', 9660, 591.29, 'AUD', '5/16/2009'),
	('5332YQN', 7639, 1687.77, 'EUR', '4/14/2004'),
	('5409TAB', 3237, 990.45, 'KRW', '12/3/2005'),
	('0905BRN', 3620, 1977.74, 'JPY', '12/7/2007'),
	('7352OZL', 5546, 744.66, 'CAD', '4/12/2005'),
	('7363GHY', 5058, 1108.69, 'JPY', '9/17/2008'),
	('9619NCD', 8505, 1264.92, 'KRW', '10/25/2002'),
	('7995MPZ', 4927, 1631.64, 'USD', '1/17/2005'),
	('5165WCY', 1793, 1776.08, 'USD', '7/2/2001'),
	('7866XRQ', 7558, 1620.19, 'EUR', '8/24/2005'),
	('2364YQR', 2644, 1848.89, 'AUD', '1/11/2008'),
	('8997IBX', 2612, 498.32, 'AUD', '7/29/2006'),
	('8454MVR', 4266, 1885.19, 'JPY', '2/12/2004'),
	('2382OCX', 2237, 935.18, 'EUR', '4/5/2001');

