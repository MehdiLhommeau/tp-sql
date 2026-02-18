create table magasins
(mag_num char(8) not null,
mag_loc varchar(25) not null,
mag_ger varchar(25) not null,
constraint magasins_pri primary key(mag_num));


create table clients
(clt_num char(8) not null,
clt_nom varchar(25) not null,
clt_pnom varchar(20),
clt_pays varchar(2) not null,
clt_loc varchar(20) not null,
clt_ca integer,
clt_type varchar(16),
constraint clients_pri primary key(clt_num));

create table fournisseurs
(frs_num char(8) not null,
frs_nom varchar(25),
constraint fournisseurs_pri primary key(frs_num));


create table articles
(art_num char(8) not null,
art_nom varchar(25) not null,
art_poids numeric(10,3),
art_coul varchar(20),
art_stock varchar(20),
art_pa integer not null,
art_pv integer not null,
art_frs char(8),
constraint articles_pri primary key(art_num),
constraint articles_et1 foreign key(art_frs) references fournisseurs(frs_num));


create table commandes
(cmd_num char(8) not null,
cmd_date date not null,
cmd_clt char(8) not null,
cmd_mag char(8) not null,
constraint commandes_pri primary key(cmd_num),
constraint commandes_et1 foreign key(cmd_clt) references clients(clt_num),
constraint commandes_et2 foreign key(cmd_mag) references magasins(mag_num));


create table lig_cmd
(
lcd_cmd char(8) not null,
lcd_art char(8) not null,
lcd_qte integer not null,
lcd_liv integer,
lcd_pu integer,
lcd_datliv date not null,
constraint lig_cmd_pri primary key(lcd_cmd,lcd_art),
constraint lig_cmd_et1 foreign key(lcd_cmd) references commandes(cmd_num),
constraint lig_cmd_et2 foreign key(lcd_art) references articles(art_num));

create table livraisons
(
liv_num char(8) not null,
liv_date date,
liv_clt char(8),
liv_mag char(8),
constraint livraisons_pri primary key(liv_num),
constraint livraisons_et1 foreign key(liv_clt) references clients(clt_num),
constraint livraisons_et2 foreign key(liv_mag) references magasins(mag_num));

create table lig_liv
(llv_liv char(8) not null,
llv_art char(8) not null,
llv_qte integer not null,
llv_cmd char(8) not null,
constraint lig_liv_pri primary key(llv_liv,llv_art),
constraint lig_liv_et1 foreign key(llv_liv) references livraisons(liv_num),
constraint lig_liv_et2 foreign key(llv_art) references articles(art_num),
constraint lig_liv_et3 foreign key(llv_cmd) references commandes(cmd_num));


insert into magasins values('M01','PARIS 5e','BERTON Louis');
insert into magasins values('M02','PARIS 10e','JANNEAU Luc');
insert into magasins values('M03','LYON','MOUILLARD Marcel');
insert into magasins values('M04','MARSEILLE','CAMUS Marius');
insert into magasins values('M05','MONTPELLIER','BAIJOT Marc');
insert into magasins values('M06','BORDEAUX','DETIENNE Nicole');
insert into magasins values('M07','NANTES','DUMONT Henri');
insert into magasins values('M08','TOURS','DEMARTEAU Renee');
insert into magasins values('M09','ROUEN','NOSSENT Daniel');
insert into magasins values('M10','LILLE','NIZET Jean-Luc');
insert into magasins values('M11','BRUXELLES','VANDERSMISSEN Fernand');
insert into magasins values('M12','LIEGE','HANNEAU Vincent');

insert into clients values('C01','DEFRERE','Marc','F','PARIS',806,'Particulier');
insert into clients values('C02','DECERF','Jean','F','PARIS',0,'Particulier');
insert into clients values('C03','DEFAWE','Leon','B','LIEGE',0,'Particulier');
insert into clients values('C04','NOSSENT','Serge','B','BRUXELLES',149,'Particulier');
insert into clients values('C05','JACOB','Marthe','F','MARSEILLE',31,'Administration');
insert into clients values('C06','JAMAR','Pierre','B','LIEGE',21,'Administration');
insert into clients values('C07','DECKERS','William','F','LYON',140,'Grand compte');
insert into clients values('C08','DECLERCQ','Lucien','B','BRUXELLES',349,'Grand compte');
insert into clients values('C09','DEFYZ','Maurice','F','BORDEAUX',0,'Particulier');
insert into clients values('C10','DEFOOZ','Francis','F','LILLE',60,'Particulier');
insert into clients values('C11','RAMJOIE','Victor','F','NANTES',0,'Particulier');
insert into clients values('C12','RENARDY','Jean','F','MARSEILLE',275,'Grand compte');
insert into clients values('C13','MANTEAU','Yvan','F','PARIS',320,'Grand compte');
insert into clients values('C14','JONAS','Henri','F','PARIS',0,'PME');
insert into clients values('C15','DELVENNE','Christian','F','LYON',0,'Grand compte');
insert into clients values('C16','DEFEEZ','Andre','F','LYON',0,'Particulier');

insert into fournisseurs values('F01','CASIO ELECTRONICS');
insert into fournisseurs values('F02','LES STYLOS REUNIS');
insert into fournisseurs values('F03','MECANIQUE DE PRECISION');
insert into fournisseurs values('F04','SARL ROULAND');
insert into fournisseurs values('F05','ELECTROLAMP');


insert into articles values('A01','AGRAFEUSE',150.0,'ROUGE',10,20,29,'F04');
insert into articles values('A02','CALCULATRICE',150.0,'NOIR',5,200,235,'F01');
insert into articles values('A03','CACHET-DATEUR',100.0,'BLANC',3,21,30,'F04');
insert into articles values('A04','LAMPE',550.0,'ROUGE',3,105,149,'F05');
insert into articles values('A05','LAMPE',550.0,'BLANC',3,105,149,'F05');
insert into articles values('A06','LAMPE',550.0,'BLEU',3,105,149,'F05');
insert into articles values('A07','LAMPE',550.0,'VERT',3,105,149,'F05');
insert into articles values('A08','PESE-LETTRE 1-500',NULL,NULL,2,120,200,'F03');
insert into articles values('A09','PESE-LETTRE 1-1000',NULL,NULL,2,150,250,'F03');
insert into articles values('A10','CRAYON',20.0,'ROUGE',210,1,2,'F02');
insert into articles values('A11','CRAYON',20.0,'BLEU',190,1,2,'F02');
insert into articles values('A12','CRAYON LUXE',20.0,'ROUGE',95,3,5,'F02');
insert into articles values('A13','CRAYON LUXE',20.0,'VERT',90,3,5,'F02');
insert into articles values('A14','CRAYON LUXE',20.0,'BLEU',80,3,5,'F02');
insert into articles values('A15','CRAYON LUXE',20.0,'NOIR',450,3,5,'F02');

insert into commandes values('C9401','1994-06-06','C07','M03');
insert into commandes values('C9402','1994-06-06','C06','M12');
insert into commandes values('C9403','1994-06-06','C13','M01');
insert into commandes values('C9404','1994-06-06','C01','M02');
insert into commandes values('C9405','1994-06-06','C08','M11');
insert into commandes values('C9406','1994-06-07','C05','M04');
insert into commandes values('C9407','1994-06-07','C04','M11');
insert into commandes values('C9408','1994-06-08','C03','M12');
insert into commandes values('C9409','1994-06-08','C10','M11');
insert into commandes values('C9410','1994-06-08','C01','M11');
insert into commandes values('C9411','1994-06-09','C12','M01');
insert into commandes values('C9412','1994-06-10','C01','M11');

insert into lig_cmd values('C9401','A04',1,1,140,'1994-06-06');
insert into lig_cmd values('C9402','A10',1,1,2,'1994-06-06');
insert into lig_cmd values('C9402','A11',2,2,2,'1994-06-06');
insert into lig_cmd values('C9402','A14',3,3,5,'1994-06-06');
insert into lig_cmd values('C9403','A02',1,1,230,'1994-06-06');
insert into lig_cmd values('C9403','A03',2,2,30,'1994-06-06');
insert into lig_cmd values('C9403','A15',5,5,4,'1994-06-06');
insert into lig_cmd values('C9403','A14',1,1,5,'1994-06-06');
insert into lig_cmd values('C9403','A13',1,1,5,'1994-06-06');
insert into lig_cmd values('C9404','A02',2,0,235,'1994-06-10');
insert into lig_cmd values('C9404','A12',1,0,5,'1994-06-10');
insert into lig_cmd values('C9404','A13',10,0,4,'1994-06-10');
insert into lig_cmd values('C9404','A15',8,0,4,'1994-06-10');
insert into lig_cmd values('C9404','A05',1,0,149,'1994-06-10');
insert into lig_cmd values('C9405','A06',1,1,149,'1994-06-06');
insert into lig_cmd values('C9405','A08',1,1,200,'1994-06-06');
insert into lig_cmd values('C9406','A10',1,1,2,'1994-06-07');
insert into lig_cmd values('C9407','A07',1,0,149,'1994-06-10');
insert into lig_cmd values('C9408','A01',1,1,29,'1994-06-08');
insert into lig_cmd values('C9409','A12',3,1,5,'1994-06-08');
insert into lig_cmd values('C9409','A13',3,1,5,'1994-06-08');
insert into lig_cmd values('C9409','A14',3,1,5,'1994-06-08');
insert into lig_cmd values('C9409','A15',3,1,5,'1994-06-08');
insert into lig_cmd values('C9410','A12',8,8,5,'1994-06-08');
insert into lig_cmd values('C9410','A14',8,8,5,'1994-06-08');
insert into lig_cmd values('C9411','A09',1,0,250,'1994-06-14');
insert into lig_cmd values('C9411','A15',5,5,5,'1994-06-09');
insert into lig_cmd values('C9412','A03',1,0,30,'1994-06-15');

insert into livraisons values('L9401','1994-06-06','C07','M03');
insert into livraisons values('L9402','1994-06-06','C06','M12');
insert into livraisons values('L9403','1994-06-06','C13','M01');
insert into livraisons values('L9404','1994-06-06','C08','M11');
insert into livraisons values('L9405','1994-06-06','C05','M04');
insert into livraisons values('L9406','1994-06-06','C03','M12');
insert into livraisons values('L9407','1994-06-08','C10','M11');
insert into livraisons values('L9408','1994-06-08','C01','M11');
insert into livraisons values('L9409','1994-06-09','C12','M01');

insert into lig_liv values('L9401','A04','1','C9401');
insert into lig_liv values('L9402','A10','1','C9402');
insert into lig_liv values('L9402','A11','2','C9402');
insert into lig_liv values('L9402','A14','3','C9402');
insert into lig_liv values('L9403','A02','1','C9403');
insert into lig_liv values('L9403','A03','2','C9403');
insert into lig_liv values('L9403','A15','5','C9403');
insert into lig_liv values('L9403','A14','1','C9403');
insert into lig_liv values('L9403','A13','1','C9403');
insert into lig_liv values('L9404','A06','1','C9405');
insert into lig_liv values('L9404','A08','1','C9405');
insert into lig_liv values('L9405','A10','1','C9406');
insert into lig_liv values('L9406','A01','1','C9408');
insert into lig_liv values('L9407','A12','1','C9409');
insert into lig_liv values('L9407','A13','1','C9409');
insert into lig_liv values('L9407','A14','1','C9409');
insert into lig_liv values('L9407','A15','1','C9409');
insert into lig_liv values('L9408','A12','8','C9410');
insert into lig_liv values('L9408','A14','8','C9410');
insert into lig_liv values('L9409','A15','5','C9411');

