/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     29/5/2022 01:21:24 a. m.                     */
/*==============================================================*/



/*==============================================================*/
/* Table: area                                                  */
/*==============================================================*/
create table area (
   idarea               serial               not null,
   nombrearea           varchar(200)         not null,
   constraint pk_area primary key (idarea)
);

/*==============================================================*/
/* Index: area_pk                                               */
/*==============================================================*/
create unique index area_pk on area (
idarea
);

/*==============================================================*/
/* Table: chequeo                                               */
/*==============================================================*/
create table chequeo (
   idchequeo            serial               not null,
   idpaciente           int4                 null,
   idlaboratorio        int4                 null,
   idusuario            int4                 null,
   fechachequeo         date                 not null,
   horachequeo          time                 not null,
   estadochequeo        bool                 null                 DEFAULT false,
   constraint pk_chequeo primary key (idchequeo)
);

/*==============================================================*/
/* Index: chequeo_pk                                            */
/*==============================================================*/
create unique index chequeo_pk on chequeo (
idchequeo
);

/*==============================================================*/
/* Index: se_realiza_fk                                         */
/*==============================================================*/
create  index se_realiza_fk on chequeo (
idpaciente
);

/*==============================================================*/
/* Index: se_programa_en_fk                                     */
/*==============================================================*/
create  index se_programa_en_fk on chequeo (
idlaboratorio
);

/*==============================================================*/
/* Index: programa__fk                                          */
/*==============================================================*/
create  index programa__fk on chequeo (
idusuario
);

/*==============================================================*/
/* Table: contactoemergencia                                    */
/*==============================================================*/
create table contactoemergencia (
   idcontacto           serial               not null,
   idpaciente           int4                 null,
   telefono             varchar(200)         not null,
   nombrecontacto       varchar(200)         not null,
   constraint pk_contactoemergencia primary key (idcontacto)
);

/*==============================================================*/
/* Index: contactoemergencia_pk                                 */
/*==============================================================*/
create unique index contactoemergencia_pk on contactoemergencia (
idcontacto
);

/*==============================================================*/
/* Index: tiene_un_fk                                           */
/*==============================================================*/
create  index tiene_un_fk on contactoemergencia (
idpaciente
);

/*==============================================================*/
/* Table: departamento                                          */
/*==============================================================*/
create table departamento (
   iddepartamento       serial               not null,
   departamento         varchar(200)         not null,
   constraint pk_departamento primary key (iddepartamento)
);

/*==============================================================*/
/* Index: departamento_pk                                       */
/*==============================================================*/
create unique index departamento_pk on departamento (
iddepartamento
);

/*==============================================================*/
/* Table: detallechequeo                                        */
/*==============================================================*/
create table detallechequeo (
   iddetalle            serial               not null,
   idexamen             int4                 not null,
   idchequeo            int4                 not null,
   estadoexamen         bool                 null                 DEFAULT false,
   fecharegistro        date                 null                 DEFAULT null,
   horaregistro         time                 null                 DEFAULT null,
   archivo              varchar(300)         null                 DEFAULT null,
   constraint pk_detallechequeo primary key (iddetalle)
);

/*==============================================================*/
/* Index: detallechequeo_fk                                     */
/*==============================================================*/
create  index detallechequeo_fk on detallechequeo (
idexamen
);

/*==============================================================*/
/* Index: detallechequeo_2_fk                                   */
/*==============================================================*/
create  index detallechequeo_2_fk on detallechequeo (
idchequeo
);

/*==============================================================*/
/* Table: detalleexamen                                         */
/*==============================================================*/
create table detalleexamen (
   idexamen             int4                 not null,
   idparametro          int4                 not null,
   constraint pk_detalleexamen primary key (idexamen, idparametro)
);

/*==============================================================*/
/* Index: detalleexamen_pk                                      */
/*==============================================================*/
create unique index detalleexamen_pk on detalleexamen (
idexamen,
idparametro
);

/*==============================================================*/
/* Index: detalleexamen2_fk                                     */
/*==============================================================*/
create  index detalleexamen2_fk on detalleexamen (
idparametro
);

/*==============================================================*/
/* Index: detalleexamen_fk                                      */
/*==============================================================*/
create  index detalleexamen_fk on detalleexamen (
idexamen
);

/*==============================================================*/
/* Table: detallerol                                            */
/*==============================================================*/
create table detallerol (
   idusuario            int4                 not null,
   idrol                int4                 not null,
   constraint pk_detallerol primary key (idusuario, idrol)
);

/*==============================================================*/
/* Index: detallerol_pk                                         */
/*==============================================================*/
create unique index detallerol_pk on detallerol (
idusuario,
idrol
);

/*==============================================================*/
/* Index: detallerol2_fk                                        */
/*==============================================================*/
create  index detallerol2_fk on detallerol (
idrol
);

/*==============================================================*/
/* Index: detallerol_fk                                         */
/*==============================================================*/
create  index detallerol_fk on detallerol (
idusuario
);

/*==============================================================*/
/* Table: estadocivil                                           */
/*==============================================================*/
create table estadocivil (
   idestado             serial               not null,
   estadocivil          varchar(200)         not null,
   constraint pk_estadocivil primary key (idestado)
);

/*==============================================================*/
/* Index: estadocivil_pk                                        */
/*==============================================================*/
create unique index estadocivil_pk on estadocivil (
idestado
);

/*==============================================================*/
/* Table: examen                                                */
/*==============================================================*/
create table examen (
   idexamen             serial               not null,
   idarea               int4                 null,
   nombreexamen         varchar(200)         not null,
   constraint pk_examen primary key (idexamen)
);

/*==============================================================*/
/* Index: examen_pk                                             */
/*==============================================================*/
create unique index examen_pk on examen (
idexamen
);

/*==============================================================*/
/* Index: define_fk                                             */
/*==============================================================*/
create  index define_fk on examen (
idarea
);

/*==============================================================*/
/* Table: intervalo                                             */
/*==============================================================*/
create table intervalo (
   idintervalo          serial               not null,
   idparametro          int4                 null,
   idunidad             int4                 null,
   idpoblacion          int4                 null,
   comentariopositivo   varchar(50)          not null,
   comentarionegativo   varchar(200)         not null,
   valormaximo          decimal(4,2)         not null,
   valorminimo          decimal(4,2)         not null,
   constraint pk_intervalo primary key (idintervalo)
);

/*==============================================================*/
/* Index: intervalo_pk                                          */
/*==============================================================*/
create unique index intervalo_pk on intervalo (
idintervalo
);

/*==============================================================*/
/* Index: es_determinado_fk                                     */
/*==============================================================*/
create  index es_determinado_fk on intervalo (
idparametro
);

/*==============================================================*/
/* Index: tiene_una_fk                                          */
/*==============================================================*/
create  index tiene_una_fk on intervalo (
idunidad
);

/*==============================================================*/
/* Index: se_divide_en_fk                                       */
/*==============================================================*/
create  index se_divide_en_fk on intervalo (
idpoblacion
);

/*==============================================================*/
/* Table: laboratorio                                           */
/*==============================================================*/
create table laboratorio (
   idlaboratorio        serial               not null,
   idmunicipio          int4                 null,
   nombrelaboratorio    varchar(200)         not null,
   constraint pk_laboratorio primary key (idlaboratorio)
);

/*==============================================================*/
/* Index: laboratorio_pk                                        */
/*==============================================================*/
create unique index laboratorio_pk on laboratorio (
idlaboratorio
);

/*==============================================================*/
/* Index: se_encuentra_en_fk                                    */
/*==============================================================*/
create  index se_encuentra_en_fk on laboratorio (
idmunicipio
);

/*==============================================================*/
/* Table: laboratorista                                         */
/*==============================================================*/
create table laboratorista (
   idlaboratorista      serial               not null,
   idprofesion          int4                 null,
   idusuario            int4                 null,
   numerojuntavigilacia int4                 not null,
   constraint pk_laboratorista primary key (idlaboratorista)
);

/*==============================================================*/
/* Index: laboratorista_pk                                      */
/*==============================================================*/
create unique index laboratorista_pk on laboratorista (
idlaboratorista
);

/*==============================================================*/
/* Index: ejerce_fk                                             */
/*==============================================================*/
create  index ejerce_fk on laboratorista (
idprofesion
);

/*==============================================================*/
/* Index: es_un_fk                                              */
/*==============================================================*/
create  index es_un_fk on laboratorista (
idusuario
);

/*==============================================================*/
/* Table: muestra                                               */
/*==============================================================*/
create table muestra (
   idmuestra            serial               not null,
   iddetalle            int4                 null,
   observaciones        varchar(300)         null,
   fechaingreso         date                 null,
   horaingreso          time                 null,
   constraint pk_muestra primary key (idmuestra)
);

/*==============================================================*/
/* Index: muestra_pk                                            */
/*==============================================================*/
create unique index muestra_pk on muestra (
idmuestra
);

/*==============================================================*/
/* Index: se_ingresa__fk                                        */
/*==============================================================*/
create  index se_ingresa__fk on muestra (
iddetalle
);

/*==============================================================*/
/* Table: municipio                                             */
/*==============================================================*/
create table municipio (
   idmunicipio          serial               not null,
   iddepartamento       int4                 null,
   municipio            varchar(200)         not null,
   constraint pk_municipio primary key (idmunicipio)
);

/*==============================================================*/
/* Index: municipio_pk                                          */
/*==============================================================*/
create unique index municipio_pk on municipio (
idmunicipio
);

/*==============================================================*/
/* Index: conforman_fk                                          */
/*==============================================================*/
create  index conforman_fk on municipio (
iddepartamento
);

/*==============================================================*/
/* Table: numerotelefono                                        */
/*==============================================================*/
create table numerotelefono (
   idnumero             serial               not null,
   idpaciente           int4                 null,
   numero               varchar(100)         not null,
   nombreidentificador  varchar(200)         not null,
   constraint pk_numerotelefono primary key (idnumero)
);

/*==============================================================*/
/* Index: numerotelefono_pk                                     */
/*==============================================================*/
create unique index numerotelefono_pk on numerotelefono (
idnumero
);

/*==============================================================*/
/* Index: contacto_fk                                           */
/*==============================================================*/
create  index contacto_fk on numerotelefono (
idpaciente
);

/*==============================================================*/
/* Table: opcion                                                */
/*==============================================================*/
create table opcion (
   idopcion             serial               not null,
   idparametro          int4                 null,
   opcion               varchar(200)         not null,
   referencia           bool                 not null,
   constraint pk_opcion primary key (idopcion)
);

/*==============================================================*/
/* Index: opcion_pk                                             */
/*==============================================================*/
create unique index opcion_pk on opcion (
idopcion
);

/*==============================================================*/
/* Index: posee_fk                                              */
/*==============================================================*/
create  index posee_fk on opcion (
idparametro
);

/*==============================================================*/
/* Table: opcionpermiso                                         */
/*==============================================================*/
create table opcionpermiso (
   idopcionpermiso      serial               not null,
   accion               varchar(200)         not null,
   constraint pk_opcionpermiso primary key (idopcionpermiso)
);

/*==============================================================*/
/* Index: opcionpermiso_pk                                      */
/*==============================================================*/
create unique index opcionpermiso_pk on opcionpermiso (
idopcionpermiso
);

/*==============================================================*/
/* Table: paciente                                              */
/*==============================================================*/
create table paciente (
   idpaciente           serial               not null,
   idmunicipio          int4                 null,
   idestado             int4                 null,
   nombrepaciente       varchar(200)         not null,
   apellido             varchar(200)         not null,
   genero               varchar(10)          null,
   direccion            varchar(200)         not null,
   fechanacimiento      date                 not null,
   correopaciente       varchar(200)         not null,
   constraint pk_paciente primary key (idpaciente)
);

/*==============================================================*/
/* Index: paciente_pk                                           */
/*==============================================================*/
create unique index paciente_pk on paciente (
idpaciente
);

/*==============================================================*/
/* Index: pertenece_a_fk                                        */
/*==============================================================*/
create  index pertenece_a_fk on paciente (
idmunicipio
);

/*==============================================================*/
/* Index: tiene_fk                                              */
/*==============================================================*/
create  index tiene_fk on paciente (
idestado
);

/*==============================================================*/
/* Table: parametro                                             */
/*==============================================================*/
create table parametro (
   idparametro          serial               not null,
   idarea               int4                 null,
   parametro            varchar(200)         not null,
   tipo                 numeric(2)           not null,
   constraint pk_parametro primary key (idparametro)
);

/*==============================================================*/
/* Index: parametro_pk                                          */
/*==============================================================*/
create unique index parametro_pk on parametro (
idparametro
);

/*==============================================================*/
/* Index: establece_fk                                          */
/*==============================================================*/
create  index establece_fk on parametro (
idarea
);

/*==============================================================*/
/* Table: permiso                                               */
/*==============================================================*/
create table permiso (
   idopcionpermiso      int4                 not null,
   idrol                int4                 not null,
   constraint pk_permiso primary key (idopcionpermiso, idrol)
);

/*==============================================================*/
/* Index: permiso_pk                                            */
/*==============================================================*/
create unique index permiso_pk on permiso (
idopcionpermiso,
idrol
);

/*==============================================================*/
/* Index: permiso2_fk                                           */
/*==============================================================*/
create  index permiso2_fk on permiso (
idrol
);

/*==============================================================*/
/* Index: permiso_fk                                            */
/*==============================================================*/
create  index permiso_fk on permiso (
idopcionpermiso
);

/*==============================================================*/
/* Table: poblacion                                             */
/*==============================================================*/
create table poblacion (
   idpoblacion          serial               not null,
   edadminimo           numeric(3)           not null,
   edadmaximo           numeric(3)           not null,
   poblacion            varchar(200)         not null,
   constraint pk_poblacion primary key (idpoblacion)
);

/*==============================================================*/
/* Index: poblacion_pk                                          */
/*==============================================================*/
create unique index poblacion_pk on poblacion (
idpoblacion
);

/*==============================================================*/
/* Table: profesion                                             */
/*==============================================================*/
create table profesion (
   idprofesion          serial               not null,
   nombreprofesion      varchar(200)         not null,
   constraint pk_profesion primary key (idprofesion)
);

/*==============================================================*/
/* Index: profesion_pk                                          */
/*==============================================================*/
create unique index profesion_pk on profesion (
idprofesion
);

/*==============================================================*/
/* Table: resultado                                             */
/*==============================================================*/
create table resultado (
   idresultado          serial               not null,
   idparametro          int4                 null,
   iddetalle            int4                 null,
   valor                numeric(8,2)         null,
   opcion               varchar(100)         null,
   positivo             bool                 not null,
   comentario           varchar(200)         null,
   presencia            int2                 not null,
   constraint pk_resultado primary key (idresultado)
);

/*==============================================================*/
/* Index: resultado_pk                                          */
/*==============================================================*/
create unique index resultado_pk on resultado (
idresultado
);

/*==============================================================*/
/* Index: se_describe_con_fk                                    */
/*==============================================================*/
create  index se_describe_con_fk on resultado (
idparametro
);

/*==============================================================*/
/* Index: se_reporta__fk                                        */
/*==============================================================*/
create  index se_reporta__fk on resultado (
iddetalle
);

/*==============================================================*/
/* Table: rol                                                   */
/*==============================================================*/
create table rol (
   idrol                serial               not null,
   nombrerol            varchar(200)         not null,
   constraint pk_rol primary key (idrol)
);

/*==============================================================*/
/* Index: rol_pk                                                */
/*==============================================================*/
create unique index rol_pk on rol (
idrol
);

/*==============================================================*/
/* Table: unidad                                                */
/*==============================================================*/
create table unidad (
   idunidad             serial               not null,
   nombreunidad         varchar(200)         not null,
   simbolo              varchar(10)          null,
   constraint pk_unidad primary key (idunidad)
);

/*==============================================================*/
/* Index: unidad_pk                                             */
/*==============================================================*/
create unique index unidad_pk on unidad (
idunidad
);

/*==============================================================*/
/* Table: usuario                                               */
/*==============================================================*/
create table usuario (
   idusuario            serial               not null,
   idlaboratorio        int4                 null,
   contrasenia          varchar(300)         not null,
   estado               bool                 null,
   nombreusuario        varchar(200)         not null,
   correousuario        varchar(200)         not null,
   constraint pk_usuario primary key (idusuario)
);

/*==============================================================*/
/* Index: usuario_pk                                            */
/*==============================================================*/
create unique index usuario_pk on usuario (
idusuario
);

/*==============================================================*/
/* Index: trabaja_en_fk                                         */
/*==============================================================*/
create  index trabaja_en_fk on usuario (
idlaboratorio
);

alter table chequeo
   add constraint fk_chequeo_programa__usuario foreign key (idusuario)
      references usuario (idusuario)
      on delete restrict on update restrict;

alter table chequeo
   add constraint fk_chequeo_se_progra_laborato foreign key (idlaboratorio)
      references laboratorio (idlaboratorio)
      on delete restrict on update restrict;

alter table chequeo
   add constraint fk_chequeo_se_realiz_paciente foreign key (idpaciente)
      references paciente (idpaciente)
      on delete restrict on update restrict;

alter table contactoemergencia
   add constraint fk_contacto_tiene_un_paciente foreign key (idpaciente)
      references paciente (idpaciente)
      on delete restrict on update restrict;

alter table detallechequeo
   add constraint fk_detallec_detallech_examen foreign key (idexamen)
      references examen (idexamen)
      on delete restrict on update restrict;

alter table detallechequeo
   add constraint fk_detallec_detallech_chequeo foreign key (idchequeo)
      references chequeo (idchequeo)
      on delete restrict on update restrict;

alter table detalleexamen
   add constraint fk_detallee_detalleex_examen foreign key (idexamen)
      references examen (idexamen)
      on delete restrict on update restrict;

alter table detalleexamen
   add constraint fk_detallee_detalleex_parametr foreign key (idparametro)
      references parametro (idparametro)
      on delete restrict on update restrict;

alter table detallerol
   add constraint fk_detaller_detallero_usuario foreign key (idusuario)
      references usuario (idusuario)
      on delete restrict on update restrict;

alter table detallerol
   add constraint fk_detaller_detallero_rol foreign key (idrol)
      references rol (idrol)
      on delete restrict on update restrict;

alter table examen
   add constraint fk_examen_define_area foreign key (idarea)
      references area (idarea)
      on delete restrict on update restrict;

alter table intervalo
   add constraint fk_interval_es_determ_parametr foreign key (idparametro)
      references parametro (idparametro)
      on delete restrict on update restrict;

alter table intervalo
   add constraint fk_interval_se_divide_poblacio foreign key (idpoblacion)
      references poblacion (idpoblacion)
      on delete restrict on update restrict;

alter table intervalo
   add constraint fk_interval_tiene_una_unidad foreign key (idunidad)
      references unidad (idunidad)
      on delete restrict on update restrict;

alter table laboratorio
   add constraint fk_laborato_se_encuen_municipi foreign key (idmunicipio)
      references municipio (idmunicipio)
      on delete restrict on update restrict;

alter table laboratorista
   add constraint fk_laborato_ejerce_profesio foreign key (idprofesion)
      references profesion (idprofesion)
      on delete restrict on update restrict;

alter table laboratorista
   add constraint fk_laborato_es_un_usuario foreign key (idusuario)
      references usuario (idusuario)
      on delete restrict on update restrict;

alter table muestra
   add constraint fk_muestra_se_ingres_detallec foreign key (iddetalle)
      references detallechequeo (iddetalle)
      on delete restrict on update restrict;

alter table municipio
   add constraint fk_municipi_conforman_departam foreign key (iddepartamento)
      references departamento (iddepartamento)
      on delete restrict on update restrict;

alter table numerotelefono
   add constraint fk_numerote_contacto_paciente foreign key (idpaciente)
      references paciente (idpaciente)
      on delete restrict on update restrict;

alter table opcion
   add constraint fk_opcion_posee_parametr foreign key (idparametro)
      references parametro (idparametro)
      on delete restrict on update restrict;

alter table paciente
   add constraint fk_paciente_pertenece_municipi foreign key (idmunicipio)
      references municipio (idmunicipio)
      on delete restrict on update restrict;

alter table paciente
   add constraint fk_paciente_tiene_estadoci foreign key (idestado)
      references estadocivil (idestado)
      on delete restrict on update restrict;

alter table parametro
   add constraint fk_parametr_establece_area foreign key (idarea)
      references area (idarea)
      on delete restrict on update restrict;

alter table permiso
   add constraint fk_permiso_permiso_opcionpe foreign key (idopcionpermiso)
      references opcionpermiso (idopcionpermiso)
      on delete restrict on update restrict;

alter table permiso
   add constraint fk_permiso_permiso2_rol foreign key (idrol)
      references rol (idrol)
      on delete restrict on update restrict;

alter table resultado
   add constraint fk_resultad_se_descri_parametr foreign key (idparametro)
      references parametro (idparametro)
      on delete restrict on update restrict;

alter table resultado
   add constraint fk_resultad_se_report_detallec foreign key (iddetalle)
      references detallechequeo (iddetalle)
      on delete restrict on update restrict;

alter table usuario
   add constraint fk_usuario_trabaja_e_laborato foreign key (idlaboratorio)
      references laboratorio (idlaboratorio)
      on delete restrict on update restrict;

