prompt PL/SQL Developer Export User Objects for user WIICAREKH@192.168.0.70:1521/WIICARE
prompt Created by qianhua on 2018��6��28��
set define off
spool kh.log

prompt
prompt Creating table CDR_RESTORE_MQ
prompt =============================
prompt
create table CDR_RESTORE_MQ
(
  mqid            VARCHAR2(36),
  operate_type    VARCHAR2(10),
  operate_time    DATE,
  operate_object  VARCHAR2(50),
  operate_content CLOB,
  mq_flag         NUMBER(1) default 0,
  createtime      DATE
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table CDSS_ACTIONITEMLABELTEMPLETE
prompt ===========================================
prompt
create table CDSS_ACTIONITEMLABELTEMPLETE
(
  actionid VARCHAR2(20),
  options  VARCHAR2(1000)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table CDSS_ACTIONITEMMONITORTEMPLETE
prompt =============================================
prompt
create table CDSS_ACTIONITEMMONITORTEMPLETE
(
  indexcode        VARCHAR2(20),
  actionids        VARCHAR2(50),
  monitortype      VARCHAR2(50),
  monitorname      VARCHAR2(500),
  itemcode         VARCHAR2(20),
  monitortimelimit NUMBER,
  monitortimerange VARCHAR2(20),
  checkmethod      VARCHAR2(200)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column CDSS_ACTIONITEMMONITORTEMPLETE.indexcode
  is '�������';
comment on column CDSS_ACTIONITEMMONITORTEMPLETE.actionids
  is '��ʹ�õĻ���';
comment on column CDSS_ACTIONITEMMONITORTEMPLETE.monitortype
  is '�������';
comment on column CDSS_ACTIONITEMMONITORTEMPLETE.monitorname
  is '�����ʾ����';
comment on column CDSS_ACTIONITEMMONITORTEMPLETE.itemcode
  is '��Ӧ���';
comment on column CDSS_ACTIONITEMMONITORTEMPLETE.monitortimelimit
  is '�����ʱ����ޣ�Сʱ����ִ��ʱ���޶�';
comment on column CDSS_ACTIONITEMMONITORTEMPLETE.monitortimerange
  is '�����ʱ�䷶Χ��Сʱ���������ֵ�޶�';
comment on column CDSS_ACTIONITEMMONITORTEMPLETE.checkmethod
  is 'ϵͳչ�ֺ��ж���ʽ';

prompt
prompt Creating table CDSS_ACTIONTEMPLETE
prompt ==================================
prompt
create table CDSS_ACTIONTEMPLETE
(
  actionid       VARCHAR2(20),
  actionname     VARCHAR2(50),
  actiontype     VARCHAR2(50),
  userroles      VARCHAR2(50),
  ruleid         VARCHAR2(50),
  nextactionid   VARCHAR2(200),
  actionparms    VARCHAR2(100),
  frequency      NUMBER,
  actionperiod   NUMBER,
  continuoustime NUMBER(5,2)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CDSS_ACTION_PARAMS
prompt =================================
prompt
create table CDSS_ACTION_PARAMS
(
  id           VARCHAR2(50) default sys_guid() not null,
  patient_id   VARCHAR2(20),
  caseno       VARCHAR2(50),
  params_name  VARCHAR2(2000),
  params_value VARCHAR2(50),
  creator      VARCHAR2(20),
  create_time  DATE default sysdate,
  modifier     VARCHAR2(20),
  modify_time  DATE,
  gentime      TIMESTAMP(6),
  ishasexcute  INTEGER,
  description  CLOB,
  params_code  VARCHAR2(500),
  ruleid       VARCHAR2(20),
  actionid     VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 384K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table CDSS_ACTION_PARAMS
  is 'Bundle_���������';
comment on column CDSS_ACTION_PARAMS.id
  is '����Ψһֵ';
comment on column CDSS_ACTION_PARAMS.patient_id
  is '���߱��';
comment on column CDSS_ACTION_PARAMS.caseno
  is 'bundle����';
comment on column CDSS_ACTION_PARAMS.params_name
  is '������';
comment on column CDSS_ACTION_PARAMS.params_value
  is '����ֵ';
comment on column CDSS_ACTION_PARAMS.creator
  is '������';
comment on column CDSS_ACTION_PARAMS.create_time
  is '����ʱ��';
comment on column CDSS_ACTION_PARAMS.modifier
  is '������';
comment on column CDSS_ACTION_PARAMS.modify_time
  is '����ʱ��';
comment on column CDSS_ACTION_PARAMS.gentime
  is '����ʱ��';
comment on column CDSS_ACTION_PARAMS.ishasexcute
  is '�Ƿ��ѵ�����';
comment on column CDSS_ACTION_PARAMS.params_code
  is '�������';
comment on column CDSS_ACTION_PARAMS.ruleid
  is '������';
comment on column CDSS_ACTION_PARAMS.actionid
  is 'bundle�¼�����';
alter table CDSS_ACTION_PARAMS
  add primary key (ID)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CDSS_BLOODSUGAR_SUGGESTION
prompt =========================================
prompt
create table CDSS_BLOODSUGAR_SUGGESTION
(
  id              VARCHAR2(50) default sys_guid(),
  suggestion_type NUMBER,
  suggestion_code VARCHAR2(50),
  rule_expression VARCHAR2(1000),
  sugar_min       NUMBER(5,2),
  sugar_max       NUMBER(5,2),
  soultion_desc   VARCHAR2(500),
  soultion_dose   NUMBER(5,2),
  creator         VARCHAR2(20),
  create_time     DATE default sysdate,
  modifier        VARCHAR2(20),
  modify_time     DATE,
  description     VARCHAR2(1000)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table CDSS_BLOODSUGAR_SUGGESTION
  is 'Ѫ�Ǽ��_�����';
comment on column CDSS_BLOODSUGAR_SUGGESTION.id
  is '����Ψһֵ';
comment on column CDSS_BLOODSUGAR_SUGGESTION.suggestion_type
  is '��������';
comment on column CDSS_BLOODSUGAR_SUGGESTION.suggestion_code
  is '�������';
comment on column CDSS_BLOODSUGAR_SUGGESTION.rule_expression
  is '������ʽ';
comment on column CDSS_BLOODSUGAR_SUGGESTION.sugar_min
  is '����Ѫ��ֵ����';
comment on column CDSS_BLOODSUGAR_SUGGESTION.sugar_max
  is '����Ѫ��ֵ����';
comment on column CDSS_BLOODSUGAR_SUGGESTION.soultion_desc
  is '������������';
comment on column CDSS_BLOODSUGAR_SUGGESTION.soultion_dose
  is 'ִ�м���';
comment on column CDSS_BLOODSUGAR_SUGGESTION.creator
  is '������';
comment on column CDSS_BLOODSUGAR_SUGGESTION.create_time
  is '����ʱ��';
comment on column CDSS_BLOODSUGAR_SUGGESTION.modifier
  is '������';
comment on column CDSS_BLOODSUGAR_SUGGESTION.modify_time
  is '����ʱ��';
comment on column CDSS_BLOODSUGAR_SUGGESTION.description
  is '��������';

prompt
prompt Creating table CDSS_BLOODSUGAR_TIME_GAP
prompt =======================================
prompt
create table CDSS_BLOODSUGAR_TIME_GAP
(
  id                      VARCHAR2(50) default sys_guid(),
  rule_type               NUMBER(1),
  sugar_min               NUMBER(5,2),
  sugar_max               NUMBER(5,2),
  description             VARCHAR2(500),
  rule_expression         VARCHAR2(1000),
  retest_time_gap         VARCHAR2(50),
  retest_time_gap_sepcial VARCHAR2(50),
  creator                 VARCHAR2(20),
  create_time             DATE default sysdate,
  modifier                VARCHAR2(20),
  modify_time             DATE,
  gap_code                VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table CDSS_BLOODSUGAR_TIME_GAP
  is 'Ѫ�Ǽ��_����ʱ���';
comment on column CDSS_BLOODSUGAR_TIME_GAP.id
  is '����Ψһֵ';
comment on column CDSS_BLOODSUGAR_TIME_GAP.rule_type
  is '��������';
comment on column CDSS_BLOODSUGAR_TIME_GAP.sugar_min
  is '����Ѫ��ֵ����';
comment on column CDSS_BLOODSUGAR_TIME_GAP.sugar_max
  is '����Ѫ��ֵ����';
comment on column CDSS_BLOODSUGAR_TIME_GAP.description
  is '���������������';
comment on column CDSS_BLOODSUGAR_TIME_GAP.rule_expression
  is '���������ʽ';
comment on column CDSS_BLOODSUGAR_TIME_GAP.retest_time_gap
  is '������ʱ��';
comment on column CDSS_BLOODSUGAR_TIME_GAP.retest_time_gap_sepcial
  is '��������µĸ�����ʱ��';
comment on column CDSS_BLOODSUGAR_TIME_GAP.creator
  is '������';
comment on column CDSS_BLOODSUGAR_TIME_GAP.create_time
  is '����ʱ��';
comment on column CDSS_BLOODSUGAR_TIME_GAP.modifier
  is '�޸���';
comment on column CDSS_BLOODSUGAR_TIME_GAP.modify_time
  is '�޸�ʱ��';
comment on column CDSS_BLOODSUGAR_TIME_GAP.gap_code
  is '���������';

prompt
prompt Creating table CDSS_DATASYNC
prompt ============================
prompt
create table CDSS_DATASYNC
(
  sync_id          VARCHAR2(20),
  sync_name        VARCHAR2(20),
  sync_method_name VARCHAR2(50),
  sync_content     VARCHAR2(200),
  sync_frequnce    NUMBER(20),
  enable           NUMBER(1),
  sync_lasttime    DATE
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column CDSS_DATASYNC.sync_id
  is 'ͬ�����';
comment on column CDSS_DATASYNC.sync_name
  is 'ͬ������';
comment on column CDSS_DATASYNC.sync_method_name
  is 'ͬ����Ӧ����';
comment on column CDSS_DATASYNC.sync_content
  is 'ͬ������˵��';
comment on column CDSS_DATASYNC.sync_frequnce
  is 'ͬ��Ƶ�ʣ��룩';
comment on column CDSS_DATASYNC.enable
  is '�Ƿ���ã�0 ������ 1���ã�';
comment on column CDSS_DATASYNC.sync_lasttime
  is '���ͬ��ʱ��';

prompt
prompt Creating table CDSS_EVENTCALENDAR
prompt =================================
prompt
create table CDSS_EVENTCALENDAR
(
  event_id       VARCHAR2(50),
  caseno         VARCHAR2(50),
  patient_id     VARCHAR2(20),
  actionid       VARCHAR2(20),
  event_code     VARCHAR2(20),
  event_type     VARCHAR2(20),
  event_name     VARCHAR2(1000),
  time_point     INTEGER,
  start_time     DATE,
  end_time       DATE,
  item_code      VARCHAR2(20),
  repeat_type    INTEGER,
  repeat_content VARCHAR2(1000)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table CDSS_EVENTCALENDAR
  is '�¼�ʵ���ƻ�����';
comment on column CDSS_EVENTCALENDAR.event_id
  is '�¼�ʵ�����';
comment on column CDSS_EVENTCALENDAR.caseno
  is 'BUNDLEʵ�����';
comment on column CDSS_EVENTCALENDAR.patient_id
  is '���߱��';
comment on column CDSS_EVENTCALENDAR.actionid
  is 'ʵ������';
comment on column CDSS_EVENTCALENDAR.event_code
  is '�¼���Ŀ���
';
comment on column CDSS_EVENTCALENDAR.event_type
  is '�¼���Ŀ����';
comment on column CDSS_EVENTCALENDAR.event_name
  is '�¼���Ŀ����';
comment on column CDSS_EVENTCALENDAR.time_point
  is '����ʱ��㣬1�㣬2�㣬3��.....';
comment on column CDSS_EVENTCALENDAR.start_time
  is '��ʼʱ��';
comment on column CDSS_EVENTCALENDAR.end_time
  is '����ʱ��';
comment on column CDSS_EVENTCALENDAR.item_code
  is '��Ӧ�������';
comment on column CDSS_EVENTCALENDAR.repeat_type
  is '�ظ�����';
comment on column CDSS_EVENTCALENDAR.repeat_content
  is '�ظ�����';

prompt
prompt Creating table CDSS_EVENTITEMS
prompt ==============================
prompt
create table CDSS_EVENTITEMS
(
  event_code     VARCHAR2(20),
  event_type     VARCHAR2(20),
  event_name     VARCHAR2(1000),
  item_code      VARCHAR2(20),
  repeat_type    VARCHAR2(20),
  repeat_content VARCHAR2(1000),
  time_point     NUMBER(2)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table CDSS_EVENTITEMS
  is '�¼���Ŀ�ֵ�';
comment on column CDSS_EVENTITEMS.event_code
  is '�¼�����';
comment on column CDSS_EVENTITEMS.event_type
  is '�¼����ͣ�����������Ԥ����';
comment on column CDSS_EVENTITEMS.event_name
  is 'ʱ������';
comment on column CDSS_EVENTITEMS.item_code
  is '��Ӧ�����Ŀ���';
comment on column CDSS_EVENTITEMS.repeat_type
  is '�ظ����ͣ�1����ѭ������2���������ڣ�';
comment on column CDSS_EVENTITEMS.repeat_content
  is '�ظ�����';
comment on column CDSS_EVENTITEMS.time_point
  is 'һ�����ѿ�ʼʱ���';

prompt
prompt Creating table CDSS_MONITORCASE
prompt ===============================
prompt
create table CDSS_MONITORCASE
(
  caseno            VARCHAR2(50),
  casetype          VARCHAR2(50),
  patient_id        VARCHAR2(20),
  starttime         TIMESTAMP(6),
  endtime           TIMESTAMP(6),
  monitorcaseconfig VARCHAR2(500),
  casename          VARCHAR2(100),
  patientname       VARCHAR2(50),
  periodtime        NUMBER(2),
  periodcount       NUMBER(2),
  status            NUMBER(2),
  timeout           FLOAT,
  inward_visitid    VARCHAR2(20),
  version           VARCHAR2(100)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CDSS_MONITORCASEACTION
prompt =====================================
prompt
create table CDSS_MONITORCASEACTION
(
  caseno          VARCHAR2(50),
  patient_id      VARCHAR2(20),
  actionid        VARCHAR2(20),
  employee_id     VARCHAR2(20),
  starttime       TIMESTAMP(6),
  endtime         TIMESTAMP(6),
  status          NUMBER,
  userroles       VARCHAR2(20),
  employeename    VARCHAR2(20),
  accessemployees VARCHAR2(100),
  actionresult    VARCHAR2(2000),
  actionparms     VARCHAR2(2000),
  actionkey       VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CDSS_MONITORCASETEMPLETE
prompt =======================================
prompt
create table CDSS_MONITORCASETEMPLETE
(
  casetype          VARCHAR2(20),
  casetypename      VARCHAR2(50),
  monitorcaseconfig VARCHAR2(500),
  startactivityid   VARCHAR2(20),
  periodtime        NUMBER(2),
  periodcount       NUMBER(2),
  timeout           FLOAT,
  version           VARCHAR2(200),
  filtercondition   VARCHAR2(1000),
  viewcolor         VARCHAR2(50),
  ismanual          NUMBER(2)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column CDSS_MONITORCASETEMPLETE.casetype
  is 'bundle���ͱ��';
comment on column CDSS_MONITORCASETEMPLETE.casetypename
  is 'bundle��������';
comment on column CDSS_MONITORCASETEMPLETE.monitorcaseconfig
  is '�����Ŀ����';
comment on column CDSS_MONITORCASETEMPLETE.startactivityid
  is '��ʼ����';
comment on column CDSS_MONITORCASETEMPLETE.periodtime
  is '�������ʾ���';
comment on column CDSS_MONITORCASETEMPLETE.periodcount
  is '�������ʾ����';
comment on column CDSS_MONITORCASETEMPLETE.timeout
  is '����ʱ��';
comment on column CDSS_MONITORCASETEMPLETE.version
  is 'bundle�汾';
comment on column CDSS_MONITORCASETEMPLETE.filtercondition
  is '���˼�ػ��߷�Χ�������ʾȫ�������where��������䣩';
comment on column CDSS_MONITORCASETEMPLETE.viewcolor
  is '��ɫ��ʶ';
comment on column CDSS_MONITORCASETEMPLETE.ismanual
  is '�Ƿ���ֹ�����';

prompt
prompt Creating table CDSS_MONITORCASE_ITEMDETAIL
prompt ==========================================
prompt
create table CDSS_MONITORCASE_ITEMDETAIL
(
  caseno           VARCHAR2(50),
  indexcode        VARCHAR2(20),
  ismanualbydoctor NUMBER,
  doctormanualtime TIMESTAMP(6),
  ismanualbynurse  NUMBER,
  nursemanualtime  TIMESTAMP(6),
  indexstatuscode  NUMBER,
  indexstatustime  TIMESTAMP(6),
  itemcode         VARCHAR2(20),
  indexname        VARCHAR2(100),
  itemcontent      VARCHAR2(2000),
  itemurl          VARCHAR2(1000),
  checkmethod      VARCHAR2(200),
  monitortimerange VARCHAR2(50),
  starttime        TIMESTAMP(6),
  monitortimelimit NUMBER(2)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column CDSS_MONITORCASE_ITEMDETAIL.indexstatuscode
  is '0:false,10:true';
comment on column CDSS_MONITORCASE_ITEMDETAIL.itemcontent
  is '������ݣ�Json��ʾ�����Ӧ����';

prompt
prompt Creating table CDSS_MONITORITEMVALUE
prompt ====================================
prompt
create table CDSS_MONITORITEMVALUE
(
  itemcode        VARCHAR2(20),
  patientid       VARCHAR2(20),
  itemvalue       VARCHAR2(500),
  ismonitor       NUMBER,
  isreachstandard NUMBER,
  gentime         TIMESTAMP(6),
  createtime      TIMESTAMP(6),
  itemname        VARCHAR2(500),
  itemsource      VARCHAR2(50),
  origindata      CLOB
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 3M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column CDSS_MONITORITEMVALUE.origindata
  is 'ԭʼ����JSON';

prompt
prompt Creating table CDSS_MONITOR_REMIND
prompt ==================================
prompt
create table CDSS_MONITOR_REMIND
(
  id              VARCHAR2(50) not null,
  patient_id      VARCHAR2(20) not null,
  caseno          VARCHAR2(50) not null,
  actionid        VARCHAR2(20) not null,
  excute_time     DATE not null,
  is_nurse_excute INTEGER,
  is_call_doctor  INTEGER,
  creator         VARCHAR2(20),
  create_time     DATE default sysdate,
  modifier        VARCHAR2(20),
  modify_time     DATE
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table CDSS_MONITOR_REMIND
  is 'Bundle_�����¼��';
comment on column CDSS_MONITOR_REMIND.id
  is '����Ψһֵ';
comment on column CDSS_MONITOR_REMIND.patient_id
  is '���߱��';
comment on column CDSS_MONITOR_REMIND.caseno
  is 'bundle����';
comment on column CDSS_MONITOR_REMIND.actionid
  is '�¼����';
comment on column CDSS_MONITOR_REMIND.excute_time
  is '����ʱ��';
comment on column CDSS_MONITOR_REMIND.is_nurse_excute
  is '��ʿ�Ƿ���ִ��';
comment on column CDSS_MONITOR_REMIND.is_call_doctor
  is '�Ƿ���֪ͨҽ��';
comment on column CDSS_MONITOR_REMIND.creator
  is '������';
comment on column CDSS_MONITOR_REMIND.create_time
  is '����ʱ��';
comment on column CDSS_MONITOR_REMIND.modifier
  is '������';
comment on column CDSS_MONITOR_REMIND.modify_time
  is '����ʱ��';
alter table CDSS_MONITOR_REMIND
  add primary key (ID)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table CDSS_RULEKEYITEMS
prompt ================================
prompt
create table CDSS_RULEKEYITEMS
(
  itemcode           VARCHAR2(20),
  itemname           VARCHAR2(50),
  itemtype           VARCHAR2(20),
  itemunit           VARCHAR2(20),
  itemstandard       VARCHAR2(50),
  itemstandardtype   VARCHAR2(20),
  itemchoosestandard VARCHAR2(20),
  itemchooserange    VARCHAR2(50),
  includekeywords    VARCHAR2(2000)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column CDSS_RULEKEYITEMS.itemchoosestandard
  is 'ȡֵ��׼��AVGƽ����MAXȡ���ֵ��MINȡ��Сֵ��SUM��3��ȡ��ǰʱ��㵽֮ǰ3Сʱ�ڵĺϼ�ֵ';
comment on column CDSS_RULEKEYITEMS.itemchooserange
  is 'ȡ��ʼFIRST������LAST��ȫ��ʱ���ALL|ȡʱ��γ���|�޳���߻����|�޳��ļ�¼��';
comment on column CDSS_RULEKEYITEMS.includekeywords
  is '�����Ĺؼ���';

prompt
prompt Creating table CDSS_RULETEMPLETE
prompt ================================
prompt
create table CDSS_RULETEMPLETE
(
  ruleid        VARCHAR2(20),
  rulename      VARCHAR2(50),
  triggerfactor VARCHAR2(500),
  condition     VARCHAR2(500),
  validhours    NUMBER(5,2)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column CDSS_RULETEMPLETE.ruleid
  is '����ID';
comment on column CDSS_RULETEMPLETE.rulename
  is '��������';
comment on column CDSS_RULETEMPLETE.triggerfactor
  is '������������';
comment on column CDSS_RULETEMPLETE.condition
  is '������ʽ';
comment on column CDSS_RULETEMPLETE.validhours
  is '��Ч����ʱ�䣬��ǰʱ����ǰСʱ��';

prompt
prompt Creating table CDSS_SEPSISBUNDLE_ITEMDETAIL
prompt ===========================================
prompt
create table CDSS_SEPSISBUNDLE_ITEMDETAIL
(
  caseno           VARCHAR2(50),
  indexcode        VARCHAR2(20),
  ismanualbydoctor NUMBER,
  doctormanualtime TIMESTAMP(6),
  ismanualbynurse  NUMBER,
  nursemanualtime  TIMESTAMP(6),
  indexstatuscode  NUMBER,
  indexstatustime  TIMESTAMP(6),
  itemcode         VARCHAR2(20),
  indexname        VARCHAR2(100),
  monitortimerange VARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table CDSS_SEPSISBUNDLE_ITEMSUMMARY
prompt ============================================
prompt
create table CDSS_SEPSISBUNDLE_ITEMSUMMARY
(
  caseno            VARCHAR2(50),
  itemcode          VARCHAR2(20),
  standardvalue     VARCHAR2(50),
  reachstandardtime DATE,
  noreachreason     VARCHAR2(50),
  itemvalues        VARCHAR2(2000),
  itemname          VARCHAR2(100),
  noreachreasonid   VARCHAR2(50),
  itemstandardtype  VARCHAR2(25)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table COM_DICTIONARY
prompt =============================
prompt
create table COM_DICTIONARY
(
  type         VARCHAR2(255),
  code         VARCHAR2(255),
  name         VARCHAR2(255),
  mark         VARCHAR2(1000),
  spell_code   VARCHAR2(255),
  wb_code      VARCHAR2(255),
  input_code   VARCHAR2(255),
  sort_id      NUMBER,
  valid_state  VARCHAR2(255),
  oper_code    VARCHAR2(255),
  oper_date    DATE,
  is_common    VARCHAR2(255),
  kind_id      VARCHAR2(255),
  parent_code  VARCHAR2(255),
  current_code VARCHAR2(255),
  unique_id    VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table MED_BLOOD_GAS_DETAIL
prompt ===================================
prompt
create table MED_BLOOD_GAS_DETAIL
(
  detail_id          VARCHAR2(30) not null,
  blg_code           VARCHAR2(60) not null,
  blg_value          VARCHAR2(20),
  operator           VARCHAR2(20),
  op_date            DATE,
  abnormal_indicator VARCHAR2(2)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table MED_BLOOD_GAS_DETAIL
  add constraint BLG_DETAIL_PKEY primary key (DETAIL_ID, BLG_CODE)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MED_BLOOD_GAS_DICT
prompt =================================
prompt
create table MED_BLOOD_GAS_DICT
(
  blg_code        VARCHAR2(20) not null,
  blg_name        VARCHAR2(60),
  blg_showid      NUMBER not null,
  blg_unit        VARCHAR2(20),
  blg_refer_value VARCHAR2(40),
  blg_status      VARCHAR2(2) not null,
  blg_input_code  VARCHAR2(20),
  blg_attr_code   VARCHAR2(100),
  blg_item_id     NUMBER(4)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table MED_BLOOD_GAS_DICT
  add constraint BLD_PRIMARY_KEY primary key (BLG_CODE, BLG_SHOWID, BLG_STATUS)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MED_BLOOD_GAS_MASTER
prompt ===================================
prompt
create table MED_BLOOD_GAS_MASTER
(
  patient_id  VARCHAR2(20),
  visit_id    NUMBER(2),
  record_date DATE,
  nurse_memo1 VARCHAR2(600),
  nurse_memo2 VARCHAR2(600),
  detail_id   VARCHAR2(30) not null,
  operator    VARCHAR2(20),
  op_date     DATE,
  specimen    VARCHAR2(100),
  equipment   VARCHAR2(100),
  oper_id     NUMBER(2)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table MED_BLOOD_GAS_MASTER
  add constraint BLOD_PRIMARY_KEY primary key (DETAIL_ID)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MED_MONITOR_FUNCTION_CODE
prompt ========================================
prompt
create table MED_MONITOR_FUNCTION_CODE
(
  item_id         NUMBER(5),
  item_name       VARCHAR2(40),
  item_code       VARCHAR2(6) not null,
  item_unit       VARCHAR2(8),
  dis_color       NUMBER(8),
  parm_class      VARCHAR2(1),
  draw_icon       VARCHAR2(2),
  use_flag        VARCHAR2(1),
  priority_indi   NUMBER(1),
  memo            VARCHAR2(24),
  input_code      VARCHAR2(8),
  name_in_icu     VARCHAR2(16),
  ward_code       VARCHAR2(8),
  ward_type       NUMBER(2),
  item_name_alias VARCHAR2(8),
  value_type      NUMBER(1),
  exam_method     NUMBER(1),
  in_or_out       NUMBER(1),
  item_type       NUMBER(1),
  calc_sum        NUMBER(1),
  print_item_no   NUMBER(2),
  draw_style      NUMBER(1) default 1,
  draw_isvalid    NUMBER(1) default 1,
  show_sub_code   VARCHAR2(10),
  data_table_code VARCHAR2(100)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table MED_MONITOR_FUNCTION_CODE
  add constraint PK_MED_MONITOR_FUNCTION_CODE primary key (ITEM_CODE)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ODBC_IMPORT
prompt ==========================
prompt
create table ODBC_IMPORT
(
  ����        VARCHAR2(255),
  ����        VARCHAR2(255),
  unique_id VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table SYS_TEMP_FBT
prompt ===========================
prompt
create global temporary table SYS_TEMP_FBT
(
  schema      VARCHAR2(32),
  object_name VARCHAR2(32),
  object#     NUMBER,
  rid         UROWID(4000),
  action      CHAR(1)
)
on commit preserve rows;

prompt
prompt Creating table T1
prompt =================
prompt
create table T1
(
  a VARCHAR2(10),
  b VARCHAR2(10),
  c VARCHAR2(10)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table T2
prompt =================
prompt
create table T2
(
  a VARCHAR2(10),
  c VARCHAR2(10),
  d INTEGER
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table T3
prompt =================
prompt
create table T3
(
  a VARCHAR2(10),
  b VARCHAR2(10),
  c VARCHAR2(10)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table TEST
prompt ===================
prompt
create table TEST
(
  id   NUMBER,
  name CHAR(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table TMP_001
prompt ======================
prompt
create table TMP_001
(
  transfer_sequence_no VARCHAR2(20),
  inpatient_visitid    VARCHAR2(20) not null,
  transfer_time        DATE not null,
  transfer_reason_code VARCHAR2(20),
  transfer_reason_memo VARCHAR2(100),
  patient_id           VARCHAR2(20) not null,
  dept_stayed          VARCHAR2(16),
  ward_stayed          VARCHAR2(16),
  bed_stayed           VARCHAR2(20),
  dept_from            VARCHAR2(16),
  ward_from            VARCHAR2(16),
  bed_from             VARCHAR2(20),
  doctor_in_charge     VARCHAR2(30),
  create_time          DATE,
  creator              VARCHAR2(50),
  visit_id             NUMBER(3) not null,
  unique_id            VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table TMP_003
prompt ======================
prompt
create table TMP_003
(
  his_code  VARCHAR2(255),
  name      VARCHAR2(255),
  code      VARCHAR2(255),
  unique_id VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table TMP_004
prompt ======================
prompt
create table TMP_004
(
  order_no     VARCHAR2(255),
  order_sub_no VARCHAR2(255),
  unique_id    VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table WII_ANTIBIOTIC_DIC
prompt =================================
prompt
create table WII_ANTIBIOTIC_DIC
(
  antibiotic_pharm_name_c VARCHAR2(50),
  pharmacy_code           VARCHAR2(50),
  pharmacy_chemname       VARCHAR2(50),
  unit                    VARCHAR2(50),
  pack_quan               VARCHAR2(50),
  pharmacy_form           VARCHAR2(10),
  dose_per_unit           VARCHAR2(20),
  dose_units              VARCHAR2(20),
  ddd_value               VARCHAR2(20),
  ddd_unit                VARCHAR2(20),
  input_code              VARCHAR2(50),
  memo                    VARCHAR2(50),
  valid                   VARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_ANTIBIOTIC_DIC.antibiotic_pharm_name_c
  is '����ҩƷ��������';
comment on column WII_ANTIBIOTIC_DIC.pharmacy_code
  is 'HISҩƷ����';
comment on column WII_ANTIBIOTIC_DIC.pharmacy_chemname
  is 'HISҩƷ��ѧ����';
comment on column WII_ANTIBIOTIC_DIC.unit
  is '��λ';
comment on column WII_ANTIBIOTIC_DIC.pack_quan
  is '��װ������';
comment on column WII_ANTIBIOTIC_DIC.pharmacy_form
  is '���ͣ���Һ��';
comment on column WII_ANTIBIOTIC_DIC.dose_per_unit
  is '������';
comment on column WII_ANTIBIOTIC_DIC.dose_units
  is '������λ';
comment on column WII_ANTIBIOTIC_DIC.ddd_value
  is 'dddֵ';
comment on column WII_ANTIBIOTIC_DIC.ddd_unit
  is 'ddd��λ';
comment on column WII_ANTIBIOTIC_DIC.input_code
  is '��������ĸ(������룩';
comment on column WII_ANTIBIOTIC_DIC.memo
  is '��ע';
comment on column WII_ANTIBIOTIC_DIC.valid
  is '��Ч�ԣ�0-��Ч��1-��Ч��';

prompt
prompt Creating table WII_APKVERSION
prompt =============================
prompt
create table WII_APKVERSION
(
  versioncode        VARCHAR2(50),
  versionname        VARCHAR2(50),
  packagename        VARCHAR2(50),
  sdkversion         VARCHAR2(50),
  targetsdkversion   VARCHAR2(50),
  applicationlabel   VARCHAR2(50),
  applicationicon    VARCHAR2(50),
  launchableactivity VARCHAR2(50),
  updatedon          DATE default sysdate,
  updatedby          VARCHAR2(50),
  fileaddress        VARCHAR2(200)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_APKVERSION.versioncode
  is '�汾��';
comment on column WII_APKVERSION.versionname
  is '�汾����';
comment on column WII_APKVERSION.packagename
  is '����';
comment on column WII_APKVERSION.sdkversion
  is '֧�ֵ�SDK�汾';
comment on column WII_APKVERSION.targetsdkversion
  is '�����SDK�汾';
comment on column WII_APKVERSION.applicationlabel
  is 'Ӧ�ó�����';
comment on column WII_APKVERSION.applicationicon
  is '�����ͼ��';
comment on column WII_APKVERSION.launchableactivity
  is '��������';
comment on column WII_APKVERSION.updatedon
  is '����ʱ��';
comment on column WII_APKVERSION.updatedby
  is '������';
comment on column WII_APKVERSION.fileaddress
  is '�ļ���ַ';

prompt
prompt Creating table WII_ARCHIVES_PERMISSION
prompt ======================================
prompt
create table WII_ARCHIVES_PERMISSION
(
  permission_id   VARCHAR2(40),
  archives_id     VARCHAR2(40),
  permission_type NUMBER(1),
  creator         NVARCHAR2(20),
  create_time     DATE default sysdate,
  modifier        NVARCHAR2(20),
  modify_time     DATE,
  user_id         VARCHAR2(40)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_ARCHIVES_PERMISSION.permission_id
  is '���й鵵Ȩ��ID';
comment on column WII_ARCHIVES_PERMISSION.archives_id
  is '������ĿID';
comment on column WII_ARCHIVES_PERMISSION.permission_type
  is '0-ȫ�����ƣ�1-ֻ����2-�ɱ༭';
comment on column WII_ARCHIVES_PERMISSION.creator
  is '������';
comment on column WII_ARCHIVES_PERMISSION.create_time
  is '����ʱ��';
comment on column WII_ARCHIVES_PERMISSION.modifier
  is '�޸���';
comment on column WII_ARCHIVES_PERMISSION.modify_time
  is '�޸�ʱ��';
comment on column WII_ARCHIVES_PERMISSION.user_id
  is '�û�ID';

prompt
prompt Creating table WII_AUTHORITY
prompt ============================
prompt
create table WII_AUTHORITY
(
  sw_version_no       NUMBER(2),
  authority_id        VARCHAR2(50),
  domain_id           VARCHAR2(36),
  name                NVARCHAR2(100),
  authority_url       VARCHAR2(160),
  status              NUMBER(1),
  parent_authority_id VARCHAR2(36),
  description         VARCHAR2(160),
  authority_type      VARCHAR2(20),
  sequence            NUMBER(3),
  pigeonhole_module   VARCHAR2(30),
  icon_name           VARCHAR2(20),
  abbreviation        VARCHAR2(40),
  creator             NVARCHAR2(20),
  create_time         DATE default sysdate,
  modifier            NVARCHAR2(20),
  modify_time         DATE,
  unique_id           VARCHAR2(50) default sys_guid(),
  child_is_config     NUMBER(1)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_AUTHORITY.sw_version_no
  is '����汾��';
comment on column WII_AUTHORITY.authority_id
  is '��Ȩ��ԴID';
comment on column WII_AUTHORITY.domain_id
  is '��ID';
comment on column WII_AUTHORITY.name
  is '����';
comment on column WII_AUTHORITY.authority_url
  is 'URL';
comment on column WII_AUTHORITY.status
  is '����״̬��0��ͣ��
1�����ã�';
comment on column WII_AUTHORITY.parent_authority_id
  is '����Դ�ڵ�';
comment on column WII_AUTHORITY.description
  is '����';
comment on column WII_AUTHORITY.authority_type
  is 'Ȩ����Դ���(0:ϵͳ 1:ģ�� 2:�˵� 3ҳ��˵� 4��ɫ��ť����   5:ר�ư�ť 6 ��������� 7 ������ģ�� 10:ǰ��·�� 50 ��̨�ӿ�)';
comment on column WII_AUTHORITY.sequence
  is '����';
comment on column WII_AUTHORITY.pigeonhole_module
  is '�鵵ģ��';
comment on column WII_AUTHORITY.icon_name
  is 'ͼ������';
comment on column WII_AUTHORITY.abbreviation
  is '���';
comment on column WII_AUTHORITY.unique_id
  is '����ΨһID';
comment on column WII_AUTHORITY.child_is_config
  is '�Ƿ���������';

prompt
prompt Creating table WII_BACTERIA_DIC
prompt ===============================
prompt
create table WII_BACTERIA_DIC
(
  bacteria_code       VARCHAR2(30) not null,
  bacteria_name_c     NVARCHAR2(60),
  bacteria_class_name NVARCHAR2(60),
  input_code          VARCHAR2(20),
  memo                NVARCHAR2(100),
  valid               NUMBER(1)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_BACTERIA_DIC
  is '��ԭ���ֵ��';
comment on column WII_BACTERIA_DIC.bacteria_code
  is '��ԭ��Code';
comment on column WII_BACTERIA_DIC.bacteria_name_c
  is '��ԭ������';
comment on column WII_BACTERIA_DIC.bacteria_class_name
  is '��ԭ����������';
comment on column WII_BACTERIA_DIC.input_code
  is '��������ĸ(������룩';
comment on column WII_BACTERIA_DIC.memo
  is '��ע���ص�������';
comment on column WII_BACTERIA_DIC.valid
  is '��Ч�ԣ�0-��Ч��1-��Ч��';
alter table WII_BACTERIA_DIC
  add constraint PK_BACTERIA_CODE primary key (BACTERIA_CODE)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WII_BAD_EVENT
prompt ============================
prompt
create table WII_BAD_EVENT
(
  inpatient_visitid     VARCHAR2(20),
  time_point            DATE,
  level_code            VARCHAR2(20),
  event_code            VARCHAR2(20),
  part_code             VARCHAR2(20),
  report_time           DATE,
  reporter              VARCHAR2(20),
  verify_first_time     DATE,
  verify_first_analysis VARCHAR2(200),
  verify_first_by       VARCHAR2(20),
  verify_second_time    DATE,
  verify_second_memo    VARCHAR2(200),
  verify_second_by      VARCHAR2(20),
  verify_third_time     DATE,
  verify_third_memo     VARCHAR2(200),
  verify_third_by       VARCHAR2(20),
  memo                  VARCHAR2(200),
  creator               NVARCHAR2(20),
  create_time           DATE default sysdate,
  modifier              NVARCHAR2(20),
  modify_time           DATE,
  verify_first_measures VARCHAR2(200),
  unique_id             VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_BAD_EVENT
  is '�����¼���¼��';
comment on column WII_BAD_EVENT.inpatient_visitid
  is '������Ժ��
';
comment on column WII_BAD_EVENT.time_point
  is '����ʱ��
';
comment on column WII_BAD_EVENT.level_code
  is '�����¼�����
';
comment on column WII_BAD_EVENT.event_code
  is '�¼����Ʊ���';
comment on column WII_BAD_EVENT.part_code
  is '��������/��λ
';
comment on column WII_BAD_EVENT.report_time
  is '�ϱ�ʱ��
';
comment on column WII_BAD_EVENT.reporter
  is '�ϱ���
';
comment on column WII_BAD_EVENT.verify_first_time
  is '��һ���ʱ��
';
comment on column WII_BAD_EVENT.verify_first_analysis
  is '��һ���ԭ�����';
comment on column WII_BAD_EVENT.verify_first_by
  is '��һ�����
';
comment on column WII_BAD_EVENT.verify_second_time
  is '�ڶ����ʱ��
';
comment on column WII_BAD_EVENT.verify_second_memo
  is '�ڶ�������
';
comment on column WII_BAD_EVENT.verify_second_by
  is '�ڶ������
';
comment on column WII_BAD_EVENT.verify_third_time
  is '�������ʱ��
';
comment on column WII_BAD_EVENT.verify_third_memo
  is '����������';
comment on column WII_BAD_EVENT.verify_third_by
  is '���������
';
comment on column WII_BAD_EVENT.memo
  is '�¼�����/���/Ӱ��/����
';
comment on column WII_BAD_EVENT.creator
  is '������
';
comment on column WII_BAD_EVENT.create_time
  is '����ʱ��
';
comment on column WII_BAD_EVENT.modifier
  is '�޸���
';
comment on column WII_BAD_EVENT.modify_time
  is '�޸�ʱ��
';
comment on column WII_BAD_EVENT.verify_first_measures
  is '��һ��˸Ľ���ʩ';
comment on column WII_BAD_EVENT.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_BASE_NURSING
prompt ===============================
prompt
create table WII_BASE_NURSING
(
  patient_id        VARCHAR2(40),
  time_point        DATE,
  nursing_type      NVARCHAR2(200),
  nursing_item      NVARCHAR2(500),
  operator          NVARCHAR2(40),
  operate_time      DATE,
  creator           NVARCHAR2(40),
  create_time       DATE default sysdate,
  modifier          NVARCHAR2(40),
  modify_time       DATE,
  unique_id         VARCHAR2(50) default sys_guid(),
  nursing_type_name NVARCHAR2(100),
  nursing_item_name NVARCHAR2(1000),
  foreign_key       VARCHAR2(1000)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_BASE_NURSING
  is '��������';
comment on column WII_BASE_NURSING.patient_id
  is '���ˣ���ţ�Ψһ��ʶ';
comment on column WII_BASE_NURSING.time_point
  is '��������ʱ��� ';
comment on column WII_BASE_NURSING.nursing_type
  is '��¼��𣨻����ʩ����ԺС�ᣬ���飬ҽ���ȣ���������ģ�������';
comment on column WII_BASE_NURSING.nursing_item
  is '����ϸ��';
comment on column WII_BASE_NURSING.operator
  is '������';
comment on column WII_BASE_NURSING.operate_time
  is '����ʱ��';
comment on column WII_BASE_NURSING.creator
  is '������ ';
comment on column WII_BASE_NURSING.create_time
  is '����ʱ��';
comment on column WII_BASE_NURSING.modifier
  is '�޸��� ';
comment on column WII_BASE_NURSING.modify_time
  is '�޸�ʱ��';
comment on column WII_BASE_NURSING.unique_id
  is '����ΨһID';
comment on column WII_BASE_NURSING.foreign_key
  is '�������';

prompt
prompt Creating table WII_BEDSIDECARDSIGNS_DIC
prompt =======================================
prompt
create table WII_BEDSIDECARDSIGNS_DIC
(
  signs_type       VARCHAR2(20),
  signs_id         VARCHAR2(20),
  signs_type_code  VARCHAR2(20),
  signs_code       VARCHAR2(20),
  signs_name       VARCHAR2(20),
  signs_viewname   VARCHAR2(20),
  signs_icon       VARCHAR2(40),
  signs_view_color VARCHAR2(20),
  signs_is_default NUMBER,
  signs_type_name  VARCHAR2(20),
  signs_memo       VARCHAR2(20),
  signs_sequence   NUMBER
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table WII_BEDSIDECARDSIGNS_DIC
  is '��ͷ����ʶ�ֵ��';
comment on column WII_BEDSIDECARDSIGNS_DIC.signs_type
  is '��ʶ����';
comment on column WII_BEDSIDECARDSIGNS_DIC.signs_id
  is '��ʶID';
comment on column WII_BEDSIDECARDSIGNS_DIC.signs_type_code
  is '��ʶ����CODE';
comment on column WII_BEDSIDECARDSIGNS_DIC.signs_code
  is '��ʶCODE';
comment on column WII_BEDSIDECARDSIGNS_DIC.signs_name
  is '��ʶ����';
comment on column WII_BEDSIDECARDSIGNS_DIC.signs_viewname
  is '��ʶVIEW����';
comment on column WII_BEDSIDECARDSIGNS_DIC.signs_icon
  is '��ʶͼ��';
comment on column WII_BEDSIDECARDSIGNS_DIC.signs_view_color
  is '��ʶͼ��չʾ��ɫ';
comment on column WII_BEDSIDECARDSIGNS_DIC.signs_is_default
  is '��ʶ�Ƿ�Ϊ��Ĭ��ֵ';
comment on column WII_BEDSIDECARDSIGNS_DIC.signs_type_name
  is '��ʶ��������';
comment on column WII_BEDSIDECARDSIGNS_DIC.signs_memo
  is '��ʶ��ע';
comment on column WII_BEDSIDECARDSIGNS_DIC.signs_sequence
  is 'ҳ������';

prompt
prompt Creating table WII_BEDSORE_PART_DIC
prompt ===================================
prompt
create table WII_BEDSORE_PART_DIC
(
  bedsore_part_code VARCHAR2(16),
  bedsore_part_name NVARCHAR2(40),
  input_code        VARCHAR2(8),
  memo              NVARCHAR2(30)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_BEDSORE_PART_DIC.bedsore_part_code
  is 'ѹ����λ������';
comment on column WII_BEDSORE_PART_DIC.bedsore_part_name
  is 'ѹ����λ�������';
comment on column WII_BEDSORE_PART_DIC.input_code
  is '������';
comment on column WII_BEDSORE_PART_DIC.memo
  is '��ע';

prompt
prompt Creating table WII_BED_GROUP_MASTER
prompt ===================================
prompt
create table WII_BED_GROUP_MASTER
(
  group_id    VARCHAR2(20),
  bed_id      VARCHAR2(20),
  creator     NVARCHAR2(20),
  create_time DATE default sysdate,
  modifier    NVARCHAR2(20),
  modify_time DATE,
  unique_id   VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_BED_GROUP_MASTER.group_id
  is '��λ���飬��Ҫ�������ֻ������ҽ���顣�����һ����С���1-6�Ŵ���';
comment on column WII_BED_GROUP_MASTER.bed_id
  is '��λID��';
comment on column WII_BED_GROUP_MASTER.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_BED_MASTER
prompt =============================
prompt
create table WII_BED_MASTER
(
  bed_id            VARCHAR2(20),
  ward_code         VARCHAR2(30),
  bed_no            VARCHAR2(20),
  bed_label         VARCHAR2(20),
  room_no           VARCHAR2(20),
  bed_approved_type VARCHAR2(1),
  bed_sex_type      VARCHAR2(1),
  bed_class         VARCHAR2(2),
  bed_status        VARCHAR2(1),
  icu_indicator     NUMBER(1),
  seq_no            NUMBER(8),
  creator           NVARCHAR2(20),
  create_time       DATE default sysdate,
  modifier          NVARCHAR2(20),
  modify_time       DATE,
  unique_id         VARCHAR2(50) default sys_guid(),
  bed_level         NUMBER(2) default 0
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 448K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_BED_MASTER.bed_id
  is '��λID�ţ�һ����λӦ����Ψһ��ID�ţ������ǲ����ʹ��Ż��ˣ����Ҳ��Ӧ�ñ�';
comment on column WII_BED_MASTER.ward_code
  is '��������';
comment on column WII_BED_MASTER.bed_no
  is '����';
comment on column WII_BED_MASTER.bed_label
  is '����� (�Ӵ�����ʾ�����ֶΣ�';
comment on column WII_BED_MASTER.room_no
  is '�����';
comment on column WII_BED_MASTER.bed_approved_type
  is '��λ��������
1:�ڱ� 2:�Ӵ� 3:ͯ�� 0:�Ǳ�';
comment on column WII_BED_MASTER.bed_sex_type
  is '��λ����
1- �д� 2 -Ů�� 3 -����';
comment on column WII_BED_MASTER.bed_class
  is '��λ�ȼ�
��ʾ��λ���շѵȼ�';
comment on column WII_BED_MASTER.bed_status
  is '��λ״̬
0 -δռ�� 1 -��ռ�� 9 -δչ��';
comment on column WII_BED_MASTER.icu_indicator
  is 'ICU��־';
comment on column WII_BED_MASTER.seq_no
  is '����';
comment on column WII_BED_MASTER.unique_id
  is '����ΨһID';
comment on column WII_BED_MASTER.bed_level
  is '��λ���� 0����֢��1����ͨ';

prompt
prompt Creating table WII_BED_MASTER_BAK1
prompt ==================================
prompt
create table WII_BED_MASTER_BAK1
(
  bed_id            VARCHAR2(20) not null,
  ward_code         VARCHAR2(20) not null,
  bed_no            VARCHAR2(20) not null,
  bed_label         VARCHAR2(20),
  room_no           VARCHAR2(20),
  bed_approved_type VARCHAR2(1),
  bed_sex_type      VARCHAR2(1),
  bed_class         VARCHAR2(10),
  bed_status        VARCHAR2(1),
  icu_indicator     NUMBER(1),
  seq_no            NUMBER(10),
  creator           NVARCHAR2(20),
  create_time       DATE default sysdate,
  modifier          NVARCHAR2(20),
  modify_time       DATE
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_BED_MASTER_BAK1.bed_id
  is '��λID�ţ�һ����λӦ����Ψһ��ID�ţ������ǲ����ʹ��Ż��ˣ����Ҳ��Ӧ�ñ�';
comment on column WII_BED_MASTER_BAK1.ward_code
  is '��������';
comment on column WII_BED_MASTER_BAK1.bed_no
  is '����';
comment on column WII_BED_MASTER_BAK1.bed_label
  is '����� (�Ӵ�����ʾ�����ֶΣ�';
comment on column WII_BED_MASTER_BAK1.room_no
  is '�����';
comment on column WII_BED_MASTER_BAK1.bed_approved_type
  is '��λ��������
1:�ڱ� 2:�Ӵ� 3:ͯ�� 0:�Ǳ�';
comment on column WII_BED_MASTER_BAK1.bed_sex_type
  is '��λ����
1- �д� 2 -Ů�� 3 -����';
comment on column WII_BED_MASTER_BAK1.bed_class
  is '��λ�ȼ�
��ʾ��λ���շѵȼ�';
comment on column WII_BED_MASTER_BAK1.bed_status
  is '��λ״̬
0 -δռ�� 1 -��ռ�� 9 -δչ��';
comment on column WII_BED_MASTER_BAK1.icu_indicator
  is 'ICU��־';
comment on column WII_BED_MASTER_BAK1.seq_no
  is '����';
alter table WII_BED_MASTER_BAK1
  add primary key (BED_ID)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WII_BLOODSUGAR
prompt =============================
prompt
create table WII_BLOODSUGAR
(
  bloodsugar_id        NUMBER(11),
  patient_id           VARCHAR2(20),
  bloodsugar_value     NUMBER(6,1),
  insulin_mainline     NUMBER(6,1),
  insulin_pump         NUMBER(6,1),
  report_time          DATE,
  nurse_id             VARCHAR2(20),
  doctor_id            VARCHAR2(20),
  creator              NVARCHAR2(20),
  create_time          DATE default sysdate,
  modifier             NVARCHAR2(20),
  modify_time          DATE,
  insulin_subcutaneous NUMBER(6,1),
  memo                 VARCHAR2(300),
  insulin_pharm_code   VARCHAR2(30),
  unique_id            VARCHAR2(50) default sys_guid(),
  bloodsugar_part      NVARCHAR2(20),
  monitor_time_type    VARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_BLOODSUGAR.bloodsugar_id
  is '��ˮ��';
comment on column WII_BLOODSUGAR.patient_id
  is '���߱��';
comment on column WII_BLOODSUGAR.bloodsugar_value
  is 'Ѫ��ֵ';
comment on column WII_BLOODSUGAR.insulin_mainline
  is '�ȵ��ؾ�����';
comment on column WII_BLOODSUGAR.insulin_pump
  is '�ȵ��ر�����';
comment on column WII_BLOODSUGAR.report_time
  is '�ϱ�ʱ��';
comment on column WII_BLOODSUGAR.nurse_id
  is '�ϱ���ʿID';
comment on column WII_BLOODSUGAR.doctor_id
  is 'ҽ��ID';
comment on column WII_BLOODSUGAR.creator
  is '������';
comment on column WII_BLOODSUGAR.create_time
  is '����ʱ��';
comment on column WII_BLOODSUGAR.modifier
  is '������';
comment on column WII_BLOODSUGAR.modify_time
  is '����ʱ��';
comment on column WII_BLOODSUGAR.insulin_subcutaneous
  is '�ȵ���Ƥ��ע����';
comment on column WII_BLOODSUGAR.memo
  is '��ע';
comment on column WII_BLOODSUGAR.insulin_pharm_code
  is '���׿�����ҩƷ����';
comment on column WII_BLOODSUGAR.unique_id
  is '����ΨһID';
comment on column WII_BLOODSUGAR.bloodsugar_part
  is 'Ѫ�걾';
comment on column WII_BLOODSUGAR.monitor_time_type
  is '���ʱ�������';

prompt
prompt Creating table WII_BLOOD_HIS
prompt ============================
prompt
create table WII_BLOOD_HIS
(
  inpatient_visitid   VARCHAR2(20),
  patient_id          VARCHAR2(20),
  requested_date_time DATE,
  type                VARCHAR2(30),
  component           VARCHAR2(30),
  blood_number        VARCHAR2(30),
  ordering_provider   VARCHAR2(30),
  verified_by         VARCHAR2(20),
  units               VARCHAR2(20),
  status              VARCHAR2(1),
  creator             VARCHAR2(20),
  create_time         DATE default sysdate,
  modifier            VARCHAR2(20),
  modify_time         DATE,
  unique_id           VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_BLOOD_HIS.unique_id
  is '����Ψһid';

prompt
prompt Creating table WII_BRADEN_GRADE_DIC
prompt ===================================
prompt
create table WII_BRADEN_GRADE_DIC
(
  grade     VARCHAR2(20) not null,
  frequency VARCHAR2(20),
  unique_id VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_BRADEN_GRADE_DIC.grade
  is 'ѹ���ּ�';
comment on column WII_BRADEN_GRADE_DIC.frequency
  is '�Ƽ�Ƶ��';

prompt
prompt Creating table WII_BRADEN_MASTER
prompt ================================
prompt
create table WII_BRADEN_MASTER
(
  braden_id              NUMBER(11),
  braden_parts           NVARCHAR2(20),
  braden_grade           VARCHAR2(20),
  frequency              VARCHAR2(20),
  wound_area             VARCHAR2(20),
  braden_date            DATE,
  heal_date              DATE,
  nurse_id               VARCHAR2(20),
  nurse_name             NVARCHAR2(20),
  verify_id              VARCHAR2(20),
  verify_name            NVARCHAR2(20),
  creator                NVARCHAR2(20),
  create_time            DATE default sysdate,
  modifier               NVARCHAR2(20),
  modify_time            DATE,
  patient_id             VARCHAR2(20),
  bedsore_source         VARCHAR2(40),
  instrumental           VARCHAR2(20),
  unique_id              VARCHAR2(50) default sys_guid(),
  instrumental_name      NVARCHAR2(50),
  braden_parts_id        VARCHAR2(10),
  braden_comment         NVARCHAR2(200),
  braden_comment_display NUMBER,
  color                  VARCHAR2(20),
  exudate                VARCHAR2(20),
  smell                  VARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_BRADEN_MASTER.braden_id
  is 'ѹ�����';
comment on column WII_BRADEN_MASTER.braden_parts
  is '��λ����';
comment on column WII_BRADEN_MASTER.braden_grade
  is 'ѹ���ּ�';
comment on column WII_BRADEN_MASTER.frequency
  is '�Ƽ�Ƶ��';
comment on column WII_BRADEN_MASTER.wound_area
  is '�����С';
comment on column WII_BRADEN_MASTER.braden_date
  is 'ѹ����������';
comment on column WII_BRADEN_MASTER.heal_date
  is 'ѹ����������';
comment on column WII_BRADEN_MASTER.nurse_id
  is '�ϱ���ʿID';
comment on column WII_BRADEN_MASTER.nurse_name
  is '�ϱ���ʿ';
comment on column WII_BRADEN_MASTER.verify_id
  is '�����ID';
comment on column WII_BRADEN_MASTER.verify_name
  is '�����';
comment on column WII_BRADEN_MASTER.creator
  is '������';
comment on column WII_BRADEN_MASTER.create_time
  is '����ʱ��';
comment on column WII_BRADEN_MASTER.modifier
  is '������';
comment on column WII_BRADEN_MASTER.modify_time
  is '����ʱ��';
comment on column WII_BRADEN_MASTER.patient_id
  is '���߱��';
comment on column WII_BRADEN_MASTER.bedsore_source
  is 'ѹ����Դ';
comment on column WII_BRADEN_MASTER.instrumental
  is '�Ƿ���е��';
comment on column WII_BRADEN_MASTER.unique_id
  is '����ΨһID';
comment on column WII_BRADEN_MASTER.instrumental_name
  is '��е��';
comment on column WII_BRADEN_MASTER.braden_comment
  is 'ѹ����ע';
comment on column WII_BRADEN_MASTER.braden_comment_display
  is 'ѹ����ע�Ƿ�Ҫ��ʾ�������� 0-����ʾ 1-��ʾ';
comment on column WII_BRADEN_MASTER.color
  is '������ɫ';
comment on column WII_BRADEN_MASTER.exudate
  is '�Ƿ�������Һ';
comment on column WII_BRADEN_MASTER.smell
  is '�Ƿ�����ζ';

prompt
prompt Creating table WII_BUNDLES_DIC
prompt ==============================
prompt
create table WII_BUNDLES_DIC
(
  dic_type    VARCHAR2(50),
  item_key    VARCHAR2(50),
  sub_itemkey VARCHAR2(50),
  value       VARCHAR2(100),
  id          VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WII_CATHETER_ASSESS
prompt ==================================
prompt
create table WII_CATHETER_ASSESS
(
  assess_id            NUMBER(11),
  catheter_id          NUMBER(11),
  through              NVARCHAR2(20),
  infection            NVARCHAR2(20),
  infectious_agents    VARCHAR2(20),
  means_normal         NVARCHAR2(200),
  skin_condition       NVARCHAR2(200),
  special_drug         NVARCHAR2(200),
  sursing              NVARCHAR2(200),
  assessor             NVARCHAR2(20),
  assess_time          DATE,
  creator              NVARCHAR2(20),
  create_time          DATE default sysdate,
  modifier             NVARCHAR2(20),
  modify_time          DATE,
  fluid_color          VARCHAR2(20),
  fluid_property       VARCHAR2(20),
  fluid_amount         NUMBER(6,2),
  unique_id            VARCHAR2(50) default sys_guid(),
  in_position          VARCHAR2(20),
  dressing             VARCHAR2(200),
  circumference        VARCHAR2(50),
  nursing_memo         VARCHAR2(200),
  fluid_speed          VARCHAR2(20),
  fluid_amount_in      FLOAT,
  fluid_amount_out     FLOAT,
  output               NVARCHAR2(10),
  fluid_amount_str     NVARCHAR2(50),
  fluid_name           NVARCHAR2(200),
  fluid_administration NVARCHAR2(200),
  fluid_amount_in_str  NVARCHAR2(200),
  fluid_amount_out_str NVARCHAR2(200)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_CATHETER_ASSESS.assess_id
  is '����ID';
comment on column WII_CATHETER_ASSESS.catheter_id
  is '�ù�ID';
comment on column WII_CATHETER_ASSESS.through
  is '�����Ƿ�ͨ��';
comment on column WII_CATHETER_ASSESS.infection
  is '��Ⱦ������ǡ������ƣ�';
comment on column WII_CATHETER_ASSESS.infectious_agents
  is '��Ⱦ��';
comment on column WII_CATHETER_ASSESS.means_normal
  is '��Һ/��ѹװ����������ͨ������ñ����Һ������ѹ����';
comment on column WII_CATHETER_ASSESS.skin_condition
  is 'Ƥ��״�����졢�ס�Ӳ�ᡢŨ�㣩';
comment on column WII_CATHETER_ASSESS.special_drug
  is '����ҩҺ��֬���顢Ѫ��Ʒ���̼�ҩ�';
comment on column WII_CATHETER_ASSESS.sursing
  is '���̵㻤����Ĥ����ҩ���̼�ҩ�';
comment on column WII_CATHETER_ASSESS.assessor
  is '������';
comment on column WII_CATHETER_ASSESS.assess_time
  is '����ʱ��';
comment on column WII_CATHETER_ASSESS.creator
  is '������';
comment on column WII_CATHETER_ASSESS.create_time
  is '����ʱ��';
comment on column WII_CATHETER_ASSESS.modifier
  is '������';
comment on column WII_CATHETER_ASSESS.modify_time
  is '����ʱ��';
comment on column WII_CATHETER_ASSESS.fluid_color
  is '����Һ��ɫ';
comment on column WII_CATHETER_ASSESS.fluid_property
  is '����Һ����';
comment on column WII_CATHETER_ASSESS.fluid_amount
  is '����Һ��';
comment on column WII_CATHETER_ASSESS.unique_id
  is '����ΨһID';
comment on column WII_CATHETER_ASSESS.in_position
  is '�����Ƿ���λ';
comment on column WII_CATHETER_ASSESS.dressing
  is '����';
comment on column WII_CATHETER_ASSESS.circumference
  is '�ϱ�Χ/����Χ';
comment on column WII_CATHETER_ASSESS.nursing_memo
  is '�����ʩ';
comment on column WII_CATHETER_ASSESS.fluid_speed
  is '����Һ����';
comment on column WII_CATHETER_ASSESS.fluid_amount_in
  is '��ϴҺ����';
comment on column WII_CATHETER_ASSESS.fluid_amount_out
  is '��ϴҺ����';
comment on column WII_CATHETER_ASSESS.output
  is '���������Ƴ�������';
comment on column WII_CATHETER_ASSESS.fluid_amount_str
  is '����Һ�� �ػ������ֿպ�0��';
comment on column WII_CATHETER_ASSESS.fluid_name
  is '��ϴҺ����';
comment on column WII_CATHETER_ASSESS.fluid_administration
  is '��ϴҺ;��';
comment on column WII_CATHETER_ASSESS.fluid_amount_in_str
  is '��ϴҺ�������������ֿպ�0��';
comment on column WII_CATHETER_ASSESS.fluid_amount_out_str
  is '��ϴҺ�������������ֿպ�0��';

prompt
prompt Creating table WII_CATHETER_DIC
prompt ===============================
prompt
create table WII_CATHETER_DIC
(
  catheter_id        VARCHAR2(30) not null,
  catheter_name      NVARCHAR2(50),
  catheter_type      NVARCHAR2(20),
  catheter_type_code VARCHAR2(20),
  sign_code          VARCHAR2(30),
  input_code         VARCHAR2(30),
  memo               NVARCHAR2(30),
  catheter_position  NVARCHAR2(30),
  custom_flag        VARCHAR2(20),
  view_code          VARCHAR2(20),
  view_name          NVARCHAR2(50),
  parent_cat_id      VARCHAR2(40),
  cat_level          NUMBER,
  severity_degree    NVARCHAR2(20),
  view_name_doc      NVARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_CATHETER_DIC.catheter_id
  is '����ID';
comment on column WII_CATHETER_DIC.catheter_name
  is '��������';
comment on column WII_CATHETER_DIC.catheter_type
  is '����������� (�����ڵ���/�����/Ѫ���ڵ���/θ���ڵ���/�����ܵ���)';
comment on column WII_CATHETER_DIC.catheter_type_code
  is '����������(��/��/��/IV/V)';
comment on column WII_CATHETER_DIC.sign_code
  is '���������루��Ӧ��SIGN�е�CODE����Ҫ��������ܣ������ܵĶ��գ�';
comment on column WII_CATHETER_DIC.input_code
  is '������';
comment on column WII_CATHETER_DIC.memo
  is '��ע';
comment on column WII_CATHETER_DIC.catheter_position
  is '���ܲ�λ(/Ϊ�Զ���)';
comment on column WII_CATHETER_DIC.custom_flag
  is '�Զ��嵼�ܱ�ʶ(0��1��)';
comment on column WII_CATHETER_DIC.view_code
  is '��ʾ���';
comment on column WII_CATHETER_DIC.view_name
  is '��ʾ����';
comment on column WII_CATHETER_DIC.parent_cat_id
  is '������id';
comment on column WII_CATHETER_DIC.cat_level
  is '���ܼ��� 0-�����ܣ�1-�ӵ���';
comment on column WII_CATHETER_DIC.severity_degree
  is '����Σ�س̶� HighRisk;MiddleRisk;LowRisk';
comment on column WII_CATHETER_DIC.view_name_doc
  is '�ػ�����ʾ��������';
alter table WII_CATHETER_DIC
  add constraint WII_CATHETER_DIC_PK primary key (CATHETER_ID)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WII_CATHETER_EVENT
prompt =================================
prompt
create table WII_CATHETER_EVENT
(
  catheter_id     NUMBER(11),
  event_id        NVARCHAR2(40),
  event_type      NVARCHAR2(40),
  operator        VARCHAR2(40),
  operate_time    DATE,
  creator         NVARCHAR2(40),
  create_time     DATE default sysdate,
  modifier        NVARCHAR2(40),
  modify_time     DATE,
  unique_id       VARCHAR2(50) default sys_guid(),
  event_type_mark NVARCHAR2(40),
  event_memo      NVARCHAR2(200),
  event_type_name NVARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 256K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_CATHETER_EVENT
  is '���ܲ����¼���';
comment on column WII_CATHETER_EVENT.catheter_id
  is '�ù�ID';
comment on column WII_CATHETER_EVENT.event_id
  is '�¼�ID';
comment on column WII_CATHETER_EVENT.event_type
  is '�¼�����';
comment on column WII_CATHETER_EVENT.operator
  is '������';
comment on column WII_CATHETER_EVENT.operate_time
  is '����ʱ��';
comment on column WII_CATHETER_EVENT.creator
  is '������';
comment on column WII_CATHETER_EVENT.create_time
  is '����ʱ��';
comment on column WII_CATHETER_EVENT.modifier
  is '������';
comment on column WII_CATHETER_EVENT.modify_time
  is '����ʱ��';
comment on column WII_CATHETER_EVENT.unique_id
  is '����ΨһID';
comment on column WII_CATHETER_EVENT.event_type_mark
  is '�¼����ͱ���';
comment on column WII_CATHETER_EVENT.event_memo
  is '�¼���ע';
comment on column WII_CATHETER_EVENT.event_type_name
  is '�ù��¼�����';

prompt
prompt Creating table WII_CATHETER_EVENT_DETAIL
prompt ========================================
prompt
create table WII_CATHETER_EVENT_DETAIL
(
  catheter_id       NUMBER(11),
  event_id          NVARCHAR2(40),
  property_code     NVARCHAR2(40),
  property_name     NVARCHAR2(50),
  property_value    NVARCHAR2(500),
  property_unit     NVARCHAR2(20),
  property_sequence NUMBER,
  creator           NVARCHAR2(40),
  create_time       DATE default sysdate,
  modifier          NVARCHAR2(40),
  modify_time       DATE,
  unique_id         VARCHAR2(50) default sys_guid(),
  operator          VARCHAR2(40),
  operate_time      DATE,
  memo              VARCHAR2(20) default ''
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_CATHETER_EVENT_DETAIL
  is '�����¼���ϸ��';
comment on column WII_CATHETER_EVENT_DETAIL.catheter_id
  is '�ù�ID';
comment on column WII_CATHETER_EVENT_DETAIL.event_id
  is '�¼�ID';
comment on column WII_CATHETER_EVENT_DETAIL.property_code
  is '���Ա���';
comment on column WII_CATHETER_EVENT_DETAIL.property_name
  is '��������';
comment on column WII_CATHETER_EVENT_DETAIL.property_value
  is '����ֵ';
comment on column WII_CATHETER_EVENT_DETAIL.property_unit
  is '���Ե�λ';
comment on column WII_CATHETER_EVENT_DETAIL.property_sequence
  is '����ҳ������';
comment on column WII_CATHETER_EVENT_DETAIL.creator
  is '������';
comment on column WII_CATHETER_EVENT_DETAIL.create_time
  is '����ʱ��';
comment on column WII_CATHETER_EVENT_DETAIL.modifier
  is '������';
comment on column WII_CATHETER_EVENT_DETAIL.modify_time
  is '����ʱ��';
comment on column WII_CATHETER_EVENT_DETAIL.operator
  is '��¼��';
comment on column WII_CATHETER_EVENT_DETAIL.operate_time
  is '��¼ʱ��';
comment on column WII_CATHETER_EVENT_DETAIL.memo
  is '��ע��Ŀǰ�����ಿλ������';

prompt
prompt Creating table WII_CATHETER_EVENT_DIC
prompt =====================================
prompt
create table WII_CATHETER_EVENT_DIC
(
  ce_code    VARCHAR2(20),
  ce_name    NVARCHAR2(50),
  input_code VARCHAR2(20),
  memo       NVARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_CATHETER_EVENT_DIC.ce_code
  is '�����¼�����';
comment on column WII_CATHETER_EVENT_DIC.ce_name
  is '�����¼�����';
comment on column WII_CATHETER_EVENT_DIC.input_code
  is '������';
comment on column WII_CATHETER_EVENT_DIC.memo
  is '��ע';

prompt
prompt Creating table WII_CATHETER_MASTER
prompt ==================================
prompt
create table WII_CATHETER_MASTER
(
  catheter_id           NUMBER(11),
  patient_id            VARCHAR2(20),
  ward_code             VARCHAR2(20),
  cat_id                VARCHAR2(30),
  cat_source            VARCHAR2(20),
  cat_mark              NVARCHAR2(20),
  cat_length_type       NVARCHAR2(20),
  cat_length            NUMBER(4,1),
  cat_length_unit       VARCHAR2(8),
  cat_remark            VARCHAR2(200),
  cat_insert_orerator   NVARCHAR2(20),
  cat_insert_time       DATE,
  cat_pull_operator     NVARCHAR2(20),
  cat_pull_time         DATE,
  creator               NVARCHAR2(20),
  create_time           DATE default sysdate,
  modifier              NVARCHAR2(20),
  modify_time           DATE,
  cat_spec              VARCHAR2(50),
  catheter_no           NUMBER(3),
  cat_position          NVARCHAR2(50),
  cat_mark_type         NVARCHAR2(50),
  unplanned_reason      VARCHAR2(40),
  unique_id             VARCHAR2(50) default sys_guid(),
  cat_connection_device NVARCHAR2(200),
  cat_model             VARCHAR2(50),
  cat_in_position       VARCHAR2(50),
  cat_stop_position     VARCHAR2(50),
  extend_property       NVARCHAR2(2000),
  cat_check_time        DATE,
  cat_check_operator    NVARCHAR2(20),
  cat_lengthmod         NUMBER(3,2),
  estimated_pull_time   DATE,
  need_clean            VARCHAR2(1)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_CATHETER_MASTER.catheter_id
  is '�ù�ID';
comment on column WII_CATHETER_MASTER.patient_id
  is '����Ψһ��ʶ';
comment on column WII_CATHETER_MASTER.ward_code
  is '�ùܿ���';
comment on column WII_CATHETER_MASTER.cat_id
  is '����ID';
comment on column WII_CATHETER_MASTER.cat_source
  is '������Դ�������ҡ�����ң�';
comment on column WII_CATHETER_MASTER.cat_mark
  is '�ùܱ�ǣ��״Ρ��ٴΡ��Ǽƻ��ԣ�';
comment on column WII_CATHETER_MASTER.cat_length_type
  is '�ùܳ�������';
comment on column WII_CATHETER_MASTER.cat_length
  is '�ùܳ���';
comment on column WII_CATHETER_MASTER.cat_length_unit
  is '�ùܳ��ȵ�λ';
comment on column WII_CATHETER_MASTER.cat_remark
  is '��ע';
comment on column WII_CATHETER_MASTER.cat_insert_orerator
  is '�ù���';
comment on column WII_CATHETER_MASTER.cat_insert_time
  is '�ù�ʱ��';
comment on column WII_CATHETER_MASTER.cat_pull_operator
  is '�ι���';
comment on column WII_CATHETER_MASTER.cat_pull_time
  is '�ι�ʱ��';
comment on column WII_CATHETER_MASTER.creator
  is '������';
comment on column WII_CATHETER_MASTER.create_time
  is '����ʱ��';
comment on column WII_CATHETER_MASTER.modifier
  is '������';
comment on column WII_CATHETER_MASTER.modify_time
  is '����ʱ��';
comment on column WII_CATHETER_MASTER.cat_spec
  is '�����ͺ�';
comment on column WII_CATHETER_MASTER.catheter_no
  is 'ͬʱ�ùܱ��';
comment on column WII_CATHETER_MASTER.cat_position
  is '���ܲ�λ';
comment on column WII_CATHETER_MASTER.cat_mark_type
  is '�ƻ���/�Ǽƻ���
';
comment on column WII_CATHETER_MASTER.unplanned_reason
  is '�Ǽƻ���ԭ��';
comment on column WII_CATHETER_MASTER.unique_id
  is '����ΨһID';
comment on column WII_CATHETER_MASTER.cat_connection_device
  is '��������װ��';
comment on column WII_CATHETER_MASTER.cat_model
  is '��������';
comment on column WII_CATHETER_MASTER.cat_in_position
  is '���̲�λ';
comment on column WII_CATHETER_MASTER.cat_stop_position
  is 'ͷ��λ��';
comment on column WII_CATHETER_MASTER.extend_property
  is '��չ����';
comment on column WII_CATHETER_MASTER.cat_check_time
  is '���ܺ˶�ʱ��';
comment on column WII_CATHETER_MASTER.cat_check_operator
  is '�˶���';
comment on column WII_CATHETER_MASTER.need_clean
  is '�Ƿ���Ҫ��ϴ����';

prompt
prompt Creating table WII_CATHETER_OPERATE
prompt ===================================
prompt
create table WII_CATHETER_OPERATE
(
  operator_id     NUMBER(11),
  catheter_id     NUMBER(11),
  operator_type   NVARCHAR2(20),
  cat_length_type NVARCHAR2(20),
  cat_length      NUMBER(4,1),
  cat_length_unit VARCHAR2(8),
  operator_reason VARCHAR2(40),
  operator        VARCHAR2(20),
  operate_time    DATE,
  creator         NVARCHAR2(20),
  create_time     DATE default sysdate,
  modifier        NVARCHAR2(20),
  modify_time     DATE,
  cat_mark        VARCHAR2(20),
  unique_id       VARCHAR2(50) default sys_guid(),
  operate_content VARCHAR2(1000)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_CATHETER_OPERATE.operator_id
  is '����ID';
comment on column WII_CATHETER_OPERATE.catheter_id
  is '�ù�ID';
comment on column WII_CATHETER_OPERATE.operator_type
  is '�������ͣ��������ιܡ�������';
comment on column WII_CATHETER_OPERATE.cat_length_type
  is '�ùܳ�������';
comment on column WII_CATHETER_OPERATE.cat_length
  is '�ùܳ���';
comment on column WII_CATHETER_OPERATE.cat_length_unit
  is '�ùܳ��ȵ�λ';
comment on column WII_CATHETER_OPERATE.operator_reason
  is '����ԭ��';
comment on column WII_CATHETER_OPERATE.operator
  is '������';
comment on column WII_CATHETER_OPERATE.operate_time
  is '����ʱ��';
comment on column WII_CATHETER_OPERATE.creator
  is '������';
comment on column WII_CATHETER_OPERATE.create_time
  is '����ʱ��';
comment on column WII_CATHETER_OPERATE.modifier
  is '������';
comment on column WII_CATHETER_OPERATE.modify_time
  is '����ʱ��';
comment on column WII_CATHETER_OPERATE.cat_mark
  is '�ùܱ�ǣ��ƻ��ԡ��Ǽƻ��ԣ�';
comment on column WII_CATHETER_OPERATE.unique_id
  is '����ΨһID';
comment on column WII_CATHETER_OPERATE.operate_content
  is '��������';

prompt
prompt Creating table WII_CATHETER_POSITION
prompt ====================================
prompt
create table WII_CATHETER_POSITION
(
  catheter_id       VARCHAR2(30),
  catheter_position NVARCHAR2(50),
  creator           NVARCHAR2(20),
  create_time       DATE default sysdate,
  modifier          NVARCHAR2(20),
  modify_time       DATE,
  unique_id         VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_CATHETER_POSITION.catheter_id
  is '����ID';
comment on column WII_CATHETER_POSITION.catheter_position
  is '���ܲ�λ';
comment on column WII_CATHETER_POSITION.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_CATHETER_PROPERTY_CONFIG
prompt ===========================================
prompt
create table WII_CATHETER_PROPERTY_CONFIG
(
  config_id          NVARCHAR2(50),
  catheter_type_code VARCHAR2(20),
  catheter_id        VARCHAR2(30),
  special_code       VARCHAR2(30),
  property_code      VARCHAR2(20),
  property_name      VARCHAR2(20),
  value_type         VARCHAR2(2),
  value_range        VARCHAR2(200),
  property_unit      VARCHAR2(200),
  memo               VARCHAR2(200),
  create_time        DATE,
  creator            VARCHAR2(20),
  modify_time        DATE,
  modifier           VARCHAR2(20),
  unique_id          VARCHAR2(50),
  is_visible         NUMBER(1),
  property_catagory  NUMBER,
  property_sequence  NUMBER
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_CATHETER_PROPERTY_CONFIG.config_id
  is '����ID';
comment on column WII_CATHETER_PROPERTY_CONFIG.catheter_type_code
  is '��������';
comment on column WII_CATHETER_PROPERTY_CONFIG.catheter_id
  is '����ID
';
comment on column WII_CATHETER_PROPERTY_CONFIG.special_code
  is 'ר��CODE
';
comment on column WII_CATHETER_PROPERTY_CONFIG.property_code
  is '����CODE
';
comment on column WII_CATHETER_PROPERTY_CONFIG.property_name
  is '��������
';
comment on column WII_CATHETER_PROPERTY_CONFIG.value_type
  is '����ֵ���� 0���֣�1�ı���2Radiobutton��ѡ��3������ ��ѡ;4 ��ѡ';
comment on column WII_CATHETER_PROPERTY_CONFIG.value_range
  is 'ֵ��
';
comment on column WII_CATHETER_PROPERTY_CONFIG.property_unit
  is '��λ';
comment on column WII_CATHETER_PROPERTY_CONFIG.memo
  is '��ע';
comment on column WII_CATHETER_PROPERTY_CONFIG.create_time
  is '����ʱ��';
comment on column WII_CATHETER_PROPERTY_CONFIG.creator
  is '������';
comment on column WII_CATHETER_PROPERTY_CONFIG.modify_time
  is '�޸�ʱ��';
comment on column WII_CATHETER_PROPERTY_CONFIG.modifier
  is '�޸���';
comment on column WII_CATHETER_PROPERTY_CONFIG.unique_id
  is '����Ψһid';
comment on column WII_CATHETER_PROPERTY_CONFIG.is_visible
  is '�Ƿ�ɼ�';
comment on column WII_CATHETER_PROPERTY_CONFIG.property_catagory
  is '������� 0-���� 1-���� 2-����';
comment on column WII_CATHETER_PROPERTY_CONFIG.property_sequence
  is 'ҳ������';

prompt
prompt Creating table WII_CATHETER_PROPERTY_DIC
prompt ========================================
prompt
create table WII_CATHETER_PROPERTY_DIC
(
  property_code         NVARCHAR2(40),
  property_name         NVARCHAR2(50),
  property_catalog      NVARCHAR2(50),
  property_unit         NVARCHAR2(20),
  value_type            VARCHAR2(50),
  value_range           NVARCHAR2(500),
  view_name             NVARCHAR2(50),
  property_catalog_name NVARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_CATHETER_PROPERTY_DIC
  is '���������ֵ��';
comment on column WII_CATHETER_PROPERTY_DIC.property_code
  is '���Ա���';
comment on column WII_CATHETER_PROPERTY_DIC.property_name
  is '��������';
comment on column WII_CATHETER_PROPERTY_DIC.property_catalog
  is '���Է���';
comment on column WII_CATHETER_PROPERTY_DIC.property_unit
  is '���Ե�λ';
comment on column WII_CATHETER_PROPERTY_DIC.value_type
  is '����ֵ���� 0���֣�1�ı���2Radiobutton��ѡ��3������ ��ѡ;4 ��ѡ';
comment on column WII_CATHETER_PROPERTY_DIC.value_range
  is '����ֵ��';
comment on column WII_CATHETER_PROPERTY_DIC.view_name
  is '�����Զ�������';
comment on column WII_CATHETER_PROPERTY_DIC.property_catalog_name
  is '���Գ�����ʾ������';

prompt
prompt Creating table WII_CATHETER_SPEC
prompt ================================
prompt
create table WII_CATHETER_SPEC
(
  catheter_id   VARCHAR2(30),
  catheter_spec VARCHAR2(50),
  creator       NVARCHAR2(20),
  create_time   DATE default sysdate,
  modifier      NVARCHAR2(20),
  modify_time   DATE,
  unique_id     VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_CATHETER_SPEC.catheter_id
  is '����ID';
comment on column WII_CATHETER_SPEC.catheter_spec
  is '�����ͺ�';
comment on column WII_CATHETER_SPEC.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_CHIEFNURSING_WORKPLAN
prompt ========================================
prompt
create table WII_CHIEFNURSING_WORKPLAN
(
  workplan_no    NUMBER(11) not null,
  plan_content   VARCHAR2(500),
  is_important   VARCHAR2(20),
  plan_status    VARCHAR2(20),
  plan_quarter   VARCHAR2(20),
  plan_exec_time DATE,
  plan_remarks   VARCHAR2(200),
  creator        VARCHAR2(20),
  create_time    DATE default sysdate not null,
  modifier       VARCHAR2(20),
  modify_time    DATE,
  unique_id      VARCHAR2(50) default sys_guid() not null,
  end_time       DATE,
  endtor         VARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_CHIEFNURSING_WORKPLAN.workplan_no
  is '�����ƻ����';
comment on column WII_CHIEFNURSING_WORKPLAN.plan_content
  is '�����ƻ�����';
comment on column WII_CHIEFNURSING_WORKPLAN.is_important
  is '�Ƿ���Ҫ���0-��Ҫ.1-����Ҫ)';
comment on column WII_CHIEFNURSING_WORKPLAN.plan_status
  is '0-����.1-���.2-ȡ��.3-��ɾ��';
comment on column WII_CHIEFNURSING_WORKPLAN.plan_quarter
  is 'ִ��ʱ�䣨���ȣ�';
comment on column WII_CHIEFNURSING_WORKPLAN.plan_exec_time
  is 'ִ��ʱ��';
comment on column WII_CHIEFNURSING_WORKPLAN.plan_remarks
  is '��ע';
comment on column WII_CHIEFNURSING_WORKPLAN.creator
  is '������';
comment on column WII_CHIEFNURSING_WORKPLAN.create_time
  is '����ʱ��';
comment on column WII_CHIEFNURSING_WORKPLAN.modifier
  is '�༭��';
comment on column WII_CHIEFNURSING_WORKPLAN.modify_time
  is '�༭ʱ��';
comment on column WII_CHIEFNURSING_WORKPLAN.unique_id
  is 'GUID';

prompt
prompt Creating table WII_CLINICAL_QUALITY
prompt ===================================
prompt
create table WII_CLINICAL_QUALITY
(
  quota_code        VARCHAR2(40),
  quota_value       NUMBER(10,2),
  memo              NVARCHAR2(60),
  valid             NUMBER(1),
  quota_time        VARCHAR2(20),
  create_time       DATE default sysdate,
  creator           NVARCHAR2(20),
  quota_org         VARCHAR2(20),
  quota_parent_code VARCHAR2(40),
  modifier          NVARCHAR2(20),
  modify_time       DATE,
  unique_id         VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_CLINICAL_QUALITY.quota_code
  is '����';
comment on column WII_CLINICAL_QUALITY.quota_value
  is 'ֵ';
comment on column WII_CLINICAL_QUALITY.memo
  is '��ע';
comment on column WII_CLINICAL_QUALITY.valid
  is '����(0�ݴ� 1����)';
comment on column WII_CLINICAL_QUALITY.quota_time
  is 'ʱ��';
comment on column WII_CLINICAL_QUALITY.create_time
  is '����ʱ��';
comment on column WII_CLINICAL_QUALITY.creator
  is '������';
comment on column WII_CLINICAL_QUALITY.quota_org
  is '��֯';
comment on column WII_CLINICAL_QUALITY.quota_parent_code
  is '������';
comment on column WII_CLINICAL_QUALITY.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_CLOUD_NODE
prompt =============================
prompt
create table WII_CLOUD_NODE
(
  node_id          VARCHAR2(20),
  node_name        VARCHAR2(50),
  node_ipaddr      VARCHAR2(50),
  node_macaddr     VARCHAR2(50),
  node_remark      VARCHAR2(50),
  node_statustime  DATE,
  login_name       VARCHAR2(20),
  login_time       DATE,
  login_statustime DATE,
  node_action      VARCHAR2(200),
  creator          NVARCHAR2(20),
  create_time      DATE default sysdate,
  modifier         NVARCHAR2(20),
  modify_time      DATE,
  unique_id        VARCHAR2(50) default sys_guid(),
  printsize        VARCHAR2(200),
  printname        VARCHAR2(500)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_CLOUD_NODE.unique_id
  is '����ΨһID';
comment on column WII_CLOUD_NODE.printsize
  is 'ֽ��';
comment on column WII_CLOUD_NODE.printname
  is '��ӡ������';

prompt
prompt Creating table WII_COMMUNICATION_REC
prompt ====================================
prompt
create table WII_COMMUNICATION_REC
(
  patient_id      VARCHAR2(20),
  message_time    DATE,
  message_from    NVARCHAR2(20),
  message_to      NVARCHAR2(20),
  message_level   VARCHAR2(20),
  message_content VARCHAR2(2000),
  creator         NVARCHAR2(20),
  create_time     DATE default sysdate,
  modifier        NVARCHAR2(20),
  modify_time     DATE,
  unique_id       VARCHAR2(50) default sys_guid(),
  message_type    VARCHAR2(2)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_COMMUNICATION_REC.patient_id
  is '����Ψһ��ʶ��';
comment on column WII_COMMUNICATION_REC.message_time
  is '��Ϣ����ʱ��';
comment on column WII_COMMUNICATION_REC.message_from
  is '��Ϣ������';
comment on column WII_COMMUNICATION_REC.message_to
  is '��Ϣ������';
comment on column WII_COMMUNICATION_REC.message_level
  is '��Ϣ����';
comment on column WII_COMMUNICATION_REC.message_content
  is '��Ϣ����';
comment on column WII_COMMUNICATION_REC.creator
  is '������';
comment on column WII_COMMUNICATION_REC.create_time
  is '����ʱ��';
comment on column WII_COMMUNICATION_REC.modifier
  is '�޸���';
comment on column WII_COMMUNICATION_REC.modify_time
  is '�޸�ʱ��';
comment on column WII_COMMUNICATION_REC.unique_id
  is '����ΨһID';
comment on column WII_COMMUNICATION_REC.message_type
  is '��Ϣ���';

prompt
prompt Creating table WII_CONSULTATION_RRCORD
prompt ======================================
prompt
create table WII_CONSULTATION_RRCORD
(
  consultation_rrcord_id NUMBER(11) not null,
  consultation_type      NUMBER(6),
  applicant              NVARCHAR2(20),
  apply_date             DATE,
  except_hospital        NVARCHAR2(20),
  except_doctor          NVARCHAR2(20),
  patient_describe       VARCHAR2(500),
  is_finish              NUMBER(1),
  consultation_opinoin   NVARCHAR2(500),
  create_time            DATE default sysdate,
  creator                NVARCHAR2(20),
  modifier               NVARCHAR2(20),
  modify_time            DATE,
  patient_id             VARCHAR2(20),
  start_time             DATE,
  end_time               DATE,
  data_flag              NUMBER(2),
  unique_id              VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_CONSULTATION_RRCORD.consultation_rrcord_id
  is '������ID
';
comment on column WII_CONSULTATION_RRCORD.consultation_type
  is '��������
1��Զ�̻��2��Զ�̲鷿
';
comment on column WII_CONSULTATION_RRCORD.applicant
  is '������
';
comment on column WII_CONSULTATION_RRCORD.apply_date
  is '��������
';
comment on column WII_CONSULTATION_RRCORD.except_hospital
  is '��������ҽԺ
';
comment on column WII_CONSULTATION_RRCORD.except_doctor
  is '��������ҽ��
';
comment on column WII_CONSULTATION_RRCORD.patient_describe
  is '��������
';
comment on column WII_CONSULTATION_RRCORD.is_finish
  is '�Ƿ����
';
comment on column WII_CONSULTATION_RRCORD.consultation_opinoin
  is '�������
';
comment on column WII_CONSULTATION_RRCORD.create_time
  is '����ʱ��
';
comment on column WII_CONSULTATION_RRCORD.creator
  is '������
';
comment on column WII_CONSULTATION_RRCORD.modifier
  is '�޸���
';
comment on column WII_CONSULTATION_RRCORD.modify_time
  is '�޸�ʱ��
';
comment on column WII_CONSULTATION_RRCORD.patient_id
  is '����ID';
comment on column WII_CONSULTATION_RRCORD.start_time
  is '��ʼʱ��';
comment on column WII_CONSULTATION_RRCORD.end_time
  is '����ʱ��';
comment on column WII_CONSULTATION_RRCORD.data_flag
  is '���ݱ�ʾ';
comment on column WII_CONSULTATION_RRCORD.unique_id
  is '����ΨһID';
alter table WII_CONSULTATION_RRCORD
  add constraint PK_CONSULTATION_RRCORD_ID primary key (CONSULTATION_RRCORD_ID)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WII_CONSUMABLE_DIC
prompt =================================
prompt
create table WII_CONSUMABLE_DIC
(
  consumable_code          VARCHAR2(20),
  consumable_name          NVARCHAR2(100),
  consumable_spec          VARCHAR2(20),
  spec_unit                VARCHAR2(20),
  consumable_product_class VARCHAR2(20),
  consumable_value_class   VARCHAR2(10),
  code_in_his              VARCHAR2(20),
  supplier_id              VARCHAR2(20),
  supplier_name            NVARCHAR2(20),
  batch_no                 VARCHAR2(20),
  package_spec             VARCHAR2(20),
  package_unit             VARCHAR2(20),
  input_code               VARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_CONSUMABLE_DIC.consumable_code
  is '����Ʒ����';
comment on column WII_CONSUMABLE_DIC.consumable_name
  is '����Ʒ����';
comment on column WII_CONSUMABLE_DIC.consumable_spec
  is '����Ʒʹ�ù��';
comment on column WII_CONSUMABLE_DIC.spec_unit
  is '���λ';
comment on column WII_CONSUMABLE_DIC.consumable_product_class
  is '����Ʒ�����Ʒ����';
comment on column WII_CONSUMABLE_DIC.consumable_value_class
  is '����Ʒ��𣭼�ֵ';
comment on column WII_CONSUMABLE_DIC.code_in_his
  is 'HIS�д���';
comment on column WII_CONSUMABLE_DIC.supplier_id
  is '��Ӧ�̴���';
comment on column WII_CONSUMABLE_DIC.supplier_name
  is '��Ӧ������';
comment on column WII_CONSUMABLE_DIC.batch_no
  is '���κ�';
comment on column WII_CONSUMABLE_DIC.package_spec
  is '��װ���';
comment on column WII_CONSUMABLE_DIC.package_unit
  is '��װ��λ';
comment on column WII_CONSUMABLE_DIC.input_code
  is '������';

prompt
prompt Creating table WII_CONSUMABLE_USING_ICU
prompt =======================================
prompt
create table WII_CONSUMABLE_USING_ICU
(
  patient_id     VARCHAR2(20),
  ward_code      VARCHAR2(20),
  material_label VARCHAR2(20),
  use_time       DATE,
  consum_code    VARCHAR2(20),
  consum_name    VARCHAR2(100),
  consum_qty     VARCHAR2(20),
  consum_unit    VARCHAR2(20),
  operator       NVARCHAR2(20),
  operate_time   DATE,
  creator        NVARCHAR2(20),
  create_time    DATE default sysdate,
  modifier       NVARCHAR2(20),
  modify_time    DATE,
  unique_id      VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_CONSUMABLE_USING_ICU.patient_id
  is '�����ˣ���ţ�Ψһ��ʶ';
comment on column WII_CONSUMABLE_USING_ICU.ward_code
  is '�������';
comment on column WII_CONSUMABLE_USING_ICU.material_label
  is '���ʱ�ţ����豸����Դ����ϵͳ������ֵ�и����룬��ֵ���κţ�';
comment on column WII_CONSUMABLE_USING_ICU.use_time
  is 'ʹ��ʱ��';
comment on column WII_CONSUMABLE_USING_ICU.consum_code
  is '����Ʒ�������ƴ��루���豸����Դ����ϵͳ����';
comment on column WII_CONSUMABLE_USING_ICU.consum_name
  is '����Ʒ���ƣ����豸����Դ����ϵͳ����';
comment on column WII_CONSUMABLE_USING_ICU.consum_qty
  is '����Ʒ����';
comment on column WII_CONSUMABLE_USING_ICU.consum_unit
  is '����Ʒ��λ';
comment on column WII_CONSUMABLE_USING_ICU.operator
  is '������';
comment on column WII_CONSUMABLE_USING_ICU.operate_time
  is '����ʱ��';
comment on column WII_CONSUMABLE_USING_ICU.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_DBVERSION
prompt ============================
prompt
create table WII_DBVERSION
(
  version     VARCHAR2(50),
  updatedby   VARCHAR2(50),
  updatedon   DATE,
  reason      VARCHAR2(500),
  filename    VARCHAR2(50),
  content     CLOB,
  lastversion VARCHAR2(50),
  download    VARCHAR2(100)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 256K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_DBVERSION.version
  is '�汾';
comment on column WII_DBVERSION.updatedby
  is '������';
comment on column WII_DBVERSION.updatedon
  is '����ʱ��';
comment on column WII_DBVERSION.reason
  is '��������';
comment on column WII_DBVERSION.filename
  is '�ļ���';
comment on column WII_DBVERSION.content
  is '����';
comment on column WII_DBVERSION.lastversion
  is '��һ�汾';
comment on column WII_DBVERSION.download
  is '���ص�ַ';

prompt
prompt Creating table WII_DBVERSION_LOG
prompt ================================
prompt
create table WII_DBVERSION_LOG
(
  version   VARCHAR2(50),
  updatedby VARCHAR2(50),
  updatedon DATE
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_DBVERSION_LOG.version
  is '�汾';
comment on column WII_DBVERSION_LOG.updatedby
  is '������';
comment on column WII_DBVERSION_LOG.updatedon
  is '����ʱ��';

prompt
prompt Creating table WII_DC_SCHEDULE_CHARGE_EXTEND
prompt ============================================
prompt
create table WII_DC_SCHEDULE_CHARGE_EXTEND
(
  charge_year_month VARCHAR2(10),
  list_code         VARCHAR2(50),
  wardcode          VARCHAR2(200),
  extend_content    NVARCHAR2(1000)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table WII_DC_SCHEDULE_CHARGE_EXTEND
  is '�����ܸ��������λ��չ��Ϣ';
comment on column WII_DC_SCHEDULE_CHARGE_EXTEND.charge_year_month
  is '�Ű��¶�';
comment on column WII_DC_SCHEDULE_CHARGE_EXTEND.list_code
  is '���(����WII_DC_SCHEDUL_CHARGE_INFO��ͬ���ֶδ��name,ʵ�ʴ�DIC��NAME)';
comment on column WII_DC_SCHEDULE_CHARGE_EXTEND.wardcode
  is '���ұ��(���ŷָ�)';

prompt
prompt Creating table WII_DC_SCHEDUL_BEDDOCTOR
prompt =======================================
prompt
create table WII_DC_SCHEDUL_BEDDOCTOR
(
  patient_id  VARCHAR2(20),
  doctor_id   VARCHAR2(4000),
  record_date VARCHAR2(10),
  create_time DATE,
  creator     VARCHAR2(30),
  modify_by   VARCHAR2(30),
  modify_date DATE,
  ward_code   VARCHAR2(50),
  bed_no      VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_DC_SCHEDUL_BEDDOCTOR
  is '��λ��Ӧ�ܴ�ҽ����';
comment on column WII_DC_SCHEDUL_BEDDOCTOR.patient_id
  is '���߾����';
comment on column WII_DC_SCHEDUL_BEDDOCTOR.doctor_id
  is 'ҽ��ID�б����ŷָ�';
comment on column WII_DC_SCHEDUL_BEDDOCTOR.record_date
  is '�·�ƽ������ľͼ�¼YYYYMM������ľͼ�¼YYYYMMDD';
comment on column WII_DC_SCHEDUL_BEDDOCTOR.create_time
  is '����ʱ��';
comment on column WII_DC_SCHEDUL_BEDDOCTOR.creator
  is '������';
comment on column WII_DC_SCHEDUL_BEDDOCTOR.modify_by
  is '�޸���';
comment on column WII_DC_SCHEDUL_BEDDOCTOR.modify_date
  is '�޸�ʱ��';
comment on column WII_DC_SCHEDUL_BEDDOCTOR.ward_code
  is '��¼ʱ���˶�Ӧ������';
comment on column WII_DC_SCHEDUL_BEDDOCTOR.bed_no
  is '��¼ʱ���˶�Ӧ��λ��Ϣ';

prompt
prompt Creating table WII_DC_SCHEDUL_CHARGE_INFO
prompt =========================================
prompt
create table WII_DC_SCHEDUL_CHARGE_INFO
(
  id                VARCHAR2(50) not null,
  charge_year_month VARCHAR2(10),
  list_code         VARCHAR2(50),
  wardcode          VARCHAR2(20),
  charge_person_id  VARCHAR2(36),
  creator           VARCHAR2(20),
  create_time       DATE default sysdate,
  modifier          VARCHAR2(20),
  modify_time       DATE
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_DC_SCHEDUL_CHARGE_INFO
  is '�����ܸ��������λ��Ϣ��';
comment on column WII_DC_SCHEDUL_CHARGE_INFO.id
  is '����Ψһֵ';
comment on column WII_DC_SCHEDUL_CHARGE_INFO.charge_year_month
  is '�Ű��¶�';
comment on column WII_DC_SCHEDUL_CHARGE_INFO.list_code
  is '���';
comment on column WII_DC_SCHEDUL_CHARGE_INFO.wardcode
  is '���ұ��';
comment on column WII_DC_SCHEDUL_CHARGE_INFO.charge_person_id
  is '������';
comment on column WII_DC_SCHEDUL_CHARGE_INFO.creator
  is '������';
comment on column WII_DC_SCHEDUL_CHARGE_INFO.create_time
  is '��������';
comment on column WII_DC_SCHEDUL_CHARGE_INFO.modifier
  is '�޸���';
comment on column WII_DC_SCHEDUL_CHARGE_INFO.modify_time
  is '�޸�����';
alter table WII_DC_SCHEDUL_CHARGE_INFO
  add constraint PK_ID primary key (ID)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WII_DC_SCHEDUL_DUTY_INFO
prompt =======================================
prompt
create table WII_DC_SCHEDUL_DUTY_INFO
(
  id                VARCHAR2(50) not null,
  charge_year_month VARCHAR2(10),
  wardcode          VARCHAR2(1000),
  classes_type      NUMBER(1),
  work_date         DATE,
  creator           VARCHAR2(20),
  create_time       DATE default sysdate,
  modifier          VARCHAR2(20),
  modify_time       DATE,
  doctor            VARCHAR2(200),
  group_no          VARCHAR2(36),
  seqnumber         NUMBER(5)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_DC_SCHEDUL_DUTY_INFO
  is '����ֵ��_����';
comment on column WII_DC_SCHEDUL_DUTY_INFO.id
  is '����Ψһֵ';
comment on column WII_DC_SCHEDUL_DUTY_INFO.charge_year_month
  is '�Ű��¶�';
comment on column WII_DC_SCHEDUL_DUTY_INFO.wardcode
  is '���ұ��';
comment on column WII_DC_SCHEDUL_DUTY_INFO.classes_type
  is '���';
comment on column WII_DC_SCHEDUL_DUTY_INFO.work_date
  is '�Ű�����';
comment on column WII_DC_SCHEDUL_DUTY_INFO.creator
  is '������';
comment on column WII_DC_SCHEDUL_DUTY_INFO.create_time
  is '��������';
comment on column WII_DC_SCHEDUL_DUTY_INFO.modifier
  is '�޸���';
comment on column WII_DC_SCHEDUL_DUTY_INFO.modify_time
  is '�޸�����';
comment on column WII_DC_SCHEDUL_DUTY_INFO.doctor
  is '���Ű�ҽ��(���USER_ID)';
comment on column WII_DC_SCHEDUL_DUTY_INFO.group_no
  is '���(1 2 3�����(����))';
comment on column WII_DC_SCHEDUL_DUTY_INFO.seqnumber
  is '������';
alter table WII_DC_SCHEDUL_DUTY_INFO
  add constraint PK_DUTYID primary key (ID)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WII_DC_SCHEDUL_WARD_INFO
prompt =======================================
prompt
create table WII_DC_SCHEDUL_WARD_INFO
(
  id                VARCHAR2(50) not null,
  charge_year_month VARCHAR2(10),
  group_code        VARCHAR2(50),
  wardcode          VARCHAR2(20),
  post_name         VARCHAR2(50),
  user_id           VARCHAR2(1000),
  creator           VARCHAR2(20),
  create_time       DATE default sysdate,
  modifier          VARCHAR2(20),
  modify_time       DATE,
  teacher_id        VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_DC_SCHEDUL_WARD_INFO
  is '��������Ϣ';
comment on column WII_DC_SCHEDUL_WARD_INFO.id
  is '����Ψһֵ';
comment on column WII_DC_SCHEDUL_WARD_INFO.charge_year_month
  is '�Ű��¶�';
comment on column WII_DC_SCHEDUL_WARD_INFO.group_code
  is '��������Ϣ���';
comment on column WII_DC_SCHEDUL_WARD_INFO.wardcode
  is '���ұ��';
comment on column WII_DC_SCHEDUL_WARD_INFO.post_name
  is '��λ����';
comment on column WII_DC_SCHEDUL_WARD_INFO.user_id
  is '��Ա���';
comment on column WII_DC_SCHEDUL_WARD_INFO.creator
  is '������';
comment on column WII_DC_SCHEDUL_WARD_INFO.create_time
  is '��������';
comment on column WII_DC_SCHEDUL_WARD_INFO.modifier
  is '�޸���';
comment on column WII_DC_SCHEDUL_WARD_INFO.modify_time
  is '�޸�����';
comment on column WII_DC_SCHEDUL_WARD_INFO.teacher_id
  is '������ʦ';
alter table WII_DC_SCHEDUL_WARD_INFO
  add constraint PK_WARDID primary key (ID)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WII_DDD_DETAIL
prompt =============================
prompt
create table WII_DDD_DETAIL
(
  doctor            VARCHAR2(50),
  pharmacy_code     VARCHAR2(50),
  pharmacy_chemname VARCHAR2(50),
  dosage            VARCHAR2(50),
  units             VARCHAR2(50),
  ddd_value         VARCHAR2(20),
  ddd_unit          VARCHAR2(20),
  org_code          VARCHAR2(50),
  org_name          VARCHAR2(50),
  order_time        DATE,
  memo              VARCHAR2(50),
  valid             VARCHAR2(20),
  create_time       DATE default sysdate,
  creator           NVARCHAR2(20),
  modifier          NVARCHAR2(20),
  modify_time       DATE
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_DDD_DETAIL.doctor
  is 'ҽ��';
comment on column WII_DDD_DETAIL.pharmacy_code
  is 'ҩ��Code';
comment on column WII_DDD_DETAIL.pharmacy_chemname
  is 'ҩ������';
comment on column WII_DDD_DETAIL.dosage
  is '����';
comment on column WII_DDD_DETAIL.units
  is '��λ';
comment on column WII_DDD_DETAIL.ddd_value
  is 'dddֵ';
comment on column WII_DDD_DETAIL.ddd_unit
  is 'ddd��λ';
comment on column WII_DDD_DETAIL.org_code
  is '����CODE';
comment on column WII_DDD_DETAIL.org_name
  is '��������';
comment on column WII_DDD_DETAIL.order_time
  is 'ҽ��ʱ��';
comment on column WII_DDD_DETAIL.memo
  is '��ע';
comment on column WII_DDD_DETAIL.valid
  is '��Ч�ԣ�0-��Ч��1-��Ч��';
comment on column WII_DDD_DETAIL.create_time
  is '����ʱ��';
comment on column WII_DDD_DETAIL.creator
  is '������';
comment on column WII_DDD_DETAIL.modifier
  is '�޸���';
comment on column WII_DDD_DETAIL.modify_time
  is '�޸�ʱ��';

prompt
prompt Creating table WII_DEVICE_ACCESS
prompt ================================
prompt
create table WII_DEVICE_ACCESS
(
  device_id    VARCHAR2(20),
  device_label VARCHAR2(20),
  ward_code    VARCHAR2(20),
  memo         VARCHAR2(200),
  create_time  DATE,
  creator      VARCHAR2(20),
  modifier     VARCHAR2(20),
  modify_time  DATE,
  unique_id    VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_DEVICE_ACCESS.device_id
  is '�豸�ʲ����';
comment on column WII_DEVICE_ACCESS.device_label
  is '�豸��ǩ';
comment on column WII_DEVICE_ACCESS.ward_code
  is '����';
comment on column WII_DEVICE_ACCESS.create_time
  is '����ʱ��';
comment on column WII_DEVICE_ACCESS.creator
  is '������';
comment on column WII_DEVICE_ACCESS.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_DEVICE_MASTER
prompt ================================
prompt
create table WII_DEVICE_MASTER
(
  device_id           VARCHAR2(20),
  device_label        VARCHAR2(20),
  device_status       VARCHAR2(1),
  supplier            VARCHAR2(40),
  model               VARCHAR2(40),
  interface_type      NUMBER(1),
  interface_desc      VARCHAR2(20),
  ip_addr             VARCHAR2(15),
  mac_addr            VARCHAR2(12),
  last_recv_time      DATE,
  last_recv_bed_id    VARCHAR2(5),
  duplex_flag         NUMBER(5),
  autoin_flag         VARCHAR2(1),
  comm_port           VARCHAR2(6),
  baud_rate           NUMBER(10),
  byte_size           NUMBER(5),
  parity              NUMBER(5),
  stop_bits           NUMBER(5),
  f_outx              NUMBER(5),
  f_inx               NUMBER(5),
  f_hardware          NUMBER(5),
  tx_queuesize        NUMBER(10),
  rx_queuesize        NUMBER(10),
  xon_lim             NUMBER(10),
  xoff_lim            NUMBER(10),
  xon_char            VARCHAR2(1),
  xoff_char           VARCHAR2(1),
  error_char          VARCHAR2(1),
  event_char          VARCHAR2(1),
  driver_prog         VARCHAR2(128),
  priority            NUMBER(5),
  item_type           VARCHAR2(1),
  auto_load           NUMBER(5),
  current_recv_items  VARCHAR2(200),
  frequency_display   NUMBER(5),
  memo                NVARCHAR2(100),
  datalog_start_time  DATE,
  pc_port             NUMBER(5),
  datalog_status      VARCHAR2(4),
  ip_port             NUMBER(5),
  in_port             NUMBER(5),
  out_port            NUMBER(5),
  current_patient_id  VARCHAR2(20),
  device_type         VARCHAR2(20),
  unique_id           VARCHAR2(50) default sys_guid(),
  creator             NVARCHAR2(20),
  create_time         DATE default sysdate,
  modifier            NVARCHAR2(20),
  modify_time         DATE,
  org_code            VARCHAR2(30),
  monitor_item_config VARCHAR2(100),
  ward_code           VARCHAR2(30)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_DEVICE_MASTER.device_id
  is '�豸�ʲ����';
comment on column WII_DEVICE_MASTER.device_label
  is '�豸��ǩ';
comment on column WII_DEVICE_MASTER.device_status
  is '0:���� 1��ռ�� 2��ά�� 3�������� 8������ 9������...';
comment on column WII_DEVICE_MASTER.supplier
  is '��������';
comment on column WII_DEVICE_MASTER.model
  is '�ͺ�';
comment on column WII_DEVICE_MASTER.interface_type
  is '�ӿ�����';
comment on column WII_DEVICE_MASTER.interface_desc
  is '�ӿ�����';
comment on column WII_DEVICE_MASTER.ip_addr
  is 'IP��ַ';
comment on column WII_DEVICE_MASTER.mac_addr
  is 'MAC��ַ';
comment on column WII_DEVICE_MASTER.last_recv_time
  is '����ɼ�ʱ��';
comment on column WII_DEVICE_MASTER.last_recv_bed_id
  is '����ɼ�����';
comment on column WII_DEVICE_MASTER.duplex_flag
  is '˫����־';
comment on column WII_DEVICE_MASTER.autoin_flag
  is '�Զ�����־';
comment on column WII_DEVICE_MASTER.comm_port
  is 'ͨѶ�ں�';
comment on column WII_DEVICE_MASTER.baud_rate
  is '������';
comment on column WII_DEVICE_MASTER.byte_size
  is '����λ';
comment on column WII_DEVICE_MASTER.parity
  is 'У������';
comment on column WII_DEVICE_MASTER.stop_bits
  is 'ֹͣλ';
comment on column WII_DEVICE_MASTER.f_outx
  is '����ʹ��';
comment on column WII_DEVICE_MASTER.f_inx
  is '����ʹ��';
comment on column WII_DEVICE_MASTER.f_hardware
  is '��Ӳ������';
comment on column WII_DEVICE_MASTER.tx_queuesize
  is '���Ͷ��д�С';
comment on column WII_DEVICE_MASTER.rx_queuesize
  is '���ն��д�С';
comment on column WII_DEVICE_MASTER.xon_lim
  is 'XON��ֵ';
comment on column WII_DEVICE_MASTER.xoff_lim
  is 'XOFF��ֵ';
comment on column WII_DEVICE_MASTER.xon_char
  is 'XON�ַ�';
comment on column WII_DEVICE_MASTER.xoff_char
  is 'XOFF�ַ�';
comment on column WII_DEVICE_MASTER.error_char
  is '��������ַ�';
comment on column WII_DEVICE_MASTER.event_char
  is '����¼��ַ�';
comment on column WII_DEVICE_MASTER.driver_prog
  is '�ӿڳ���';
comment on column WII_DEVICE_MASTER.priority
  is '�ӿڳ������ȼ�';
comment on column WII_DEVICE_MASTER.item_type
  is '����������ĸ';
comment on column WII_DEVICE_MASTER.auto_load
  is '�Զ�װ�������ӿڳ���';
comment on column WII_DEVICE_MASTER.current_recv_items
  is '��ǰ�ɼ���������������
�������ö��Ÿ���';
comment on column WII_DEVICE_MASTER.frequency_display
  is '�ɼ�Ƶ��';
comment on column WII_DEVICE_MASTER.memo
  is '��ע';
comment on column WII_DEVICE_MASTER.datalog_start_time
  is '���ݼ�¼��ʼʱ��';
comment on column WII_DEVICE_MASTER.pc_port
  is 'PC�˿ں�';
comment on column WII_DEVICE_MASTER.datalog_status
  is '״̬';
comment on column WII_DEVICE_MASTER.ip_port
  is 'IP�˿�';
comment on column WII_DEVICE_MASTER.in_port
  is '���ն˿ں�';
comment on column WII_DEVICE_MASTER.out_port
  is '���Ͷ˿ں�';
comment on column WII_DEVICE_MASTER.current_patient_id
  is '��ǰʹ�û��߱��';
comment on column WII_DEVICE_MASTER.device_type
  is '�豸���';
comment on column WII_DEVICE_MASTER.unique_id
  is '����ΨһID';
comment on column WII_DEVICE_MASTER.org_code
  is '����������ţ��ɼ������ã�';
comment on column WII_DEVICE_MASTER.monitor_item_config
  is '���òɼ����ã��ɵ����ɼ������Ƿ�д�������Լ��ɼ���ֵ���㱶����40|1|0.01��';
comment on column WII_DEVICE_MASTER.ward_code
  is '����������ţ�API����ã�';

prompt
prompt Creating table WII_DEVICE_USING
prompt ===============================
prompt
create table WII_DEVICE_USING
(
  patient_id                 VARCHAR2(20),
  device_id                  VARCHAR2(20),
  start_time                 DATE,
  end_time                   DATE,
  bunding_operator           VARCHAR2(20),
  bunding_time               DATE,
  create_time                DATE default sysdate,
  creator                    VARCHAR2(20),
  unbunding_operator         VARCHAR2(20),
  unbunding_time             DATE,
  frequence                  NUMBER(6),
  lastsync_time              DATE,
  modifier                   VARCHAR2(20),
  modify_time                DATE,
  unique_id                  VARCHAR2(50) default sys_guid(),
  initial_value              VARCHAR2(2000),
  bind_begin_hours_frequnce  VARCHAR2(50),
  bind_monitor_item_frequnce VARCHAR2(100)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_DEVICE_USING.patient_id
  is '����Ψһ��ʶ��';
comment on column WII_DEVICE_USING.device_id
  is '�豸�ʲ����';
comment on column WII_DEVICE_USING.start_time
  is '�豸�󶨹���ʱ��';
comment on column WII_DEVICE_USING.end_time
  is '�豸���ʱ��';
comment on column WII_DEVICE_USING.bunding_operator
  is '�󶨲�����';
comment on column WII_DEVICE_USING.bunding_time
  is '�󶨲���ʱ��';
comment on column WII_DEVICE_USING.create_time
  is '����ʱ��';
comment on column WII_DEVICE_USING.creator
  is '������';
comment on column WII_DEVICE_USING.unbunding_operator
  is '��������';
comment on column WII_DEVICE_USING.unbunding_time
  is '������ʱ��';
comment on column WII_DEVICE_USING.frequence
  is '�豸������ʾƵ��';
comment on column WII_DEVICE_USING.lastsync_time
  is '���ͬ��ʱ��';
comment on column WII_DEVICE_USING.unique_id
  is '����ΨһID';
comment on column WII_DEVICE_USING.initial_value
  is '��ʼֵ';
comment on column WII_DEVICE_USING.bind_begin_hours_frequnce
  is '�������趨�󶨿�ʼ����Сʱ����Ƶ�ʣ�2|30 ָ2Сʱ30�֣�';
comment on column WII_DEVICE_USING.bind_monitor_item_frequnce
  is '�󶨻���������Ƶ�ʣ������õ��������ɼ�Ƶ�ʣ���������Ĭ�ϣ�IBP|120,NIBP|240��';

prompt
prompt Creating table WII_DIAGNOSE
prompt ===========================
prompt
create table WII_DIAGNOSE
(
  diagnose_series_no    VARCHAR2(55) not null,
  patient_id            VARCHAR2(20),
  inpatient_visitid     VARCHAR2(20),
  diagnose_type         NVARCHAR2(40),
  diagnose_name         NVARCHAR2(100),
  diagnose_code         VARCHAR2(20),
  diagnose_time         DATE,
  diagnose_doctor       NVARCHAR2(20),
  auditor               NVARCHAR2(20),
  audit_time            DATE,
  diagnose_disease_type NVARCHAR2(40),
  disgnose_system       NVARCHAR2(30),
  creator               NVARCHAR2(20),
  create_time           DATE default sysdate,
  modifier              NVARCHAR2(20),
  modify_time           DATE,
  unique_id             VARCHAR2(50) default sys_guid(),
  updatetime            DATE,
  updater               NVARCHAR2(20),
  source                NVARCHAR2(20),
  diagnose_sequence     NUMBER,
  diagnose_num          NUMBER
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_DIAGNOSE.diagnose_series_no
  is '�����ˮ��';
comment on column WII_DIAGNOSE.patient_id
  is '����Ψһ��ʶ��';
comment on column WII_DIAGNOSE.inpatient_visitid
  is 'סԺ��ţ���ʾÿ�λ���סԺ��Ψһ�ţ�����סԺ��+סԺ������';
comment on column WII_DIAGNOSE.diagnose_type
  is '������ͣ���Ժ��������������ϡ����ա��ȣ�������Ӧһ����������ֵ�';
comment on column WII_DIAGNOSE.diagnose_name
  is '�������';
comment on column WII_DIAGNOSE.diagnose_code
  is '��ϱ��루��Ӧ�ֵ䣻�ֵ����ICD���������룩';
comment on column WII_DIAGNOSE.diagnose_time
  is '���ʱ��';
comment on column WII_DIAGNOSE.diagnose_doctor
  is '���ҽ��';
comment on column WII_DIAGNOSE.auditor
  is '�����';
comment on column WII_DIAGNOSE.audit_time
  is '���ʱ��';
comment on column WII_DIAGNOSE.diagnose_disease_type
  is '��ϼ�������';
comment on column WII_DIAGNOSE.disgnose_system
  is 'ICU����漰����ϵͳ';
comment on column WII_DIAGNOSE.unique_id
  is '����ΨһID';
comment on column WII_DIAGNOSE.updatetime
  is '��������';
comment on column WII_DIAGNOSE.updater
  is '������';
comment on column WII_DIAGNOSE.source
  is '��Դ';
comment on column WII_DIAGNOSE.diagnose_sequence
  is '�������';
comment on column WII_DIAGNOSE.diagnose_num
  is 'His�����ֶ�';
alter table WII_DIAGNOSE
  add constraint SYS_ZJ_DIAGNOSE primary key (DIAGNOSE_SERIES_NO)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WII_DIAGNOSE_ASSOCIATE
prompt =====================================
prompt
create table WII_DIAGNOSE_ASSOCIATE
(
  diagnose_item         NVARCHAR2(500),
  diagnose_score        NVARCHAR2(500),
  score                 VARCHAR2(20),
  input_time            DATE,
  create_time           DATE default sysdate,
  modifier              NVARCHAR2(20),
  modify_time           DATE,
  unique_id             VARCHAR2(50) default sys_guid(),
  diagnose_doctor       VARCHAR2(20),
  icu_disgnose_system   NVARCHAR2(30),
  diagnosis_type_code   NVARCHAR2(40),
  diagnose_disease_type NVARCHAR2(40)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_DIAGNOSE_ASSOCIATE
  is '���������ƥ�����ϵ��';
comment on column WII_DIAGNOSE_ASSOCIATE.diagnose_item
  is '�������';
comment on column WII_DIAGNOSE_ASSOCIATE.diagnose_score
  is 'ƥ���������';
comment on column WII_DIAGNOSE_ASSOCIATE.score
  is '����';
comment on column WII_DIAGNOSE_ASSOCIATE.input_time
  is '¼������';
comment on column WII_DIAGNOSE_ASSOCIATE.create_time
  is '����ʱ��';
comment on column WII_DIAGNOSE_ASSOCIATE.unique_id
  is '����ΨһID';
comment on column WII_DIAGNOSE_ASSOCIATE.diagnosis_type_code
  is 'ʱ�����';
comment on column WII_DIAGNOSE_ASSOCIATE.diagnose_disease_type
  is '��ϼ�������';

prompt
prompt Creating table WII_DIAGNOSE_BAK
prompt ===============================
prompt
create table WII_DIAGNOSE_BAK
(
  diagnose_series_no    VARCHAR2(55) not null,
  patient_id            VARCHAR2(20) not null,
  inpatient_visitid     VARCHAR2(20) not null,
  diagnose_type         VARCHAR2(20) not null,
  diagnose_name         VARCHAR2(100) not null,
  diagnose_code         VARCHAR2(20),
  diagnose_time         DATE not null,
  diagnose_doctor       VARCHAR2(20) not null,
  auditor               VARCHAR2(20),
  audit_time            DATE,
  diagnose_disease_type VARCHAR2(20),
  disgnose_system       VARCHAR2(30),
  unique_id             VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table WII_DIAGNOSE_DIC_BAK
prompt ===================================
prompt
create table WII_DIAGNOSE_DIC_BAK
(
  diagnosis_code        VARCHAR2(16) not null,
  diagnosis_name        NVARCHAR2(100) not null,
  diagnosis_code_origin VARCHAR2(20),
  input_code            VARCHAR2(8),
  memo                  NVARCHAR2(50),
  unique_id             VARCHAR2(50) not null,
  creator               NVARCHAR2(20),
  create_time           DATE,
  modifier              NVARCHAR2(20),
  modify_time           DATE
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table WII_DIAGNOSE_MODIFY
prompt ==================================
prompt
create table WII_DIAGNOSE_MODIFY
(
  diagnose_series_no     VARCHAR2(55),
  patient_id             VARCHAR2(20),
  inpatient_visitid      VARCHAR2(20),
  diagnose_type          VARCHAR2(20),
  diagnose_name          NVARCHAR2(100),
  diagnose_code          VARCHAR2(20),
  diagnose_time          DATE,
  diagnose_doctor        NVARCHAR2(20),
  diagnose_modify_time   DATE,
  diagnose_modify_doctor NVARCHAR2(20),
  auditor                NVARCHAR2(20),
  aduit_time             DATE,
  creator                NVARCHAR2(20),
  create_time            DATE default sysdate,
  modifier               NVARCHAR2(20),
  modify_time            DATE,
  unique_id              VARCHAR2(50) default sys_guid(),
  diagnose_disease_type  NVARCHAR2(40),
  disgnose_system        NVARCHAR2(30)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 192K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_DIAGNOSE_MODIFY.diagnose_series_no
  is '�����ˮ��';
comment on column WII_DIAGNOSE_MODIFY.patient_id
  is '����Ψһ��ʶ��';
comment on column WII_DIAGNOSE_MODIFY.inpatient_visitid
  is 'סԺ��ţ���ʾÿ�λ���סԺ��Ψһ�ţ�����סԺ��+סԺ������';
comment on column WII_DIAGNOSE_MODIFY.diagnose_type
  is '������ͣ���Ժ��������������ϡ����ա��ȣ�������Ӧһ����������ֵ�';
comment on column WII_DIAGNOSE_MODIFY.diagnose_name
  is '�������';
comment on column WII_DIAGNOSE_MODIFY.diagnose_code
  is '��ϱ��루��Ӧ�ֵ䣻�ֵ����ICD���������룩';
comment on column WII_DIAGNOSE_MODIFY.diagnose_time
  is '���ʱ��';
comment on column WII_DIAGNOSE_MODIFY.diagnose_doctor
  is '���ҽ��';
comment on column WII_DIAGNOSE_MODIFY.diagnose_modify_time
  is '�������ʱ��';
comment on column WII_DIAGNOSE_MODIFY.diagnose_modify_doctor
  is '�������ҽ��';
comment on column WII_DIAGNOSE_MODIFY.auditor
  is '�����';
comment on column WII_DIAGNOSE_MODIFY.aduit_time
  is '���ʱ��';
comment on column WII_DIAGNOSE_MODIFY.unique_id
  is '����ΨһID';
comment on column WII_DIAGNOSE_MODIFY.diagnose_disease_type
  is '��ϼ�������';
comment on column WII_DIAGNOSE_MODIFY.disgnose_system
  is 'ICU����漰����ϵͳ';

prompt
prompt Creating table WII_DIAGNOSE_TEXT
prompt ================================
prompt
create table WII_DIAGNOSE_TEXT
(
  patientid    VARCHAR2(20),
  origintext   NVARCHAR2(2000),
  input_time   DATE,
  creator      NVARCHAR2(20),
  create_time  DATE default sysdate,
  modifier     NVARCHAR2(20),
  modify_time  DATE,
  unique_id    VARCHAR2(50) default sys_guid(),
  diagnosetype NUMBER
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_DIAGNOSE_TEXT.patientid
  is '����Ψһ��ʶ��';
comment on column WII_DIAGNOSE_TEXT.origintext
  is '��ϱ��ԭʼ�ı�';
comment on column WII_DIAGNOSE_TEXT.input_time
  is '����ʱ��';
comment on column WII_DIAGNOSE_TEXT.unique_id
  is '����ΨһID';
comment on column WII_DIAGNOSE_TEXT.diagnosetype
  is '0:��Ժ��� |1:�������';

prompt
prompt Creating table WII_DIAGNOSE_TYPE_DIC
prompt ====================================
prompt
create table WII_DIAGNOSE_TYPE_DIC
(
  diagnosis_type_code     VARCHAR2(20),
  diagnosis_type_name     NVARCHAR2(40),
  diagnosis_type_category NVARCHAR2(20),
  input_code              VARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_DIAGNOSE_TYPE_DIC.diagnosis_type_code
  is '���������';
comment on column WII_DIAGNOSE_TYPE_DIC.diagnosis_type_name
  is '����������';
comment on column WII_DIAGNOSE_TYPE_DIC.diagnosis_type_category
  is '���������';
comment on column WII_DIAGNOSE_TYPE_DIC.input_code
  is '������';

prompt
prompt Creating table WII_DIAGNOSE_TYPE_MAPPING_DIC
prompt ============================================
prompt
create table WII_DIAGNOSE_TYPE_MAPPING_DIC
(
  cis_type_code VARCHAR2(50),
  his_type_code VARCHAR2(50),
  his_type_name VARCHAR2(100),
  input_code    VARCHAR2(50),
  memo          VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table WII_DIAGNOSE_TYPE_MAPPING_DIC
  is '������Ͷ��ձ�';
comment on column WII_DIAGNOSE_TYPE_MAPPING_DIC.cis_type_code
  is 'CIS���ͱ���';
comment on column WII_DIAGNOSE_TYPE_MAPPING_DIC.his_type_code
  is 'HIS���ͱ���';
comment on column WII_DIAGNOSE_TYPE_MAPPING_DIC.his_type_name
  is 'HIS��������';
comment on column WII_DIAGNOSE_TYPE_MAPPING_DIC.input_code
  is '������';
comment on column WII_DIAGNOSE_TYPE_MAPPING_DIC.memo
  is '��ע';

prompt
prompt Creating table WII_DICTIONARYINDEX_CONFIG
prompt =========================================
prompt
create table WII_DICTIONARYINDEX_CONFIG
(
  dic_code        VARCHAR2(50) not null,
  dic_parent_code VARCHAR2(50),
  dic_type        VARCHAR2(30),
  dic_name        NVARCHAR2(60) not null,
  dic_tablename   VARCHAR2(50) not null,
  description     NVARCHAR2(160),
  dic_class       VARCHAR2(50),
  dic_seq         NUMBER(2),
  creator         VARCHAR2(20),
  create_time     DATE default sysdate,
  modifier        VARCHAR2(20),
  modify_time     DATE,
  unique_id       VARCHAR2(50) default sys_guid() not null,
  is_config       NUMBER(1),
  is_visible      NUMBER(1) default 1,
  column_visible  VARCHAR2(200),
  dic_moudle      VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_DICTIONARYINDEX_CONFIG.dic_code
  is '  ���� ';
comment on column WII_DICTIONARYINDEX_CONFIG.dic_parent_code
  is ' ���� ���� ';
comment on column WII_DICTIONARYINDEX_CONFIG.dic_type
  is '����(ͨ�ã�ҽ�������)';
comment on column WII_DICTIONARYINDEX_CONFIG.dic_name
  is '����';
comment on column WII_DICTIONARYINDEX_CONFIG.dic_tablename
  is '��Ӧ����';
comment on column WII_DICTIONARYINDEX_CONFIG.description
  is '���� ';
comment on column WII_DICTIONARYINDEX_CONFIG.dic_class
  is '����С��';
comment on column WII_DICTIONARYINDEX_CONFIG.dic_seq
  is '����';
comment on column WII_DICTIONARYINDEX_CONFIG.unique_id
  is '����ΨһID';
comment on column WII_DICTIONARYINDEX_CONFIG.is_config
  is '�Ƿ�����';
comment on column WII_DICTIONARYINDEX_CONFIG.is_visible
  is '�Ƿ�ɼ�';
comment on column WII_DICTIONARYINDEX_CONFIG.column_visible
  is '�ֵ���ʾ�ֶ�';
comment on column WII_DICTIONARYINDEX_CONFIG.dic_moudle
  is 'ģ��';

prompt
prompt Creating table WII_DMAR_PORTFOLIO_MASTER
prompt ========================================
prompt
create table WII_DMAR_PORTFOLIO_MASTER
(
  portfolio_id        VARCHAR2(40),
  portfolio_type      VARCHAR2(20),
  portfolio_name      VARCHAR2(200),
  portfolio_memo      NVARCHAR2(1000),
  parent_portfolio_id VARCHAR2(40),
  is_auto             NUMBER(1),
  ward_codes          NVARCHAR2(200),
  captial_source      NVARCHAR2(200),
  captial_amounts     NUMBER,
  responser           NVARCHAR2(200),
  administrators      NVARCHAR2(200),
  primary_members     NVARCHAR2(200),
  creator             NVARCHAR2(20),
  create_time         DATE default sysdate,
  unique_id           VARCHAR2(50) default sys_guid(),
  modifier            NVARCHAR2(20),
  modify_time         DATE,
  milestones_point    VARCHAR2(40)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table WII_DMAR_PORTFOLIO_MASTER
  is '������Ŀ��';
comment on column WII_DMAR_PORTFOLIO_MASTER.portfolio_id
  is 'DMAR�鵵��Ŀ���';
comment on column WII_DMAR_PORTFOLIO_MASTER.portfolio_type
  is '�鵵��Ŀ���� 1-�ļ��У�2����';
comment on column WII_DMAR_PORTFOLIO_MASTER.portfolio_name
  is '�鵵��Ŀ����';
comment on column WII_DMAR_PORTFOLIO_MASTER.portfolio_memo
  is '��Ŀ����';
comment on column WII_DMAR_PORTFOLIO_MASTER.parent_portfolio_id
  is '��DMAR�鵵��Ŀ���';
comment on column WII_DMAR_PORTFOLIO_MASTER.is_auto
  is '1-�Զ��鵵��2-�ֶ��鵵';
comment on column WII_DMAR_PORTFOLIO_MASTER.ward_codes
  is '�Ѽ����ߵĲ���';
comment on column WII_DMAR_PORTFOLIO_MASTER.captial_source
  is '�ʽ���Դ';
comment on column WII_DMAR_PORTFOLIO_MASTER.captial_amounts
  is '�ʽ���';
comment on column WII_DMAR_PORTFOLIO_MASTER.responser
  is '���п��⸺����';
comment on column WII_DMAR_PORTFOLIO_MASTER.administrators
  is '���п������Ա';
comment on column WII_DMAR_PORTFOLIO_MASTER.primary_members
  is '���п�������Ҫ��Ա';
comment on column WII_DMAR_PORTFOLIO_MASTER.creator
  is '������';
comment on column WII_DMAR_PORTFOLIO_MASTER.create_time
  is '����ʱ��';
comment on column WII_DMAR_PORTFOLIO_MASTER.unique_id
  is '����ΨһID';
comment on column WII_DMAR_PORTFOLIO_MASTER.milestones_point
  is '��̱��ڵ���';

prompt
prompt Creating table WII_DMAR_PORTFOLIO_MILESTONES
prompt ============================================
prompt
create table WII_DMAR_PORTFOLIO_MILESTONES
(
  milestones_id   VARCHAR2(40),
  portfolio_id    VARCHAR2(40),
  milestones_task NVARCHAR2(200),
  time_point      DATE,
  remind_time     DATE,
  creator         NVARCHAR2(20),
  create_time     DATE default sysdate,
  unique_id       VARCHAR2(50) default sys_guid(),
  modifier        NVARCHAR2(20),
  modify_time     DATE
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table WII_DMAR_PORTFOLIO_MILESTONES
  is '���п�����̱���';
comment on column WII_DMAR_PORTFOLIO_MILESTONES.milestones_id
  is '���п�����̱����';
comment on column WII_DMAR_PORTFOLIO_MILESTONES.portfolio_id
  is 'DMAR�鵵��Ŀ���';
comment on column WII_DMAR_PORTFOLIO_MILESTONES.milestones_task
  is '���п����������';
comment on column WII_DMAR_PORTFOLIO_MILESTONES.time_point
  is '���ʱ��ڵ�';
comment on column WII_DMAR_PORTFOLIO_MILESTONES.remind_time
  is '�������ʱ��';
comment on column WII_DMAR_PORTFOLIO_MILESTONES.creator
  is '������';
comment on column WII_DMAR_PORTFOLIO_MILESTONES.create_time
  is '����ʱ��';
comment on column WII_DMAR_PORTFOLIO_MILESTONES.unique_id
  is '����ΨһID';
comment on column WII_DMAR_PORTFOLIO_MILESTONES.modifier
  is '�޸���';
comment on column WII_DMAR_PORTFOLIO_MILESTONES.modify_time
  is '�޸�ʱ��';

prompt
prompt Creating table WII_DMAR_PORTFOLIO_PATIENT
prompt =========================================
prompt
create table WII_DMAR_PORTFOLIO_PATIENT
(
  portfolio_id      VARCHAR2(40),
  group_id          VARCHAR2(40),
  patient_id        VARCHAR2(40),
  inpatient_visitid VARCHAR2(40),
  sample_memo       NVARCHAR2(50),
  operator          NVARCHAR2(40),
  operate_time      DATE,
  unique_id         VARCHAR2(50) default sys_guid(),
  creator           NVARCHAR2(40),
  create_time       DATE default sysdate,
  modifier          NVARCHAR2(40),
  modify_time       DATE
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table WII_DMAR_PORTFOLIO_PATIENT
  is '���п��⻼�߱�';
comment on column WII_DMAR_PORTFOLIO_PATIENT.portfolio_id
  is 'DMAR�鵵��Ŀ���';
comment on column WII_DMAR_PORTFOLIO_PATIENT.group_id
  is '������';
comment on column WII_DMAR_PORTFOLIO_PATIENT.patient_id
  is '���߱��';
comment on column WII_DMAR_PORTFOLIO_PATIENT.inpatient_visitid
  is '����סԺ���';
comment on column WII_DMAR_PORTFOLIO_PATIENT.sample_memo
  is '��ע';
comment on column WII_DMAR_PORTFOLIO_PATIENT.operator
  is '������';
comment on column WII_DMAR_PORTFOLIO_PATIENT.operate_time
  is '����ʱ��';
comment on column WII_DMAR_PORTFOLIO_PATIENT.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_DMAR_SAMPLE_CAL_CONFIG
prompt =========================================
prompt
create table WII_DMAR_SAMPLE_CAL_CONFIG
(
  sample_report_no        VARCHAR2(50),
  cal_item_no             VARCHAR2(40),
  cal_item_name           VARCHAR2(100),
  data_source_set         VARCHAR2(50),
  data_source_property    VARCHAR2(50),
  data_compute_method     VARCHAR2(50),
  data_choose_condition   VARCHAR2(100),
  data_filter_condition   VARCHAR2(1000),
  data_sequence_condition VARCHAR2(50),
  is_use                  NUMBER(1),
  cal_big_item_name       VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_DMAR_SAMPLE_CAL_CONFIG.sample_report_no
  is '����������';
comment on column WII_DMAR_SAMPLE_CAL_CONFIG.cal_item_no
  is '������Ŀ���';
comment on column WII_DMAR_SAMPLE_CAL_CONFIG.cal_item_name
  is '������Ŀ����';
comment on column WII_DMAR_SAMPLE_CAL_CONFIG.data_source_set
  is '��ȡ��Դ���ݼ�';
comment on column WII_DMAR_SAMPLE_CAL_CONFIG.data_source_property
  is '��ȡ����Դ����';
comment on column WII_DMAR_SAMPLE_CAL_CONFIG.data_compute_method
  is '���㷽ʽ��ȡֵ����͡������С������';
comment on column WII_DMAR_SAMPLE_CAL_CONFIG.data_choose_condition
  is '��ȡ������ȫ������һ������n�������һ��';
comment on column WII_DMAR_SAMPLE_CAL_CONFIG.data_filter_condition
  is 'ɸѡ����';
comment on column WII_DMAR_SAMPLE_CAL_CONFIG.data_sequence_condition
  is '��������';
comment on column WII_DMAR_SAMPLE_CAL_CONFIG.is_use
  is '0 ����  1 ʹ��';
comment on column WII_DMAR_SAMPLE_CAL_CONFIG.cal_big_item_name
  is '�����������';

prompt
prompt Creating table WII_DMAR_SAMPLE_CAL_RANGE
prompt ========================================
prompt
create table WII_DMAR_SAMPLE_CAL_RANGE
(
  range_code VARCHAR2(50),
  range_name VARCHAR2(50),
  range_type VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table WII_DMAR_SAMPLE_GROUP
prompt ====================================
prompt
create table WII_DMAR_SAMPLE_GROUP
(
  group_id           VARCHAR2(40),
  group_code         VARCHAR2(40),
  group_name         VARCHAR2(200),
  group_memo         NVARCHAR2(1000),
  portfolio_id       NVARCHAR2(40),
  creator            NVARCHAR2(40),
  create_time        DATE default sysdate,
  unique_id          VARCHAR2(50) default sys_guid(),
  modifier           NVARCHAR2(40),
  modify_time        DATE,
  inclusion_criteria NVARCHAR2(2000)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table WII_DMAR_SAMPLE_GROUP
  is '���п��ⲡ�������';
comment on column WII_DMAR_SAMPLE_GROUP.group_id
  is '��Ʒ��ID';
comment on column WII_DMAR_SAMPLE_GROUP.group_code
  is '��Ʒ��Code';
comment on column WII_DMAR_SAMPLE_GROUP.group_name
  is '��Ʒ������';
comment on column WII_DMAR_SAMPLE_GROUP.group_memo
  is '��Ʒ������';
comment on column WII_DMAR_SAMPLE_GROUP.portfolio_id
  is 'DMAR�鵵��Ŀ���';
comment on column WII_DMAR_SAMPLE_GROUP.creator
  is '������';
comment on column WII_DMAR_SAMPLE_GROUP.create_time
  is '����ʱ��';
comment on column WII_DMAR_SAMPLE_GROUP.unique_id
  is '����ΨһID';
comment on column WII_DMAR_SAMPLE_GROUP.inclusion_criteria
  is '�鵵�������';

prompt
prompt Creating table WII_DOCTOR_DCL_DIC
prompt =================================
prompt
create table WII_DOCTOR_DCL_DIC
(
  dcl_item_code NVARCHAR2(50),
  name          NVARCHAR2(50),
  value_type    NVARCHAR2(50),
  value_ranage  NVARCHAR2(200),
  view_name     NVARCHAR2(200),
  memo          NVARCHAR2(200)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_DOCTOR_DCL_DIC.dcl_item_code
  is '��Ŀ����';
comment on column WII_DOCTOR_DCL_DIC.name
  is '��Ŀ����';
comment on column WII_DOCTOR_DCL_DIC.value_type
  is 'ֵ����';
comment on column WII_DOCTOR_DCL_DIC.value_ranage
  is 'ֵ��';
comment on column WII_DOCTOR_DCL_DIC.view_name
  is '��ʾ����';
comment on column WII_DOCTOR_DCL_DIC.memo
  is '��ע';

prompt
prompt Creating table WII_DOCTOR_DCL_MASTER
prompt ====================================
prompt
create table WII_DOCTOR_DCL_MASTER
(
  templete_code NVARCHAR2(50),
  patient_id    NVARCHAR2(50),
  check_time    DATE,
  check_doctor  NVARCHAR2(50),
  dcl_item_code NVARCHAR2(50),
  check_value   NVARCHAR2(100),
  creator       NVARCHAR2(20),
  create_time   DATE,
  modifier      NVARCHAR2(20),
  modify_time   DATE,
  unique_id     NVARCHAR2(50),
  shift_no      VARCHAR2(20),
  check_date    VARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_DOCTOR_DCL_MASTER.templete_code
  is 'ģ��Code';
comment on column WII_DOCTOR_DCL_MASTER.patient_id
  is '����ID';
comment on column WII_DOCTOR_DCL_MASTER.check_time
  is '�˶�ʱ��';
comment on column WII_DOCTOR_DCL_MASTER.check_doctor
  is '�˲�ҽ��';
comment on column WII_DOCTOR_DCL_MASTER.dcl_item_code
  is '�˶�CODE';
comment on column WII_DOCTOR_DCL_MASTER.check_value
  is '�˶Խ��';
comment on column WII_DOCTOR_DCL_MASTER.creator
  is '������';
comment on column WII_DOCTOR_DCL_MASTER.create_time
  is '����ʱ��';
comment on column WII_DOCTOR_DCL_MASTER.modifier
  is '�޸���';
comment on column WII_DOCTOR_DCL_MASTER.modify_time
  is '�޸�ʱ��';
comment on column WII_DOCTOR_DCL_MASTER.unique_id
  is '����Ψһid';
comment on column WII_DOCTOR_DCL_MASTER.shift_no
  is '��α��';
comment on column WII_DOCTOR_DCL_MASTER.check_date
  is '�˲�����';

prompt
prompt Creating table WII_DOCTOR_DCL_TEMPLETE
prompt ======================================
prompt
create table WII_DOCTOR_DCL_TEMPLETE
(
  ward_code            NVARCHAR2(50),
  templete_code        NVARCHAR2(50),
  templete_name        NVARCHAR2(50),
  dcl_catalog_code     NVARCHAR2(50),
  dcl_catalog_name     NVARCHAR2(50),
  parent_dcl_item_code NVARCHAR2(50),
  dcl_item_code        NVARCHAR2(50),
  seq                  NUMBER(12),
  type                 NVARCHAR2(20),
  creator              NVARCHAR2(20),
  create_time          DATE,
  modifier             NVARCHAR2(20),
  modify_time          DATE,
  unique_id            NVARCHAR2(50) default SYS_GUID()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_DOCTOR_DCL_TEMPLETE.ward_code
  is '����Code';
comment on column WII_DOCTOR_DCL_TEMPLETE.templete_code
  is 'ģ��Code';
comment on column WII_DOCTOR_DCL_TEMPLETE.templete_name
  is 'ģ������';
comment on column WII_DOCTOR_DCL_TEMPLETE.dcl_catalog_code
  is '�˲���Ŀ';
comment on column WII_DOCTOR_DCL_TEMPLETE.dcl_catalog_name
  is '�˲���Ŀ����';
comment on column WII_DOCTOR_DCL_TEMPLETE.parent_dcl_item_code
  is '�˲鸸��Ŀ';
comment on column WII_DOCTOR_DCL_TEMPLETE.dcl_item_code
  is '�˲���Ŀ';
comment on column WII_DOCTOR_DCL_TEMPLETE.seq
  is '����';
comment on column WII_DOCTOR_DCL_TEMPLETE.type
  is '����';
comment on column WII_DOCTOR_DCL_TEMPLETE.creator
  is '������';
comment on column WII_DOCTOR_DCL_TEMPLETE.create_time
  is '����ʱ��';
comment on column WII_DOCTOR_DCL_TEMPLETE.modifier
  is '�޸���';
comment on column WII_DOCTOR_DCL_TEMPLETE.modify_time
  is '�޸�ʱ��';
comment on column WII_DOCTOR_DCL_TEMPLETE.unique_id
  is '����Ψһid';

prompt
prompt Creating table WII_DOCTOR_SHIFT_ITEM_CONFIG
prompt ===========================================
prompt
create table WII_DOCTOR_SHIFT_ITEM_CONFIG
(
  category     VARCHAR2(50),
  item_name    VARCHAR2(50),
  subitem_name VARCHAR2(50),
  search_value VARCHAR2(4000),
  order_code   NUMBER
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_DOCTOR_SHIFT_ITEM_CONFIG.category
  is '������Ŀ����(�������ֵ����ϻ�ȡ���ݵķ��� ��:��������,ҩ��)';
comment on column WII_DOCTOR_SHIFT_ITEM_CONFIG.item_name
  is '��ʾ�ĸ���';
comment on column WII_DOCTOR_SHIFT_ITEM_CONFIG.subitem_name
  is '����ɸѡ����ʾ����  WII_PATIENT_LAB_RESULT��REPORT_ITEM_NAME';
comment on column WII_DOCTOR_SHIFT_ITEM_CONFIG.search_value
  is '����ɸѡ������ WII_PATIENT_LAB LAB_NAME�������� ��LabnameѪ����������,������Ѫ������ ���ŷָ� Ϊ���򲻸��ݴ�����ɸѡ';
comment on column WII_DOCTOR_SHIFT_ITEM_CONFIG.order_code
  is '������';

prompt
prompt Creating table WII_DOCUMENT_ITEM_CONFIG
prompt =======================================
prompt
create table WII_DOCUMENT_ITEM_CONFIG
(
  hospital_name VARCHAR2(100),
  document_name VARCHAR2(100),
  source_type   VARCHAR2(50),
  code          VARCHAR2(50),
  code_name     VARCHAR2(200)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_DOCUMENT_ITEM_CONFIG.hospital_name
  is 'ҽԺ����';
comment on column WII_DOCUMENT_ITEM_CONFIG.document_name
  is '��������';
comment on column WII_DOCUMENT_ITEM_CONFIG.source_type
  is 'sign,lab��';

prompt
prompt Creating table WII_DOCUMENT_METHOD_CONFIG
prompt =========================================
prompt
create table WII_DOCUMENT_METHOD_CONFIG
(
  document_method_id VARCHAR2(50) not null,
  datasourse_name    VARCHAR2(100),
  api_name           VARCHAR2(100),
  api_method_name    VARCHAR2(100),
  datasourse_enname  VARCHAR2(100),
  api_enname         VARCHAR2(100),
  method_param       VARCHAR2(500),
  api_method_enname  VARCHAR2(100),
  create_time        DATE default sysdate,
  creator            VARCHAR2(30),
  modify_by          VARCHAR2(30),
  modify_time        DATE
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table WII_DOCUMENT_METHOD_CONFIG
  is '����ӿڷ�������';
comment on column WII_DOCUMENT_METHOD_CONFIG.document_method_id
  is '������id';
comment on column WII_DOCUMENT_METHOD_CONFIG.datasourse_name
  is '����Դ������';
comment on column WII_DOCUMENT_METHOD_CONFIG.api_name
  is '�ӿ�������';
comment on column WII_DOCUMENT_METHOD_CONFIG.api_method_name
  is '�ӿڷ���������';
comment on column WII_DOCUMENT_METHOD_CONFIG.datasourse_enname
  is '����Դ';
comment on column WII_DOCUMENT_METHOD_CONFIG.api_enname
  is '�ӿ���';
comment on column WII_DOCUMENT_METHOD_CONFIG.method_param
  is '����';
comment on column WII_DOCUMENT_METHOD_CONFIG.api_method_enname
  is '�ӿڷ�����';
comment on column WII_DOCUMENT_METHOD_CONFIG.create_time
  is '����ʱ��';
comment on column WII_DOCUMENT_METHOD_CONFIG.creator
  is '������';
comment on column WII_DOCUMENT_METHOD_CONFIG.modify_by
  is '�޸���';
comment on column WII_DOCUMENT_METHOD_CONFIG.modify_time
  is '�޸�ʱ��';
alter table WII_DOCUMENT_METHOD_CONFIG
  add primary key (DOCUMENT_METHOD_ID)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WII_DOCUMENT_MRCOLS_CONFIG
prompt =========================================
prompt
create table WII_DOCUMENT_MRCOLS_CONFIG
(
  document_method_id VARCHAR2(50),
  column_enname      VARCHAR2(100),
  column_name        VARCHAR2(100),
  note               VARCHAR2(100),
  create_time        DATE default sysdate,
  creator            VARCHAR2(30),
  modifier           VARCHAR2(30),
  modify_time        DATE,
  id                 VARCHAR2(50) not null
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table WII_DOCUMENT_MRCOLS_CONFIG
  is '����ӿڷ�������';
comment on column WII_DOCUMENT_MRCOLS_CONFIG.document_method_id
  is '����id';
comment on column WII_DOCUMENT_MRCOLS_CONFIG.column_enname
  is '����Դ������';
comment on column WII_DOCUMENT_MRCOLS_CONFIG.column_name
  is '�ӿ�������';
comment on column WII_DOCUMENT_MRCOLS_CONFIG.note
  is '�ӿڷ���������';
comment on column WII_DOCUMENT_MRCOLS_CONFIG.create_time
  is '����ʱ��';
comment on column WII_DOCUMENT_MRCOLS_CONFIG.creator
  is '������';
comment on column WII_DOCUMENT_MRCOLS_CONFIG.modifier
  is '�޸���';
comment on column WII_DOCUMENT_MRCOLS_CONFIG.modify_time
  is '�޸�ʱ��';
alter table WII_DOCUMENT_MRCOLS_CONFIG
  add primary key (ID)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WII_DOCUMENT_SIGNATURE_RECORD
prompt ============================================
prompt
create table WII_DOCUMENT_SIGNATURE_RECORD
(
  doc_signature_id NVARCHAR2(40),
  patient_id       NVARCHAR2(40),
  signature_key    NVARCHAR2(40),
  start_time       DATE,
  end_time         DATE,
  signature        NVARCHAR2(100),
  signature_code   NVARCHAR2(100),
  login_user       NVARCHAR2(40),
  operate_time     DATE,
  record_status    NUMBER(1)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_DOCUMENT_SIGNATURE_RECORD
  is '����ǩ���޸ļ�¼';
comment on column WII_DOCUMENT_SIGNATURE_RECORD.doc_signature_id
  is 'ǩ��ID';
comment on column WII_DOCUMENT_SIGNATURE_RECORD.patient_id
  is '���߱���';
comment on column WII_DOCUMENT_SIGNATURE_RECORD.signature_key
  is 'ǩ�����ױ���';
comment on column WII_DOCUMENT_SIGNATURE_RECORD.start_time
  is 'ǩ�����ǿ�ʼʱ��';
comment on column WII_DOCUMENT_SIGNATURE_RECORD.end_time
  is 'ǩ�����ǽ���ʱ��';
comment on column WII_DOCUMENT_SIGNATURE_RECORD.signature
  is 'ǩ��';
comment on column WII_DOCUMENT_SIGNATURE_RECORD.signature_code
  is 'ǩ����Ӧ����';
comment on column WII_DOCUMENT_SIGNATURE_RECORD.login_user
  is 'ϵͳ��¼�˹���';
comment on column WII_DOCUMENT_SIGNATURE_RECORD.operate_time
  is '�޸�ǩ��ʱ��';
comment on column WII_DOCUMENT_SIGNATURE_RECORD.record_status
  is '��¼״̬ 0��Ч��1��Ч';

prompt
prompt Creating table WII_DOCUMENT_SIGN_RECORD
prompt =======================================
prompt
create table WII_DOCUMENT_SIGN_RECORD
(
  patient_id    VARCHAR2(50),
  document_code VARCHAR2(50),
  item_code     VARCHAR2(50),
  item_name     VARCHAR2(500),
  type          NUMBER(1),
  value         VARCHAR2(500),
  operator      VARCHAR2(50),
  gen_time      DATE,
  create_time   DATE,
  creator       VARCHAR2(30),
  modify_by     VARCHAR2(30),
  modify_date   DATE
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 384K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_DOCUMENT_SIGN_RECORD.document_code
  is '�ֶ�˵��
';
comment on column WII_DOCUMENT_SIGN_RECORD.item_code
  is '����code
';
comment on column WII_DOCUMENT_SIGN_RECORD.item_name
  is '��Ŀ����
';
comment on column WII_DOCUMENT_SIGN_RECORD.type
  is '���ͣ�0�ǹ̶���ʽ�ģ�1��������ӵ�';
comment on column WII_DOCUMENT_SIGN_RECORD.value
  is '����ֵ';
comment on column WII_DOCUMENT_SIGN_RECORD.operator
  is '������
';
comment on column WII_DOCUMENT_SIGN_RECORD.gen_time
  is '����ʱ��
';
comment on column WII_DOCUMENT_SIGN_RECORD.create_time
  is '����ʱ��
';
comment on column WII_DOCUMENT_SIGN_RECORD.creator
  is '������';
comment on column WII_DOCUMENT_SIGN_RECORD.modify_by
  is '�޸���';
comment on column WII_DOCUMENT_SIGN_RECORD.modify_date
  is '�޸�ʱ��
';

prompt
prompt Creating table WII_EMPLOYEE
prompt ===========================
prompt
create table WII_EMPLOYEE
(
  employee_id          VARCHAR2(20),
  employee_name        NVARCHAR2(50),
  dept_code            VARCHAR2(30),
  job_code             NVARCHAR2(50),
  telephone            VARCHAR2(20),
  wechat_no            VARCHAR2(20),
  qq                   VARCHAR2(20),
  title                NVARCHAR2(20),
  grade                NVARCHAR2(20),
  status               NUMBER(1),
  create_time          DATE default sysdate,
  creator              NVARCHAR2(20),
  photo                VARCHAR2(100),
  ward_code            VARCHAR2(20),
  sex                  VARCHAR2(2),
  entry_date           DATE,
  exp_date             DATE,
  modifier             NVARCHAR2(20),
  modify_time          DATE,
  unique_id            VARCHAR2(50) default sys_guid(),
  signature_pic        CLOB,
  education_background NVARCHAR2(20),
  intowardtime         DATE,
  memo                 NVARCHAR2(2000),
  source               NVARCHAR2(20),
  birthday             DATE,
  groupno              NVARCHAR2(20),
  isonscheduling       NUMBER(2)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 448K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_EMPLOYEE.employee_id
  is '���ţ�ÿ���û�����һ��Ψһ��ʶ��';
comment on column WII_EMPLOYEE.employee_name
  is '�û�����';
comment on column WII_EMPLOYEE.dept_code
  is '�û����ڿ��ҵĴ���';
comment on column WII_EMPLOYEE.job_code
  is '���磺ҽ������ʿ�ȵ�';
comment on column WII_EMPLOYEE.telephone
  is '�ֻ�';
comment on column WII_EMPLOYEE.wechat_no
  is '΢�ź�';
comment on column WII_EMPLOYEE.qq
  is 'QQ��';
comment on column WII_EMPLOYEE.title
  is 'ְ�ƣ��������Ρ������Ρ�סԺ�ܵ�����ְλ��';
comment on column WII_EMPLOYEE.grade
  is 'ְ�� ��������ڡ�����ҽ��������ҽ����סԺҽ���ȣ�';
comment on column WII_EMPLOYEE.status
  is '��ְ״̬';
comment on column WII_EMPLOYEE.create_time
  is '�������û�������';
comment on column WII_EMPLOYEE.photo
  is '��Ƭ���ƻ���·��';
comment on column WII_EMPLOYEE.ward_code
  is '�û����ڲ����Ĵ���';
comment on column WII_EMPLOYEE.sex
  is '�Ա�';
comment on column WII_EMPLOYEE.entry_date
  is '��ְʱ��';
comment on column WII_EMPLOYEE.exp_date
  is '��Ч��';
comment on column WII_EMPLOYEE.unique_id
  is '����ΨһID';
comment on column WII_EMPLOYEE.signature_pic
  is 'ǩ��ͼƬ';
comment on column WII_EMPLOYEE.education_background
  is 'ѧ��';
comment on column WII_EMPLOYEE.intowardtime
  is '���ʱ��';
comment on column WII_EMPLOYEE.memo
  is '��ע';
comment on column WII_EMPLOYEE.source
  is '��Դ';
comment on column WII_EMPLOYEE.birthday
  is '����';
comment on column WII_EMPLOYEE.groupno
  is '����';
comment on column WII_EMPLOYEE.isonscheduling
  is '�Ƿ�����Ű�';

prompt
prompt Creating table WII_EXAM_DIC
prompt ===========================
prompt
create table WII_EXAM_DIC
(
  item_code        VARCHAR2(20),
  item_name        VARCHAR2(50),
  item_category    VARCHAR2(50),
  item_subcategory VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_EXAM_DIC.item_code
  is '�����Ŀ����';
comment on column WII_EXAM_DIC.item_name
  is '�����Ŀ����';
comment on column WII_EXAM_DIC.item_category
  is '�����Ŀ���';
comment on column WII_EXAM_DIC.item_subcategory
  is '�����Ŀ�����';

prompt
prompt Creating table WII_EXAM_GROUP_DETAIL
prompt ====================================
prompt
create table WII_EXAM_GROUP_DETAIL
(
  exam_group_no NUMBER(6) not null,
  item_code     VARCHAR2(20) not null,
  operator      VARCHAR2(20),
  create_time   DATE,
  creator       VARCHAR2(30),
  modify_by     VARCHAR2(30),
  modify_date   DATE,
  unique_id     VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table WII_EXAM_GROUP_DETAIL
  is '��������������Ӧ��';
comment on column WII_EXAM_GROUP_DETAIL.exam_group_no
  is '������ID
';
comment on column WII_EXAM_GROUP_DETAIL.create_time
  is '����ʱ��
';
comment on column WII_EXAM_GROUP_DETAIL.creator
  is '������
';
comment on column WII_EXAM_GROUP_DETAIL.modify_by
  is '�޸���
';
comment on column WII_EXAM_GROUP_DETAIL.modify_date
  is '�޸�ʱ��
';

prompt
prompt Creating table WII_EXAM_GROUP_DIC
prompt =================================
prompt
create table WII_EXAM_GROUP_DIC
(
  exam_group_no   NUMBER(6) not null,
  exam_group_name VARCHAR2(30) not null,
  his_order_name  VARCHAR2(30),
  belong_type     VARCHAR2(30),
  create_time     DATE,
  creator         VARCHAR2(30),
  modify_by       VARCHAR2(30),
  modify_date     DATE,
  unique_id       VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table WII_EXAM_GROUP_DIC
  is '������������ֵ�';
comment on column WII_EXAM_GROUP_DIC.exam_group_no
  is '������ID
';
comment on column WII_EXAM_GROUP_DIC.exam_group_name
  is '����������
';
comment on column WII_EXAM_GROUP_DIC.his_order_name
  is 'HIS����
';
comment on column WII_EXAM_GROUP_DIC.belong_type
  is '���ڷ���
';
comment on column WII_EXAM_GROUP_DIC.create_time
  is '����ʱ��
';
comment on column WII_EXAM_GROUP_DIC.creator
  is '������
';
comment on column WII_EXAM_GROUP_DIC.modify_by
  is '�޸���
';
comment on column WII_EXAM_GROUP_DIC.modify_date
  is '�޸�ʱ��
';
alter table WII_EXAM_GROUP_DIC
  add constraint PK_EXAM_GROUP_NO primary key (EXAM_GROUP_NO)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WII_FEEDBACK
prompt ===========================
prompt
create table WII_FEEDBACK
(
  feedback_id   VARCHAR2(36) not null,
  user_id       VARCHAR2(20),
  feedback_type VARCHAR2(1),
  content       NVARCHAR2(2000),
  sub_time      DATE,
  creator       NVARCHAR2(20),
  create_time   DATE default sysdate,
  modifier      NVARCHAR2(20),
  modify_time   DATE,
  unique_id     VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_FEEDBACK.feedback_id
  is '������ϢID';
comment on column WII_FEEDBACK.user_id
  is '�����ύ��ID';
comment on column WII_FEEDBACK.feedback_type
  is '������Ϣ����';
comment on column WII_FEEDBACK.content
  is '������Ϣ����';
comment on column WII_FEEDBACK.sub_time
  is '�ύʱ��';
comment on column WII_FEEDBACK.unique_id
  is '����ΨһID';
alter table WII_FEEDBACK
  add constraint WII_FEEDBACK_PK primary key (FEEDBACK_ID)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WII_FLOWSHEET_MODULE
prompt ===================================
prompt
create table WII_FLOWSHEET_MODULE
(
  module_id          VARCHAR2(40),
  module_name        NVARCHAR2(100),
  module_items       NVARCHAR2(2000),
  module_memo        NVARCHAR2(1000),
  creator            NVARCHAR2(20),
  create_time        DATE default sysdate,
  modifier           NVARCHAR2(20),
  modify_time        DATE,
  module_fixed_items NVARCHAR2(2000),
  unique_id          VARCHAR2(50) default sys_guid(),
  special_code       VARCHAR2(40),
  module_items_group NVARCHAR2(2000)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_FLOWSHEET_MODULE.module_id
  is 'ģ��ID';
comment on column WII_FLOWSHEET_MODULE.module_name
  is 'ģ������';
comment on column WII_FLOWSHEET_MODULE.module_items
  is 'JSON���ó���ģ���µ�������Ŀ';
comment on column WII_FLOWSHEET_MODULE.module_memo
  is 'ģ��˵��';
comment on column WII_FLOWSHEET_MODULE.creator
  is '������';
comment on column WII_FLOWSHEET_MODULE.create_time
  is '����ʱ��';
comment on column WII_FLOWSHEET_MODULE.modifier
  is '�޸���';
comment on column WII_FLOWSHEET_MODULE.modify_time
  is '�޸�ʱ��';
comment on column WII_FLOWSHEET_MODULE.module_fixed_items
  is 'ģ���¹̶���Ŀ';
comment on column WII_FLOWSHEET_MODULE.unique_id
  is '����ΨһID';
comment on column WII_FLOWSHEET_MODULE.special_code
  is 'ר��code';
comment on column WII_FLOWSHEET_MODULE.module_items_group
  is 'ģ��ĳ�������';

prompt
prompt Creating table WII_FLOWSHEET_TEMPLATE
prompt =====================================
prompt
create table WII_FLOWSHEET_TEMPLATE
(
  templet_id    VARCHAR2(40),
  templet_name  NVARCHAR2(100),
  templet_type  VARCHAR2(1),
  templet_class VARCHAR2(1),
  templet_memo  NVARCHAR2(1000),
  creator       NVARCHAR2(20),
  create_time   DATE default sysdate,
  modifier      NVARCHAR2(20),
  modify_time   DATE,
  unique_id     VARCHAR2(50) default sys_guid(),
  operate_time  DATE,
  special_code  VARCHAR2(30)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_FLOWSHEET_TEMPLATE.templet_id
  is 'ģ��ID';
comment on column WII_FLOWSHEET_TEMPLATE.templet_name
  is 'ģ������';
comment on column WII_FLOWSHEET_TEMPLATE.templet_type
  is 'ģ�����0����ƣ�1�����Ｑ�ȣ�2������...��';
comment on column WII_FLOWSHEET_TEMPLATE.templet_class
  is 'ģ�弶��0��ͨ�ã�9�����ˣ�';
comment on column WII_FLOWSHEET_TEMPLATE.templet_memo
  is 'ģ��˵��';
comment on column WII_FLOWSHEET_TEMPLATE.creator
  is '������';
comment on column WII_FLOWSHEET_TEMPLATE.create_time
  is '����ʱ��';
comment on column WII_FLOWSHEET_TEMPLATE.modifier
  is '�޸���';
comment on column WII_FLOWSHEET_TEMPLATE.modify_time
  is '�޸�ʱ��';
comment on column WII_FLOWSHEET_TEMPLATE.unique_id
  is '����ΨһID';
comment on column WII_FLOWSHEET_TEMPLATE.operate_time
  is '����ʱ��';
comment on column WII_FLOWSHEET_TEMPLATE.special_code
  is 'ר��Code';

prompt
prompt Creating table WII_FLOWSHEET_TPCONTENT
prompt ======================================
prompt
create table WII_FLOWSHEET_TPCONTENT
(
  templet_id  VARCHAR2(40),
  module_id   VARCHAR2(40),
  sort_no     NUMBER(2),
  memo        NVARCHAR2(1000),
  creator     NVARCHAR2(20),
  create_time DATE default sysdate,
  modifier    NVARCHAR2(20),
  modify_time DATE,
  unique_id   VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_FLOWSHEET_TPCONTENT.templet_id
  is 'ģ��ID';
comment on column WII_FLOWSHEET_TPCONTENT.module_id
  is 'ģ��ID';
comment on column WII_FLOWSHEET_TPCONTENT.sort_no
  is '����';
comment on column WII_FLOWSHEET_TPCONTENT.memo
  is '˵��';
comment on column WII_FLOWSHEET_TPCONTENT.creator
  is '������';
comment on column WII_FLOWSHEET_TPCONTENT.create_time
  is '����ʱ��';
comment on column WII_FLOWSHEET_TPCONTENT.modifier
  is '�޸���';
comment on column WII_FLOWSHEET_TPCONTENT.modify_time
  is '�޸�ʱ��';
comment on column WII_FLOWSHEET_TPCONTENT.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_GENERAL_DIC
prompt ==============================
prompt
create table WII_GENERAL_DIC
(
  type              VARCHAR2(40),
  code              VARCHAR2(40),
  name              NVARCHAR2(40),
  input_code        VARCHAR2(20),
  memo              NVARCHAR2(50),
  parent_code       VARCHAR2(30),
  view_name         VARCHAR2(20),
  view_code         VARCHAR2(20),
  sort_no           NUMBER,
  is_default_option NUMBER(1)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_GENERAL_DIC.type
  is '�ֵ�����';
comment on column WII_GENERAL_DIC.code
  is '�ֵ����';
comment on column WII_GENERAL_DIC.name
  is '�ֵ�����';
comment on column WII_GENERAL_DIC.input_code
  is '��������ĸ';
comment on column WII_GENERAL_DIC.memo
  is '��ע';
comment on column WII_GENERAL_DIC.parent_code
  is '�������';
comment on column WII_GENERAL_DIC.view_name
  is '��ʾ����';
comment on column WII_GENERAL_DIC.view_code
  is '��ʾ���';
comment on column WII_GENERAL_DIC.sort_no
  is 'ͨ���ֵ�Ĭ������';
comment on column WII_GENERAL_DIC.is_default_option
  is '0-��Ĭ��ֵ,1-��Ĭ��ֵ';

prompt
prompt Creating table WII_GENERAL_MAPPING_DIC
prompt ======================================
prompt
create table WII_GENERAL_MAPPING_DIC
(
  type       VARCHAR2(50),
  code       VARCHAR2(50),
  his_code   VARCHAR2(50),
  his_name   VARCHAR2(50),
  input_code VARCHAR2(50),
  memo       VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_GENERAL_MAPPING_DIC.type
  is 'CIS���ͱ���';
comment on column WII_GENERAL_MAPPING_DIC.code
  is 'CIS����';
comment on column WII_GENERAL_MAPPING_DIC.his_code
  is 'HIS����';
comment on column WII_GENERAL_MAPPING_DIC.his_name
  is 'HIS����';
comment on column WII_GENERAL_MAPPING_DIC.input_code
  is '������';
comment on column WII_GENERAL_MAPPING_DIC.memo
  is '��ע';

prompt
prompt Creating table WII_GLU_FLUID_DIC
prompt ================================
prompt
create table WII_GLU_FLUID_DIC
(
  pharmacy_code     VARCHAR2(20) not null,
  pharmacy_chemname NVARCHAR2(50),
  glu_concentration NUMBER(6,2),
  med_route_ciscode VARCHAR2(20),
  dose_units        VARCHAR2(20),
  input_code        VARCHAR2(50),
  memo              NVARCHAR2(50),
  valid             NUMBER(1)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_GLU_FLUID_DIC
  is '����Һ���ֵ�';
comment on column WII_GLU_FLUID_DIC.pharmacy_code
  is 'HISҩƷ���Ʊ���';
comment on column WII_GLU_FLUID_DIC.pharmacy_chemname
  is 'HISҩƷ���� - ��ѧ����';
comment on column WII_GLU_FLUID_DIC.glu_concentration
  is '����Ũ��';
comment on column WII_GLU_FLUID_DIC.med_route_ciscode
  is '��ҩ;��';
comment on column WII_GLU_FLUID_DIC.dose_units
  is '������λ��ml��';
comment on column WII_GLU_FLUID_DIC.input_code
  is '��������ĸ(������룩';
comment on column WII_GLU_FLUID_DIC.memo
  is '��ע';
alter table WII_GLU_FLUID_DIC
  add constraint PK_PHARMACY_CODE primary key (PHARMACY_CODE)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WII_HIS_LINK_PATH
prompt ================================
prompt
create table WII_HIS_LINK_PATH
(
  his_link_id NUMBER(6) not null,
  show_name   VARCHAR2(50),
  link_type   NUMBER(1),
  link_url    VARCHAR2(200),
  parameters  VARCHAR2(200),
  create_time DATE default sysdate,
  creator     NVARCHAR2(20),
  modifier    NVARCHAR2(20),
  modify_time DATE,
  unique_id   VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table WII_HIS_LINK_PATH
  is '����HIS����·����';
comment on column WII_HIS_LINK_PATH.his_link_id
  is '������ID
';
comment on column WII_HIS_LINK_PATH.show_name
  is '��ʾ����
';
comment on column WII_HIS_LINK_PATH.link_type
  is '��������
';
comment on column WII_HIS_LINK_PATH.link_url
  is '����URL
';
comment on column WII_HIS_LINK_PATH.parameters
  is '������
';
comment on column WII_HIS_LINK_PATH.create_time
  is '����ʱ��
';
comment on column WII_HIS_LINK_PATH.creator
  is '������
';
comment on column WII_HIS_LINK_PATH.modifier
  is '�޸���
';
comment on column WII_HIS_LINK_PATH.modify_time
  is '�޸�ʱ��
';
comment on column WII_HIS_LINK_PATH.unique_id
  is '����ΨһID';
alter table WII_HIS_LINK_PATH
  add constraint PK_HIS_LINK_ID primary key (HIS_LINK_ID)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WII_HUMAN_ADJUSTMENT_RECORD
prompt ==========================================
prompt
create table WII_HUMAN_ADJUSTMENT_RECORD
(
  human_adjust_no NUMBER(11),
  user_id         VARCHAR2(20),
  before_date     DATE,
  before_content  NVARCHAR2(100),
  after_date      DATE,
  after_content   NVARCHAR2(100),
  adjust_type     NUMBER(6),
  alternates      NVARCHAR2(30),
  reason          NVARCHAR2(500),
  is_approve      NUMBER(6),
  approve_note    NVARCHAR2(500),
  approver        NVARCHAR2(20),
  approve_time    DATE,
  create_time     DATE default sysdate,
  creator         NVARCHAR2(20),
  modifier        NVARCHAR2(20),
  modify_time     DATE,
  unique_id       VARCHAR2(50) default sys_guid(),
  data_flag       NUMBER(1),
  before_date_end DATE
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_HUMAN_ADJUSTMENT_RECORD.human_adjust_no
  is '������ID';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.user_id
  is '�û�ID';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.before_date
  is '����ǰ����';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.before_content
  is '����ǰ����';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.after_date
  is '����������';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.after_content
  is '����������';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.adjust_type
  is '��������(1�����ݣ�2���㼶�仯��3�����ҹ����仯���ɲ���ͨ���ֵ��)';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.alternates
  is '�油��Ա';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.reason
  is '���뷢��ԭ��';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.is_approve
  is '�Ƿ�ͨ��(0��δ����1��ͨ����2���ܾ�)';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.approve_note
  is '��˱�ע';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.approver
  is '�����';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.approve_time
  is '���ʱ��';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.create_time
  is '����ʱ��';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.creator
  is '������';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.modifier
  is '�޸���';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.modify_time
  is '�޸�ʱ��';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.unique_id
  is '����ΨһID';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.data_flag
  is '��Ч�ԣ�0-��Ч��1��Ч';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.before_date_end
  is '����ǰ���ڣ���Χֵ��';

prompt
prompt Creating table WII_ICU_CONFIG
prompt =============================
prompt
create table WII_ICU_CONFIG
(
  ward_code      VARCHAR2(20),
  config_content VARCHAR2(4000),
  creator        NVARCHAR2(20),
  create_time    DATE default sysdate,
  modifier       NVARCHAR2(20),
  modify_time    DATE,
  unique_id      VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_ICU_CONFIG.ward_code
  is '��������';
comment on column WII_ICU_CONFIG.config_content
  is '������ϸ��json��';
comment on column WII_ICU_CONFIG.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_ICU_DISGNOSE_DIC
prompt ===================================
prompt
create table WII_ICU_DISGNOSE_DIC
(
  icu_disgnose_code   VARCHAR2(50),
  icu_disgnose_name   NVARCHAR2(100),
  icd_code            VARCHAR2(30),
  icd_name            VARCHAR2(100),
  diagnosis_type_code VARCHAR2(30),
  icu_disgnose_system NVARCHAR2(30),
  input_code          VARCHAR2(30),
  memo                NVARCHAR2(50),
  valid               VARCHAR2(10),
  research_valid      VARCHAR2(10)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 3M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_ICU_DISGNOSE_DIC.icu_disgnose_code
  is 'ICU��ϱ���';
comment on column WII_ICU_DISGNOSE_DIC.icu_disgnose_name
  is 'ICU�������';
comment on column WII_ICU_DISGNOSE_DIC.icd_code
  is 'ICD����';
comment on column WII_ICU_DISGNOSE_DIC.icd_name
  is 'ICD����';
comment on column WII_ICU_DISGNOSE_DIC.diagnosis_type_code
  is 'ICU��������루�е������ֵ䣩';
comment on column WII_ICU_DISGNOSE_DIC.icu_disgnose_system
  is 'ICU����漰����ϵͳ';
comment on column WII_ICU_DISGNOSE_DIC.input_code
  is '��������ĸ(������룩';
comment on column WII_ICU_DISGNOSE_DIC.memo
  is '��ע';
comment on column WII_ICU_DISGNOSE_DIC.valid
  is '��Ч�ԣ�0-��Ч��1-��Ч��';

prompt
prompt Creating table WII_ICU_DOCTOR_SHIFT
prompt ===================================
prompt
create table WII_ICU_DOCTOR_SHIFT
(
  patient_id        VARCHAR2(20),
  shift_date        DATE,
  shift_operator    NVARCHAR2(20),
  shift_time        DATE,
  duty_operator     NVARCHAR2(20),
  duty_time         DATE,
  rescue_time       DATE,
  shift_status      VARCHAR2(1),
  shift_content     NVARCHAR2(2000),
  shift_memo        NVARCHAR2(2000),
  duty_memo         NVARCHAR2(2000),
  rescue_memo       NVARCHAR2(2000),
  creator           NVARCHAR2(20),
  create_time       DATE default sysdate,
  modifier          NVARCHAR2(20),
  modify_time       DATE,
  rescue_operator   NVARCHAR2(20),
  shift_no          VARCHAR2(20),
  inpatient_visitid VARCHAR2(50),
  inward_visitid    VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_ICU_DOCTOR_SHIFT.patient_id
  is '����ID';
comment on column WII_ICU_DOCTOR_SHIFT.shift_date
  is '��������';
comment on column WII_ICU_DOCTOR_SHIFT.shift_operator
  is '������';
comment on column WII_ICU_DOCTOR_SHIFT.shift_time
  is '����ʱ��';
comment on column WII_ICU_DOCTOR_SHIFT.duty_operator
  is '�Ӱ���';
comment on column WII_ICU_DOCTOR_SHIFT.duty_time
  is '�Ӱ�ʱ��';
comment on column WII_ICU_DOCTOR_SHIFT.rescue_time
  is '����ʱ��';
comment on column WII_ICU_DOCTOR_SHIFT.shift_status
  is '����״̬(0��δ���� 1���ѽ��� 2���Ӱ��� 3���ѽӰ�)';
comment on column WII_ICU_DOCTOR_SHIFT.shift_content
  is '���Ӱ�����';
comment on column WII_ICU_DOCTOR_SHIFT.shift_memo
  is '���౸ע';
comment on column WII_ICU_DOCTOR_SHIFT.duty_memo
  is '�Ӱ౸ע';
comment on column WII_ICU_DOCTOR_SHIFT.rescue_memo
  is '���ȱ�ע';
comment on column WII_ICU_DOCTOR_SHIFT.creator
  is '������';
comment on column WII_ICU_DOCTOR_SHIFT.create_time
  is '����ʱ��';
comment on column WII_ICU_DOCTOR_SHIFT.modifier
  is '�޸���';
comment on column WII_ICU_DOCTOR_SHIFT.modify_time
  is '�޸�ʱ��';
comment on column WII_ICU_DOCTOR_SHIFT.rescue_operator
  is '����ǩ��';
comment on column WII_ICU_DOCTOR_SHIFT.shift_no
  is '��α��';
comment on column WII_ICU_DOCTOR_SHIFT.inpatient_visitid
  is 'סԺ���';
comment on column WII_ICU_DOCTOR_SHIFT.inward_visitid
  is '�벡�����';

prompt
prompt Creating table WII_ICU_DOCTOR_SHIFT_OPERATION
prompt =============================================
prompt
create table WII_ICU_DOCTOR_SHIFT_OPERATION
(
  id             VARCHAR2(50),
  patient_id     VARCHAR2(20),
  shift_date     DATE,
  shift_operator NVARCHAR2(200),
  shift_status   VARCHAR2(1),
  schedule_no    VARCHAR2(20),
  bed_doctor     NVARCHAR2(200),
  charge_doctor  NVARCHAR2(200),
  creator        NVARCHAR2(20),
  create_time    DATE default sysdate,
  modifier       NVARCHAR2(20),
  modify_time    DATE,
  dignose        NVARCHAR2(2000),
  bed_no         VARCHAR2(20),
  ward_code      VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_ICU_DOCTOR_SHIFT_OPERATION
  is 'ҽ��վ���Ӱ������';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.id
  is 'Ψһ���';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.patient_id
  is '����ID';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.shift_date
  is '��������';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.shift_operator
  is '������(���ŷָ�)';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.shift_status
  is '����״̬(0��δ���� 1���ѽ��� )';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.schedule_no
  is '��α��';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.bed_doctor
  is '�ܴ�ҽ��';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.charge_doctor
  is '����ҽ��';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.creator
  is '������';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.create_time
  is '����ʱ��';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.modifier
  is '�޸���';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.modify_time
  is '�޸�ʱ��';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.dignose
  is '���';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.bed_no
  is '����NO';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.ward_code
  is '������';

prompt
prompt Creating table WII_ICU_PATIENT_SHIFT
prompt ====================================
prompt
create table WII_ICU_PATIENT_SHIFT
(
  patient_id                     VARCHAR2(20) not null,
  shift_date                     DATE not null,
  shift_schedule_id              VARCHAR2(20) not null,
  shift_operator                 NVARCHAR2(20),
  shift_time                     DATE,
  duty_operator                  NVARCHAR2(20),
  duty_time                      DATE,
  shift_status                   VARCHAR2(1),
  environment                    NVARCHAR2(2000),
  basic_info                     NVARCHAR2(2000),
  basic_info_memo                NVARCHAR2(2000),
  vital_signs                    VARCHAR2(4000),
  vital_signs_memo               NVARCHAR2(2000),
  important_condition            NVARCHAR2(2000),
  important_condition_memo       NVARCHAR2(2000),
  main_treatment                 VARCHAR2(2000),
  main_treatment_memo            NVARCHAR2(2000),
  nursing_points                 VARCHAR2(2000),
  nursing_points_memo            NVARCHAR2(2000),
  lab_exam_info                  VARCHAR2(2000),
  lab_exam_info_memo             NVARCHAR2(2000),
  special_medical                VARCHAR2(2000),
  special_medical_memo           NVARCHAR2(2000),
  memo                           NVARCHAR2(2000),
  creator                        NVARCHAR2(20),
  create_time                    DATE default sysdate,
  duty_schedule_id               VARCHAR2(20),
  environment_memo               NVARCHAR2(2000),
  special_monitoring             VARCHAR2(2000),
  special_monitoring_memo        NVARCHAR2(2000),
  catheter_info                  VARCHAR2(2000),
  catheter_info_memo             NVARCHAR2(2000),
  modifier                       NVARCHAR2(20),
  modify_time                    DATE,
  unique_id                      VARCHAR2(50) default sys_guid(),
  environment_succe_memo         NVARCHAR2(2000),
  lab_exam_info_succe_memo       NVARCHAR2(2000),
  main_treatment_succe_memo      NVARCHAR2(2000),
  special_medical_succe_memo     NVARCHAR2(2000),
  nursing_points_succe_memo      NVARCHAR2(2000),
  important_condition_succe_memo NVARCHAR2(2000),
  catheter_info_succe_memo       NVARCHAR2(2000),
  special_monitoring_succe_memo  NVARCHAR2(2000),
  vital_signs_succe_memo         NVARCHAR2(2000),
  teacher                        VARCHAR2(300),
  shift_times                    NUMBER(6) not null,
  start_order                    VARCHAR2(2000),
  start_order_memo               NVARCHAR2(2000),
  stop_order                     VARCHAR2(2000),
  stop_order_memo                NVARCHAR2(2000),
  treatment_plan                 VARCHAR2(2000),
  treatment_plan_memo            NVARCHAR2(2000)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_ICU_PATIENT_SHIFT.patient_id
  is '����ID';
comment on column WII_ICU_PATIENT_SHIFT.shift_date
  is '��������';
comment on column WII_ICU_PATIENT_SHIFT.shift_schedule_id
  is '�����α��';
comment on column WII_ICU_PATIENT_SHIFT.shift_operator
  is '������';
comment on column WII_ICU_PATIENT_SHIFT.shift_time
  is '����ʱ��';
comment on column WII_ICU_PATIENT_SHIFT.duty_operator
  is '�Ӱ���';
comment on column WII_ICU_PATIENT_SHIFT.duty_time
  is '�Ӱ�ʱ��';
comment on column WII_ICU_PATIENT_SHIFT.shift_status
  is '����״̬(0��δ���� 1���ѽ��� 2���Ӱ��� 3���ѽӰ�)';
comment on column WII_ICU_PATIENT_SHIFT.environment
  is '��������';
comment on column WII_ICU_PATIENT_SHIFT.basic_info
  is '������Ϣ����';
comment on column WII_ICU_PATIENT_SHIFT.basic_info_memo
  is '������Ϣ���ӱ�ע';
comment on column WII_ICU_PATIENT_SHIFT.vital_signs
  is '��������';
comment on column WII_ICU_PATIENT_SHIFT.vital_signs_memo
  is '���������Ӱ౸ע';
comment on column WII_ICU_PATIENT_SHIFT.important_condition
  is '�ص㲡��';
comment on column WII_ICU_PATIENT_SHIFT.important_condition_memo
  is '�ص㲡��Ӱ౸ע';
comment on column WII_ICU_PATIENT_SHIFT.main_treatment
  is '��Ҫ����/�����¼�';
comment on column WII_ICU_PATIENT_SHIFT.main_treatment_memo
  is '��Ҫ����/�����¼��Ӱ౸ע';
comment on column WII_ICU_PATIENT_SHIFT.nursing_points
  is '����Ҫ��';
comment on column WII_ICU_PATIENT_SHIFT.nursing_points_memo
  is '����Ҫ��Ӱ౸ע';
comment on column WII_ICU_PATIENT_SHIFT.lab_exam_info
  is '�����鼰�쳣ָ��';
comment on column WII_ICU_PATIENT_SHIFT.lab_exam_info_memo
  is '�����鼰�쳣ָ��Ӱ౸ע';
comment on column WII_ICU_PATIENT_SHIFT.special_medical
  is '������ҩ';
comment on column WII_ICU_PATIENT_SHIFT.special_medical_memo
  is '������ҩ�Ӱ౸ע';
comment on column WII_ICU_PATIENT_SHIFT.memo
  is '��ע';
comment on column WII_ICU_PATIENT_SHIFT.creator
  is '������';
comment on column WII_ICU_PATIENT_SHIFT.create_time
  is '����ʱ��';
comment on column WII_ICU_PATIENT_SHIFT.duty_schedule_id
  is '�Ӱ��α��';
comment on column WII_ICU_PATIENT_SHIFT.environment_memo
  is '�������ӽ��౸ע���ṹ�����ݣ�';
comment on column WII_ICU_PATIENT_SHIFT.special_monitoring
  is '������';
comment on column WII_ICU_PATIENT_SHIFT.special_monitoring_memo
  is '�����ⱸע';
comment on column WII_ICU_PATIENT_SHIFT.catheter_info
  is '�������';
comment on column WII_ICU_PATIENT_SHIFT.catheter_info_memo
  is '���������ע';
comment on column WII_ICU_PATIENT_SHIFT.unique_id
  is '����ΨһID';
comment on column WII_ICU_PATIENT_SHIFT.environment_succe_memo
  is '�������ӽӰ౸ע���ṹ�����ݣ�';
comment on column WII_ICU_PATIENT_SHIFT.lab_exam_info_succe_memo
  is '�����鼰�쳣ָ�꽻�౸ע';
comment on column WII_ICU_PATIENT_SHIFT.main_treatment_succe_memo
  is '��Ҫ����/�����¼��Ӱ౸ע';
comment on column WII_ICU_PATIENT_SHIFT.special_medical_succe_memo
  is '������ҩ�Ӱ౸ע';
comment on column WII_ICU_PATIENT_SHIFT.nursing_points_succe_memo
  is '����Ҫ��Ӱ౸ע';
comment on column WII_ICU_PATIENT_SHIFT.important_condition_succe_memo
  is '�ص㲡��Ӱ౸ע';
comment on column WII_ICU_PATIENT_SHIFT.catheter_info_succe_memo
  is '��������Ӱ౸ע';
comment on column WII_ICU_PATIENT_SHIFT.special_monitoring_succe_memo
  is '������Ӱ౸ע';
comment on column WII_ICU_PATIENT_SHIFT.vital_signs_succe_memo
  is '���������Ӱ౸ע';
comment on column WII_ICU_PATIENT_SHIFT.teacher
  is '������ʦ';
comment on column WII_ICU_PATIENT_SHIFT.shift_times
  is '����ڽ������';
comment on column WII_ICU_PATIENT_SHIFT.start_order
  is '��ʼҽ��';
comment on column WII_ICU_PATIENT_SHIFT.start_order_memo
  is '��ʼҽ����ע';
comment on column WII_ICU_PATIENT_SHIFT.stop_order
  is 'ֹͣҽ��';
comment on column WII_ICU_PATIENT_SHIFT.stop_order_memo
  is 'ֹͣҽ����ע';
comment on column WII_ICU_PATIENT_SHIFT.treatment_plan
  is '���Ƽƻ�';
comment on column WII_ICU_PATIENT_SHIFT.treatment_plan_memo
  is '���Ƽƻ���ע';
alter table WII_ICU_PATIENT_SHIFT
  add primary key (PATIENT_ID, SHIFT_DATE, SHIFT_SCHEDULE_ID, SHIFT_TIMES)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WII_INFECTION_STATISTICS
prompt =======================================
prompt
create table WII_INFECTION_STATISTICS
(
  patient_id         VARCHAR2(20),
  infection_date     DATE,
  infection_part     NVARCHAR2(100),
  infection_diagnose NVARCHAR2(100),
  nosophyte_check    NUMBER(1),
  nosophyte_name     NVARCHAR2(100),
  create_time        DATE default sysdate,
  creator            NVARCHAR2(20),
  modifier           NVARCHAR2(20),
  modify_time        DATE,
  update_date        DATE,
  assess_id          NUMBER(6),
  unique_id          VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_INFECTION_STATISTICS.patient_id
  is '����id
';
comment on column WII_INFECTION_STATISTICS.infection_date
  is '��Ⱦ����
';
comment on column WII_INFECTION_STATISTICS.infection_part
  is '��Ⱦ��λ
';
comment on column WII_INFECTION_STATISTICS.infection_diagnose
  is '��Ⱦ���
';
comment on column WII_INFECTION_STATISTICS.nosophyte_check
  is '��ԭ�����
';
comment on column WII_INFECTION_STATISTICS.nosophyte_name
  is '��ԭ������
';
comment on column WII_INFECTION_STATISTICS.create_time
  is '����ʱ��
';
comment on column WII_INFECTION_STATISTICS.creator
  is '������
';
comment on column WII_INFECTION_STATISTICS.modifier
  is '�޸���
';
comment on column WII_INFECTION_STATISTICS.modify_time
  is '�޸�ʱ��
';
comment on column WII_INFECTION_STATISTICS.update_date
  is '�ϱ�����';
comment on column WII_INFECTION_STATISTICS.assess_id
  is '����ID
';
comment on column WII_INFECTION_STATISTICS.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_INFECT_PART_DIC
prompt ==================================
prompt
create table WII_INFECT_PART_DIC
(
  infect_part_code   VARCHAR2(30) not null,
  infect_part_name_c NVARCHAR2(30),
  input_code         VARCHAR2(20),
  memo               NVARCHAR2(50),
  valid              NUMBER(1)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_INFECT_PART_DIC
  is '��Ⱦ��λ�ֵ��';
comment on column WII_INFECT_PART_DIC.infect_part_code
  is '��Ⱦ��λCode';
comment on column WII_INFECT_PART_DIC.infect_part_name_c
  is '��Ⱦ��λ����';
comment on column WII_INFECT_PART_DIC.input_code
  is '�洢
��������ĸ(������룩';
comment on column WII_INFECT_PART_DIC.memo
  is '��ע���ص�������';
comment on column WII_INFECT_PART_DIC.valid
  is '��Ч�ԣ�0-��Ч��1-��Ч��';
alter table WII_INFECT_PART_DIC
  add constraint PK_INFECT_PART_CODE primary key (INFECT_PART_CODE)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WII_INFUSION_CIRCUIT
prompt ===================================
prompt
create table WII_INFUSION_CIRCUIT
(
  circuit_id      NUMBER(11) not null,
  patient_id      VARCHAR2(20) not null,
  order_no        VARCHAR2(20),
  order_sub_no    VARCHAR2(20),
  default_time    DATE,
  circuit_time    DATE not null,
  status          NUMBER(2),
  drugnames       VARCHAR2(100),
  speed           NUMBER(14,2),
  speed_unit      VARCHAR2(10),
  puncture_place  VARCHAR2(10),
  untoward_effect VARCHAR2(200),
  memo            VARCHAR2(200),
  circuitor       VARCHAR2(20),
  create_time     DATE not null,
  creator         VARCHAR2(20),
  modify_time     DATE not null,
  modifier        VARCHAR2(20),
  unique_id       VARCHAR2(50) default sys_guid() not null
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_INFUSION_CIRCUIT.circuit_id
  is '����Id';
comment on column WII_INFUSION_CIRCUIT.patient_id
  is '����Id  ';
comment on column WII_INFUSION_CIRCUIT.order_no
  is 'ҽ�����  ';
comment on column WII_INFUSION_CIRCUIT.order_sub_no
  is 'ҽ���ӱ��  ';
comment on column WII_INFUSION_CIRCUIT.default_time
  is 'Ĭ��ִ��ʱ��  ';
comment on column WII_INFUSION_CIRCUIT.circuit_time
  is 'Ѳ��ʱ��  ';
comment on column WII_INFUSION_CIRCUIT.status
  is '״̬   0��Һ�У�1��ͣ��2 ���  ';
comment on column WII_INFUSION_CIRCUIT.drugnames
  is 'ҩƷ����  ';
comment on column WII_INFUSION_CIRCUIT.speed
  is '����  ';
comment on column WII_INFUSION_CIRCUIT.speed_unit
  is '���ٵ�λ';
comment on column WII_INFUSION_CIRCUIT.puncture_place
  is '���̲�λ';
comment on column WII_INFUSION_CIRCUIT.untoward_effect
  is '������Ӧ ��wii_general_dic��Circuit_Type����  ';
comment on column WII_INFUSION_CIRCUIT.memo
  is '��ע';
comment on column WII_INFUSION_CIRCUIT.circuitor
  is 'Ѳ����';
comment on column WII_INFUSION_CIRCUIT.create_time
  is '����ʱ��';
comment on column WII_INFUSION_CIRCUIT.creator
  is '������';
comment on column WII_INFUSION_CIRCUIT.modify_time
  is '�޸�ʱ��';
comment on column WII_INFUSION_CIRCUIT.modifier
  is '�޸���';
comment on column WII_INFUSION_CIRCUIT.unique_id
  is '����ΨһId';

prompt
prompt Creating table WII_KMS_CATEGORY
prompt ===============================
prompt
create table WII_KMS_CATEGORY
(
  category_id    VARCHAR2(40),
  category_name  NVARCHAR2(40),
  create_time    DATE default sysdate,
  creator        VARCHAR2(40),
  modify_time    DATE,
  modifier       VARCHAR2(40),
  category_roles NVARCHAR2(200),
  unique_id      VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_KMS_CATEGORY
  is '֪ʶ����';
comment on column WII_KMS_CATEGORY.category_id
  is '�����';
comment on column WII_KMS_CATEGORY.category_name
  is '�������';
comment on column WII_KMS_CATEGORY.create_time
  is '����ʱ��';
comment on column WII_KMS_CATEGORY.creator
  is '������';
comment on column WII_KMS_CATEGORY.modify_time
  is '�޸�ʱ��';
comment on column WII_KMS_CATEGORY.modifier
  is '�޸���';
comment on column WII_KMS_CATEGORY.category_roles
  is '��Щ��ɫ��ע������';
comment on column WII_KMS_CATEGORY.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_KMS_CATEGORY_ITEM
prompt ====================================
prompt
create table WII_KMS_CATEGORY_ITEM
(
  category_item_id        VARCHAR2(40),
  category_id             VARCHAR2(40),
  category_item_name      NVARCHAR2(100),
  category_item_parent_id VARCHAR2(40),
  create_time             DATE default sysdate,
  creator                 VARCHAR2(40),
  modify_time             DATE,
  modifier                VARCHAR2(40),
  unique_id               VARCHAR2(50) default sys_guid(),
  category_item_code      NVARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_KMS_CATEGORY_ITEM
  is '֪ʶ�����Ŀ��';
comment on column WII_KMS_CATEGORY_ITEM.category_item_id
  is '�����Ŀ���';
comment on column WII_KMS_CATEGORY_ITEM.category_id
  is '���������';
comment on column WII_KMS_CATEGORY_ITEM.category_item_name
  is '�����Ŀ����';
comment on column WII_KMS_CATEGORY_ITEM.category_item_parent_id
  is '�������Ŀ���';
comment on column WII_KMS_CATEGORY_ITEM.create_time
  is '����ʱ��';
comment on column WII_KMS_CATEGORY_ITEM.creator
  is '������';
comment on column WII_KMS_CATEGORY_ITEM.modify_time
  is '�޸�ʱ��';
comment on column WII_KMS_CATEGORY_ITEM.modifier
  is '�޸���';
comment on column WII_KMS_CATEGORY_ITEM.unique_id
  is '����ΨһID';
comment on column WII_KMS_CATEGORY_ITEM.category_item_code
  is '�˵�����';

prompt
prompt Creating table WII_KMS_KNOWLEDGE_FAVORIT
prompt ========================================
prompt
create table WII_KMS_KNOWLEDGE_FAVORIT
(
  user_id      VARCHAR2(40),
  knowledge_id VARCHAR2(40),
  create_time  DATE default sysdate,
  creator      VARCHAR2(40)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table WII_KMS_KNOWLEDGE_FAVORIT
  is '�û���Ŀ�ղر�';
comment on column WII_KMS_KNOWLEDGE_FAVORIT.user_id
  is '��½�û�ID';
comment on column WII_KMS_KNOWLEDGE_FAVORIT.knowledge_id
  is '�ղص���ĿID';
comment on column WII_KMS_KNOWLEDGE_FAVORIT.create_time
  is '����ʱ��';
comment on column WII_KMS_KNOWLEDGE_FAVORIT.creator
  is '������';

prompt
prompt Creating table WII_KMS_KNOWLEDGE_ITEM
prompt =====================================
prompt
create table WII_KMS_KNOWLEDGE_ITEM
(
  knowledge_id             VARCHAR2(40),
  knowledge_title          NVARCHAR2(200),
  knowledge_version        NVARCHAR2(40),
  knowledge_publish_status NUMBER,
  knowledge_keywords       NVARCHAR2(200),
  knowledge_author         NVARCHAR2(100),
  category_item_ids        VARCHAR2(200),
  knowledge_type           NVARCHAR2(100),
  knowledge_desp           NVARCHAR2(200),
  knowledge_content        CLOB,
  knowledge_url            NVARCHAR2(200),
  create_time              DATE default sysdate,
  creator                  VARCHAR2(40),
  modify_time              DATE,
  modifier                 VARCHAR2(40),
  unique_id                VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_KMS_KNOWLEDGE_ITEM
  is '֪ʶ��Ŀ��';
comment on column WII_KMS_KNOWLEDGE_ITEM.knowledge_id
  is '֪ʶ��Ŀ���';
comment on column WII_KMS_KNOWLEDGE_ITEM.knowledge_title
  is '֪ʶ��Ŀ����';
comment on column WII_KMS_KNOWLEDGE_ITEM.knowledge_version
  is '֪ʶ��Ŀ�汾';
comment on column WII_KMS_KNOWLEDGE_ITEM.knowledge_publish_status
  is '0������״̬��1���ύ״̬';
comment on column WII_KMS_KNOWLEDGE_ITEM.knowledge_keywords
  is '֪ʶ��Ŀ�ؼ���';
comment on column WII_KMS_KNOWLEDGE_ITEM.knowledge_author
  is '֪ʶ��Ŀ����';
comment on column WII_KMS_KNOWLEDGE_ITEM.category_item_ids
  is '֪ʶ�ĵ����������б�';
comment on column WII_KMS_KNOWLEDGE_ITEM.knowledge_type
  is '�ĵ����ͣ����ı���PDF��WORD��';
comment on column WII_KMS_KNOWLEDGE_ITEM.knowledge_desp
  is '֪ʶ��Ŀ����';
comment on column WII_KMS_KNOWLEDGE_ITEM.knowledge_content
  is '֪ʶ��Ŀ���ı�����';
comment on column WII_KMS_KNOWLEDGE_ITEM.knowledge_url
  is '�ϴ��ļ�������ַ';
comment on column WII_KMS_KNOWLEDGE_ITEM.create_time
  is '����ʱ��';
comment on column WII_KMS_KNOWLEDGE_ITEM.creator
  is '������';
comment on column WII_KMS_KNOWLEDGE_ITEM.modify_time
  is '�޸�ʱ��';
comment on column WII_KMS_KNOWLEDGE_ITEM.modifier
  is '�޸���';
comment on column WII_KMS_KNOWLEDGE_ITEM.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_LAB_GENERAL_DIC
prompt ==================================
prompt
create table WII_LAB_GENERAL_DIC
(
  dic_name   VARCHAR2(20),
  item_code  VARCHAR2(50),
  items_name VARCHAR2(100),
  input_code VARCHAR2(50),
  memo       NVARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_LAB_GENERAL_DIC.dic_name
  is '�ֵ�����';
comment on column WII_LAB_GENERAL_DIC.item_code
  is '��Ŀ����';
comment on column WII_LAB_GENERAL_DIC.items_name
  is '��Ŀ����';
comment on column WII_LAB_GENERAL_DIC.input_code
  is '��������ĸ(������룩';
comment on column WII_LAB_GENERAL_DIC.memo
  is '��ע';

prompt
prompt Creating table WII_LAB_GROUP_DIC
prompt ================================
prompt
create table WII_LAB_GROUP_DIC
(
  exam_group_no   NUMBER(6),
  exam_group_name VARCHAR2(30),
  belong_type     VARCHAR2(30),
  his_order_name  VARCHAR2(30),
  type_name       VARCHAR2(30),
  lab_group_code  VARCHAR2(40),
  special_code    VARCHAR2(30)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_LAB_GROUP_DIC
  is '������������ֵ�';
comment on column WII_LAB_GROUP_DIC.exam_group_no
  is '������ID
';
comment on column WII_LAB_GROUP_DIC.exam_group_name
  is '����������
';
comment on column WII_LAB_GROUP_DIC.belong_type
  is '���ڷ���
';
comment on column WII_LAB_GROUP_DIC.his_order_name
  is 'HIS����
';
comment on column WII_LAB_GROUP_DIC.type_name
  is '���������';
comment on column WII_LAB_GROUP_DIC.lab_group_code
  is '������CODE
';
comment on column WII_LAB_GROUP_DIC.special_code
  is 'ר��Code';

prompt
prompt Creating table WII_LAB_GROUP_ITEMMAPPING_DIC
prompt ============================================
prompt
create table WII_LAB_GROUP_ITEMMAPPING_DIC
(
  lab_group_code   VARCHAR2(40),
  item_code        VARCHAR2(20),
  item_originfrom  VARCHAR2(20),
  draw_icon        VARCHAR2(30),
  dis_color        VARCHAR2(10),
  draw_style       VARCHAR2(30),
  memo             NVARCHAR2(50),
  input_code       VARCHAR2(30),
  normal_range     VARCHAR2(20),
  parent_item_code VARCHAR2(50),
  item_name        VARCHAR2(40),
  parent_item_name VARCHAR2(100)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_LAB_GROUP_ITEMMAPPING_DIC
  is '��������������Ӧ��';
comment on column WII_LAB_GROUP_ITEMMAPPING_DIC.lab_group_code
  is '���������';
comment on column WII_LAB_GROUP_ITEMMAPPING_DIC.item_code
  is '������Ŀ��LIS�еı���';
comment on column WII_LAB_GROUP_ITEMMAPPING_DIC.item_originfrom
  is '������Դ';
comment on column WII_LAB_GROUP_ITEMMAPPING_DIC.draw_icon
  is '��ʾ�����0-ɢ�㡢1-�������ߡ�2-�������ߡ�3-����ͼ��4-��ֵ�������ȣ�';
comment on column WII_LAB_GROUP_ITEMMAPPING_DIC.memo
  is '��ע';
comment on column WII_LAB_GROUP_ITEMMAPPING_DIC.input_code
  is '����ĸ';
comment on column WII_LAB_GROUP_ITEMMAPPING_DIC.normal_range
  is '����ֵ��Χ';
comment on column WII_LAB_GROUP_ITEMMAPPING_DIC.parent_item_code
  is '������������';
comment on column WII_LAB_GROUP_ITEMMAPPING_DIC.item_name
  is '������Ŀ����';
comment on column WII_LAB_GROUP_ITEMMAPPING_DIC.parent_item_name
  is '��������������';

prompt
prompt Creating table WII_LAB_ITEM_DIC
prompt ===============================
prompt
create table WII_LAB_ITEM_DIC
(
  machine_id    VARCHAR2(30),
  his_orderid   VARCHAR2(30),
  his_ordername NVARCHAR2(100),
  wii_marker    VARCHAR2(20),
  item_code     VARCHAR2(20),
  item_name     NVARCHAR2(40),
  item_name_e   VARCHAR2(40),
  loinc_id      VARCHAR2(20),
  unit          VARCHAR2(8),
  normal_range  VARCHAR2(40),
  lower_limit   NUMBER(9,3),
  upper_limit   NUMBER(9,3),
  result_type   VARCHAR2(8),
  notes         NVARCHAR2(40),
  default_value VARCHAR2(20),
  input_code    VARCHAR2(8)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 512K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_LAB_ITEM_DIC.machine_id
  is '�豸���';
comment on column WII_LAB_ITEM_DIC.his_orderid
  is 'HISҽ������';
comment on column WII_LAB_ITEM_DIC.his_ordername
  is 'HISҽ������';
comment on column WII_LAB_ITEM_DIC.wii_marker
  is 'WIIϵͳ���ñ�ʶ';
comment on column WII_LAB_ITEM_DIC.item_code
  is '������Ŀ����';
comment on column WII_LAB_ITEM_DIC.item_name
  is '������Ŀ����';
comment on column WII_LAB_ITEM_DIC.item_name_e
  is '������ĿӢ������';
comment on column WII_LAB_ITEM_DIC.loinc_id
  is '������ĿLOINC����';
comment on column WII_LAB_ITEM_DIC.unit
  is '����ֵ��λ';
comment on column WII_LAB_ITEM_DIC.normal_range
  is '����ֵ��Χ';
comment on column WII_LAB_ITEM_DIC.lower_limit
  is '����ֵ����(������������Ӱ�������ֵ���������������Ӱ�죬��Ϊ�ա��Թ̶�����ֵ��������ֵ������ͬ���Բ��������ޣ�Ϊ�ա�)';
comment on column WII_LAB_ITEM_DIC.upper_limit
  is '����ֵ����(������������Ӱ�������ֵ���������������Ӱ�죬��Ϊ�ա��Թ̶�����ֵ��������ֵ������ͬ���Բ��������ޣ�Ϊ�ա�)';
comment on column WII_LAB_ITEM_DIC.result_type
  is '�������(��Ӧ��ע����������ҩ����������)';
comment on column WII_LAB_ITEM_DIC.notes
  is '����ֵ��ע';
comment on column WII_LAB_ITEM_DIC.default_value
  is 'Ĭ��ֵ(��û��ֵʱ��ϵͳ�Զ���������)';
comment on column WII_LAB_ITEM_DIC.input_code
  is '���������';

prompt
prompt Creating table WII_LAB_ITEM_MAPPING_DIC
prompt =======================================
prompt
create table WII_LAB_ITEM_MAPPING_DIC
(
  code          VARCHAR2(50),
  name          VARCHAR2(100),
  lis_code      VARCHAR2(50),
  lis_name      VARCHAR2(100),
  parent_lab_no VARCHAR2(500)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table WII_LAB_ITEM_MAPPING_DIC
  add constraint LAB_DIC_UK unique (CODE, LIS_CODE, PARENT_LAB_NO)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WII_LAB_XPY_DIC
prompt ==============================
prompt
create table WII_LAB_XPY_DIC
(
  his_orderid   VARCHAR2(30),
  his_ordername NVARCHAR2(100)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_LAB_XPY_DIC.his_orderid
  is 'HISҽ������';
comment on column WII_LAB_XPY_DIC.his_ordername
  is 'HISҽ������';

prompt
prompt Creating table WII_LAS_GM_GERM
prompt ==============================
prompt
create table WII_LAS_GM_GERM
(
  germid        VARCHAR2(16) not null,
  whonetid      VARCHAR2(16),
  chnname       NVARCHAR2(256),
  cshortname    NVARCHAR2(64),
  engname       VARCHAR2(256),
  eshortname    VARCHAR2(64),
  spellcode     VARCHAR2(64),
  wbcode        VARCHAR2(64),
  showorder     NUMBER,
  memo          NVARCHAR2(256),
  isuse         VARCHAR2(1),
  gram          VARCHAR2(64),
  whonetgram    VARCHAR2(64),
  source        VARCHAR2(2),
  germgroupid   VARCHAR2(64),
  germgroupname VARCHAR2(64),
  creator       NVARCHAR2(20),
  create_time   DATE default sysdate,
  modifier      NVARCHAR2(20),
  modify_time   DATE,
  unique_id     VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_LAS_GM_GERM.germid
  is 'ϸ������';
comment on column WII_LAS_GM_GERM.whonetid
  is 'WHONET����';
comment on column WII_LAS_GM_GERM.chnname
  is 'ϸ��������';
comment on column WII_LAS_GM_GERM.cshortname
  is '��������д';
comment on column WII_LAS_GM_GERM.engname
  is 'ϸ��Ӣ����';
comment on column WII_LAS_GM_GERM.eshortname
  is 'Ӣ������д';
comment on column WII_LAS_GM_GERM.spellcode
  is 'ƴ����';
comment on column WII_LAS_GM_GERM.wbcode
  is '�����';
comment on column WII_LAS_GM_GERM.showorder
  is '�������';
comment on column WII_LAS_GM_GERM.memo
  is '��ע��Ϣ';
comment on column WII_LAS_GM_GERM.isuse
  is '�Ƿ����(1/0)';
comment on column WII_LAS_GM_GERM.gram
  is '����������';
comment on column WII_LAS_GM_GERM.whonetgram
  is 'WHONET����������';
comment on column WII_LAS_GM_GERM.source
  is '��Դ(M:÷�ﰣ,W:WHONET,D:�û��Զ���)';
comment on column WII_LAS_GM_GERM.germgroupid
  is 'ϸ���������';
comment on column WII_LAS_GM_GERM.germgroupname
  is 'ϸ����������';
comment on column WII_LAS_GM_GERM.unique_id
  is '����ΨһID';
alter table WII_LAS_GM_GERM
  add constraint PK_GERMID primary key (GERMID)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WII_LAS_GM_RESULTANTI
prompt ====================================
prompt
create table WII_LAS_GM_RESULTANTI
(
  barcode       VARCHAR2(16) not null,
  testdate      VARCHAR2(8) not null,
  machineid     VARCHAR2(16) not null,
  sampleid      VARCHAR2(20) not null,
  germid        VARCHAR2(64) not null,
  resulttime    DATE,
  antiid        VARCHAR2(64) not null,
  antiname      VARCHAR2(128),
  result        VARCHAR2(16),
  ranger        VARCHAR2(16),
  unit          VARCHAR2(16),
  flag          VARCHAR2(16),
  memo          NVARCHAR2(256),
  machineresult VARCHAR2(64),
  method        VARCHAR2(16) not null,
  amendflag     VARCHAR2(16),
  priority      VARCHAR2(1),
  germseq       NUMBER not null,
  showorder     NUMBER,
  ranges        VARCHAR2(16),
  rangei        VARCHAR2(64),
  creator       NVARCHAR2(20),
  create_time   DATE default sysdate,
  modifier      NVARCHAR2(20),
  modify_time   DATE,
  unique_id     VARCHAR2(50) default sys_guid() not null
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_LAS_GM_RESULTANTI.barcode
  is '�����';
comment on column WII_LAS_GM_RESULTANTI.testdate
  is '��������';
comment on column WII_LAS_GM_RESULTANTI.machineid
  is '����ID';
comment on column WII_LAS_GM_RESULTANTI.sampleid
  is '������';
comment on column WII_LAS_GM_RESULTANTI.germid
  is 'ϸ������';
comment on column WII_LAS_GM_RESULTANTI.resulttime
  is '���ʱ��';
comment on column WII_LAS_GM_RESULTANTI.antiid
  is '�����ر���';
comment on column WII_LAS_GM_RESULTANTI.antiname
  is '����������';
comment on column WII_LAS_GM_RESULTANTI.result
  is '���';
comment on column WII_LAS_GM_RESULTANTI.ranger
  is '�ο���ΧR(��ҩ)';
comment on column WII_LAS_GM_RESULTANTI.unit
  is '��λ';
comment on column WII_LAS_GM_RESULTANTI.flag
  is '�����ʶ(S R I  IB)';
comment on column WII_LAS_GM_RESULTANTI.memo
  is '��ע��Ϣ';
comment on column WII_LAS_GM_RESULTANTI.machineresult
  is '�������';
comment on column WII_LAS_GM_RESULTANTI.method
  is 'ʵ�鷽��(KB��MIC...)';
comment on column WII_LAS_GM_RESULTANTI.amendflag
  is '����ֵ(S R I IB)';
comment on column WII_LAS_GM_RESULTANTI.priority
  is 'ҩƷ���ȼ�(A,B,C,O,U)';
comment on column WII_LAS_GM_RESULTANTI.germseq
  is 'ϸ������(��1��ʼ)';
comment on column WII_LAS_GM_RESULTANTI.showorder
  is '��ʾ˳��';
comment on column WII_LAS_GM_RESULTANTI.ranges
  is '�ο���ΧS(����)';
comment on column WII_LAS_GM_RESULTANTI.rangei
  is '�ο���ΧI(�н�)';
comment on column WII_LAS_GM_RESULTANTI.unique_id
  is '����ΨһID';
alter table WII_LAS_GM_RESULTANTI
  add constraint PK_RESULTANTI primary key (TESTDATE, MACHINEID, SAMPLEID, GERMID, ANTIID)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WII_LAS_GM_SAMPLEREG
prompt ===================================
prompt
create table WII_LAS_GM_SAMPLEREG
(
  testdate        VARCHAR2(8) not null,
  machineid       VARCHAR2(16) not null,
  sampleid        VARCHAR2(20) not null,
  barcode         VARCHAR2(16) not null,
  patienttype     VARCHAR2(16),
  patientid       VARCHAR2(16),
  patientseq      VARCHAR2(16),
  patientname     NVARCHAR2(64),
  patientsex      NVARCHAR2(16),
  patientage      VARCHAR2(8),
  patientageunit  VARCHAR2(16),
  patienttel      VARCHAR2(64),
  patientbedno    VARCHAR2(16),
  patientidenno   VARCHAR2(64),
  patientrace     VARCHAR2(64),
  patientsite     NVARCHAR2(256),
  execsqn         VARCHAR2(256) not null,
  emc             VARCHAR2(1),
  hisitemidlist   VARCHAR2(256),
  hisitemnamelist NVARCHAR2(512),
  hisitemprice    NUMBER,
  doctorid        VARCHAR2(16),
  doctorname      NVARCHAR2(64),
  deptid          VARCHAR2(16),
  deptname        NVARCHAR2(64),
  ordertime       DATE not null,
  execdeptid      VARCHAR2(32),
  execdeptname    NVARCHAR2(64),
  wardid          VARCHAR2(16),
  wardname        NVARCHAR2(64),
  sampletype      VARCHAR2(64),
  samplestate     VARCHAR2(64),
  sampleposition  VARCHAR2(64),
  diagnosis       VARCHAR2(256),
  confirmstate    VARCHAR2(1),
  printstate      VARCHAR2(1),
  alertstate      VARCHAR2(1),
  state           VARCHAR2(16),
  testtype        VARCHAR2(16),
  groupid         VARCHAR2(16),
  nurseid         VARCHAR2(16),
  nursename       NVARCHAR2(64),
  sampletime      DATE,
  senderid        VARCHAR2(32),
  sendername      NVARCHAR2(64),
  sendtime        DATE,
  sendformid      VARCHAR2(16),
  inceptorid      VARCHAR2(64),
  inceptorname    NVARCHAR2(64),
  incepttime      DATE,
  accepterid      VARCHAR2(16),
  acceptername    NVARCHAR2(64),
  accepttime      DATE,
  approverid      VARCHAR2(16),
  approvername    NVARCHAR2(64),
  approvetime     DATE,
  memo            NVARCHAR2(256),
  printedtime     DATE,
  printerid       VARCHAR2(16),
  printername     NVARCHAR2(64),
  hospitalid      VARCHAR2(64),
  resulttype      VARCHAR2(8),
  lismemo         NVARCHAR2(256),
  isinoculated    VARCHAR2(1),
  birthday        DATE,
  isuploadmyla    VARCHAR2(1),
  isolasampletype VARCHAR2(16),
  isolaplate      VARCHAR2(64),
  bottlebarcode   VARCHAR2(64),
  isgcp           VARCHAR2(1),
  ishighrisk      VARCHAR2(1),
  barprinttime    DATE,
  samplegetname   NVARCHAR2(64),
  samplegetid     VARCHAR2(16),
  documenttime    DATE,
  documentid      VARCHAR2(16),
  documentname    NVARCHAR2(64),
  reporttime      DATE,
  creator         NVARCHAR2(20),
  create_time     DATE default sysdate,
  modifier        NVARCHAR2(20),
  modify_time     DATE,
  unique_id       VARCHAR2(50) default sys_guid() not null
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_LAS_GM_SAMPLEREG.testdate
  is '��������';
comment on column WII_LAS_GM_SAMPLEREG.machineid
  is '����ID';
comment on column WII_LAS_GM_SAMPLEREG.sampleid
  is '������';
comment on column WII_LAS_GM_SAMPLEREG.barcode
  is '�����';
comment on column WII_LAS_GM_SAMPLEREG.patienttype
  is '��������';
comment on column WII_LAS_GM_SAMPLEREG.patientid
  is '���߱���';
comment on column WII_LAS_GM_SAMPLEREG.patientseq
  is '������ˮ��';
comment on column WII_LAS_GM_SAMPLEREG.patientname
  is '��������';
comment on column WII_LAS_GM_SAMPLEREG.patientsex
  is '�����Ա�';
comment on column WII_LAS_GM_SAMPLEREG.patientage
  is '��������';
comment on column WII_LAS_GM_SAMPLEREG.patientageunit
  is '���䵥λ';
comment on column WII_LAS_GM_SAMPLEREG.patienttel
  is '���ߵ绰';
comment on column WII_LAS_GM_SAMPLEREG.patientbedno
  is '���ߴ�λ��';
comment on column WII_LAS_GM_SAMPLEREG.patientidenno
  is '�������֤';
comment on column WII_LAS_GM_SAMPLEREG.patientrace
  is '��������';
comment on column WII_LAS_GM_SAMPLEREG.patientsite
  is '���߾�ס��';
comment on column WII_LAS_GM_SAMPLEREG.execsqn
  is 'ִ�е���';
comment on column WII_LAS_GM_SAMPLEREG.emc
  is '�����ʶ';
comment on column WII_LAS_GM_SAMPLEREG.hisitemidlist
  is '�շ���Ŀ����(15,171,F0001)';
comment on column WII_LAS_GM_SAMPLEREG.hisitemnamelist
  is '�շ���Ŀ�����б�';
comment on column WII_LAS_GM_SAMPLEREG.hisitemprice
  is '�շ���Ŀ�۸�';
comment on column WII_LAS_GM_SAMPLEREG.doctorid
  is '����ҽ������';
comment on column WII_LAS_GM_SAMPLEREG.doctorname
  is '����ҽ������';
comment on column WII_LAS_GM_SAMPLEREG.deptid
  is '�������ұ���';
comment on column WII_LAS_GM_SAMPLEREG.deptname
  is '������������';
comment on column WII_LAS_GM_SAMPLEREG.ordertime
  is '����ʱ��';
comment on column WII_LAS_GM_SAMPLEREG.execdeptid
  is 'ִ�п��ұ���';
comment on column WII_LAS_GM_SAMPLEREG.execdeptname
  is 'ִ�п�������';
comment on column WII_LAS_GM_SAMPLEREG.wardid
  is '���߲�������';
comment on column WII_LAS_GM_SAMPLEREG.wardname
  is '���߲�������';
comment on column WII_LAS_GM_SAMPLEREG.sampletype
  is '��������';
comment on column WII_LAS_GM_SAMPLEREG.samplestate
  is '�걾״̬';
comment on column WII_LAS_GM_SAMPLEREG.sampleposition
  is '�걾�ɼ���λ';
comment on column WII_LAS_GM_SAMPLEREG.diagnosis
  is 'ҽ�����';
comment on column WII_LAS_GM_SAMPLEREG.confirmstate
  is '��׼��ʶ.0:δ��׼,1:��׼,2:ȡ����׼,3:����.4.����;5:���';
comment on column WII_LAS_GM_SAMPLEREG.printstate
  is '��ӡ��ʶ:0:δ��ӡ,1:�Ѵ�ӡ';
comment on column WII_LAS_GM_SAMPLEREG.alertstate
  is 'Σ��ֵ״̬:0:��,1:��';
comment on column WII_LAS_GM_SAMPLEREG.state
  is '1 ������Ϣ��Դ;2 ����״̬;3 �Ƿ�Ϊ���ܺ�׼(�Զ���׼);4 ��Ϣ���ͱ�ʶ(���Կ���Ϊ����ƽ̨�ṩ);5 ˫��ϵͳ�����ʶ;6 �����Ƿ��˹����;7 �ⲿϵͳ�����Ѵ����ʶ';
comment on column WII_LAS_GM_SAMPLEREG.testtype
  is '��������';
comment on column WII_LAS_GM_SAMPLEREG.groupid
  is 'С�����';
comment on column WII_LAS_GM_SAMPLEREG.nurseid
  is '�����˱���';
comment on column WII_LAS_GM_SAMPLEREG.nursename
  is '����������';
comment on column WII_LAS_GM_SAMPLEREG.sampletime
  is '����ʱ��';
comment on column WII_LAS_GM_SAMPLEREG.senderid
  is '�ͼ�Ա����';
comment on column WII_LAS_GM_SAMPLEREG.sendername
  is '�ͼ�Ա����';
comment on column WII_LAS_GM_SAMPLEREG.sendtime
  is '�ͼ�Ա����ʱ��';
comment on column WII_LAS_GM_SAMPLEREG.sendformid
  is '�ͼ쵥����';
comment on column WII_LAS_GM_SAMPLEREG.inceptorid
  is '����ƽ����˱���';
comment on column WII_LAS_GM_SAMPLEREG.inceptorname
  is '����ƽ���������';
comment on column WII_LAS_GM_SAMPLEREG.incepttime
  is '����ƽ���ʱ��';
comment on column WII_LAS_GM_SAMPLEREG.accepterid
  is '�걾�����߱���';
comment on column WII_LAS_GM_SAMPLEREG.acceptername
  is '�걾����������';
comment on column WII_LAS_GM_SAMPLEREG.accepttime
  is '�걾����ʱ��';
comment on column WII_LAS_GM_SAMPLEREG.approverid
  is '�걾��׼�߱���';
comment on column WII_LAS_GM_SAMPLEREG.approvername
  is '�걾��׼������';
comment on column WII_LAS_GM_SAMPLEREG.approvetime
  is '�걾��׼ʱ��';
comment on column WII_LAS_GM_SAMPLEREG.memo
  is '��ע';
comment on column WII_LAS_GM_SAMPLEREG.printedtime
  is '���鵥��ӡʱ��';
comment on column WII_LAS_GM_SAMPLEREG.printerid
  is '���鵥��ӡ�߱���';
comment on column WII_LAS_GM_SAMPLEREG.printername
  is '���鵥��ӡ������';
comment on column WII_LAS_GM_SAMPLEREG.hospitalid
  is 'ҽԺ����(����)';
comment on column WII_LAS_GM_SAMPLEREG.resulttype
  is '�������8λ 1�̱���(0��1��) 2ҩ�� 3���̼�¼ 4Ѫ����';
comment on column WII_LAS_GM_SAMPLEREG.lismemo
  is 'LIS��ע��Ϣ';
comment on column WII_LAS_GM_SAMPLEREG.isinoculated
  is '�Ƿ��Ѿ�����(0:δ����,1:�ѽ���)';
comment on column WII_LAS_GM_SAMPLEREG.birthday
  is '��������(YYYY-MM-DD)';
comment on column WII_LAS_GM_SAMPLEREG.isuploadmyla
  is '�Ƿ����ϴ���MYLA(0:δ�ϴ���1:���ϴ�)';
comment on column WII_LAS_GM_SAMPLEREG.isolasampletype
  is '��������������';
comment on column WII_LAS_GM_SAMPLEREG.isolaplate
  is '������ƽ�����';
comment on column WII_LAS_GM_SAMPLEREG.bottlebarcode
  is '����ƿ����';
comment on column WII_LAS_GM_SAMPLEREG.isgcp
  is '�Ƿ�ҩ���ٴ�����(0:��,1:��)';
comment on column WII_LAS_GM_SAMPLEREG.ishighrisk
  is '�Ƿ��Σ����';
comment on column WII_LAS_GM_SAMPLEREG.barprinttime
  is '�����ӡʱ��';
comment on column WII_LAS_GM_SAMPLEREG.samplegetname
  is '����������';
comment on column WII_LAS_GM_SAMPLEREG.samplegetid
  is '�����˱���';
comment on column WII_LAS_GM_SAMPLEREG.documenttime
  is '�鵵ʱ��(����ʱ��)';
comment on column WII_LAS_GM_SAMPLEREG.documentid
  is '�鵵��ID';
comment on column WII_LAS_GM_SAMPLEREG.documentname
  is '�鵵������';
comment on column WII_LAS_GM_SAMPLEREG.reporttime
  is 'Ԥ�Ʊ���ʱ��';
comment on column WII_LAS_GM_SAMPLEREG.unique_id
  is '����ΨһID';
alter table WII_LAS_GM_SAMPLEREG
  add constraint PK_TESTDATE primary key (TESTDATE, MACHINEID, SAMPLEID)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WII_MAPPING_DIC
prompt ==============================
prompt
create table WII_MAPPING_DIC
(
  pharm_code         VARCHAR2(50),
  pharm_name         VARCHAR2(100),
  med_route_ciscode  VARCHAR2(20),
  unit               VARCHAR2(10),
  pack_quan          VARCHAR2(50),
  input_code         VARCHAR2(50),
  memo               VARCHAR2(50),
  valid              VARCHAR2(10),
  pharmacy_code      VARCHAR2(50),
  pharmacy_chemname  NVARCHAR2(50),
  pharmacy_goodsname NVARCHAR2(50),
  dic_code           VARCHAR2(50),
  dic_name           VARCHAR2(50),
  unique_id          VARCHAR2(50) default sys_guid(),
  creator            NVARCHAR2(20),
  create_time        DATE default sysdate
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_MAPPING_DIC.pharm_code
  is 'ҩƷ����';
comment on column WII_MAPPING_DIC.pharm_name
  is 'ҩƷ��������';
comment on column WII_MAPPING_DIC.med_route_ciscode
  is '��ҩ;��';
comment on column WII_MAPPING_DIC.unit
  is '������λ';
comment on column WII_MAPPING_DIC.pack_quan
  is '��װ������';
comment on column WII_MAPPING_DIC.input_code
  is '��������ĸ(������룩';
comment on column WII_MAPPING_DIC.memo
  is '��ע';
comment on column WII_MAPPING_DIC.valid
  is '��Ч�ԣ�0_��Ч��1_��Ч��';
comment on column WII_MAPPING_DIC.pharmacy_code
  is 'HISҩƷ����';
comment on column WII_MAPPING_DIC.pharmacy_chemname
  is 'HISҩƷ��ѧ����';
comment on column WII_MAPPING_DIC.pharmacy_goodsname
  is 'HISҩƷ��Ʒ����';
comment on column WII_MAPPING_DIC.dic_code
  is '�ֵ����';
comment on column WII_MAPPING_DIC.dic_name
  is '�ֵ�����';
comment on column WII_MAPPING_DIC.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_MAPPING_KEY
prompt ==============================
prompt
create table WII_MAPPING_KEY
(
  keyword     VARCHAR2(50),
  dic_code    VARCHAR2(50),
  dic_name    VARCHAR2(100),
  memo        VARCHAR2(50),
  create_time DATE default sysdate,
  creator     NVARCHAR2(20),
  key_code    VARCHAR2(40)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_MAPPING_KEY.keyword
  is '�ؼ���';
comment on column WII_MAPPING_KEY.dic_code
  is '�ֵ����';
comment on column WII_MAPPING_KEY.dic_name
  is '�ֵ�����';
comment on column WII_MAPPING_KEY.memo
  is '��ע';
comment on column WII_MAPPING_KEY.create_time
  is '����ʱ��';
comment on column WII_MAPPING_KEY.creator
  is '������';
comment on column WII_MAPPING_KEY.key_code
  is '����';

prompt
prompt Creating table WII_MAPPING_KEY_CONDITION
prompt ========================================
prompt
create table WII_MAPPING_KEY_CONDITION
(
  key_code    VARCHAR2(50),
  dic_code    VARCHAR2(50),
  symbol      VARCHAR2(10),
  field       VARCHAR2(10),
  content     VARCHAR2(50),
  memo        VARCHAR2(50),
  create_time DATE default sysdate,
  creator     NVARCHAR2(20),
  con_code    VARCHAR2(40) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_MAPPING_KEY_CONDITION.key_code
  is '�ؼ���';
comment on column WII_MAPPING_KEY_CONDITION.dic_code
  is '�ֵ����';
comment on column WII_MAPPING_KEY_CONDITION.symbol
  is '1���,2�����,3����,4������';
comment on column WII_MAPPING_KEY_CONDITION.field
  is '�ֶ�(1 ��ѧ�� 2��Ʒ�� 3���)';
comment on column WII_MAPPING_KEY_CONDITION.content
  is '����';
comment on column WII_MAPPING_KEY_CONDITION.memo
  is '��ע';
comment on column WII_MAPPING_KEY_CONDITION.create_time
  is '����ʱ��';
comment on column WII_MAPPING_KEY_CONDITION.creator
  is '������';
comment on column WII_MAPPING_KEY_CONDITION.con_code
  is '��������';

prompt
prompt Creating table WII_MEDICAL_EVENT
prompt ================================
prompt
create table WII_MEDICAL_EVENT
(
  patient_id    VARCHAR2(20),
  event_type    VARCHAR2(20),
  event_content VARCHAR2(20),
  operator      VARCHAR2(30),
  operate_time  DATE,
  creator       VARCHAR2(20),
  create_time   DATE default sysdate,
  modifier      VARCHAR2(20),
  modify_time   DATE,
  unique_id     VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_MEDICAL_EVENT.patient_id
  is '���߱��';
comment on column WII_MEDICAL_EVENT.event_type
  is '�¼�����';
comment on column WII_MEDICAL_EVENT.event_content
  is '����';
comment on column WII_MEDICAL_EVENT.operator
  is '������';
comment on column WII_MEDICAL_EVENT.operate_time
  is 'ʱ��';
comment on column WII_MEDICAL_EVENT.creator
  is '������';
comment on column WII_MEDICAL_EVENT.create_time
  is '����ʱ��';
comment on column WII_MEDICAL_EVENT.modifier
  is '�޸���';
comment on column WII_MEDICAL_EVENT.modify_time
  is '�޸�ʱ��';
comment on column WII_MEDICAL_EVENT.unique_id
  is '����Ψһid';

prompt
prompt Creating table WII_NAST_SATISFACTION
prompt ====================================
prompt
create table WII_NAST_SATISFACTION
(
  satisfaction_no NUMBER(11),
  name            NVARCHAR2(100),
  max_score       NUMBER(6,2),
  create_time     DATE default sysdate,
  creator         NVARCHAR2(20),
  modifier        NVARCHAR2(20),
  modify_time     DATE,
  unique_id       VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_NAST_SATISFACTION.satisfaction_no
  is '��ˮ��';
comment on column WII_NAST_SATISFACTION.name
  is '����';
comment on column WII_NAST_SATISFACTION.max_score
  is '����ֵ';
comment on column WII_NAST_SATISFACTION.create_time
  is '����ʱ��';
comment on column WII_NAST_SATISFACTION.creator
  is '������';
comment on column WII_NAST_SATISFACTION.modifier
  is '�޸���';
comment on column WII_NAST_SATISFACTION.modify_time
  is '�޸�ʱ��';
comment on column WII_NAST_SATISFACTION.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_NAST_SATISFACTION_SCORE
prompt ==========================================
prompt
create table WII_NAST_SATISFACTION_SCORE
(
  user_id         VARCHAR2(30),
  satisfaction_no NUMBER(6),
  score           NUMBER(6,2),
  create_time     DATE default sysdate,
  creator         NVARCHAR2(20),
  modifier        NVARCHAR2(20),
  modify_time     DATE,
  month           VARCHAR2(10),
  unique_id       VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_NAST_SATISFACTION_SCORE.user_id
  is '����ID';
comment on column WII_NAST_SATISFACTION_SCORE.satisfaction_no
  is '������ˮ��';
comment on column WII_NAST_SATISFACTION_SCORE.score
  is '��ֵ';
comment on column WII_NAST_SATISFACTION_SCORE.create_time
  is '����ʱ��';
comment on column WII_NAST_SATISFACTION_SCORE.creator
  is '������';
comment on column WII_NAST_SATISFACTION_SCORE.modifier
  is '�޸���';
comment on column WII_NAST_SATISFACTION_SCORE.modify_time
  is '�޸�ʱ��';
comment on column WII_NAST_SATISFACTION_SCORE.month
  is '�·�';
comment on column WII_NAST_SATISFACTION_SCORE.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_NOSOCOMIAL_INFECTION
prompt =======================================
prompt
create table WII_NOSOCOMIAL_INFECTION
(
  inpatient_visitid       VARCHAR2(20),
  specimen_name           VARCHAR2(20),
  infect_time             DATE,
  etiological_examination VARCHAR2(20),
  predisposing_factor     NVARCHAR2(500),
  infect_disgnose         NVARCHAR2(500),
  inhospital_disgnose     NVARCHAR2(500),
  creator                 NVARCHAR2(20),
  create_time             DATE default sysdate,
  modifier                NVARCHAR2(20),
  modify_time             DATE,
  unique_id               VARCHAR2(50) default sys_guid(),
  patient_id              VARCHAR2(20),
  infect_diagnose_type    VARCHAR2(50),
  infect_status           VARCHAR2(10)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_NOSOCOMIAL_INFECTION
  is 'ҽԺ��Ⱦ��¼��';
comment on column WII_NOSOCOMIAL_INFECTION.inpatient_visitid
  is 'סԺ���';
comment on column WII_NOSOCOMIAL_INFECTION.specimen_name
  is '�걾����
';
comment on column WII_NOSOCOMIAL_INFECTION.infect_time
  is '��Ⱦʱ��
';
comment on column WII_NOSOCOMIAL_INFECTION.etiological_examination
  is '��ԭѧ���
';
comment on column WII_NOSOCOMIAL_INFECTION.predisposing_factor
  is '�׸�����
';
comment on column WII_NOSOCOMIAL_INFECTION.infect_disgnose
  is '��Ⱦ���
';
comment on column WII_NOSOCOMIAL_INFECTION.inhospital_disgnose
  is '��Ժ���
';
comment on column WII_NOSOCOMIAL_INFECTION.creator
  is '������
';
comment on column WII_NOSOCOMIAL_INFECTION.create_time
  is '����ʱ��
';
comment on column WII_NOSOCOMIAL_INFECTION.modifier
  is '�޸���
';
comment on column WII_NOSOCOMIAL_INFECTION.modify_time
  is '�޸�ʱ��
';
comment on column WII_NOSOCOMIAL_INFECTION.unique_id
  is '����ΨһID';
comment on column WII_NOSOCOMIAL_INFECTION.patient_id
  is '���߱��';
comment on column WII_NOSOCOMIAL_INFECTION.infect_diagnose_type
  is '��Ⱦ�������';
comment on column WII_NOSOCOMIAL_INFECTION.infect_status
  is '��Ⱦ״̬��0������  1��ȷ�ϣ�';

prompt
prompt Creating table WII_NOTEPAD
prompt ==========================
prompt
create table WII_NOTEPAD
(
  notepad_no  NUMBER(11),
  timepoint   DATE,
  operator    NVARCHAR2(20),
  content     CLOB,
  ward_code   NVARCHAR2(50),
  type        NUMBER(2),
  creator     NVARCHAR2(20),
  create_time DATE default sysdate,
  modifier    NVARCHAR2(20),
  modify_time DATE,
  unique_id   VARCHAR2(50) default sys_guid() not null
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_NOTEPAD.notepad_no
  is '��ˮ��';
comment on column WII_NOTEPAD.timepoint
  is 'ʱ���';
comment on column WII_NOTEPAD.operator
  is '������';
comment on column WII_NOTEPAD.content
  is '����';
comment on column WII_NOTEPAD.type
  is '����';
comment on column WII_NOTEPAD.creator
  is '������';
comment on column WII_NOTEPAD.create_time
  is '����ʱ��';
comment on column WII_NOTEPAD.modifier
  is '�޸���';
comment on column WII_NOTEPAD.modify_time
  is '�޸�ʱ��';
comment on column WII_NOTEPAD.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_NOTIFY_SCREEN_CONFIG
prompt =======================================
prompt
create table WII_NOTIFY_SCREEN_CONFIG
(
  screen_id      NVARCHAR2(50) not null,
  ip_address     NVARCHAR2(1000),
  descption      NVARCHAR2(1000),
  templete_id    NVARCHAR2(50),
  time_freq      INTEGER,
  area           VARCHAR2(1000),
  screen_content CLOB,
  last_date      DATE,
  templete_parms NVARCHAR2(1000)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_NOTIFY_SCREEN_CONFIG
  is '������Ļ���ù����';
comment on column WII_NOTIFY_SCREEN_CONFIG.screen_id
  is '��ĻID';
comment on column WII_NOTIFY_SCREEN_CONFIG.ip_address
  is '��ĻIP��ַ';
comment on column WII_NOTIFY_SCREEN_CONFIG.descption
  is '������Ļ˵��';
comment on column WII_NOTIFY_SCREEN_CONFIG.templete_id
  is '��Ӧģ����';
comment on column WII_NOTIFY_SCREEN_CONFIG.time_freq
  is 'ˢ��Ƶ��';
comment on column WII_NOTIFY_SCREEN_CONFIG.area
  is '��������������';
comment on column WII_NOTIFY_SCREEN_CONFIG.screen_content
  is '������Ļ����';
comment on column WII_NOTIFY_SCREEN_CONFIG.last_date
  is '�ϴζ�ȡʱ��';
comment on column WII_NOTIFY_SCREEN_CONFIG.templete_parms
  is 'ģ�崫����� ���ж��,���ŷָ���̨���д���';
alter table WII_NOTIFY_SCREEN_CONFIG
  add primary key (SCREEN_ID)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WII_NOTIFY_SCREEN_TEMPLETE
prompt =========================================
prompt
create table WII_NOTIFY_SCREEN_TEMPLETE
(
  templete_id          NVARCHAR2(50) not null,
  templete_html_soruce CLOB,
  templete_descption   NVARCHAR2(500),
  templete_parms       NVARCHAR2(100)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table WII_NOTIFY_SCREEN_TEMPLETE
  is 'չʾҳ���';
comment on column WII_NOTIFY_SCREEN_TEMPLETE.templete_id
  is 'ҳ��ID';
comment on column WII_NOTIFY_SCREEN_TEMPLETE.templete_html_soruce
  is 'ҳ���������(Html��ʽ)';
comment on column WII_NOTIFY_SCREEN_TEMPLETE.templete_descption
  is 'ҳ������';
comment on column WII_NOTIFY_SCREEN_TEMPLETE.templete_parms
  is 'ģ�崫�����';
alter table WII_NOTIFY_SCREEN_TEMPLETE
  add primary key (TEMPLETE_ID)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WII_NS_NUTRI_RECORD
prompt ==================================
prompt
create table WII_NS_NUTRI_RECORD
(
  patient_id     VARCHAR2(20),
  inward_visitid VARCHAR2(20),
  nutri_code     VARCHAR2(30),
  nutri_name     NVARCHAR2(100),
  nutri_type     VARCHAR2(20),
  dosage         NUMBER(14,4),
  kcal           NUMBER(6,2),
  lipid          NUMBER(6,2),
  ch             NUMBER(6,2),
  nitrogen       NUMBER(6,2),
  operator       NVARCHAR2(20),
  operate_time   DATE,
  creator        NVARCHAR2(20),
  create_time    DATE default sysdate,
  modifier       NVARCHAR2(20),
  modify_time    DATE,
  unique_id      VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_NS_NUTRI_RECORD.patient_id
  is '����id';
comment on column WII_NS_NUTRI_RECORD.inward_visitid
  is '�벡�����';
comment on column WII_NS_NUTRI_RECORD.nutri_code
  is '���';
comment on column WII_NS_NUTRI_RECORD.nutri_name
  is '����';
comment on column WII_NS_NUTRI_RECORD.nutri_type
  is 'ҩƷ���ͣ�1:����,2:����,3:����,4:�Ǹ�ʽ��ҽ��';
comment on column WII_NS_NUTRI_RECORD.dosage
  is 'ҩƷһ��ʹ�ü���';
comment on column WII_NS_NUTRI_RECORD.kcal
  is '����������ֵ';
comment on column WII_NS_NUTRI_RECORD.lipid
  is '������֬��';
comment on column WII_NS_NUTRI_RECORD.ch
  is '������̼ˮ������/��';
comment on column WII_NS_NUTRI_RECORD.nitrogen
  is '�����ĵ�';
comment on column WII_NS_NUTRI_RECORD.operator
  is '������';
comment on column WII_NS_NUTRI_RECORD.operate_time
  is '��¼����';
comment on column WII_NS_NUTRI_RECORD.creator
  is '������';
comment on column WII_NS_NUTRI_RECORD.create_time
  is '����ʱ��';
comment on column WII_NS_NUTRI_RECORD.modifier
  is '�޸���';
comment on column WII_NS_NUTRI_RECORD.modify_time
  is '�޸�ʱ��';
comment on column WII_NS_NUTRI_RECORD.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_NS_TARGET
prompt ============================
prompt
create table WII_NS_TARGET
(
  patient_id     VARCHAR2(20),
  inward_visitid VARCHAR2(20),
  height         NUMBER(6,2),
  weight         NUMBER(6,2),
  target_kcal    NUMBER(6,2),
  kcal           NUMBER(6,2),
  nitrogen       NUMBER(6,2),
  ch             NUMBER(6,2),
  lipid          NUMBER(6,2),
  operator       NVARCHAR2(30),
  operate_time   DATE,
  creator        NVARCHAR2(20),
  create_time    DATE default sysdate,
  modifier       NVARCHAR2(20),
  modify_time    DATE,
  unique_id      VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_NS_TARGET.patient_id
  is '����id';
comment on column WII_NS_TARGET.inward_visitid
  is '�벡�����';
comment on column WII_NS_TARGET.height
  is '���';
comment on column WII_NS_TARGET.weight
  is '����';
comment on column WII_NS_TARGET.target_kcal
  is '�ȿ���Ŀ��ֵ';
comment on column WII_NS_TARGET.kcal
  is 'ǧ������ֵ';
comment on column WII_NS_TARGET.nitrogen
  is '��Ŀ��ֵ';
comment on column WII_NS_TARGET.ch
  is '̼ˮ������/��';
comment on column WII_NS_TARGET.lipid
  is '֬��';
comment on column WII_NS_TARGET.operator
  is '��¼��';
comment on column WII_NS_TARGET.operate_time
  is '��¼����';
comment on column WII_NS_TARGET.creator
  is '������';
comment on column WII_NS_TARGET.create_time
  is '����ʱ��';
comment on column WII_NS_TARGET.modifier
  is '�޸���';
comment on column WII_NS_TARGET.modify_time
  is '�޸�ʱ��';
comment on column WII_NS_TARGET.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_NURSE_TEMPLETE
prompt =================================
prompt
create table WII_NURSE_TEMPLETE
(
  ward_code     VARCHAR2(20) not null,
  templete_code VARCHAR2(20) not null,
  templete_name NVARCHAR2(40),
  templete_desc NVARCHAR2(1000),
  input_code    VARCHAR2(8),
  templete_type VARCHAR2(8),
  view_code     VARCHAR2(20),
  is_common     VARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_NURSE_TEMPLETE.ward_code
  is '����Ԫ';
comment on column WII_NURSE_TEMPLETE.templete_code
  is 'ģ�����';
comment on column WII_NURSE_TEMPLETE.templete_name
  is 'ģ������';
comment on column WII_NURSE_TEMPLETE.templete_desc
  is 'ģ������';
comment on column WII_NURSE_TEMPLETE.input_code
  is '������';
comment on column WII_NURSE_TEMPLETE.templete_type
  is 'ģ����𣨻����ʩ����ԺС�ᣬ���飬ҽ���ȣ���������ģ�������';
comment on column WII_NURSE_TEMPLETE.view_code
  is '��ʾ����';
comment on column WII_NURSE_TEMPLETE.is_common
  is '�Ƿ���ģ�棨1�����ã�';
alter table WII_NURSE_TEMPLETE
  add constraint PK_NURSE_TEMPLETE primary key (TEMPLETE_CODE, WARD_CODE)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WII_NURSINGPLAN_ADVICE_DIC
prompt =========================================
prompt
create table WII_NURSINGPLAN_ADVICE_DIC
(
  nursing_grade    NVARCHAR2(20),
  nursing_advice   NVARCHAR2(400),
  score_expression VARCHAR2(20),
  score_code       VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_NURSINGPLAN_ADVICE_DIC.nursing_grade
  is '����ȼ����߶�Σ�ա��ж�Σ�ա����Σ�ա���Σ�գ�';
comment on column WII_NURSINGPLAN_ADVICE_DIC.nursing_advice
  is '������';
comment on column WII_NURSINGPLAN_ADVICE_DIC.score_expression
  is '�������ַ�Χ����ѧ���ʽ���㣬x������ֵ���磺
x<=12
x>=13<=14
x>=15<=17
x>=18';
comment on column WII_NURSINGPLAN_ADVICE_DIC.score_code
  is '��������';

prompt
prompt Creating table WII_NURSINGPLAN_DIC
prompt ==================================
prompt
create table WII_NURSINGPLAN_DIC
(
  plan_dic_no NUMBER(11),
  type        NVARCHAR2(20),
  content     NVARCHAR2(200),
  creator     VARCHAR2(20),
  create_time DATE default sysdate,
  modifier    VARCHAR2(20),
  modify_time DATE,
  plan_source NUMBER(2)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_NURSINGPLAN_DIC.plan_dic_no
  is '��ţ����ڵ�IDΪ0��';
comment on column WII_NURSINGPLAN_DIC.type
  is '����(��������,����Ŀ��,�����ʩ)';
comment on column WII_NURSINGPLAN_DIC.content
  is '����';
comment on column WII_NURSINGPLAN_DIC.plan_source
  is '����ƻ���Դ��0����ʿ��1��ҽ����Ĭ��ֵ��0';

prompt
prompt Creating table WII_NURSINGPLAN_INFOHIERARCHY
prompt ============================================
prompt
create table WII_NURSINGPLAN_INFOHIERARCHY
(
  problem     NUMBER(6),
  target      NUMBER(6),
  step        NUMBER(6),
  creator     NVARCHAR2(20),
  create_time DATE default sysdate,
  modifier    NVARCHAR2(20),
  modify_time DATE,
  unique_id   VARCHAR2(50) default sys_guid(),
  plan_source NUMBER(2)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_NURSINGPLAN_INFOHIERARCHY.problem
  is '��������';
comment on column WII_NURSINGPLAN_INFOHIERARCHY.target
  is '����Ŀ��';
comment on column WII_NURSINGPLAN_INFOHIERARCHY.step
  is '�����ʩ';
comment on column WII_NURSINGPLAN_INFOHIERARCHY.creator
  is '������';
comment on column WII_NURSINGPLAN_INFOHIERARCHY.create_time
  is '����ʱ��';
comment on column WII_NURSINGPLAN_INFOHIERARCHY.unique_id
  is '����ΨһID';
comment on column WII_NURSINGPLAN_INFOHIERARCHY.plan_source
  is '����ƻ���Դ��0����ʿ��1��ҽ����Ĭ��ֵ��0';

prompt
prompt Creating table WII_NURSING_ASSESS_CONFIG
prompt ========================================
prompt
create table WII_NURSING_ASSESS_CONFIG
(
  assess_id    NVARCHAR2(20),
  assess_name  NVARCHAR2(20),
  module_id    NVARCHAR2(20),
  module_items NVARCHAR2(2000),
  memo         NVARCHAR2(200),
  create_time  DATE,
  creator      NVARCHAR2(20),
  modify_time  DATE,
  modifier     NVARCHAR2(20),
  unique_id    VARCHAR2(50),
  special_code NVARCHAR2(40)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_NURSING_ASSESS_CONFIG.assess_id
  is '����ID
';
comment on column WII_NURSING_ASSESS_CONFIG.assess_name
  is '��������
';
comment on column WII_NURSING_ASSESS_CONFIG.module_id
  is 'ģ��ID
';
comment on column WII_NURSING_ASSESS_CONFIG.module_items
  is 'JSON���ó���ģ���µ�������Ŀ
';
comment on column WII_NURSING_ASSESS_CONFIG.memo
  is '��ע
';
comment on column WII_NURSING_ASSESS_CONFIG.create_time
  is '����ʱ��
';
comment on column WII_NURSING_ASSESS_CONFIG.creator
  is '������
';
comment on column WII_NURSING_ASSESS_CONFIG.modify_time
  is '�޸�ʱ��
';
comment on column WII_NURSING_ASSESS_CONFIG.modifier
  is '�޸���
';
comment on column WII_NURSING_ASSESS_CONFIG.unique_id
  is '����Ψһid
';
comment on column WII_NURSING_ASSESS_CONFIG.special_code
  is 'ר��CODE';

prompt
prompt Creating table WII_NURSING_ASSESS_ITEM_DIC
prompt ==========================================
prompt
create table WII_NURSING_ASSESS_ITEM_DIC
(
  itemkey        NVARCHAR2(20),
  itemname       NVARCHAR2(100),
  valuetype      NVARCHAR2(10),
  valuerange     NVARCHAR2(1000),
  module_id      NVARCHAR2(20),
  parent_itemkey NVARCHAR2(20),
  memo           NVARCHAR2(200),
  unit           NVARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_NURSING_ASSESS_ITEM_DIC.itemkey
  is '��������
';
comment on column WII_NURSING_ASSESS_ITEM_DIC.itemname
  is '������������
';
comment on column WII_NURSING_ASSESS_ITEM_DIC.valuetype
  is 'ȡֵ����
R ��ѡ
T �ı�
M ��ѡ
RT ��ѡ���ı�
D ʱ������
L �����ı� S���⴦��';
comment on column WII_NURSING_ASSESS_ITEM_DIC.valuerange
  is 'ȡֵ��Χ
';
comment on column WII_NURSING_ASSESS_ITEM_DIC.module_id
  is 'ģ��ID
';
comment on column WII_NURSING_ASSESS_ITEM_DIC.parent_itemkey
  is '������������
';
comment on column WII_NURSING_ASSESS_ITEM_DIC.memo
  is '��ע
';
comment on column WII_NURSING_ASSESS_ITEM_DIC.unit
  is '��λ�����';

prompt
prompt Creating table WII_NURSING_ASSESS_MODULE_DIC
prompt ============================================
prompt
create table WII_NURSING_ASSESS_MODULE_DIC
(
  module_id   NVARCHAR2(20),
  module_name NVARCHAR2(20),
  memo        NVARCHAR2(200),
  create_time DATE,
  creator     NVARCHAR2(20),
  modify_time DATE,
  modifier    NVARCHAR2(20),
  unique_id   VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_NURSING_ASSESS_MODULE_DIC.module_id
  is 'ģ��ID
';
comment on column WII_NURSING_ASSESS_MODULE_DIC.module_name
  is 'ģ������
';
comment on column WII_NURSING_ASSESS_MODULE_DIC.memo
  is '��ע
';
comment on column WII_NURSING_ASSESS_MODULE_DIC.create_time
  is '����ʱ��
';
comment on column WII_NURSING_ASSESS_MODULE_DIC.creator
  is '������
';
comment on column WII_NURSING_ASSESS_MODULE_DIC.modify_time
  is '�޸�ʱ��
';
comment on column WII_NURSING_ASSESS_MODULE_DIC.modifier
  is '�޸���
';
comment on column WII_NURSING_ASSESS_MODULE_DIC.unique_id
  is '����Ψһid
';

prompt
prompt Creating table WII_NURSING_FREQUENCY
prompt ====================================
prompt
create table WII_NURSING_FREQUENCY
(
  score_code    VARCHAR2(50),
  grade_code    VARCHAR2(50),
  nursing_code  VARCHAR2(20),
  frequency     VARCHAR2(50),
  creator       NVARCHAR2(20),
  create_time   DATE default sysdate,
  modifier      NVARCHAR2(20),
  modify_time   DATE,
  min_frequency NUMBER(6),
  unique_id     VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_NURSING_FREQUENCY.score_code
  is '���ֱ��';
comment on column WII_NURSING_FREQUENCY.grade_code
  is '�ȼ����';
comment on column WII_NURSING_FREQUENCY.nursing_code
  is '������Ŀ���';
comment on column WII_NURSING_FREQUENCY.frequency
  is 'Ƶ��';
comment on column WII_NURSING_FREQUENCY.creator
  is '������';
comment on column WII_NURSING_FREQUENCY.create_time
  is '����ʱ��';
comment on column WII_NURSING_FREQUENCY.modifier
  is '�޸���';
comment on column WII_NURSING_FREQUENCY.modify_time
  is '�޸�ʱ��';
comment on column WII_NURSING_FREQUENCY.min_frequency
  is 'Ƶ����Сֵ';
comment on column WII_NURSING_FREQUENCY.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_NURSING_MEMO
prompt ===============================
prompt
create table WII_NURSING_MEMO
(
  patient_id    VARCHAR2(20),
  order_no      VARCHAR2(3000),
  time_point    DATE,
  nursing_type  VARCHAR2(8),
  nursing_desc  NVARCHAR2(2000),
  special_flag  VARCHAR2(30),
  operator      NVARCHAR2(30),
  operate_time  DATE,
  creator       NVARCHAR2(20),
  create_time   DATE default sysdate,
  verify        NVARCHAR2(30),
  verify_time   DATE,
  serial_number NUMBER(12),
  is_verify     NUMBER(1),
  modifier      NVARCHAR2(20),
  modify_time   DATE,
  unique_id     VARCHAR2(50) default sys_guid(),
  template_code VARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_NURSING_MEMO.patient_id
  is '���ˣ���ţ�Ψһ��ʶ';
comment on column WII_NURSING_MEMO.order_no
  is 'ҽ����� ';
comment on column WII_NURSING_MEMO.time_point
  is '�����ʩʱ���';
comment on column WII_NURSING_MEMO.nursing_type
  is '��¼��𣨻����ʩ����ԺС�ᣬ���飬ҽ���ȣ���������ģ�������';
comment on column WII_NURSING_MEMO.nursing_desc
  is '��¼����';
comment on column WII_NURSING_MEMO.special_flag
  is '�����ʾ�����磺���ȵȣ�';
comment on column WII_NURSING_MEMO.operator
  is '������';
comment on column WII_NURSING_MEMO.operate_time
  is '����ʱ��';
comment on column WII_NURSING_MEMO.creator
  is '������ ';
comment on column WII_NURSING_MEMO.create_time
  is '����ʱ��';
comment on column WII_NURSING_MEMO.verify
  is '�����';
comment on column WII_NURSING_MEMO.verify_time
  is '���ʱ��';
comment on column WII_NURSING_MEMO.serial_number
  is '��ˮ��';
comment on column WII_NURSING_MEMO.unique_id
  is '����ΨһID';
comment on column WII_NURSING_MEMO.template_code
  is 'ģ�����';

prompt
prompt Creating table WII_NURSING_MEMO_CHANGE
prompt ======================================
prompt
create table WII_NURSING_MEMO_CHANGE
(
  patient_id    VARCHAR2(20),
  order_no      VARCHAR2(3000),
  time_point    DATE,
  nursing_type  VARCHAR2(8),
  nursing_desc  NVARCHAR2(2000),
  special_flag  NUMBER(1),
  operator      NVARCHAR2(30),
  operate_time  DATE,
  creator       NVARCHAR2(20),
  create_time   DATE default sysdate,
  verify        NVARCHAR2(30),
  verify_time   DATE,
  modifier      NVARCHAR2(20),
  modify_time   DATE,
  serial_number NUMBER(12),
  change_type   VARCHAR2(8),
  is_verify     NUMBER(1),
  unique_id     VARCHAR2(50) default sys_guid(),
  template_code VARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_NURSING_MEMO_CHANGE.patient_id
  is '�����ˣ���ţ�Ψһ��ʶ';
comment on column WII_NURSING_MEMO_CHANGE.order_no
  is 'ҽ����� ';
comment on column WII_NURSING_MEMO_CHANGE.time_point
  is '�����ʩʱ���';
comment on column WII_NURSING_MEMO_CHANGE.nursing_type
  is '��¼��𣨻����ʩ����ԺС�ᣬ���飬ҽ���ȣ���������ģ�������';
comment on column WII_NURSING_MEMO_CHANGE.nursing_desc
  is '��¼����';
comment on column WII_NURSING_MEMO_CHANGE.special_flag
  is '�����ʾ�����磺���ȵȣ�';
comment on column WII_NURSING_MEMO_CHANGE.operator
  is '��������';
comment on column WII_NURSING_MEMO_CHANGE.operate_time
  is '������ʱ��';
comment on column WII_NURSING_MEMO_CHANGE.creator
  is '������ ';
comment on column WII_NURSING_MEMO_CHANGE.create_time
  is '����ʱ��';
comment on column WII_NURSING_MEMO_CHANGE.verify
  is '�����';
comment on column WII_NURSING_MEMO_CHANGE.verify_time
  is '���ʱ��';
comment on column WII_NURSING_MEMO_CHANGE.modifier
  is '�޸���';
comment on column WII_NURSING_MEMO_CHANGE.modify_time
  is '�޸�ʱ��';
comment on column WII_NURSING_MEMO_CHANGE.serial_number
  is '��ˮ��';
comment on column WII_NURSING_MEMO_CHANGE.change_type
  is '�������';
comment on column WII_NURSING_MEMO_CHANGE.is_verify
  is '�Ƿ������';
comment on column WII_NURSING_MEMO_CHANGE.unique_id
  is '����ΨһID';
comment on column WII_NURSING_MEMO_CHANGE.template_code
  is 'ģ�����';

prompt
prompt Creating table WII_NURSING_ORAL_CLEAN
prompt =====================================
prompt
create table WII_NURSING_ORAL_CLEAN
(
  patient_id   VARCHAR2(20),
  clean_type   VARCHAR2(20),
  operator     NVARCHAR2(30),
  operate_time DATE,
  creator      NVARCHAR2(20),
  create_time  DATE default sysdate,
  modifier     NVARCHAR2(20),
  modify_time  DATE,
  unique_id    VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_NURSING_ORAL_CLEAN.patient_id
  is '���߱��
';
comment on column WII_NURSING_ORAL_CLEAN.clean_type
  is '��෽ʽ
';
comment on column WII_NURSING_ORAL_CLEAN.operator
  is '������
';
comment on column WII_NURSING_ORAL_CLEAN.operate_time
  is '����ʱ��
';
comment on column WII_NURSING_ORAL_CLEAN.creator
  is '������
';
comment on column WII_NURSING_ORAL_CLEAN.create_time
  is '����ʱ��
';
comment on column WII_NURSING_ORAL_CLEAN.modifier
  is '�޸���
';
comment on column WII_NURSING_ORAL_CLEAN.modify_time
  is '�޸�ʱ��
';
comment on column WII_NURSING_ORAL_CLEAN.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_NURSING_ORAL_CLEAN_ASSESS
prompt ============================================
prompt
create table WII_NURSING_ORAL_CLEAN_ASSESS
(
  patient_id   VARCHAR2(20),
  operate_time DATE,
  result       NVARCHAR2(200),
  operator     NVARCHAR2(20),
  creator      NVARCHAR2(20),
  create_time  DATE default sysdate,
  modifier     NVARCHAR2(20),
  modify_time  DATE,
  unique_id    VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_NURSING_ORAL_CLEAN_ASSESS
  is '��ǻ������۱�';
comment on column WII_NURSING_ORAL_CLEAN_ASSESS.patient_id
  is '���߱��
';
comment on column WII_NURSING_ORAL_CLEAN_ASSESS.operate_time
  is '����ʱ��
';
comment on column WII_NURSING_ORAL_CLEAN_ASSESS.result
  is '���۽��
';
comment on column WII_NURSING_ORAL_CLEAN_ASSESS.operator
  is '������
';
comment on column WII_NURSING_ORAL_CLEAN_ASSESS.creator
  is '������
';
comment on column WII_NURSING_ORAL_CLEAN_ASSESS.create_time
  is '����ʱ��
';
comment on column WII_NURSING_ORAL_CLEAN_ASSESS.modifier
  is '�޸���
';
comment on column WII_NURSING_ORAL_CLEAN_ASSESS.modify_time
  is '�޸�ʱ��
';
comment on column WII_NURSING_ORAL_CLEAN_ASSESS.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_NURSING_PLAN
prompt ===============================
prompt
create table WII_NURSING_PLAN
(
  nursing_plan_no  NUMBER(11),
  patient_id       VARCHAR2(100),
  inward_visitid   VARCHAR2(100),
  question         VARCHAR2(300),
  question_content CLOB,
  memo             VARCHAR2(300),
  memo_content     CLOB,
  target           VARCHAR2(300),
  target_content   CLOB,
  start_operator   VARCHAR2(36),
  start_time       DATE,
  stop_operator    VARCHAR2(36),
  stop_time        DATE,
  result           NVARCHAR2(300),
  creator          VARCHAR2(36),
  create_time      DATE default sysdate,
  modifier         VARCHAR2(36),
  modify_time      DATE,
  unique_id        VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_NURSING_PLAN.nursing_plan_no
  is '���������';
comment on column WII_NURSING_PLAN.patient_id
  is '���߱��';
comment on column WII_NURSING_PLAN.inward_visitid
  is '�벡�����';
comment on column WII_NURSING_PLAN.question
  is '���������ţ��Զ��ŷָ���';
comment on column WII_NURSING_PLAN.question_content
  is '�����������ݣ�JSON��';
comment on column WII_NURSING_PLAN.memo
  is '�����ʩ��ţ��Զ��ŷָ���';
comment on column WII_NURSING_PLAN.memo_content
  is '�����ʩ���ݣ�JSON��';
comment on column WII_NURSING_PLAN.target
  is 'Ԥ��Ŀ���ţ��Զ��ŷָ���';
comment on column WII_NURSING_PLAN.target_content
  is 'Ԥ��Ŀ�����ݣ�JSON��';
comment on column WII_NURSING_PLAN.start_operator
  is '��ʼ��Ա';
comment on column WII_NURSING_PLAN.start_time
  is '��ʼʱ��';
comment on column WII_NURSING_PLAN.stop_operator
  is '������Ա';
comment on column WII_NURSING_PLAN.stop_time
  is '����ʱ��';
comment on column WII_NURSING_PLAN.result
  is 'Ч��';
comment on column WII_NURSING_PLAN.creator
  is '������';
comment on column WII_NURSING_PLAN.create_time
  is '����ʱ��';
comment on column WII_NURSING_PLAN.modifier
  is '�޸���';
comment on column WII_NURSING_PLAN.modify_time
  is '�޸�ʱ��';
comment on column WII_NURSING_PLAN.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_NURSING_PLAN_TEMP
prompt ====================================
prompt
create table WII_NURSING_PLAN_TEMP
(
  nursing_plan_temp_no NUMBER(11),
  ward_code            VARCHAR2(30),
  question             VARCHAR2(300),
  memo                 VARCHAR2(300),
  target               VARCHAR2(300),
  creator              VARCHAR2(36),
  create_time          DATE default sysdate,
  modifier             VARCHAR2(36),
  modify_time          DATE,
  unique_id            VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_NURSING_PLAN_TEMP.nursing_plan_temp_no
  is '���������';
comment on column WII_NURSING_PLAN_TEMP.ward_code
  is '�������';
comment on column WII_NURSING_PLAN_TEMP.question
  is '�������⣨�Զ��ŷָ���';
comment on column WII_NURSING_PLAN_TEMP.memo
  is '�����ʩ���Զ��ŷָ���';
comment on column WII_NURSING_PLAN_TEMP.target
  is 'Ԥ��Ŀ�꣨�Զ��ŷָ���';
comment on column WII_NURSING_PLAN_TEMP.creator
  is '������';
comment on column WII_NURSING_PLAN_TEMP.create_time
  is '����ʱ��';
comment on column WII_NURSING_PLAN_TEMP.modifier
  is '�޸���';
comment on column WII_NURSING_PLAN_TEMP.modify_time
  is '�޸�ʱ��';
comment on column WII_NURSING_PLAN_TEMP.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_NURSING_PLAN_TEMP_ITEM
prompt =========================================
prompt
create table WII_NURSING_PLAN_TEMP_ITEM
(
  nursing_plan_temp_item_no NUMBER(11),
  ward_code                 VARCHAR2(30),
  item_type                 VARCHAR2(20),
  item_content              NVARCHAR2(300),
  input_code                VARCHAR2(300),
  creator                   VARCHAR2(36),
  create_time               DATE default sysdate,
  modifier                  VARCHAR2(36),
  modify_time               DATE,
  unique_id                 VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_NURSING_PLAN_TEMP_ITEM.nursing_plan_temp_item_no
  is '���������';
comment on column WII_NURSING_PLAN_TEMP_ITEM.ward_code
  is '�������';
comment on column WII_NURSING_PLAN_TEMP_ITEM.item_type
  is '����ƻ����ͣ�Q���������� M�������ʩ T��Ԥ��Ŀ�꣩';
comment on column WII_NURSING_PLAN_TEMP_ITEM.item_content
  is '����';
comment on column WII_NURSING_PLAN_TEMP_ITEM.input_code
  is 'ƴ������ĸ';
comment on column WII_NURSING_PLAN_TEMP_ITEM.creator
  is '������';
comment on column WII_NURSING_PLAN_TEMP_ITEM.create_time
  is '����ʱ��';
comment on column WII_NURSING_PLAN_TEMP_ITEM.modifier
  is '�޸���';
comment on column WII_NURSING_PLAN_TEMP_ITEM.modify_time
  is '�޸�ʱ��';
comment on column WII_NURSING_PLAN_TEMP_ITEM.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_NURSING_REMIND
prompt =================================
prompt
create table WII_NURSING_REMIND
(
  plan_no            NUMBER(11),
  patient_id         VARCHAR2(20),
  plan_type          VARCHAR2(50),
  plan_time          DATE,
  reminder_time_span NUMBER(6),
  repeat_flag        VARCHAR2(20),
  repeat_week        VARCHAR2(200),
  repeat_month       VARCHAR2(200),
  repeat_number      NUMBER(6),
  repeat_start_time  DATE,
  repeat_end_time    DATE,
  operator           VARCHAR2(20),
  operate_time       DATE,
  creator            NVARCHAR2(20),
  create_time        DATE default sysdate,
  modifier           NVARCHAR2(20),
  modify_time        DATE,
  all_day            NUMBER(1),
  repeat_rule        VARCHAR2(20),
  custom_task        NVARCHAR2(100),
  unique_id          VARCHAR2(50) default sys_guid(),
  plan_source        NUMBER(2),
  nursing_plan_no    NUMBER(11),
  iscancel           NUMBER(1),
  remind_plan_id     NVARCHAR2(20),
  return_url         NVARCHAR2(200),
  return_type        NVARCHAR2(200),
  repeat_type        NVARCHAR2(20),
  repeat_day         NUMBER(2)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_NURSING_REMIND.plan_no
  is '��ˮ��';
comment on column WII_NURSING_REMIND.patient_id
  is '����ID';
comment on column WII_NURSING_REMIND.plan_type
  is '��������';
comment on column WII_NURSING_REMIND.plan_time
  is '�ƻ�ִ�п�ʼʱ��';
comment on column WII_NURSING_REMIND.reminder_time_span
  is '����ʱ����������';
comment on column WII_NURSING_REMIND.repeat_flag
  is '�ظ���ʶ(һ��/ÿ��/ÿ��/ÿ��)';
comment on column WII_NURSING_REMIND.repeat_week
  is '�ظ���(1/2/3/4/5/6/7)';
comment on column WII_NURSING_REMIND.repeat_month
  is '�ظ���(1/2/3/4/5/6/7/8/9/10������)';
comment on column WII_NURSING_REMIND.repeat_number
  is '�ظ�����';
comment on column WII_NURSING_REMIND.repeat_start_time
  is '��ʼʱ��';
comment on column WII_NURSING_REMIND.repeat_end_time
  is '����ʱ��';
comment on column WII_NURSING_REMIND.operator
  is '������';
comment on column WII_NURSING_REMIND.operate_time
  is '����ʱ��';
comment on column WII_NURSING_REMIND.creator
  is '������';
comment on column WII_NURSING_REMIND.create_time
  is '����ʱ��';
comment on column WII_NURSING_REMIND.modifier
  is '������';
comment on column WII_NURSING_REMIND.modify_time
  is '����ʱ��';
comment on column WII_NURSING_REMIND.all_day
  is '�Ƿ�ȫ��(1ȫ��0��ȫ��)';
comment on column WII_NURSING_REMIND.repeat_rule
  is '�ظ�����(�ƴ�/ʱ��)';
comment on column WII_NURSING_REMIND.custom_task
  is '�Զ�������';
comment on column WII_NURSING_REMIND.unique_id
  is '����ΨһID';
comment on column WII_NURSING_REMIND.plan_source
  is '����ƻ���Դ��0����ʿ��1��ҽ����Ĭ��ֵ��0';
comment on column WII_NURSING_REMIND.nursing_plan_no
  is '��WII_NURSING_PLAN��NURSING_PLAN_NO����';
comment on column WII_NURSING_REMIND.iscancel
  is '�Ƿ�ʧЧ 0��Ч 1ʧЧ';
comment on column WII_NURSING_REMIND.remind_plan_id
  is '�������Ѽƻ�ID';
comment on column WII_NURSING_REMIND.return_url
  is '��ת·��';
comment on column WII_NURSING_REMIND.return_type
  is '��ת���� 0���� 1��ת';
comment on column WII_NURSING_REMIND.repeat_type
  is '�ظ����� (�����Ѿ���Ч������£��Ƿ���ظ����� 0 �����ظ� 1���ظ�)';
comment on column WII_NURSING_REMIND.repeat_day
  is '�ظ���';

prompt
prompt Creating table WII_NURSING_REMIND_EXEC
prompt ======================================
prompt
create table WII_NURSING_REMIND_EXEC
(
  plan_exec_no    NUMBER(11) not null,
  plan_no         NUMBER(11),
  plan_type       VARCHAR2(20),
  exectue_status  NUMBER(1),
  executor        NVARCHAR2(20),
  execute_time    DATE,
  creator         NVARCHAR2(20),
  create_time     DATE default sysdate,
  modifier        NVARCHAR2(20),
  modify_time     DATE,
  plan_time_start DATE,
  reminder_time   DATE,
  plan_delete     NUMBER(1),
  plan_time_end   DATE,
  cancel_reason   NVARCHAR2(200),
  remark          NVARCHAR2(200),
  unique_id       VARCHAR2(50) default sys_guid() not null,
  indexs          NVARCHAR2(50),
  patient_id      NVARCHAR2(20),
  allday          NUMBER(1),
  return_url      NVARCHAR2(200),
  return_type     NVARCHAR2(200)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_NURSING_REMIND_EXEC.plan_exec_no
  is '��ˮ��';
comment on column WII_NURSING_REMIND_EXEC.plan_no
  is '����ƻ�ID';
comment on column WII_NURSING_REMIND_EXEC.plan_type
  is '��������';
comment on column WII_NURSING_REMIND_EXEC.exectue_status
  is '����ƻ��Ƿ�ִ��(0δִ��1ִ��2ȡ��)';
comment on column WII_NURSING_REMIND_EXEC.executor
  is 'ִ����';
comment on column WII_NURSING_REMIND_EXEC.execute_time
  is 'ִ��ʱ��';
comment on column WII_NURSING_REMIND_EXEC.creator
  is '������';
comment on column WII_NURSING_REMIND_EXEC.create_time
  is '����ʱ��';
comment on column WII_NURSING_REMIND_EXEC.modifier
  is '������';
comment on column WII_NURSING_REMIND_EXEC.modify_time
  is '����ʱ��';
comment on column WII_NURSING_REMIND_EXEC.plan_time_start
  is '�ƻ�ִ�п�ʼʱ��';
comment on column WII_NURSING_REMIND_EXEC.reminder_time
  is '����ʱ��';
comment on column WII_NURSING_REMIND_EXEC.plan_delete
  is '�ƻ�ɾ��(1ɾ��0δɾ��)';
comment on column WII_NURSING_REMIND_EXEC.plan_time_end
  is '�ƻ�ִ�н���ʱ��';
comment on column WII_NURSING_REMIND_EXEC.cancel_reason
  is 'ȡ��ԭ��';
comment on column WII_NURSING_REMIND_EXEC.remark
  is 'ִ�б�ע';
comment on column WII_NURSING_REMIND_EXEC.unique_id
  is '����ΨһID';
comment on column WII_NURSING_REMIND_EXEC.indexs
  is '����';
comment on column WII_NURSING_REMIND_EXEC.patient_id
  is '����Id';
comment on column WII_NURSING_REMIND_EXEC.allday
  is '�Ƿ�ȫ�� 0:�� 1����';
comment on column WII_NURSING_REMIND_EXEC.return_url
  is '��ת·��';
comment on column WII_NURSING_REMIND_EXEC.return_type
  is '��ת���� 0���� 1��ת';

prompt
prompt Creating table WII_NURSING_REMIND_EXEC_BAC
prompt ==========================================
prompt
create table WII_NURSING_REMIND_EXEC_BAC
(
  plan_exec_no    NUMBER(6),
  plan_no         NUMBER(6),
  plan_type       VARCHAR2(20),
  exectue_status  NUMBER(1),
  executor        NVARCHAR2(20),
  execute_time    DATE,
  creator         NVARCHAR2(20),
  create_time     DATE default sysdate,
  modifier        NVARCHAR2(20),
  modify_time     DATE,
  plan_time_start DATE,
  reminder_time   DATE,
  plan_delete     NUMBER(1),
  plan_time_end   DATE,
  cancel_reason   NVARCHAR2(200),
  remark          NVARCHAR2(200),
  unique_id       VARCHAR2(50) default sys_guid(),
  patient_id      NVARCHAR2(20),
  allday          NUMBER(1)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_NURSING_REMIND_EXEC_BAC.plan_exec_no
  is '��ˮ��';
comment on column WII_NURSING_REMIND_EXEC_BAC.plan_no
  is '����ƻ�ID';
comment on column WII_NURSING_REMIND_EXEC_BAC.plan_type
  is '��������';
comment on column WII_NURSING_REMIND_EXEC_BAC.exectue_status
  is '����ƻ��Ƿ�ִ��(0δִ��1ִ��2ȡ��)';
comment on column WII_NURSING_REMIND_EXEC_BAC.executor
  is 'ִ����';
comment on column WII_NURSING_REMIND_EXEC_BAC.execute_time
  is 'ִ��ʱ��';
comment on column WII_NURSING_REMIND_EXEC_BAC.creator
  is '������';
comment on column WII_NURSING_REMIND_EXEC_BAC.create_time
  is '����ʱ��';
comment on column WII_NURSING_REMIND_EXEC_BAC.modifier
  is '������';
comment on column WII_NURSING_REMIND_EXEC_BAC.modify_time
  is '����ʱ��';
comment on column WII_NURSING_REMIND_EXEC_BAC.plan_time_start
  is '�ƻ�ִ�п�ʼʱ��';
comment on column WII_NURSING_REMIND_EXEC_BAC.reminder_time
  is '����ʱ��';
comment on column WII_NURSING_REMIND_EXEC_BAC.plan_delete
  is '�ƻ�ɾ��(1ɾ��0δɾ��)';
comment on column WII_NURSING_REMIND_EXEC_BAC.plan_time_end
  is '�ƻ�ִ�н���ʱ��';
comment on column WII_NURSING_REMIND_EXEC_BAC.cancel_reason
  is 'ȡ��ԭ��';
comment on column WII_NURSING_REMIND_EXEC_BAC.remark
  is 'ִ�б�ע';
comment on column WII_NURSING_REMIND_EXEC_BAC.unique_id
  is '����ΨһID';
comment on column WII_NURSING_REMIND_EXEC_BAC.patient_id
  is '����Id';
comment on column WII_NURSING_REMIND_EXEC_BAC.allday
  is '�Ƿ�ȫ�� 0:�� 1����';

prompt
prompt Creating table WII_NURSING_ROUNDS
prompt =================================
prompt
create table WII_NURSING_ROUNDS
(
  rounds_code  VARCHAR2(20),
  rounds_type  VARCHAR2(20),
  operator     VARCHAR2(30),
  operate_time DATE,
  creator      VARCHAR2(20),
  create_time  DATE default sysdate,
  modifier     VARCHAR2(20),
  modify_time  DATE,
  unique_id    VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_NURSING_ROUNDS.rounds_code
  is 'Ѳ�ӻ��ߡ�·����Code';
comment on column WII_NURSING_ROUNDS.rounds_type
  is 'Ѳ������';
comment on column WII_NURSING_ROUNDS.operator
  is 'Ѳ����';
comment on column WII_NURSING_ROUNDS.operate_time
  is 'Ѳ��ʱ��';
comment on column WII_NURSING_ROUNDS.creator
  is '������';
comment on column WII_NURSING_ROUNDS.create_time
  is '����ʱ��';
comment on column WII_NURSING_ROUNDS.modifier
  is '�޸���';
comment on column WII_NURSING_ROUNDS.modify_time
  is '�޸�ʱ��';
comment on column WII_NURSING_ROUNDS.unique_id
  is '����Ψһid';

prompt
prompt Creating table WII_NURSING_SCORE_CONFIG
prompt =======================================
prompt
create table WII_NURSING_SCORE_CONFIG
(
  ward_code    VARCHAR2(20),
  score_code   VARCHAR2(50),
  nursing_code VARCHAR2(20),
  creator      NVARCHAR2(20),
  create_time  DATE default sysdate,
  modifier     NVARCHAR2(20),
  modify_time  DATE,
  unique_id    VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_NURSING_SCORE_CONFIG.ward_code
  is '�������';
comment on column WII_NURSING_SCORE_CONFIG.score_code
  is '���ֱ��';
comment on column WII_NURSING_SCORE_CONFIG.nursing_code
  is '������Ŀ���';
comment on column WII_NURSING_SCORE_CONFIG.creator
  is '������';
comment on column WII_NURSING_SCORE_CONFIG.create_time
  is '����ʱ��';
comment on column WII_NURSING_SCORE_CONFIG.modifier
  is '�޸���';
comment on column WII_NURSING_SCORE_CONFIG.modify_time
  is '�޸�ʱ��';
comment on column WII_NURSING_SCORE_CONFIG.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_NUTRI_CN_DIC
prompt ===============================
prompt
create table WII_NUTRI_CN_DIC
(
  nutri_cn_code     VARCHAR2(30),
  nutri_cn_name_c   NVARCHAR2(30),
  med_route_ciscode VARCHAR2(20),
  unit              VARCHAR2(20),
  l_kcal            NUMBER(6,2),
  l_protein         NUMBER(6,2),
  l_lipid           NUMBER(6,2),
  l_ch              NUMBER(6,2),
  pack_quan         NUMBER(6,2),
  input_code        VARCHAR2(30),
  memo              NVARCHAR2(100),
  valid             VARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_NUTRI_CN_DIC.nutri_cn_code
  is '����Ӫ���Ƽ�����';
comment on column WII_NUTRI_CN_DIC.nutri_cn_name_c
  is '����Ӫ���Ƽ���������';
comment on column WII_NUTRI_CN_DIC.med_route_ciscode
  is '��ҩ;��';
comment on column WII_NUTRI_CN_DIC.unit
  is '������λ';
comment on column WII_NUTRI_CN_DIC.l_kcal
  is 'ÿ����ǧ������ֵ��Kcal)';
comment on column WII_NUTRI_CN_DIC.l_protein
  is 'ÿ�������ٿ˵����ʣ�g)';
comment on column WII_NUTRI_CN_DIC.l_lipid
  is 'ÿ�������ٿ�֬����g)';
comment on column WII_NUTRI_CN_DIC.l_ch
  is 'ÿ�������ٿ�̼ˮ�����g)';
comment on column WII_NUTRI_CN_DIC.pack_quan
  is '��װ������';
comment on column WII_NUTRI_CN_DIC.input_code
  is '��������ĸ(������룩';
comment on column WII_NUTRI_CN_DIC.memo
  is '��ע���ص�������';
comment on column WII_NUTRI_CN_DIC.valid
  is '��Ч�ԣ�0-��Ч��1-��Ч��';

prompt
prompt Creating table WII_NUTRI_CW_DIC
prompt ===============================
prompt
create table WII_NUTRI_CW_DIC
(
  nutri_cw_code     VARCHAR2(30),
  nutri_cw_name_c   NVARCHAR2(30),
  nutri_cw_name_e   VARCHAR2(30),
  nutri_cw_type     VARCHAR2(20),
  med_route_ciscode VARCHAR2(20),
  unit              VARCHAR2(20),
  concentration     VARCHAR2(20),
  l_kcal            NUMBER(6,2),
  l_nitrogen        NUMBER(6,2),
  ph                VARCHAR2(20),
  osmotic_p         VARCHAR2(20),
  pack_quan         NUMBER(6,2),
  input_code        VARCHAR2(30),
  memo              NVARCHAR2(100),
  valid             VARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_NUTRI_CW_DIC.nutri_cw_code
  is '����Ӫ���Ƽ�����';
comment on column WII_NUTRI_CW_DIC.nutri_cw_name_c
  is '����Ӫ���Ƽ���������';
comment on column WII_NUTRI_CW_DIC.nutri_cw_name_e
  is '����Ӫ���Ƽ�Ӣ������';
comment on column WII_NUTRI_CW_DIC.nutri_cw_type
  is '����Ӫ���Ƽ����� ��A-������ע��Һ ��B-֬�����ࣩ';
comment on column WII_NUTRI_CW_DIC.med_route_ciscode
  is '��ҩ;��';
comment on column WII_NUTRI_CW_DIC.unit
  is '������λ';
comment on column WII_NUTRI_CW_DIC.concentration
  is 'Ũ��';
comment on column WII_NUTRI_CW_DIC.l_kcal
  is 'ÿ����ǧ������ֵ��Kcal)';
comment on column WII_NUTRI_CW_DIC.l_nitrogen
  is 'ÿ�������ٿ˵���g)';
comment on column WII_NUTRI_CW_DIC.ph
  is 'PHֵ��mOsm��';
comment on column WII_NUTRI_CW_DIC.osmotic_p
  is '��͸ѹ(mOsm/kg.H2O)';
comment on column WII_NUTRI_CW_DIC.pack_quan
  is '��װ������';
comment on column WII_NUTRI_CW_DIC.input_code
  is '��������ĸ(������룩';
comment on column WII_NUTRI_CW_DIC.memo
  is '��ע���ص�������';
comment on column WII_NUTRI_CW_DIC.valid
  is '��Ч�ԣ�0-��Ч��1-��Ч��';

prompt
prompt Creating table WII_NUTRI_FOOD_DIC
prompt =================================
prompt
create table WII_NUTRI_FOOD_DIC
(
  code          VARCHAR2(100),
  name          VARCHAR2(300),
  weight        NUMBER(11,2),
  weight_unit   VARCHAR2(20),
  water_content NUMBER(11,2)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_NUTRI_FOOD_DIC.code
  is 'ʳ�����';
comment on column WII_NUTRI_FOOD_DIC.name
  is 'ʳ������';
comment on column WII_NUTRI_FOOD_DIC.weight
  is '����';
comment on column WII_NUTRI_FOOD_DIC.weight_unit
  is '������λ';
comment on column WII_NUTRI_FOOD_DIC.water_content
  is '�����еĺ�ˮ������λ��ml��';

prompt
prompt Creating table WII_OPERATION_ANESTHESIA_EVENT
prompt =============================================
prompt
create table WII_OPERATION_ANESTHESIA_EVENT
(
  patient_id         VARCHAR2(20),
  visit_id           NUMBER(2),
  oper_id            NUMBER(2),
  item_no            NUMBER(3),
  item_class         VARCHAR2(1),
  event_no           NUMBER(3),
  item_name          NVARCHAR2(100),
  item_code          VARCHAR2(16),
  item_spec          VARCHAR2(20),
  dosage_units       VARCHAR2(8),
  dosage             NUMBER(8,4),
  administrator      VARCHAR2(8),
  start_time         DATE,
  end_date           DATE,
  bill_indicator     NUMBER(1),
  durative_indicator NUMBER(1),
  method             VARCHAR2(16),
  perform_speed      NUMBER(8,4),
  speed_unit         VARCHAR2(10),
  parent_item_no     NUMBER(3),
  event_attr         VARCHAR2(10),
  concentration      NUMBER(8,4),
  concentration_unit VARCHAR2(10),
  bill_attr          NUMBER(1),
  supplier_name      VARCHAR2(60),
  method_parent_no   NUMBER(3),
  creator            NVARCHAR2(20),
  create_time        DATE default sysdate,
  modifier           NVARCHAR2(20),
  modify_time        DATE,
  unique_id          VARCHAR2(50) default sys_guid(),
  inpatient_visitid  NVARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_OPERATION_ANESTHESIA_EVENT.unique_id
  is '����ΨһID';
comment on column WII_OPERATION_ANESTHESIA_EVENT.inpatient_visitid
  is 'סԺ���';

prompt
prompt Creating table WII_OPERATION_BADEVENT
prompt =====================================
prompt
create table WII_OPERATION_BADEVENT
(
  patient_id        VARCHAR2(32),
  visit_id          NUMBER(4),
  oper_id           NUMBER(4),
  event_type        VARCHAR2(16),
  event1            VARCHAR2(128),
  event2            VARCHAR2(512),
  event3            VARCHAR2(1024),
  reason1           VARCHAR2(256),
  level1            VARCHAR2(16),
  reason2           VARCHAR2(256),
  level2            VARCHAR2(16),
  reason3           VARCHAR2(256),
  level3            VARCHAR2(16),
  reason4           VARCHAR2(256),
  level4            VARCHAR2(16),
  reason5           VARCHAR2(256),
  level5            VARCHAR2(16),
  reason6           VARCHAR2(256),
  level6            VARCHAR2(16),
  reason7           VARCHAR2(256),
  level7            VARCHAR2(16),
  reason8           VARCHAR2(256),
  level8            VARCHAR2(16),
  reason9           VARCHAR2(256),
  level9            VARCHAR2(16),
  reason10          VARCHAR2(256),
  level10           VARCHAR2(16),
  reason11          VARCHAR2(256),
  level11           VARCHAR2(16),
  reason12          VARCHAR2(256),
  level12           VARCHAR2(16),
  reason13          VARCHAR2(256),
  level13           VARCHAR2(16),
  reason14          VARCHAR2(256),
  level14           VARCHAR2(16),
  reason15          VARCHAR2(256),
  level15           VARCHAR2(16),
  reason16          VARCHAR2(256),
  level16           VARCHAR2(16),
  reason17          VARCHAR2(256),
  level17           VARCHAR2(16),
  reason18          VARCHAR2(256),
  level18           VARCHAR2(16),
  reason19          VARCHAR2(256),
  level19           VARCHAR2(16),
  reason20          VARCHAR2(256),
  level20           VARCHAR2(16),
  reason21          VARCHAR2(256),
  level21           VARCHAR2(16),
  reason22          VARCHAR2(256),
  level22           VARCHAR2(16),
  reason23          VARCHAR2(256),
  level23           VARCHAR2(16),
  reason24          VARCHAR2(256),
  level24           VARCHAR2(16),
  reason25          VARCHAR2(256),
  level25           VARCHAR2(16),
  reason26          VARCHAR2(256),
  level26           VARCHAR2(16),
  reason27          VARCHAR2(256),
  level27           VARCHAR2(16),
  reason28          VARCHAR2(256),
  level28           VARCHAR2(16),
  reason29          VARCHAR2(256),
  level29           VARCHAR2(16),
  reason30          VARCHAR2(256),
  level30           VARCHAR2(16),
  reason31          VARCHAR2(256),
  level31           VARCHAR2(16),
  reason32          VARCHAR2(256),
  level32           VARCHAR2(16),
  reason33          VARCHAR2(256),
  level33           VARCHAR2(16),
  reason34          VARCHAR2(256),
  level34           VARCHAR2(16),
  reason35          VARCHAR2(256),
  level35           VARCHAR2(16),
  reason36          VARCHAR2(256),
  level36           VARCHAR2(16),
  reason37          VARCHAR2(256),
  level37           VARCHAR2(16),
  reason38          VARCHAR2(256),
  level38           VARCHAR2(16),
  reason39          VARCHAR2(256),
  level39           VARCHAR2(16),
  reason40          VARCHAR2(256),
  level40           VARCHAR2(16),
  reason41          VARCHAR2(256),
  level41           VARCHAR2(16),
  reason42          VARCHAR2(256),
  level42           VARCHAR2(16),
  reason43          VARCHAR2(256),
  level43           VARCHAR2(16),
  reason44          VARCHAR2(256),
  level44           VARCHAR2(16),
  reason45          VARCHAR2(256),
  level45           VARCHAR2(16),
  reason46          VARCHAR2(256),
  level46           VARCHAR2(16),
  reason47          VARCHAR2(256),
  level47           VARCHAR2(16),
  reason48          VARCHAR2(256),
  level48           VARCHAR2(16),
  reason49          VARCHAR2(256),
  level49           VARCHAR2(16),
  reason50          VARCHAR2(256),
  level50           VARCHAR2(16),
  creator           NVARCHAR2(20),
  create_time       DATE default sysdate,
  modifier          NVARCHAR2(20),
  modify_time       DATE,
  unique_id         VARCHAR2(50) default sys_guid(),
  inpatient_visitid NVARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_OPERATION_BADEVENT.unique_id
  is '����ΨһID';
comment on column WII_OPERATION_BADEVENT.inpatient_visitid
  is 'סԺ���';

prompt
prompt Creating table WII_OPERATION_CONFIG
prompt ===================================
prompt
create table WII_OPERATION_CONFIG
(
  parakey     VARCHAR2(50),
  paravalue   BLOB,
  creator     NVARCHAR2(20),
  create_time DATE default sysdate,
  modifier    NVARCHAR2(20),
  modify_time DATE,
  unique_id   VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_OPERATION_CONFIG.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_OPERATION_CUSTOM_DATA
prompt ========================================
prompt
create table WII_OPERATION_CUSTOM_DATA
(
  patient_id        VARCHAR2(20),
  visit_id          NUMBER(2),
  oper_id           NUMBER(2),
  item_name         NVARCHAR2(60),
  item_value        NVARCHAR2(1500),
  creator           NVARCHAR2(20),
  create_time       DATE default sysdate,
  modifier          NVARCHAR2(20),
  modify_time       DATE,
  unique_id         VARCHAR2(50) default sys_guid(),
  inpatient_visitid NVARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_OPERATION_CUSTOM_DATA.patient_id
  is '����ID';
comment on column WII_OPERATION_CUSTOM_DATA.visit_id
  is 'סԺID';
comment on column WII_OPERATION_CUSTOM_DATA.oper_id
  is '����ID';
comment on column WII_OPERATION_CUSTOM_DATA.item_name
  is '��Ŀ����';
comment on column WII_OPERATION_CUSTOM_DATA.item_value
  is '��Ŀ����';
comment on column WII_OPERATION_CUSTOM_DATA.unique_id
  is '����ΨһID';
comment on column WII_OPERATION_CUSTOM_DATA.inpatient_visitid
  is 'סԺ���';

prompt
prompt Creating table WII_OPERATION_EMR_ARCHIVE
prompt ========================================
prompt
create table WII_OPERATION_EMR_ARCHIVE
(
  patient_id        VARCHAR2(20),
  visit_id          NUMBER(2),
  mr_class          VARCHAR2(10),
  mr_sub_class      VARCHAR2(100),
  archive_key       VARCHAR2(20),
  emr_file_index    NUMBER(3),
  archive_times     NUMBER(2),
  topic             VARCHAR2(40),
  emr_file_name     VARCHAR2(256),
  emr_type          VARCHAR2(10),
  archive_date_time DATE,
  archive_type      VARCHAR2(10),
  archive_status    VARCHAR2(10),
  emr_owner         VARCHAR2(16),
  operator          VARCHAR2(16),
  archive_pc        VARCHAR2(80),
  archive_mode      VARCHAR2(10),
  archive_access    VARCHAR2(256),
  memo              VARCHAR2(100),
  creator           NVARCHAR2(20),
  create_time       DATE default sysdate,
  modifier          NVARCHAR2(20),
  modify_time       DATE,
  unique_id         VARCHAR2(50) default sys_guid(),
  inpatient_visitid NVARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_OPERATION_EMR_ARCHIVE.unique_id
  is '����ΨһID';
comment on column WII_OPERATION_EMR_ARCHIVE.inpatient_visitid
  is 'סԺ���';

prompt
prompt Creating table WII_OPERATION_MASTER
prompt ===================================
prompt
create table WII_OPERATION_MASTER
(
  patient_id                     VARCHAR2(20),
  visit_id                       NUMBER(2),
  oper_id                        NUMBER(2),
  dept_stayed                    VARCHAR2(8),
  operating_room                 VARCHAR2(8),
  operating_room_no              VARCHAR2(8),
  diag_before_operation          VARCHAR2(80),
  patient_condition              VARCHAR2(100),
  operation_scale                VARCHAR2(2),
  diag_after_operation           VARCHAR2(80),
  emergency_indicator            NUMBER(1),
  isolation_indicator            NUMBER(1),
  operation_class                VARCHAR2(1),
  operating_dept                 VARCHAR2(8),
  surgeon                        VARCHAR2(20),
  first_assistant                VARCHAR2(20),
  second_assistant               VARCHAR2(20),
  third_assistant                VARCHAR2(20),
  fourth_assistant               VARCHAR2(20),
  anesthesia_method              VARCHAR2(60),
  anesthesia_doctor              VARCHAR2(20),
  anesthesia_assistant           VARCHAR2(20),
  blood_tran_doctor              VARCHAR2(20),
  first_operation_nurse          VARCHAR2(20),
  second_operation_nurse         VARCHAR2(20),
  first_supply_nurse             VARCHAR2(20),
  second_supply_nurse            VARCHAR2(20),
  nurse_shift_indicator          NUMBER(1),
  start_date_time                DATE,
  end_date_time                  DATE,
  satisfaction_degree            NUMBER(1),
  smooth_indicator               NUMBER(1),
  in_fluids_amount               NUMBER(6),
  out_fluids_amount              NUMBER(6),
  blood_lossed                   NUMBER(6),
  blood_transfered               NUMBER(6),
  entered_by                     VARCHAR2(8),
  third_supply_nurse             VARCHAR2(8),
  order_transfer                 NUMBER(1),
  charge_transfer                NUMBER(1),
  end_indicator                  NUMBER(1),
  reck_group                     VARCHAR2(8),
  oper_status                    NUMBER(2),
  second_anesthesia_assistant    VARCHAR2(20),
  third_anesthesia_assistant     VARCHAR2(20),
  fourth_anesthesia_assistant    VARCHAR2(20),
  operation_position             VARCHAR2(16),
  operation_equip_indicator      NUMBER(1),
  second_anesthesia_doctor       VARCHAR2(20),
  third_anesthesia_doctor        VARCHAR2(20),
  other_in_amount                NUMBER(6),
  other_out_amount               NUMBER(6),
  in_date_time                   DATE,
  out_date_time                  DATE,
  reserved1                      VARCHAR2(20),
  blood_whole_self               NUMBER(6),
  blood_whole                    NUMBER(6),
  blood_rbc                      NUMBER(6),
  blood_plasm                    NUMBER(6),
  blood_other                    NUMBER(6),
  reserved2                      VARCHAR2(20),
  special_equipment              VARCHAR2(40),
  special_infect                 VARCHAR2(40),
  hepatitis_indicator            NUMBER(1),
  anes_start_date_time           DATE,
  return_date_time               DATE,
  sequence                       NUMBER(2),
  in_pacu_date_time              DATE,
  out_pacu_date_time             DATE,
  operation_id                   VARCHAR2(18),
  reserved3                      VARCHAR2(100),
  reserved4                      VARCHAR2(20),
  reserved5                      VARCHAR2(20),
  reserved6                      VARCHAR2(20),
  reserved7                      VARCHAR2(20),
  reserved8                      VARCHAR2(20),
  reserved9                      DATE,
  reserved10                     DATE,
  reserved11                     NUMBER(6),
  reserved12                     NUMBER(6),
  blood_reuse                    NUMBER(6),
  self_blood                     NUMBER(6),
  entered_datetime               DATE,
  memo                           VARCHAR2(100),
  anesthesia_id                  VARCHAR2(20),
  xj                             NUMBER(3),
  ai                             NUMBER(1),
  at                             NUMBER(3),
  jt                             NUMBER(3),
  body_area                      VARCHAR2(10),
  gas_pipe                       VARCHAR2(60),
  pat_leave_show                 VARCHAR2(20),
  whole_anes                     VARCHAR2(30),
  stop_anes_area                 VARCHAR2(30),
  stop_anes_area_med             VARCHAR2(200),
  hole_piple_anes                VARCHAR2(30),
  stop_anes_area_tech            VARCHAR2(40),
  pin_size                       VARCHAR2(10),
  piple_up                       VARCHAR2(10),
  piple_down                     VARCHAR2(10),
  irritate_nerve                 VARCHAR2(20),
  anes_range                     VARCHAR2(20),
  bak_med                        VARCHAR2(200),
  watch_anes                     VARCHAR2(60),
  all_anes_med_lead1             VARCHAR2(200),
  all_anes_med_lead2             VARCHAR2(200),
  all_anes_med_keep1             VARCHAR2(200),
  all_anes_med_keep2             VARCHAR2(200),
  chest_water                    VARCHAR2(10),
  abdomen_water                  VARCHAR2(10),
  inquiry_before_date            DATE,
  inquiry_after_date             DATE,
  third_operation_nurse          VARCHAR2(8),
  pacu_doctor                    VARCHAR2(20),
  water_jt1                      NUMBER(6),
  water_jt2                      NUMBER(6),
  blood_xb                       NUMBER(6),
  cool_thing                     NUMBER(6),
  cry_wather                     NUMBER(6),
  red_blood                      NUMBER(6),
  blood_amount                   NUMBER(6),
  scheduled_date_time            DATE,
  bed_no                         VARCHAR2(20),
  req_date_time                  DATE,
  qiekou_class                   VARCHAR2(20),
  qiekou_number                  NUMBER(6),
  memo1                          VARCHAR2(200),
  operation_name                 VARCHAR2(80),
  men_zhen                       VARCHAR2(20),
  anesthesia_result              VARCHAR2(20),
  simple_sick                    VARCHAR2(20),
  isolation_need                 VARCHAR2(20),
  danbingzhong                   VARCHAR2(20),
  yibao                          VARCHAR2(20),
  first_shift_supply_nurse       VARCHAR2(8),
  first_shift_operation_nurse    VARCHAR2(8),
  first_shift_supply_datetime    DATE,
  first_shift_operation_datetime DATE,
  anes_start_time                DATE,
  anes_end_time                  DATE,
  induce_start_time              DATE,
  induce_end_time                DATE,
  pacu_start_time                DATE,
  pacu_end_time                  DATE,
  done_date_time                 DATE,
  cancel_date_time               DATE,
  analgesic_pumps                VARCHAR2(100),
  open_drop_time                 DATE,
  anes_prepare_end_time          DATE,
  three_check_time               DATE,
  anes_operate_end_time          DATE,
  surgery_prapare_time           DATE,
  anesthesia_nurse               VARCHAR2(20),
  second_anesthesia_nurse        VARCHAR2(20),
  third_anesthesia_nurse         VARCHAR2(20),
  creator                        NVARCHAR2(100),
  create_time                    DATE default sysdate,
  modifier                       NVARCHAR2(20),
  modify_time                    DATE,
  unique_id                      VARCHAR2(50) default sys_guid(),
  inpatient_visitid              NVARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_OPERATION_MASTER.unique_id
  is '����ΨһID';
comment on column WII_OPERATION_MASTER.inpatient_visitid
  is 'סԺ���';

prompt
prompt Creating table WII_OPERATION_SCHEDULE
prompt =====================================
prompt
create table WII_OPERATION_SCHEDULE
(
  patient_id                  VARCHAR2(20),
  visit_id                    NUMBER(2),
  schedule_id                 NUMBER(2),
  dept_stayed                 VARCHAR2(16),
  bed_no                      VARCHAR2(20),
  scheduled_date_time         DATE,
  operating_room              VARCHAR2(16),
  operating_room_no           VARCHAR2(8),
  sequence                    NUMBER(2),
  diag_before_operation       VARCHAR2(80),
  patient_condition           VARCHAR2(100),
  operation_scale             VARCHAR2(2),
  isolation_indicator         NUMBER(1),
  operating_dept              VARCHAR2(16),
  surgeon                     VARCHAR2(20),
  first_assistant             VARCHAR2(20),
  second_assistant            VARCHAR2(20),
  third_assistant             VARCHAR2(20),
  fourth_assistant            VARCHAR2(20),
  anesthesia_method           VARCHAR2(60),
  anesthesia_doctor           VARCHAR2(20),
  anesthesia_assistant        VARCHAR2(20),
  blood_tran_doctor           VARCHAR2(20),
  first_operation_nurse       VARCHAR2(20),
  second_operation_nurse      VARCHAR2(20),
  first_supply_nurse          VARCHAR2(20),
  second_supply_nurse         VARCHAR2(20),
  notes_on_operation          VARCHAR2(100),
  entered_by                  VARCHAR2(20),
  req_date_time               DATE,
  third_supply_nurse          VARCHAR2(20),
  ack_indicator               NUMBER(1),
  emergency_indicator         NUMBER(1),
  reck_group                  VARCHAR2(8),
  oper_id                     NUMBER(2),
  second_anesthesia_assistant VARCHAR2(20),
  third_anesthesia_assistant  VARCHAR2(20),
  fourth_anesthesia_assistant VARCHAR2(20),
  second_anesthesia_doctor    VARCHAR2(20),
  third_anesthesia_doctor     VARCHAR2(20),
  reserved1                   VARCHAR2(20),
  reserved2                   VARCHAR2(10),
  operation_position          VARCHAR2(32),
  special_equipment           VARCHAR2(40),
  special_infect              VARCHAR2(40),
  hepatitis_indicator         NUMBER(1),
  operation_id                VARCHAR2(18),
  reserved3                   VARCHAR2(100),
  reserved4                   VARCHAR2(20),
  reserved5                   VARCHAR2(20),
  reserved6                   VARCHAR2(20),
  reserved7                   VARCHAR2(20),
  reserved8                   VARCHAR2(200),
  reserved9                   DATE,
  reserved10                  DATE,
  reserved11                  NUMBER(6),
  reserved12                  NUMBER(6),
  third_operation_nurse       VARCHAR2(8),
  state                       NUMBER(2),
  operation_name              VARCHAR2(300),
  operating_time              DATE,
  anesthesia_nurse            VARCHAR2(20),
  second_anesthesia_nurse     VARCHAR2(20),
  third_anesthesia_nurse      VARCHAR2(20),
  creator                     NVARCHAR2(100),
  create_time                 DATE default sysdate,
  modifier                    NVARCHAR2(20),
  modify_time                 DATE,
  unique_id                   VARCHAR2(50) default sys_guid(),
  inpatient_visitid           NVARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_OPERATION_SCHEDULE.unique_id
  is '����ΨһID';
comment on column WII_OPERATION_SCHEDULE.inpatient_visitid
  is 'סԺ���';

prompt
prompt Creating table WII_OPERATION_SCHEDULE_BAK
prompt =========================================
prompt
create table WII_OPERATION_SCHEDULE_BAK
(
  patient_id                  VARCHAR2(20) not null,
  visit_id                    NUMBER(2) not null,
  schedule_id                 NUMBER(2) not null,
  dept_stayed                 VARCHAR2(16),
  bed_no                      VARCHAR2(20),
  scheduled_date_time         DATE,
  operating_room              VARCHAR2(16),
  operating_room_no           VARCHAR2(8),
  sequence                    NUMBER(2),
  diag_before_operation       VARCHAR2(80),
  patient_condition           VARCHAR2(100),
  operation_scale             VARCHAR2(2),
  isolation_indicator         NUMBER(1),
  operating_dept              VARCHAR2(16),
  surgeon                     VARCHAR2(20),
  first_assistant             VARCHAR2(20),
  second_assistant            VARCHAR2(20),
  third_assistant             VARCHAR2(20),
  fourth_assistant            VARCHAR2(20),
  anesthesia_method           VARCHAR2(60),
  anesthesia_doctor           VARCHAR2(20),
  anesthesia_assistant        VARCHAR2(20),
  blood_tran_doctor           VARCHAR2(20),
  first_operation_nurse       VARCHAR2(20),
  second_operation_nurse      VARCHAR2(20),
  first_supply_nurse          VARCHAR2(20),
  second_supply_nurse         VARCHAR2(20),
  notes_on_operation          VARCHAR2(100),
  entered_by                  VARCHAR2(20),
  req_date_time               DATE,
  third_supply_nurse          VARCHAR2(20),
  ack_indicator               NUMBER(1),
  emergency_indicator         NUMBER(1),
  reck_group                  VARCHAR2(8),
  oper_id                     NUMBER(2),
  second_anesthesia_assistant VARCHAR2(20),
  third_anesthesia_assistant  VARCHAR2(20),
  fourth_anesthesia_assistant VARCHAR2(20),
  second_anesthesia_doctor    VARCHAR2(20),
  third_anesthesia_doctor     VARCHAR2(20),
  reserved1                   VARCHAR2(20),
  reserved2                   VARCHAR2(10),
  operation_position          VARCHAR2(32),
  special_equipment           VARCHAR2(40),
  special_infect              VARCHAR2(40),
  hepatitis_indicator         NUMBER(1),
  operation_id                VARCHAR2(18),
  reserved3                   VARCHAR2(100),
  reserved4                   VARCHAR2(20),
  reserved5                   VARCHAR2(20),
  reserved6                   VARCHAR2(20),
  reserved7                   VARCHAR2(20),
  reserved8                   VARCHAR2(200),
  reserved9                   DATE,
  reserved10                  DATE,
  reserved11                  NUMBER(6),
  reserved12                  NUMBER(6),
  third_operation_nurse       VARCHAR2(8),
  state                       NUMBER(2),
  operation_name              VARCHAR2(300),
  operating_time              NUMBER(5),
  anesthesia_nurse            VARCHAR2(20),
  second_anesthesia_nurse     VARCHAR2(20),
  third_anesthesia_nurse      VARCHAR2(20),
  unique_id                   VARCHAR2(50) not null,
  creator                     NVARCHAR2(20),
  create_time                 DATE,
  modifier                    NVARCHAR2(20),
  modify_time                 DATE,
  inpatient_visitid           NVARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table WII_OPERATION_TRANS_EVENT
prompt ========================================
prompt
create table WII_OPERATION_TRANS_EVENT
(
  patientid         NVARCHAR2(20),
  inpatient_visitid NVARCHAR2(20),
  trans_type        NUMBER(2),
  time_point        DATE,
  creator           NVARCHAR2(20),
  create_time       DATE,
  modifier          NVARCHAR2(20),
  modify_time       DATE,
  unique_id         NVARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_OPERATION_TRANS_EVENT.patientid
  is '����ID';
comment on column WII_OPERATION_TRANS_EVENT.inpatient_visitid
  is 'סԺ���';
comment on column WII_OPERATION_TRANS_EVENT.trans_type
  is '��ת���� 0:�������� 1�������';
comment on column WII_OPERATION_TRANS_EVENT.time_point
  is 'ʱ���';
comment on column WII_OPERATION_TRANS_EVENT.creator
  is '������';
comment on column WII_OPERATION_TRANS_EVENT.create_time
  is '����ʱ��';
comment on column WII_OPERATION_TRANS_EVENT.modifier
  is '�޸���';
comment on column WII_OPERATION_TRANS_EVENT.modify_time
  is '�޸�ʱ��';
comment on column WII_OPERATION_TRANS_EVENT.unique_id
  is '����Ψһid';

prompt
prompt Creating table WII_ORDERS_EXEC_EVENT
prompt ====================================
prompt
create table WII_ORDERS_EXEC_EVENT
(
  patient_id         VARCHAR2(20),
  order_no           VARCHAR2(20),
  order_sub_no       NUMBER(12),
  default_time       DATE,
  execute_time_point DATE,
  order_item_code    VARCHAR2(20),
  order_key          VARCHAR2(50),
  order_text         NVARCHAR2(200),
  speed              NUMBER(14,4),
  operator           VARCHAR2(30),
  operate_time       DATE,
  duty_nurse         VARCHAR2(8),
  verify_nurse       VARCHAR2(8),
  memo               NVARCHAR2(400),
  memo_time_point    DATE,
  execute_mathod     VARCHAR2(20),
  skinresponse       VARCHAR2(20),
  injectionsite      VARCHAR2(40),
  event_type         NUMBER(2),
  creator            NVARCHAR2(20),
  create_time        DATE default sysdate,
  execute_dosage     NUMBER(14,4),
  speed_unit         VARCHAR2(10),
  cause              NVARCHAR2(200),
  pharm_speed        NUMBER(14,4),
  pharm_speed_unit   VARCHAR2(20),
  modifier           NVARCHAR2(20),
  modify_time        DATE,
  unique_id          VARCHAR2(50) default sys_guid(),
  dosage_unit        VARCHAR2(10),
  data_source        VARCHAR2(100),
  serial_no          NVARCHAR2(50),
  save_nursing_memo  NUMBER(3)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_ORDERS_EXEC_EVENT.patient_id
  is '�����ˣ���ţ�Ψһ��ʶ';
comment on column WII_ORDERS_EXEC_EVENT.order_no
  is '��ҽ�����';
comment on column WII_ORDERS_EXEC_EVENT.order_sub_no
  is '����ҽ�����';
comment on column WII_ORDERS_EXEC_EVENT.default_time
  is '��Ĭ��ִ��ʱ�䣨��֮ǰ��ֳ�ICU order�ж�Ӧ�ϣ�';
comment on column WII_ORDERS_EXEC_EVENT.execute_time_point
  is '��ʵ��ִ��ʱ��';
comment on column WII_ORDERS_EXEC_EVENT.order_item_code
  is 'ҽ����Ŀ����';
comment on column WII_ORDERS_EXEC_EVENT.order_key
  is 'ҽ��Ψһ��ʶ';
comment on column WII_ORDERS_EXEC_EVENT.order_text
  is '��ҽ������';
comment on column WII_ORDERS_EXEC_EVENT.speed
  is '������';
comment on column WII_ORDERS_EXEC_EVENT.operator
  is '��������';
comment on column WII_ORDERS_EXEC_EVENT.operate_time
  is '������ʱ��';
comment on column WII_ORDERS_EXEC_EVENT.duty_nurse
  is '�����λ�ʿ';
comment on column WII_ORDERS_EXEC_EVENT.verify_nurse
  is '����˻�ʿ';
comment on column WII_ORDERS_EXEC_EVENT.memo
  is '����ע';
comment on column WII_ORDERS_EXEC_EVENT.memo_time_point
  is '����עʱ���';
comment on column WII_ORDERS_EXEC_EVENT.execute_mathod
  is '��ִ�з���';
comment on column WII_ORDERS_EXEC_EVENT.skinresponse
  is '��Ƥ����Ӧ';
comment on column WII_ORDERS_EXEC_EVENT.injectionsite
  is 'ע�䲿λ';
comment on column WII_ORDERS_EXEC_EVENT.event_type
  is 'ִ��״̬��1 ��ʼ��2 ������20 ��ͣ��21��ֹ��12���ٱ����11 ������10 ������3��ʱ��ɡ�22���ࡢ13���������,���ڼ�¼ҽ��ִ�е�ʵ�ʲ�������';
comment on column WII_ORDERS_EXEC_EVENT.creator
  is '������';
comment on column WII_ORDERS_EXEC_EVENT.create_time
  is '����ʱ��';
comment on column WII_ORDERS_EXEC_EVENT.execute_dosage
  is 'ִ����';
comment on column WII_ORDERS_EXEC_EVENT.speed_unit
  is '���ٵ�λ';
comment on column WII_ORDERS_EXEC_EVENT.cause
  is 'ԭ��';
comment on column WII_ORDERS_EXEC_EVENT.pharm_speed
  is 'ҩ������';
comment on column WII_ORDERS_EXEC_EVENT.pharm_speed_unit
  is 'ҩ�����ٵ�λ';
comment on column WII_ORDERS_EXEC_EVENT.unique_id
  is '����ΨһID';
comment on column WII_ORDERS_EXEC_EVENT.dosage_unit
  is '������λ';
comment on column WII_ORDERS_EXEC_EVENT.data_source
  is 'ƥ���ҽ����';
comment on column WII_ORDERS_EXEC_EVENT.serial_no
  is 'HIS��ֺ���ˮ��';
comment on column WII_ORDERS_EXEC_EVENT.save_nursing_memo
  is '�Ƿ�д�뻤���ʩ��1���� 0��û�У�';

prompt
prompt Creating table WII_ORDERS_EXEC_EVENT_MODIFY
prompt ===========================================
prompt
create table WII_ORDERS_EXEC_EVENT_MODIFY
(
  patient_id         VARCHAR2(20),
  order_no           VARCHAR2(20),
  order_sub_no       NUMBER(12),
  default_time       DATE,
  execute_time_point DATE,
  order_item_code    VARCHAR2(20),
  order_key          VARCHAR2(50),
  order_text         NVARCHAR2(200),
  speed              NUMBER(14,4),
  operator           VARCHAR2(30),
  operate_time       DATE,
  duty_nurse         VARCHAR2(8),
  verify_nurse       VARCHAR2(8),
  memo               NVARCHAR2(400),
  memo_time_point    DATE,
  execute_mathod     VARCHAR2(20),
  skinresponse       VARCHAR2(20),
  injectionsite      VARCHAR2(40),
  event_type         NUMBER(2),
  creator            NVARCHAR2(20),
  create_time        DATE,
  value              NUMBER(14,4),
  speed_unit         VARCHAR2(10),
  cause              NVARCHAR2(200),
  pharm_speed        NUMBER(14,4),
  pharm_speed_unit   VARCHAR2(20),
  modifier           NVARCHAR2(20),
  modify_time        DATE,
  unique_id          VARCHAR2(50),
  log_type           NUMBER,
  log_remark         NVARCHAR2(500),
  data_source        VARCHAR2(100)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table WII_ORDERS_EXEC_EVENT_MODIFY
  is 'ҽ��ִ���¼��޸ı�';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.patient_id
  is '���ˣ���ţ�Ψһ��ʶ';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.order_no
  is 'ҽ�����';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.order_sub_no
  is '��ҽ�����';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.default_time
  is 'Ĭ��ִ��ʱ�䣨��֮ǰ��ֳ�ICU order�ж�Ӧ�ϣ�';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.execute_time_point
  is 'ʵ��ִ��ʱ��';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.order_item_code
  is 'ҽ����Ŀ����';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.order_key
  is 'ҽ��Ψһ��ʶ';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.order_text
  is 'ҽ������';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.speed
  is 'Һ������
';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.operator
  is '������';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.operate_time
  is '����ʱ��';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.duty_nurse
  is '���λ�ʿ';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.verify_nurse
  is '��˻�ʿ';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.memo
  is '��ע';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.memo_time_point
  is '��עʱ���';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.execute_mathod
  is 'ִ�з���';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.skinresponse
  is 'Ƥ����Ӧ';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.injectionsite
  is 'ע�䲿λ';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.event_type
  is 'ִ��״̬��1 ��ʼ��2 ������20 ��ͣ��21��ֹ��12���ٱ����11 ������10 ������3��ʱ��ɣ�,���ڼ�¼ҽ��ִ�е�ʵ�ʲ�������';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.creator
  is '������';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.create_time
  is '����ʱ��';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.value
  is 'ִ����';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.speed_unit
  is 'Һ�����ٵ�λ
';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.pharm_speed
  is 'ҩ������';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.pharm_speed_unit
  is 'ҩ�����ٵ�λ';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.unique_id
  is '����ΨһID';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.data_source
  is 'ƥ���ҽ����';

prompt
prompt Creating table WII_ORDERS_EXEC_ICU_RESCUE
prompt =========================================
prompt
create table WII_ORDERS_EXEC_ICU_RESCUE
(
  patient_id        VARCHAR2(20),
  order_no          VARCHAR2(20),
  order_sub_no      NUMBER(6),
  order_text        NVARCHAR2(200),
  administration    VARCHAR2(30),
  execute_dosage    NUMBER(14,4),
  dosage_units      VARCHAR2(8),
  operator          NVARCHAR2(30),
  operate_time      DATE,
  creator           NVARCHAR2(20),
  create_time       DATE default sysdate,
  is_group          VARCHAR2(8),
  pharmacy_code     VARCHAR2(30),
  pharmacy_his_code VARCHAR2(30),
  pharmacy_his_name VARCHAR2(200),
  modifier          NVARCHAR2(20),
  modify_time       DATE,
  unique_id         VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_ORDERS_EXEC_ICU_RESCUE.patient_id
  is '�����ˣ���ţ�Ψһ��ʶ';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.order_no
  is '��ҽ�����';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.order_sub_no
  is '����ҽ�����';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.order_text
  is '������ִ������';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.administration
  is '    ��ҩ;���ͷ���';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.execute_dosage
  is '��ʵ��ִ����';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.dosage_units
  is '    ������λ';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.operator
  is '��������';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.operate_time
  is '������ʱ��';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.creator
  is '    ������';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.create_time
  is '    ����ʱ��';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.is_group
  is '  �Ƿ����(��/��)';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.pharmacy_code
  is '����ҩƷ���';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.pharmacy_his_code
  is '����ҩƷHIS���';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.pharmacy_his_name
  is '����ҩƷHIS����';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_ORDERS_EXEC_PHARMACY
prompt =======================================
prompt
create table WII_ORDERS_EXEC_PHARMACY
(
  patient_id           VARCHAR2(20),
  order_no             VARCHAR2(20),
  order_sub_no         NUMBER(12),
  default_time         DATE,
  execute_time_point   DATE,
  order_text           NVARCHAR2(200),
  execute_dosage       NUMBER(14,4),
  operator             VARCHAR2(30),
  operate_time         DATE,
  duty_nurse           VARCHAR2(8),
  verify_nurse         VARCHAR2(8),
  memo                 NVARCHAR2(400),
  memo_time_point      DATE,
  execute_mathod       VARCHAR2(20),
  skinresponse         VARCHAR2(20),
  injectionsite        VARCHAR2(40),
  execute_compute_type NUMBER(1),
  creator              NVARCHAR2(20),
  create_time          DATE default sysdate,
  order_item_code      VARCHAR2(20),
  order_key            VARCHAR2(50),
  dosage_unit          VARCHAR2(10),
  modifier             NVARCHAR2(20),
  modify_time          DATE,
  unique_id            VARCHAR2(50) default sys_guid(),
  speed                NUMBER(14,4),
  speed_unit           VARCHAR2(40),
  pharm_speed          NUMBER(14,4),
  pharm_speed_unit     VARCHAR2(40)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 192K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_ORDERS_EXEC_PHARMACY.patient_id
  is '�����ˣ���ţ�Ψһ��ʶ';
comment on column WII_ORDERS_EXEC_PHARMACY.order_no
  is '��ҽ�����';
comment on column WII_ORDERS_EXEC_PHARMACY.order_sub_no
  is '����ҽ�����';
comment on column WII_ORDERS_EXEC_PHARMACY.default_time
  is '��Ĭ��ִ��ʱ�䣨��֮ǰ��ֳ�ICU order�ж�Ӧ�ϣ�';
comment on column WII_ORDERS_EXEC_PHARMACY.execute_time_point
  is '��ʵ��ִ��ʱ��';
comment on column WII_ORDERS_EXEC_PHARMACY.order_text
  is '��ҽ������';
comment on column WII_ORDERS_EXEC_PHARMACY.execute_dosage
  is '��ʵ��ִ����';
comment on column WII_ORDERS_EXEC_PHARMACY.operator
  is '��������';
comment on column WII_ORDERS_EXEC_PHARMACY.operate_time
  is '������ʱ��';
comment on column WII_ORDERS_EXEC_PHARMACY.duty_nurse
  is '�����λ�ʿ';
comment on column WII_ORDERS_EXEC_PHARMACY.verify_nurse
  is '����˻�ʿ';
comment on column WII_ORDERS_EXEC_PHARMACY.memo
  is '����ע';
comment on column WII_ORDERS_EXEC_PHARMACY.memo_time_point
  is '����עʱ���';
comment on column WII_ORDERS_EXEC_PHARMACY.execute_mathod
  is '��ִ�з���';
comment on column WII_ORDERS_EXEC_PHARMACY.skinresponse
  is '��Ƥ����Ӧ';
comment on column WII_ORDERS_EXEC_PHARMACY.injectionsite
  is 'ע�䲿λ';
comment on column WII_ORDERS_EXEC_PHARMACY.execute_compute_type
  is 'ִ�м��㷽ʽ��������ҩ���ٷ���������ҩ��������������ҩ����������';
comment on column WII_ORDERS_EXEC_PHARMACY.creator
  is '������';
comment on column WII_ORDERS_EXEC_PHARMACY.create_time
  is '����ʱ��';
comment on column WII_ORDERS_EXEC_PHARMACY.order_item_code
  is 'ҽ����Ŀ����';
comment on column WII_ORDERS_EXEC_PHARMACY.order_key
  is 'ҽ��Ψһ��ʶ';
comment on column WII_ORDERS_EXEC_PHARMACY.dosage_unit
  is '������λ';
comment on column WII_ORDERS_EXEC_PHARMACY.unique_id
  is '����ΨһID';
comment on column WII_ORDERS_EXEC_PHARMACY.speed
  is 'Һ������';
comment on column WII_ORDERS_EXEC_PHARMACY.speed_unit
  is 'Һ�����ٵ�λ';
comment on column WII_ORDERS_EXEC_PHARMACY.pharm_speed
  is 'ҩ������';
comment on column WII_ORDERS_EXEC_PHARMACY.pharm_speed_unit
  is 'ҩ�����ٵ�λ';

prompt
prompt Creating table WII_ORDERS_EXEC_SPLIT
prompt ====================================
prompt
create table WII_ORDERS_EXEC_SPLIT
(
  exec_seq          VARCHAR2(20),
  inpatient_visitid VARCHAR2(20),
  patient_id        VARCHAR2(20),
  order_no          VARCHAR2(20),
  default_time      DATE,
  exec_barcode_type VARCHAR2(2),
  creator           NVARCHAR2(20),
  create_time       DATE default sysdate,
  modifier          NVARCHAR2(20),
  modify_time       DATE,
  unique_id         VARCHAR2(50) default sys_guid(),
  order_sub_no      VARCHAR2(20) default 1 not null,
  repeat_indicator  NUMBER(1) default 0 not null
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_ORDERS_EXEC_SPLIT.exec_seq
  is 'ִ�е���ˮ��';
comment on column WII_ORDERS_EXEC_SPLIT.inpatient_visitid
  is 'סԺ��ˮ��';
comment on column WII_ORDERS_EXEC_SPLIT.patient_id
  is '����Ψһ��ʶ';
comment on column WII_ORDERS_EXEC_SPLIT.order_no
  is 'ҽ����';
comment on column WII_ORDERS_EXEC_SPLIT.default_time
  is 'Ĭ��ִ��ʱ��';
comment on column WII_ORDERS_EXEC_SPLIT.exec_barcode_type
  is 'ִ����������';
comment on column WII_ORDERS_EXEC_SPLIT.unique_id
  is '����ΨһID';
comment on column WII_ORDERS_EXEC_SPLIT.order_sub_no
  is 'ҽ���ӱ��';
comment on column WII_ORDERS_EXEC_SPLIT.repeat_indicator
  is '����ҽ����־';

prompt
prompt Creating table WII_ORDERS_HIS
prompt =============================
prompt
create table WII_ORDERS_HIS
(
  patient_id           VARCHAR2(20),
  inpatient_visitid    VARCHAR2(20),
  order_no             NUMBER(12),
  order_sub_no         NUMBER(12),
  ordering_dept        VARCHAR2(30),
  doctor               NVARCHAR2(30),
  stop_doctor          NVARCHAR2(30),
  nurse                NVARCHAR2(30),
  stop_nurse           NVARCHAR2(30),
  enter_time           DATE,
  stop_order_time      DATE,
  order_status         VARCHAR2(1),
  repeat_indicator     NUMBER(1),
  order_class          VARCHAR2(3),
  order_text           VARCHAR2(200),
  order_item_code      VARCHAR2(20),
  dosage               NUMBER(14,4),
  dosage_units         VARCHAR2(8),
  pham_std_code        VARCHAR2(14),
  pharm_spec           VARCHAR2(40),
  qty                  NUMBER(12,2),
  administration       VARCHAR2(30),
  start_time           DATE,
  stop_time            DATE,
  duration             NUMBER(8),
  duration_units       VARCHAR2(8),
  frequency            VARCHAR2(30),
  freq_interval        NUMBER(8),
  freq_interval_unit   VARCHAR2(8),
  dispense_memos       VARCHAR2(20),
  order_key            VARCHAR2(50),
  order_type           NUMBER(1),
  subtbl_flag          NUMBER(1),
  c_class              VARCHAR2(300),
  creator              NVARCHAR2(20),
  create_time          DATE default sysdate,
  invalid_time         DATE,
  modifier             NVARCHAR2(20),
  modify_time          DATE,
  unique_id            VARCHAR2(50) default sys_guid(),
  flag                 NVARCHAR2(2000),
  data_source          VARCHAR2(30),
  pharm_liquid_dosage  NUMBER(11,4),
  pharm_liquid_unit    VARCHAR2(50),
  pre_generation_count NUMBER(6),
  dosage_modified      VARCHAR2(100),
  frequency_modified   VARCHAR2(100)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_ORDERS_HIS.patient_id
  is '����Ψһ��ʶ��';
comment on column WII_ORDERS_HIS.inpatient_visitid
  is 'סԺ��ţ���ʾÿ�λ���סԺ��Ψһ�ţ�����סԺ��+סԺ������';
comment on column WII_ORDERS_HIS.order_no
  is 'ҽ�����';
comment on column WII_ORDERS_HIS.order_sub_no
  is 'ҽ�������(��Ӧ������м�������ţ�';
comment on column WII_ORDERS_HIS.ordering_dept
  is '��ҽ������';
comment on column WII_ORDERS_HIS.doctor
  is '��ҽ��ҽ��';
comment on column WII_ORDERS_HIS.stop_doctor
  is 'ͣҽ��ҽ��';
comment on column WII_ORDERS_HIS.nurse
  is '��ҽ��У�Ի�ʿ';
comment on column WII_ORDERS_HIS.stop_nurse
  is 'ͣҽ��У�Ի�ʿ';
comment on column WII_ORDERS_HIS.enter_time
  is '��ҽ��¼�����ڼ�ʱ��';
comment on column WII_ORDERS_HIS.stop_order_time
  is 'ͣҽ��¼�����ڼ�ʱ��';
comment on column WII_ORDERS_HIS.order_status
  is 'ҽ��״̬��1�¿���2У�飬3ִ�У�4���ϣ�5ֹͣ��';
comment on column WII_ORDERS_HIS.repeat_indicator
  is '����ҽ����־';
comment on column WII_ORDERS_HIS.order_class
  is 'ҽ����������ֵ䣭��ҩ����ҩ�ȣ�';
comment on column WII_ORDERS_HIS.order_text
  is 'ҽ������';
comment on column WII_ORDERS_HIS.order_item_code
  is 'ҽ����Ŀ����';
comment on column WII_ORDERS_HIS.dosage
  is 'ҩƷһ��ʹ�ü���';
comment on column WII_ORDERS_HIS.dosage_units
  is '������λ';
comment on column WII_ORDERS_HIS.pham_std_code
  is 'ҩƷ��׼����';
comment on column WII_ORDERS_HIS.pharm_spec
  is 'ҩƷ���';
comment on column WII_ORDERS_HIS.qty
  is '������һ��ʹ�ü����¼����������';
comment on column WII_ORDERS_HIS.administration
  is '��ҩ;���ͷ���';
comment on column WII_ORDERS_HIS.start_time
  is 'ҽ����ʼִ��ʱ��';
comment on column WII_ORDERS_HIS.stop_time
  is 'ҽ��ֹͣʱ��';
comment on column WII_ORDERS_HIS.duration
  is '����ʱ�� �����磬ÿ�ջ�ҩ��1�ܣ�';
comment on column WII_ORDERS_HIS.duration_units
  is '����ʱ�䵥λ���죬��..)';
comment on column WII_ORDERS_HIS.frequency
  is 'ִ��Ƶ������������tid,qd�ȣ�';
comment on column WII_ORDERS_HIS.freq_interval
  is 'Ƶ�ʼ��';
comment on column WII_ORDERS_HIS.freq_interval_unit
  is 'Ƶ�ʼ����λ(Сʱ���ֵȣ�';
comment on column WII_ORDERS_HIS.dispense_memos
  is '��ҩ����';
comment on column WII_ORDERS_HIS.order_key
  is 'ҽ��Ψһ��ʶ';
comment on column WII_ORDERS_HIS.order_type
  is '1ҩ��/2��ҩ��';
comment on column WII_ORDERS_HIS.subtbl_flag
  is '1����/0����';
comment on column WII_ORDERS_HIS.c_class
  is 'C��';
comment on column WII_ORDERS_HIS.creator
  is '������';
comment on column WII_ORDERS_HIS.create_time
  is '����ʱ��';
comment on column WII_ORDERS_HIS.invalid_time
  is 'ҽ������ʱ��';
comment on column WII_ORDERS_HIS.unique_id
  is '����ΨһID';
comment on column WII_ORDERS_HIS.flag
  is '���ҽ��ͬ������';
comment on column WII_ORDERS_HIS.data_source
  is '������Դ(1:��¼)';
comment on column WII_ORDERS_HIS.pharm_liquid_dosage
  is '����õ�ҩ��Һ������';
comment on column WII_ORDERS_HIS.pharm_liquid_unit
  is 'ҩ��Һ�嵥λ';
comment on column WII_ORDERS_HIS.pre_generation_count
  is 'Ԥ�����ɵ�����';
comment on column WII_ORDERS_HIS.dosage_modified
  is '������ļ������ԷֺŸ�����';
comment on column WII_ORDERS_HIS.frequency_modified
  is '�������Ƶ�Σ��ԷֺŸ�����';

prompt
prompt Creating table WII_ORDERS_HIS_1
prompt ===============================
prompt
create table WII_ORDERS_HIS_1
(
  patient_id         VARCHAR2(20) not null,
  inpatient_visitid  VARCHAR2(20),
  order_no           NUMBER(12) not null,
  order_sub_no       NUMBER(12) not null,
  ordering_dept      VARCHAR2(16),
  doctor             VARCHAR2(30),
  stop_doctor        VARCHAR2(30),
  nurse              VARCHAR2(30),
  stop_nurse         VARCHAR2(30),
  enter_time         DATE,
  stop_order_time    DATE,
  order_status       VARCHAR2(1),
  repeat_indicator   NUMBER(1),
  order_class        VARCHAR2(3),
  order_text         VARCHAR2(200),
  order_item_code    VARCHAR2(20),
  dosage             NUMBER(14,4),
  dosage_units       VARCHAR2(8),
  pham_std_code      VARCHAR2(14),
  pharm_spec         VARCHAR2(40),
  qty                NUMBER(12,4),
  administration     VARCHAR2(30),
  start_time         DATE,
  stop_time          DATE,
  duration           NUMBER(8),
  duration_units     VARCHAR2(8),
  frequency          VARCHAR2(30),
  freq_interval      NUMBER(8),
  freq_interval_unit VARCHAR2(8),
  dispense_memos     VARCHAR2(100),
  order_key          VARCHAR2(50),
  order_type         NUMBER(1),
  subtbl_flag        NUMBER(1),
  c_class            VARCHAR2(20),
  create_time        DATE,
  creator            VARCHAR2(30),
  invalid_time       DATE
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_ORDERS_HIS_1.order_type
  is '1ҩ��/2��ҩ��';
comment on column WII_ORDERS_HIS_1.subtbl_flag
  is '1����/0����';
comment on column WII_ORDERS_HIS_1.c_class
  is 'C��';
comment on column WII_ORDERS_HIS_1.create_time
  is '����ʱ��';
comment on column WII_ORDERS_HIS_1.creator
  is '������';
comment on column WII_ORDERS_HIS_1.invalid_time
  is 'ҽ������ʱ��';
alter table WII_ORDERS_HIS_1
  add constraint ORDER_HIS primary key (ORDER_NO, ORDER_SUB_NO)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WII_ORDERS_HIS_20160427
prompt ======================================
prompt
create table WII_ORDERS_HIS_20160427
(
  patient_id         VARCHAR2(20) not null,
  inpatient_visitid  VARCHAR2(20),
  order_no           NUMBER(12) not null,
  order_sub_no       NUMBER(12) not null,
  ordering_dept      VARCHAR2(16),
  doctor             NVARCHAR2(30),
  stop_doctor        NVARCHAR2(30),
  nurse              NVARCHAR2(30),
  stop_nurse         NVARCHAR2(30),
  enter_time         DATE,
  stop_order_time    DATE,
  order_status       VARCHAR2(1),
  repeat_indicator   NUMBER(1),
  order_class        VARCHAR2(3),
  order_text         VARCHAR2(200),
  order_item_code    VARCHAR2(20),
  dosage             NUMBER(14,4),
  dosage_units       VARCHAR2(8),
  pham_std_code      VARCHAR2(14),
  pharm_spec         VARCHAR2(40),
  qty                NUMBER(12,4),
  administration     VARCHAR2(30),
  start_time         DATE,
  stop_time          DATE,
  duration           NUMBER(8),
  duration_units     VARCHAR2(8),
  frequency          VARCHAR2(30),
  freq_interval      NUMBER(8),
  freq_interval_unit VARCHAR2(8),
  dispense_memos     VARCHAR2(100),
  order_key          VARCHAR2(50),
  order_type         NUMBER(1),
  subtbl_flag        NUMBER(1),
  c_class            VARCHAR2(20),
  create_time        DATE default sysdate,
  creator            NVARCHAR2(20),
  invalid_time       DATE,
  modifier           NVARCHAR2(20),
  modify_time        DATE
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_ORDERS_HIS_20160427.order_type
  is '1ҩ��/2��ҩ��';
comment on column WII_ORDERS_HIS_20160427.subtbl_flag
  is '1����/0����';
comment on column WII_ORDERS_HIS_20160427.c_class
  is 'C��';
comment on column WII_ORDERS_HIS_20160427.create_time
  is '����ʱ��';
comment on column WII_ORDERS_HIS_20160427.creator
  is '������';
comment on column WII_ORDERS_HIS_20160427.invalid_time
  is 'ҽ������ʱ��';

prompt
prompt Creating table WII_ORDERS_ICU
prompt =============================
prompt
create table WII_ORDERS_ICU
(
  patient_id          VARCHAR2(20),
  order_no            VARCHAR2(20),
  order_sub_no        VARCHAR2(20),
  default_time        DATE,
  ordering_dept       VARCHAR2(100),
  doctor              VARCHAR2(30),
  stop_doctor         VARCHAR2(30),
  nurse               VARCHAR2(30),
  stop_nurse          VARCHAR2(30),
  enter_time          DATE,
  stop_order_time     DATE,
  order_status        VARCHAR2(1),
  repeat_indicator    NUMBER(1),
  order_class         VARCHAR2(3),
  order_text          NVARCHAR2(200),
  order_item_code     VARCHAR2(20),
  dosage              NUMBER(14,4),
  dosage_units        VARCHAR2(8),
  pham_std_code       VARCHAR2(14),
  pharm_spec          VARCHAR2(40),
  qty                 NUMBER(10,2),
  administration      VARCHAR2(30),
  start_time          DATE,
  stop_time           DATE,
  duration            NUMBER(8),
  duration_units      VARCHAR2(8),
  frequency           VARCHAR2(30),
  freq_interval       NUMBER(8),
  freq_interval_unit  VARCHAR2(8),
  dispense_memos      VARCHAR2(20),
  order_abbr          VARCHAR2(200),
  order_attr          VARCHAR2(20),
  use_pump            NUMBER(1),
  execute_start_time  DATE,
  execute_end_time    DATE,
  icu_execute_status  NUMBER(1),
  injectionsite       NVARCHAR2(40),
  execute_mathod      VARCHAR2(50),
  operator            VARCHAR2(30),
  operate_time        DATE,
  memo                NVARCHAR2(400),
  memo_time_point     DATE,
  creator             NVARCHAR2(20),
  create_time         DATE default sysdate,
  order_key           VARCHAR2(50),
  shift_time          DATE,
  invalid_time        DATE,
  is_rescue           NUMBER(1),
  order_type          NUMBER(1),
  subtbl_flag         NUMBER(1),
  c_class             VARCHAR2(500),
  modifier            NVARCHAR2(20),
  modify_time         DATE,
  unique_id           VARCHAR2(50) default sys_guid(),
  barcode             VARCHAR2(50),
  first_default_time  DATE,
  complete_time       DATE,
  remain_dosage       NUMBER(14,4),
  all_dosage          NUMBER(14,4),
  serial_no           NVARCHAR2(50),
  origin_default_time DATE,
  cancel_reason       VARCHAR2(100)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 896K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_ORDERS_ICU.patient_id
  is '����Ψһ��ʶ��';
comment on column WII_ORDERS_ICU.order_no
  is 'ҽ�����

';
comment on column WII_ORDERS_ICU.order_sub_no
  is 'ҽ�������(��Ӧ������м�������ţ�
';
comment on column WII_ORDERS_ICU.default_time
  is 'Ĭ��ִ������ʱ��
';
comment on column WII_ORDERS_ICU.ordering_dept
  is '��ҽ������';
comment on column WII_ORDERS_ICU.doctor
  is '��ҽ��ҽ��';
comment on column WII_ORDERS_ICU.stop_doctor
  is 'ͣҽ��ҽ��';
comment on column WII_ORDERS_ICU.nurse
  is '��ҽ��У�Ի�ʿ';
comment on column WII_ORDERS_ICU.stop_nurse
  is 'ͣҽ��У�Ի�ʿ
';
comment on column WII_ORDERS_ICU.enter_time
  is '��ҽ��¼�����ڼ�ʱ��
';
comment on column WII_ORDERS_ICU.stop_order_time
  is 'ͣҽ��¼�����ڼ�ʱ��
';
comment on column WII_ORDERS_ICU.order_status
  is 'ҽ��״���¿���У�飬ִ�У����ϣ�ֹͣ��';
comment on column WII_ORDERS_ICU.repeat_indicator
  is '����ҽ����־
';
comment on column WII_ORDERS_ICU.order_class
  is 'ҽ����������ֵ䣭��ҩ����ҩ�ȣ�';
comment on column WII_ORDERS_ICU.order_text
  is 'ҽ������
';
comment on column WII_ORDERS_ICU.order_item_code
  is 'ҽ����Ŀ����
';
comment on column WII_ORDERS_ICU.dosage
  is 'ҩƷһ��ʹ�ü���';
comment on column WII_ORDERS_ICU.dosage_units
  is '������λ
';
comment on column WII_ORDERS_ICU.pham_std_code
  is 'ҩƷ��׼����
';
comment on column WII_ORDERS_ICU.pharm_spec
  is 'ҩƷ���
';
comment on column WII_ORDERS_ICU.qty
  is '������һ��ʹ�ü����¼����������
';
comment on column WII_ORDERS_ICU.administration
  is '��ҩ;���ͷ���
';
comment on column WII_ORDERS_ICU.start_time
  is 'ҽ����ʼִ��ʱ��
';
comment on column WII_ORDERS_ICU.stop_time
  is 'ҽ��ֹͣʱ��
';
comment on column WII_ORDERS_ICU.duration
  is '����ʱ�� �����磬ÿ�ջ�ҩ��1�ܣ�
';
comment on column WII_ORDERS_ICU.duration_units
  is '����ʱ�䵥λ���죬��..)
';
comment on column WII_ORDERS_ICU.frequency
  is 'ִ��Ƶ������������tid,qd�ȣ�
';
comment on column WII_ORDERS_ICU.freq_interval
  is 'Ƶ�ʼ��
';
comment on column WII_ORDERS_ICU.freq_interval_unit
  is 'Ƶ�ʼ����λ(Сʱ���ֵȣ�
';
comment on column WII_ORDERS_ICU.dispense_memos
  is '��ҩ����
��';
comment on column WII_ORDERS_ICU.order_abbr
  is 'ҽ�����
��';
comment on column WII_ORDERS_ICU.order_attr
  is 'ҽ������
��';
comment on column WII_ORDERS_ICU.use_pump
  is '�Ƿ����ҩ
��';
comment on column WII_ORDERS_ICU.execute_start_time
  is 'ִ�п�ʼʱ��
��';
comment on column WII_ORDERS_ICU.execute_end_time
  is 'ִ�н���ʱ��
';
comment on column WII_ORDERS_ICU.icu_execute_status
  is '"ִ��״̬��δִ�� = -1,
ִ���� = 1,
 ִ����� = 2, ȡ��ִ�� = 3,
���� = 4��"
';
comment on column WII_ORDERS_ICU.injectionsite
  is 'ע�䲿λ
��';
comment on column WII_ORDERS_ICU.execute_mathod
  is 'ִ�з���
';
comment on column WII_ORDERS_ICU.operator
  is '������
';
comment on column WII_ORDERS_ICU.operate_time
  is '����ʱ��
��';
comment on column WII_ORDERS_ICU.memo
  is '��ע
��';
comment on column WII_ORDERS_ICU.memo_time_point
  is '��עʱ���
';
comment on column WII_ORDERS_ICU.creator
  is '������
';
comment on column WII_ORDERS_ICU.create_time
  is '����ʱ��
';
comment on column WII_ORDERS_ICU.order_key
  is 'ҽ��Ψһ��ʶ
';
comment on column WII_ORDERS_ICU.shift_time
  is '����ʱ��(���е������������ϲ�����ҽ����,����Ϊ��)
';
comment on column WII_ORDERS_ICU.invalid_time
  is 'ҽ������ʱ��
';
comment on column WII_ORDERS_ICU.is_rescue
  is '�Ƿ�������ҽ��(1��0����)
';
comment on column WII_ORDERS_ICU.order_type
  is '1ҩ��/2��ҩ��';
comment on column WII_ORDERS_ICU.subtbl_flag
  is '������Դ��0-HIS/1-����
';
comment on column WII_ORDERS_ICU.c_class
  is 'C��
';
comment on column WII_ORDERS_ICU.modifier
  is '������
';
comment on column WII_ORDERS_ICU.modify_time
  is '����ʱ��';
comment on column WII_ORDERS_ICU.unique_id
  is '"����Ψһid
"

';
comment on column WII_ORDERS_ICU.barcode
  is 'ɨ��ִ��ҽ��';
comment on column WII_ORDERS_ICU.first_default_time
  is '�״�Ĭ��ִ��ʱ��';
comment on column WII_ORDERS_ICU.complete_time
  is 'Ԥ�����ʱ��
';
comment on column WII_ORDERS_ICU.remain_dosage
  is 'ʣ����';
comment on column WII_ORDERS_ICU.all_dosage
  is '�ܼ���
';
comment on column WII_ORDERS_ICU.serial_no
  is 'HIS��ֺ���ˮ��';
comment on column WII_ORDERS_ICU.origin_default_time
  is 'δ�޸ĵ�Ĭ��ִ��ʱ��';
comment on column WII_ORDERS_ICU.cancel_reason
  is 'ȡ��ԭ��';

prompt
prompt Creating table WII_ORDERS_ITEM_DIC
prompt ==================================
prompt
create table WII_ORDERS_ITEM_DIC
(
  serial_no       NUMBER(2),
  order_item_code VARCHAR2(12),
  order_item_name NVARCHAR2(100),
  input_code      VARCHAR2(16)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_ORDERS_ITEM_DIC.serial_no
  is '���';
comment on column WII_ORDERS_ITEM_DIC.order_item_code
  is 'ҽ����Ŀ����';
comment on column WII_ORDERS_ITEM_DIC.order_item_name
  is 'ҽ����Ŀ����';
comment on column WII_ORDERS_ITEM_DIC.input_code
  is '������';

prompt
prompt Creating table WII_ORDERS_MANUAL
prompt ================================
prompt
create table WII_ORDERS_MANUAL
(
  patient_id         VARCHAR2(20),
  inpatient_visitid  VARCHAR2(20),
  order_no           NVARCHAR2(50),
  order_sub_no       NUMBER(12),
  match_order_no     NVARCHAR2(50),
  ordering_dept      VARCHAR2(18),
  doctor             NVARCHAR2(30),
  stop_doctor        NVARCHAR2(30),
  nurse              NVARCHAR2(30),
  stop_nurse         NVARCHAR2(30),
  enter_time         DATE,
  stop_order_time    DATE,
  order_status       VARCHAR2(1),
  repeat_indicator   NUMBER(1),
  order_class        VARCHAR2(3),
  order_text         VARCHAR2(200),
  order_item_code    VARCHAR2(20),
  dosage             NUMBER(14,4),
  dosage_units       VARCHAR2(8),
  pham_std_code      VARCHAR2(14),
  pharm_spec         VARCHAR2(40),
  qty                NUMBER(12,2),
  administration     VARCHAR2(30),
  start_time         DATE,
  stop_time          DATE,
  duration           NUMBER(8),
  duration_units     VARCHAR2(8),
  frequency          VARCHAR2(30),
  freq_interval      NUMBER(8),
  freq_interval_unit VARCHAR2(8),
  dispense_memos     VARCHAR2(20),
  order_key          VARCHAR2(50),
  order_type         NUMBER(1),
  subtbl_flag        NUMBER(1),
  c_class            VARCHAR2(300),
  creator            NVARCHAR2(20),
  create_time        DATE default sysdate,
  invalid_time       DATE,
  modifier           NVARCHAR2(20),
  modify_time        DATE,
  unique_id          VARCHAR2(50) default sys_guid(),
  falg               NVARCHAR2(2000),
  flag               NVARCHAR2(2000),
  data_source        VARCHAR2(30)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_ORDERS_MANUAL.patient_id
  is '����Ψһ��ʶ��';
comment on column WII_ORDERS_MANUAL.inpatient_visitid
  is 'סԺ��ţ���ʾÿ�λ���סԺ��Ψһ�ţ�����סԺ��+סԺ������';
comment on column WII_ORDERS_MANUAL.order_no
  is 'ҽ�����';
comment on column WII_ORDERS_MANUAL.order_sub_no
  is 'ҽ�������(��Ӧ������м�������ţ�';
comment on column WII_ORDERS_MANUAL.match_order_no
  is 'ƥ��ҽ�����';
comment on column WII_ORDERS_MANUAL.ordering_dept
  is '��ҽ������';
comment on column WII_ORDERS_MANUAL.doctor
  is '��ҽ��ҽ��';
comment on column WII_ORDERS_MANUAL.stop_doctor
  is 'ͣҽ��ҽ��';
comment on column WII_ORDERS_MANUAL.nurse
  is '��ҽ��У�Ի�ʿ';
comment on column WII_ORDERS_MANUAL.stop_nurse
  is 'ͣҽ��У�Ի�ʿ';
comment on column WII_ORDERS_MANUAL.enter_time
  is '��ҽ��¼�����ڼ�ʱ��';
comment on column WII_ORDERS_MANUAL.stop_order_time
  is 'ͣҽ��¼�����ڼ�ʱ��';
comment on column WII_ORDERS_MANUAL.order_status
  is 'ҽ��״̬��1�¿���2У�飬3ִ�У�4���ϣ�5ֹͣ��';
comment on column WII_ORDERS_MANUAL.repeat_indicator
  is '����ҽ����־';
comment on column WII_ORDERS_MANUAL.order_class
  is 'ҽ����������ֵ䣭��ҩ����ҩ�ȣ�';
comment on column WII_ORDERS_MANUAL.order_text
  is 'ҽ������';
comment on column WII_ORDERS_MANUAL.order_item_code
  is 'ҽ����Ŀ����';
comment on column WII_ORDERS_MANUAL.dosage
  is 'ҩƷһ��ʹ�ü���';
comment on column WII_ORDERS_MANUAL.dosage_units
  is '������λ';
comment on column WII_ORDERS_MANUAL.pham_std_code
  is 'ҩƷ��׼����';
comment on column WII_ORDERS_MANUAL.pharm_spec
  is 'ҩƷ���';
comment on column WII_ORDERS_MANUAL.qty
  is '������һ��ʹ�ü����¼����������';
comment on column WII_ORDERS_MANUAL.administration
  is '��ҩ;���ͷ���';
comment on column WII_ORDERS_MANUAL.start_time
  is 'ҽ����ʼִ��ʱ��';
comment on column WII_ORDERS_MANUAL.stop_time
  is 'ҽ��ֹͣʱ��';
comment on column WII_ORDERS_MANUAL.duration
  is '����ʱ�� �����磬ÿ�ջ�ҩ��1�ܣ�';
comment on column WII_ORDERS_MANUAL.duration_units
  is '����ʱ�䵥λ���죬��..)';
comment on column WII_ORDERS_MANUAL.frequency
  is 'ִ��Ƶ������������tid,qd�ȣ�';
comment on column WII_ORDERS_MANUAL.freq_interval
  is 'Ƶ�ʼ��';
comment on column WII_ORDERS_MANUAL.freq_interval_unit
  is 'Ƶ�ʼ����λ(Сʱ���ֵȣ�';
comment on column WII_ORDERS_MANUAL.dispense_memos
  is '��ҩ����';
comment on column WII_ORDERS_MANUAL.order_key
  is 'ҽ��Ψһ��ʶ';
comment on column WII_ORDERS_MANUAL.order_type
  is '1ҩ��/2��ҩ��';
comment on column WII_ORDERS_MANUAL.subtbl_flag
  is '1����/0����';
comment on column WII_ORDERS_MANUAL.c_class
  is 'C��';
comment on column WII_ORDERS_MANUAL.creator
  is '������';
comment on column WII_ORDERS_MANUAL.create_time
  is '����ʱ��';
comment on column WII_ORDERS_MANUAL.invalid_time
  is 'ҽ������ʱ��';
comment on column WII_ORDERS_MANUAL.unique_id
  is '����ΨһID';
comment on column WII_ORDERS_MANUAL.data_source
  is '������Դ(1:��¼)';

prompt
prompt Creating table WII_ORDER_CCLASS_DIC
prompt ===================================
prompt
create table WII_ORDER_CCLASS_DIC
(
  cclass_code        VARCHAR2(20),
  cclass_name        NVARCHAR2(50),
  cclass_execute_way NUMBER(2),
  order_type         NUMBER(1),
  memo               NVARCHAR2(50),
  sort               NUMBER(3)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_ORDER_CCLASS_DIC.cclass_code
  is 'CIS���������';
comment on column WII_ORDER_CCLASS_DIC.cclass_name
  is 'CIS�����������';
comment on column WII_ORDER_CCLASS_DIC.cclass_execute_way
  is '����ִ�з�ʽ��10.��ʱ��ҩ��������Σ�/20.����/30.����/40.����ҽ��';
comment on column WII_ORDER_CCLASS_DIC.order_type
  is 'ҩ��/��ҩ��';
comment on column WII_ORDER_CCLASS_DIC.memo
  is '��ע';
comment on column WII_ORDER_CCLASS_DIC.sort
  is '����';

prompt
prompt Creating table WII_ORDER_CCLASS_MAPPING_DIC
prompt ===========================================
prompt
create table WII_ORDER_CCLASS_MAPPING_DIC
(
  cclass_code           VARCHAR2(20),
  cclass_name           NVARCHAR2(50),
  his_class_code        VARCHAR2(50),
  his_class_name        NVARCHAR2(50),
  his_orderroute_key    NVARCHAR2(30),
  his_ordername_key     NVARCHAR2(30),
  classification_method NUMBER(1),
  input_code            VARCHAR2(50),
  memo                  NVARCHAR2(50),
  match_relation        NUMBER(2),
  group_index           VARCHAR2(50),
  group_relation        NUMBER(2),
  sort                  NUMBER(2)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_ORDER_CCLASS_MAPPING_DIC.cclass_code
  is 'CIS���������';
comment on column WII_ORDER_CCLASS_MAPPING_DIC.cclass_name
  is 'CIS�����������';
comment on column WII_ORDER_CCLASS_MAPPING_DIC.his_class_code
  is 'HIS�����ϵ��';
comment on column WII_ORDER_CCLASS_MAPPING_DIC.his_class_name
  is 'HIS�������ϵ��
';
comment on column WII_ORDER_CCLASS_MAPPING_DIC.his_orderroute_key
  is 'HIS;�����ƹؼ���
';
comment on column WII_ORDER_CCLASS_MAPPING_DIC.his_ordername_key
  is 'HISҽ�������йؼ���
';
comment on column WII_ORDER_CCLASS_MAPPING_DIC.classification_method
  is '���෽��
1:��ͨ��HIS���
2:ͨ��HIS���+HIS;���ؼ���
3:ͨ��HIS���+HISҽ�����ƹؼ���';
comment on column WII_ORDER_CCLASS_MAPPING_DIC.input_code
  is '��������ĸ(������룩';
comment on column WII_ORDER_CCLASS_MAPPING_DIC.memo
  is '��ע';
comment on column WII_ORDER_CCLASS_MAPPING_DIC.match_relation
  is 'ƥ���ϵ 1:��� 2:����� 3:���� 4:������';
comment on column WII_ORDER_CCLASS_MAPPING_DIC.group_index
  is '��������';
comment on column WII_ORDER_CCLASS_MAPPING_DIC.group_relation
  is '�������Ĺ�ϵ  1:����  2:����';
comment on column WII_ORDER_CCLASS_MAPPING_DIC.sort
  is '����';

prompt
prompt Creating table WII_ORDER_DETAILS_DIC
prompt ====================================
prompt
create table WII_ORDER_DETAILS_DIC
(
  details_code VARCHAR2(20),
  order_name   NVARCHAR2(100),
  class_code   VARCHAR2(20),
  class_name   NVARCHAR2(20),
  input_code   VARCHAR2(20),
  memo         NVARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 1M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_ORDER_DETAILS_DIC.details_code
  is 'ҽ����ϸ����';
comment on column WII_ORDER_DETAILS_DIC.order_name
  is 'ҽ������';
comment on column WII_ORDER_DETAILS_DIC.class_code
  is '������';
comment on column WII_ORDER_DETAILS_DIC.class_name
  is '�������';
comment on column WII_ORDER_DETAILS_DIC.input_code
  is '���������';
comment on column WII_ORDER_DETAILS_DIC.memo
  is '��ע';

prompt
prompt Creating table WII_ORDER_FREQ_DIC
prompt =================================
prompt
create table WII_ORDER_FREQ_DIC
(
  freq_code   VARCHAR2(20),
  freq_name   VARCHAR2(50),
  route_code  VARCHAR2(20),
  time_point  VARCHAR2(100),
  time_start  VARCHAR2(20),
  adjust_time VARCHAR2(20),
  memo        NVARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_ORDER_FREQ_DIC.freq_code
  is 'Ƶ�α���';
comment on column WII_ORDER_FREQ_DIC.freq_name
  is 'Ƶ������';
comment on column WII_ORDER_FREQ_DIC.route_code
  is '��ҩ;������';
comment on column WII_ORDER_FREQ_DIC.time_point
  is 'ִ��ʱ���';
comment on column WII_ORDER_FREQ_DIC.time_start
  is 'Ĭ����ʼʱ���';
comment on column WII_ORDER_FREQ_DIC.adjust_time
  is '�Ƿ���Ե���ֱ��������ʼ��';
comment on column WII_ORDER_FREQ_DIC.memo
  is '��ע';

prompt
prompt Creating table WII_ORDER_FREQ_MAPPING_DIC
prompt =========================================
prompt
create table WII_ORDER_FREQ_MAPPING_DIC
(
  code       VARCHAR2(50),
  his_code   VARCHAR2(50),
  his_name   VARCHAR2(50),
  input_code VARCHAR2(50),
  memo       VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_ORDER_FREQ_MAPPING_DIC
  is 'ҽ��Ƶ�ζ��ձ�';
comment on column WII_ORDER_FREQ_MAPPING_DIC.code
  is 'CIS����';
comment on column WII_ORDER_FREQ_MAPPING_DIC.his_code
  is 'HIS����';
comment on column WII_ORDER_FREQ_MAPPING_DIC.his_name
  is 'HIS����';
comment on column WII_ORDER_FREQ_MAPPING_DIC.input_code
  is '������';
comment on column WII_ORDER_FREQ_MAPPING_DIC.memo
  is '��ע';

prompt
prompt Creating table WII_ORDER_GENERAL_DIC
prompt ====================================
prompt
create table WII_ORDER_GENERAL_DIC
(
  dic_name   VARCHAR2(50),
  cis_code   VARCHAR2(50),
  cis_name   NVARCHAR2(100),
  his_code   VARCHAR2(50),
  his_name   NVARCHAR2(100),
  input_code VARCHAR2(50),
  memo       NVARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_ORDER_GENERAL_DIC.dic_name
  is 'ҽ��ͨ������';
comment on column WII_ORDER_GENERAL_DIC.cis_code
  is 'CIS��Ŀ����';
comment on column WII_ORDER_GENERAL_DIC.cis_name
  is 'CIS��Ŀ����';
comment on column WII_ORDER_GENERAL_DIC.his_code
  is 'HIS��Ŀ����';
comment on column WII_ORDER_GENERAL_DIC.his_name
  is 'HIS��Ŀ����';
comment on column WII_ORDER_GENERAL_DIC.input_code
  is '��������ĸ(������룩';
comment on column WII_ORDER_GENERAL_DIC.memo
  is '��ע';

prompt
prompt Creating table WII_ORDER_ROUTE_DIC
prompt ==================================
prompt
create table WII_ORDER_ROUTE_DIC
(
  orderroute_cis_code   VARCHAR2(20),
  orderroute_cis_name   NVARCHAR2(50),
  orderroute_cis_abbrev VARCHAR2(50),
  input_code            VARCHAR2(50),
  memo                  NVARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_ORDER_ROUTE_DIC.orderroute_cis_code
  is 'ҽ��;��CIS����';
comment on column WII_ORDER_ROUTE_DIC.orderroute_cis_name
  is 'ҽ��;��CIS��������';
comment on column WII_ORDER_ROUTE_DIC.orderroute_cis_abbrev
  is 'ҽ��;��CIS��д';
comment on column WII_ORDER_ROUTE_DIC.input_code
  is 'ҽ��;��CIS��д';
comment on column WII_ORDER_ROUTE_DIC.memo
  is '��ע';

prompt
prompt Creating table WII_ORDER_TOPIC_MAPPING_DIC
prompt ==========================================
prompt
create table WII_ORDER_TOPIC_MAPPING_DIC
(
  topic_code     VARCHAR2(30),
  topic_name     NVARCHAR2(100),
  topic_remark   NVARCHAR2(100),
  order_text     NVARCHAR2(100),
  administration NVARCHAR2(100),
  pharmacy_code  VARCHAR2(100),
  input_code     VARCHAR2(100),
  valid          NUMBER(6) default 1
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_ORDER_TOPIC_MAPPING_DIC.topic_code
  is '������';
comment on column WII_ORDER_TOPIC_MAPPING_DIC.topic_name
  is '��������';
comment on column WII_ORDER_TOPIC_MAPPING_DIC.topic_remark
  is '���ⱸע';
comment on column WII_ORDER_TOPIC_MAPPING_DIC.order_text
  is 'ҽ������';
comment on column WII_ORDER_TOPIC_MAPPING_DIC.administration
  is 'ҽ��;��';
comment on column WII_ORDER_TOPIC_MAPPING_DIC.pharmacy_code
  is 'ҩƷ���';
comment on column WII_ORDER_TOPIC_MAPPING_DIC.input_code
  is '����¼��';
comment on column WII_ORDER_TOPIC_MAPPING_DIC.valid
  is '��Ч�ԣ�0-��Ч��1-��Ч��';

prompt
prompt Creating table WII_ORG_MAPPING
prompt ==============================
prompt
create table WII_ORG_MAPPING
(
  his_org_code VARCHAR2(30),
  his_org_name VARCHAR2(30),
  cis_org_code VARCHAR2(30),
  creator      NVARCHAR2(20),
  create_time  DATE default sysdate,
  modifier     NVARCHAR2(20),
  modify_time  DATE,
  unique_id    VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_ORG_MAPPING.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_ORG_MASTER
prompt =============================
prompt
create table WII_ORG_MASTER
(
  org_code          VARCHAR2(30) not null,
  org_name          NVARCHAR2(30),
  org_tier          VARCHAR2(30),
  parent_org_code   VARCHAR2(30),
  in_charges_nusing NVARCHAR2(30),
  in_charges_doctor NVARCHAR2(30),
  memo              VARCHAR2(30),
  input_code        VARCHAR2(30),
  org_type          VARCHAR2(30),
  creator           NVARCHAR2(20),
  create_time       DATE default sysdate,
  modifier          NVARCHAR2(20),
  modify_time       DATE,
  unique_id         VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_ORG_MASTER.org_code
  is '����';
comment on column WII_ORG_MASTER.org_name
  is '����';
comment on column WII_ORG_MASTER.org_tier
  is '�����㼶������->����ҽԺ->����->����->ҽ���飩';
comment on column WII_ORG_MASTER.parent_org_code
  is '������';
comment on column WII_ORG_MASTER.in_charges_nusing
  is '����ʿ';
comment on column WII_ORG_MASTER.in_charges_doctor
  is '����ҽ��';
comment on column WII_ORG_MASTER.memo
  is '��ע';
comment on column WII_ORG_MASTER.input_code
  is '������';
comment on column WII_ORG_MASTER.org_type
  is '1��������/2�����������/3���ڷ������/4ҽ����������/5�������/6סԺ����';
comment on column WII_ORG_MASTER.unique_id
  is '����ΨһID';
alter table WII_ORG_MASTER
  add primary key (ORG_CODE)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WII_ORG_MASTER_20151224
prompt ======================================
prompt
create table WII_ORG_MASTER_20151224
(
  org_code          VARCHAR2(30) not null,
  org_name          VARCHAR2(30),
  org_tier          VARCHAR2(30),
  parent_org_code   VARCHAR2(30),
  in_charges_nusing VARCHAR2(30),
  in_charges_doctor VARCHAR2(30),
  memo              VARCHAR2(30),
  input_code        VARCHAR2(30),
  org_type          VARCHAR2(30),
  unique_id         VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table WII_PATIENTEVALUATE_CHECK
prompt ========================================
prompt
create table WII_PATIENTEVALUATE_CHECK
(
  patient_id  VARCHAR2(20),
  belong_type VARCHAR2(40),
  dic_code    VARCHAR2(40),
  is_check    NUMBER(3),
  doctor      VARCHAR2(20),
  check_date  DATE,
  create_time DATE default sysdate,
  creator     NVARCHAR2(20),
  modifier    NVARCHAR2(20),
  modify_time DATE,
  unique_id   VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENTEVALUATE_CHECK.patient_id
  is '�û�ID';
comment on column WII_PATIENTEVALUATE_CHECK.belong_type
  is '����ģ��';
comment on column WII_PATIENTEVALUATE_CHECK.dic_code
  is '��Ӧ�ֵ������';
comment on column WII_PATIENTEVALUATE_CHECK.is_check
  is '1:check,0:δcheck';
comment on column WII_PATIENTEVALUATE_CHECK.doctor
  is 'ҽ��';
comment on column WII_PATIENTEVALUATE_CHECK.check_date
  is 'check����';
comment on column WII_PATIENTEVALUATE_CHECK.create_time
  is '����ʱ��';
comment on column WII_PATIENTEVALUATE_CHECK.creator
  is '������';
comment on column WII_PATIENTEVALUATE_CHECK.modifier
  is '�޸���';
comment on column WII_PATIENTEVALUATE_CHECK.modify_time
  is '�޸�ʱ��';
comment on column WII_PATIENTEVALUATE_CHECK.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENTEVALUATE_CONFIG
prompt =========================================
prompt
create table WII_PATIENTEVALUATE_CONFIG
(
  evluate_no  NUMBER(11),
  type        VARCHAR2(40),
  name        VARCHAR2(100),
  value       VARCHAR2(100),
  parent_id   NUMBER(6),
  create_time DATE,
  creator     NVARCHAR2(20),
  modifier    NVARCHAR2(20),
  modify_time DATE,
  unique_id   VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENTEVALUATE_CONFIG.evluate_no
  is '������ID';
comment on column WII_PATIENTEVALUATE_CONFIG.type
  is '����';
comment on column WII_PATIENTEVALUATE_CONFIG.name
  is '��ʾ����';
comment on column WII_PATIENTEVALUATE_CONFIG.value
  is 'ֵ����';
comment on column WII_PATIENTEVALUATE_CONFIG.parent_id
  is '����ID';
comment on column WII_PATIENTEVALUATE_CONFIG.create_time
  is '����ʱ��';
comment on column WII_PATIENTEVALUATE_CONFIG.creator
  is '������';
comment on column WII_PATIENTEVALUATE_CONFIG.modifier
  is '�޸���';
comment on column WII_PATIENTEVALUATE_CONFIG.modify_time
  is '�޸�ʱ��';
comment on column WII_PATIENTEVALUATE_CONFIG.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENT_APPOINTMENT
prompt ======================================
prompt
create table WII_PATIENT_APPOINTMENT
(
  inpatient_visitid  VARCHAR2(20),
  patient_id         VARCHAR2(20),
  reservation_time   DATE,
  reservation_person VARCHAR2(20),
  check_place        VARCHAR2(20),
  feedback_dept      VARCHAR2(20),
  feedback_person    NVARCHAR2(20),
  confirm_time       DATE,
  note               NVARCHAR2(100),
  status             NUMBER(2),
  create_time        DATE default sysdate,
  creator            NVARCHAR2(20),
  modifier           NVARCHAR2(20),
  modify_time        DATE,
  project_name       VARCHAR2(20),
  unique_id          VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_PATIENT_APPOINTMENT.inpatient_visitid
  is 'סԺ���';
comment on column WII_PATIENT_APPOINTMENT.patient_id
  is '���˱�ʶ';
comment on column WII_PATIENT_APPOINTMENT.reservation_time
  is 'ԤԼʱ��';
comment on column WII_PATIENT_APPOINTMENT.reservation_person
  is 'ԤԼ��';
comment on column WII_PATIENT_APPOINTMENT.check_place
  is '���ص�';
comment on column WII_PATIENT_APPOINTMENT.feedback_dept
  is '��������';
comment on column WII_PATIENT_APPOINTMENT.feedback_person
  is '������';
comment on column WII_PATIENT_APPOINTMENT.confirm_time
  is 'ȷ��ʱ��';
comment on column WII_PATIENT_APPOINTMENT.note
  is '��ע';
comment on column WII_PATIENT_APPOINTMENT.status
  is '״̬';
comment on column WII_PATIENT_APPOINTMENT.create_time
  is '����ʱ��';
comment on column WII_PATIENT_APPOINTMENT.creator
  is '������';
comment on column WII_PATIENT_APPOINTMENT.modifier
  is '�޸���';
comment on column WII_PATIENT_APPOINTMENT.modify_time
  is '�޸�ʱ��';
comment on column WII_PATIENT_APPOINTMENT.project_name
  is '��Ŀ����';
comment on column WII_PATIENT_APPOINTMENT.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENT_ASSESS
prompt =================================
prompt
create table WII_PATIENT_ASSESS
(
  patient_id        NVARCHAR2(20),
  inward_visitid    NVARCHAR2(20),
  assess_id         NVARCHAR2(40),
  assessors         NVARCHAR2(20),
  assess_time       DATE,
  auditor           NVARCHAR2(20),
  audit_time        DATE,
  memo              NVARCHAR2(200),
  create_time       DATE,
  creator           NVARCHAR2(20),
  modify_time       DATE,
  modifier          NVARCHAR2(20),
  unique_id         VARCHAR2(50),
  assess_content    CLOB,
  child_code        NVARCHAR2(200),
  child_code_remark NVARCHAR2(200)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 896K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_ASSESS.patient_id
  is '���˱�ʶ
';
comment on column WII_PATIENT_ASSESS.inward_visitid
  is '�벡�����
';
comment on column WII_PATIENT_ASSESS.assess_id
  is '����ID
';
comment on column WII_PATIENT_ASSESS.assessors
  is '������
';
comment on column WII_PATIENT_ASSESS.assess_time
  is '����ʱ��
';
comment on column WII_PATIENT_ASSESS.auditor
  is '�����
';
comment on column WII_PATIENT_ASSESS.audit_time
  is '���ʱ��
';
comment on column WII_PATIENT_ASSESS.memo
  is '��ע
';
comment on column WII_PATIENT_ASSESS.create_time
  is '����ʱ��
';
comment on column WII_PATIENT_ASSESS.creator
  is '������
';
comment on column WII_PATIENT_ASSESS.modify_time
  is '�޸�ʱ��
';
comment on column WII_PATIENT_ASSESS.modifier
  is '�޸���
';
comment on column WII_PATIENT_ASSESS.unique_id
  is '����Ψһid
';
comment on column WII_PATIENT_ASSESS.child_code
  is '��CODE˵��';

prompt
prompt Creating table WII_PATIENT_BED_CHANGE
prompt =====================================
prompt
create table WII_PATIENT_BED_CHANGE
(
  patient_id    VARCHAR2(20),
  ward_stayed   VARCHAR2(30),
  bed_stayed    VARCHAR2(20),
  bed_from      VARCHAR2(20),
  change_time   DATE,
  operator      NVARCHAR2(30),
  create_time   DATE default sysdate,
  creator       NVARCHAR2(20),
  change_reason NVARCHAR2(50),
  modifier      NVARCHAR2(20),
  modify_time   DATE,
  unique_id     VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_BED_CHANGE.patient_id
  is '����Ψһ��ʶ��';
comment on column WII_PATIENT_BED_CHANGE.ward_stayed
  is '���ڲ���';
comment on column WII_PATIENT_BED_CHANGE.bed_stayed
  is '���ڴ���';
comment on column WII_PATIENT_BED_CHANGE.bed_from
  is '���Դ���';
comment on column WII_PATIENT_BED_CHANGE.change_time
  is '�������ڼ�ʱ��';
comment on column WII_PATIENT_BED_CHANGE.operator
  is '������';
comment on column WII_PATIENT_BED_CHANGE.create_time
  is '����ʱ��';
comment on column WII_PATIENT_BED_CHANGE.creator
  is '������';
comment on column WII_PATIENT_BED_CHANGE.change_reason
  is '����ԭ��';
comment on column WII_PATIENT_BED_CHANGE.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENT_BLOODTRANS_INFO
prompt ==========================================
prompt
create table WII_PATIENT_BLOODTRANS_INFO
(
  bloodtrans_info_id VARCHAR2(50) not null,
  patient_id         VARCHAR2(30),
  operate_date       DATE,
  operator           VARCHAR2(30),
  memo               VARCHAR2(500),
  operate_type       VARCHAR2(1),
  create_time        DATE,
  creator            VARCHAR2(30),
  modifier           VARCHAR2(30),
  modify_time        DATE,
  trans_start_date   DATE,
  trans_startf_date  DATE,
  trans_end_date     DATE,
  trans_endf_date    DATE,
  trans_speed        VARCHAR2(30)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_PATIENT_BLOODTRANS_INFO
  is '��Ѫ��¼��';
comment on column WII_PATIENT_BLOODTRANS_INFO.bloodtrans_info_id
  is '������id';
comment on column WII_PATIENT_BLOODTRANS_INFO.create_time
  is '����ʱ��';
comment on column WII_PATIENT_BLOODTRANS_INFO.creator
  is '������';
comment on column WII_PATIENT_BLOODTRANS_INFO.modifier
  is '�޸���';
comment on column WII_PATIENT_BLOODTRANS_INFO.modify_time
  is '�޸�ʱ��';
alter table WII_PATIENT_BLOODTRANS_INFO
  add primary key (BLOODTRANS_INFO_ID)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WII_PATIENT_DMAR_PORTFOLIO
prompt =========================================
prompt
create table WII_PATIENT_DMAR_PORTFOLIO
(
  portfolio_id      VARCHAR2(20) not null,
  domain_id         VARCHAR2(20) not null,
  patient_id        VARCHAR2(20) not null,
  inpatient_visitid VARCHAR2(20) not null,
  portfolio_memo    NVARCHAR2(50),
  operator          NVARCHAR2(20),
  operate_time      DATE,
  unique_id         VARCHAR2(50) default sys_guid() not null,
  creator           NVARCHAR2(20),
  create_time       DATE default sysdate,
  modifier          NVARCHAR2(20),
  modify_time       DATE
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_PATIENT_DMAR_PORTFOLIO.portfolio_id
  is 'DMAR�鵵��Ŀ���';
comment on column WII_PATIENT_DMAR_PORTFOLIO.domain_id
  is '��Դ��ID';
comment on column WII_PATIENT_DMAR_PORTFOLIO.patient_id
  is '���߱��';
comment on column WII_PATIENT_DMAR_PORTFOLIO.inpatient_visitid
  is 'סԺ���';
comment on column WII_PATIENT_DMAR_PORTFOLIO.portfolio_memo
  is '��ע';
comment on column WII_PATIENT_DMAR_PORTFOLIO.operator
  is '������';
comment on column WII_PATIENT_DMAR_PORTFOLIO.operate_time
  is '����ʱ��';
comment on column WII_PATIENT_DMAR_PORTFOLIO.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENT_DOCUMENT_CHECK
prompt =========================================
prompt
create table WII_PATIENT_DOCUMENT_CHECK
(
  document_check_no NUMBER(11),
  patient_id        VARCHAR2(20),
  document_code     VARCHAR2(20),
  operate_time      DATE,
  operate_by        VARCHAR2(20),
  memo              NVARCHAR2(200),
  attachment        VARCHAR2(200),
  creator           NVARCHAR2(20),
  create_time       DATE default sysdate,
  modifier          NVARCHAR2(20),
  modify_time       DATE,
  delete_flag       VARCHAR2(2),
  delete_reason     VARCHAR2(200),
  attachment_time   DATE,
  operation_id      VARCHAR2(10),
  unique_id         VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_PATIENT_DOCUMENT_CHECK.document_check_no
  is '��ˮ��';
comment on column WII_PATIENT_DOCUMENT_CHECK.patient_id
  is '����Ψһ��ʶ��';
comment on column WII_PATIENT_DOCUMENT_CHECK.document_code
  is '��Ŀ����';
comment on column WII_PATIENT_DOCUMENT_CHECK.operate_time
  is '���ʱ��';
comment on column WII_PATIENT_DOCUMENT_CHECK.operate_by
  is '�����';
comment on column WII_PATIENT_DOCUMENT_CHECK.memo
  is '��ע';
comment on column WII_PATIENT_DOCUMENT_CHECK.attachment
  is '����';
comment on column WII_PATIENT_DOCUMENT_CHECK.creator
  is '������';
comment on column WII_PATIENT_DOCUMENT_CHECK.create_time
  is '����ʱ��';
comment on column WII_PATIENT_DOCUMENT_CHECK.modifier
  is '�޸���';
comment on column WII_PATIENT_DOCUMENT_CHECK.modify_time
  is '�޸�ʱ��';
comment on column WII_PATIENT_DOCUMENT_CHECK.delete_flag
  is 'ɾ����ʶ';
comment on column WII_PATIENT_DOCUMENT_CHECK.delete_reason
  is 'ɾ��ԭ��';
comment on column WII_PATIENT_DOCUMENT_CHECK.attachment_time
  is '�����ϴ�ʱ��';
comment on column WII_PATIENT_DOCUMENT_CHECK.operation_id
  is '����ID';
comment on column WII_PATIENT_DOCUMENT_CHECK.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENT_DOCUMENT_CONFIG
prompt ==========================================
prompt
create table WII_PATIENT_DOCUMENT_CONFIG
(
  doc_type_code VARCHAR2(20),
  document_code VARCHAR2(20),
  document_name VARCHAR2(50),
  html_name     VARCHAR2(50),
  ward_code     VARCHAR2(20),
  creator       NVARCHAR2(20),
  create_time   DATE default sysdate,
  modifier      NVARCHAR2(20),
  modify_time   DATE,
  document_type VARCHAR2(20),
  unique_id     VARCHAR2(50) default sys_guid(),
  system_type   VARCHAR2(20),
  html_content  CLOB
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_DOCUMENT_CONFIG.doc_type_code
  is '��������';
comment on column WII_PATIENT_DOCUMENT_CONFIG.document_code
  is '����';
comment on column WII_PATIENT_DOCUMENT_CONFIG.document_name
  is '����';
comment on column WII_PATIENT_DOCUMENT_CONFIG.html_name
  is '�����ľ�̬ҳ��';
comment on column WII_PATIENT_DOCUMENT_CONFIG.ward_code
  is '��������';
comment on column WII_PATIENT_DOCUMENT_CONFIG.creator
  is '������';
comment on column WII_PATIENT_DOCUMENT_CONFIG.create_time
  is '����ʱ��';
comment on column WII_PATIENT_DOCUMENT_CONFIG.modifier
  is '�޸���';
comment on column WII_PATIENT_DOCUMENT_CONFIG.modify_time
  is '�޸�ʱ��';
comment on column WII_PATIENT_DOCUMENT_CONFIG.document_type
  is '�������  1:�������';
comment on column WII_PATIENT_DOCUMENT_CONFIG.unique_id
  is '����ΨһID';
comment on column WII_PATIENT_DOCUMENT_CONFIG.system_type
  is 'ϵͳ����
"Nurse����ʿվ
Doctor��ҽ��վ"
';
comment on column WII_PATIENT_DOCUMENT_CONFIG.html_content
  is '����ҳ������';

prompt
prompt Creating table WII_PATIENT_DOCUMENT_DETAIL
prompt ==========================================
prompt
create table WII_PATIENT_DOCUMENT_DETAIL
(
  document_no   VARCHAR2(20),
  document_code VARCHAR2(20),
  control_name  VARCHAR2(100),
  control_value VARCHAR2(100),
  item_code     VARCHAR2(100),
  memo          NVARCHAR2(200),
  creator       NVARCHAR2(20),
  create_time   DATE default sysdate,
  modifier      NVARCHAR2(20),
  modify_time   DATE,
  unique_id     VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_DOCUMENT_DETAIL.document_no
  is '��������ˮ��';
comment on column WII_PATIENT_DOCUMENT_DETAIL.document_code
  is '��Ŀ����';
comment on column WII_PATIENT_DOCUMENT_DETAIL.control_name
  is '�ؼ�����';
comment on column WII_PATIENT_DOCUMENT_DETAIL.control_value
  is '�ؼ�ֵ';
comment on column WII_PATIENT_DOCUMENT_DETAIL.item_code
  is '��Ŀ����';
comment on column WII_PATIENT_DOCUMENT_DETAIL.memo
  is '��ע';
comment on column WII_PATIENT_DOCUMENT_DETAIL.creator
  is '������';
comment on column WII_PATIENT_DOCUMENT_DETAIL.create_time
  is '����ʱ��';
comment on column WII_PATIENT_DOCUMENT_DETAIL.modifier
  is '�޸���';
comment on column WII_PATIENT_DOCUMENT_DETAIL.modify_time
  is '�޸�ʱ��';
comment on column WII_PATIENT_DOCUMENT_DETAIL.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENT_DOCUMENT_EDUCATION
prompt =============================================
prompt
create table WII_PATIENT_DOCUMENT_EDUCATION
(
  document_education_no NUMBER(11),
  patient_id            VARCHAR2(20),
  document_code         VARCHAR2(20),
  operate_time          DATE,
  operate_by            NVARCHAR2(20),
  memo                  NVARCHAR2(200),
  attachment            VARCHAR2(200),
  creator               NVARCHAR2(20),
  create_time           DATE default sysdate,
  modifier              NVARCHAR2(20),
  modify_time           DATE,
  delete_flag           VARCHAR2(2),
  delete_reason         NVARCHAR2(200),
  attachment_time       DATE,
  operation_id          VARCHAR2(10),
  unique_id             VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_DOCUMENT_EDUCATION.document_education_no
  is '��ˮ��';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.patient_id
  is '����Ψһ��ʶ��';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.document_code
  is '��Ŀ����';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.operate_time
  is '����ʱ��';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.operate_by
  is '������';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.memo
  is '��ע';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.attachment
  is '����';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.creator
  is '������';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.create_time
  is '����ʱ��';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.modifier
  is '�޸���';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.modify_time
  is '�޸�ʱ��';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.delete_flag
  is 'ɾ����ʶ';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.delete_reason
  is 'ɾ��ԭ��';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.attachment_time
  is '�����ϴ�ʱ��';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.operation_id
  is '����ID';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENT_DOCUMENT_EXCHANGE
prompt ============================================
prompt
create table WII_PATIENT_DOCUMENT_EXCHANGE
(
  document_exchange_no NUMBER(11),
  patient_id           VARCHAR2(20),
  document_code        VARCHAR2(20),
  operate_time         DATE,
  ward_from            VARCHAR2(20),
  operator_from        NVARCHAR2(20),
  ward_stayed          VARCHAR2(20),
  operator_stayed      VARCHAR2(20),
  operator_from_memo   NVARCHAR2(200),
  attachment           VARCHAR2(200),
  creator              NVARCHAR2(20),
  create_time          DATE default sysdate,
  modifier             NVARCHAR2(20),
  modify_time          DATE,
  delete_flag          VARCHAR2(2),
  delete_reason        NVARCHAR2(200),
  attachment_time      DATE,
  operation_id         VARCHAR2(10),
  unique_id            VARCHAR2(50) default sys_guid(),
  operator_stayed_memo NVARCHAR2(200),
  exchange_item_code   VARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.document_exchange_no
  is '��ˮ��';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.patient_id
  is '����Ψһ��ʶ��';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.document_code
  is '��Ŀ����';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.operate_time
  is '���ʱ��';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.ward_from
  is '��������';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.operator_from
  is '������';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.ward_stayed
  is '���ղ���';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.operator_stayed
  is '������';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.operator_from_memo
  is '��ע';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.attachment
  is '����';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.creator
  is '������';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.create_time
  is '����ʱ��';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.modifier
  is '�޸���';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.modify_time
  is '�޸�ʱ��';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.delete_flag
  is 'ɾ����ʶ';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.delete_reason
  is 'ɾ��ԭ��';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.attachment_time
  is '�����ϴ�ʱ��';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.operation_id
  is '����ID';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.unique_id
  is '����ΨһID';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.operator_stayed_memo
  is '�����˱�ע��Ϣ';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.exchange_item_code
  is '������ƷCode';

prompt
prompt Creating table WII_PATIENT_DOCUMENT_INFORM
prompt ==========================================
prompt
create table WII_PATIENT_DOCUMENT_INFORM
(
  document_inform_no NUMBER(11),
  patient_id         VARCHAR2(20),
  document_code      VARCHAR2(20),
  operate_time       DATE,
  talker_id          VARCHAR2(20),
  listener_name      VARCHAR2(20),
  result_code        VARCHAR2(1),
  memo               NVARCHAR2(200),
  attachment         VARCHAR2(200),
  creator            NVARCHAR2(20),
  create_time        DATE default sysdate,
  modifier           NVARCHAR2(20),
  modify_time        DATE,
  delete_flag        VARCHAR2(2),
  delete_reason      NVARCHAR2(200),
  attachment_time    DATE,
  operation_id       VARCHAR2(10),
  unique_id          VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_PATIENT_DOCUMENT_INFORM.document_inform_no
  is '��ˮ��';
comment on column WII_PATIENT_DOCUMENT_INFORM.patient_id
  is '����Ψһ��ʶ��';
comment on column WII_PATIENT_DOCUMENT_INFORM.document_code
  is '��Ŀ����';
comment on column WII_PATIENT_DOCUMENT_INFORM.operate_time
  is '��ͨʱ��';
comment on column WII_PATIENT_DOCUMENT_INFORM.talker_id
  is '��ͨ��';
comment on column WII_PATIENT_DOCUMENT_INFORM.listener_name
  is '��ͨ����';
comment on column WII_PATIENT_DOCUMENT_INFORM.result_code
  is '��ͨ���';
comment on column WII_PATIENT_DOCUMENT_INFORM.memo
  is '��ע';
comment on column WII_PATIENT_DOCUMENT_INFORM.attachment
  is '����';
comment on column WII_PATIENT_DOCUMENT_INFORM.creator
  is '������';
comment on column WII_PATIENT_DOCUMENT_INFORM.create_time
  is '����ʱ��';
comment on column WII_PATIENT_DOCUMENT_INFORM.modifier
  is '�޸���';
comment on column WII_PATIENT_DOCUMENT_INFORM.modify_time
  is '�޸�ʱ��';
comment on column WII_PATIENT_DOCUMENT_INFORM.delete_flag
  is 'ɾ����ʶ';
comment on column WII_PATIENT_DOCUMENT_INFORM.delete_reason
  is 'ɾ��ԭ��';
comment on column WII_PATIENT_DOCUMENT_INFORM.attachment_time
  is '�����ϴ�ʱ��';
comment on column WII_PATIENT_DOCUMENT_INFORM.operation_id
  is '����ID';
comment on column WII_PATIENT_DOCUMENT_INFORM.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENT_EXAM
prompt ===============================
prompt
create table WII_PATIENT_EXAM
(
  patient_id                 VARCHAR2(20),
  inpatient_visitid          VARCHAR2(20),
  name                       NVARCHAR2(30),
  exam_no                    VARCHAR2(20),
  priority_indicator         NUMBER(1),
  local_id_class             VARCHAR2(1),
  patient_local_id           VARCHAR2(20),
  exam_class                 VARCHAR2(20),
  exam_sub_class             VARCHAR2(8),
  exam_name                  VARCHAR2(50),
  exam_mode                  VARCHAR2(1),
  req_date_time              DATE,
  req_dept                   VARCHAR2(16),
  req_physician              NVARCHAR2(30),
  req_memo                   NVARCHAR2(60),
  scheduled_date_time        DATE,
  notice                     NVARCHAR2(400),
  exam_group                 VARCHAR2(16),
  exam_time                  DATE,
  exam_para                  VARCHAR2(1000),
  performed_by               VARCHAR2(16),
  technician                 NVARCHAR2(30),
  report_time                DATE,
  reporter                   NVARCHAR2(30),
  verified_by                NVARCHAR2(30),
  verified_time              DATE,
  description                NVARCHAR2(2000),
  impression                 NVARCHAR2(2000),
  recommendation             NVARCHAR2(1000),
  if_abnormal                VARCHAR2(1),
  image_uid                  VARCHAR2(128),
  memo                       NVARCHAR2(40),
  result_status              VARCHAR2(20),
  pathology_recved_date_time DATE,
  creator                    NVARCHAR2(20),
  create_time                DATE default sysdate,
  modifier                   NVARCHAR2(20),
  modify_time                DATE,
  unique_id                  VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
  );
comment on column WII_PATIENT_EXAM.patient_id
  is '���˱�ʶ��';
comment on column WII_PATIENT_EXAM.inpatient_visitid
  is 'סԺ��ţ���ʾÿ�λ���סԺ��Ψһ�ţ�����סԺ��+סԺ������';
comment on column WII_PATIENT_EXAM.name
  is '����';
comment on column WII_PATIENT_EXAM.exam_no
  is '�������';
comment on column WII_PATIENT_EXAM.priority_indicator
  is '���ȱ�־';
comment on column WII_PATIENT_EXAM.local_id_class
  is '�������';
comment on column WII_PATIENT_EXAM.patient_local_id
  is '����ʶ��';
comment on column WII_PATIENT_EXAM.exam_class
  is '������';
comment on column WII_PATIENT_EXAM.exam_sub_class
  is '�������';
comment on column WII_PATIENT_EXAM.exam_name
  is '�����Ŀ����';
comment on column WII_PATIENT_EXAM.exam_mode
  is '��鷽ʽ';
comment on column WII_PATIENT_EXAM.req_date_time
  is '�������ڼ�ʱ��';
comment on column WII_PATIENT_EXAM.req_dept
  is '�������';
comment on column WII_PATIENT_EXAM.req_physician
  is '����ҽ��';
comment on column WII_PATIENT_EXAM.req_memo
  is '���뱸ע';
comment on column WII_PATIENT_EXAM.scheduled_date_time
  is 'ԤԼ���ڼ�ʱ��';
comment on column WII_PATIENT_EXAM.notice
  is 'ע������';
comment on column WII_PATIENT_EXAM.exam_group
  is '���ԤԼ����';
comment on column WII_PATIENT_EXAM.exam_time
  is '������ڼ�ʱ��';
comment on column WII_PATIENT_EXAM.exam_para
  is '������';
comment on column WII_PATIENT_EXAM.performed_by
  is 'ִ�п���';
comment on column WII_PATIENT_EXAM.technician
  is '��������';
comment on column WII_PATIENT_EXAM.report_time
  is '�������ڼ�ʱ��';
comment on column WII_PATIENT_EXAM.reporter
  is '��鱨����';
comment on column WII_PATIENT_EXAM.verified_by
  is '���������';
comment on column WII_PATIENT_EXAM.verified_time
  is '���ʱ��';
comment on column WII_PATIENT_EXAM.description
  is '�����������';
comment on column WII_PATIENT_EXAM.impression
  is 'ӡ��';
comment on column WII_PATIENT_EXAM.recommendation
  is '����';
comment on column WII_PATIENT_EXAM.if_abnormal
  is '�Ƿ�����';
comment on column WII_PATIENT_EXAM.image_uid
  is '������ͼ����';
comment on column WII_PATIENT_EXAM.memo
  is '��ע';
comment on column WII_PATIENT_EXAM.result_status
  is '�����״̬��';
comment on column WII_PATIENT_EXAM.pathology_recved_date_time
  is '����걾�յ����ڼ�ʱ��';
comment on column WII_PATIENT_EXAM.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENT_FOLLOW_UP_PLAN
prompt =========================================
prompt
create table WII_PATIENT_FOLLOW_UP_PLAN
(
  patient_id    VARCHAR2(20),
  start_time    DATE,
  bill_type     VARCHAR2(1),
  end_time      DATE,
  creator       NVARCHAR2(20),
  create_time   DATE default sysdate,
  modifier      NVARCHAR2(20),
  modify_time   DATE,
  nurse_id      NVARCHAR2(30),
  unique_id     VARCHAR2(50) default sys_guid(),
  fact_time     DATE,
  fact_nurse_id NVARCHAR2(30),
  fact_note     NVARCHAR2(500)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_FOLLOW_UP_PLAN.patient_id
  is '���߱��';
comment on column WII_PATIENT_FOLLOW_UP_PLAN.start_time
  is '��ʼʱ��';
comment on column WII_PATIENT_FOLLOW_UP_PLAN.bill_type
  is '����';
comment on column WII_PATIENT_FOLLOW_UP_PLAN.end_time
  is '����ʱ��';
comment on column WII_PATIENT_FOLLOW_UP_PLAN.creator
  is '������';
comment on column WII_PATIENT_FOLLOW_UP_PLAN.create_time
  is '����ʱ��';
comment on column WII_PATIENT_FOLLOW_UP_PLAN.modifier
  is '�޸���';
comment on column WII_PATIENT_FOLLOW_UP_PLAN.modify_time
  is '�޸�ʱ��';
comment on column WII_PATIENT_FOLLOW_UP_PLAN.nurse_id
  is '�ƻ������
';
comment on column WII_PATIENT_FOLLOW_UP_PLAN.unique_id
  is '����ΨһID';
comment on column WII_PATIENT_FOLLOW_UP_PLAN.fact_time
  is 'ʵ�����ʱ��';
comment on column WII_PATIENT_FOLLOW_UP_PLAN.fact_nurse_id
  is 'ʵ�������';
comment on column WII_PATIENT_FOLLOW_UP_PLAN.fact_note
  is '��ü�¼';

prompt
prompt Creating table WII_PATIENT_ICU_SITUATION
prompt ========================================
prompt
create table WII_PATIENT_ICU_SITUATION
(
  patient_id        VARCHAR2(20) not null,
  visit_id          NUMBER(3) not null,
  dep_id            NUMBER(3) not null,
  inpatient_visitid VARCHAR2(20),
  inward_visitid    VARCHAR2(20),
  item_code         VARCHAR2(20) not null,
  item_value        VARCHAR2(1000),
  gen_date          DATE,
  creator           NVARCHAR2(20),
  create_time       DATE default sysdate,
  modifier          NVARCHAR2(20),
  modify_time       DATE,
  unique_id         VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_ICU_SITUATION.patient_id
  is '����Ψһ��ʶ';
comment on column WII_PATIENT_ICU_SITUATION.visit_id
  is 'סԺ����';
comment on column WII_PATIENT_ICU_SITUATION.dep_id
  is '��icu��������';
comment on column WII_PATIENT_ICU_SITUATION.inpatient_visitid
  is 'סԺ��ţ���ʾÿ�λ���סԺ��Ψһ�ţ�����סԺ��+"_"+סԺ������';
comment on column WII_PATIENT_ICU_SITUATION.inward_visitid
  is '�벡����ţ���ʾÿ�λ����벡����Ψһ�ţ����û���ID+ʱ��������뼶����';
comment on column WII_PATIENT_ICU_SITUATION.item_code
  is '��Ŀ���';
comment on column WII_PATIENT_ICU_SITUATION.item_value
  is '��Ŀֵ';
comment on column WII_PATIENT_ICU_SITUATION.gen_date
  is '��������';
comment on column WII_PATIENT_ICU_SITUATION.creator
  is '������';
comment on column WII_PATIENT_ICU_SITUATION.create_time
  is '����ʱ��';
comment on column WII_PATIENT_ICU_SITUATION.modifier
  is '�޸���';
comment on column WII_PATIENT_ICU_SITUATION.modify_time
  is '�޸�ʱ��';
comment on column WII_PATIENT_ICU_SITUATION.unique_id
  is '����ΨһID';
alter table WII_PATIENT_ICU_SITUATION
  add constraint PK_PATIENT_ICU_SITUATION primary key (PATIENT_ID, VISIT_ID, DEP_ID, ITEM_CODE)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WII_PATIENT_INHOSPITAL_FEE
prompt =========================================
prompt
create table WII_PATIENT_INHOSPITAL_FEE
(
  inpatient_visitid VARCHAR2(20),
  patient_id        VARCHAR2(20),
  fee_item_code     VARCHAR2(20),
  fee_item_name     VARCHAR2(50),
  tot_cost          NUMBER(10,2),
  fee_date          DATE,
  fee_code          VARCHAR2(3),
  create_time       DATE default sysdate,
  creator           NVARCHAR2(20),
  modifier          NVARCHAR2(20),
  modify_time       DATE,
  qty               NUMBER(10),
  unit_price        NUMBER(10,2),
  balance_state     NUMBER(2),
  current_unit      VARCHAR2(10),
  unique_id         VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_PATIENT_INHOSPITAL_FEE.inpatient_visitid
  is 'סԺ��ţ���ʾÿ�λ���סԺ��Ψһ�ţ�����סԺ��+סԺ������';
comment on column WII_PATIENT_INHOSPITAL_FEE.patient_id
  is '���˱�ʶ';
comment on column WII_PATIENT_INHOSPITAL_FEE.fee_item_code
  is '��Ŀ����';
comment on column WII_PATIENT_INHOSPITAL_FEE.fee_item_name
  is '��Ŀ����';
comment on column WII_PATIENT_INHOSPITAL_FEE.tot_cost
  is '���ý��';
comment on column WII_PATIENT_INHOSPITAL_FEE.fee_date
  is '�Ʒ�����';
comment on column WII_PATIENT_INHOSPITAL_FEE.fee_code
  is '��С���ô��루��ĿС���ࣩ';
comment on column WII_PATIENT_INHOSPITAL_FEE.create_time
  is '����ʱ��';
comment on column WII_PATIENT_INHOSPITAL_FEE.creator
  is '������';
comment on column WII_PATIENT_INHOSPITAL_FEE.modifier
  is '�޸���';
comment on column WII_PATIENT_INHOSPITAL_FEE.modify_time
  is '�޸�ʱ��';
comment on column WII_PATIENT_INHOSPITAL_FEE.qty
  is '����';
comment on column WII_PATIENT_INHOSPITAL_FEE.unit_price
  is '����';
comment on column WII_PATIENT_INHOSPITAL_FEE.balance_state
  is '�����־��0��δ���㣬1���ѽ���';
comment on column WII_PATIENT_INHOSPITAL_FEE.current_unit
  is '��λ';
comment on column WII_PATIENT_INHOSPITAL_FEE.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENT_INWARD_ICU
prompt =====================================
prompt
create table WII_PATIENT_INWARD_ICU
(
  patient_id               VARCHAR2(20) not null,
  visit_id                 NUMBER(3) not null,
  dep_id                   NUMBER(3) not null,
  inpatient_visitid        VARCHAR2(20),
  inward_visitid           VARCHAR2(20),
  diagnose                 NVARCHAR2(500),
  ward_code                VARCHAR2(30),
  bed_no                   VARCHAR2(20),
  doctor_in_charge         VARCHAR2(20),
  nurse_in_charge          VARCHAR2(20),
  patient_name             VARCHAR2(50),
  patient_gender           VARCHAR2(1),
  birthday                 DATE,
  body_weight              NUMBER(8,2),
  body_height              NUMBER(8,2),
  history_smoking          VARCHAR2(40),
  history_drinking         VARCHAR2(40),
  history_family_disease   NVARCHAR2(500),
  alergy_drugs             VARCHAR2(200),
  nursing_class            VARCHAR2(10),
  patient_condition        NVARCHAR2(200),
  settled_indicator        NUMBER(1),
  abnormal                 NVARCHAR2(200),
  antibiotic               VARCHAR2(40),
  special_note             VARCHAR2(40),
  informed_consent         NVARCHAR2(200),
  doctor_patient_com       NVARCHAR2(200),
  commit_status            VARCHAR2(16),
  creator                  NVARCHAR2(20),
  create_time              DATE default sysdate,
  modifier                 NVARCHAR2(20),
  modify_time              DATE,
  doctor_name              NVARCHAR2(50),
  nurse_name               NVARCHAR2(50),
  inward_status            NUMBER(2),
  in_transfer_sequence_no  VARCHAR2(20),
  in_icu_time              DATE,
  in_icu_operator          VARCHAR2(20),
  out_transfer_sequence_no VARCHAR2(20),
  out_icu_time             DATE,
  out_icu_operator         VARCHAR2(20),
  from_ward_code           VARCHAR2(30),
  to_ward_code             VARCHAR2(30),
  is_monitor               NUMBER(1),
  bed_id                   VARCHAR2(20),
  disease_development      NVARCHAR2(100),
  estimated_weight         NUMBER(6),
  body_surface_area        NUMBER(6),
  history_alergy           NVARCHAR2(2000),
  history_disease          NVARCHAR2(2000),
  is_reentry               NUMBER(1),
  reentry_reason           NVARCHAR2(50),
  in_icu_source            VARCHAR2(20),
  out_icu_situation        NVARCHAR2(500),
  unique_id                VARCHAR2(50) default sys_guid(),
  noninvasivediastolic     VARCHAR2(20),
  noninvasivesistolic      VARCHAR2(20),
  card_id                  NVARCHAR2(50),
  telephone                NVARCHAR2(50),
  is_operation             NUMBER(1),
  is_appointment           NUMBER(1),
  address                  NVARCHAR2(500),
  diet                     VARCHAR2(100),
  attending_doctor         NVARCHAR2(50),
  inward_type              NVARCHAR2(20),
  history_provider         NVARCHAR2(20),
  inward_chief_complaint   NVARCHAR2(20),
  nation                   NVARCHAR2(20),
  profession               NVARCHAR2(20),
  marital_status           NVARCHAR2(20),
  faith                    NVARCHAR2(20),
  educational_level        NVARCHAR2(20),
  skin_test                NVARCHAR2(50),
  inpatient_no             VARCHAR2(20),
  out_icu_status           NVARCHAR2(100),
  present_disease          NVARCHAR2(2000)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_INWARD_ICU.patient_id
  is '����Ψһ��ʶ';
comment on column WII_PATIENT_INWARD_ICU.visit_id
  is 'סԺ����';
comment on column WII_PATIENT_INWARD_ICU.dep_id
  is '��icu��������';
comment on column WII_PATIENT_INWARD_ICU.inpatient_visitid
  is 'סԺ��ţ���ʾÿ�λ���סԺ��Ψһ�ţ�����סԺ��+סԺ������';
comment on column WII_PATIENT_INWARD_ICU.inward_visitid
  is '�벡�����';
comment on column WII_PATIENT_INWARD_ICU.diagnose
  is '���';
comment on column WII_PATIENT_INWARD_ICU.ward_code
  is '����';
comment on column WII_PATIENT_INWARD_ICU.bed_no
  is '����';
comment on column WII_PATIENT_INWARD_ICU.doctor_in_charge
  is '����ҽ��';
comment on column WII_PATIENT_INWARD_ICU.nurse_in_charge
  is '���λ�ʿ';
comment on column WII_PATIENT_INWARD_ICU.patient_name
  is '��������';
comment on column WII_PATIENT_INWARD_ICU.patient_gender
  is '�Ա�';
comment on column WII_PATIENT_INWARD_ICU.birthday
  is '��������';
comment on column WII_PATIENT_INWARD_ICU.body_weight
  is '����';
comment on column WII_PATIENT_INWARD_ICU.body_height
  is '���';
comment on column WII_PATIENT_INWARD_ICU.history_smoking
  is '����ʷ';
comment on column WII_PATIENT_INWARD_ICU.history_drinking
  is '����ʷ';
comment on column WII_PATIENT_INWARD_ICU.history_family_disease
  is '��������ʷ';
comment on column WII_PATIENT_INWARD_ICU.alergy_drugs
  is '����ҩ��';
comment on column WII_PATIENT_INWARD_ICU.nursing_class
  is '������';
comment on column WII_PATIENT_INWARD_ICU.patient_condition
  is '����״��';
comment on column WII_PATIENT_INWARD_ICU.settled_indicator
  is '�����Ƿ��ȶ�';
comment on column WII_PATIENT_INWARD_ICU.abnormal
  is '�쳣���';
comment on column WII_PATIENT_INWARD_ICU.antibiotic
  is '������';
comment on column WII_PATIENT_INWARD_ICU.special_note
  is '�ر���ʾ';
comment on column WII_PATIENT_INWARD_ICU.informed_consent
  is '֪��ͬ��';
comment on column WII_PATIENT_INWARD_ICU.doctor_patient_com
  is 'ҽ����ͨ';
comment on column WII_PATIENT_INWARD_ICU.commit_status
  is '�ύ״̬';
comment on column WII_PATIENT_INWARD_ICU.creator
  is '������';
comment on column WII_PATIENT_INWARD_ICU.create_time
  is '����ʱ��';
comment on column WII_PATIENT_INWARD_ICU.modifier
  is '�޸���';
comment on column WII_PATIENT_INWARD_ICU.modify_time
  is '�޸�ʱ��';
comment on column WII_PATIENT_INWARD_ICU.doctor_name
  is '����ҽ������';
comment on column WII_PATIENT_INWARD_ICU.nurse_name
  is '���λ�ʿ����';
comment on column WII_PATIENT_INWARD_ICU.inward_status
  is '�ڿ�״̬(0�ڿ� 1 ��Ժ 2 ת�� 10 ����)';
comment on column WII_PATIENT_INWARD_ICU.in_transfer_sequence_no
  is '�����ת���';
comment on column WII_PATIENT_INWARD_ICU.in_icu_time
  is '���ICUʱ��';
comment on column WII_PATIENT_INWARD_ICU.in_icu_operator
  is '���ICU������';
comment on column WII_PATIENT_INWARD_ICU.out_transfer_sequence_no
  is '������ת���';
comment on column WII_PATIENT_INWARD_ICU.out_icu_time
  is '����ICUʱ��';
comment on column WII_PATIENT_INWARD_ICU.out_icu_operator
  is '����ICU������';
comment on column WII_PATIENT_INWARD_ICU.from_ward_code
  is '���Բ���';
comment on column WII_PATIENT_INWARD_ICU.to_ward_code
  is 'ת������';
comment on column WII_PATIENT_INWARD_ICU.is_monitor
  is '�Ƿ����Bundles���(0 δ����� 1 ������)';
comment on column WII_PATIENT_INWARD_ICU.bed_id
  is '��λ�����е�BED_ID';
comment on column WII_PATIENT_INWARD_ICU.disease_development
  is '����ת��';
comment on column WII_PATIENT_INWARD_ICU.estimated_weight
  is 'Ԥ������';
comment on column WII_PATIENT_INWARD_ICU.body_surface_area
  is '������';
comment on column WII_PATIENT_INWARD_ICU.history_alergy
  is '����ʷ';
comment on column WII_PATIENT_INWARD_ICU.history_disease
  is '����ʷ';
comment on column WII_PATIENT_INWARD_ICU.is_reentry
  is '�Ƿ�Ϊ48h���ط�';
comment on column WII_PATIENT_INWARD_ICU.reentry_reason
  is '�ط�ԭ��';
comment on column WII_PATIENT_INWARD_ICU.in_icu_source
  is '�����Դ ����GENERAL_DIC��ICU_ADT_FROM
';
comment on column WII_PATIENT_INWARD_ICU.out_icu_situation
  is '����/��Ժ���';
comment on column WII_PATIENT_INWARD_ICU.unique_id
  is '����ΨһID';
comment on column WII_PATIENT_INWARD_ICU.noninvasivediastolic
  is '�޴�����ѹ';
comment on column WII_PATIENT_INWARD_ICU.noninvasivesistolic
  is '�޴�����ѹ';
comment on column WII_PATIENT_INWARD_ICU.card_id
  is '���֤';
comment on column WII_PATIENT_INWARD_ICU.telephone
  is '��ϵ�绰';
comment on column WII_PATIENT_INWARD_ICU.is_operation
  is '�Ƿ���������(1�� 0��)';
comment on column WII_PATIENT_INWARD_ICU.is_appointment
  is '�Ƿ���ǰԤԼ - 1�ǣ��ƻ���ת�룬0�񣺷Ǽƻ�ת��';
comment on column WII_PATIENT_INWARD_ICU.address
  is '��ַ';
comment on column WII_PATIENT_INWARD_ICU.diet
  is '��ʳ';
comment on column WII_PATIENT_INWARD_ICU.attending_doctor
  is '����ҽ��';
comment on column WII_PATIENT_INWARD_ICU.inward_type
  is '��Ʒ�ʽ';
comment on column WII_PATIENT_INWARD_ICU.history_provider
  is '��ʷ�ṩ��';
comment on column WII_PATIENT_INWARD_ICU.inward_chief_complaint
  is '�������';
comment on column WII_PATIENT_INWARD_ICU.nation
  is '����';
comment on column WII_PATIENT_INWARD_ICU.profession
  is 'ְҵ';
comment on column WII_PATIENT_INWARD_ICU.marital_status
  is '����״��';
comment on column WII_PATIENT_INWARD_ICU.faith
  is '�ڽ�����';
comment on column WII_PATIENT_INWARD_ICU.educational_level
  is '�Ļ��̶�';
comment on column WII_PATIENT_INWARD_ICU.skin_test
  is 'Ƥ�Խ��';
comment on column WII_PATIENT_INWARD_ICU.inpatient_no
  is 'סԺ��';
comment on column WII_PATIENT_INWARD_ICU.out_icu_status
  is '���߳���״��';
comment on column WII_PATIENT_INWARD_ICU.present_disease
  is '�ֲ�ʷ';
alter table WII_PATIENT_INWARD_ICU
  add constraint PK_PATIENT_INWARD_ICU primary key (PATIENT_ID, VISIT_ID, DEP_ID)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WII_PATIENT_IO
prompt =============================
prompt
create table WII_PATIENT_IO
(
  patient_id      VARCHAR2(20),
  time_point      DATE,
  monitoring_name VARCHAR2(100),
  monitoring_code VARCHAR2(100),
  dosage          VARCHAR2(20),
  administration  VARCHAR2(30),
  value           NUMBER(8,2),
  units           VARCHAR2(10),
  in_or_out       NUMBER(1),
  operator        VARCHAR2(30),
  operate_time    DATE,
  creator         NVARCHAR2(20),
  create_time     DATE default sysdate,
  modifier        NVARCHAR2(20),
  modify_time     DATE,
  memo            NVARCHAR2(100),
  unique_id       VARCHAR2(50) default sys_guid(),
  group_code      VARCHAR2(100)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 256K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_IO.patient_id
  is '����ID';
comment on column WII_PATIENT_IO.time_point
  is '���ʱ���';
comment on column WII_PATIENT_IO.monitoring_name
  is '�����Ŀ���ƣ�Դ�ڼ����Ŀ�ֵ��';
comment on column WII_PATIENT_IO.monitoring_code
  is '�����Ŀ���루Դ�ڼ����Ŀ�ֵ��';
comment on column WII_PATIENT_IO.dosage
  is '����';
comment on column WII_PATIENT_IO.administration
  is ';��';
comment on column WII_PATIENT_IO.value
  is '��ֵ';
comment on column WII_PATIENT_IO.units
  is '��Ŀ��λ';
comment on column WII_PATIENT_IO.in_or_out
  is '�����־';
comment on column WII_PATIENT_IO.operator
  is '����Ա';
comment on column WII_PATIENT_IO.operate_time
  is '����ʱ��';
comment on column WII_PATIENT_IO.memo
  is '��ע';
comment on column WII_PATIENT_IO.unique_id
  is '����ΨһID';
comment on column WII_PATIENT_IO.group_code
  is '�����ʶ';

prompt
prompt Creating table WII_PATIENT_IO_MODIFY
prompt ====================================
prompt
create table WII_PATIENT_IO_MODIFY
(
  patient_id      VARCHAR2(20),
  time_point      DATE,
  monitoring_name VARCHAR2(100),
  monitoring_code VARCHAR2(100),
  dosage          VARCHAR2(20),
  administration  VARCHAR2(30),
  value           NUMBER(8,2),
  units           VARCHAR2(10),
  in_or_out       NUMBER(1),
  operator        VARCHAR2(30),
  operate_time    DATE,
  modify_time     DATE,
  modifier        NVARCHAR2(20),
  creator         NVARCHAR2(20),
  create_time     DATE default sysdate,
  memo            NVARCHAR2(100),
  unique_id       VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_IO_MODIFY.patient_id
  is '����ID';
comment on column WII_PATIENT_IO_MODIFY.time_point
  is '���ʱ���';
comment on column WII_PATIENT_IO_MODIFY.monitoring_name
  is '�����Ŀ���ƣ�Դ�ڼ����Ŀ�ֵ��';
comment on column WII_PATIENT_IO_MODIFY.monitoring_code
  is '�����Ŀ���루Դ�ڼ����Ŀ�ֵ��';
comment on column WII_PATIENT_IO_MODIFY.dosage
  is '����';
comment on column WII_PATIENT_IO_MODIFY.administration
  is ';��';
comment on column WII_PATIENT_IO_MODIFY.value
  is '��ֵ';
comment on column WII_PATIENT_IO_MODIFY.units
  is '��Ŀ��λ';
comment on column WII_PATIENT_IO_MODIFY.in_or_out
  is '�����־';
comment on column WII_PATIENT_IO_MODIFY.operator
  is '����Ա';
comment on column WII_PATIENT_IO_MODIFY.operate_time
  is '����ʱ��';
comment on column WII_PATIENT_IO_MODIFY.modify_time
  is '����ʱ��';
comment on column WII_PATIENT_IO_MODIFY.modifier
  is '����ҽ��';
comment on column WII_PATIENT_IO_MODIFY.memo
  is '��ע';
comment on column WII_PATIENT_IO_MODIFY.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENT_LAB
prompt ==============================
prompt
create table WII_PATIENT_LAB
(
  patient_id           VARCHAR2(50),
  inpatient_visitid    VARCHAR2(50),
  test_no              VARCHAR2(100),
  priority_indicator   NUMBER(1),
  working_id           VARCHAR2(20),
  requested_date_time  DATE,
  ordering_ward        NVARCHAR2(64),
  ordering_provider    NVARCHAR2(30),
  test_cause           NVARCHAR2(500),
  relevant_clinic_diag NVARCHAR2(200),
  specimen             VARCHAR2(100),
  specimen_barcode     VARCHAR2(16),
  notes_for_spcm       VARCHAR2(16),
  spcm_received_time   DATE,
  spcm_sample_time     DATE,
  performed_by         NVARCHAR2(64),
  spcm_execute_time    DATE,
  result_status        VARCHAR2(1),
  lab_result_time      DATE,
  reporter             NVARCHAR2(20),
  verified_by          NVARCHAR2(20),
  lab_no               VARCHAR2(500),
  lab_name             NVARCHAR2(800),
  verified_upload_time DATE,
  creator              NVARCHAR2(20),
  create_time          DATE default sysdate,
  modifier             NVARCHAR2(20),
  modify_time          DATE,
  unique_id            VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_LAB.patient_id
  is '����Ψһ��ʶ��';
comment on column WII_PATIENT_LAB.inpatient_visitid
  is 'סԺ��ţ���ʾÿ�λ���סԺ��Ψһ�ţ�����סԺ��+סԺ������';
comment on column WII_PATIENT_LAB.test_no
  is '�������';
comment on column WII_PATIENT_LAB.priority_indicator
  is '���ȱ�־';
comment on column WII_PATIENT_LAB.working_id
  is '��������';
comment on column WII_PATIENT_LAB.requested_date_time
  is '�������ڼ�ʱ��';
comment on column WII_PATIENT_LAB.ordering_ward
  is '���벡��';
comment on column WII_PATIENT_LAB.ordering_provider
  is '����ҽ��';
comment on column WII_PATIENT_LAB.test_cause
  is '����Ŀ��';
comment on column WII_PATIENT_LAB.relevant_clinic_diag
  is '�ٴ���ϣ��������뵥�ϣ�';
comment on column WII_PATIENT_LAB.specimen
  is '�걾';
comment on column WII_PATIENT_LAB.specimen_barcode
  is '�걾������';
comment on column WII_PATIENT_LAB.notes_for_spcm
  is '�걾˵��';
comment on column WII_PATIENT_LAB.spcm_received_time
  is '�걾ǩ��ʱ��';
comment on column WII_PATIENT_LAB.spcm_sample_time
  is '�걾����ʱ��';
comment on column WII_PATIENT_LAB.performed_by
  is 'ִ�п���';
comment on column WII_PATIENT_LAB.spcm_execute_time
  is '�걾���ʱ��';
comment on column WII_PATIENT_LAB.result_status
  is '���״̬';
comment on column WII_PATIENT_LAB.lab_result_time
  is '����ʱ��';
comment on column WII_PATIENT_LAB.reporter
  is '������';
comment on column WII_PATIENT_LAB.verified_by
  is '�����';
comment on column WII_PATIENT_LAB.lab_no
  is '������Ŀ��ţ�ҽԺ�����շ���Ŀ��';
comment on column WII_PATIENT_LAB.lab_name
  is '������Ŀ����';
comment on column WII_PATIENT_LAB.verified_upload_time
  is '����ϴ�ʱ��';
comment on column WII_PATIENT_LAB.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENT_LAB_20151223
prompt =======================================
prompt
create table WII_PATIENT_LAB_20151223
(
  patient_id           VARCHAR2(50) not null,
  inpatient_visitid    VARCHAR2(50),
  test_no              VARCHAR2(20) not null,
  priority_indicator   NUMBER(1),
  working_id           VARCHAR2(20),
  requested_date_time  DATE,
  ordering_ward        VARCHAR2(64),
  ordering_provider    VARCHAR2(30),
  lab_no               VARCHAR2(500),
  lab_name             VARCHAR2(800),
  test_cause           VARCHAR2(500),
  relevant_clinic_diag VARCHAR2(200),
  specimen             VARCHAR2(100),
  specimen_barcode     VARCHAR2(16),
  notes_for_spcm       VARCHAR2(16),
  spcm_received_time   DATE,
  spcm_sample_time     DATE,
  performed_by         VARCHAR2(64),
  spcm_execute_time    DATE,
  result_status        VARCHAR2(1),
  lab_result_time      DATE,
  reporter             VARCHAR2(20),
  verified_by          VARCHAR2(20),
  unique_id            VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table WII_PATIENT_LAB_BAK
prompt ==================================
prompt
create table WII_PATIENT_LAB_BAK
(
  patient_id           VARCHAR2(50) not null,
  inpatient_visitid    VARCHAR2(50),
  test_no              VARCHAR2(20) not null,
  priority_indicator   NUMBER(1),
  working_id           VARCHAR2(20),
  requested_date_time  DATE,
  ordering_ward        VARCHAR2(64),
  ordering_provider    VARCHAR2(30),
  lab_no               VARCHAR2(500),
  lab_name             VARCHAR2(800),
  test_cause           VARCHAR2(1000),
  relevant_clinic_diag VARCHAR2(200),
  specimen             VARCHAR2(100),
  specimen_barcode     VARCHAR2(16),
  notes_for_spcm       VARCHAR2(16),
  spcm_received_time   DATE,
  spcm_sample_time     DATE,
  performed_by         VARCHAR2(64),
  spcm_execute_time    DATE,
  result_status        VARCHAR2(1),
  lab_result_time      DATE,
  reporter             VARCHAR2(20),
  verified_by          VARCHAR2(20),
  unique_id            VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table WII_PATIENT_LAB_RESULT
prompt =====================================
prompt
create table WII_PATIENT_LAB_RESULT
(
  patient_id         VARCHAR2(40),
  inpatient_visitid  VARCHAR2(20),
  test_no            VARCHAR2(100),
  item_no            VARCHAR2(20),
  lab_result_time    DATE,
  print_order        NUMBER(8),
  report_item_name   NVARCHAR2(80),
  report_item_code   VARCHAR2(32),
  result             VARCHAR2(80),
  units              VARCHAR2(20),
  abnormal_indicator VARCHAR2(8),
  reference_result   VARCHAR2(500),
  creator            NVARCHAR2(20),
  create_time        DATE default sysdate,
  modifier           NVARCHAR2(20),
  modify_time        DATE,
  unique_id          VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 5M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_LAB_RESULT.patient_id
  is '����Ψһ��ʶ��';
comment on column WII_PATIENT_LAB_RESULT.inpatient_visitid
  is 'סԺ��ţ���ʾÿ�λ���סԺ��Ψһ�ţ�����סԺ��+סԺ������';
comment on column WII_PATIENT_LAB_RESULT.test_no
  is '�������';
comment on column WII_PATIENT_LAB_RESULT.item_no
  is '��Ŀ���';
comment on column WII_PATIENT_LAB_RESULT.lab_result_time
  is '����ʱ��';
comment on column WII_PATIENT_LAB_RESULT.print_order
  is '��ӡ���';
comment on column WII_PATIENT_LAB_RESULT.report_item_name
  is '���鱨����Ŀ����';
comment on column WII_PATIENT_LAB_RESULT.report_item_code
  is '���鱨����Ŀ����';
comment on column WII_PATIENT_LAB_RESULT.result
  is '������ֵ';
comment on column WII_PATIENT_LAB_RESULT.units
  is '������ֵ��λ';
comment on column WII_PATIENT_LAB_RESULT.abnormal_indicator
  is '���������־';
comment on column WII_PATIENT_LAB_RESULT.reference_result
  is '����ο�ֵ';
comment on column WII_PATIENT_LAB_RESULT.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENT_LAB_RESULT_BAK
prompt =========================================
prompt
create table WII_PATIENT_LAB_RESULT_BAK
(
  patient_id         VARCHAR2(40) not null,
  inpatient_visitid  VARCHAR2(20) not null,
  test_no            VARCHAR2(20) not null,
  item_no            VARCHAR2(200) not null,
  lab_result_time    DATE,
  print_order        NUMBER(8),
  report_item_name   VARCHAR2(80),
  report_item_code   VARCHAR2(200),
  result             VARCHAR2(80),
  units              VARCHAR2(20),
  abnormal_indicator VARCHAR2(8),
  reference_result   VARCHAR2(500),
  unique_id          VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table WII_PATIENT_LAB_RESULT_TEST
prompt ==========================================
prompt
create table WII_PATIENT_LAB_RESULT_TEST
(
  patient_id         VARCHAR2(40) not null,
  inpatient_visitid  VARCHAR2(20),
  test_no            VARCHAR2(20) not null,
  item_no            VARCHAR2(500) not null,
  lab_result_time    DATE,
  print_order        NUMBER(8),
  report_item_name   NVARCHAR2(80),
  report_item_code   VARCHAR2(200),
  result             VARCHAR2(80),
  units              VARCHAR2(20),
  abnormal_indicator VARCHAR2(8),
  reference_result   VARCHAR2(500),
  creator            NVARCHAR2(20),
  create_time        DATE default sysdate,
  modifier           NVARCHAR2(20),
  modify_time        DATE
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_PATIENT_LAB_RESULT_TEST.patient_id
  is '����Ψһ��ʶ��';
comment on column WII_PATIENT_LAB_RESULT_TEST.inpatient_visitid
  is 'סԺ��ţ���ʾÿ�λ���סԺ��Ψһ�ţ�����סԺ��+סԺ������';
comment on column WII_PATIENT_LAB_RESULT_TEST.test_no
  is '�������';
comment on column WII_PATIENT_LAB_RESULT_TEST.item_no
  is '��Ŀ���';
comment on column WII_PATIENT_LAB_RESULT_TEST.lab_result_time
  is '����ʱ��';
comment on column WII_PATIENT_LAB_RESULT_TEST.print_order
  is '��ӡ���';
comment on column WII_PATIENT_LAB_RESULT_TEST.report_item_name
  is '���鱨����Ŀ����';
comment on column WII_PATIENT_LAB_RESULT_TEST.report_item_code
  is '���鱨����Ŀ����';
comment on column WII_PATIENT_LAB_RESULT_TEST.result
  is '������ֵ';
comment on column WII_PATIENT_LAB_RESULT_TEST.units
  is '������ֵ��λ';
comment on column WII_PATIENT_LAB_RESULT_TEST.abnormal_indicator
  is '���������־';
comment on column WII_PATIENT_LAB_RESULT_TEST.reference_result
  is '����ο�ֵ';

prompt
prompt Creating table WII_PATIENT_LAB_TEST
prompt ===================================
prompt
create table WII_PATIENT_LAB_TEST
(
  patient_id           VARCHAR2(50) not null,
  inpatient_visitid    VARCHAR2(50),
  test_no              VARCHAR2(20) not null,
  priority_indicator   NUMBER(1),
  working_id           VARCHAR2(20),
  requested_date_time  DATE,
  ordering_ward        NVARCHAR2(64),
  ordering_provider    NVARCHAR2(30),
  lab_no               VARCHAR2(500),
  lab_name             NVARCHAR2(800),
  test_cause           NVARCHAR2(500),
  relevant_clinic_diag NVARCHAR2(200),
  specimen             VARCHAR2(100),
  specimen_barcode     VARCHAR2(16),
  notes_for_spcm       VARCHAR2(16),
  spcm_received_time   DATE,
  spcm_sample_time     DATE,
  performed_by         NVARCHAR2(64),
  spcm_execute_time    DATE,
  result_status        VARCHAR2(1),
  lab_result_time      DATE,
  reporter             NVARCHAR2(20),
  verified_by          NVARCHAR2(20),
  unique_id            VARCHAR2(50),
  creator              NVARCHAR2(20),
  create_time          DATE default sysdate,
  modifier             NVARCHAR2(20),
  modify_time          DATE
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_PATIENT_LAB_TEST.patient_id
  is '����Ψһ��ʶ��';
comment on column WII_PATIENT_LAB_TEST.inpatient_visitid
  is 'סԺ��ţ���ʾÿ�λ���סԺ��Ψһ�ţ�����סԺ��+סԺ������';
comment on column WII_PATIENT_LAB_TEST.test_no
  is '�������';
comment on column WII_PATIENT_LAB_TEST.priority_indicator
  is '���ȱ�־';
comment on column WII_PATIENT_LAB_TEST.working_id
  is '��������';
comment on column WII_PATIENT_LAB_TEST.requested_date_time
  is '�������ڼ�ʱ��';
comment on column WII_PATIENT_LAB_TEST.ordering_ward
  is '���벡��';
comment on column WII_PATIENT_LAB_TEST.ordering_provider
  is '����ҽ��';
comment on column WII_PATIENT_LAB_TEST.lab_no
  is '������Ŀ��ţ�ҽԺ�����շ���Ŀ��';
comment on column WII_PATIENT_LAB_TEST.lab_name
  is '������Ŀ����';
comment on column WII_PATIENT_LAB_TEST.test_cause
  is '����Ŀ��';
comment on column WII_PATIENT_LAB_TEST.relevant_clinic_diag
  is '�ٴ���ϣ��������뵥�ϣ�';
comment on column WII_PATIENT_LAB_TEST.specimen
  is '�걾';
comment on column WII_PATIENT_LAB_TEST.specimen_barcode
  is '�걾������';
comment on column WII_PATIENT_LAB_TEST.notes_for_spcm
  is '�걾˵��';
comment on column WII_PATIENT_LAB_TEST.spcm_received_time
  is '�걾ǩ��ʱ��';
comment on column WII_PATIENT_LAB_TEST.spcm_sample_time
  is '�걾����ʱ��';
comment on column WII_PATIENT_LAB_TEST.performed_by
  is 'ִ�п���';
comment on column WII_PATIENT_LAB_TEST.spcm_execute_time
  is '�걾���ʱ��';
comment on column WII_PATIENT_LAB_TEST.result_status
  is '���״̬';
comment on column WII_PATIENT_LAB_TEST.lab_result_time
  is '����ʱ��';
comment on column WII_PATIENT_LAB_TEST.reporter
  is '������';
comment on column WII_PATIENT_LAB_TEST.verified_by
  is '�����';
comment on column WII_PATIENT_LAB_TEST.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENT_LAS_GM_RESULTANTI
prompt ============================================
prompt
create table WII_PATIENT_LAS_GM_RESULTANTI
(
  barcode       VARCHAR2(16),
  testdate      VARCHAR2(8),
  machineid     VARCHAR2(16),
  sampleid      VARCHAR2(20),
  germid        VARCHAR2(64),
  resulttime    DATE,
  antiid        VARCHAR2(64),
  antiname      VARCHAR2(128),
  result        VARCHAR2(16),
  ranger        VARCHAR2(16),
  unit          VARCHAR2(16),
  flag          VARCHAR2(16),
  memo          NVARCHAR2(256),
  machineresult VARCHAR2(64),
  method        VARCHAR2(16),
  amendflag     VARCHAR2(16),
  priority      VARCHAR2(1),
  germseq       NUMBER,
  showorder     NUMBER,
  ranges        VARCHAR2(16),
  rangei        VARCHAR2(64),
  creator       NVARCHAR2(20),
  create_time   DATE default sysdate,
  modifier      NVARCHAR2(20),
  modify_time   DATE,
  unique_id     VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_PATIENT_LAS_GM_RESULTANTI.barcode
  is '�����';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.testdate
  is '��������';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.machineid
  is '����ID';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.sampleid
  is '������';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.germid
  is 'ϸ������';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.resulttime
  is '���ʱ��';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.antiid
  is '�����ر���';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.antiname
  is '����������';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.result
  is '���';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.ranger
  is '�ο���ΧR(��ҩ)';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.unit
  is '��λ';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.flag
  is '�����ʶ(S R I  IB)';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.memo
  is '��ע��Ϣ';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.machineresult
  is '�������';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.method
  is 'ʵ�鷽��(KB��MIC...)';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.amendflag
  is '����ֵ(S R I IB)';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.priority
  is 'ҩƷ���ȼ�(A,B,C,O,U)';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.germseq
  is 'ϸ������(��1��ʼ)';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.showorder
  is '��ʾ˳��';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.ranges
  is '�ο���ΧS(����)';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.rangei
  is '�ο���ΧI(�н�)';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENT_LAS_GM_SAMPLEREG
prompt ===========================================
prompt
create table WII_PATIENT_LAS_GM_SAMPLEREG
(
  testdate        VARCHAR2(8),
  machineid       VARCHAR2(16),
  sampleid        VARCHAR2(20),
  barcode         VARCHAR2(16),
  patienttype     VARCHAR2(16),
  patientid       VARCHAR2(16),
  patientseq      VARCHAR2(16),
  patientname     NVARCHAR2(64),
  patientsex      NVARCHAR2(16),
  patientage      VARCHAR2(8),
  patientageunit  VARCHAR2(16),
  patienttel      VARCHAR2(64),
  patientbedno    VARCHAR2(16),
  patientidenno   VARCHAR2(64),
  patientrace     VARCHAR2(64),
  patientsite     NVARCHAR2(256),
  execsqn         VARCHAR2(256),
  emc             VARCHAR2(1),
  hisitemidlist   VARCHAR2(256),
  hisitemnamelist NVARCHAR2(512),
  hisitemprice    NUMBER,
  doctorid        VARCHAR2(16),
  doctorname      NVARCHAR2(64),
  deptid          VARCHAR2(16),
  deptname        NVARCHAR2(64),
  ordertime       DATE,
  execdeptid      VARCHAR2(32),
  execdeptname    NVARCHAR2(64),
  wardid          VARCHAR2(16),
  wardname        NVARCHAR2(64),
  sampletype      VARCHAR2(64),
  samplestate     VARCHAR2(64),
  sampleposition  VARCHAR2(64),
  diagnosis       VARCHAR2(256),
  confirmstate    VARCHAR2(1),
  printstate      VARCHAR2(1),
  alertstate      VARCHAR2(1),
  state           VARCHAR2(16),
  testtype        VARCHAR2(16),
  groupid         VARCHAR2(16),
  nurseid         VARCHAR2(16),
  nursename       NVARCHAR2(64),
  sampletime      DATE,
  senderid        VARCHAR2(32),
  sendername      NVARCHAR2(64),
  sendtime        DATE,
  sendformid      VARCHAR2(16),
  inceptorid      VARCHAR2(64),
  inceptorname    NVARCHAR2(64),
  incepttime      DATE,
  accepterid      VARCHAR2(16),
  acceptername    NVARCHAR2(64),
  accepttime      DATE,
  approverid      VARCHAR2(16),
  approvername    NVARCHAR2(64),
  approvetime     DATE,
  memo            NVARCHAR2(256),
  printedtime     DATE,
  printerid       VARCHAR2(16),
  printername     NVARCHAR2(64),
  hospitalid      VARCHAR2(64),
  resulttype      VARCHAR2(8),
  lismemo         NVARCHAR2(256),
  isinoculated    VARCHAR2(1),
  birthday        DATE,
  isuploadmyla    VARCHAR2(1),
  isolasampletype VARCHAR2(16),
  isolaplate      VARCHAR2(64),
  bottlebarcode   VARCHAR2(64),
  isgcp           VARCHAR2(1),
  ishighrisk      VARCHAR2(1),
  barprinttime    DATE,
  samplegetname   NVARCHAR2(64),
  samplegetid     VARCHAR2(16),
  documenttime    DATE,
  documentid      VARCHAR2(16),
  documentname    NVARCHAR2(64),
  reporttime      DATE,
  creator         NVARCHAR2(20),
  create_time     DATE default sysdate,
  modifier        NVARCHAR2(20),
  modify_time     DATE,
  unique_id       VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.testdate
  is '��������';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.machineid
  is '����ID';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.sampleid
  is '������';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.barcode
  is '�����';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.patienttype
  is '��������';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.patientid
  is '���߱���';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.patientseq
  is '������ˮ��';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.patientname
  is '��������';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.patientsex
  is '�����Ա�';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.patientage
  is '��������';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.patientageunit
  is '���䵥λ';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.patienttel
  is '���ߵ绰';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.patientbedno
  is '���ߴ�λ��';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.patientidenno
  is '�������֤';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.patientrace
  is '��������';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.patientsite
  is '���߾�ס��';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.execsqn
  is 'ִ�е���';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.emc
  is '�����ʶ';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.hisitemidlist
  is '�շ���Ŀ����(15,171,F0001)';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.hisitemnamelist
  is '�շ���Ŀ�����б�';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.hisitemprice
  is '�շ���Ŀ�۸�';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.doctorid
  is '����ҽ������';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.doctorname
  is '����ҽ������';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.deptid
  is '�������ұ���';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.deptname
  is '������������';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.ordertime
  is '����ʱ��';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.execdeptid
  is 'ִ�п��ұ���';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.execdeptname
  is 'ִ�п�������';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.wardid
  is '���߲�������';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.wardname
  is '���߲�������';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.sampletype
  is '��������';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.samplestate
  is '�걾״̬';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.sampleposition
  is '�걾�ɼ���λ';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.diagnosis
  is 'ҽ�����';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.confirmstate
  is '��׼��ʶ.0:δ��׼,1:��׼,2:ȡ����׼,3:����.4.����;5:���';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.printstate
  is '��ӡ��ʶ:0:δ��ӡ,1:�Ѵ�ӡ';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.alertstate
  is 'Σ��ֵ״̬:0:��,1:��';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.state
  is '1 ������Ϣ��Դ;2 ����״̬;3 �Ƿ�Ϊ���ܺ�׼(�Զ���׼);4 ��Ϣ���ͱ�ʶ(���Կ���Ϊ����ƽ̨�ṩ);5 ˫��ϵͳ�����ʶ;6 �����Ƿ��˹����;7 �ⲿϵͳ�����Ѵ����ʶ';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.testtype
  is '��������';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.groupid
  is 'С�����';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.nurseid
  is '�����˱���';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.nursename
  is '����������';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.sampletime
  is '����ʱ��';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.senderid
  is '�ͼ�Ա����';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.sendername
  is '�ͼ�Ա����';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.sendtime
  is '�ͼ�Ա����ʱ��';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.sendformid
  is '�ͼ쵥����';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.inceptorid
  is '����ƽ����˱���';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.inceptorname
  is '����ƽ���������';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.incepttime
  is '����ƽ���ʱ��';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.accepterid
  is '�걾�����߱���';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.acceptername
  is '�걾����������';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.accepttime
  is '�걾����ʱ��';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.approverid
  is '�걾��׼�߱���';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.approvername
  is '�걾��׼������';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.approvetime
  is '�걾��׼ʱ��';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.memo
  is '��ע';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.printedtime
  is '���鵥��ӡʱ��';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.printerid
  is '���鵥��ӡ�߱���';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.printername
  is '���鵥��ӡ������';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.hospitalid
  is 'ҽԺ����(����)';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.resulttype
  is '�������8λ 1�̱���(0��1��) 2ҩ�� 3���̼�¼ 4Ѫ����';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.lismemo
  is 'LIS��ע��Ϣ';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.isinoculated
  is '�Ƿ��Ѿ�����(0:δ����,1:�ѽ���)';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.birthday
  is '��������(YYYY-MM-DD)';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.isuploadmyla
  is '�Ƿ����ϴ���MYLA(0:δ�ϴ���1:���ϴ�)';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.isolasampletype
  is '��������������';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.isolaplate
  is '������ƽ�����';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.bottlebarcode
  is '����ƿ����';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.isgcp
  is '�Ƿ�ҩ���ٴ�����(0:��,1:��)';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.ishighrisk
  is '�Ƿ��Σ����';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.barprinttime
  is '�����ӡʱ��';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.samplegetname
  is '����������';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.samplegetid
  is '�����˱���';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.documenttime
  is '�鵵ʱ��(����ʱ��)';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.documentid
  is '�鵵��ID';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.documentname
  is '�鵵������';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.reporttime
  is 'Ԥ�Ʊ���ʱ��';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENT_MASTER
prompt =================================
prompt
create table WII_PATIENT_MASTER
(
  patient_id           VARCHAR2(20),
  id_card              VARCHAR2(50),
  nationality_code     VARCHAR2(20),
  name_family          NVARCHAR2(50),
  name_first           NVARCHAR2(50),
  name_family_phonetic VARCHAR2(50),
  name_first_phonetic  VARCHAR2(50),
  gender               VARCHAR2(10),
  marry_status         VARCHAR2(10),
  birthday             DATE,
  birth_place          VARCHAR2(100),
  vip                  NUMBER(1),
  abo                  VARCHAR2(20),
  rh                   VARCHAR2(20),
  nation_code          VARCHAR2(20),
  home_address         NVARCHAR2(200),
  native_address       NVARCHAR2(200),
  mobile               VARCHAR2(50),
  telephone            VARCHAR2(50),
  home_phone           VARCHAR2(50),
  work_phone           VARCHAR2(50),
  email_email          VARCHAR2(50),
  create_time          DATE default sysdate,
  creator              NVARCHAR2(20),
  id_type              VARCHAR2(20),
  modifier             NVARCHAR2(20),
  modify_time          DATE,
  unique_id            VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 832K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_MASTER.patient_id
  is '����Ψһ��ʶ�ţ���ѡ���֤����ѡ��HISһ�¡�';
comment on column WII_PATIENT_MASTER.id_card
  is '֤������';
comment on column WII_PATIENT_MASTER.nationality_code
  is '��ݹ������';
comment on column WII_PATIENT_MASTER.name_family
  is '�������� ���� Family/ Last name��';
comment on column WII_PATIENT_MASTER.name_first
  is '�������� ����First name��';
comment on column WII_PATIENT_MASTER.name_family_phonetic
  is '������ ƴ������д���ּ���һ���ո�ָ��������ضϣ���ѡ��';
comment on column WII_PATIENT_MASTER.name_first_phonetic
  is '������ ƴ������д���ּ���һ���ո�ָ��������ضϣ���ѡ��';
comment on column WII_PATIENT_MASTER.gender
  is '�Ա����ĵ��С�Ů��δ֪��δ��';
comment on column WII_PATIENT_MASTER.marry_status
  is '����״������';
comment on column WII_PATIENT_MASTER.birthday
  is '��������';
comment on column WII_PATIENT_MASTER.birth_place
  is '������';
comment on column WII_PATIENT_MASTER.vip
  is '��Ҫ�����־��1-VIP 0-��VIP';
comment on column WII_PATIENT_MASTER.abo
  is 'ABOѪ��';
comment on column WII_PATIENT_MASTER.rh
  is 'RhѪ��';
comment on column WII_PATIENT_MASTER.nation_code
  is '������';
comment on column WII_PATIENT_MASTER.home_address
  is '��ͥסַ';
comment on column WII_PATIENT_MASTER.native_address
  is '������ַ';
comment on column WII_PATIENT_MASTER.mobile
  is '�ֻ�����';
comment on column WII_PATIENT_MASTER.telephone
  is '��ϵ�˵绰���ɷ�������Ϊ��Ϣ֪ͨ��';
comment on column WII_PATIENT_MASTER.home_phone
  is '��ͥ�绰';
comment on column WII_PATIENT_MASTER.work_phone
  is '�����绰';
comment on column WII_PATIENT_MASTER.email_email
  is '��������';
comment on column WII_PATIENT_MASTER.create_time
  is '����ʱ��';
comment on column WII_PATIENT_MASTER.creator
  is '������';
comment on column WII_PATIENT_MASTER.id_type
  is '֤������';
comment on column WII_PATIENT_MASTER.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENT_MASTER201655
prompt =======================================
prompt
create table WII_PATIENT_MASTER201655
(
  patient_id           VARCHAR2(20) not null,
  id_card              VARCHAR2(50),
  nationality_code     VARCHAR2(20),
  name_family          NVARCHAR2(50) not null,
  name_first           NVARCHAR2(50),
  name_family_phonetic VARCHAR2(50),
  name_first_phonetic  VARCHAR2(50),
  gender               VARCHAR2(10),
  marry_status         VARCHAR2(10),
  birthday             DATE,
  birth_place          VARCHAR2(100),
  vip                  NUMBER(1),
  abo                  VARCHAR2(20),
  rh                   VARCHAR2(20),
  nation_code          VARCHAR2(20),
  home_address         NVARCHAR2(200),
  native_address       NVARCHAR2(200),
  mobile               VARCHAR2(50),
  telephone            VARCHAR2(50),
  home_phone           VARCHAR2(50),
  work_phone           VARCHAR2(50),
  email_email          VARCHAR2(50),
  create_time          DATE,
  creator              NVARCHAR2(20),
  id_type              VARCHAR2(20),
  modifier             NVARCHAR2(20),
  modify_time          DATE
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table WII_PATIENT_MASTER_BAK
prompt =====================================
prompt
create table WII_PATIENT_MASTER_BAK
(
  patient_id           VARCHAR2(20) not null,
  id_card              VARCHAR2(50),
  nationality_code     VARCHAR2(20),
  name_family          NVARCHAR2(50) not null,
  name_first           NVARCHAR2(50),
  name_family_phonetic VARCHAR2(50),
  name_first_phonetic  VARCHAR2(50),
  gender               VARCHAR2(10),
  marry_status         VARCHAR2(10),
  birthday             DATE,
  birth_place          VARCHAR2(100),
  vip                  NUMBER(1),
  abo                  VARCHAR2(20),
  rh                   VARCHAR2(20),
  nation_code          VARCHAR2(20),
  home_address         NVARCHAR2(200),
  native_address       NVARCHAR2(200),
  mobile               VARCHAR2(50),
  telephone            VARCHAR2(50),
  home_phone           VARCHAR2(50),
  work_phone           VARCHAR2(50),
  email_email          VARCHAR2(50),
  create_time          DATE,
  creator              NVARCHAR2(20),
  id_type              VARCHAR2(20),
  modifier             NVARCHAR2(20),
  modify_time          DATE
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table WII_PATIENT_MASTER_BAK20160506
prompt =============================================
prompt
create table WII_PATIENT_MASTER_BAK20160506
(
  patient_id           VARCHAR2(20) not null,
  id_card              VARCHAR2(50),
  nationality_code     VARCHAR2(20),
  name_family          NVARCHAR2(50) not null,
  name_first           NVARCHAR2(50),
  name_family_phonetic VARCHAR2(50),
  name_first_phonetic  VARCHAR2(50),
  gender               VARCHAR2(10),
  marry_status         VARCHAR2(10),
  birthday             DATE,
  birth_place          VARCHAR2(100),
  vip                  NUMBER(1),
  abo                  VARCHAR2(20),
  rh                   VARCHAR2(20),
  nation_code          VARCHAR2(20),
  home_address         NVARCHAR2(200),
  native_address       NVARCHAR2(200),
  mobile               VARCHAR2(50),
  telephone            VARCHAR2(50),
  home_phone           VARCHAR2(50),
  work_phone           VARCHAR2(50),
  email_email          VARCHAR2(50),
  create_time          DATE,
  creator              NVARCHAR2(20),
  id_type              VARCHAR2(20),
  modifier             NVARCHAR2(20),
  modify_time          DATE
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table WII_PATIENT_NOTICE
prompt =================================
prompt
create table WII_PATIENT_NOTICE
(
  notice_no    NUMBER(11),
  patient_id   VARCHAR2(20),
  item_code    VARCHAR2(20),
  item_name    VARCHAR2(500),
  memo         NVARCHAR2(2000),
  notice_level NUMBER(1),
  notice_type  VARCHAR2(1),
  operator_by  VARCHAR2(20),
  operate_time DATE,
  creator      NVARCHAR2(20),
  create_time  DATE default sysdate,
  modifier     NVARCHAR2(20),
  modify_time  DATE,
  stop_by      NVARCHAR2(20),
  stop_time    DATE,
  unique_id    VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_NOTICE.notice_no
  is '��ˮ��';
comment on column WII_PATIENT_NOTICE.patient_id
  is '����Ψһ��ʶ��';
comment on column WII_PATIENT_NOTICE.item_code
  is '��Ŀ����';
comment on column WII_PATIENT_NOTICE.item_name
  is '��Ŀֵ';
comment on column WII_PATIENT_NOTICE.memo
  is '��ע';
comment on column WII_PATIENT_NOTICE.notice_level
  is '���Ѽ���';
comment on column WII_PATIENT_NOTICE.notice_type
  is '�������';
comment on column WII_PATIENT_NOTICE.operator_by
  is '������';
comment on column WII_PATIENT_NOTICE.operate_time
  is '����ʱ��';
comment on column WII_PATIENT_NOTICE.creator
  is '������';
comment on column WII_PATIENT_NOTICE.create_time
  is '����ʱ��';
comment on column WII_PATIENT_NOTICE.modifier
  is '�޸���';
comment on column WII_PATIENT_NOTICE.modify_time
  is '�޸�ʱ��';
comment on column WII_PATIENT_NOTICE.stop_by
  is 'ֹͣ��';
comment on column WII_PATIENT_NOTICE.stop_time
  is 'ֹͣʱ��';
comment on column WII_PATIENT_NOTICE.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENT_NURSING_RECORD
prompt =========================================
prompt
create table WII_PATIENT_NURSING_RECORD
(
  patient_id   VARCHAR2(20),
  score_code   VARCHAR2(50),
  nursing_code VARCHAR2(20),
  time_point   DATE,
  creator      NVARCHAR2(20),
  create_time  DATE default sysdate,
  modifier     NVARCHAR2(20),
  modify_time  DATE,
  unique_id    VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_PATIENT_NURSING_RECORD.patient_id
  is '���߱��';
comment on column WII_PATIENT_NURSING_RECORD.score_code
  is '���ֱ��';
comment on column WII_PATIENT_NURSING_RECORD.nursing_code
  is '������Ŀ���';
comment on column WII_PATIENT_NURSING_RECORD.time_point
  is '����ʱ��';
comment on column WII_PATIENT_NURSING_RECORD.creator
  is '������';
comment on column WII_PATIENT_NURSING_RECORD.create_time
  is '����ʱ��';
comment on column WII_PATIENT_NURSING_RECORD.modifier
  is '�޸���';
comment on column WII_PATIENT_NURSING_RECORD.modify_time
  is '�޸�ʱ��';
comment on column WII_PATIENT_NURSING_RECORD.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENT_NURSING_TURN_OVER
prompt ============================================
prompt
create table WII_PATIENT_NURSING_TURN_OVER
(
  patient_id              VARCHAR2(20),
  nursing_time            DATE,
  postur_before_code      VARCHAR2(30),
  postur_now_code         VARCHAR2(30),
  water_bag_decompression VARCHAR2(30),
  bed_elevation           VARCHAR2(30),
  operator                NVARCHAR2(30),
  operate_time            DATE,
  memo                    NVARCHAR2(300),
  creator                 NVARCHAR2(20),
  create_time             DATE default sysdate,
  modifier                NVARCHAR2(20),
  modify_time             DATE,
  unique_id               VARCHAR2(50) default sys_guid(),
  tailstock_elevation     VARCHAR2(30)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_NURSING_TURN_OVER.patient_id
  is '���߱��';
comment on column WII_PATIENT_NURSING_TURN_OVER.nursing_time
  is '����ʱ��';
comment on column WII_PATIENT_NURSING_TURN_OVER.postur_before_code
  is 'ԭ��λ���';
comment on column WII_PATIENT_NURSING_TURN_OVER.postur_now_code
  is '������λ���';
comment on column WII_PATIENT_NURSING_TURN_OVER.water_bag_decompression
  is '�Ƿ�ˮ�Ҽ�ѹ';
comment on column WII_PATIENT_NURSING_TURN_OVER.bed_elevation
  is '�Ƿ�ͷ̧��';
comment on column WII_PATIENT_NURSING_TURN_OVER.operator
  is '����Ա';
comment on column WII_PATIENT_NURSING_TURN_OVER.operate_time
  is '����ʱ��';
comment on column WII_PATIENT_NURSING_TURN_OVER.memo
  is '��ע';
comment on column WII_PATIENT_NURSING_TURN_OVER.creator
  is '������';
comment on column WII_PATIENT_NURSING_TURN_OVER.create_time
  is '����ʱ��';
comment on column WII_PATIENT_NURSING_TURN_OVER.modifier
  is '�޸���';
comment on column WII_PATIENT_NURSING_TURN_OVER.modify_time
  is '�޸�ʱ��';
comment on column WII_PATIENT_NURSING_TURN_OVER.unique_id
  is '����ΨһID';
comment on column WII_PATIENT_NURSING_TURN_OVER.tailstock_elevation
  is '��β̧��';

prompt
prompt Creating table WII_PATIENT_PIGEONHOLE
prompt =====================================
prompt
create table WII_PATIENT_PIGEONHOLE
(
  patient_id        VARCHAR2(30),
  inpatient_visitid VARCHAR2(30),
  inward_visitid    VARCHAR2(30),
  ward_code         VARCHAR2(30),
  doc_code          VARCHAR2(30),
  creator           NVARCHAR2(20),
  create_time       DATE default sysdate,
  modifier          NVARCHAR2(20),
  modify_time       DATE,
  unique_id         VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_PATIENT_PIGEONHOLE.patient_id
  is '����ID';
comment on column WII_PATIENT_PIGEONHOLE.inpatient_visitid
  is 'סԺ���';
comment on column WII_PATIENT_PIGEONHOLE.inward_visitid
  is '�벡�����';
comment on column WII_PATIENT_PIGEONHOLE.ward_code
  is '����CODE';
comment on column WII_PATIENT_PIGEONHOLE.doc_code
  is '�ĵ�����';
comment on column WII_PATIENT_PIGEONHOLE.creator
  is '������';
comment on column WII_PATIENT_PIGEONHOLE.create_time
  is '����ʱ��';
comment on column WII_PATIENT_PIGEONHOLE.modifier
  is '�޸���';
comment on column WII_PATIENT_PIGEONHOLE.modify_time
  is '�޸�ʱ��';
comment on column WII_PATIENT_PIGEONHOLE.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENT_PIGEONHOLE_CONFIG
prompt ============================================
prompt
create table WII_PATIENT_PIGEONHOLE_CONFIG
(
  inward_visitid VARCHAR2(50),
  doc_code       VARCHAR2(50),
  config_content VARCHAR2(2000),
  operator       VARCHAR2(20),
  operate_time   DATE,
  create_time    DATE default sysdate,
  creator        VARCHAR2(30),
  modifier       VARCHAR2(30),
  modify_time    DATE,
  unique_id      VARCHAR2(50) default sys_guid(),
  start_time     DATE,
  end_time       DATE
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_PATIENT_PIGEONHOLE_CONFIG
  is '�鵵�ļ�����';
comment on column WII_PATIENT_PIGEONHOLE_CONFIG.inward_visitid
  is '�벡�����';
comment on column WII_PATIENT_PIGEONHOLE_CONFIG.doc_code
  is '�鵵�ļ�����';
comment on column WII_PATIENT_PIGEONHOLE_CONFIG.config_content
  is '��������';
comment on column WII_PATIENT_PIGEONHOLE_CONFIG.operator
  is '����Ա';
comment on column WII_PATIENT_PIGEONHOLE_CONFIG.operate_time
  is '����ʱ��';
comment on column WII_PATIENT_PIGEONHOLE_CONFIG.create_time
  is '����ʱ��';
comment on column WII_PATIENT_PIGEONHOLE_CONFIG.creator
  is '������';
comment on column WII_PATIENT_PIGEONHOLE_CONFIG.modifier
  is '�޸���';
comment on column WII_PATIENT_PIGEONHOLE_CONFIG.modify_time
  is '�޸�ʱ��';
comment on column WII_PATIENT_PIGEONHOLE_CONFIG.unique_id
  is '����ΨһID';
comment on column WII_PATIENT_PIGEONHOLE_CONFIG.start_time
  is '��ʼʱ��';
comment on column WII_PATIENT_PIGEONHOLE_CONFIG.end_time
  is '����ʱ��';

prompt
prompt Creating table WII_PATIENT_PROFILEITEM
prompt ======================================
prompt
create table WII_PATIENT_PROFILEITEM
(
  patient_id   VARCHAR2(20),
  ward_code    VARCHAR2(20),
  module_code  VARCHAR2(20),
  item_code    VARCHAR2(20),
  item_value   VARCHAR2(200),
  item_content VARCHAR2(200),
  description  NVARCHAR2(200),
  sort_no      NUMBER(2),
  creator      NVARCHAR2(20),
  create_time  DATE default sysdate,
  modifier     NVARCHAR2(20),
  modify_time  DATE,
  unique_id    VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_PROFILEITEM.patient_id
  is '���߱��';
comment on column WII_PATIENT_PROFILEITEM.ward_code
  is '���ұ��';
comment on column WII_PATIENT_PROFILEITEM.module_code
  is 'ģ�����';
comment on column WII_PATIENT_PROFILEITEM.item_code
  is '���߸��Ի����������';
comment on column WII_PATIENT_PROFILEITEM.item_value
  is '���߸��Ի�������ֵ';
comment on column WII_PATIENT_PROFILEITEM.item_content
  is '������';
comment on column WII_PATIENT_PROFILEITEM.description
  is '˵��';
comment on column WII_PATIENT_PROFILEITEM.sort_no
  is '����';
comment on column WII_PATIENT_PROFILEITEM.creator
  is '������';
comment on column WII_PATIENT_PROFILEITEM.create_time
  is '����ʱ��';
comment on column WII_PATIENT_PROFILEITEM.modifier
  is '�޸���';
comment on column WII_PATIENT_PROFILEITEM.modify_time
  is '�޸�ʱ��';
comment on column WII_PATIENT_PROFILEITEM.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENT_RESCUE_REC
prompt =====================================
prompt
create table WII_PATIENT_RESCUE_REC
(
  rescue_no             NUMBER(11),
  patient_id            VARCHAR2(20),
  rescue_start_time     DATE,
  rescue_start_operator NVARCHAR2(30),
  rescue_end_time       DATE,
  rescue_end_operator   NVARCHAR2(30),
  creator               NVARCHAR2(20),
  create_time           DATE default sysdate,
  rescue_result         VARCHAR2(10),
  memo                  NVARCHAR2(500),
  modifier              NVARCHAR2(20),
  modify_time           DATE,
  unique_id             VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_RESCUE_REC.rescue_no
  is '���ȼ�¼���';
comment on column WII_PATIENT_RESCUE_REC.patient_id
  is '����ID';
comment on column WII_PATIENT_RESCUE_REC.rescue_start_time
  is '���ȿ�ʼʱ��';
comment on column WII_PATIENT_RESCUE_REC.rescue_start_operator
  is '���ȿ�ʼ������';
comment on column WII_PATIENT_RESCUE_REC.rescue_end_time
  is '���Ƚ���ʱ��';
comment on column WII_PATIENT_RESCUE_REC.rescue_end_operator
  is '���Ƚ���������';
comment on column WII_PATIENT_RESCUE_REC.creator
  is '������';
comment on column WII_PATIENT_RESCUE_REC.create_time
  is '����ʱ��';
comment on column WII_PATIENT_RESCUE_REC.rescue_result
  is '����ת����';
comment on column WII_PATIENT_RESCUE_REC.memo
  is '��ע';
comment on column WII_PATIENT_RESCUE_REC.modifier
  is '�޸���';
comment on column WII_PATIENT_RESCUE_REC.modify_time
  is '�޸�ʱ��';
comment on column WII_PATIENT_RESCUE_REC.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENT_SCORE
prompt ================================
prompt
create table WII_PATIENT_SCORE
(
  patient_id        VARCHAR2(20),
  item_code         VARCHAR2(50),
  item_name         VARCHAR2(50),
  scoring_date_time DATE,
  scoring_value     VARCHAR2(20),
  degree            VARCHAR2(40),
  death_probability NUMBER(5,4),
  pat_condition     VARCHAR2(80),
  ward_code         VARCHAR2(20),
  memo              NVARCHAR2(2000),
  operator          NVARCHAR2(30),
  operator_datetime DATE,
  part_code         VARCHAR2(20),
  creator           NVARCHAR2(20),
  create_time       DATE default sysdate,
  modifier          NVARCHAR2(20),
  modify_time       DATE,
  unique_id         VARCHAR2(50) default sys_guid(),
  full_mark         NUMBER(4),
  score_grade       NVARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 384K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_SCORE.patient_id
  is '����ID';
comment on column WII_PATIENT_SCORE.item_code
  is '������Ŀ����';
comment on column WII_PATIENT_SCORE.item_name
  is '������Ŀ����';
comment on column WII_PATIENT_SCORE.scoring_date_time
  is '����ʱ��';
comment on column WII_PATIENT_SCORE.scoring_value
  is '����ֵ';
comment on column WII_PATIENT_SCORE.degree
  is 'Σ�س̶�';
comment on column WII_PATIENT_SCORE.death_probability
  is '������';
comment on column WII_PATIENT_SCORE.pat_condition
  is '��������';
comment on column WII_PATIENT_SCORE.ward_code
  is '��������';
comment on column WII_PATIENT_SCORE.memo
  is '��ע';
comment on column WII_PATIENT_SCORE.operator
  is '������';
comment on column WII_PATIENT_SCORE.operator_datetime
  is '����ʱ��';
comment on column WII_PATIENT_SCORE.part_code
  is '��λ���';
comment on column WII_PATIENT_SCORE.unique_id
  is '����ΨһID';
comment on column WII_PATIENT_SCORE.full_mark
  is '����';
comment on column WII_PATIENT_SCORE.score_grade
  is '���ֵȼ�';

prompt
prompt Creating table WII_PATIENT_SCORE_DETAIL
prompt =======================================
prompt
create table WII_PATIENT_SCORE_DETAIL
(
  patient_id     VARCHAR2(20),
  scoring_code   VARCHAR2(50),
  scoring_time   DATE,
  control_name   VARCHAR2(100),
  control_value  VARCHAR2(100),
  item_code      VARCHAR2(100),
  memo           NVARCHAR2(200),
  creator        NVARCHAR2(20),
  create_time    DATE default sysdate,
  modifier       NVARCHAR2(20),
  modify_time    DATE,
  unique_id      VARCHAR2(50) default sys_guid(),
  control_name_c VARCHAR2(300)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 3M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_SCORE_DETAIL.patient_id
  is '����Ψһ��ʶ��';
comment on column WII_PATIENT_SCORE_DETAIL.scoring_code
  is '��Ŀ����';
comment on column WII_PATIENT_SCORE_DETAIL.scoring_time
  is '����ʱ��';
comment on column WII_PATIENT_SCORE_DETAIL.control_name
  is '�ؼ�����';
comment on column WII_PATIENT_SCORE_DETAIL.control_value
  is '�ؼ�ֵ';
comment on column WII_PATIENT_SCORE_DETAIL.item_code
  is '��Ŀ����';
comment on column WII_PATIENT_SCORE_DETAIL.memo
  is '��ע';
comment on column WII_PATIENT_SCORE_DETAIL.creator
  is '������';
comment on column WII_PATIENT_SCORE_DETAIL.create_time
  is '����ʱ��';
comment on column WII_PATIENT_SCORE_DETAIL.modifier
  is '�޸���';
comment on column WII_PATIENT_SCORE_DETAIL.modify_time
  is '�޸�ʱ��';
comment on column WII_PATIENT_SCORE_DETAIL.unique_id
  is '����ΨһID';
comment on column WII_PATIENT_SCORE_DETAIL.control_name_c
  is '�ؼ���������';

prompt
prompt Creating table WII_PATIENT_SCORE_DETAIL_C_B
prompt ===========================================
prompt
create table WII_PATIENT_SCORE_DETAIL_C_B
(
  scoring_code          VARCHAR2(50),
  control_name          VARCHAR2(50),
  control_bind_entity   VARCHAR2(100),
  control_bind_property VARCHAR2(200),
  item_range            VARCHAR2(50),
  item_calculate        VARCHAR2(80)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_SCORE_DETAIL_C_B.scoring_code
  is '��Ŀ����';
comment on column WII_PATIENT_SCORE_DETAIL_C_B.control_name
  is '�ؼ�����';
comment on column WII_PATIENT_SCORE_DETAIL_C_B.control_bind_entity
  is '�ؼ��󶨶�������';
comment on column WII_PATIENT_SCORE_DETAIL_C_B.control_bind_property
  is '�ؼ��󶨶�����������';
comment on column WII_PATIENT_SCORE_DETAIL_C_B.item_range
  is '��ѡmax��min';

prompt
prompt Creating table WII_PATIENT_SIGNS
prompt ================================
prompt
create table WII_PATIENT_SIGNS
(
  patient_id           VARCHAR2(20),
  gen_time             DATE,
  monitoring_code      VARCHAR2(100),
  monitoring_name      VARCHAR2(50),
  value                VARCHAR2(20),
  monitoring_unit_code VARCHAR2(20),
  itemvalue_type       VARCHAR2(20),
  standard_range       VARCHAR2(50),
  device_id            VARCHAR2(20),
  origin               NUMBER(1),
  memo                 NVARCHAR2(50),
  create_time          DATE default sysdate,
  creator              NVARCHAR2(20),
  status               NUMBER(1),
  origin_time          DATE,
  modifier             NVARCHAR2(20),
  modify_time          DATE,
  unique_id            VARCHAR2(50) default sys_guid(),
  operator             VARCHAR2(20),
  flag                 VARCHAR2(100),
  group_code           VARCHAR2(100) default sys_guid(),
  viewreport           NVARCHAR2(20),
  input_source         NUMBER(2)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 256K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_SIGNS.patient_id
  is '����Ψһ��ʶ��';
comment on column WII_PATIENT_SIGNS.gen_time
  is 'ָ������ʱ�䣨ȡTicks����ȷ�����룬�����Σ�';
comment on column WII_PATIENT_SIGNS.monitoring_code
  is 'ָ�������';
comment on column WII_PATIENT_SIGNS.monitoring_name
  is 'ָ��������';
comment on column WII_PATIENT_SIGNS.value
  is 'ָ��ֵ';
comment on column WII_PATIENT_SIGNS.monitoring_unit_code
  is 'ָ�굥λ����';
comment on column WII_PATIENT_SIGNS.itemvalue_type
  is 'ָ��ֵ���ͣ���ֵ���ַ���������';
comment on column WII_PATIENT_SIGNS.standard_range
  is '��׼ֵ��Χ';
comment on column WII_PATIENT_SIGNS.device_id
  is 'ָ��ɼ���Դ�豸��ǩ';
comment on column WII_PATIENT_SIGNS.origin
  is '��¼��ʽ����Դ����1 �豸��ȡ��0 �ֹ���¼��';
comment on column WII_PATIENT_SIGNS.memo
  is '��ע';
comment on column WII_PATIENT_SIGNS.create_time
  is '��¼����ʱ��';
comment on column WII_PATIENT_SIGNS.creator
  is '�����ˣ���Ա��Ż����豸��ţ�';
comment on column WII_PATIENT_SIGNS.status
  is '��¼״̬��1 ���ã�0 �����ã�';
comment on column WII_PATIENT_SIGNS.origin_time
  is '�豸��¼ʱ��';
comment on column WII_PATIENT_SIGNS.unique_id
  is '����ΨһID';
comment on column WII_PATIENT_SIGNS.operator
  is '������';
comment on column WII_PATIENT_SIGNS.flag
  is '��ʶ';
comment on column WII_PATIENT_SIGNS.group_code
  is '�����ʶ';
comment on column WII_PATIENT_SIGNS.viewreport
  is '��ʾ����(��ʶ��������ʾλ��)';
comment on column WII_PATIENT_SIGNS.input_source
  is '���� =0,����¼��=1,�ല¼�� = 2,���� = 3,PDA = 4,';

prompt
prompt Creating table WII_PATIENT_SIGNS_ALARM
prompt ======================================
prompt
create table WII_PATIENT_SIGNS_ALARM
(
  patient_id        VARCHAR2(20),
  ward_code         VARCHAR2(20),
  signs_code        VARCHAR2(20),
  signs_name        VARCHAR2(20),
  signs_min_values  VARCHAR2(100),
  signs_max_values  VARCHAR2(100),
  creator           NVARCHAR2(20),
  create_time       DATE default sysdate,
  modifier          NVARCHAR2(20),
  modify_time       DATE,
  unique_id         VARCHAR2(50) default sys_guid(),
  operate_time      DATE,
  range             VARCHAR2(100),
  special_code      VARCHAR2(30),
  special_flag      VARCHAR2(50),
  alarm_type        NUMBER(2),
  remind_min_values VARCHAR2(100),
  remind_max_values VARCHAR2(100)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_SIGNS_ALARM.patient_id
  is '����ID';
comment on column WII_PATIENT_SIGNS_ALARM.ward_code
  is '��������';
comment on column WII_PATIENT_SIGNS_ALARM.signs_code
  is '��������';
comment on column WII_PATIENT_SIGNS_ALARM.signs_name
  is '��������';
comment on column WII_PATIENT_SIGNS_ALARM.signs_min_values
  is '��ֵ��������';
comment on column WII_PATIENT_SIGNS_ALARM.signs_max_values
  is '��ֵ��������';
comment on column WII_PATIENT_SIGNS_ALARM.creator
  is '������';
comment on column WII_PATIENT_SIGNS_ALARM.create_time
  is '����ʱ��';
comment on column WII_PATIENT_SIGNS_ALARM.modifier
  is '�޸���';
comment on column WII_PATIENT_SIGNS_ALARM.modify_time
  is '�޸�ʱ��';
comment on column WII_PATIENT_SIGNS_ALARM.unique_id
  is '����ΨһID';
comment on column WII_PATIENT_SIGNS_ALARM.operate_time
  is '����ʱ��';
comment on column WII_PATIENT_SIGNS_ALARM.range
  is '��Χ�������ã��ؼ����У�[Age]��';
comment on column WII_PATIENT_SIGNS_ALARM.special_code
  is 'ר��Code';
comment on column WII_PATIENT_SIGNS_ALARM.special_flag
  is 'ר�Ʊ�ʶ';
comment on column WII_PATIENT_SIGNS_ALARM.alarm_type
  is '���� 0������ 1������';
comment on column WII_PATIENT_SIGNS_ALARM.remind_min_values
  is '��ֵ��������';
comment on column WII_PATIENT_SIGNS_ALARM.remind_max_values
  is '��ֵ��������';

prompt
prompt Creating table WII_PATIENT_SIGNS_ALARMHST
prompt =========================================
prompt
create table WII_PATIENT_SIGNS_ALARMHST
(
  patient_id       VARCHAR2(20),
  ward_code        VARCHAR2(20),
  signs_code       VARCHAR2(20),
  signs_name       VARCHAR2(20),
  signs_min_values NUMBER(6,2),
  signs_max_values NUMBER(6,2),
  creator          NVARCHAR2(20),
  create_time      DATE default sysdate,
  modifier         NVARCHAR2(20),
  modify_time      DATE,
  unique_id        VARCHAR2(50) default sys_guid(),
  operate_time     DATE
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_SIGNS_ALARMHST.patient_id
  is '����ID';
comment on column WII_PATIENT_SIGNS_ALARMHST.ward_code
  is '��������';
comment on column WII_PATIENT_SIGNS_ALARMHST.signs_code
  is '��������';
comment on column WII_PATIENT_SIGNS_ALARMHST.signs_name
  is '��������';
comment on column WII_PATIENT_SIGNS_ALARMHST.signs_min_values
  is '����ֵ����';
comment on column WII_PATIENT_SIGNS_ALARMHST.signs_max_values
  is '����ֵ����';
comment on column WII_PATIENT_SIGNS_ALARMHST.creator
  is '������';
comment on column WII_PATIENT_SIGNS_ALARMHST.create_time
  is '����ʱ��';
comment on column WII_PATIENT_SIGNS_ALARMHST.modifier
  is '�޸���';
comment on column WII_PATIENT_SIGNS_ALARMHST.modify_time
  is '�޸�ʱ��';
comment on column WII_PATIENT_SIGNS_ALARMHST.unique_id
  is '����ΨһID';
comment on column WII_PATIENT_SIGNS_ALARMHST.operate_time
  is '����ʱ��';

prompt
prompt Creating table WII_PATIENT_SIGNS_GATHER
prompt =======================================
prompt
create table WII_PATIENT_SIGNS_GATHER
(
  device_id      VARCHAR2(20),
  gen_time       NUMBER(20),
  gen_date       VARCHAR2(20),
  signitem_code  VARCHAR2(20),
  signtime_value VARCHAR2(20),
  creator        NVARCHAR2(20),
  create_time    DATE default sysdate,
  modifier       NVARCHAR2(20),
  modify_time    DATE,
  unique_id      VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_SIGNS_GATHER.device_id
  is '�豸��ǩ';
comment on column WII_PATIENT_SIGNS_GATHER.gen_time
  is 'ָ������ʱ�䣨ȡTicks����ȷ�����룬�����Σ�';
comment on column WII_PATIENT_SIGNS_GATHER.gen_date
  is 'ָ���������ڣ����磺20150205��';
comment on column WII_PATIENT_SIGNS_GATHER.signitem_code
  is 'ָ�������';
comment on column WII_PATIENT_SIGNS_GATHER.signtime_value
  is 'ָ��ֵ';
comment on column WII_PATIENT_SIGNS_GATHER.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENT_SIGNS_MODIFY
prompt =======================================
prompt
create table WII_PATIENT_SIGNS_MODIFY
(
  patient_id           VARCHAR2(20),
  gen_time             DATE,
  monitoring_code      VARCHAR2(20),
  monitoring_name      VARCHAR2(50),
  value                VARCHAR2(20),
  monitoring_unit_code VARCHAR2(20),
  itemvalue_type       VARCHAR2(20),
  standard_range       VARCHAR2(50),
  device_id            VARCHAR2(20),
  origin               NUMBER(1),
  memo                 NVARCHAR2(50),
  create_time          DATE default sysdate,
  creator              NVARCHAR2(20),
  status               NUMBER(1),
  modify_time          DATE,
  modifier             NVARCHAR2(20),
  unique_id            VARCHAR2(50) default sys_guid(),
  operator             VARCHAR2(20),
  origin_time          DATE,
  flag                 VARCHAR2(100),
  group_code           VARCHAR2(100)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 192K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_SIGNS_MODIFY.patient_id
  is '����Ψһ��ʶ��';
comment on column WII_PATIENT_SIGNS_MODIFY.gen_time
  is 'ָ������ʱ�䣨ȡTicks����ȷ�����룬�����Σ�';
comment on column WII_PATIENT_SIGNS_MODIFY.monitoring_code
  is 'ָ�������';
comment on column WII_PATIENT_SIGNS_MODIFY.monitoring_name
  is 'ָ��������';
comment on column WII_PATIENT_SIGNS_MODIFY.value
  is 'ָ��ֵ';
comment on column WII_PATIENT_SIGNS_MODIFY.monitoring_unit_code
  is 'ָ�굥λ����';
comment on column WII_PATIENT_SIGNS_MODIFY.itemvalue_type
  is 'ָ��ֵ���ͣ���ֵ���ַ���������';
comment on column WII_PATIENT_SIGNS_MODIFY.standard_range
  is '��׼ֵ��Χ';
comment on column WII_PATIENT_SIGNS_MODIFY.device_id
  is 'ָ��ɼ���Դ�豸��ǩ';
comment on column WII_PATIENT_SIGNS_MODIFY.origin
  is '��¼��ʽ����Դ����1 �豸��ȡ��0 �ֹ���¼��';
comment on column WII_PATIENT_SIGNS_MODIFY.memo
  is '��ע';
comment on column WII_PATIENT_SIGNS_MODIFY.create_time
  is '��¼����ʱ��';
comment on column WII_PATIENT_SIGNS_MODIFY.creator
  is '�����ˣ���Ա��Ż����豸��ţ�';
comment on column WII_PATIENT_SIGNS_MODIFY.status
  is '��¼״̬��1 ���ã�0 �����ã�';
comment on column WII_PATIENT_SIGNS_MODIFY.modify_time
  is '����ʱ��';
comment on column WII_PATIENT_SIGNS_MODIFY.modifier
  is '����ҽ��';
comment on column WII_PATIENT_SIGNS_MODIFY.unique_id
  is '����ΨһID';
comment on column WII_PATIENT_SIGNS_MODIFY.operator
  is '������';
comment on column WII_PATIENT_SIGNS_MODIFY.origin_time
  is '�豸�ɼ�ʱ��';
comment on column WII_PATIENT_SIGNS_MODIFY.flag
  is '��ʶ';
comment on column WII_PATIENT_SIGNS_MODIFY.group_code
  is '�����ʶ';

prompt
prompt Creating table WII_PATIENT_SIGNS_TARGET
prompt =======================================
prompt
create table WII_PATIENT_SIGNS_TARGET
(
  patient_id   VARCHAR2(20),
  item_code    VARCHAR2(20),
  start_time   DATE,
  item_value   VARCHAR2(20),
  end_time     DATE,
  operator_by  NVARCHAR2(20),
  operate_time DATE,
  creator      NVARCHAR2(20),
  create_time  DATE default sysdate,
  modifier     NVARCHAR2(20),
  modify_time  DATE,
  unique_id    VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_PATIENT_SIGNS_TARGET.patient_id
  is '����Ψһ��ʶ��';
comment on column WII_PATIENT_SIGNS_TARGET.item_code
  is '��Ŀ����';
comment on column WII_PATIENT_SIGNS_TARGET.start_time
  is '��ʼʱ��';
comment on column WII_PATIENT_SIGNS_TARGET.item_value
  is '��Ŀֵ';
comment on column WII_PATIENT_SIGNS_TARGET.end_time
  is '����ʱ��';
comment on column WII_PATIENT_SIGNS_TARGET.operator_by
  is '������';
comment on column WII_PATIENT_SIGNS_TARGET.operate_time
  is '����ʱ��';
comment on column WII_PATIENT_SIGNS_TARGET.creator
  is '������';
comment on column WII_PATIENT_SIGNS_TARGET.create_time
  is '����ʱ��';
comment on column WII_PATIENT_SIGNS_TARGET.modifier
  is '�޸���';
comment on column WII_PATIENT_SIGNS_TARGET.modify_time
  is '�޸�ʱ��';
comment on column WII_PATIENT_SIGNS_TARGET.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENT_SMS_REC
prompt ==================================
prompt
create table WII_PATIENT_SMS_REC
(
  sms_no         NUMBER(10),
  patient_id     VARCHAR2(50),
  sms_batch      VARCHAR2(50),
  receiver_phone VARCHAR2(20),
  receiver_type  VARCHAR2(1),
  receiver_name  NVARCHAR2(50),
  sms_content    NVARCHAR2(500),
  sms_status     VARCHAR2(30),
  operator       NVARCHAR2(30),
  operate_time   DATE,
  creator        NVARCHAR2(20),
  create_time    DATE default sysdate,
  modifier       NVARCHAR2(20),
  modify_time    DATE,
  unique_id      VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_PATIENT_SMS_REC.sms_no
  is '���ŷ��ͱ��';
comment on column WII_PATIENT_SMS_REC.patient_id
  is '���߱��';
comment on column WII_PATIENT_SMS_REC.sms_batch
  is '��������';
comment on column WII_PATIENT_SMS_REC.receiver_phone
  is '�ֻ�����';
comment on column WII_PATIENT_SMS_REC.receiver_type
  is '0:���߱���  1:���߼���  2:������ϵ��';
comment on column WII_PATIENT_SMS_REC.receiver_name
  is '����������';
comment on column WII_PATIENT_SMS_REC.sms_content
  is '��������';
comment on column WII_PATIENT_SMS_REC.sms_status
  is '����״̬';
comment on column WII_PATIENT_SMS_REC.operator
  is '֪ͨ��';
comment on column WII_PATIENT_SMS_REC.operate_time
  is '����ʱ��';
comment on column WII_PATIENT_SMS_REC.creator
  is '������';
comment on column WII_PATIENT_SMS_REC.create_time
  is '����ʱ��';
comment on column WII_PATIENT_SMS_REC.modifier
  is '�޸���';
comment on column WII_PATIENT_SMS_REC.modify_time
  is '�޸�ʱ��';
comment on column WII_PATIENT_SMS_REC.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENT_SOCRE_APACHEII
prompt =========================================
prompt
create table WII_PATIENT_SOCRE_APACHEII
(
  patient_id        VARCHAR2(20),
  ward_code         VARCHAR2(20),
  scoring_date_time DATE,
  age               NUMBER(3),
  hr                NUMBER(5),
  map               NUMBER(5),
  br                NUMBER(5),
  tmp               NUMBER(5,2),
  aado2             NUMBER(6,2),
  pao2              NUMBER(6,2),
  fio2              NUMBER(6,2),
  ph                NUMBER(6,2),
  hct               NUMBER(6,2),
  cr                NUMBER(6,3),
  wbc               NUMBER(6,4),
  k                 NUMBER(6,5),
  na                NUMBER(6,6),
  eyes_reflect      NUMBER(1),
  talk_reflect      NUMBER(2),
  limb_reflect      NUMBER(3),
  health_status     NUMBER(4),
  ji_zhen_oper      NUMBER(5),
  score_details     NVARCHAR2(2000),
  slow_health       VARCHAR2(80),
  memo              NVARCHAR2(500),
  creator           NVARCHAR2(20),
  create_time       DATE default sysdate,
  modifier          NVARCHAR2(20),
  modify_time       DATE,
  unique_id         VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_PATIENT_SOCRE_APACHEII.patient_id
  is '����ID';
comment on column WII_PATIENT_SOCRE_APACHEII.ward_code
  is '��������';
comment on column WII_PATIENT_SOCRE_APACHEII.scoring_date_time
  is '����ʱ��';
comment on column WII_PATIENT_SOCRE_APACHEII.age
  is '����';
comment on column WII_PATIENT_SOCRE_APACHEII.hr
  is '����(��/Min)';
comment on column WII_PATIENT_SOCRE_APACHEII.map
  is 'ѪѹMAP(mmHg)';
comment on column WII_PATIENT_SOCRE_APACHEII.br
  is '����(��/Min)';
comment on column WII_PATIENT_SOCRE_APACHEII.tmp
  is '����(��)';
comment on column WII_PATIENT_SOCRE_APACHEII.aado2
  is 'A-aDO2(mmHg)';
comment on column WII_PATIENT_SOCRE_APACHEII.pao2
  is 'PaO2(mmHg)';
comment on column WII_PATIENT_SOCRE_APACHEII.fio2
  is 'FiO2(%)';
comment on column WII_PATIENT_SOCRE_APACHEII.ph
  is 'PH';
comment on column WII_PATIENT_SOCRE_APACHEII.hct
  is 'HCT(%)';
comment on column WII_PATIENT_SOCRE_APACHEII.cr
  is '����Cr(��mol/L)';
comment on column WII_PATIENT_SOCRE_APACHEII.wbc
  is '��ϸ��WBC(x10^9/L)';
comment on column WII_PATIENT_SOCRE_APACHEII.k
  is 'K(mmol/L)';
comment on column WII_PATIENT_SOCRE_APACHEII.na
  is 'Na(mmol/L)';
comment on column WII_PATIENT_SOCRE_APACHEII.eyes_reflect
  is '���۷�Ӧ����Ӧ��ֵ0-5��';
comment on column WII_PATIENT_SOCRE_APACHEII.talk_reflect
  is '���ﷴӦ����Ӧ��ֵ0-5��';
comment on column WII_PATIENT_SOCRE_APACHEII.limb_reflect
  is '֫�巴Ӧ����Ӧ��ֵ0-5��';
comment on column WII_PATIENT_SOCRE_APACHEII.health_status
  is '����״̬  ��������2��  ����������������5��';
comment on column WII_PATIENT_SOCRE_APACHEII.ji_zhen_oper
  is '����������˥�� 1�� 0��';
comment on column WII_PATIENT_SOCRE_APACHEII.score_details
  is '��Ϸ���ϵ����ϸ';
comment on column WII_PATIENT_SOCRE_APACHEII.slow_health
  is '���Խ���״������';
comment on column WII_PATIENT_SOCRE_APACHEII.memo
  is '����˵��';
comment on column WII_PATIENT_SOCRE_APACHEII.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENT_SPECIAL_REMINDER
prompt ===========================================
prompt
create table WII_PATIENT_SPECIAL_REMINDER
(
  patient_special_reminder_id NUMBER(11) not null,
  patient_id                  VARCHAR2(30) not null,
  reminder_time               DATE not null,
  content                     VARCHAR2(1000) not null,
  jump_to                     VARCHAR2(100),
  indexes                     VARCHAR2(100),
  system_type                 VARCHAR2(20),
  creator                     NVARCHAR2(20),
  create_time                 DATE default sysdate,
  modifier                    NVARCHAR2(20),
  modify_time                 DATE default sysdate,
  unique_id                   VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_SPECIAL_REMINDER.patient_special_reminder_id
  is '�ػ�����������ID';
comment on column WII_PATIENT_SPECIAL_REMINDER.patient_id
  is '���߱��';
comment on column WII_PATIENT_SPECIAL_REMINDER.reminder_time
  is '����ʱ��';
comment on column WII_PATIENT_SPECIAL_REMINDER.content
  is '��������';
comment on column WII_PATIENT_SPECIAL_REMINDER.jump_to
  is '��ת����';
comment on column WII_PATIENT_SPECIAL_REMINDER.indexes
  is '�ⲿΨһ����';
comment on column WII_PATIENT_SPECIAL_REMINDER.system_type
  is 'ϵͳ����  0����ʿվ  1��ҽ��վ';
comment on column WII_PATIENT_SPECIAL_REMINDER.creator
  is '������';
comment on column WII_PATIENT_SPECIAL_REMINDER.create_time
  is '����ʱ��';
comment on column WII_PATIENT_SPECIAL_REMINDER.modifier
  is '�޸���';
comment on column WII_PATIENT_SPECIAL_REMINDER.modify_time
  is '�޸�ʱ��';
comment on column WII_PATIENT_SPECIAL_REMINDER.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENT_TAG
prompt ==============================
prompt
create table WII_PATIENT_TAG
(
  id                VARCHAR2(50),
  patient_id        VARCHAR2(20),
  ward_code         VARCHAR2(20),
  reminder_name     VARCHAR2(500),
  reminder_time     DATE,
  status            INTEGER,
  doctor            VARCHAR2(50),
  inpatient_visitid VARCHAR2(20),
  inward_visitid    VARCHAR2(20),
  system_type       VARCHAR2(10)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 448K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_TAG.id
  is 'Ψһ���';
comment on column WII_PATIENT_TAG.patient_id
  is '����ID';
comment on column WII_PATIENT_TAG.ward_code
  is '����';
comment on column WII_PATIENT_TAG.reminder_name
  is '��������(����)�ӿ��Ҳ����ֵ�����������';
comment on column WII_PATIENT_TAG.reminder_time
  is '��¼ʱ��';
comment on column WII_PATIENT_TAG.status
  is '��ǰ������״̬ 0:����|1:δ����';
comment on column WII_PATIENT_TAG.doctor
  is '����ҽ��';
comment on column WII_PATIENT_TAG.inpatient_visitid
  is 'סԺ��ţ���ʾÿ�λ���סԺ��Ψһ�ţ�����סԺ��+סԺ������';
comment on column WII_PATIENT_TAG.inward_visitid
  is '�벡�����';
comment on column WII_PATIENT_TAG.system_type
  is 'ϵͳ���ͣ�0����ʿվ��1��ҽ��վ��';

prompt
prompt Creating table WII_PATIENT_TAG_CONFIG
prompt =====================================
prompt
create table WII_PATIENT_TAG_CONFIG
(
  special_code    VARCHAR2(30) not null,
  tag_code        VARCHAR2(50) not null,
  tag_name        VARCHAR2(100),
  parent_tag_code VARCHAR2(50),
  status          VARCHAR2(10)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_TAG_CONFIG.special_code
  is 'ר�Ʊ��';
comment on column WII_PATIENT_TAG_CONFIG.tag_code
  is '��ǩ���';
comment on column WII_PATIENT_TAG_CONFIG.tag_name
  is '��ǩ����';
comment on column WII_PATIENT_TAG_CONFIG.parent_tag_code
  is '��ǩ���ڵ�';
comment on column WII_PATIENT_TAG_CONFIG.status
  is '״̬(0������ʾ��1��ֻ����2���ɱ༭������λ����һλ�ǻ�ʿվ���ڶ�λ��ҽ��վ��';
alter table WII_PATIENT_TAG_CONFIG
  add constraint PK_PATIENT_TAG_CONFIG primary key (SPECIAL_CODE, TAG_CODE)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WII_PATIENT_TRANSFER_HIS
prompt =======================================
prompt
create table WII_PATIENT_TRANSFER_HIS
(
  transfer_sequence_no VARCHAR2(20),
  inpatient_visitid    VARCHAR2(20),
  transfer_time        DATE,
  transfer_reason_code VARCHAR2(20),
  transfer_reason_memo NVARCHAR2(100),
  patient_id           VARCHAR2(20),
  dept_stayed          VARCHAR2(50),
  ward_stayed          VARCHAR2(50),
  bed_stayed           VARCHAR2(20),
  dept_from            VARCHAR2(50),
  ward_from            VARCHAR2(50),
  bed_from             VARCHAR2(20),
  doctor_in_charge     NVARCHAR2(30),
  create_time          DATE default sysdate,
  creator              NVARCHAR2(20),
  visit_id             NUMBER(3),
  modifier             NVARCHAR2(20),
  modify_time          DATE,
  unique_id            VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_TRANSFER_HIS.transfer_sequence_no
  is '������ת���';
comment on column WII_PATIENT_TRANSFER_HIS.inpatient_visitid
  is 'סԺ��ţ���ʾÿ�λ���סԺ��Ψһ�ţ�����סԺ��+סԺ������';
comment on column WII_PATIENT_TRANSFER_HIS.transfer_time
  is '��ת���ڼ�ʱ��';
comment on column WII_PATIENT_TRANSFER_HIS.transfer_reason_code
  is '��תԭ����';
comment on column WII_PATIENT_TRANSFER_HIS.transfer_reason_memo
  is '��תԭ��-������ע';
comment on column WII_PATIENT_TRANSFER_HIS.patient_id
  is '����Ψһ��ʶ��';
comment on column WII_PATIENT_TRANSFER_HIS.dept_stayed
  is '���ڿ���';
comment on column WII_PATIENT_TRANSFER_HIS.ward_stayed
  is '���ڲ���';
comment on column WII_PATIENT_TRANSFER_HIS.bed_stayed
  is '���ڴ���';
comment on column WII_PATIENT_TRANSFER_HIS.dept_from
  is '���Կ���';
comment on column WII_PATIENT_TRANSFER_HIS.ward_from
  is '���Բ���';
comment on column WII_PATIENT_TRANSFER_HIS.bed_from
  is '���Դ���';
comment on column WII_PATIENT_TRANSFER_HIS.doctor_in_charge
  is '����ҽʦ';
comment on column WII_PATIENT_TRANSFER_HIS.create_time
  is '����ʱ��';
comment on column WII_PATIENT_TRANSFER_HIS.creator
  is '������';
comment on column WII_PATIENT_TRANSFER_HIS.visit_id
  is 'סԺ����';
comment on column WII_PATIENT_TRANSFER_HIS.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENT_TRANSFER_HIS_BAK
prompt ===========================================
prompt
create table WII_PATIENT_TRANSFER_HIS_BAK
(
  transfer_sequence_no VARCHAR2(20),
  inpatient_visitid    VARCHAR2(20) not null,
  transfer_time        DATE not null,
  transfer_reason_code VARCHAR2(20),
  transfer_reason_memo VARCHAR2(100),
  patient_id           VARCHAR2(20) not null,
  dept_stayed          VARCHAR2(16),
  ward_stayed          VARCHAR2(16),
  bed_stayed           VARCHAR2(20),
  dept_from            VARCHAR2(16),
  ward_from            VARCHAR2(16),
  bed_from             VARCHAR2(20),
  doctor_in_charge     VARCHAR2(30),
  create_time          DATE,
  creator              VARCHAR2(50),
  visit_id             NUMBER(3) not null,
  unique_id            VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table WII_PATIENT_TRANSFER_HIS_VIEW
prompt ============================================
prompt
create table WII_PATIENT_TRANSFER_HIS_VIEW
(
  patient_id        VARCHAR2(20),
  inpatient_visitid VARCHAR2(20),
  transfer_time     DATE,
  transfer_code     VARCHAR2(20),
  dept_stayed       VARCHAR2(50),
  ward_stayed       VARCHAR2(50),
  bed_stayed        VARCHAR2(20),
  create_time       DATE default sysdate,
  creator           NVARCHAR2(20),
  modifier          NVARCHAR2(20),
  modify_time       DATE,
  unique_id         VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 256K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_TRANSFER_HIS_VIEW.patient_id
  is '����Ψһ��ʶ��';
comment on column WII_PATIENT_TRANSFER_HIS_VIEW.inpatient_visitid
  is 'סԺ���';
comment on column WII_PATIENT_TRANSFER_HIS_VIEW.transfer_time
  is '��ת���ڼ�ʱ��';
comment on column WII_PATIENT_TRANSFER_HIS_VIEW.transfer_code
  is '��תԭ����';
comment on column WII_PATIENT_TRANSFER_HIS_VIEW.dept_stayed
  is '���ڿ���';
comment on column WII_PATIENT_TRANSFER_HIS_VIEW.ward_stayed
  is '���ڲ���';
comment on column WII_PATIENT_TRANSFER_HIS_VIEW.bed_stayed
  is '���ڴ���';
comment on column WII_PATIENT_TRANSFER_HIS_VIEW.create_time
  is '����ʱ��';
comment on column WII_PATIENT_TRANSFER_HIS_VIEW.creator
  is '������';
comment on column WII_PATIENT_TRANSFER_HIS_VIEW.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PATIENT_VISIT_HIS
prompt ====================================
prompt
create table WII_PATIENT_VISIT_HIS
(
  patient_id             VARCHAR2(20),
  visit_id               NUMBER(3),
  inpatient_visitid      VARCHAR2(20) not null,
  inpatient_no           VARCHAR2(20),
  dept_admission_to      VARCHAR2(230),
  admission_date_time    DATE,
  dept_discharge_from    VARCHAR2(40),
  discharge_date_time    DATE,
  occupation             NVARCHAR2(50),
  marital_status         VARCHAR2(4),
  charge_type            VARCHAR2(30),
  insurance_type         VARCHAR2(16),
  insurance_no           VARCHAR2(50),
  service_agency         NVARCHAR2(80),
  mailing_address        NVARCHAR2(80),
  zip_code               VARCHAR2(50),
  next_of_kin            NVARCHAR2(30),
  relationship           NVARCHAR2(20),
  next_of_kin_addr       NVARCHAR2(80),
  next_of_kin_zipcode    VARCHAR2(50),
  next_of_kin_phone      VARCHAR2(40),
  admitted_by            NVARCHAR2(30),
  patient_source         VARCHAR2(6),
  discharge_disposition  VARCHAR2(1),
  admission_cause        NVARCHAR2(80),
  consulting_date        DATE,
  consulting_doctor      NVARCHAR2(30),
  director               NVARCHAR2(30),
  attending_doctor       NVARCHAR2(30),
  doctor_in_charge       VARCHAR2(30),
  total_costs            NUMBER(10,2),
  total_payments         NUMBER(10,2),
  patient_adm_condition  VARCHAR2(20),
  body_height            NUMBER(4,1),
  body_weight            NUMBER(4,1),
  blood_type             VARCHAR2(10),
  blood_type_rh          VARCHAR2(1),
  patient_condition      VARCHAR2(12),
  spec_level_nurs_days   NUMBER(4),
  first_level_nurs_days  NUMBER(4),
  second_level_nurs_days NUMBER(4),
  serious_cond_days      NUMBER(4),
  critical_cond_days     NUMBER(4),
  icu_days               NUMBER(4),
  abnormal               VARCHAR2(80),
  infusion_react_times   NUMBER(2),
  blood_tran_times       NUMBER(2),
  blood_tran_vol         NUMBER(5),
  blood_tran_react_times NUMBER(2),
  alergy_drugs           VARCHAR2(80),
  adverse_reaction_drugs VARCHAR2(80),
  decubital_ulcer_times  NUMBER(2),
  emer_treat_times       NUMBER(2),
  esc_emer_times         NUMBER(2),
  autopsy_indicator      NUMBER(1),
  mr_value               VARCHAR2(4),
  mr_quality             VARCHAR2(2),
  follow_indicator       NUMBER(1),
  follow_interval        NUMBER(2),
  follow_interval_units  VARCHAR2(2),
  catalog_date           DATE,
  cataloger              VARCHAR2(8),
  current_ward_code      VARCHAR2(20),
  operate_code           VARCHAR2(20),
  operate_name           VARCHAR2(100),
  operate_time           DATE,
  creator                NVARCHAR2(20),
  create_time            DATE default sysdate,
  modifier               NVARCHAR2(20),
  modify_time            DATE,
  unique_id              VARCHAR2(50) default sys_guid(),
  nationality_code       VARCHAR2(100),
  birth_place            VARCHAR2(100),
  native_place           VARCHAR2(100),
  nation_code            VARCHAR2(100),
  id_card                VARCHAR2(100),
  home_phone             VARCHAR2(100),
  native_address         VARCHAR2(300),
  native_zipcode         VARCHAR2(30),
  service_phone          VARCHAR2(100),
  service_zipcode        VARCHAR2(30),
  nursing_class          VARCHAR2(10)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 960K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PATIENT_VISIT_HIS.patient_id
  is '���˱�ʶ';
comment on column WII_PATIENT_VISIT_HIS.visit_id
  is 'סԺ����';
comment on column WII_PATIENT_VISIT_HIS.inpatient_visitid
  is 'סԺ��ţ���ʾÿ�λ���סԺ��Ψһ�ţ�����סԺ��+סԺ������';
comment on column WII_PATIENT_VISIT_HIS.inpatient_no
  is 'סԺ��, ����סԺ��ʶ�����û�п�ͬ����ţ�,���ﲡ��Ϊ��';
comment on column WII_PATIENT_VISIT_HIS.dept_admission_to
  is '��Ժ����';
comment on column WII_PATIENT_VISIT_HIS.admission_date_time
  is '��Ժ���ڼ�ʱ��';
comment on column WII_PATIENT_VISIT_HIS.dept_discharge_from
  is '��Ժ����';
comment on column WII_PATIENT_VISIT_HIS.discharge_date_time
  is '��Ժ���ڼ�ʱ��';
comment on column WII_PATIENT_VISIT_HIS.occupation
  is 'ְҵ';
comment on column WII_PATIENT_VISIT_HIS.marital_status
  is '����״��';
comment on column WII_PATIENT_VISIT_HIS.charge_type
  is '�ѱ�';
comment on column WII_PATIENT_VISIT_HIS.insurance_type
  is 'ҽ�Ʊ������';
comment on column WII_PATIENT_VISIT_HIS.insurance_no
  is 'ҽ�Ʊ��պ�';
comment on column WII_PATIENT_VISIT_HIS.service_agency
  is '������λ';
comment on column WII_PATIENT_VISIT_HIS.mailing_address
  is 'ͨ�ŵ�ַ';
comment on column WII_PATIENT_VISIT_HIS.zip_code
  is '��������';
comment on column WII_PATIENT_VISIT_HIS.next_of_kin
  is '��ϵ������';
comment on column WII_PATIENT_VISIT_HIS.relationship
  is '����ϵ�˹�ϵ';
comment on column WII_PATIENT_VISIT_HIS.next_of_kin_addr
  is '��ϵ�˵�ַ';
comment on column WII_PATIENT_VISIT_HIS.next_of_kin_zipcode
  is '��ϵ����������';
comment on column WII_PATIENT_VISIT_HIS.next_of_kin_phone
  is '��ϵ�˵绰';
comment on column WII_PATIENT_VISIT_HIS.admitted_by
  is '����סԺ��';
comment on column WII_PATIENT_VISIT_HIS.patient_source
  is '��Ժ��ʽ���루������ת��ȣ�';
comment on column WII_PATIENT_VISIT_HIS.discharge_disposition
  is '��Ժ��ʽ  (ҽ����Ժ��ҽ��תԺ��ҽ��ת�������������������ҽ����Ժ������)';
comment on column WII_PATIENT_VISIT_HIS.admission_cause
  is 'סԺԭ��';
comment on column WII_PATIENT_VISIT_HIS.consulting_date
  is '�������� ��';
comment on column WII_PATIENT_VISIT_HIS.consulting_doctor
  is '����ҽʦ �������ҽ��';
comment on column WII_PATIENT_VISIT_HIS.director
  is '������';
comment on column WII_PATIENT_VISIT_HIS.attending_doctor
  is '����ҽʦ';
comment on column WII_PATIENT_VISIT_HIS.doctor_in_charge
  is '����ҽʦ';
comment on column WII_PATIENT_VISIT_HIS.total_costs
  is '�ܷ���';
comment on column WII_PATIENT_VISIT_HIS.total_payments
  is 'ʵ������';
comment on column WII_PATIENT_VISIT_HIS.patient_adm_condition
  is '��Ժ���� �� ָ��Щ���ݣ�';
comment on column WII_PATIENT_VISIT_HIS.body_height
  is '���';
comment on column WII_PATIENT_VISIT_HIS.body_weight
  is '����';
comment on column WII_PATIENT_VISIT_HIS.blood_type
  is 'ABOѪ��';
comment on column WII_PATIENT_VISIT_HIS.blood_type_rh
  is 'RhѪ��';
comment on column WII_PATIENT_VISIT_HIS.patient_condition
  is '�������';
comment on column WII_PATIENT_VISIT_HIS.spec_level_nurs_days
  is '�ر�������';
comment on column WII_PATIENT_VISIT_HIS.first_level_nurs_days
  is 'һ����������';
comment on column WII_PATIENT_VISIT_HIS.second_level_nurs_days
  is '������������';
comment on column WII_PATIENT_VISIT_HIS.serious_cond_days
  is '��������';
comment on column WII_PATIENT_VISIT_HIS.critical_cond_days
  is '��Σ����';
comment on column WII_PATIENT_VISIT_HIS.icu_days
  is 'ICU����';
comment on column WII_PATIENT_VISIT_HIS.abnormal
  is '���Ա�־';
comment on column WII_PATIENT_VISIT_HIS.infusion_react_times
  is '��Һ��Ӧ����';
comment on column WII_PATIENT_VISIT_HIS.blood_tran_times
  is '��Ѫ����';
comment on column WII_PATIENT_VISIT_HIS.blood_tran_vol
  is '��Ѫ����';
comment on column WII_PATIENT_VISIT_HIS.blood_tran_react_times
  is '��Ѫ��Ӧ����';
comment on column WII_PATIENT_VISIT_HIS.alergy_drugs
  is '����ҩ��';
comment on column WII_PATIENT_VISIT_HIS.adverse_reaction_drugs
  is '������Ӧҩ��';
comment on column WII_PATIENT_VISIT_HIS.decubital_ulcer_times
  is '�����촯����';
comment on column WII_PATIENT_VISIT_HIS.emer_treat_times
  is '���ȴ���';
comment on column WII_PATIENT_VISIT_HIS.esc_emer_times
  is '���ȳɹ�����';
comment on column WII_PATIENT_VISIT_HIS.autopsy_indicator
  is 'ʬ���ʶ';
comment on column WII_PATIENT_VISIT_HIS.mr_value
  is '������ֵ';
comment on column WII_PATIENT_VISIT_HIS.mr_quality
  is '��������';
comment on column WII_PATIENT_VISIT_HIS.follow_indicator
  is '��ñ�־';
comment on column WII_PATIENT_VISIT_HIS.follow_interval
  is '��ü��ʱ��';
comment on column WII_PATIENT_VISIT_HIS.follow_interval_units
  is '��ü��ʱ�䵥λ';
comment on column WII_PATIENT_VISIT_HIS.catalog_date
  is '��Ŀ����';
comment on column WII_PATIENT_VISIT_HIS.cataloger
  is '��Ŀ��';
comment on column WII_PATIENT_VISIT_HIS.current_ward_code
  is '��ǰ���ڲ���';
comment on column WII_PATIENT_VISIT_HIS.operate_code
  is '�������';
comment on column WII_PATIENT_VISIT_HIS.operate_name
  is '��������';
comment on column WII_PATIENT_VISIT_HIS.operate_time
  is '����ʱ��';
comment on column WII_PATIENT_VISIT_HIS.unique_id
  is '����ΨһID';
comment on column WII_PATIENT_VISIT_HIS.nationality_code
  is '��������';
comment on column WII_PATIENT_VISIT_HIS.birth_place
  is '������';
comment on column WII_PATIENT_VISIT_HIS.native_place
  is '����';
comment on column WII_PATIENT_VISIT_HIS.nation_code
  is '������';
comment on column WII_PATIENT_VISIT_HIS.id_card
  is '���֤��';
comment on column WII_PATIENT_VISIT_HIS.home_phone
  is '��ͥ�绰';
comment on column WII_PATIENT_VISIT_HIS.native_address
  is '���ڵ�ַ';
comment on column WII_PATIENT_VISIT_HIS.native_zipcode
  is '������������';
comment on column WII_PATIENT_VISIT_HIS.service_phone
  is '������λ�绰';
comment on column WII_PATIENT_VISIT_HIS.service_zipcode
  is '������λ��������';
comment on column WII_PATIENT_VISIT_HIS.nursing_class
  is '������';
alter table WII_PATIENT_VISIT_HIS
  add constraint PK_PATIENT_VISIT_HIS primary key (INPATIENT_VISITID)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 192K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WII_PATIENT_VISIT_HIS_BAK
prompt ========================================
prompt
create table WII_PATIENT_VISIT_HIS_BAK
(
  patient_id             VARCHAR2(20) not null,
  visit_id               NUMBER(3) not null,
  inpatient_visitid      VARCHAR2(20) not null,
  inpatient_no           VARCHAR2(20) not null,
  dept_admission_to      VARCHAR2(16),
  admission_date_time    DATE,
  dept_discharge_from    VARCHAR2(16),
  discharge_date_time    DATE,
  occupation             VARCHAR2(4),
  marital_status         VARCHAR2(4),
  charge_type            VARCHAR2(30),
  insurance_type         VARCHAR2(16),
  insurance_no           VARCHAR2(50),
  service_agency         VARCHAR2(80),
  mailing_address        VARCHAR2(80),
  zip_code               VARCHAR2(50),
  next_of_kin            VARCHAR2(30),
  relationship           VARCHAR2(20),
  next_of_kin_addr       VARCHAR2(80),
  next_of_kin_zipcode    VARCHAR2(50),
  next_of_kin_phone      VARCHAR2(40),
  admitted_by            VARCHAR2(30),
  patient_source         VARCHAR2(6),
  discharge_disposition  VARCHAR2(1),
  admission_cause        VARCHAR2(80),
  consulting_date        DATE,
  consulting_doctor      VARCHAR2(30),
  director               VARCHAR2(30),
  attending_doctor       VARCHAR2(30),
  doctor_in_charge       VARCHAR2(30),
  total_costs            NUMBER(10,2),
  total_payments         NUMBER(10,2),
  patient_adm_condition  VARCHAR2(20),
  body_height            NUMBER(4,1),
  body_weight            NUMBER(4,1),
  blood_type             VARCHAR2(10),
  blood_type_rh          VARCHAR2(1),
  patient_condition      VARCHAR2(12),
  spec_level_nurs_days   NUMBER(4),
  first_level_nurs_days  NUMBER(4),
  second_level_nurs_days NUMBER(4),
  serious_cond_days      NUMBER(4),
  critical_cond_days     NUMBER(4),
  icu_days               NUMBER(4),
  abnormal               VARCHAR2(80),
  infusion_react_times   NUMBER(2),
  blood_tran_times       NUMBER(2),
  blood_tran_vol         NUMBER(5),
  blood_tran_react_times NUMBER(2),
  alergy_drugs           VARCHAR2(80),
  adverse_reaction_drugs VARCHAR2(80),
  decubital_ulcer_times  NUMBER(2),
  emer_treat_times       NUMBER(2),
  esc_emer_times         NUMBER(2),
  autopsy_indicator      NUMBER(1),
  mr_value               VARCHAR2(4),
  mr_quality             VARCHAR2(2),
  follow_indicator       NUMBER(1),
  follow_interval        NUMBER(2),
  follow_interval_units  VARCHAR2(2),
  catalog_date           DATE,
  cataloger              VARCHAR2(8),
  current_ward_code      VARCHAR2(20),
  operate_code           VARCHAR2(20),
  operate_name           VARCHAR2(100),
  operate_time           DATE,
  unique_id              VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table WII_PDA_OPERATE_HIS
prompt ==================================
prompt
create table WII_PDA_OPERATE_HIS
(
  operate_id    VARCHAR2(40) default sys_guid(),
  patient_id    VARCHAR2(40),
  module_id     NVARCHAR2(40),
  module_name   NVARCHAR2(100),
  time_point    DATE,
  module_items  NVARCHAR2(2000),
  operate_desc  NVARCHAR2(2000),
  operator      VARCHAR2(40),
  operate_time  DATE default sysdate,
  group_code    VARCHAR2(100),
  operator_name NVARCHAR2(100)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PDA_OPERATE_HIS.operate_id
  is '����ID';
comment on column WII_PDA_OPERATE_HIS.patient_id
  is '���߱��';
comment on column WII_PDA_OPERATE_HIS.module_id
  is 'ģ����';
comment on column WII_PDA_OPERATE_HIS.module_name
  is 'ģ������';
comment on column WII_PDA_OPERATE_HIS.time_point
  is 'ҵ��ʱ���';
comment on column WII_PDA_OPERATE_HIS.module_items
  is 'ģ������codes';
comment on column WII_PDA_OPERATE_HIS.operate_desc
  is '��Ӧģ��ֵ';
comment on column WII_PDA_OPERATE_HIS.operator
  is '������';
comment on column WII_PDA_OPERATE_HIS.operate_time
  is '����ʱ��';
comment on column WII_PDA_OPERATE_HIS.group_code
  is '�����ʶ';
comment on column WII_PDA_OPERATE_HIS.operator_name
  is '����������';

prompt
prompt Creating table WII_PERFORMANCE_DIC
prompt ==================================
prompt
create table WII_PERFORMANCE_DIC
(
  perfdic_no NUMBER(11),
  name       VARCHAR2(100),
  unit       VARCHAR2(20),
  type       NUMBER(1),
  memo       NVARCHAR2(100)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PERFORMANCE_DIC.perfdic_no
  is '�����ֵ�id��������';
comment on column WII_PERFORMANCE_DIC.name
  is '����';
comment on column WII_PERFORMANCE_DIC.unit
  is '��λ';
comment on column WII_PERFORMANCE_DIC.type
  is '��Ŀ���ͣ�������ϵ����';
comment on column WII_PERFORMANCE_DIC.memo
  is '��ע';

prompt
prompt Creating table WII_PERFORMANCE_SCORE_DETAIL
prompt ===========================================
prompt
create table WII_PERFORMANCE_SCORE_DETAIL
(
  score_main_id NUMBER(10),
  user_id       VARCHAR2(20),
  dic_id        NUMBER(10),
  score         NUMBER(5,2),
  create_time   DATE default sysdate,
  creator       NVARCHAR2(20),
  modifier      NVARCHAR2(20),
  modify_time   DATE,
  unique_id     VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_PERFORMANCE_SCORE_DETAIL.score_main_id
  is '��������ID����ӦWII_PERFORMANCE_SCORE_MAIN��������';
comment on column WII_PERFORMANCE_SCORE_DETAIL.user_id
  is '��ԱID';
comment on column WII_PERFORMANCE_SCORE_DETAIL.dic_id
  is '����ֵ��ID����ӦWII_PERFORMANCE_DIC��';
comment on column WII_PERFORMANCE_SCORE_DETAIL.score
  is '��ֵ
';
comment on column WII_PERFORMANCE_SCORE_DETAIL.create_time
  is '����ʱ��';
comment on column WII_PERFORMANCE_SCORE_DETAIL.creator
  is '������';
comment on column WII_PERFORMANCE_SCORE_DETAIL.modifier
  is '�޸���';
comment on column WII_PERFORMANCE_SCORE_DETAIL.modify_time
  is '�޸�ʱ��';
comment on column WII_PERFORMANCE_SCORE_DETAIL.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PERFORMANCE_SCORE_LOG
prompt ========================================
prompt
create table WII_PERFORMANCE_SCORE_LOG
(
  user_id      VARCHAR2(20),
  month        VARCHAR2(6),
  dic_id       NUMBER(10),
  reason       NVARCHAR2(50),
  before_score NUMBER(6,2),
  modifier     NVARCHAR2(20),
  modify_time  DATE,
  creator      NVARCHAR2(20),
  create_time  DATE default sysdate,
  unique_id    VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_PERFORMANCE_SCORE_LOG.user_id
  is '�û�ID
';
comment on column WII_PERFORMANCE_SCORE_LOG.month
  is '��Ч�·�
';
comment on column WII_PERFORMANCE_SCORE_LOG.dic_id
  is '�ֵ�ID����ӦWII_PERFORMANCE_DIC
';
comment on column WII_PERFORMANCE_SCORE_LOG.reason
  is 'ԭ��
';
comment on column WII_PERFORMANCE_SCORE_LOG.before_score
  is '�޸�֮ǰ�ķ�ֵ
';
comment on column WII_PERFORMANCE_SCORE_LOG.modifier
  is '�޸���';
comment on column WII_PERFORMANCE_SCORE_LOG.modify_time
  is '�޸�ʱ��';
comment on column WII_PERFORMANCE_SCORE_LOG.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PERFORMANCE_SCORE_MAIN
prompt =========================================
prompt
create table WII_PERFORMANCE_SCORE_MAIN
(
  perfscore_main_no NUMBER(11),
  perf_main_id      NUMBER(11),
  month             VARCHAR2(6),
  create_time       DATE default sysdate,
  creator           NVARCHAR2(20),
  modifier          NVARCHAR2(20),
  modify_time       DATE,
  is_lock           NUMBER(1),
  unique_id         VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_PERFORMANCE_SCORE_MAIN.perfscore_main_no
  is '������id';
comment on column WII_PERFORMANCE_SCORE_MAIN.perf_main_id
  is '����ַ�id';
comment on column WII_PERFORMANCE_SCORE_MAIN.month
  is '�·�';
comment on column WII_PERFORMANCE_SCORE_MAIN.create_time
  is '����ʱ��';
comment on column WII_PERFORMANCE_SCORE_MAIN.creator
  is '������';
comment on column WII_PERFORMANCE_SCORE_MAIN.modifier
  is '�޸���';
comment on column WII_PERFORMANCE_SCORE_MAIN.modify_time
  is '�޸�ʱ��';
comment on column WII_PERFORMANCE_SCORE_MAIN.is_lock
  is '�Ƿ�����';
comment on column WII_PERFORMANCE_SCORE_MAIN.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PERFORMANCE_TITLE_DETAIL
prompt ===========================================
prompt
create table WII_PERFORMANCE_TITLE_DETAIL
(
  perftitle_detail_no NUMBER(11),
  dic_id              NUMBER(11),
  weighting_score     NUMBER(6,2),
  memo                VARCHAR2(30),
  create_time         DATE default sysdate,
  creator             NVARCHAR2(20),
  modifier            NVARCHAR2(20),
  modify_time         DATE,
  main_no             NUMBER(6),
  unique_id           VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_PERFORMANCE_TITLE_DETAIL.perftitle_detail_no
  is '������Id';
comment on column WII_PERFORMANCE_TITLE_DETAIL.dic_id
  is '�����ֵ�ID';
comment on column WII_PERFORMANCE_TITLE_DETAIL.weighting_score
  is 'Ȩ�ط�ֵ';
comment on column WII_PERFORMANCE_TITLE_DETAIL.memo
  is '��ע';
comment on column WII_PERFORMANCE_TITLE_DETAIL.create_time
  is '����ʱ��';
comment on column WII_PERFORMANCE_TITLE_DETAIL.creator
  is '������';
comment on column WII_PERFORMANCE_TITLE_DETAIL.modifier
  is '�޸���';
comment on column WII_PERFORMANCE_TITLE_DETAIL.modify_time
  is '�޸�ʱ��';
comment on column WII_PERFORMANCE_TITLE_DETAIL.main_no
  is '����ID';
comment on column WII_PERFORMANCE_TITLE_DETAIL.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PERFORMANCE_TITLE_MAIN
prompt =========================================
prompt
create table WII_PERFORMANCE_TITLE_MAIN
(
  perftitle_main_no NUMBER(11),
  name              VARCHAR2(100),
  flag              NUMBER(1),
  memo              NVARCHAR2(100),
  create_time       DATE default sysdate,
  creator           NVARCHAR2(20),
  modifier          NVARCHAR2(20),
  modify_time       DATE,
  expiredtime       DATE,
  unique_id         VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_PERFORMANCE_TITLE_MAIN.perftitle_main_no
  is '������ID';
comment on column WII_PERFORMANCE_TITLE_MAIN.name
  is '��ַ�����';
comment on column WII_PERFORMANCE_TITLE_MAIN.flag
  is '�Ƿ����';
comment on column WII_PERFORMANCE_TITLE_MAIN.memo
  is '��ע';
comment on column WII_PERFORMANCE_TITLE_MAIN.create_time
  is '����ʱ��';
comment on column WII_PERFORMANCE_TITLE_MAIN.creator
  is '������';
comment on column WII_PERFORMANCE_TITLE_MAIN.modifier
  is '�޸���';
comment on column WII_PERFORMANCE_TITLE_MAIN.modify_time
  is '�޸�ʱ��';
comment on column WII_PERFORMANCE_TITLE_MAIN.expiredtime
  is '����ʱ��';
comment on column WII_PERFORMANCE_TITLE_MAIN.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PHARMACY_CAT_DIC
prompt ===================================
prompt
create table WII_PHARMACY_CAT_DIC
(
  cat_code       VARCHAR2(20) not null,
  cat_name       VARCHAR2(50),
  parentcat_code VARCHAR2(20),
  input_code     VARCHAR2(8),
  creator        NVARCHAR2(20),
  create_time    DATE default sysdate,
  modifier       NVARCHAR2(20),
  modify_time    DATE,
  unique_id      VARCHAR2(50) default sys_guid() not null
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_PHARMACY_CAT_DIC.cat_code
  is '������';
comment on column WII_PHARMACY_CAT_DIC.cat_name
  is '�������';
comment on column WII_PHARMACY_CAT_DIC.parentcat_code
  is '��������';
comment on column WII_PHARMACY_CAT_DIC.input_code
  is '���������';
comment on column WII_PHARMACY_CAT_DIC.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PHARMACY_DIC
prompt ===============================
prompt
create table WII_PHARMACY_DIC
(
  pharmacy_code      VARCHAR2(50),
  pharmacy_chemname  NVARCHAR2(50),
  pharmacy_goodsname NVARCHAR2(50),
  pharmacy_abbrev    NVARCHAR2(30),
  pharmacy_spec      VARCHAR2(50),
  spec_unit          VARCHAR2(10),
  pharmacy_form      VARCHAR2(10),
  supplier_name      NVARCHAR2(100),
  dose_per_unit      VARCHAR2(20),
  dose_units         VARCHAR2(20),
  phy_function1      NVARCHAR2(50),
  phy_function2      NVARCHAR2(50),
  phy_function3      NVARCHAR2(50),
  pharm_cat_cis_code VARCHAR2(50),
  anesthetic_type    VARCHAR2(50),
  pharmacy_attribute NVARCHAR2(20),
  input_code         VARCHAR2(50),
  memo               NVARCHAR2(50),
  valid              VARCHAR2(10)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 896K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PHARMACY_DIC.pharmacy_code
  is 'HISҩƷ���Ʊ���
';
comment on column WII_PHARMACY_DIC.pharmacy_chemname
  is 'HISҩƷ���� - ��ѧ����
';
comment on column WII_PHARMACY_DIC.pharmacy_goodsname
  is 'HIS��Ʒ���ƣ�ͨ������PHARMACY_GOODSNAME)
';
comment on column WII_PHARMACY_DIC.pharmacy_abbrev
  is 'HISҩƷ���
';
comment on column WII_PHARMACY_DIC.pharmacy_spec
  is '��� (���磺10֧/��)
';
comment on column WII_PHARMACY_DIC.spec_unit
  is '���λ �����磺�У�
';
comment on column WII_PHARMACY_DIC.pharmacy_form
  is '����
';
comment on column WII_PHARMACY_DIC.supplier_name
  is '����
';
comment on column WII_PHARMACY_DIC.dose_per_unit
  is '��С��λ������10ml/֧��
';
comment on column WII_PHARMACY_DIC.dose_units
  is '������λ��ml��
';
comment on column WII_PHARMACY_DIC.phy_function1
  is 'һ��ҩ���������
';
comment on column WII_PHARMACY_DIC.phy_function2
  is '����ҩ���������
';
comment on column WII_PHARMACY_DIC.phy_function3
  is '����ҩ���������
';
comment on column WII_PHARMACY_DIC.pharm_cat_cis_code
  is '��ӦHIS��CISҩƷ������루ҩƷҩ����������ֵ䣩
';
comment on column WII_PHARMACY_DIC.anesthetic_type
  is '����ҩ����
';
comment on column WII_PHARMACY_DIC.pharmacy_attribute
  is 'ҩƷ���ԣ�����ҩ��Ƭ��ԭ��ҩ����ҩ�������ȣ�
';
comment on column WII_PHARMACY_DIC.input_code
  is '��������ĸ(������룩
';
comment on column WII_PHARMACY_DIC.memo
  is '��ע';
comment on column WII_PHARMACY_DIC.valid
  is '��Ч�ԣ�0-��Ч��1-��Ч��';

prompt
prompt Creating table WII_PHARMACY_DIC_REGULAR
prompt =======================================
prompt
create table WII_PHARMACY_DIC_REGULAR
(
  pharmacy_code        VARCHAR2(12),
  pharmacy_chemname    VARCHAR2(50),
  dose_per_unit_solid  NUMBER(6,2),
  dose_units_solid     VARCHAR2(50),
  dose_per_unit_liquid NUMBER(6,2),
  dose_units_liquid    VARCHAR2(50),
  concentration        NUMBER(10,4),
  rate                 NUMBER(8),
  rec_md5              VARCHAR2(50),
  rec_time             TIMESTAMP(6),
  speed_units          VARCHAR2(50),
  creator              NVARCHAR2(20),
  create_time          DATE default sysdate,
  modifier             NVARCHAR2(20),
  modify_time          DATE,
  unique_id            VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PHARMACY_DIC_REGULAR.pharmacy_code
  is 'ҩƷ����';
comment on column WII_PHARMACY_DIC_REGULAR.pharmacy_chemname
  is 'ҩƷ����';
comment on column WII_PHARMACY_DIC_REGULAR.dose_per_unit_solid
  is '���嵥λ��';
comment on column WII_PHARMACY_DIC_REGULAR.dose_units_solid
  is '���嵥λ';
comment on column WII_PHARMACY_DIC_REGULAR.dose_per_unit_liquid
  is 'Һ�嵥λ��';
comment on column WII_PHARMACY_DIC_REGULAR.dose_units_liquid
  is 'Һ�嵥λ';
comment on column WII_PHARMACY_DIC_REGULAR.concentration
  is 'Ũ��';
comment on column WII_PHARMACY_DIC_REGULAR.rate
  is '�û��ճ�ʹ�ô���';
comment on column WII_PHARMACY_DIC_REGULAR.rec_md5
  is '��¼��MD5ֵ�������жϼ�¼�Ƿ�һ�£���rate��';
comment on column WII_PHARMACY_DIC_REGULAR.rec_time
  is '����¼ʱ��';
comment on column WII_PHARMACY_DIC_REGULAR.speed_units
  is '���ٵ�λ';
comment on column WII_PHARMACY_DIC_REGULAR.creator
  is '������';
comment on column WII_PHARMACY_DIC_REGULAR.create_time
  is '����ʱ��';
comment on column WII_PHARMACY_DIC_REGULAR.modifier
  is '�޸���';
comment on column WII_PHARMACY_DIC_REGULAR.modify_time
  is '�޸�ʱ��';
comment on column WII_PHARMACY_DIC_REGULAR.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PHARM_ANTICOAGULATION_DIC
prompt ============================================
prompt
create table WII_PHARM_ANTICOAGULATION_DIC
(
  anticoagulation_pharm_code    VARCHAR2(30),
  anticoagulation_pharm_name_c  NVARCHAR2(50),
  anticoagulation_pharm_alias_c NVARCHAR2(50),
  anticoagulation_pharm_name_e  VARCHAR2(50),
  input_code                    VARCHAR2(50),
  memo                          NVARCHAR2(50),
  valid                         VARCHAR2(20) default 1,
  pharmacy_code                 VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PHARM_ANTICOAGULATION_DIC.anticoagulation_pharm_code
  is '����ҩƷ����';
comment on column WII_PHARM_ANTICOAGULATION_DIC.anticoagulation_pharm_name_c
  is '����ҩƷ��������';
comment on column WII_PHARM_ANTICOAGULATION_DIC.anticoagulation_pharm_alias_c
  is '����ҩƷ���ı���';
comment on column WII_PHARM_ANTICOAGULATION_DIC.anticoagulation_pharm_name_e
  is '����ҩƷӢ������';
comment on column WII_PHARM_ANTICOAGULATION_DIC.input_code
  is '����ĸ';
comment on column WII_PHARM_ANTICOAGULATION_DIC.memo
  is '��ע';
comment on column WII_PHARM_ANTICOAGULATION_DIC.valid
  is '��Ч��(0:��Ч  1:��Ч)';
comment on column WII_PHARM_ANTICOAGULATION_DIC.pharmacy_code
  is '��ӦҩƷ����';

prompt
prompt Creating table WII_PHARM_B_BIOTICS_DIC
prompt ======================================
prompt
create table WII_PHARM_B_BIOTICS_DIC
(
  bbiotics_pharm_code    VARCHAR2(30),
  bbiotics_pharm_name_c  NVARCHAR2(50),
  bbiotics_pharm_alias_c NVARCHAR2(50),
  bbiotics_pharm_name_e  VARCHAR2(50),
  med_route_ciscode      VARCHAR2(20),
  unit                   VARCHAR2(20),
  pack_quan              VARCHAR2(20),
  input_code             VARCHAR2(50),
  memo                   NVARCHAR2(50),
  valid                  VARCHAR2(20),
  pharmacy_code          VARCHAR2(50),
  duration               NUMBER(4,2)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PHARM_B_BIOTICS_DIC.bbiotics_pharm_code
  is '���׿�����ҩƷ����';
comment on column WII_PHARM_B_BIOTICS_DIC.bbiotics_pharm_name_c
  is '���׿�����ҩƷ��������';
comment on column WII_PHARM_B_BIOTICS_DIC.bbiotics_pharm_alias_c
  is '���׿�����ҩƷ���ı���';
comment on column WII_PHARM_B_BIOTICS_DIC.bbiotics_pharm_name_e
  is '���׿�����ҩƷӢ������';
comment on column WII_PHARM_B_BIOTICS_DIC.med_route_ciscode
  is '��ҩ;��';
comment on column WII_PHARM_B_BIOTICS_DIC.unit
  is '������λ';
comment on column WII_PHARM_B_BIOTICS_DIC.pack_quan
  is '��װ������';
comment on column WII_PHARM_B_BIOTICS_DIC.input_code
  is '��������ĸ(������룩';
comment on column WII_PHARM_B_BIOTICS_DIC.memo
  is '��ע';
comment on column WII_PHARM_B_BIOTICS_DIC.valid
  is '��Ч�ԣ�0_��Ч��1_��Ч��';
comment on column WII_PHARM_B_BIOTICS_DIC.pharmacy_code
  is '��ӦҩƷ����';
comment on column WII_PHARM_B_BIOTICS_DIC.duration
  is '����ʱ�䣨Сʱ��';

prompt
prompt Creating table WII_PHARM_CATEGORY_DIC
prompt =====================================
prompt
create table WII_PHARM_CATEGORY_DIC
(
  category_code      VARCHAR2(100),
  category_name      VARCHAR2(100),
  pharm_code         VARCHAR2(30),
  pharm_name         NVARCHAR2(100),
  pharmacy_code      VARCHAR2(30),
  pharmacy_chemname  NVARCHAR2(50),
  pharmacy_goodsname NVARCHAR2(50),
  custom_match       NVARCHAR2(50),
  input_code         VARCHAR2(50),
  memo               NVARCHAR2(100),
  valid              NUMBER(6) default 1
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PHARM_CATEGORY_DIC.category_code
  is '���ͱ��';
comment on column WII_PHARM_CATEGORY_DIC.category_name
  is '��������';
comment on column WII_PHARM_CATEGORY_DIC.pharm_code
  is 'CISҩƷ���';
comment on column WII_PHARM_CATEGORY_DIC.pharm_name
  is 'CISҩƷ����';
comment on column WII_PHARM_CATEGORY_DIC.pharmacy_code
  is 'HISҩƷ���';
comment on column WII_PHARM_CATEGORY_DIC.pharmacy_chemname
  is 'HISҩƷ��ѧ����';
comment on column WII_PHARM_CATEGORY_DIC.pharmacy_goodsname
  is 'HISҩƷ��Ʒ����';
comment on column WII_PHARM_CATEGORY_DIC.custom_match
  is 'ҩƷ�ؼ��� 1������йؼ��֣��Թؼ����жϣ�ҩƷ�������Ч 2�������������ʽ����^��ͷ';
comment on column WII_PHARM_CATEGORY_DIC.input_code
  is '����¼��';
comment on column WII_PHARM_CATEGORY_DIC.memo
  is '��ע';
comment on column WII_PHARM_CATEGORY_DIC.valid
  is '��Ч�ԣ�0-��Ч��1-��Ч��';

prompt
prompt Creating table WII_PHARM_COLLOID_DIC
prompt ====================================
prompt
create table WII_PHARM_COLLOID_DIC
(
  colloid_class_code   VARCHAR2(50),
  colloid_class_name_c VARCHAR2(100),
  blood_type_name      VARCHAR2(100),
  pharmacy_code        VARCHAR2(50),
  pharmacy_chemname    VARCHAR2(100),
  pharmacy_goodsname   VARCHAR2(100),
  med_route_ciscode    VARCHAR2(50),
  cclass_code          VARCHAR2(50),
  input_code           VARCHAR2(50),
  memo                 VARCHAR2(200),
  valid                VARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_PHARM_COLLOID_DIC
  is '����ҩ��ƥ���ֵ�';
comment on column WII_PHARM_COLLOID_DIC.colloid_class_code
  is '����ҩƷ�������';
comment on column WII_PHARM_COLLOID_DIC.colloid_class_name_c
  is '����ҩƷ������������';
comment on column WII_PHARM_COLLOID_DIC.blood_type_name
  is 'Ѫ��Ʒ����';
comment on column WII_PHARM_COLLOID_DIC.pharmacy_code
  is 'HISҩƷ����';
comment on column WII_PHARM_COLLOID_DIC.pharmacy_chemname
  is 'HISҩƷ��ѧ����';
comment on column WII_PHARM_COLLOID_DIC.pharmacy_goodsname
  is 'HISҩƷ��Ʒ����';
comment on column WII_PHARM_COLLOID_DIC.med_route_ciscode
  is '��ҩ;��CIS���루���Զ��;����';
comment on column WII_PHARM_COLLOID_DIC.cclass_code
  is 'CIS��������ţ�ҽ��;�����ࣩ';
comment on column WII_PHARM_COLLOID_DIC.input_code
  is '��������ĸ(������룩';
comment on column WII_PHARM_COLLOID_DIC.memo
  is '��ע';
comment on column WII_PHARM_COLLOID_DIC.valid
  is '��Ч�ԣ�0-��Ч��1-��Ч��';

prompt
prompt Creating table WII_PHARM_DOSEUNIT_DIC
prompt =====================================
prompt
create table WII_PHARM_DOSEUNIT_DIC
(
  p_doseunit_code     VARCHAR2(30),
  p_doseunit_name     VARCHAR2(30),
  p_doseunit_his_name NVARCHAR2(30),
  input_code          VARCHAR2(30),
  memo                NVARCHAR2(50),
  valid               VARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PHARM_DOSEUNIT_DIC.p_doseunit_code
  is 'CISҩƷ������λ����';
comment on column WII_PHARM_DOSEUNIT_DIC.p_doseunit_name
  is 'CISҩƷ������λ����';
comment on column WII_PHARM_DOSEUNIT_DIC.p_doseunit_his_name
  is 'HISҩƷ������λ����';
comment on column WII_PHARM_DOSEUNIT_DIC.input_code
  is '��������ĸ(������룩';
comment on column WII_PHARM_DOSEUNIT_DIC.memo
  is '��ע';

prompt
prompt Creating table WII_PHARM_FORMULA_DIC
prompt ====================================
prompt
create table WII_PHARM_FORMULA_DIC
(
  p_formula_code     VARCHAR2(30),
  p_formula_name     NVARCHAR2(30),
  pharm_cat_his_name NVARCHAR2(30),
  input_code         VARCHAR2(50),
  memo               NVARCHAR2(50),
  valid              VARCHAR2(10)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PHARM_FORMULA_DIC.p_formula_code
  is 'CISҩƷ���ͱ���';
comment on column WII_PHARM_FORMULA_DIC.p_formula_name
  is 'CISҩƷ��������';
comment on column WII_PHARM_FORMULA_DIC.pharm_cat_his_name
  is 'HISҩƷ��������';
comment on column WII_PHARM_FORMULA_DIC.input_code
  is '��������ĸ(������룩';
comment on column WII_PHARM_FORMULA_DIC.memo
  is '��ע';
comment on column WII_PHARM_FORMULA_DIC.valid
  is '��Ч�ԣ�0-��Ч��1-��Ч��';

prompt
prompt Creating table WII_PHARM_INSULIN_DIC
prompt ====================================
prompt
create table WII_PHARM_INSULIN_DIC
(
  insulin_pharm_code   VARCHAR2(30),
  insulin_pharm_name_c NVARCHAR2(50),
  pharmacy_code        VARCHAR2(30),
  pharmacy_chemname    NVARCHAR2(50),
  pharmacy_goodsname   NVARCHAR2(50),
  dose_per_unit        VARCHAR2(30),
  dose_units           VARCHAR2(30),
  input_code           VARCHAR2(30),
  memo                 NVARCHAR2(100),
  valid                VARCHAR2(10)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PHARM_INSULIN_DIC.insulin_pharm_code
  is '���׿�����ҩƷ����';
comment on column WII_PHARM_INSULIN_DIC.insulin_pharm_name_c
  is '���׿�����ҩƷ��������';
comment on column WII_PHARM_INSULIN_DIC.pharmacy_code
  is 'HISҩƷ����';
comment on column WII_PHARM_INSULIN_DIC.pharmacy_chemname
  is 'HISҩƷ��ѧ����';
comment on column WII_PHARM_INSULIN_DIC.pharmacy_goodsname
  is 'HISҩƷ��Ʒ����';
comment on column WII_PHARM_INSULIN_DIC.dose_per_unit
  is '��С��λ������10ml/֧��';
comment on column WII_PHARM_INSULIN_DIC.dose_units
  is '������λ';
comment on column WII_PHARM_INSULIN_DIC.input_code
  is '��������ĸ(������룩';
comment on column WII_PHARM_INSULIN_DIC.memo
  is '��ע';
comment on column WII_PHARM_INSULIN_DIC.valid
  is '��Ч�ԣ�0-��Ч��1-��Ч��';

prompt
prompt Creating table WII_PHARM_JS_DIC
prompt ===============================
prompt
create table WII_PHARM_JS_DIC
(
  js_pharm_code      VARCHAR2(30),
  js_pharm_name_c    NVARCHAR2(50),
  pharmacy_chemname  NVARCHAR2(2000),
  pharmacy_goodsname NVARCHAR2(2000),
  pack_quan          VARCHAR2(20),
  unit               VARCHAR2(20),
  med_route_ciscode  VARCHAR2(20),
  input_code         VARCHAR2(50),
  memo               NVARCHAR2(50),
  valid              VARCHAR2(20),
  pharmacy_code      VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PHARM_JS_DIC.js_pharm_code
  is 'CIS����ҩƷ����';
comment on column WII_PHARM_JS_DIC.js_pharm_name_c
  is 'CIS����ҩƷ��������';
comment on column WII_PHARM_JS_DIC.pharmacy_chemname
  is 'HISҩƷ��ѧ����';
comment on column WII_PHARM_JS_DIC.pharmacy_goodsname
  is 'HISҩƷ��Ʒ����';
comment on column WII_PHARM_JS_DIC.pack_quan
  is 'HIS��װ������';
comment on column WII_PHARM_JS_DIC.unit
  is 'HIS������λ';
comment on column WII_PHARM_JS_DIC.med_route_ciscode
  is 'CIS��ҩ;��';
comment on column WII_PHARM_JS_DIC.input_code
  is '��������ĸ(������룩';
comment on column WII_PHARM_JS_DIC.memo
  is '��ע';
comment on column WII_PHARM_JS_DIC.valid
  is '��Ч�ԣ�0-��Ч��1-��Ч��';
comment on column WII_PHARM_JS_DIC.pharmacy_code
  is 'HIS ҩƷ����';

prompt
prompt Creating table WII_PHARM_KN_DIC
prompt ===============================
prompt
create table WII_PHARM_KN_DIC
(
  kn_pharm_code      VARCHAR2(30),
  kn_pharm_name_c    NVARCHAR2(50),
  pharmacy_code      VARCHAR2(50),
  pharmacy_chemname  VARCHAR2(2000),
  pharmacy_goodsname VARCHAR2(2000),
  pack_quan          VARCHAR2(20),
  unit               VARCHAR2(20),
  med_route_ciscode  VARCHAR2(20),
  input_code         VARCHAR2(50),
  memo               NVARCHAR2(50),
  valid              VARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PHARM_KN_DIC.kn_pharm_code
  is 'CIS����ҩƷ����';
comment on column WII_PHARM_KN_DIC.kn_pharm_name_c
  is 'CIS����ҩƷ��������';
comment on column WII_PHARM_KN_DIC.pharmacy_code
  is 'HIS ҩƷ����';
comment on column WII_PHARM_KN_DIC.pharmacy_chemname
  is 'HISҩƷ��ѧ����';
comment on column WII_PHARM_KN_DIC.pharmacy_goodsname
  is 'HISҩƷ��Ʒ����';
comment on column WII_PHARM_KN_DIC.pack_quan
  is 'HIS��װ������';
comment on column WII_PHARM_KN_DIC.unit
  is 'HIS������λ';
comment on column WII_PHARM_KN_DIC.med_route_ciscode
  is 'CIS��ҩ;��';
comment on column WII_PHARM_KN_DIC.input_code
  is '��������ĸ(������룩';
comment on column WII_PHARM_KN_DIC.memo
  is '��ע';
comment on column WII_PHARM_KN_DIC.valid
  is '��Ч�ԣ�0-��Ч��1-��Ч��';

prompt
prompt Creating table WII_PHARM_PUMP_DIC
prompt =================================
prompt
create table WII_PHARM_PUMP_DIC
(
  p_pump_code        VARCHAR2(30),
  p_pump_name        NVARCHAR2(30),
  p_pump_unit        VARCHAR2(20),
  p_pump_attribute   VARCHAR2(20),
  input_code         VARCHAR2(20),
  memo               NVARCHAR2(50),
  valid              VARCHAR2(20),
  pharmacy_code      VARCHAR2(30),
  pharmacy_chemname  NVARCHAR2(50),
  pharmacy_goodsname NVARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PHARM_PUMP_DIC.p_pump_code
  is '����ҩ����';
comment on column WII_PHARM_PUMP_DIC.p_pump_name
  is '����ҩ����';
comment on column WII_PHARM_PUMP_DIC.p_pump_unit
  is 'ҩƷ��λ';
comment on column WII_PHARM_PUMP_DIC.p_pump_attribute
  is '����';
comment on column WII_PHARM_PUMP_DIC.input_code
  is '��������ĸ(������룩';
comment on column WII_PHARM_PUMP_DIC.memo
  is '��ע���ص�������';
comment on column WII_PHARM_PUMP_DIC.valid
  is '��Ч�ԣ�0-��Ч��1-��Ч��';
comment on column WII_PHARM_PUMP_DIC.pharmacy_code
  is 'HISҩƷ����';
comment on column WII_PHARM_PUMP_DIC.pharmacy_chemname
  is 'HISҩƷ��ѧ����';
comment on column WII_PHARM_PUMP_DIC.pharmacy_goodsname
  is 'HISҩƷ��Ʒ����';

prompt
prompt Creating table WII_PHARM_RESCUE_DIC
prompt ===================================
prompt
create table WII_PHARM_RESCUE_DIC
(
  rescue_pharm_code   VARCHAR2(30),
  rescue_pharm_name_c NVARCHAR2(50),
  med_route_ciscode   VARCHAR2(20),
  unit                VARCHAR2(20),
  pack_quan           VARCHAR2(20),
  input_code          VARCHAR2(50),
  memo                VARCHAR2(50),
  valid               VARCHAR2(20),
  pharmacy_code       VARCHAR2(50),
  pharmacy_chemname   NVARCHAR2(50),
  pharmacy_goodsname  NVARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PHARM_RESCUE_DIC.rescue_pharm_code
  is '����ҩƷ����';
comment on column WII_PHARM_RESCUE_DIC.rescue_pharm_name_c
  is '����ҩƷ��������';
comment on column WII_PHARM_RESCUE_DIC.med_route_ciscode
  is '��ҩ;��';
comment on column WII_PHARM_RESCUE_DIC.unit
  is '������λ';
comment on column WII_PHARM_RESCUE_DIC.pack_quan
  is '��װ������';
comment on column WII_PHARM_RESCUE_DIC.input_code
  is '��������ĸ(������룩';
comment on column WII_PHARM_RESCUE_DIC.memo
  is '��ע';
comment on column WII_PHARM_RESCUE_DIC.valid
  is '��Ч�ԣ�0_��Ч��1_��Ч��';
comment on column WII_PHARM_RESCUE_DIC.pharmacy_code
  is 'HISҩƷ����';
comment on column WII_PHARM_RESCUE_DIC.pharmacy_chemname
  is 'HISҩƷ��ѧ����';
comment on column WII_PHARM_RESCUE_DIC.pharmacy_goodsname
  is 'HISҩƷ��Ʒ����';

prompt
prompt Creating table WII_PHARM_XGHX_DIC
prompt =================================
prompt
create table WII_PHARM_XGHX_DIC
(
  xghx_pharm_code    VARCHAR2(30),
  xghx_pharm_name_c  NVARCHAR2(50),
  xghx_pharm_alias_c NVARCHAR2(50),
  xghx_pharm_name_e  VARCHAR2(50),
  med_route_ciscode  VARCHAR2(20),
  unit               VARCHAR2(20),
  pack_quan          VARCHAR2(20),
  input_code         VARCHAR2(50),
  memo               NVARCHAR2(50),
  valid              VARCHAR2(20),
  pharmacy_code      VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PHARM_XGHX_DIC.xghx_pharm_code
  is 'Ѫ�ܻ���ҩƷ����';
comment on column WII_PHARM_XGHX_DIC.xghx_pharm_name_c
  is 'Ѫ�ܻ���ҩƷ��������';
comment on column WII_PHARM_XGHX_DIC.xghx_pharm_alias_c
  is 'Ѫ�ܻ���ҩƷ���ı���';
comment on column WII_PHARM_XGHX_DIC.xghx_pharm_name_e
  is 'Ѫ�ܻ���ҩƷӢ������';
comment on column WII_PHARM_XGHX_DIC.med_route_ciscode
  is '��ҩ;��';
comment on column WII_PHARM_XGHX_DIC.unit
  is '������λ';
comment on column WII_PHARM_XGHX_DIC.pack_quan
  is '��װ������';
comment on column WII_PHARM_XGHX_DIC.input_code
  is '��������ĸ(������룩';
comment on column WII_PHARM_XGHX_DIC.memo
  is '��ע';
comment on column WII_PHARM_XGHX_DIC.valid
  is '��Ч�ԣ�0_��Ч��1_��Ч��';
comment on column WII_PHARM_XGHX_DIC.pharmacy_code
  is '��ӦҩƷ����';

prompt
prompt Creating table WII_PHARM_YLZY_CAT_DIC
prompt =====================================
prompt
create table WII_PHARM_YLZY_CAT_DIC
(
  pharm_cat_cis_code VARCHAR2(30),
  pharm_cat_cis_name NVARCHAR2(30),
  pharm_cat_his_code NVARCHAR2(30),
  his_parentcat_code VARCHAR2(20),
  pharm_cat_his_name VARCHAR2(100),
  input_code         VARCHAR2(50),
  memo               NVARCHAR2(50),
  valid              VARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PHARM_YLZY_CAT_DIC.pharm_cat_cis_code
  is 'CISҩƷ�������';
comment on column WII_PHARM_YLZY_CAT_DIC.pharm_cat_cis_name
  is 'CISҩƷ�������';
comment on column WII_PHARM_YLZY_CAT_DIC.pharm_cat_his_code
  is 'HISҩƷ�������';
comment on column WII_PHARM_YLZY_CAT_DIC.his_parentcat_code
  is '��������';
comment on column WII_PHARM_YLZY_CAT_DIC.pharm_cat_his_name
  is 'CISҩƷ��������';
comment on column WII_PHARM_YLZY_CAT_DIC.input_code
  is '��������ĸ(������룩';
comment on column WII_PHARM_YLZY_CAT_DIC.memo
  is '��ע';
comment on column WII_PHARM_YLZY_CAT_DIC.valid
  is '��Ч�ԣ�0_��Ч��1_��Ч��';

prompt
prompt Creating table WII_PIGEONHOLE_DETAILS
prompt =====================================
prompt
create table WII_PIGEONHOLE_DETAILS
(
  patient_id   VARCHAR2(30),
  doc_code     VARCHAR2(100),
  pdf_url      VARCHAR2(100),
  operator     NVARCHAR2(30),
  operate_time DATE,
  creator      NVARCHAR2(20),
  create_time  DATE default sysdate,
  modifier     NVARCHAR2(20),
  modify_time  DATE,
  unique_id    VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PIGEONHOLE_DETAILS.patient_id
  is '����ID';
comment on column WII_PIGEONHOLE_DETAILS.doc_code
  is '�ĵ�����';
comment on column WII_PIGEONHOLE_DETAILS.pdf_url
  is 'PDF�ļ�����·��';
comment on column WII_PIGEONHOLE_DETAILS.operator
  is '������';
comment on column WII_PIGEONHOLE_DETAILS.operate_time
  is '����ʱ��';
comment on column WII_PIGEONHOLE_DETAILS.creator
  is '������';
comment on column WII_PIGEONHOLE_DETAILS.create_time
  is '����ʱ��';
comment on column WII_PIGEONHOLE_DETAILS.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PIGEONHOLE_METHOD
prompt ====================================
prompt
create table WII_PIGEONHOLE_METHOD
(
  doc_code    VARCHAR2(30),
  method      VARCHAR2(30),
  memo        NVARCHAR2(200),
  creator     NVARCHAR2(20),
  create_time DATE default sysdate,
  modifier    NVARCHAR2(20),
  modify_time DATE,
  unique_id   VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_PIGEONHOLE_METHOD.doc_code
  is '�ĵ�����';
comment on column WII_PIGEONHOLE_METHOD.method
  is '�ӿڷ�������';
comment on column WII_PIGEONHOLE_METHOD.memo
  is '�ӿڷ�����ע';
comment on column WII_PIGEONHOLE_METHOD.creator
  is '������';
comment on column WII_PIGEONHOLE_METHOD.create_time
  is '����ʱ��';
comment on column WII_PIGEONHOLE_METHOD.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PIGEONHOLE_MODULE
prompt ====================================
prompt
create table WII_PIGEONHOLE_MODULE
(
  doc_code    NVARCHAR2(100),
  doc_name    VARCHAR2(50),
  doc_type    VARCHAR2(20),
  all_locking VARCHAR2(10),
  memo        NVARCHAR2(100),
  creator     NVARCHAR2(20),
  create_time DATE default sysdate,
  sort        NUMBER(6),
  modifier    NVARCHAR2(20),
  modify_time DATE,
  unique_id   VARCHAR2(50) default sys_guid(),
  html        VARCHAR2(50),
  return_url  NVARCHAR2(200)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PIGEONHOLE_MODULE.doc_code
  is '�ĵ�����';
comment on column WII_PIGEONHOLE_MODULE.doc_name
  is '�ĵ�����';
comment on column WII_PIGEONHOLE_MODULE.doc_type
  is '�ĵ�����(Ժ��/����)';
comment on column WII_PIGEONHOLE_MODULE.all_locking
  is 'ȫ������(1/0)';
comment on column WII_PIGEONHOLE_MODULE.memo
  is '��ע���ص�������';
comment on column WII_PIGEONHOLE_MODULE.creator
  is '������';
comment on column WII_PIGEONHOLE_MODULE.create_time
  is '����ʱ��';
comment on column WII_PIGEONHOLE_MODULE.sort
  is '����';
comment on column WII_PIGEONHOLE_MODULE.unique_id
  is '����ΨһID';
comment on column WII_PIGEONHOLE_MODULE.html
  is 'ҳ��';
comment on column WII_PIGEONHOLE_MODULE.return_url
  is '��̬ҳ��URL';

prompt
prompt Creating table WII_PIGEONHOLE_REMIND
prompt ====================================
prompt
create table WII_PIGEONHOLE_REMIND
(
  patient_id  VARCHAR2(30),
  remind      VARCHAR2(1),
  creator     NVARCHAR2(20),
  create_time DATE default sysdate,
  modifier    NVARCHAR2(20),
  modify_time DATE,
  unique_id   VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PIGEONHOLE_REMIND.patient_id
  is '����ID';
comment on column WII_PIGEONHOLE_REMIND.remind
  is '�鵵����(1��������)';
comment on column WII_PIGEONHOLE_REMIND.creator
  is '������';
comment on column WII_PIGEONHOLE_REMIND.create_time
  is '����ʱ��';
comment on column WII_PIGEONHOLE_REMIND.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PORTAL_NOTICE
prompt ================================
prompt
create table WII_PORTAL_NOTICE
(
  ward_code    VARCHAR2(20),
  release_time DATE,
  expired_time DATE,
  title        VARCHAR2(200),
  author       VARCHAR2(20),
  content      NVARCHAR2(2000),
  abstract     NVARCHAR2(200),
  key_word     NVARCHAR2(200),
  memo         NVARCHAR2(2000),
  link         VARCHAR2(2000),
  status       NUMBER(1),
  creator      NVARCHAR2(20),
  create_time  DATE default sysdate,
  modifier     NVARCHAR2(20),
  modify_time  DATE,
  unique_id    VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_PORTAL_NOTICE.ward_code
  is '�������';
comment on column WII_PORTAL_NOTICE.release_time
  is '����ʱ��';
comment on column WII_PORTAL_NOTICE.expired_time
  is '����ʱ��';
comment on column WII_PORTAL_NOTICE.title
  is '����';
comment on column WII_PORTAL_NOTICE.author
  is '����';
comment on column WII_PORTAL_NOTICE.content
  is '����';
comment on column WII_PORTAL_NOTICE.abstract
  is 'ժҪ';
comment on column WII_PORTAL_NOTICE.key_word
  is '�ؼ���';
comment on column WII_PORTAL_NOTICE.memo
  is '��ע';
comment on column WII_PORTAL_NOTICE.link
  is '������ַ';
comment on column WII_PORTAL_NOTICE.status
  is '״̬�����á����ϵȣ�';
comment on column WII_PORTAL_NOTICE.creator
  is '������';
comment on column WII_PORTAL_NOTICE.create_time
  is '����ʱ��';
comment on column WII_PORTAL_NOTICE.modifier
  is '�޸���';
comment on column WII_PORTAL_NOTICE.modify_time
  is '�޸�ʱ��';
comment on column WII_PORTAL_NOTICE.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_POSTOP_MONITOR
prompt =================================
prompt
create table WII_POSTOP_MONITOR
(
  patient_id    VARCHAR2(20),
  visit_id      NUMBER(3),
  operation_id  NUMBER(2),
  start_time    DATE,
  end_time      DATE,
  frequency     NUMBER(4),
  monitor_items VARCHAR2(500),
  ward_code     VARCHAR2(20),
  operator      VARCHAR2(30),
  memo          VARCHAR2(500),
  creator       NVARCHAR2(20),
  create_time   DATE default sysdate,
  modifier      NVARCHAR2(20),
  modify_time   DATE,
  unique_id     VARCHAR2(50) default sys_guid(),
  out_ward_time DATE,
  in_ward_time  DATE
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_POSTOP_MONITOR.patient_id
  is '���߱��';
comment on column WII_POSTOP_MONITOR.visit_id
  is 'סԺ����';
comment on column WII_POSTOP_MONITOR.operation_id
  is '����ID';
comment on column WII_POSTOP_MONITOR.start_time
  is '��ʼʱ��';
comment on column WII_POSTOP_MONITOR.end_time
  is '����ʱ��';
comment on column WII_POSTOP_MONITOR.frequency
  is 'Ƶ��';
comment on column WII_POSTOP_MONITOR.monitor_items
  is '�����Ŀ';
comment on column WII_POSTOP_MONITOR.ward_code
  is '�������';
comment on column WII_POSTOP_MONITOR.operator
  is '������';
comment on column WII_POSTOP_MONITOR.memo
  is '��ע';
comment on column WII_POSTOP_MONITOR.creator
  is '������';
comment on column WII_POSTOP_MONITOR.create_time
  is '����ʱ��';
comment on column WII_POSTOP_MONITOR.modifier
  is '�޸���';
comment on column WII_POSTOP_MONITOR.modify_time
  is '�޸�ʱ��';
comment on column WII_POSTOP_MONITOR.unique_id
  is '����ΨһID';
comment on column WII_POSTOP_MONITOR.out_ward_time
  is '����ȥ������ʱ��';
comment on column WII_POSTOP_MONITOR.in_ward_time
  is '�������һ���ʱ��';

prompt
prompt Creating table WII_PRINT_CONFIG
prompt ===============================
prompt
create table WII_PRINT_CONFIG
(
  node_ip     VARCHAR2(50),
  print_name  VARCHAR2(100),
  print_size  VARCHAR2(50),
  create_time DATE default sysdate,
  creator     VARCHAR2(20),
  modify_by   VARCHAR2(20),
  modify_time DATE
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PRINT_CONFIG.node_ip
  is 'IP��ַ';
comment on column WII_PRINT_CONFIG.print_name
  is '��ӡ������';
comment on column WII_PRINT_CONFIG.print_size
  is 'ֽ��';
comment on column WII_PRINT_CONFIG.create_time
  is '����ʱ��';
comment on column WII_PRINT_CONFIG.creator
  is '������';
comment on column WII_PRINT_CONFIG.modify_by
  is '�޸���';
comment on column WII_PRINT_CONFIG.modify_time
  is '�޸�ʱ��';

prompt
prompt Creating table WII_PROCEDURE_DIC
prompt ================================
prompt
create table WII_PROCEDURE_DIC
(
  procedure_code     VARCHAR2(20),
  procedure_name     NVARCHAR2(50),
  procedure_category NVARCHAR2(50),
  procedure_describe NVARCHAR2(200)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PROCEDURE_DIC.procedure_code
  is '������Ŀ����';
comment on column WII_PROCEDURE_DIC.procedure_name
  is '������Ŀ����';
comment on column WII_PROCEDURE_DIC.procedure_category
  is '������Ŀ��𣨻������������������ѭ����.--�д���ࣩ';
comment on column WII_PROCEDURE_DIC.procedure_describe
  is '����������������׼���������̵ȣ�';

prompt
prompt Creating table WII_PROCEDURE_EXEC_ICU
prompt =====================================
prompt
create table WII_PROCEDURE_EXEC_ICU
(
  patient_id     VARCHAR2(20),
  procedure_code VARCHAR2(16),
  procedure_name NVARCHAR2(50),
  procedure_memo NVARCHAR2(100),
  procedure_time DATE,
  order_no       VARCHAR2(20),
  operator       NVARCHAR2(20),
  verify_nurse   NVARCHAR2(20),
  creator        NVARCHAR2(20),
  create_time    DATE default sysdate,
  modifier       NVARCHAR2(20),
  modify_time    DATE,
  unique_id      VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_PROCEDURE_EXEC_ICU.patient_id
  is '�����ˣ���ţ�Ψһ��ʶ';
comment on column WII_PROCEDURE_EXEC_ICU.procedure_code
  is '������Ŀ����';
comment on column WII_PROCEDURE_EXEC_ICU.procedure_name
  is '������Ŀ����';
comment on column WII_PROCEDURE_EXEC_ICU.procedure_memo
  is '������Ŀ��ע˵��';
comment on column WII_PROCEDURE_EXEC_ICU.procedure_time
  is '����ʵ��ִ��ʱ��';
comment on column WII_PROCEDURE_EXEC_ICU.order_no
  is '��ҽ�����';
comment on column WII_PROCEDURE_EXEC_ICU.operator
  is '����ʵ��ִ�л�ʿ';
comment on column WII_PROCEDURE_EXEC_ICU.verify_nurse
  is '����ִ�к˶Ի�ʿ';
comment on column WII_PROCEDURE_EXEC_ICU.creator
  is '������';
comment on column WII_PROCEDURE_EXEC_ICU.create_time
  is '����ʱ��';
comment on column WII_PROCEDURE_EXEC_ICU.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_PUMP_ORDER_EXTEND_INFO
prompt =========================================
prompt
create table WII_PUMP_ORDER_EXTEND_INFO
(
  patient_id             VARCHAR2(20),
  order_no               VARCHAR2(20),
  order_sub_no           VARCHAR2(20),
  default_time           DATE,
  pharmacy_code          VARCHAR2(40),
  pharmacy_name          VARCHAR2(50),
  pharmacy_dosage        NUMBER(14,4),
  pharmacy_dosage_unit   VARCHAR2(8),
  injection_code         VARCHAR2(20),
  injection_name         VARCHAR2(50),
  injection_dosage       NUMBER(14,4),
  injection_dosage_unit  VARCHAR2(8),
  dosing_rate_units      VARCHAR2(20),
  operator               NVARCHAR2(30),
  operate_time           DATE,
  memo                   NVARCHAR2(400),
  memo_time_point        DATE,
  creator                NVARCHAR2(20),
  create_time            DATE default sysdate,
  modifier               NVARCHAR2(20),
  modify_time            DATE,
  body_weight            NUMBER(6,3),
  weight_unit            VARCHAR2(20),
  pharmacy_his_code      VARCHAR2(20),
  pharmacy_his_name      VARCHAR2(50),
  injection_his_code     VARCHAR2(20),
  injection_his_name     VARCHAR2(50),
  pharmacy_liquid_dosage NUMBER(14,4),
  pharmacy_liquid_unit   VARCHAR2(8),
  unique_id              VARCHAR2(50) default sys_guid(),
  pharmacy_amount        NUMBER(14,4),
  concentration          NUMBER(14,4),
  concentration_unit     VARCHAR2(50),
  pharmacy_concentration VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_PUMP_ORDER_EXTEND_INFO.patient_id
  is '����Ψһ��ʶ��';
comment on column WII_PUMP_ORDER_EXTEND_INFO.order_no
  is 'ҽ�����';
comment on column WII_PUMP_ORDER_EXTEND_INFO.order_sub_no
  is 'ҽ�������';
comment on column WII_PUMP_ORDER_EXTEND_INFO.default_time
  is 'Ĭ��ִ������ʱ��';
comment on column WII_PUMP_ORDER_EXTEND_INFO.pharmacy_code
  is 'ҩƷCIS����';
comment on column WII_PUMP_ORDER_EXTEND_INFO.pharmacy_name
  is 'ҩƷCIS����';
comment on column WII_PUMP_ORDER_EXTEND_INFO.pharmacy_dosage
  is 'ҩ��CIS����';
comment on column WII_PUMP_ORDER_EXTEND_INFO.pharmacy_dosage_unit
  is 'ҩ�������λ';
comment on column WII_PUMP_ORDER_EXTEND_INFO.injection_code
  is 'ע��ҺҩƷCIS����';
comment on column WII_PUMP_ORDER_EXTEND_INFO.injection_name
  is 'ע��ҺҩƷCIS����';
comment on column WII_PUMP_ORDER_EXTEND_INFO.injection_dosage
  is 'ע��Һ����';
comment on column WII_PUMP_ORDER_EXTEND_INFO.injection_dosage_unit
  is 'ע��Һ������λ';
comment on column WII_PUMP_ORDER_EXTEND_INFO.dosing_rate_units
  is 'ҩ�����ٵ�λ';
comment on column WII_PUMP_ORDER_EXTEND_INFO.operator
  is '������';
comment on column WII_PUMP_ORDER_EXTEND_INFO.operate_time
  is '����ʱ��';
comment on column WII_PUMP_ORDER_EXTEND_INFO.memo
  is '��ע';
comment on column WII_PUMP_ORDER_EXTEND_INFO.memo_time_point
  is '��עʱ���';
comment on column WII_PUMP_ORDER_EXTEND_INFO.creator
  is '������';
comment on column WII_PUMP_ORDER_EXTEND_INFO.create_time
  is '����ʱ��';
comment on column WII_PUMP_ORDER_EXTEND_INFO.modifier
  is '�޸���';
comment on column WII_PUMP_ORDER_EXTEND_INFO.modify_time
  is '�޸�ʱ��';
comment on column WII_PUMP_ORDER_EXTEND_INFO.body_weight
  is '��������';
comment on column WII_PUMP_ORDER_EXTEND_INFO.weight_unit
  is '���ص�λ';
comment on column WII_PUMP_ORDER_EXTEND_INFO.pharmacy_his_code
  is 'ҩƷHIS����';
comment on column WII_PUMP_ORDER_EXTEND_INFO.pharmacy_his_name
  is 'ҩƷHIS����';
comment on column WII_PUMP_ORDER_EXTEND_INFO.injection_his_code
  is 'ע��ҺҩƷHIS����';
comment on column WII_PUMP_ORDER_EXTEND_INFO.injection_his_name
  is 'ע��ҺҩƷHIS����';
comment on column WII_PUMP_ORDER_EXTEND_INFO.pharmacy_liquid_dosage
  is '���ʵ���Һ����';
comment on column WII_PUMP_ORDER_EXTEND_INFO.pharmacy_liquid_unit
  is '���ʵ���Һ��λ';
comment on column WII_PUMP_ORDER_EXTEND_INFO.unique_id
  is '����ΨһID';
comment on column WII_PUMP_ORDER_EXTEND_INFO.pharmacy_amount
  is 'ʣ����';
comment on column WII_PUMP_ORDER_EXTEND_INFO.concentration
  is 'Ũ��';
comment on column WII_PUMP_ORDER_EXTEND_INFO.concentration_unit
  is 'Ũ�ȵ�λ';
comment on column WII_PUMP_ORDER_EXTEND_INFO.pharmacy_concentration
  is 'ҩ��Ũ��';

prompt
prompt Creating table WII_QUALITY_ASSESSMENT_MASTER
prompt ============================================
prompt
create table WII_QUALITY_ASSESSMENT_MASTER
(
  quality_assessment_no NUMBER(6),
  ass_name              VARCHAR2(50),
  ward_code             VARCHAR2(20),
  ass_time              DATE,
  ass_person            VARCHAR2(20),
  score_id              NUMBER(6),
  total_score           NUMBER(6,1),
  score                 NUMBER(6,1),
  creator               NVARCHAR2(20),
  create_time           DATE default sysdate,
  modifier              NVARCHAR2(20),
  modify_time           DATE,
  unique_id             VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_QUALITY_ASSESSMENT_MASTER.quality_assessment_no
  is '��ˮ��';
comment on column WII_QUALITY_ASSESSMENT_MASTER.ass_name
  is '��������';
comment on column WII_QUALITY_ASSESSMENT_MASTER.ward_code
  is '��������';
comment on column WII_QUALITY_ASSESSMENT_MASTER.ass_time
  is '����ʱ��';
comment on column WII_QUALITY_ASSESSMENT_MASTER.ass_person
  is '������';
comment on column WII_QUALITY_ASSESSMENT_MASTER.score_id
  is '�÷�ID';
comment on column WII_QUALITY_ASSESSMENT_MASTER.total_score
  is '�ܷ�';
comment on column WII_QUALITY_ASSESSMENT_MASTER.score
  is '�÷�';
comment on column WII_QUALITY_ASSESSMENT_MASTER.creator
  is '������';
comment on column WII_QUALITY_ASSESSMENT_MASTER.create_time
  is '����ʱ��';
comment on column WII_QUALITY_ASSESSMENT_MASTER.modifier
  is '�޸���';
comment on column WII_QUALITY_ASSESSMENT_MASTER.modify_time
  is '�޸�ʱ��';
comment on column WII_QUALITY_ASSESSMENT_MASTER.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_QUALITY_ASSESSMENT_SCORE
prompt ===========================================
prompt
create table WII_QUALITY_ASSESSMENT_SCORE
(
  qs_score_no      NUMBER(11),
  parent_no        NUMBER(11),
  item_type        VARCHAR2(20),
  item_text        VARCHAR2(500),
  item_score       NUMBER(6,1),
  template_name    VARCHAR2(50),
  template_creator NVARCHAR2(30),
  total_score      NUMBER(6,1),
  creator          NVARCHAR2(20),
  create_time      DATE default sysdate,
  modifier         NVARCHAR2(20),
  modify_time      DATE,
  is_check         NUMBER(1),
  score            NUMBER(6,1),
  unique_id        VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_QUALITY_ASSESSMENT_SCORE.qs_score_no
  is 'ģ����ˮ��';
comment on column WII_QUALITY_ASSESSMENT_SCORE.parent_no
  is '���ڵ��';
comment on column WII_QUALITY_ASSESSMENT_SCORE.item_type
  is '������';
comment on column WII_QUALITY_ASSESSMENT_SCORE.item_text
  is '������';
comment on column WII_QUALITY_ASSESSMENT_SCORE.item_score
  is '���ֵ';
comment on column WII_QUALITY_ASSESSMENT_SCORE.template_name
  is 'ģ������';
comment on column WII_QUALITY_ASSESSMENT_SCORE.template_creator
  is 'ģ�崴����';
comment on column WII_QUALITY_ASSESSMENT_SCORE.total_score
  is '�ܷ�';
comment on column WII_QUALITY_ASSESSMENT_SCORE.creator
  is '������';
comment on column WII_QUALITY_ASSESSMENT_SCORE.create_time
  is '����ʱ��';
comment on column WII_QUALITY_ASSESSMENT_SCORE.modifier
  is '�޸���';
comment on column WII_QUALITY_ASSESSMENT_SCORE.modify_time
  is '�޸�ʱ��';
comment on column WII_QUALITY_ASSESSMENT_SCORE.is_check
  is '�Ƿ�ѡ(1��ѡ/0δ��ѡ)';
comment on column WII_QUALITY_ASSESSMENT_SCORE.score
  is '�����ķ���';
comment on column WII_QUALITY_ASSESSMENT_SCORE.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_QUALITY_ASSESSMENT_TEMP
prompt ==========================================
prompt
create table WII_QUALITY_ASSESSMENT_TEMP
(
  qs_template_no   NUMBER(11),
  parent_no        NUMBER(11),
  item_type        VARCHAR2(20),
  item_text        VARCHAR2(500),
  item_score       NUMBER(6,1),
  template_name    VARCHAR2(50),
  template_creator NVARCHAR2(30),
  total_score      NUMBER(6,1),
  creator          NVARCHAR2(20),
  create_time      DATE default sysdate,
  modifier         NVARCHAR2(20),
  modify_time      DATE,
  unique_id        VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_QUALITY_ASSESSMENT_TEMP.qs_template_no
  is 'ģ����ˮ��';
comment on column WII_QUALITY_ASSESSMENT_TEMP.parent_no
  is '���ڵ��';
comment on column WII_QUALITY_ASSESSMENT_TEMP.item_type
  is '������';
comment on column WII_QUALITY_ASSESSMENT_TEMP.item_text
  is '������';
comment on column WII_QUALITY_ASSESSMENT_TEMP.item_score
  is '���ֵ';
comment on column WII_QUALITY_ASSESSMENT_TEMP.template_name
  is 'ģ������';
comment on column WII_QUALITY_ASSESSMENT_TEMP.template_creator
  is 'ģ�崴����';
comment on column WII_QUALITY_ASSESSMENT_TEMP.total_score
  is '�ܷ�';
comment on column WII_QUALITY_ASSESSMENT_TEMP.creator
  is '������';
comment on column WII_QUALITY_ASSESSMENT_TEMP.create_time
  is '����ʱ��';
comment on column WII_QUALITY_ASSESSMENT_TEMP.modifier
  is '�޸���';
comment on column WII_QUALITY_ASSESSMENT_TEMP.modify_time
  is '�޸�ʱ��';
comment on column WII_QUALITY_ASSESSMENT_TEMP.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_QUALITY_EVENT_DIC
prompt ====================================
prompt
create table WII_QUALITY_EVENT_DIC
(
  qevent_code VARCHAR2(20),
  qevent_name NVARCHAR2(50),
  input_code  VARCHAR2(20),
  memo        NVARCHAR2(30)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_QUALITY_EVENT_DIC.qevent_code
  is '�ٴ���������¼�����
';
comment on column WII_QUALITY_EVENT_DIC.qevent_name
  is '�ٴ���������¼�����
';
comment on column WII_QUALITY_EVENT_DIC.input_code
  is '���������
';
comment on column WII_QUALITY_EVENT_DIC.memo
  is '��ע
';

prompt
prompt Creating table WII_REMIND_EXECUTE
prompt =================================
prompt
create table WII_REMIND_EXECUTE
(
  patient_id        VARCHAR2(20),
  remind_plan_id    NUMBER(6),
  execute_time      DATE,
  execute_result    VARCHAR2(20),
  creator           NVARCHAR2(20),
  create_time       DATE default sysdate,
  modifier          NVARCHAR2(20),
  modify_time       DATE,
  primary_key_value VARCHAR2(300),
  plan_execute_time DATE,
  message           NVARCHAR2(500),
  unique_id         VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table WII_REMIND_EXECUTE
  is '���Ѽƻ�ִ�б�';
comment on column WII_REMIND_EXECUTE.patient_id
  is '���߱��
';
comment on column WII_REMIND_EXECUTE.remind_plan_id
  is '�ƻ�ID
';
comment on column WII_REMIND_EXECUTE.execute_time
  is 'ִ��ʱ��
';
comment on column WII_REMIND_EXECUTE.execute_result
  is 'ִ�н��
"0��δִ��
1����ִ��"
';
comment on column WII_REMIND_EXECUTE.creator
  is '������
';
comment on column WII_REMIND_EXECUTE.create_time
  is '����ʱ��
';
comment on column WII_REMIND_EXECUTE.modifier
  is '�޸���
';
comment on column WII_REMIND_EXECUTE.modify_time
  is '�޸�ʱ��
';
comment on column WII_REMIND_EXECUTE.primary_key_value
  is '����ֵJSON';
comment on column WII_REMIND_EXECUTE.plan_execute_time
  is '�ƻ�ִ��ʱ��';
comment on column WII_REMIND_EXECUTE.message
  is '��ʾ����';
comment on column WII_REMIND_EXECUTE.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_REMIND_PLAN
prompt ==============================
prompt
create table WII_REMIND_PLAN
(
  remind_plan_id      NUMBER(6),
  remind_type         VARCHAR2(20),
  remind_interval     VARCHAR2(20),
  score_code          VARCHAR2(50),
  condition           VARCHAR2(200),
  next_schedule       VARCHAR2(20),
  message             VARCHAR2(500),
  module_name         VARCHAR2(100),
  system_type         VARCHAR2(20),
  repeat_type         VARCHAR2(20),
  show_type           VARCHAR2(20),
  creator             NVARCHAR2(20),
  create_time         DATE default sysdate,
  modifier            NVARCHAR2(20),
  modify_time         DATE,
  ward_code           VARCHAR2(2000),
  unique_id           VARCHAR2(50) default sys_guid(),
  interval_type       VARCHAR2(50),
  catheter_id         VARCHAR2(1000),
  catheter_model      VARCHAR2(1000),
  start_time          VARCHAR2(50),
  end_time            VARCHAR2(50),
  isshutdown          NUMBER(1),
  repeat_str          NVARCHAR2(200),
  repeat_count        NUMBER(6),
  remind_timepoint    NVARCHAR2(200),
  stop_remind_plan_id NVARCHAR2(20),
  return_url          NVARCHAR2(200),
  nursetempcode       NVARCHAR2(50),
  nursedesc           NVARCHAR2(200),
  return_type         INTEGER
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_REMIND_PLAN
  is '���Ѽƻ���';
comment on column WII_REMIND_PLAN.remind_plan_id
  is '����ID
';
comment on column WII_REMIND_PLAN.remind_type
  is '���Ѽƻ�����
"0����������
1��������
2�������ڿ�
3�����֣�����ʱ�䣩
4�����֣����ʱ�䣩
5�����֣�����������ͬ��"
';
comment on column WII_REMIND_PLAN.remind_interval
  is 'ʱ������ʱ���
';
comment on column WII_REMIND_PLAN.score_code
  is '������Ŀ����
';
comment on column WII_REMIND_PLAN.condition
  is '�ж�����
';
comment on column WII_REMIND_PLAN.next_schedule
  is '�Ƿ��¸���ο�ʼִ��
';
comment on column WII_REMIND_PLAN.message
  is '��ʾ��Ϣ
';
comment on column WII_REMIND_PLAN.module_name
  is '��תģ�� Sign:������Catheter������,Socre:���֣�Plan:����ƻ�,NursingMemo:�����ʩ';
comment on column WII_REMIND_PLAN.system_type
  is 'ϵͳ����
"Nurse����ʿվ
Doctor��ҽ��վ"
';
comment on column WII_REMIND_PLAN.repeat_type
  is '�ظ����� (�����Ѿ���Ч������£��Ƿ���ظ����� 0 �����ظ� 1���ظ�)';
comment on column WII_REMIND_PLAN.show_type
  is '��������
"1����������
2��CDSS
3������"
';
comment on column WII_REMIND_PLAN.creator
  is '������
';
comment on column WII_REMIND_PLAN.create_time
  is '����ʱ��
';
comment on column WII_REMIND_PLAN.modifier
  is '�޸���
';
comment on column WII_REMIND_PLAN.modify_time
  is '�޸�ʱ��
';
comment on column WII_REMIND_PLAN.ward_code
  is '���ұ��';
comment on column WII_REMIND_PLAN.unique_id
  is '����ΨһID';
comment on column WII_REMIND_PLAN.interval_type
  is '�������  1����  2����  3��Сʱ 4������ 5������';
comment on column WII_REMIND_PLAN.catheter_id
  is '�������ͱ���';
comment on column WII_REMIND_PLAN.catheter_model
  is '�����ͺ�';
comment on column WII_REMIND_PLAN.start_time
  is '��ʼʱ��';
comment on column WII_REMIND_PLAN.end_time
  is '����ʱ��';
comment on column WII_REMIND_PLAN.isshutdown
  is '�Ƿ��ж�';
comment on column WII_REMIND_PLAN.repeat_str
  is '�ظ���ʶ �ظ��ܣ�1/2/3/4/5/6/7���ظ��£�1/2/3/4/5/6/7/8/9/10������';
comment on column WII_REMIND_PLAN.repeat_count
  is '�ظ�����';
comment on column WII_REMIND_PLAN.remind_timepoint
  is 'ʱ��� 10:00/18:00';
comment on column WII_REMIND_PLAN.stop_remind_plan_id
  is '��ͣ�������Ѽƻ�Id';
comment on column WII_REMIND_PLAN.return_url
  is '��ת��ַ';
comment on column WII_REMIND_PLAN.nursetempcode
  is '����ģ��Code';
comment on column WII_REMIND_PLAN.nursedesc
  is '�����ʩ';
comment on column WII_REMIND_PLAN.return_type
  is '��ת���� 0���� 1��ת';

prompt
prompt Creating table WII_RESEARCH_ARCHIVES
prompt ====================================
prompt
create table WII_RESEARCH_ARCHIVES
(
  archives_id        VARCHAR2(40),
  archives_type      NUMBER(1),
  archives_name      NVARCHAR2(50),
  inclusion_criteria NVARCHAR2(200),
  exclusion_criteria NVARCHAR2(200),
  archives_parent_id VARCHAR2(40),
  is_auto            NUMBER(1),
  creator            NVARCHAR2(20),
  create_time        DATE default sysdate,
  modifier           NVARCHAR2(20),
  modify_time        DATE,
  unique_id          VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_RESEARCH_ARCHIVES.archives_id
  is '�鵵�ļ��С�����ID';
comment on column WII_RESEARCH_ARCHIVES.archives_type
  is '1-�ļ��У�2����';
comment on column WII_RESEARCH_ARCHIVES.archives_name
  is '�鵵�ļ��С���������';
comment on column WII_RESEARCH_ARCHIVES.inclusion_criteria
  is '�����������';
comment on column WII_RESEARCH_ARCHIVES.exclusion_criteria
  is '�����ų�����';
comment on column WII_RESEARCH_ARCHIVES.archives_parent_id
  is '���������ļ���ID';
comment on column WII_RESEARCH_ARCHIVES.is_auto
  is '1-�Զ��鵵��2-�ֶ��鵵';
comment on column WII_RESEARCH_ARCHIVES.creator
  is '������';
comment on column WII_RESEARCH_ARCHIVES.create_time
  is '����ʱ��';
comment on column WII_RESEARCH_ARCHIVES.modifier
  is '�޸���';
comment on column WII_RESEARCH_ARCHIVES.modify_time
  is '�޸�ʱ��';
comment on column WII_RESEARCH_ARCHIVES.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_RESEARCH_GROUP
prompt =================================
prompt
create table WII_RESEARCH_GROUP
(
  group_code    VARCHAR2(50),
  group_name    VARCHAR2(4000),
  diagnose_code VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_RESEARCH_GROUP.group_code
  is '�Զ��鵵��������';
comment on column WII_RESEARCH_GROUP.group_name
  is '�Զ��鵵����������';
comment on column WII_RESEARCH_GROUP.diagnose_code
  is '��Ӧ����ϱ��� ͬ���Զ�����¼��ʽ����';

prompt
prompt Creating table WII_RESEARCH_ITEM_CONFIG
prompt =======================================
prompt
create table WII_RESEARCH_ITEM_CONFIG
(
  item_code   VARCHAR2(50),
  item_name   VARCHAR2(4000),
  is_dispaly  NUMBER(1),
  group_codes VARCHAR2(4000)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_RESEARCH_ITEM_CONFIG.item_code
  is '��Ŀ���';
comment on column WII_RESEARCH_ITEM_CONFIG.item_name
  is '��Ŀ��';
comment on column WII_RESEARCH_ITEM_CONFIG.is_dispaly
  is '�Ƿ���ʾ 0:��ʾ 1:����ʾ';
comment on column WII_RESEARCH_ITEM_CONFIG.group_codes
  is '�����Զ��鵵�������� ������������Զ��鵵�����鶼��������,������ŷָ�';

prompt
prompt Creating table WII_ROLES
prompt ========================
prompt
create table WII_ROLES
(
  role_id       VARCHAR2(36),
  domain_id     VARCHAR2(36),
  role_name     NVARCHAR2(60),
  description   NVARCHAR2(160),
  create_time   DATE default sysdate,
  status        NUMBER(1),
  creator       NVARCHAR2(20),
  modifier      NVARCHAR2(20),
  modify_time   DATE,
  unique_id     VARCHAR2(50) default sys_guid(),
  role_category NUMBER(1)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_ROLES.role_id
  is '��ɫID';
comment on column WII_ROLES.domain_id
  is '��ID(ѧ����������ICU)';
comment on column WII_ROLES.role_name
  is '��ɫ����';
comment on column WII_ROLES.description
  is '��ɫ���� ��ICU�������Σ�ICU�������Σ�����ҽ����ֵ��ҽ��������ҽ����ICU���Ļ�ʿ����������ʿ���������鳤���ܴ���ʿ�����Ҽ�ʦ�ȣ�';
comment on column WII_ROLES.create_time
  is '����������';
comment on column WII_ROLES.status
  is '����״̬��0��ͣ��
1�����ã�';
comment on column WII_ROLES.unique_id
  is '����ΨһID';
comment on column WII_ROLES.role_category
  is '��ɫ���У�1��ҽ�����У�2����ʿ���У�
';

prompt
prompt Creating table WII_ROLES_AUTHORITY
prompt ==================================
prompt
create table WII_ROLES_AUTHORITY
(
  role_id      VARCHAR2(36),
  authority_id VARCHAR2(36),
  creator      NVARCHAR2(20),
  create_time  DATE default sysdate,
  modifier     NVARCHAR2(20),
  modify_time  DATE,
  unique_id    VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_ROLES_AUTHORITY.role_id
  is '��ɫID';
comment on column WII_ROLES_AUTHORITY.authority_id
  is '��ԴID';
comment on column WII_ROLES_AUTHORITY.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_ROLES_ORG
prompt ============================
prompt
create table WII_ROLES_ORG
(
  role_id     VARCHAR2(20),
  org_code    VARCHAR2(20),
  create_time DATE,
  creator     NVARCHAR2(20),
  modifier    NVARCHAR2(20),
  modify_time DATE,
  unique_id   VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_ROLES_ORG.role_id
  is 'Ȩ�޽�ɫID';
comment on column WII_ROLES_ORG.org_code
  is '����';
comment on column WII_ROLES_ORG.create_time
  is '����������';
comment on column WII_ROLES_ORG.creator
  is '������';
comment on column WII_ROLES_ORG.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_SCHEDULE_MASTER
prompt ==================================
prompt
create table WII_SCHEDULE_MASTER
(
  ward_code     VARCHAR2(20),
  schedule_no   NUMBER(11),
  schedule_name VARCHAR2(8),
  start_time    VARCHAR2(10),
  end_time      VARCHAR2(10),
  sort          NUMBER(6),
  creator       NVARCHAR2(20),
  create_time   DATE default sysdate,
  modifier      NVARCHAR2(20),
  modify_time   DATE,
  unique_id     VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_SCHEDULE_MASTER.ward_code
  is '��������';
comment on column WII_SCHEDULE_MASTER.schedule_no
  is '��κ�';
comment on column WII_SCHEDULE_MASTER.schedule_name
  is '�������';
comment on column WII_SCHEDULE_MASTER.start_time
  is '��ʼʱ��';
comment on column WII_SCHEDULE_MASTER.end_time
  is '����ʱ��';
comment on column WII_SCHEDULE_MASTER.sort
  is '�������';
comment on column WII_SCHEDULE_MASTER.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_SCHEDULE_NURSE_STRUCT
prompt ========================================
prompt
create table WII_SCHEDULE_NURSE_STRUCT
(
  employee_id VARCHAR2(20) not null,
  ward_code   VARCHAR2(20),
  group_name  VARCHAR2(20),
  is_director VARCHAR2(20),
  gen_time    DATE,
  create_time DATE,
  creator     NVARCHAR2(20),
  modifier    NVARCHAR2(20),
  modify_time DATE,
  unique_id   VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_SCHEDULE_NURSE_STRUCT.employee_id
  is '��Ա����';
comment on column WII_SCHEDULE_NURSE_STRUCT.ward_code
  is '������Դ��֯�ṹ�㼶������->����ҽԺ->����->������';
comment on column WII_SCHEDULE_NURSE_STRUCT.group_name
  is '�Ű�С������';
comment on column WII_SCHEDULE_NURSE_STRUCT.is_director
  is '�Ƿ�����';
comment on column WII_SCHEDULE_NURSE_STRUCT.gen_time
  is '����ʱ��';
comment on column WII_SCHEDULE_NURSE_STRUCT.create_time
  is '��������';
comment on column WII_SCHEDULE_NURSE_STRUCT.creator
  is '������';
comment on column WII_SCHEDULE_NURSE_STRUCT.unique_id
  is '����ΨһID';
alter table WII_SCHEDULE_NURSE_STRUCT
  add constraint WII_SCHEDULE_NURSE_STRUCT_PK primary key (EMPLOYEE_ID)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WII_SCHEDULE_REMARK
prompt ==================================
prompt
create table WII_SCHEDULE_REMARK
(
  id                VARCHAR2(50) not null,
  dic_code          VARCHAR2(500),
  doctor_name       NVARCHAR2(2000),
  charge_year_month VARCHAR2(10),
  wardcode          VARCHAR2(2000),
  remark            NVARCHAR2(2000),
  dic_name          VARCHAR2(500),
  creator           VARCHAR2(20),
  create_time       DATE default sysdate,
  modifier          VARCHAR2(20),
  modify_time       DATE
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_SCHEDULE_REMARK.dic_code
  is '��ע���ֵ���';
comment on column WII_SCHEDULE_REMARK.doctor_name
  is 'δ�Ű�ҽ��';
comment on column WII_SCHEDULE_REMARK.charge_year_month
  is '�Ű��¶�';
comment on column WII_SCHEDULE_REMARK.wardcode
  is '�������ұ��(���ŷָ�)';
comment on column WII_SCHEDULE_REMARK.remark
  is '��ע������';
comment on column WII_SCHEDULE_REMARK.dic_name
  is '��ע���ֵ�����';
comment on column WII_SCHEDULE_REMARK.creator
  is '������';
comment on column WII_SCHEDULE_REMARK.create_time
  is '��������';
comment on column WII_SCHEDULE_REMARK.modifier
  is '�޸���';
comment on column WII_SCHEDULE_REMARK.modify_time
  is '�޸�����';
alter table WII_SCHEDULE_REMARK
  add constraint ID_PK primary key (ID)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WII_SCHEDULING_DETAIL
prompt ====================================
prompt
create table WII_SCHEDULING_DETAIL
(
  main_id           NUMBER(6),
  schedule_date     DATE,
  user_id           VARCHAR2(20),
  schedule_no       VARCHAR2(6),
  beds              VARCHAR2(200),
  create_time       DATE default sysdate,
  creator           NVARCHAR2(20),
  modifier          NVARCHAR2(20),
  modify_time       DATE,
  unique_id         VARCHAR2(50) default sys_guid(),
  duty_patientids   NVARCHAR2(1000),
  charge_patientids NVARCHAR2(1000)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_SCHEDULING_DETAIL.main_id
  is '����id';
comment on column WII_SCHEDULING_DETAIL.schedule_date
  is '�Ű�����';
comment on column WII_SCHEDULING_DETAIL.user_id
  is '����';
comment on column WII_SCHEDULING_DETAIL.schedule_no
  is '��κ�';
comment on column WII_SCHEDULING_DETAIL.beds
  is '����id������ԷֺŸ���';
comment on column WII_SCHEDULING_DETAIL.create_time
  is '����ʱ��';
comment on column WII_SCHEDULING_DETAIL.creator
  is '������';
comment on column WII_SCHEDULING_DETAIL.modifier
  is '�޸���';
comment on column WII_SCHEDULING_DETAIL.modify_time
  is '�޸�ʱ��';
comment on column WII_SCHEDULING_DETAIL.unique_id
  is '����ΨһID';
comment on column WII_SCHEDULING_DETAIL.duty_patientids
  is '���β���Id(��ʿ������Ĳ��� �ã��ָ�)';
comment on column WII_SCHEDULING_DETAIL.charge_patientids
  is '�ֹܲ���Id(�ҵĴ�λ��ʾ�����в��� �ã��ָ�)';

prompt
prompt Creating table WII_SCHEDULING_DETAIL_CHANGE
prompt ===========================================
prompt
create table WII_SCHEDULING_DETAIL_CHANGE
(
  scheduling_detail_change_no NUMBER(11),
  main_id                     NUMBER(11),
  create_date                 VARCHAR2(8),
  user_id                     VARCHAR2(20),
  schedule_no                 NUMBER(6),
  beds                        VARCHAR2(200),
  create_time                 DATE default sysdate,
  creator                     NVARCHAR2(20),
  modifier                    NVARCHAR2(20),
  modify_time                 DATE,
  unique_id                   VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_SCHEDULING_DETAIL_CHANGE.scheduling_detail_change_no
  is '������ID';
comment on column WII_SCHEDULING_DETAIL_CHANGE.main_id
  is '����id';
comment on column WII_SCHEDULING_DETAIL_CHANGE.create_date
  is '��������yyyyMMdd';
comment on column WII_SCHEDULING_DETAIL_CHANGE.user_id
  is '����';
comment on column WII_SCHEDULING_DETAIL_CHANGE.schedule_no
  is '��κ�';
comment on column WII_SCHEDULING_DETAIL_CHANGE.beds
  is '����id������ԷֺŸ���';
comment on column WII_SCHEDULING_DETAIL_CHANGE.create_time
  is '����ʱ��';
comment on column WII_SCHEDULING_DETAIL_CHANGE.creator
  is '������';
comment on column WII_SCHEDULING_DETAIL_CHANGE.modifier
  is '�޸���';
comment on column WII_SCHEDULING_DETAIL_CHANGE.modify_time
  is '�޸�ʱ��';
comment on column WII_SCHEDULING_DETAIL_CHANGE.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_SCHEDULING_EMPLOYEE
prompt ======================================
prompt
create table WII_SCHEDULING_EMPLOYEE
(
  user_id             VARCHAR2(20),
  job                 VARCHAR2(50),
  group_no            NUMBER(6),
  is_director         NUMBER(1),
  teacher             VARCHAR2(30),
  isschedule          NUMBER(1),
  noschedulereason    NVARCHAR2(100),
  qualification_level NUMBER(2),
  operate_list        VARCHAR2(100),
  create_time         DATE default sysdate,
  creator             NVARCHAR2(20),
  modifier            NVARCHAR2(20),
  modify_time         DATE,
  dept_code           VARCHAR2(20),
  job_code            VARCHAR2(50),
  title               VARCHAR2(20),
  grade               VARCHAR2(20),
  sex                 VARCHAR2(2),
  entry_date          DATE,
  exp_date            DATE,
  unique_id           VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_SCHEDULING_EMPLOYEE.user_id
  is '���ţ�ÿ���û�����һ��Ψһ��ʶ��';
comment on column WII_SCHEDULING_EMPLOYEE.job
  is '��λ(�ֵ�)';
comment on column WII_SCHEDULING_EMPLOYEE.group_no
  is '����';
comment on column WII_SCHEDULING_EMPLOYEE.is_director
  is '�Ƿ��鳤';
comment on column WII_SCHEDULING_EMPLOYEE.teacher
  is '������ʦ';
comment on column WII_SCHEDULING_EMPLOYEE.isschedule
  is '�Ƿ��Űࣨ����Ҫ�����⽨��';
comment on column WII_SCHEDULING_EMPLOYEE.noschedulereason
  is '���Ű�ԭ��';
comment on column WII_SCHEDULING_EMPLOYEE.qualification_level
  is '���ʵȼ�';
comment on column WII_SCHEDULING_EMPLOYEE.operate_list
  is '�ٴ�������Ŀ¼';
comment on column WII_SCHEDULING_EMPLOYEE.create_time
  is '����ʱ��';
comment on column WII_SCHEDULING_EMPLOYEE.creator
  is '������';
comment on column WII_SCHEDULING_EMPLOYEE.modifier
  is '�޸���';
comment on column WII_SCHEDULING_EMPLOYEE.modify_time
  is '�޸�ʱ��';
comment on column WII_SCHEDULING_EMPLOYEE.dept_code
  is '�û����ڿ��ҵĴ���';
comment on column WII_SCHEDULING_EMPLOYEE.job_code
  is '���磺ҽ������ʿ�ȵ�';
comment on column WII_SCHEDULING_EMPLOYEE.title
  is 'ְ�ƣ��������Ρ������Ρ�סԺ�ܵ�����ְλ��';
comment on column WII_SCHEDULING_EMPLOYEE.grade
  is 'ְ�� ��������ڡ�����ҽ��������ҽ����סԺҽ���ȣ�';
comment on column WII_SCHEDULING_EMPLOYEE.sex
  is '�Ա�';
comment on column WII_SCHEDULING_EMPLOYEE.entry_date
  is '��ְʱ��';
comment on column WII_SCHEDULING_EMPLOYEE.exp_date
  is '��Ч��';
comment on column WII_SCHEDULING_EMPLOYEE.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_SCHEDULING_EMPLOYEE_CHANGE
prompt =============================================
prompt
create table WII_SCHEDULING_EMPLOYEE_CHANGE
(
  scheduling_e_change_no NUMBER(11),
  user_id                VARCHAR2(20),
  job                    VARCHAR2(50),
  group_no               NUMBER(6),
  is_director            NUMBER(1),
  teacher                VARCHAR2(30),
  isschedule             NUMBER(1),
  noschedulereason       NVARCHAR2(100),
  qualification_level    NUMBER(2),
  operate_list           VARCHAR2(100),
  create_time            DATE default sysdate,
  creator                NVARCHAR2(20),
  modifier               NVARCHAR2(20),
  modify_time            DATE,
  dept_code              VARCHAR2(20),
  job_code               VARCHAR2(50),
  title                  VARCHAR2(20),
  grade                  VARCHAR2(20),
  sex                    VARCHAR2(2),
  entry_date             DATE,
  exp_date               DATE,
  unique_id              VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.scheduling_e_change_no
  is '��ˮ��';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.user_id
  is '���ţ�ÿ���û�����һ��Ψһ��ʶ��';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.job
  is '��λ(�ֵ�)';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.group_no
  is '����';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.is_director
  is '�Ƿ��鳤';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.teacher
  is '������ʦ';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.isschedule
  is '�Ƿ��Űࣨ����Ҫ�����⽨��';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.noschedulereason
  is '���Ű�ԭ��';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.qualification_level
  is '���ʵȼ�';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.operate_list
  is '�ٴ�������Ŀ¼';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.create_time
  is '����ʱ��';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.creator
  is '������';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.modifier
  is '�޸���';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.modify_time
  is '�޸�ʱ��';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.dept_code
  is '�û����ڿ��ҵĴ���';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.job_code
  is '���磺ҽ������ʿ�ȵ�';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.title
  is 'ְ�ƣ��������Ρ������Ρ�סԺ�ܵ�����ְλ��';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.grade
  is 'ְ�� ��������ڡ�����ҽ��������ҽ����סԺҽ���ȣ�';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.sex
  is '�Ա�';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.entry_date
  is '��ְʱ��';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.exp_date
  is '��Ч��';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_SCHEDULING_GROUP
prompt ===================================
prompt
create table WII_SCHEDULING_GROUP
(
  scheduling_group_no NUMBER(11),
  scheduling_type     NUMBER(2),
  group_name          VARCHAR2(40),
  ward_code           VARCHAR2(20),
  in_charges_nusing   NVARCHAR2(20),
  in_charges_doctor   NVARCHAR2(20),
  creator             VARCHAR2(20),
  create_time         DATE,
  modifier            VARCHAR2(20),
  modify_time         DATE,
  data_flag           NUMBER(1) default 0,
  unique_id           VARCHAR2(50) default sys_guid(),
  group_members       NVARCHAR2(1000)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_SCHEDULING_GROUP.scheduling_group_no
  is '�Ű�������
';
comment on column WII_SCHEDULING_GROUP.scheduling_type
  is '������ͣ�����OR����
';
comment on column WII_SCHEDULING_GROUP.group_name
  is '������
';
comment on column WII_SCHEDULING_GROUP.ward_code
  is '����ID
';
comment on column WII_SCHEDULING_GROUP.in_charges_nusing
  is '���ܻ�ʿ
';
comment on column WII_SCHEDULING_GROUP.in_charges_doctor
  is '����ҽ��
';
comment on column WII_SCHEDULING_GROUP.creator
  is '������
';
comment on column WII_SCHEDULING_GROUP.create_time
  is '����ʱ��
';
comment on column WII_SCHEDULING_GROUP.modifier
  is '�޸���
';
comment on column WII_SCHEDULING_GROUP.modify_time
  is '�޸�ʱ��
';
comment on column WII_SCHEDULING_GROUP.data_flag
  is '�Ƿ���Ч��ʶ
';
comment on column WII_SCHEDULING_GROUP.unique_id
  is '����ΨһID';
comment on column WII_SCHEDULING_GROUP.group_members
  is '��Ա';

prompt
prompt Creating table WII_SCHEDULING_GROUP_CHANGE
prompt ==========================================
prompt
create table WII_SCHEDULING_GROUP_CHANGE
(
  scheduling_group_change_no NUMBER(11),
  group_no                   NUMBER(11),
  scheduling_type            NUMBER(2),
  group_name                 VARCHAR2(40),
  ward_code                  VARCHAR2(20),
  in_charges_nusing          NVARCHAR2(20),
  in_charges_doctor          NVARCHAR2(20),
  creator                    VARCHAR2(20),
  create_time                DATE,
  modifier                   VARCHAR2(20),
  modify_time                DATE,
  unique_id                  VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_SCHEDULING_GROUP_CHANGE.scheduling_group_change_no
  is '������ID';
comment on column WII_SCHEDULING_GROUP_CHANGE.group_no
  is '����';
comment on column WII_SCHEDULING_GROUP_CHANGE.scheduling_type
  is '�Ű�����';
comment on column WII_SCHEDULING_GROUP_CHANGE.group_name
  is '������';
comment on column WII_SCHEDULING_GROUP_CHANGE.ward_code
  is '����';
comment on column WII_SCHEDULING_GROUP_CHANGE.in_charges_nusing
  is '����ʿ';
comment on column WII_SCHEDULING_GROUP_CHANGE.in_charges_doctor
  is '����ҽ��';
comment on column WII_SCHEDULING_GROUP_CHANGE.creator
  is '������ ';
comment on column WII_SCHEDULING_GROUP_CHANGE.create_time
  is '����ʱ��';
comment on column WII_SCHEDULING_GROUP_CHANGE.modifier
  is '�޸���';
comment on column WII_SCHEDULING_GROUP_CHANGE.modify_time
  is '�޸�ʱ��';
comment on column WII_SCHEDULING_GROUP_CHANGE.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_SCHEDULING_MAIN
prompt ==================================
prompt
create table WII_SCHEDULING_MAIN
(
  scheduling_main_no NUMBER(11),
  schedule_time      DATE,
  ward_code          VARCHAR2(20),
  operator           NVARCHAR2(30),
  operate_time       DATE,
  create_time        DATE default sysdate,
  creator            NVARCHAR2(20),
  modifier           NVARCHAR2(20),
  modify_time        DATE,
  unique_id          VARCHAR2(50) default sys_guid(),
  schedule_no        NVARCHAR2(10),
  nurses             NVARCHAR2(1000)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_SCHEDULING_MAIN.scheduling_main_no
  is '��ˮ��';
comment on column WII_SCHEDULING_MAIN.schedule_time
  is '�Ű�ʱ��';
comment on column WII_SCHEDULING_MAIN.ward_code
  is '����';
comment on column WII_SCHEDULING_MAIN.operator
  is '������';
comment on column WII_SCHEDULING_MAIN.operate_time
  is '����ʱ��';
comment on column WII_SCHEDULING_MAIN.create_time
  is '����ʱ��';
comment on column WII_SCHEDULING_MAIN.creator
  is '������ ';
comment on column WII_SCHEDULING_MAIN.unique_id
  is '����ΨһID';
comment on column WII_SCHEDULING_MAIN.schedule_no
  is '��α��';
comment on column WII_SCHEDULING_MAIN.nurses
  is '�Ű໤ʿ ����,�ָ���';

prompt
prompt Creating table WII_SCORE_DIC
prompt ============================
prompt
create table WII_SCORE_DIC
(
  score_code            VARCHAR2(200),
  score_name_c          VARCHAR2(50),
  score_name_full       NVARCHAR2(100),
  score_user            VARCHAR2(50),
  score_orgfunc_catname NVARCHAR2(20),
  score_orgfunc_catcode VARCHAR2(20),
  score_seq             NUMBER(8),
  score_html            VARCHAR2(50),
  valid                 VARCHAR2(20),
  score_memo            VARCHAR2(100),
  isconfig              VARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_SCORE_DIC.score_code
  is '������Ŀ����';
comment on column WII_SCORE_DIC.score_name_c
  is '������Ŀ��������';
comment on column WII_SCORE_DIC.score_name_full
  is '������Ŀ����ȫ��';
comment on column WII_SCORE_DIC.score_user
  is '������Ŀʹ�������N-�����ࡢD-ҽ���ࣩ';
comment on column WII_SCORE_DIC.score_orgfunc_catname
  is '�����������ٹ������۵��������';
comment on column WII_SCORE_DIC.score_orgfunc_catcode
  is '�����������ٹ������۵������루1-Σ�ض��࣬2-Ƥ��ѹ���࣬3-���ࡢ4-��ʹ�ࡢ5-�˶������ࡢ6-DVT�����ࣻ11-��ϵͳ�ࡢ12-����ϵͳ�ࡢ13-ѭ��ϵͳ�ࡢ14-����ϵͳ�ࡢ15-����ϵͳ�ࡢ16-�෢�����ࣻ)';
comment on column WII_SCORE_DIC.score_seq
  is '����';
comment on column WII_SCORE_DIC.score_html
  is 'ҳ��';
comment on column WII_SCORE_DIC.valid
  is '��Ч�ԣ�0-��Ч��1-��Ч��';
comment on column WII_SCORE_DIC.score_memo
  is '��ע';
comment on column WII_SCORE_DIC.isconfig
  is '�Ƿ�����(0�� 1��)';

prompt
prompt Creating table WII_SCORE_GRADE_DIC
prompt ==================================
prompt
create table WII_SCORE_GRADE_DIC
(
  score_code         VARCHAR2(50),
  grade_code         VARCHAR2(50),
  grade_name         NVARCHAR2(50),
  grade_range        VARCHAR2(100),
  grade_color        VARCHAR2(30),
  grade_range_config VARCHAR2(100)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_SCORE_GRADE_DIC.score_code
  is '������Ŀ����';
comment on column WII_SCORE_GRADE_DIC.grade_code
  is '�ȼ�����';
comment on column WII_SCORE_GRADE_DIC.grade_name
  is '�ȼ�����';
comment on column WII_SCORE_GRADE_DIC.grade_range
  is '�ȼ���Χ';
comment on column WII_SCORE_GRADE_DIC.grade_color
  is '�ȼ���ɫ';
comment on column WII_SCORE_GRADE_DIC.grade_range_config
  is '�ȼ���Χ����';

prompt
prompt Creating table WII_SIGNS_DIC
prompt ============================
prompt
create table WII_SIGNS_DIC
(
  signs_code          VARCHAR2(40) not null,
  signs_name_c        NVARCHAR2(40),
  signs_name_e        VARCHAR2(40),
  item_name_alias     VARCHAR2(8),
  acquire_method      NUMBER(1),
  value_type          NUMBER(1),
  signs_unit          VARCHAR2(8),
  draw_icon           VARCHAR2(2),
  dis_color           NUMBER(8),
  draw_style          NUMBER(1),
  in_or_out           NUMBER(1),
  signs_type          VARCHAR2(20),
  priority_indi       NUMBER(1),
  memo                NVARCHAR2(50),
  input_code          VARCHAR2(50),
  batch_input         NUMBER(1),
  value_range         NVARCHAR2(50),
  can_sametime_insert NUMBER(1),
  general_type        VARCHAR2(100)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_SIGNS_DIC.signs_code
  is '������������';
comment on column WII_SIGNS_DIC.signs_name_c
  is '����������������';
comment on column WII_SIGNS_DIC.signs_name_e
  is '������������Ӣ����д';
comment on column WII_SIGNS_DIC.item_name_alias
  is '������������';
comment on column WII_SIGNS_DIC.acquire_method
  is '��ⷽ����0-�Զ��ɼ���1-�ֹ����롢2-�Զ����ֹ����ɡ�3-ϵͳ�Զ����㣩';
comment on column WII_SIGNS_DIC.value_type
  is 'ֵ���� ��0������  2��������';
comment on column WII_SIGNS_DIC.signs_unit
  is '�����������ʱ�׼��λ';
comment on column WII_SIGNS_DIC.draw_icon
  is '��ʾͼ��';
comment on column WII_SIGNS_DIC.dis_color
  is '��ʾ��ɫ';
comment on column WII_SIGNS_DIC.draw_style
  is '��ʾ�����0-ɢ�㡢1-�������ߡ�2-�������ߡ�3-����ͼ��4-��ֵ�������ȣ�';
comment on column WII_SIGNS_DIC.in_or_out
  is '�����־  (0-������1-����)';
comment on column WII_SIGNS_DIC.signs_type
  is '��������(����������͹�������ÿһ������ı�ע����)';
comment on column WII_SIGNS_DIC.priority_indi
  is '���ȱ�־����ʾ����';
comment on column WII_SIGNS_DIC.memo
  is '��ע';
comment on column WII_SIGNS_DIC.input_code
  is '��������ĸ(������룩';
comment on column WII_SIGNS_DIC.batch_input
  is '�Ƿ�����¼����Ŀ';
comment on column WII_SIGNS_DIC.value_range
  is '����ֵֵ��Χ�趨';
comment on column WII_SIGNS_DIC.can_sametime_insert
  is '�Ƿ�ͬһʱ���ܹ����벻ֵͬ';
comment on column WII_SIGNS_DIC.general_type
  is '����������������Code������ö��ŷָ���';
alter table WII_SIGNS_DIC
  add constraint PK_SIGNS primary key (SIGNS_CODE)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WII_SIGNS_MAPPING
prompt ================================
prompt
create table WII_SIGNS_MAPPING
(
  signs_code           VARCHAR2(50) not null,
  acquire_item_code    VARCHAR2(50) not null,
  acquire_item_name    NVARCHAR2(200),
  creator              NVARCHAR2(20),
  create_time          DATE default sysdate,
  modifier             NVARCHAR2(20),
  modify_time          DATE,
  unique_id            VARCHAR2(50) default sys_guid() not null,
  acquire_value_format NVARCHAR2(20)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_SIGNS_MAPPING.signs_code
  is 'ϵͳ��������';
comment on column WII_SIGNS_MAPPING.acquire_item_code
  is '�豸�ɼ����������';
comment on column WII_SIGNS_MAPPING.acquire_item_name
  is '�豸�ɼ�����������';
comment on column WII_SIGNS_MAPPING.unique_id
  is '����ΨһID';
comment on column WII_SIGNS_MAPPING.acquire_value_format
  is '�ɼ�������ֵ��ʽ';
alter table WII_SIGNS_MAPPING
  add constraint PK_SIGNS_MAPPING primary key (ACQUIRE_ITEM_CODE)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WII_SPECIAL_COMMON
prompt =================================
prompt
create table WII_SPECIAL_COMMON
(
  special_code VARCHAR2(20),
  creator      NVARCHAR2(20),
  create_time  DATE default sysdate,
  memo         VARCHAR2(50),
  type         VARCHAR2(50),
  item_code    VARCHAR2(50),
  seq_no       NUMBER(12)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_SPECIAL_COMMON
  is 'ר��ͨ�����ñ�';
comment on column WII_SPECIAL_COMMON.special_code
  is '���ұ���';
comment on column WII_SPECIAL_COMMON.creator
  is '������';
comment on column WII_SPECIAL_COMMON.create_time
  is '����ʱ��';
comment on column WII_SPECIAL_COMMON.memo
  is '��ע';
comment on column WII_SPECIAL_COMMON.type
  is '����';
comment on column WII_SPECIAL_COMMON.item_code
  is '��Ŀ����';
comment on column WII_SPECIAL_COMMON.seq_no
  is '����';

prompt
prompt Creating table WII_SPECIAL_CONFIG
prompt =================================
prompt
create table WII_SPECIAL_CONFIG
(
  special_code   VARCHAR2(30) not null,
  special_name   VARCHAR2(30),
  org_code       VARCHAR2(500),
  org_name       NVARCHAR2(500),
  authority_name NVARCHAR2(2000),
  creator        NVARCHAR2(20),
  create_time    DATE default sysdate,
  modifier       NVARCHAR2(20),
  modify_time    DATE,
  unique_id      VARCHAR2(50) default sys_guid(),
  authority_id   CLOB
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_SPECIAL_CONFIG.special_code
  is 'ר�Ʊ���';
comment on column WII_SPECIAL_CONFIG.special_name
  is 'ר������';
comment on column WII_SPECIAL_CONFIG.org_code
  is '��֯����';
comment on column WII_SPECIAL_CONFIG.org_name
  is '��֯����';
comment on column WII_SPECIAL_CONFIG.authority_name
  is '��Դ����';
comment on column WII_SPECIAL_CONFIG.creator
  is '������';
comment on column WII_SPECIAL_CONFIG.create_time
  is '����ʱ��';
comment on column WII_SPECIAL_CONFIG.unique_id
  is '����ΨһID';
alter table WII_SPECIAL_CONFIG
  add primary key (SPECIAL_CODE)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WII_SPECIAL_DICTIONARY
prompt =====================================
prompt
create table WII_SPECIAL_DICTIONARY
(
  ward_code         VARCHAR2(20),
  dic_code          VARCHAR2(50),
  creator           NVARCHAR2(20),
  create_time       DATE default sysdate,
  memo              VARCHAR2(50),
  type              VARCHAR2(50),
  item_code         VARCHAR2(50),
  seq_no            NUMBER(12),
  authority_id      VARCHAR2(50),
  system_module     VARCHAR2(50),
  item_display_name VARCHAR2(100)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 192K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_SPECIAL_DICTIONARY.ward_code
  is '���ұ���';
comment on column WII_SPECIAL_DICTIONARY.dic_code
  is '�ֵ����';
comment on column WII_SPECIAL_DICTIONARY.creator
  is '������';
comment on column WII_SPECIAL_DICTIONARY.create_time
  is '����ʱ��';
comment on column WII_SPECIAL_DICTIONARY.memo
  is '��ע';
comment on column WII_SPECIAL_DICTIONARY.type
  is '����';
comment on column WII_SPECIAL_DICTIONARY.item_code
  is '��Ŀ����';
comment on column WII_SPECIAL_DICTIONARY.seq_no
  is '����';
comment on column WII_SPECIAL_DICTIONARY.authority_id
  is '��Ȩ��ԴID';
comment on column WII_SPECIAL_DICTIONARY.system_module
  is 'ϵͳģ��';
comment on column WII_SPECIAL_DICTIONARY.item_display_name
  is '��Ŀ��ʾ����';

prompt
prompt Creating table WII_SYSTEM_CONFIG
prompt ================================
prompt
create table WII_SYSTEM_CONFIG
(
  name       VARCHAR2(50),
  type       NUMBER(1),
  path       VARCHAR2(200),
  parentname VARCHAR2(50),
  flag       VARCHAR2(50),
  code       VARCHAR2(50),
  value      CLOB,
  describe   VARCHAR2(200),
  moudle     VARCHAR2(50)
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_SYSTEM_CONFIG.name
  is '����';
comment on column WII_SYSTEM_CONFIG.type
  is '����(0 ϵͳ����  1 ����ϵͳ����)';
comment on column WII_SYSTEM_CONFIG.path
  is '·��';
comment on column WII_SYSTEM_CONFIG.parentname
  is '��������';
comment on column WII_SYSTEM_CONFIG.flag
  is '�Ƿ����(0 ������ 1����)';
comment on column WII_SYSTEM_CONFIG.code
  is 'Keyֵ';
comment on column WII_SYSTEM_CONFIG.value
  is '����';
comment on column WII_SYSTEM_CONFIG.describe
  is '����';
comment on column WII_SYSTEM_CONFIG.moudle
  is 'ģ��';

prompt
prompt Creating table WII_SYS_USERS
prompt ============================
prompt
create table WII_SYS_USERS
(
  user_id        VARCHAR2(36),
  user_name      NVARCHAR2(36),
  employee_id    VARCHAR2(36),
  login_name     VARCHAR2(36),
  login_pwd      VARCHAR2(36),
  user_type      VARCHAR2(10),
  status         VARCHAR2(1),
  memo           NVARCHAR2(100),
  org_code       VARCHAR2(4000),
  last_logintime DATE,
  create_time    DATE default sysdate,
  creator        NVARCHAR2(20),
  photo          VARCHAR2(100),
  modifier       NVARCHAR2(20),
  modify_time    DATE,
  unique_id      VARCHAR2(50) default sys_guid(),
  signature_pic  CLOB
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_SYS_USERS.user_id
  is '�û�ID';
comment on column WII_SYS_USERS.user_name
  is '�û�����';
comment on column WII_SYS_USERS.employee_id
  is '��ԱID';
comment on column WII_SYS_USERS.login_name
  is '��¼����';
comment on column WII_SYS_USERS.login_pwd
  is '��¼����';
comment on column WII_SYS_USERS.user_type
  is '�û����ͣ���Ժ����Ժ��';
comment on column WII_SYS_USERS.status
  is '����״̬��0��ͣ��
1�����ã�';
comment on column WII_SYS_USERS.memo
  is '��ע';
comment on column WII_SYS_USERS.org_code
  is '��֯����';
comment on column WII_SYS_USERS.last_logintime
  is '�ϴε�¼ʱ��';
comment on column WII_SYS_USERS.create_time
  is '����ʱ��';
comment on column WII_SYS_USERS.creator
  is '������';
comment on column WII_SYS_USERS.photo
  is 'ͷ��';
comment on column WII_SYS_USERS.unique_id
  is '����ΨһID';
comment on column WII_SYS_USERS.signature_pic
  is 'ǩ��ͼƬ';

prompt
prompt Creating table WII_SYS_USERS_BAK
prompt ================================
prompt
create table WII_SYS_USERS_BAK
(
  user_id        VARCHAR2(36) not null,
  user_name      NVARCHAR2(36),
  employee_id    VARCHAR2(36),
  login_name     VARCHAR2(36) not null,
  login_pwd      VARCHAR2(36) not null,
  user_type      VARCHAR2(1),
  status         VARCHAR2(1) not null,
  memo           NVARCHAR2(100),
  org_code       VARCHAR2(4000),
  last_logintime DATE,
  create_time    DATE,
  creator        NVARCHAR2(20),
  photo          VARCHAR2(100),
  modifier       NVARCHAR2(20),
  modify_time    DATE
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table WII_SYS_WIICARECS
prompt ================================
prompt
create table WII_SYS_WIICARECS
(
  user_id        VARCHAR2(36),
  user_name      NVARCHAR2(36),
  employee_id    VARCHAR2(36),
  login_name     VARCHAR2(36),
  login_pwd      VARCHAR2(36),
  user_type      VARCHAR2(10),
  status         VARCHAR2(1),
  memo           NVARCHAR2(100),
  org_code       VARCHAR2(4000),
  last_logintime DATE,
  create_time    DATE default sysdate,
  creator        NVARCHAR2(20),
  photo          VARCHAR2(100),
  modifier       NVARCHAR2(20),
  modify_time    DATE,
  unique_id      VARCHAR2(50) default sys_guid(),
  signature_pic  CLOB
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_SYS_WIICARECS.user_id
  is '�û�ID';
comment on column WII_SYS_WIICARECS.user_name
  is '�û�����';
comment on column WII_SYS_WIICARECS.employee_id
  is '��ԱID';
comment on column WII_SYS_WIICARECS.login_name
  is '��¼����';
comment on column WII_SYS_WIICARECS.login_pwd
  is '��¼����';
comment on column WII_SYS_WIICARECS.user_type
  is '�û����ͣ���Ժ����Ժ��';
comment on column WII_SYS_WIICARECS.status
  is '����״̬��0��ͣ��
1�����ã�';
comment on column WII_SYS_WIICARECS.memo
  is '��ע';
comment on column WII_SYS_WIICARECS.org_code
  is '��֯����';
comment on column WII_SYS_WIICARECS.last_logintime
  is '�ϴε�¼ʱ��';
comment on column WII_SYS_WIICARECS.create_time
  is '����ʱ��';
comment on column WII_SYS_WIICARECS.creator
  is '������';
comment on column WII_SYS_WIICARECS.photo
  is 'ͷ��';
comment on column WII_SYS_WIICARECS.unique_id
  is '����ΨһID';
comment on column WII_SYS_WIICARECS.signature_pic
  is 'ǩ��ͼƬ';

prompt
prompt Creating table WII_TELE_HOSPITALDOCTORCONFIG
prompt ============================================
prompt
create table WII_TELE_HOSPITALDOCTORCONFIG
(
  id            VARCHAR2(50) not null,
  hospital_name VARCHAR2(100),
  doctor_name   VARCHAR2(36),
  create_time   DATE default sysdate,
  creator       VARCHAR2(20),
  modify_by     VARCHAR2(20),
  modify_time   DATE
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table WII_TELE_HOSPITALDOCTORCONFIG
  is '����ҽԺҽ�����ñ�';
comment on column WII_TELE_HOSPITALDOCTORCONFIG.id
  is '�޸�ʱ��';
comment on column WII_TELE_HOSPITALDOCTORCONFIG.hospital_name
  is 'ҽԺ����';
comment on column WII_TELE_HOSPITALDOCTORCONFIG.doctor_name
  is 'ҽ������';
comment on column WII_TELE_HOSPITALDOCTORCONFIG.create_time
  is '����ʱ��';
comment on column WII_TELE_HOSPITALDOCTORCONFIG.creator
  is '������';
comment on column WII_TELE_HOSPITALDOCTORCONFIG.modify_by
  is '�޸���';
comment on column WII_TELE_HOSPITALDOCTORCONFIG.modify_time
  is '�޸�ʱ��';
alter table WII_TELE_HOSPITALDOCTORCONFIG
  add primary key (ID)
  using index 
  tablespace WIICARE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WII_TREATMENT_PLAN
prompt =================================
prompt
create table WII_TREATMENT_PLAN
(
  patient_id        VARCHAR2(20),
  inpatient_visitid VARCHAR2(20),
  plan_time         DATE,
  content           NVARCHAR2(100),
  sequence          NUMBER(11),
  creator           NVARCHAR2(20),
  create_time       DATE default sysdate,
  modifier          NVARCHAR2(20),
  modify_time       DATE,
  unique_id         VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_TREATMENT_PLAN.patient_id
  is '����Ψһ��ʶ��';
comment on column WII_TREATMENT_PLAN.inpatient_visitid
  is 'סԺ��ţ���ʾÿ�λ���סԺ��Ψһ�ţ�����סԺ��+סԺ������';
comment on column WII_TREATMENT_PLAN.plan_time
  is '�ƻ�ʱ��';
comment on column WII_TREATMENT_PLAN.content
  is '����';
comment on column WII_TREATMENT_PLAN.sequence
  is '����';
comment on column WII_TREATMENT_PLAN.creator
  is '������';
comment on column WII_TREATMENT_PLAN.create_time
  is '����ʱ��';
comment on column WII_TREATMENT_PLAN.modifier
  is '�޸���';
comment on column WII_TREATMENT_PLAN.modify_time
  is '�޸�ʱ��';
comment on column WII_TREATMENT_PLAN.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_USERS_ROLES
prompt ==============================
prompt
create table WII_USERS_ROLES
(
  user_id     VARCHAR2(36),
  role_id     VARCHAR2(36),
  creator     NVARCHAR2(20),
  create_time DATE default sysdate,
  modifier    NVARCHAR2(20),
  modify_time DATE,
  unique_id   VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_USERS_ROLES.user_id
  is '�û�ID';
comment on column WII_USERS_ROLES.role_id
  is '��ɫID';
comment on column WII_USERS_ROLES.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_USER_PROFILEITEM
prompt ===================================
prompt
create table WII_USER_PROFILEITEM
(
  user_id      VARCHAR2(36),
  ward_code    VARCHAR2(20),
  module_code  VARCHAR2(40),
  item_code    VARCHAR2(40),
  item_value   VARCHAR2(200),
  item_content VARCHAR2(200),
  description  VARCHAR2(200),
  sort_no      NUMBER(2),
  creator      NVARCHAR2(20),
  create_time  DATE,
  modifier     NVARCHAR2(20),
  modify_time  DATE,
  unique_id    VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column WII_USER_PROFILEITEM.user_id
  is '�û�ID';
comment on column WII_USER_PROFILEITEM.ward_code
  is '���Ҵ���';
comment on column WII_USER_PROFILEITEM.module_code
  is 'ģ�����';
comment on column WII_USER_PROFILEITEM.item_code
  is '�����';
comment on column WII_USER_PROFILEITEM.item_value
  is '��ֵ';
comment on column WII_USER_PROFILEITEM.item_content
  is '������';
comment on column WII_USER_PROFILEITEM.description
  is '˵��';
comment on column WII_USER_PROFILEITEM.sort_no
  is '���к�';
comment on column WII_USER_PROFILEITEM.creator
  is '������';
comment on column WII_USER_PROFILEITEM.create_time
  is '����ʱ���';
comment on column WII_USER_PROFILEITEM.modify_time
  is '�޸�ʱ��';
comment on column WII_USER_PROFILEITEM.unique_id
  is '����ΨһID';

prompt
prompt Creating table WII_VS_HIS_ORDER_CLASS
prompt =====================================
prompt
create table WII_VS_HIS_ORDER_CLASS
(
  his_class_code VARCHAR2(16),
  his_class_name VARCHAR2(16),
  wii_class_code VARCHAR2(16),
  creator        NVARCHAR2(20),
  create_time    DATE default sysdate,
  modifier       NVARCHAR2(20),
  modify_time    DATE,
  unique_id      VARCHAR2(50) default sys_guid()
)
tablespace WIICARE
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column WII_VS_HIS_ORDER_CLASS.his_class_code
  is 'HISҽ�������';
comment on column WII_VS_HIS_ORDER_CLASS.his_class_name
  is 'HISҽ���������';
comment on column WII_VS_HIS_ORDER_CLASS.wii_class_code
  is 'ҽ�������';
comment on column WII_VS_HIS_ORDER_CLASS.unique_id
  is '����ΨһID';

prompt
prompt Creating sequence SCHEDULING_EMPLOYEE_SEQ
prompt =========================================
prompt
create sequence SCHEDULING_EMPLOYEE_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 2685
increment by 1
nocache;

prompt
prompt Creating sequence SEQ_AUTO_ID
prompt =============================
prompt
create sequence SEQ_AUTO_ID
minvalue 0
maxvalue 9999999999999999999999999999
start with 40
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_ASSESS_ID
prompt =============================
prompt
create sequence S_ASSESS_ID
minvalue 0
maxvalue 999999
start with 3369
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_BLOODSUGAR_ID
prompt =================================
prompt
create sequence S_BLOODSUGAR_ID
minvalue 0
maxvalue 999999
start with 4141
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_BRADEN_ID
prompt =============================
prompt
create sequence S_BRADEN_ID
minvalue 0
maxvalue 999999
start with 2087
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_CATHETER_ID
prompt ===============================
prompt
create sequence S_CATHETER_ID
minvalue 0
maxvalue 999999
start with 2477
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_CIRCUIT_ID
prompt ==============================
prompt
create sequence S_CIRCUIT_ID
minvalue 0
maxvalue 999999
start with 1
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_CONSULTATION_RRCORD_ID
prompt ==========================================
prompt
create sequence S_CONSULTATION_RRCORD_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 1373
increment by 1
cache 20;

prompt
prompt Creating sequence S_DOCUMENTMETHOD_CONFIG
prompt =========================================
prompt
create sequence S_DOCUMENTMETHOD_CONFIG
minvalue 0
maxvalue 999999
start with 1
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_DOCUMENTMRCOLS_CONFIG
prompt =========================================
prompt
create sequence S_DOCUMENTMRCOLS_CONFIG
minvalue 0
maxvalue 999999
start with 1
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_DOCUMENT_CHECK_NO
prompt =====================================
prompt
create sequence S_DOCUMENT_CHECK_NO
minvalue 0
maxvalue 999999
start with 640
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_DOCUMENT_EDUCATION_NO
prompt =========================================
prompt
create sequence S_DOCUMENT_EDUCATION_NO
minvalue 0
maxvalue 999999
start with 1337
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_DOCUMENT_EXCHANGE_NO
prompt ========================================
prompt
create sequence S_DOCUMENT_EXCHANGE_NO
minvalue 0
maxvalue 999999
start with 301
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_DOCUMENT_INFORM_NO
prompt ======================================
prompt
create sequence S_DOCUMENT_INFORM_NO
minvalue 0
maxvalue 999999
start with 280
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_EVLUATE_NO
prompt ==============================
prompt
create sequence S_EVLUATE_NO
minvalue 1
maxvalue 999999
start with 1
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_EXAM_GROUP_NO
prompt =================================
prompt
create sequence S_EXAM_GROUP_NO
minvalue 0
maxvalue 999999
start with 0
increment by 1
cache 20;

prompt
prompt Creating sequence S_HOSPITAL_CONFIG
prompt ===================================
prompt
create sequence S_HOSPITAL_CONFIG
minvalue 0
maxvalue 999999
start with 1
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_HUMAN_ADJUST_NO
prompt ===================================
prompt
create sequence S_HUMAN_ADJUST_NO
minvalue 0
maxvalue 999999
start with 721
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_NOTEPAD_NO
prompt ==============================
prompt
create sequence S_NOTEPAD_NO
minvalue 1
maxvalue 999999999999999999999999999
start with 2
increment by 1
nocache;

prompt
prompt Creating sequence S_NOTICE_NO
prompt =============================
prompt
create sequence S_NOTICE_NO
minvalue 0
maxvalue 999999
start with 1081
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_NURSING_PLAN_NO
prompt ===================================
prompt
create sequence S_NURSING_PLAN_NO
minvalue 1
maxvalue 99999999999
start with 137
increment by 1
nocache;

prompt
prompt Creating sequence S_NURSING_PLAN_TEMP_ITEM_NO
prompt =============================================
prompt
create sequence S_NURSING_PLAN_TEMP_ITEM_NO
minvalue 1
maxvalue 99999999999
start with 1
increment by 1
nocache;

prompt
prompt Creating sequence S_NURSING_PLAN_TEMP_NO
prompt ========================================
prompt
create sequence S_NURSING_PLAN_TEMP_NO
minvalue 1
maxvalue 99999999999
start with 1
increment by 1
nocache;

prompt
prompt Creating sequence S_OPERATOR_ID
prompt ===============================
prompt
create sequence S_OPERATOR_ID
minvalue 0
maxvalue 999999
start with 4786
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_ORDER_SUB_NO
prompt ================================
prompt
create sequence S_ORDER_SUB_NO
minvalue 0
maxvalue 999999
start with 1262
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_PATIENT_SPECIAL_REMINDER_ID
prompt ===============================================
prompt
create sequence S_PATIENT_SPECIAL_REMINDER_ID
minvalue 1
maxvalue 9999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence S_PERFDIC_NO
prompt ==============================
prompt
create sequence S_PERFDIC_NO
minvalue 1
maxvalue 999999
start with 3421
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_PERFSCORE_MAIN_NO
prompt =====================================
prompt
create sequence S_PERFSCORE_MAIN_NO
minvalue 1
maxvalue 999999
start with 221
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_PERFTITLE_DETAIL_NO
prompt =======================================
prompt
create sequence S_PERFTITLE_DETAIL_NO
minvalue 1
maxvalue 999999
start with 321
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_PERFTITLE_MAIN_NO
prompt =====================================
prompt
create sequence S_PERFTITLE_MAIN_NO
minvalue 1
maxvalue 999999
start with 261
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_PLAN_DIC_NO
prompt ===============================
prompt
create sequence S_PLAN_DIC_NO
minvalue 0
maxvalue 999999
start with 340
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_PLAN_EXEC_NO
prompt ================================
prompt
create sequence S_PLAN_EXEC_NO
minvalue 0
maxvalue 999999
start with 4566
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_PLAN_NO
prompt ===========================
prompt
create sequence S_PLAN_NO
minvalue 0
maxvalue 999999
start with 49017
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_QS_SCORE_NO
prompt ===============================
prompt
create sequence S_QS_SCORE_NO
minvalue 0
maxvalue 999999
start with 1160
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_QS_TEMPLATE_NO
prompt ==================================
prompt
create sequence S_QS_TEMPLATE_NO
minvalue 0
maxvalue 999999
start with 15641
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_QUALITY_ASSESSMENT_NO
prompt =========================================
prompt
create sequence S_QUALITY_ASSESSMENT_NO
minvalue 0
maxvalue 999999
start with 320
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_REMIND_PLAN_ID
prompt ==================================
prompt
create sequence S_REMIND_PLAN_ID
minvalue 1
maxvalue 999999
start with 681
increment by 1
cache 20;

prompt
prompt Creating sequence S_RESCUE_NO
prompt =============================
prompt
create sequence S_RESCUE_NO
minvalue 0
maxvalue 999999
start with 2962
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_SATISFACTION_NO
prompt ===================================
prompt
create sequence S_SATISFACTION_NO
minvalue 0
maxvalue 999999
start with 0
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_SCHEDULE_NO
prompt ===============================
prompt
create sequence S_SCHEDULE_NO
minvalue 0
maxvalue 999999
start with 62
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_SCHEDULING_DETAIL_CHANGE_NO
prompt ===============================================
prompt
create sequence S_SCHEDULING_DETAIL_CHANGE_NO
minvalue 0
maxvalue 999999
start with 0
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_SCHEDULING_E_CHANGE_NO
prompt ==========================================
prompt
create sequence S_SCHEDULING_E_CHANGE_NO
minvalue 0
maxvalue 999999
start with 740
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_SCHEDULING_GROUP_CHANGE_NO
prompt ==============================================
prompt
create sequence S_SCHEDULING_GROUP_CHANGE_NO
minvalue 0
maxvalue 999999
start with 40
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_SCHEDULING_GROUP_NO
prompt =======================================
prompt
create sequence S_SCHEDULING_GROUP_NO
minvalue 0
maxvalue 999999
start with 1780
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_SCHEDULING_MAIN_NO
prompt ======================================
prompt
create sequence S_SCHEDULING_MAIN_NO
minvalue 0
maxvalue 999999
start with 520
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_SERIAL_NUMBER
prompt =================================
prompt
create sequence S_SERIAL_NUMBER
minvalue 1
maxvalue 999999999999999999999999999
start with 10783
increment by 1
cache 10;

prompt
prompt Creating sequence S_SPECIAL_CONFIG
prompt ==================================
prompt
create sequence S_SPECIAL_CONFIG
minvalue 0
maxvalue 999999
start with 446
increment by 1
cache 20
order;

prompt
prompt Creating sequence S_WORKPLAN_NO
prompt ===============================
prompt
create sequence S_WORKPLAN_NO
minvalue 3333
maxvalue 999999
start with 3333
increment by 1
cache 20
order;

prompt
prompt Creating view A_REPORTVIEW
prompt ==========================
prompt
CREATE OR REPLACE FORCE VIEW A_REPORTVIEW AS
SELECT A_updates.Akey, A_updates.Asigned, A_updates.Adate, A_updates.Adecim, A_hundred.Aname, A_hundred.Acode, A_hundred.Aint FROM A_updates, A_hundred WHERE A_updates.Akey = A_hundred.Akey;

prompt
prompt Creating view MED_MONITOR_DICT
prompt ==============================
prompt
CREATE OR REPLACE FORCE VIEW MED_MONITOR_DICT AS
SELECT DEVICE_LABEL  AS MONITOR_LABEL, SUPPLIER  AS MANU_FIRM_NAME, MODEL, INTERFACE_TYPE, INTERFACE_DESC, IP_ADDR, MAC_ADDR, LAST_RECV_TIME, LAST_RECV_BED_ID, DUPLEX_FLAG, AUTOIN_FLAG, COMM_PORT, BAUD_RATE, BYTE_SIZE, PARITY, STOP_BITS, F_OUTX, F_INX, F_HARDWARE, TX_QUEUESIZE, RX_QUEUESIZE, XON_LIM, XOFF_LIM, XON_CHAR, XOFF_CHAR, ERROR_CHAR, EVENT_CHAR, DRIVER_PROG, PRIORITY, ITEM_TYPE, AUTO_LOAD, '' as START_DATE_TIME, 3600 as DEFAULT_RECV_FREQUENCY, 3600 as CURRENT_RECV_FREQUENCY, 0 as CURRENT_RECVTIMES_UPLIMIT, '' as CURRENT_RECV_ITEMS, '90104' as WARD_CODE, '2' as WARD_TYPE, '' as BED_NO, DEVICE_LABEL As patient_id, 1 as VISIT_ID, 1 as OPER_ID, DEVICE_STATUS  as USING_INDICATOR , FREQUENCY_DISPLAY, MEMO, DATALOG_START_TIME, 0 as PC_PORT, DATALOG_STATUS, 0 as IP_PORT, 0 as IN_PORT, OUT_PORT, '' as DATALOG_SERVERIP, 0 as DATALOG_PARA_PORT, 0 as DATALOG_WAVE_PORT, 0 as DATALOG_STATUS_PORT, '' as DATALOG_FILES FROM WII_DEVICE_MASTER;

prompt
prompt Creating view VIEW_PATIENT_INFO
prompt ===============================
prompt
CREATE OR REPLACE FORCE VIEW VIEW_PATIENT_INFO AS
SELECT "PATIENT_ID","VISIT_ID","DEP_ID","INPATIENT_VISITID","INWARD_VISITID","DIAGNOSE","WARD_CODE","BED_NO","DOCTOR_IN_CHARGE","NURSE_IN_CHARGE","PATIENT_NAME","PATIENT_GENDER","BIRTHDAY","BODY_WEIGHT","BODY_HEIGHT","HISTORY_SMOKING","HISTORY_DRINKING","HISTORY_FAMILY_DISEASE","ALERGY_DRUGS","NURSING_CLASS","PATIENT_CONDITION","SETTLED_INDICATOR","ABNORMAL","ANTIBIOTIC","SPECIAL_NOTE","INFORMED_CONSENT","DOCTOR_PATIENT_COM","COMMIT_STATUS","CREATOR","CREATE_TIME","MODIFY_BY","MODIFY_TIME","DOCTOR_NAME","NURSE_NAME","INWARD_STATUS","IN_TRANSFER_SEQUENCE_NO","IN_ICU_TIME","IN_ICU_OPERATOR","OUT_TRANSFER_SEQUENCE_NO","OUT_ICU_TIME","OUT_ICU_OPERATOR","FROM_WARD_CODE","TO_WARD_CODE","IS_MONITOR","BED_ID","DISEASE_DEVELOPMENT","ESTIMATED_WEIGHT","BODY_SURFACE_AREA","HISTORY_ALERGY","HISTORY_DISEASE","IS_REENTRY","REENTRY_REASON","IN_ICU_SOURCE","OUT_ICU_SITUATION" FROM WII_PATIENT_INWARD_ICU;

prompt
prompt Creating view V_INFUSION_PUMP
prompt =============================
prompt
create or replace force view v_infusion_pump as
select
(a.patient_id||a.order_no||a.order_sub_no||to_char(a.default_time,'yyyy-mm-dd,hh24:mi:ss') )as orderexecno,    --ҽ��ִ�б�ʶ
c.device_id,                 --��Һ���豸��
a.order_no,                   --ҽ����ţ���ʶһ��ʱΪ�����ҩ��
a.default_time,              --Ĭ��ִ��ʱ��
a.patient_id,                --����ID
b.bed_no,                    --����
b.patient_name,              --��������
d.pharmacy_code,             --ҩƷ���
d.pharmacy_chemname as pharmacy_name,                  --ҩƷ����
a.memo as remark             --��ע
from wii_orders_icu a
join wii_patient_inward_icu b on a.patient_id=b.patient_id
join wii_device_master c on a.patient_id=c.current_patient_id --and c.device_label='��Һ��'
join wii_pharm_pump_dic d on a.pham_std_code=d.pharmacy_code
;

prompt
prompt Creating type SPLIT_STR
prompt =======================
prompt
CREATE OR REPLACE TYPE split_str IS TABLE OF VARCHAR(100);
/

prompt
prompt Creating function FN_SPLIT
prompt ==========================
prompt
CREATE OR REPLACE FUNCTION fn_Split
(
    p_Str VARCHAR2,
    p_Delimiter VARCHAR2
)
RETURN split_str PIPELINED
AS
    v_Str VARCHAR(4000) := p_Str;
    v_Index NUMBER;
    v_SubLength NUMBER;
BEGIN
    -- p_Delimiter is null
    IF p_Delimiter IS NULL THEN
        FOR x IN 1..LENGTH(v_Str)
        LOOP
            PIPE ROW(SUBSTR(V_Str,x,1));
        END LOOP;
        RETURN;
    END IF;

    v_index := INSTR(v_Str,p_Delimiter);
    WHILE v_Index <> 0
    LOOP
        PIPE ROW(SUBSTR(v_Str,1,v_Index-1));
        v_SubLength := LENGTH(v_Str) - (v_index + LENGTH(p_Delimiter) - 1);
        v_Str := SUBSTR(v_Str,-v_SubLength,v_SubLength);
        v_index := INSTR(v_Str,p_Delimiter);
    END LOOP;
    PIPE ROW(v_Str);
    RETURN;
END;
/

prompt
prompt Creating function F_PINYIN
prompt ==========================
prompt
CREATE OR REPLACE FUNCTION F_PINYIN(P_NAME IN VARCHAR2) RETURN VARCHAR2 AS
     V_COMPARE VARCHAR2(100);
     V_RETURN VARCHAR2(4000);

     FUNCTION F_NLSSORT(P_WORD IN VARCHAR2) RETURN VARCHAR2 AS
     BEGIN
      RETURN NLSSORT(P_WORD, 'NLS_SORT=SCHINESE_PINYIN_M');
     END;
    BEGIN

    FOR I IN 1..NVL(LENGTH(P_NAME), 0) LOOP
     V_COMPARE := F_NLSSORT(SUBSTR(P_NAME, I, 1));
     IF V_COMPARE >= F_NLSSORT('߹') AND V_COMPARE <= F_NLSSORT('�') THEN
      V_RETURN := V_RETURN || 'A';
     ELSIF V_COMPARE >= F_NLSSORT('��') AND V_COMPARE <= F_NLSSORT('��') THEN
      V_RETURN := V_RETURN || 'B';
     ELSIF V_COMPARE >= F_NLSSORT('��') AND V_COMPARE <= F_NLSSORT('�e') THEN
      V_RETURN := V_RETURN || 'C';
     ELSIF V_COMPARE >= F_NLSSORT('��') AND V_COMPARE <= F_NLSSORT('�z') THEN
      V_RETURN := V_RETURN || 'D';
     ELSIF V_COMPARE >= F_NLSSORT('��') AND V_COMPARE <= F_NLSSORT('��') THEN
      V_RETURN := V_RETURN || 'E';
     ELSIF V_COMPARE >= F_NLSSORT('��') AND V_COMPARE <= F_NLSSORT('�g') THEN
      V_RETURN := V_RETURN || 'F';
     ELSIF V_COMPARE >= F_NLSSORT('�') AND V_COMPARE <= F_NLSSORT('�B') THEN
      V_RETURN := V_RETURN || 'G';
     ELSIF V_COMPARE >= F_NLSSORT('�o') AND V_COMPARE <= F_NLSSORT('��') THEN
      V_RETURN := V_RETURN || 'H';
     ELSIF V_COMPARE >= F_NLSSORT('آ') AND V_COMPARE <= F_NLSSORT('�h') THEN
      V_RETURN := V_RETURN || 'J';
     ELSIF V_COMPARE >= F_NLSSORT('��') AND V_COMPARE <= F_NLSSORT('�i') THEN
      V_RETURN := V_RETURN || 'K';
     ELSIF V_COMPARE >= F_NLSSORT('��') AND V_COMPARE <= F_NLSSORT('�^') THEN
      V_RETURN := V_RETURN || 'L';
     ELSIF V_COMPARE >= F_NLSSORT('�`') AND V_COMPARE <= F_NLSSORT('��') THEN
      V_RETURN := V_RETURN || 'M';
     ELSIF V_COMPARE >= F_NLSSORT('��') AND V_COMPARE <= F_NLSSORT('��') THEN
      V_RETURN := V_RETURN || 'N';
     ELSIF V_COMPARE >= F_NLSSORT('�p') AND V_COMPARE <= F_NLSSORT('�a') THEN
      V_RETURN := V_RETURN || 'O';
     ELSIF V_COMPARE >= F_NLSSORT('�r') AND V_COMPARE <= F_NLSSORT('��') THEN
      V_RETURN := V_RETURN || 'P';
     ELSIF V_COMPARE >= F_NLSSORT('��') AND V_COMPARE <= F_NLSSORT('�d') THEN
      V_RETURN := V_RETURN || 'Q';
     ELSIF V_COMPARE >= F_NLSSORT('��') AND V_COMPARE <= F_NLSSORT('�U') THEN
      V_RETURN := V_RETURN || 'R';
     ELSIF V_COMPARE >= F_NLSSORT('��') AND V_COMPARE <= F_NLSSORT('�R') THEN
      V_RETURN := V_RETURN || 'S';
     ELSIF V_COMPARE >= F_NLSSORT('�@') AND V_COMPARE <= F_NLSSORT('�X') THEN
      V_RETURN := V_RETURN || 'T';
     ELSIF V_COMPARE >= F_NLSSORT('��') AND V_COMPARE <= F_NLSSORT('�F') THEN
      V_RETURN := V_RETURN || 'W';
     ELSIF V_COMPARE >= F_NLSSORT('Ϧ') AND V_COMPARE <= F_NLSSORT('�R') THEN
      V_RETURN := V_RETURN || 'X';
     ELSIF V_COMPARE >= F_NLSSORT('Ѿ') AND V_COMPARE <= F_NLSSORT('�') THEN
      V_RETURN := V_RETURN || 'Y';
     ELSIF V_COMPARE >= F_NLSSORT('��') AND V_COMPARE <= F_NLSSORT('��') THEN
      V_RETURN := V_RETURN || 'Z';
     ELSE
      V_RETURN := V_RETURN || SUBSTR(P_NAME, I, 1);
     END IF;
    END LOOP;
    RETURN V_RETURN;
   END;
/

prompt
prompt Creating function ISNUMERIC
prompt ===========================
prompt
CREATE OR REPLACE FUNCTION isnumeric(str IN VARCHAR2)
    RETURN NUMBER
IS
    v_str FLOAT;
BEGIN
    IF str IS NULL
    THEN
       RETURN 0;
    ELSE
       BEGIN
          SELECT TO_NUMBER (str)
            INTO v_str
            FROM DUAL;
       EXCEPTION
          WHEN INVALID_NUMBER
          THEN
             RETURN 0;
       END;
       RETURN 1;
    END IF;
END isnumeric;
/

prompt
prompt Creating procedure QUERYEMPINFO
prompt ===============================
prompt
create or replace procedure queryEmpInfo(eno in varchar2,pname out varchar2)
as
begin
  select patient_id into pname from wii_patient_inward_icu where patient_id=eno;
end;
/


prompt Done
spool off
set define on
