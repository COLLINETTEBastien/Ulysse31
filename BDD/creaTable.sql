
/*==============================================================*/
/* Table: CARTE                                                 */
/*==============================================================*/
create table CARTE
(
   CODEC                varchar(20) not null,
   IDJC                 int not null,
   LABELC               varchar(200),
   VALEURC              int,
   COULEURC             varchar(200),
   IMAGEC               longblob,
   primary key (CODEC)
);

/*==============================================================*/
/* Table: CONFIGURATION                                         */
/*==============================================================*/
create table CONFIGURATION
(
   IDCONF               int not null,
   primary key (IDCONF)
);

/*==============================================================*/
/* Table: DATE                                                  */
/*==============================================================*/
create table DATE
(
   DATECONF             datetime not null,
   primary key (DATECONF)
);

/*==============================================================*/
/* Table: JEUCARTE                                              */
/*==============================================================*/
create table JEUCARTE
(
   IDJC                 int not null,
   LABELJC              varchar(200),
   URLJC                varchar(300),
   primary key (IDJC)
);

/*==============================================================*/
/* Table: JHUMAINE                                              */
/*==============================================================*/
create table JHUMAINE
(
   IDJ                  int not null,
   DATECREAJ            datetime,
   COULEURJ             varchar(200),
   NOMJH                varchar(200),
   PRENOMJH             varchar(200),
   LOGIN                varchar(50),
   MDPJH                varchar(50),
   primary key (IDJ)
);

/*==============================================================*/
/* Table: JIA                                                   */
/*==============================================================*/
create table JIA
(
   IDJ                  int not null,
   DATECREAJ            datetime,
   COULEURJ             varchar(200),
   NOMIA                varchar(200),
   primary key (IDJ)
);

/*==============================================================*/
/* Table: JOUEUSE                                               */
/*==============================================================*/
create table JOUEUSE
(
   IDJ                  int not null,
   DATECREAJ            datetime,
   COULEURJ             varchar(200),
   primary key (IDJ)
);

/*==============================================================*/
/* Table: LGN_CONFIA                                            */
/*==============================================================*/
create table LGN_CONFIA
(
   IDJ                  int not null,
   IDCONF               int not null,
   DATECONF             datetime not null,
   VALIA                int,
   primary key (IDJ, IDCONF, DATECONF)
);

/*==============================================================*/
/* Table: MANCHE                                                */
/*==============================================================*/
create table MANCHE
(
   IDM                  int not null,
   IDP                  int not null,
   IDJ                  int not null,
   JIA_IDJ              int not null,
   SCOREJ1              int,
   SCOREJ2              int,
   DATEDEBUTM           datetime,
   DATEFINM             datetime,
   GAGNANTEM            int,
   primary key (IDM)
);

/*==============================================================*/
/* Table: PARTIE                                                */
/*==============================================================*/
create table PARTIE
(
   IDP                  int not null,
   IDJC                 int not null,
   IDJ                  int not null,
   JIA_IDJ              int not null,
   DATEDEBUTP           datetime,
   DATEFINP             datetime,
   GAGNANTEP            int,
   primary key (IDP)
);

/*==============================================================*/
/* Table: TOUR                                                  */
/*==============================================================*/
create table TOUR
(
   IDT                  int not null,
   IDM                  int not null,
   IDJ                  int not null,
   JIA_IDJ              int not null,
   SCORECOURANTJ1       int,
   SCORECOURANTJ2       int,
   COGNEJ1              bool,
   COGNEJ2              bool,
   PILEPIOCHEJ1         varchar(200),
   PILEPIOCHEJ2         varchar(200),
   CARTEPIOCHEJ1        varchar(200),
   CARTEPIOCHEJ2        varchar(200),
   CARTEDEFAUSSEJ1      varchar(200),
   CARTEDEFAUSSEJ2      varchar(200),
   primary key (IDT)
);

alter table CARTE add constraint FK_LGN_C foreign key (IDJC)
      references JEUCARTE (IDJC) on delete restrict on update restrict;

alter table JHUMAINE add constraint FK_INHERITANCE_2 foreign key (IDJ)
      references JOUEUSE (IDJ) on delete restrict on update restrict;

alter table JIA add constraint FK_INHERITANCE_1 foreign key (IDJ)
      references JOUEUSE (IDJ) on delete restrict on update restrict;

alter table LGN_CONFIA add constraint FK_LGN_CONFIA foreign key (IDJ)
      references JIA (IDJ) on delete restrict on update restrict;

alter table LGN_CONFIA add constraint FK_LGN_CONFIA2 foreign key (IDCONF)
      references CONFIGURATION (IDCONF) on delete restrict on update restrict;

alter table LGN_CONFIA add constraint FK_LGN_CONFIA3 foreign key (DATECONF)
      references DATE (DATECONF) on delete restrict on update restrict;

alter table MANCHE add constraint FK_LGN_M foreign key (IDP)
      references PARTIE (IDP) on delete restrict on update restrict;

alter table MANCHE add constraint FK_LGN_MH foreign key (IDJ)
      references JHUMAINE (IDJ) on delete restrict on update restrict;

alter table MANCHE add constraint FK_LGN_MIA foreign key (JIA_IDJ)
      references JIA (IDJ) on delete restrict on update restrict;

alter table PARTIE add constraint FK_LGN_JC foreign key (IDJC)
      references JEUCARTE (IDJC) on delete restrict on update restrict;

alter table PARTIE add constraint FK_LGN_PARTIEIA foreign key (JIA_IDJ)
      references JIA (IDJ) on delete restrict on update restrict;

alter table PARTIE add constraint FK_LGN_PARTIEJ foreign key (IDJ)
      references JHUMAINE (IDJ) on delete restrict on update restrict;

alter table TOUR add constraint FK_LGN_T foreign key (IDM)
      references MANCHE (IDM) on delete restrict on update restrict;

alter table TOUR add constraint FK_LGN_TH foreign key (IDJ)
      references JHUMAINE (IDJ) on delete restrict on update restrict;

alter table TOUR add constraint FK_LGN_TIA foreign key (JIA_IDJ)
      references JIA (IDJ) on delete restrict on update restrict;

