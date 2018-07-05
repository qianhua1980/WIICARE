prompt PL/SQL Developer Export User Objects for user WIICAREKH@192.168.0.70:1521/WIICARE
prompt Created by qianhua on 2018年6月28日
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
  is '监测项编号';
comment on column CDSS_ACTIONITEMMONITORTEMPLETE.actionids
  is '被使用的活动编号';
comment on column CDSS_ACTIONITEMMONITORTEMPLETE.monitortype
  is '监测类型';
comment on column CDSS_ACTIONITEMMONITORTEMPLETE.monitorname
  is '监测显示名称';
comment on column CDSS_ACTIONITEMMONITORTEMPLETE.itemcode
  is '对应编号';
comment on column CDSS_ACTIONITEMMONITORTEMPLETE.monitortimelimit
  is '监测项时间界限（小时），执行时间限定';
comment on column CDSS_ACTIONITEMMONITORTEMPLETE.monitortimerange
  is '监测项时间范围（小时），监测项值限定';
comment on column CDSS_ACTIONITEMMONITORTEMPLETE.checkmethod
  is '系统展现和判定方式';

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
  is 'Bundle_处理参数表';
comment on column CDSS_ACTION_PARAMS.id
  is '主键唯一值';
comment on column CDSS_ACTION_PARAMS.patient_id
  is '患者编号';
comment on column CDSS_ACTION_PARAMS.caseno
  is 'bundle类型';
comment on column CDSS_ACTION_PARAMS.params_name
  is '参数名';
comment on column CDSS_ACTION_PARAMS.params_value
  is '参数值';
comment on column CDSS_ACTION_PARAMS.creator
  is '创建人';
comment on column CDSS_ACTION_PARAMS.create_time
  is '创建时间';
comment on column CDSS_ACTION_PARAMS.modifier
  is '修正人';
comment on column CDSS_ACTION_PARAMS.modify_time
  is '修正时间';
comment on column CDSS_ACTION_PARAMS.gentime
  is '生成时间';
comment on column CDSS_ACTION_PARAMS.ishasexcute
  is '是否已弹出过';
comment on column CDSS_ACTION_PARAMS.params_code
  is '参数编号';
comment on column CDSS_ACTION_PARAMS.ruleid
  is '规则编号';
comment on column CDSS_ACTION_PARAMS.actionid
  is 'bundle事件活动编号';
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
  is '血糖监测_规则表';
comment on column CDSS_BLOODSUGAR_SUGGESTION.id
  is '主键唯一值';
comment on column CDSS_BLOODSUGAR_SUGGESTION.suggestion_type
  is '方案类型';
comment on column CDSS_BLOODSUGAR_SUGGESTION.suggestion_code
  is '方案编号';
comment on column CDSS_BLOODSUGAR_SUGGESTION.rule_expression
  is '规则表达式';
comment on column CDSS_BLOODSUGAR_SUGGESTION.sugar_min
  is '方案血糖值下限';
comment on column CDSS_BLOODSUGAR_SUGGESTION.sugar_max
  is '方案血糖值上限';
comment on column CDSS_BLOODSUGAR_SUGGESTION.soultion_desc
  is '方案中文描述';
comment on column CDSS_BLOODSUGAR_SUGGESTION.soultion_dose
  is '执行剂量';
comment on column CDSS_BLOODSUGAR_SUGGESTION.creator
  is '创建人';
comment on column CDSS_BLOODSUGAR_SUGGESTION.create_time
  is '创建时间';
comment on column CDSS_BLOODSUGAR_SUGGESTION.modifier
  is '修正人';
comment on column CDSS_BLOODSUGAR_SUGGESTION.modify_time
  is '修正时间';
comment on column CDSS_BLOODSUGAR_SUGGESTION.description
  is '规则描述';

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
  is '血糖监测_复测时间表';
comment on column CDSS_BLOODSUGAR_TIME_GAP.id
  is '主键唯一值';
comment on column CDSS_BLOODSUGAR_TIME_GAP.rule_type
  is '规则类型';
comment on column CDSS_BLOODSUGAR_TIME_GAP.sugar_min
  is '方案血糖值下限';
comment on column CDSS_BLOODSUGAR_TIME_GAP.sugar_max
  is '方案血糖值上限';
comment on column CDSS_BLOODSUGAR_TIME_GAP.description
  is '特殊规则中文描述';
comment on column CDSS_BLOODSUGAR_TIME_GAP.rule_expression
  is '特殊规则表达式';
comment on column CDSS_BLOODSUGAR_TIME_GAP.retest_time_gap
  is '复测间隔时间';
comment on column CDSS_BLOODSUGAR_TIME_GAP.retest_time_gap_sepcial
  is '特殊规则下的复测间隔时间';
comment on column CDSS_BLOODSUGAR_TIME_GAP.creator
  is '创建人';
comment on column CDSS_BLOODSUGAR_TIME_GAP.create_time
  is '创建时间';
comment on column CDSS_BLOODSUGAR_TIME_GAP.modifier
  is '修改人';
comment on column CDSS_BLOODSUGAR_TIME_GAP.modify_time
  is '修改时间';
comment on column CDSS_BLOODSUGAR_TIME_GAP.gap_code
  is '复测规则编号';

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
  is '同步编号';
comment on column CDSS_DATASYNC.sync_name
  is '同步名称';
comment on column CDSS_DATASYNC.sync_method_name
  is '同步对应方法';
comment on column CDSS_DATASYNC.sync_content
  is '同步内容说明';
comment on column CDSS_DATASYNC.sync_frequnce
  is '同步频率（秒）';
comment on column CDSS_DATASYNC.enable
  is '是否可用（0 不可用 1可用）';
comment on column CDSS_DATASYNC.sync_lasttime
  is '最后同步时间';

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
  is '事件实例计划日历';
comment on column CDSS_EVENTCALENDAR.event_id
  is '事件实例编号';
comment on column CDSS_EVENTCALENDAR.caseno
  is 'BUNDLE实例编号';
comment on column CDSS_EVENTCALENDAR.patient_id
  is '患者编号';
comment on column CDSS_EVENTCALENDAR.actionid
  is '实例活动编号';
comment on column CDSS_EVENTCALENDAR.event_code
  is '事件项目编号
';
comment on column CDSS_EVENTCALENDAR.event_type
  is '事件项目类型';
comment on column CDSS_EVENTCALENDAR.event_name
  is '事件项目名称';
comment on column CDSS_EVENTCALENDAR.time_point
  is '提醒时间点，1点，2点，3点.....';
comment on column CDSS_EVENTCALENDAR.start_time
  is '开始时间';
comment on column CDSS_EVENTCALENDAR.end_time
  is '结束时间';
comment on column CDSS_EVENTCALENDAR.item_code
  is '对应监测项编号';
comment on column CDSS_EVENTCALENDAR.repeat_type
  is '重复类型';
comment on column CDSS_EVENTCALENDAR.repeat_content
  is '重复内容';

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
  is '事件项目字典';
comment on column CDSS_EVENTITEMS.event_code
  is '事件编码';
comment on column CDSS_EVENTITEMS.event_type
  is '事件类型（护理、评估、预防）';
comment on column CDSS_EVENTITEMS.event_name
  is '时间名称';
comment on column CDSS_EVENTITEMS.item_code
  is '对应监控项目编号';
comment on column CDSS_EVENTITEMS.repeat_type
  is '重复类型（1：按循环规则，2：按照日期）';
comment on column CDSS_EVENTITEMS.repeat_content
  is '重复内容';
comment on column CDSS_EVENTITEMS.time_point
  is '一天提醒开始时间点';

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
  is 'bundle类型编号';
comment on column CDSS_MONITORCASETEMPLETE.casetypename
  is 'bundle类型名称';
comment on column CDSS_MONITORCASETEMPLETE.monitorcaseconfig
  is '监控项目配置';
comment on column CDSS_MONITORCASETEMPLETE.startactivityid
  is '开始活动编号';
comment on column CDSS_MONITORCASETEMPLETE.periodtime
  is '监控项显示间隔';
comment on column CDSS_MONITORCASETEMPLETE.periodcount
  is '监控项显示个数';
comment on column CDSS_MONITORCASETEMPLETE.timeout
  is '过期时间';
comment on column CDSS_MONITORCASETEMPLETE.version
  is 'bundle版本';
comment on column CDSS_MONITORCASETEMPLETE.filtercondition
  is '过滤监控患者范围（空则表示全部，填充where的条件语句）';
comment on column CDSS_MONITORCASETEMPLETE.viewcolor
  is '颜色标识';
comment on column CDSS_MONITORCASETEMPLETE.ismanual
  is '是否可手工启动';

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
  is '监测内容，Json表示具体对应内容';

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
  is '原始数据JSON';

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
  is 'Bundle_处理记录表';
comment on column CDSS_MONITOR_REMIND.id
  is '主键唯一值';
comment on column CDSS_MONITOR_REMIND.patient_id
  is '患者编号';
comment on column CDSS_MONITOR_REMIND.caseno
  is 'bundle类型';
comment on column CDSS_MONITOR_REMIND.actionid
  is '事件编号';
comment on column CDSS_MONITOR_REMIND.excute_time
  is '处理时间';
comment on column CDSS_MONITOR_REMIND.is_nurse_excute
  is '护士是否已执行';
comment on column CDSS_MONITOR_REMIND.is_call_doctor
  is '是否已通知医生';
comment on column CDSS_MONITOR_REMIND.creator
  is '创建人';
comment on column CDSS_MONITOR_REMIND.create_time
  is '创建时间';
comment on column CDSS_MONITOR_REMIND.modifier
  is '修正人';
comment on column CDSS_MONITOR_REMIND.modify_time
  is '修正时间';
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
  is '取值标准：AVG平均，MAX取最大值，MIN取最小值，SUM（3）取当前时间点到之前3小时内的合计值';
comment on column CDSS_RULEKEYITEMS.itemchooserange
  is '取开始FIRST、结束LAST、全部时间段ALL|取时间段长度|剔除最高或最低|剔除的记录数';
comment on column CDSS_RULEKEYITEMS.includekeywords
  is '包含的关键字';

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
  is '规则ID';
comment on column CDSS_RULETEMPLETE.rulename
  is '规则名称';
comment on column CDSS_RULETEMPLETE.triggerfactor
  is '触发因素内容';
comment on column CDSS_RULETEMPLETE.condition
  is '触发公式';
comment on column CDSS_RULETEMPLETE.validhours
  is '有效因子时间，当前时间往前小时数';

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
  姓名        VARCHAR2(255),
  工号        VARCHAR2(255),
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
  is '抗菌药品中文名称';
comment on column WII_ANTIBIOTIC_DIC.pharmacy_code
  is 'HIS药品编码';
comment on column WII_ANTIBIOTIC_DIC.pharmacy_chemname
  is 'HIS药品化学名称';
comment on column WII_ANTIBIOTIC_DIC.unit
  is '单位';
comment on column WII_ANTIBIOTIC_DIC.pack_quan
  is '包装规格剂量';
comment on column WII_ANTIBIOTIC_DIC.pharmacy_form
  is '剂型（溶液）';
comment on column WII_ANTIBIOTIC_DIC.dose_per_unit
  is '单剂量';
comment on column WII_ANTIBIOTIC_DIC.dose_units
  is '剂量单位';
comment on column WII_ANTIBIOTIC_DIC.ddd_value
  is 'ddd值';
comment on column WII_ANTIBIOTIC_DIC.ddd_unit
  is 'ddd单位';
comment on column WII_ANTIBIOTIC_DIC.input_code
  is '输入首字母(快捷输入）';
comment on column WII_ANTIBIOTIC_DIC.memo
  is '备注';
comment on column WII_ANTIBIOTIC_DIC.valid
  is '有效性（0-无效，1-有效）';

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
  is '版本号';
comment on column WII_APKVERSION.versionname
  is '版本名称';
comment on column WII_APKVERSION.packagename
  is '包名';
comment on column WII_APKVERSION.sdkversion
  is '支持的SDK版本';
comment on column WII_APKVERSION.targetsdkversion
  is '建议的SDK版本';
comment on column WII_APKVERSION.applicationlabel
  is '应用程序名';
comment on column WII_APKVERSION.applicationicon
  is '程序的图标';
comment on column WII_APKVERSION.launchableactivity
  is '启动界面';
comment on column WII_APKVERSION.updatedon
  is '更新时间';
comment on column WII_APKVERSION.updatedby
  is '更新人';
comment on column WII_APKVERSION.fileaddress
  is '文件地址';

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
  is '科研归档权限ID';
comment on column WII_ARCHIVES_PERMISSION.archives_id
  is '科研项目ID';
comment on column WII_ARCHIVES_PERMISSION.permission_type
  is '0-全部控制；1-只读；2-可编辑';
comment on column WII_ARCHIVES_PERMISSION.creator
  is '创建人';
comment on column WII_ARCHIVES_PERMISSION.create_time
  is '创建时间';
comment on column WII_ARCHIVES_PERMISSION.modifier
  is '修改人';
comment on column WII_ARCHIVES_PERMISSION.modify_time
  is '修改时间';
comment on column WII_ARCHIVES_PERMISSION.user_id
  is '用户ID';

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
  is '软件版本号';
comment on column WII_AUTHORITY.authority_id
  is '授权资源ID';
comment on column WII_AUTHORITY.domain_id
  is '域ID';
comment on column WII_AUTHORITY.name
  is '名称';
comment on column WII_AUTHORITY.authority_url
  is 'URL';
comment on column WII_AUTHORITY.status
  is '启用状态（0：停用
1：在用）';
comment on column WII_AUTHORITY.parent_authority_id
  is '父资源节点';
comment on column WII_AUTHORITY.description
  is '描述';
comment on column WII_AUTHORITY.authority_type
  is '权限资源类别(0:系统 1:模块 2:菜单 3页面菜单 4角色按钮功能   5:专科按钮 6 导航快捷栏 7 评估单模块 10:前端路由 50 后台接口)';
comment on column WII_AUTHORITY.sequence
  is '排序';
comment on column WII_AUTHORITY.pigeonhole_module
  is '归档模块';
comment on column WII_AUTHORITY.icon_name
  is '图标名称';
comment on column WII_AUTHORITY.abbreviation
  is '简称';
comment on column WII_AUTHORITY.unique_id
  is '物理唯一ID';
comment on column WII_AUTHORITY.child_is_config
  is '是否配置子项';

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
  is '病原菌字典表';
comment on column WII_BACTERIA_DIC.bacteria_code
  is '病原菌Code';
comment on column WII_BACTERIA_DIC.bacteria_name_c
  is '病原菌名称';
comment on column WII_BACTERIA_DIC.bacteria_class_name
  is '病原菌分类名称';
comment on column WII_BACTERIA_DIC.input_code
  is '输入首字母(快捷输入）';
comment on column WII_BACTERIA_DIC.memo
  is '备注（特点描述）';
comment on column WII_BACTERIA_DIC.valid
  is '有效性（0-无效，1-有效）';
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
  is '不良事件记录表';
comment on column WII_BAD_EVENT.inpatient_visitid
  is '患者入院号
';
comment on column WII_BAD_EVENT.time_point
  is '发生时间
';
comment on column WII_BAD_EVENT.level_code
  is '不良事件级别
';
comment on column WII_BAD_EVENT.event_code
  is '事件名称编码';
comment on column WII_BAD_EVENT.part_code
  is '发生环节/部位
';
comment on column WII_BAD_EVENT.report_time
  is '上报时间
';
comment on column WII_BAD_EVENT.reporter
  is '上报人
';
comment on column WII_BAD_EVENT.verify_first_time
  is '第一审核时间
';
comment on column WII_BAD_EVENT.verify_first_analysis
  is '第一审核原因分析';
comment on column WII_BAD_EVENT.verify_first_by
  is '第一审核人
';
comment on column WII_BAD_EVENT.verify_second_time
  is '第二审核时间
';
comment on column WII_BAD_EVENT.verify_second_memo
  is '第二审核意见
';
comment on column WII_BAD_EVENT.verify_second_by
  is '第二审核人
';
comment on column WII_BAD_EVENT.verify_third_time
  is '第三审核时间
';
comment on column WII_BAD_EVENT.verify_third_memo
  is '第三审核意见';
comment on column WII_BAD_EVENT.verify_third_by
  is '第三审核人
';
comment on column WII_BAD_EVENT.memo
  is '事件经过/后果/影响/处理
';
comment on column WII_BAD_EVENT.creator
  is '创建人
';
comment on column WII_BAD_EVENT.create_time
  is '创建时间
';
comment on column WII_BAD_EVENT.modifier
  is '修改人
';
comment on column WII_BAD_EVENT.modify_time
  is '修改时间
';
comment on column WII_BAD_EVENT.verify_first_measures
  is '第一审核改进措施';
comment on column WII_BAD_EVENT.unique_id
  is '物理唯一ID';

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
  is '基础护理';
comment on column WII_BASE_NURSING.patient_id
  is '病人（编号）唯一标识';
comment on column WII_BASE_NURSING.time_point
  is '基础护理时间点 ';
comment on column WII_BASE_NURSING.nursing_type
  is '记录类别（护理措施，出院小结，病情，医嘱等－－可以与模版关联）';
comment on column WII_BASE_NURSING.nursing_item
  is '护理细项';
comment on column WII_BASE_NURSING.operator
  is '操作者';
comment on column WII_BASE_NURSING.operate_time
  is '操作时间';
comment on column WII_BASE_NURSING.creator
  is '创建人 ';
comment on column WII_BASE_NURSING.create_time
  is '创建时间';
comment on column WII_BASE_NURSING.modifier
  is '修改人 ';
comment on column WII_BASE_NURSING.modify_time
  is '修改时间';
comment on column WII_BASE_NURSING.unique_id
  is '物理唯一ID';
comment on column WII_BASE_NURSING.foreign_key
  is '外键索引';

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
  is '床头卡标识字典表';
comment on column WII_BEDSIDECARDSIGNS_DIC.signs_type
  is '标识类型';
comment on column WII_BEDSIDECARDSIGNS_DIC.signs_id
  is '标识ID';
comment on column WII_BEDSIDECARDSIGNS_DIC.signs_type_code
  is '标识类型CODE';
comment on column WII_BEDSIDECARDSIGNS_DIC.signs_code
  is '标识CODE';
comment on column WII_BEDSIDECARDSIGNS_DIC.signs_name
  is '标识名称';
comment on column WII_BEDSIDECARDSIGNS_DIC.signs_viewname
  is '标识VIEW名称';
comment on column WII_BEDSIDECARDSIGNS_DIC.signs_icon
  is '标识图标';
comment on column WII_BEDSIDECARDSIGNS_DIC.signs_view_color
  is '标识图标展示颜色';
comment on column WII_BEDSIDECARDSIGNS_DIC.signs_is_default
  is '标识是否为组默认值';
comment on column WII_BEDSIDECARDSIGNS_DIC.signs_type_name
  is '标识类型名称';
comment on column WII_BEDSIDECARDSIGNS_DIC.signs_memo
  is '标识备注';
comment on column WII_BEDSIDECARDSIGNS_DIC.signs_sequence
  is '页面排序';

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
  is '压疮部位类别代码';
comment on column WII_BEDSORE_PART_DIC.bedsore_part_name
  is '压疮部位类别名称';
comment on column WII_BEDSORE_PART_DIC.input_code
  is '输入码';
comment on column WII_BEDSORE_PART_DIC.memo
  is '备注';

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
  is '床位分组，主要用于区分护理组和医生组。例如第一护理小组管1-6号床。';
comment on column WII_BED_GROUP_MASTER.bed_id
  is '床位ID号';
comment on column WII_BED_GROUP_MASTER.unique_id
  is '物理唯一ID';

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
  is '床位ID号－一个床位应该有唯一的ID号，就算是病区和床号换了，这个也不应该变';
comment on column WII_BED_MASTER.ward_code
  is '病区代码';
comment on column WII_BED_MASTER.bed_no
  is '床号';
comment on column WII_BED_MASTER.bed_label
  is '床标号 (加床，显示名称字段）';
comment on column WII_BED_MASTER.room_no
  is '房间号';
comment on column WII_BED_MASTER.bed_approved_type
  is '床位编制类型
1:在编 2:加床 3:童床 0:非编';
comment on column WII_BED_MASTER.bed_sex_type
  is '床位类型
1- 男床 2 -女床 3 -不限';
comment on column WII_BED_MASTER.bed_class
  is '床位等级
表示床位的收费等级';
comment on column WII_BED_MASTER.bed_status
  is '床位状态
0 -未占用 1 -已占用 9 -未展开';
comment on column WII_BED_MASTER.icu_indicator
  is 'ICU标志';
comment on column WII_BED_MASTER.seq_no
  is '排序';
comment on column WII_BED_MASTER.unique_id
  is '物理唯一ID';
comment on column WII_BED_MASTER.bed_level
  is '床位级别 0：重症，1：普通';

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
  is '床位ID号－一个床位应该有唯一的ID号，就算是病区和床号换了，这个也不应该变';
comment on column WII_BED_MASTER_BAK1.ward_code
  is '病区代码';
comment on column WII_BED_MASTER_BAK1.bed_no
  is '床号';
comment on column WII_BED_MASTER_BAK1.bed_label
  is '床标号 (加床，显示名称字段）';
comment on column WII_BED_MASTER_BAK1.room_no
  is '房间号';
comment on column WII_BED_MASTER_BAK1.bed_approved_type
  is '床位编制类型
1:在编 2:加床 3:童床 0:非编';
comment on column WII_BED_MASTER_BAK1.bed_sex_type
  is '床位类型
1- 男床 2 -女床 3 -不限';
comment on column WII_BED_MASTER_BAK1.bed_class
  is '床位等级
表示床位的收费等级';
comment on column WII_BED_MASTER_BAK1.bed_status
  is '床位状态
0 -未占用 1 -已占用 9 -未展开';
comment on column WII_BED_MASTER_BAK1.icu_indicator
  is 'ICU标志';
comment on column WII_BED_MASTER_BAK1.seq_no
  is '排序';
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
  is '流水号';
comment on column WII_BLOODSUGAR.patient_id
  is '患者编号';
comment on column WII_BLOODSUGAR.bloodsugar_value
  is '血糖值';
comment on column WII_BLOODSUGAR.insulin_mainline
  is '胰岛素静推量';
comment on column WII_BLOODSUGAR.insulin_pump
  is '胰岛素泵入量';
comment on column WII_BLOODSUGAR.report_time
  is '上报时间';
comment on column WII_BLOODSUGAR.nurse_id
  is '上报护士ID';
comment on column WII_BLOODSUGAR.doctor_id
  is '医生ID';
comment on column WII_BLOODSUGAR.creator
  is '创建人';
comment on column WII_BLOODSUGAR.create_time
  is '创建时间';
comment on column WII_BLOODSUGAR.modifier
  is '修正人';
comment on column WII_BLOODSUGAR.modify_time
  is '修正时间';
comment on column WII_BLOODSUGAR.insulin_subcutaneous
  is '胰岛素皮下注射量';
comment on column WII_BLOODSUGAR.memo
  is '备注';
comment on column WII_BLOODSUGAR.insulin_pharm_code
  is '广谱抗生素药品编码';
comment on column WII_BLOODSUGAR.unique_id
  is '物理唯一ID';
comment on column WII_BLOODSUGAR.bloodsugar_part
  is '血标本';
comment on column WII_BLOODSUGAR.monitor_time_type
  is '监测时间点类型';

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
  is '物理唯一id';

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
  is '压疮分级';
comment on column WII_BRADEN_GRADE_DIC.frequency
  is '推荐频率';

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
  is '压疮编号';
comment on column WII_BRADEN_MASTER.braden_parts
  is '部位名称';
comment on column WII_BRADEN_MASTER.braden_grade
  is '压疮分级';
comment on column WII_BRADEN_MASTER.frequency
  is '推荐频率';
comment on column WII_BRADEN_MASTER.wound_area
  is '创面大小';
comment on column WII_BRADEN_MASTER.braden_date
  is '压疮发生日期';
comment on column WII_BRADEN_MASTER.heal_date
  is '压疮愈合日期';
comment on column WII_BRADEN_MASTER.nurse_id
  is '上报护士ID';
comment on column WII_BRADEN_MASTER.nurse_name
  is '上报护士';
comment on column WII_BRADEN_MASTER.verify_id
  is '审核人ID';
comment on column WII_BRADEN_MASTER.verify_name
  is '审核人';
comment on column WII_BRADEN_MASTER.creator
  is '创建人';
comment on column WII_BRADEN_MASTER.create_time
  is '创建时间';
comment on column WII_BRADEN_MASTER.modifier
  is '修正人';
comment on column WII_BRADEN_MASTER.modify_time
  is '修正时间';
comment on column WII_BRADEN_MASTER.patient_id
  is '患者编号';
comment on column WII_BRADEN_MASTER.bedsore_source
  is '压疮来源';
comment on column WII_BRADEN_MASTER.instrumental
  is '是否器械性';
comment on column WII_BRADEN_MASTER.unique_id
  is '物理唯一ID';
comment on column WII_BRADEN_MASTER.instrumental_name
  is '机械名';
comment on column WII_BRADEN_MASTER.braden_comment
  is '压疮备注';
comment on column WII_BRADEN_MASTER.braden_comment_display
  is '压疮备注是否要显示在文书中 0-不显示 1-显示';
comment on column WII_BRADEN_MASTER.color
  is '创面颜色';
comment on column WII_BRADEN_MASTER.exudate
  is '是否有渗出液';
comment on column WII_BRADEN_MASTER.smell
  is '是否有气味';

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
  is '评估ID';
comment on column WII_CATHETER_ASSESS.catheter_id
  is '置管ID';
comment on column WII_CATHETER_ASSESS.through
  is '导管是否通畅';
comment on column WII_CATHETER_ASSESS.infection
  is '感染情况（是、否、疑似）';
comment on column WII_CATHETER_ASSESS.infectious_agents
  is '感染体';
comment on column WII_CATHETER_ASSESS.means_normal
  is '输液/测压装置正常（三通、肝素帽、输液器、测压器）';
comment on column WII_CATHETER_ASSESS.skin_condition
  is '皮肤状况（红、肿、硬结、浓点）';
comment on column WII_CATHETER_ASSESS.special_drug
  is '特殊药液（脂肪乳、血制品、刺激药物）';
comment on column WII_CATHETER_ASSESS.sursing
  is '穿刺点护理（贴膜、换药、刺激药物）';
comment on column WII_CATHETER_ASSESS.assessor
  is '评估人';
comment on column WII_CATHETER_ASSESS.assess_time
  is '评估时间';
comment on column WII_CATHETER_ASSESS.creator
  is '创建人';
comment on column WII_CATHETER_ASSESS.create_time
  is '创建时间';
comment on column WII_CATHETER_ASSESS.modifier
  is '修正人';
comment on column WII_CATHETER_ASSESS.modify_time
  is '修正时间';
comment on column WII_CATHETER_ASSESS.fluid_color
  is '引流液颜色';
comment on column WII_CATHETER_ASSESS.fluid_property
  is '引流液性质';
comment on column WII_CATHETER_ASSESS.fluid_amount
  is '引流液量';
comment on column WII_CATHETER_ASSESS.unique_id
  is '物理唯一ID';
comment on column WII_CATHETER_ASSESS.in_position
  is '导管是否在位';
comment on column WII_CATHETER_ASSESS.dressing
  is '敷料';
comment on column WII_CATHETER_ASSESS.circumference
  is '上臂围/大腿围';
comment on column WII_CATHETER_ASSESS.nursing_memo
  is '处理措施';
comment on column WII_CATHETER_ASSESS.fluid_speed
  is '引流液流速';
comment on column WII_CATHETER_ASSESS.fluid_amount_in
  is '冲洗液入量';
comment on column WII_CATHETER_ASSESS.fluid_amount_out
  is '冲洗液出量';
comment on column WII_CATHETER_ASSESS.output
  is '出量【不计出入量】';
comment on column WII_CATHETER_ASSESS.fluid_amount_str
  is '引流液量 特护单区分空和0用';
comment on column WII_CATHETER_ASSESS.fluid_name
  is '冲洗液名称';
comment on column WII_CATHETER_ASSESS.fluid_administration
  is '冲洗液途径';
comment on column WII_CATHETER_ASSESS.fluid_amount_in_str
  is '冲洗液入量（用于区分空和0）';
comment on column WII_CATHETER_ASSESS.fluid_amount_out_str
  is '冲洗液出量（用于区分空和0）';

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
  is '导管ID';
comment on column WII_CATHETER_DIC.catheter_name
  is '导管名称';
comment on column WII_CATHETER_DIC.catheter_type
  is '导管类别名称 (气管内导管/尿管类/血管内导管/胃肠内导管/引流管导管)';
comment on column WII_CATHETER_DIC.catheter_type_code
  is '导管类别代码(Ⅰ/Ⅱ/Ⅲ/IV/V)';
comment on column WII_CATHETER_DIC.sign_code
  is '检测参数代码（对应的SIGN中的CODE，主要针对引流管－引流管的对照）';
comment on column WII_CATHETER_DIC.input_code
  is '输入码';
comment on column WII_CATHETER_DIC.memo
  is '备注';
comment on column WII_CATHETER_DIC.catheter_position
  is '导管部位(/为自定义)';
comment on column WII_CATHETER_DIC.custom_flag
  is '自定义导管标识(0否1是)';
comment on column WII_CATHETER_DIC.view_code
  is '显示编号';
comment on column WII_CATHETER_DIC.view_name
  is '显示名称';
comment on column WII_CATHETER_DIC.parent_cat_id
  is '父导管id';
comment on column WII_CATHETER_DIC.cat_level
  is '导管级别 0-父导管；1-子导管';
comment on column WII_CATHETER_DIC.severity_degree
  is '导管危重程度 HighRisk;MiddleRisk;LowRisk';
comment on column WII_CATHETER_DIC.view_name_doc
  is '特护单显示导管名称';
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
  is '导管操作事件表';
comment on column WII_CATHETER_EVENT.catheter_id
  is '置管ID';
comment on column WII_CATHETER_EVENT.event_id
  is '事件ID';
comment on column WII_CATHETER_EVENT.event_type
  is '事件类型';
comment on column WII_CATHETER_EVENT.operator
  is '操作人';
comment on column WII_CATHETER_EVENT.operate_time
  is '操作时间';
comment on column WII_CATHETER_EVENT.creator
  is '创建人';
comment on column WII_CATHETER_EVENT.create_time
  is '创建时间';
comment on column WII_CATHETER_EVENT.modifier
  is '修正人';
comment on column WII_CATHETER_EVENT.modify_time
  is '修正时间';
comment on column WII_CATHETER_EVENT.unique_id
  is '物理唯一ID';
comment on column WII_CATHETER_EVENT.event_type_mark
  is '事件类型编码';
comment on column WII_CATHETER_EVENT.event_memo
  is '事件备注';
comment on column WII_CATHETER_EVENT.event_type_name
  is '置管事件名称';

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
  is '导管事件明细表';
comment on column WII_CATHETER_EVENT_DETAIL.catheter_id
  is '置管ID';
comment on column WII_CATHETER_EVENT_DETAIL.event_id
  is '事件ID';
comment on column WII_CATHETER_EVENT_DETAIL.property_code
  is '属性编码';
comment on column WII_CATHETER_EVENT_DETAIL.property_name
  is '属性名称';
comment on column WII_CATHETER_EVENT_DETAIL.property_value
  is '属性值';
comment on column WII_CATHETER_EVENT_DETAIL.property_unit
  is '属性单位';
comment on column WII_CATHETER_EVENT_DETAIL.property_sequence
  is '属性页面排序';
comment on column WII_CATHETER_EVENT_DETAIL.creator
  is '创建人';
comment on column WII_CATHETER_EVENT_DETAIL.create_time
  is '创建时间';
comment on column WII_CATHETER_EVENT_DETAIL.modifier
  is '修正人';
comment on column WII_CATHETER_EVENT_DETAIL.modify_time
  is '修正时间';
comment on column WII_CATHETER_EVENT_DETAIL.operator
  is '记录人';
comment on column WII_CATHETER_EVENT_DETAIL.operate_time
  is '记录时间';
comment on column WII_CATHETER_EVENT_DETAIL.memo
  is '备注（目前用作多部位评估）';

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
  is '导管事件编码';
comment on column WII_CATHETER_EVENT_DIC.ce_name
  is '导管事件名称';
comment on column WII_CATHETER_EVENT_DIC.input_code
  is '输入码';
comment on column WII_CATHETER_EVENT_DIC.memo
  is '备注';

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
  is '置管ID';
comment on column WII_CATHETER_MASTER.patient_id
  is '病人唯一标识';
comment on column WII_CATHETER_MASTER.ward_code
  is '置管科室';
comment on column WII_CATHETER_MASTER.cat_id
  is '导管ID';
comment on column WII_CATHETER_MASTER.cat_source
  is '导管来源（本科室、外科室）';
comment on column WII_CATHETER_MASTER.cat_mark
  is '置管标记（首次、再次、非计划性）';
comment on column WII_CATHETER_MASTER.cat_length_type
  is '置管长度类型';
comment on column WII_CATHETER_MASTER.cat_length
  is '置管长度';
comment on column WII_CATHETER_MASTER.cat_length_unit
  is '置管长度单位';
comment on column WII_CATHETER_MASTER.cat_remark
  is '备注';
comment on column WII_CATHETER_MASTER.cat_insert_orerator
  is '置管人';
comment on column WII_CATHETER_MASTER.cat_insert_time
  is '置管时间';
comment on column WII_CATHETER_MASTER.cat_pull_operator
  is '拔管人';
comment on column WII_CATHETER_MASTER.cat_pull_time
  is '拔管时间';
comment on column WII_CATHETER_MASTER.creator
  is '创建人';
comment on column WII_CATHETER_MASTER.create_time
  is '创建时间';
comment on column WII_CATHETER_MASTER.modifier
  is '修正人';
comment on column WII_CATHETER_MASTER.modify_time
  is '修正时间';
comment on column WII_CATHETER_MASTER.cat_spec
  is '导管型号';
comment on column WII_CATHETER_MASTER.catheter_no
  is '同时置管编号';
comment on column WII_CATHETER_MASTER.cat_position
  is '导管部位';
comment on column WII_CATHETER_MASTER.cat_mark_type
  is '计划性/非计划性
';
comment on column WII_CATHETER_MASTER.unplanned_reason
  is '非计划性原因';
comment on column WII_CATHETER_MASTER.unique_id
  is '物理唯一ID';
comment on column WII_CATHETER_MASTER.cat_connection_device
  is '导管连接装置';
comment on column WII_CATHETER_MASTER.cat_model
  is '导管类型';
comment on column WII_CATHETER_MASTER.cat_in_position
  is '穿刺部位';
comment on column WII_CATHETER_MASTER.cat_stop_position
  is '头端位置';
comment on column WII_CATHETER_MASTER.extend_property
  is '扩展属性';
comment on column WII_CATHETER_MASTER.cat_check_time
  is '导管核对时间';
comment on column WII_CATHETER_MASTER.cat_check_operator
  is '核对人';
comment on column WII_CATHETER_MASTER.need_clean
  is '是否需要清洗导管';

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
  is '操作ID';
comment on column WII_CATHETER_OPERATE.catheter_id
  is '置管ID';
comment on column WII_CATHETER_OPERATE.operator_type
  is '操作类型（调整、拔管、更换）';
comment on column WII_CATHETER_OPERATE.cat_length_type
  is '置管长度类型';
comment on column WII_CATHETER_OPERATE.cat_length
  is '置管长度';
comment on column WII_CATHETER_OPERATE.cat_length_unit
  is '置管长度单位';
comment on column WII_CATHETER_OPERATE.operator_reason
  is '操作原因';
comment on column WII_CATHETER_OPERATE.operator
  is '操作人';
comment on column WII_CATHETER_OPERATE.operate_time
  is '操作时间';
comment on column WII_CATHETER_OPERATE.creator
  is '创建人';
comment on column WII_CATHETER_OPERATE.create_time
  is '创建时间';
comment on column WII_CATHETER_OPERATE.modifier
  is '修正人';
comment on column WII_CATHETER_OPERATE.modify_time
  is '修正时间';
comment on column WII_CATHETER_OPERATE.cat_mark
  is '置管标记（计划性、非计划性）';
comment on column WII_CATHETER_OPERATE.unique_id
  is '物理唯一ID';
comment on column WII_CATHETER_OPERATE.operate_content
  is '操作内容';

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
  is '导管ID';
comment on column WII_CATHETER_POSITION.catheter_position
  is '导管部位';
comment on column WII_CATHETER_POSITION.unique_id
  is '物理唯一ID';

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
  is '配置ID';
comment on column WII_CATHETER_PROPERTY_CONFIG.catheter_type_code
  is '导管类型';
comment on column WII_CATHETER_PROPERTY_CONFIG.catheter_id
  is '导管ID
';
comment on column WII_CATHETER_PROPERTY_CONFIG.special_code
  is '专科CODE
';
comment on column WII_CATHETER_PROPERTY_CONFIG.property_code
  is '属性CODE
';
comment on column WII_CATHETER_PROPERTY_CONFIG.property_name
  is '属性名称
';
comment on column WII_CATHETER_PROPERTY_CONFIG.value_type
  is '属性值类型 0数字；1文本；2Radiobutton单选；3下拉框 单选;4 多选';
comment on column WII_CATHETER_PROPERTY_CONFIG.value_range
  is '值域
';
comment on column WII_CATHETER_PROPERTY_CONFIG.property_unit
  is '单位';
comment on column WII_CATHETER_PROPERTY_CONFIG.memo
  is '备注';
comment on column WII_CATHETER_PROPERTY_CONFIG.create_time
  is '创建时间';
comment on column WII_CATHETER_PROPERTY_CONFIG.creator
  is '创建人';
comment on column WII_CATHETER_PROPERTY_CONFIG.modify_time
  is '修改时间';
comment on column WII_CATHETER_PROPERTY_CONFIG.modifier
  is '修改人';
comment on column WII_CATHETER_PROPERTY_CONFIG.unique_id
  is '物理唯一id';
comment on column WII_CATHETER_PROPERTY_CONFIG.is_visible
  is '是否可见';
comment on column WII_CATHETER_PROPERTY_CONFIG.property_catagory
  is '属性类别 0-新置 1-操作 2-评估';
comment on column WII_CATHETER_PROPERTY_CONFIG.property_sequence
  is '页面排序';

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
  is '导管属性字典表';
comment on column WII_CATHETER_PROPERTY_DIC.property_code
  is '属性编码';
comment on column WII_CATHETER_PROPERTY_DIC.property_name
  is '属性名称';
comment on column WII_CATHETER_PROPERTY_DIC.property_catalog
  is '属性分类';
comment on column WII_CATHETER_PROPERTY_DIC.property_unit
  is '属性单位';
comment on column WII_CATHETER_PROPERTY_DIC.value_type
  is '属性值类型 0数字；1文本；2Radiobutton单选；3下拉框 单选;4 多选';
comment on column WII_CATHETER_PROPERTY_DIC.value_range
  is '属性值域';
comment on column WII_CATHETER_PROPERTY_DIC.view_name
  is '属性自定义名称';
comment on column WII_CATHETER_PROPERTY_DIC.property_catalog_name
  is '属性成组显示组名称';

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
  is '导管ID';
comment on column WII_CATHETER_SPEC.catheter_spec
  is '导管型号';
comment on column WII_CATHETER_SPEC.unique_id
  is '物理唯一ID';

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
  is '工作计划编号';
comment on column WII_CHIEFNURSING_WORKPLAN.plan_content
  is '工作计划内容';
comment on column WII_CHIEFNURSING_WORKPLAN.is_important
  is '是否重要事项（0-重要.1-不重要)';
comment on column WII_CHIEFNURSING_WORKPLAN.plan_status
  is '0-新增.1-完成.2-取消.3-已删除';
comment on column WII_CHIEFNURSING_WORKPLAN.plan_quarter
  is '执行时间（季度）';
comment on column WII_CHIEFNURSING_WORKPLAN.plan_exec_time
  is '执行时间';
comment on column WII_CHIEFNURSING_WORKPLAN.plan_remarks
  is '备注';
comment on column WII_CHIEFNURSING_WORKPLAN.creator
  is '创建人';
comment on column WII_CHIEFNURSING_WORKPLAN.create_time
  is '创建时间';
comment on column WII_CHIEFNURSING_WORKPLAN.modifier
  is '编辑人';
comment on column WII_CHIEFNURSING_WORKPLAN.modify_time
  is '编辑时间';
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
  is '编码';
comment on column WII_CLINICAL_QUALITY.quota_value
  is '值';
comment on column WII_CLINICAL_QUALITY.memo
  is '备注';
comment on column WII_CLINICAL_QUALITY.valid
  is '类型(0暂存 1保存)';
comment on column WII_CLINICAL_QUALITY.quota_time
  is '时间';
comment on column WII_CLINICAL_QUALITY.create_time
  is '创建时间';
comment on column WII_CLINICAL_QUALITY.creator
  is '创建人';
comment on column WII_CLINICAL_QUALITY.quota_org
  is '组织';
comment on column WII_CLINICAL_QUALITY.quota_parent_code
  is '父类编号';
comment on column WII_CLINICAL_QUALITY.unique_id
  is '物理唯一ID';

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
  is '物理唯一ID';
comment on column WII_CLOUD_NODE.printsize
  is '纸张';
comment on column WII_CLOUD_NODE.printname
  is '打印机名字';

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
  is '病人唯一标识号';
comment on column WII_COMMUNICATION_REC.message_time
  is '消息发送时间';
comment on column WII_COMMUNICATION_REC.message_from
  is '消息发送人';
comment on column WII_COMMUNICATION_REC.message_to
  is '消息接受人';
comment on column WII_COMMUNICATION_REC.message_level
  is '消息级别';
comment on column WII_COMMUNICATION_REC.message_content
  is '消息内容';
comment on column WII_COMMUNICATION_REC.creator
  is '创建人';
comment on column WII_COMMUNICATION_REC.create_time
  is '创建时间';
comment on column WII_COMMUNICATION_REC.modifier
  is '修改人';
comment on column WII_COMMUNICATION_REC.modify_time
  is '修改时间';
comment on column WII_COMMUNICATION_REC.unique_id
  is '物理唯一ID';
comment on column WII_COMMUNICATION_REC.message_type
  is '消息类别';

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
  is '自增长ID
';
comment on column WII_CONSULTATION_RRCORD.consultation_type
  is '会诊类型
1：远程会诊，2：远程查房
';
comment on column WII_CONSULTATION_RRCORD.applicant
  is '申请人
';
comment on column WII_CONSULTATION_RRCORD.apply_date
  is '申请日期
';
comment on column WII_CONSULTATION_RRCORD.except_hospital
  is '期望会诊医院
';
comment on column WII_CONSULTATION_RRCORD.except_doctor
  is '期望会诊医生
';
comment on column WII_CONSULTATION_RRCORD.patient_describe
  is '病情描述
';
comment on column WII_CONSULTATION_RRCORD.is_finish
  is '是否结束
';
comment on column WII_CONSULTATION_RRCORD.consultation_opinoin
  is '会诊意见
';
comment on column WII_CONSULTATION_RRCORD.create_time
  is '创建时间
';
comment on column WII_CONSULTATION_RRCORD.creator
  is '创建人
';
comment on column WII_CONSULTATION_RRCORD.modifier
  is '修改人
';
comment on column WII_CONSULTATION_RRCORD.modify_time
  is '修改时间
';
comment on column WII_CONSULTATION_RRCORD.patient_id
  is '病人ID';
comment on column WII_CONSULTATION_RRCORD.start_time
  is '开始时间';
comment on column WII_CONSULTATION_RRCORD.end_time
  is '结束时间';
comment on column WII_CONSULTATION_RRCORD.data_flag
  is '数据标示';
comment on column WII_CONSULTATION_RRCORD.unique_id
  is '物理唯一ID';
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
  is '消耗品编码';
comment on column WII_CONSUMABLE_DIC.consumable_name
  is '消耗品名称';
comment on column WII_CONSUMABLE_DIC.consumable_spec
  is '消耗品使用规格';
comment on column WII_CONSUMABLE_DIC.spec_unit
  is '规格单位';
comment on column WII_CONSUMABLE_DIC.consumable_product_class
  is '消耗品类别－商品属性';
comment on column WII_CONSUMABLE_DIC.consumable_value_class
  is '消耗品类别－价值';
comment on column WII_CONSUMABLE_DIC.code_in_his
  is 'HIS中代码';
comment on column WII_CONSUMABLE_DIC.supplier_id
  is '供应商代码';
comment on column WII_CONSUMABLE_DIC.supplier_name
  is '供应商名称';
comment on column WII_CONSUMABLE_DIC.batch_no
  is '批次号';
comment on column WII_CONSUMABLE_DIC.package_spec
  is '包装规格';
comment on column WII_CONSUMABLE_DIC.package_unit
  is '包装单位';
comment on column WII_CONSUMABLE_DIC.input_code
  is '输入码';

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
  is '　病人（编号）唯一标识';
comment on column WII_CONSUMABLE_USING_ICU.ward_code
  is '病区编号';
comment on column WII_CONSUMABLE_USING_ICU.material_label
  is '物资编号（从设备和资源管理系统来；高值有个条码，低值批次号）';
comment on column WII_CONSUMABLE_USING_ICU.use_time
  is '使用时间';
comment on column WII_CONSUMABLE_USING_ICU.consum_code
  is '消耗品种类名称代码（从设备和资源管理系统来）';
comment on column WII_CONSUMABLE_USING_ICU.consum_name
  is '消耗品名称（从设备和资源管理系统来）';
comment on column WII_CONSUMABLE_USING_ICU.consum_qty
  is '消耗品数量';
comment on column WII_CONSUMABLE_USING_ICU.consum_unit
  is '消耗品单位';
comment on column WII_CONSUMABLE_USING_ICU.operator
  is '操作人';
comment on column WII_CONSUMABLE_USING_ICU.operate_time
  is '操作时间';
comment on column WII_CONSUMABLE_USING_ICU.unique_id
  is '物理唯一ID';

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
  is '版本';
comment on column WII_DBVERSION.updatedby
  is '更新人';
comment on column WII_DBVERSION.updatedon
  is '更新时间';
comment on column WII_DBVERSION.reason
  is '更新理由';
comment on column WII_DBVERSION.filename
  is '文件名';
comment on column WII_DBVERSION.content
  is '内容';
comment on column WII_DBVERSION.lastversion
  is '上一版本';
comment on column WII_DBVERSION.download
  is '下载地址';

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
  is '版本';
comment on column WII_DBVERSION_LOG.updatedby
  is '更新人';
comment on column WII_DBVERSION_LOG.updatedon
  is '更新时间';

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
  is '科室总负责特殊岗位扩展信息';
comment on column WII_DC_SCHEDULE_CHARGE_EXTEND.charge_year_month
  is '排班月度';
comment on column WII_DC_SCHEDULE_CHARGE_EXTEND.list_code
  is '编号(由于WII_DC_SCHEDUL_CHARGE_INFO表同名字段存的name,实际存DIC表NAME)';
comment on column WII_DC_SCHEDULE_CHARGE_EXTEND.wardcode
  is '科室编号(逗号分隔)';

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
  is '床位对应管床医生表';
comment on column WII_DC_SCHEDUL_BEDDOCTOR.patient_id
  is '患者就诊号';
comment on column WII_DC_SCHEDUL_BEDDOCTOR.doctor_id
  is '医生ID列表，逗号分隔';
comment on column WII_DC_SCHEDUL_BEDDOCTOR.record_date
  is '月份平均分配的就记录YYYYMM，特殊的就记录YYYYMMDD';
comment on column WII_DC_SCHEDUL_BEDDOCTOR.create_time
  is '创建时间';
comment on column WII_DC_SCHEDUL_BEDDOCTOR.creator
  is '创建人';
comment on column WII_DC_SCHEDUL_BEDDOCTOR.modify_by
  is '修改人';
comment on column WII_DC_SCHEDUL_BEDDOCTOR.modify_date
  is '修改时间';
comment on column WII_DC_SCHEDUL_BEDDOCTOR.ward_code
  is '记录时病人对应病区号';
comment on column WII_DC_SCHEDUL_BEDDOCTOR.bed_no
  is '记录时病人对应床位信息';

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
  is '科室总负责特殊岗位信息表';
comment on column WII_DC_SCHEDUL_CHARGE_INFO.id
  is '主键唯一值';
comment on column WII_DC_SCHEDUL_CHARGE_INFO.charge_year_month
  is '排班月度';
comment on column WII_DC_SCHEDUL_CHARGE_INFO.list_code
  is '编号';
comment on column WII_DC_SCHEDUL_CHARGE_INFO.wardcode
  is '科室编号';
comment on column WII_DC_SCHEDUL_CHARGE_INFO.charge_person_id
  is '负责人';
comment on column WII_DC_SCHEDUL_CHARGE_INFO.creator
  is '创建人';
comment on column WII_DC_SCHEDUL_CHARGE_INFO.create_time
  is '创建日期';
comment on column WII_DC_SCHEDUL_CHARGE_INFO.modifier
  is '修改人';
comment on column WII_DC_SCHEDUL_CHARGE_INFO.modify_time
  is '修改日期';
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
  is '病区值班_总览';
comment on column WII_DC_SCHEDUL_DUTY_INFO.id
  is '主键唯一值';
comment on column WII_DC_SCHEDUL_DUTY_INFO.charge_year_month
  is '排班月度';
comment on column WII_DC_SCHEDUL_DUTY_INFO.wardcode
  is '科室编号';
comment on column WII_DC_SCHEDUL_DUTY_INFO.classes_type
  is '班次';
comment on column WII_DC_SCHEDUL_DUTY_INFO.work_date
  is '排班日期';
comment on column WII_DC_SCHEDUL_DUTY_INFO.creator
  is '创建人';
comment on column WII_DC_SCHEDUL_DUTY_INFO.create_time
  is '创建日期';
comment on column WII_DC_SCHEDUL_DUTY_INFO.modifier
  is '修改人';
comment on column WII_DC_SCHEDUL_DUTY_INFO.modify_time
  is '修改日期';
comment on column WII_DC_SCHEDUL_DUTY_INFO.doctor
  is '被排班医生(存放USER_ID)';
comment on column WII_DC_SCHEDUL_DUTY_INFO.group_no
  is '组号(1 2 3等组号(界面))';
comment on column WII_DC_SCHEDUL_DUTY_INFO.seqnumber
  is '排序码';
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
  is '病区主信息';
comment on column WII_DC_SCHEDUL_WARD_INFO.id
  is '主键唯一值';
comment on column WII_DC_SCHEDUL_WARD_INFO.charge_year_month
  is '排班月度';
comment on column WII_DC_SCHEDUL_WARD_INFO.group_code
  is '病区主信息组号';
comment on column WII_DC_SCHEDUL_WARD_INFO.wardcode
  is '科室编号';
comment on column WII_DC_SCHEDUL_WARD_INFO.post_name
  is '岗位名称';
comment on column WII_DC_SCHEDUL_WARD_INFO.user_id
  is '人员编号';
comment on column WII_DC_SCHEDUL_WARD_INFO.creator
  is '创建人';
comment on column WII_DC_SCHEDUL_WARD_INFO.create_time
  is '创建日期';
comment on column WII_DC_SCHEDUL_WARD_INFO.modifier
  is '修改人';
comment on column WII_DC_SCHEDUL_WARD_INFO.modify_time
  is '修改日期';
comment on column WII_DC_SCHEDUL_WARD_INFO.teacher_id
  is '带教老师';
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
  is '医生';
comment on column WII_DDD_DETAIL.pharmacy_code
  is '药物Code';
comment on column WII_DDD_DETAIL.pharmacy_chemname
  is '药物名称';
comment on column WII_DDD_DETAIL.dosage
  is '剂量';
comment on column WII_DDD_DETAIL.units
  is '单位';
comment on column WII_DDD_DETAIL.ddd_value
  is 'ddd值';
comment on column WII_DDD_DETAIL.ddd_unit
  is 'ddd单位';
comment on column WII_DDD_DETAIL.org_code
  is '病区CODE';
comment on column WII_DDD_DETAIL.org_name
  is '病区名称';
comment on column WII_DDD_DETAIL.order_time
  is '医嘱时间';
comment on column WII_DDD_DETAIL.memo
  is '备注';
comment on column WII_DDD_DETAIL.valid
  is '有效性（0-无效，1-有效）';
comment on column WII_DDD_DETAIL.create_time
  is '创建时间';
comment on column WII_DDD_DETAIL.creator
  is '创建人';
comment on column WII_DDD_DETAIL.modifier
  is '修改人';
comment on column WII_DDD_DETAIL.modify_time
  is '修改时间';

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
  is '设备资产编号';
comment on column WII_DEVICE_ACCESS.device_label
  is '设备标签';
comment on column WII_DEVICE_ACCESS.ward_code
  is '病区';
comment on column WII_DEVICE_ACCESS.create_time
  is '创建时间';
comment on column WII_DEVICE_ACCESS.creator
  is '创建人';
comment on column WII_DEVICE_ACCESS.unique_id
  is '物理唯一ID';

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
  is '设备资产编号';
comment on column WII_DEVICE_MASTER.device_label
  is '设备标签';
comment on column WII_DEVICE_MASTER.device_status
  is '0:闲置 1：占用 2：维修 3：不可用 8：报废 9：其他...';
comment on column WII_DEVICE_MASTER.supplier
  is '生产厂家';
comment on column WII_DEVICE_MASTER.model
  is '型号';
comment on column WII_DEVICE_MASTER.interface_type
  is '接口类型';
comment on column WII_DEVICE_MASTER.interface_desc
  is '接口描述';
comment on column WII_DEVICE_MASTER.ip_addr
  is 'IP地址';
comment on column WII_DEVICE_MASTER.mac_addr
  is 'MAC地址';
comment on column WII_DEVICE_MASTER.last_recv_time
  is '最近采集时间';
comment on column WII_DEVICE_MASTER.last_recv_bed_id
  is '最近采集床号';
comment on column WII_DEVICE_MASTER.duplex_flag
  is '双工标志';
comment on column WII_DEVICE_MASTER.autoin_flag
  is '自动入库标志';
comment on column WII_DEVICE_MASTER.comm_port
  is '通讯口号';
comment on column WII_DEVICE_MASTER.baud_rate
  is '波特率';
comment on column WII_DEVICE_MASTER.byte_size
  is '数据位';
comment on column WII_DEVICE_MASTER.parity
  is '校验类型';
comment on column WII_DEVICE_MASTER.stop_bits
  is '停止位';
comment on column WII_DEVICE_MASTER.f_outx
  is '传送使用';
comment on column WII_DEVICE_MASTER.f_inx
  is '接收使用';
comment on column WII_DEVICE_MASTER.f_hardware
  is '流硬件控制';
comment on column WII_DEVICE_MASTER.tx_queuesize
  is '传送队列大小';
comment on column WII_DEVICE_MASTER.rx_queuesize
  is '接收队列大小';
comment on column WII_DEVICE_MASTER.xon_lim
  is 'XON阀值';
comment on column WII_DEVICE_MASTER.xoff_lim
  is 'XOFF阀值';
comment on column WII_DEVICE_MASTER.xon_char
  is 'XON字符';
comment on column WII_DEVICE_MASTER.xoff_char
  is 'XOFF字符';
comment on column WII_DEVICE_MASTER.error_char
  is '错误替代字符';
comment on column WII_DEVICE_MASTER.event_char
  is '监控事件字符';
comment on column WII_DEVICE_MASTER.driver_prog
  is '接口程序';
comment on column WII_DEVICE_MASTER.priority
  is '接口程序优先级';
comment on column WII_DEVICE_MASTER.item_type
  is '仪器分类字母';
comment on column WII_DEVICE_MASTER.auto_load
  is '自动装入联机接口程序';
comment on column WII_DEVICE_MASTER.current_recv_items
  is '当前采集的生命体征参数
参数间用逗号隔开';
comment on column WII_DEVICE_MASTER.frequency_display
  is '采集频率';
comment on column WII_DEVICE_MASTER.memo
  is '备注';
comment on column WII_DEVICE_MASTER.datalog_start_time
  is '数据记录开始时间';
comment on column WII_DEVICE_MASTER.pc_port
  is 'PC端口号';
comment on column WII_DEVICE_MASTER.datalog_status
  is '状态';
comment on column WII_DEVICE_MASTER.ip_port
  is 'IP端口';
comment on column WII_DEVICE_MASTER.in_port
  is '接收端口号';
comment on column WII_DEVICE_MASTER.out_port
  is '发送端口号';
comment on column WII_DEVICE_MASTER.current_patient_id
  is '当前使用患者编号';
comment on column WII_DEVICE_MASTER.device_type
  is '设备类别';
comment on column WII_DEVICE_MASTER.unique_id
  is '物理唯一ID';
comment on column WII_DEVICE_MASTER.org_code
  is '所属病区编号（采集程序用）';
comment on column WII_DEVICE_MASTER.monitor_item_config
  is '设置采集配置，可调整采集数据是否写入网关以及采集数值换算倍数（40|1|0.01）';
comment on column WII_DEVICE_MASTER.ward_code
  is '所属病区编号（API后端用）';

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
  is '病人唯一标识号';
comment on column WII_DEVICE_USING.device_id
  is '设备资产编号';
comment on column WII_DEVICE_USING.start_time
  is '设备绑定工作时间';
comment on column WII_DEVICE_USING.end_time
  is '设备解绑定时间';
comment on column WII_DEVICE_USING.bunding_operator
  is '绑定操作人';
comment on column WII_DEVICE_USING.bunding_time
  is '绑定操作时间';
comment on column WII_DEVICE_USING.create_time
  is '创建时间';
comment on column WII_DEVICE_USING.creator
  is '创建人';
comment on column WII_DEVICE_USING.unbunding_operator
  is '解绑操作人';
comment on column WII_DEVICE_USING.unbunding_time
  is '解绑操作时间';
comment on column WII_DEVICE_USING.frequence
  is '设备数据显示频率';
comment on column WII_DEVICE_USING.lastsync_time
  is '最后同步时间';
comment on column WII_DEVICE_USING.unique_id
  is '物理唯一ID';
comment on column WII_DEVICE_USING.initial_value
  is '初始值';
comment on column WII_DEVICE_USING.bind_begin_hours_frequnce
  is '描述：设定绑定开始多少小时多少频率（2|30 指2小时30分）';
comment on column WII_DEVICE_USING.bind_monitor_item_frequnce
  is '绑定患者体征项频率，可设置单个体征采集频率，不设置则按默认（IBP|120,NIBP|240）';

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
  is '诊断流水号';
comment on column WII_DIAGNOSE.patient_id
  is '病人唯一标识号';
comment on column WII_DIAGNOSE.inpatient_visitid
  is '住院活动号（标示每次患者住院的唯一号，可用住院号+住院次数）';
comment on column WII_DIAGNOSE.diagnose_type
  is '诊断类型（入院、初步、修正诊断、最终、等）＝＝对应一个诊断类型字典';
comment on column WII_DIAGNOSE.diagnose_name
  is '诊断名称';
comment on column WII_DIAGNOSE.diagnose_code
  is '诊断编码（对应字典；字典包含ICD和自主编码）';
comment on column WII_DIAGNOSE.diagnose_time
  is '诊断时间';
comment on column WII_DIAGNOSE.diagnose_doctor
  is '诊断医生';
comment on column WII_DIAGNOSE.auditor
  is '审核人';
comment on column WII_DIAGNOSE.audit_time
  is '审核时间';
comment on column WII_DIAGNOSE.diagnose_disease_type
  is '诊断疾病分类';
comment on column WII_DIAGNOSE.disgnose_system
  is 'ICU诊断涉及器官系统';
comment on column WII_DIAGNOSE.unique_id
  is '物理唯一ID';
comment on column WII_DIAGNOSE.updatetime
  is '修正日期';
comment on column WII_DIAGNOSE.updater
  is '修正人';
comment on column WII_DIAGNOSE.source
  is '来源';
comment on column WII_DIAGNOSE.diagnose_sequence
  is '诊断排序';
comment on column WII_DIAGNOSE.diagnose_num
  is 'His排序字段';
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
  is '诊断内容与匹配项关系表';
comment on column WII_DIAGNOSE_ASSOCIATE.diagnose_item
  is '诊断内容';
comment on column WII_DIAGNOSE_ASSOCIATE.diagnose_score
  is '匹配的评分项';
comment on column WII_DIAGNOSE_ASSOCIATE.score
  is '评分';
comment on column WII_DIAGNOSE_ASSOCIATE.input_time
  is '录入日期';
comment on column WII_DIAGNOSE_ASSOCIATE.create_time
  is '创建时间';
comment on column WII_DIAGNOSE_ASSOCIATE.unique_id
  is '物理唯一ID';
comment on column WII_DIAGNOSE_ASSOCIATE.diagnosis_type_code
  is '时点类别';
comment on column WII_DIAGNOSE_ASSOCIATE.diagnose_disease_type
  is '诊断疾病分类';

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
  is '诊断流水号';
comment on column WII_DIAGNOSE_MODIFY.patient_id
  is '病人唯一标识号';
comment on column WII_DIAGNOSE_MODIFY.inpatient_visitid
  is '住院活动号（标示每次患者住院的唯一号，可用住院号+住院次数）';
comment on column WII_DIAGNOSE_MODIFY.diagnose_type
  is '诊断类型（入院、初步、修正诊断、最终、等）＝＝对应一个诊断类型字典';
comment on column WII_DIAGNOSE_MODIFY.diagnose_name
  is '诊断名称';
comment on column WII_DIAGNOSE_MODIFY.diagnose_code
  is '诊断编码（对应字典；字典包含ICD和自主编码）';
comment on column WII_DIAGNOSE_MODIFY.diagnose_time
  is '诊断时间';
comment on column WII_DIAGNOSE_MODIFY.diagnose_doctor
  is '诊断医生';
comment on column WII_DIAGNOSE_MODIFY.diagnose_modify_time
  is '诊断修正时间';
comment on column WII_DIAGNOSE_MODIFY.diagnose_modify_doctor
  is '诊断修正医生';
comment on column WII_DIAGNOSE_MODIFY.auditor
  is '审核人';
comment on column WII_DIAGNOSE_MODIFY.aduit_time
  is '审核时间';
comment on column WII_DIAGNOSE_MODIFY.unique_id
  is '物理唯一ID';
comment on column WII_DIAGNOSE_MODIFY.diagnose_disease_type
  is '诊断疾病分类';
comment on column WII_DIAGNOSE_MODIFY.disgnose_system
  is 'ICU诊断涉及器官系统';

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
  is '病人唯一标识号';
comment on column WII_DIAGNOSE_TEXT.origintext
  is '诊断变更原始文本';
comment on column WII_DIAGNOSE_TEXT.input_time
  is '填入时间';
comment on column WII_DIAGNOSE_TEXT.unique_id
  is '物理唯一ID';
comment on column WII_DIAGNOSE_TEXT.diagnosetype
  is '0:入院诊断 |1:修正诊断';

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
  is '诊断类别代码';
comment on column WII_DIAGNOSE_TYPE_DIC.diagnosis_type_name
  is '诊断类别名称';
comment on column WII_DIAGNOSE_TYPE_DIC.diagnosis_type_category
  is '诊断类别归类';
comment on column WII_DIAGNOSE_TYPE_DIC.input_code
  is '输入码';

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
  is '诊断类型对照表';
comment on column WII_DIAGNOSE_TYPE_MAPPING_DIC.cis_type_code
  is 'CIS类型编码';
comment on column WII_DIAGNOSE_TYPE_MAPPING_DIC.his_type_code
  is 'HIS类型编码';
comment on column WII_DIAGNOSE_TYPE_MAPPING_DIC.his_type_name
  is 'HIS类型名称';
comment on column WII_DIAGNOSE_TYPE_MAPPING_DIC.input_code
  is '输入码';
comment on column WII_DIAGNOSE_TYPE_MAPPING_DIC.memo
  is '备注';

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
  is '  编码 ';
comment on column WII_DICTIONARYINDEX_CONFIG.dic_parent_code
  is ' 父类 编码 ';
comment on column WII_DICTIONARYINDEX_CONFIG.dic_type
  is '类型(通用，医嘱，诊断)';
comment on column WII_DICTIONARYINDEX_CONFIG.dic_name
  is '名称';
comment on column WII_DICTIONARYINDEX_CONFIG.dic_tablename
  is '对应表名';
comment on column WII_DICTIONARYINDEX_CONFIG.description
  is '描述 ';
comment on column WII_DICTIONARYINDEX_CONFIG.dic_class
  is '区分小类';
comment on column WII_DICTIONARYINDEX_CONFIG.dic_seq
  is '排序';
comment on column WII_DICTIONARYINDEX_CONFIG.unique_id
  is '物理唯一ID';
comment on column WII_DICTIONARYINDEX_CONFIG.is_config
  is '是否配置';
comment on column WII_DICTIONARYINDEX_CONFIG.is_visible
  is '是否可见';
comment on column WII_DICTIONARYINDEX_CONFIG.column_visible
  is '字典显示字段';
comment on column WII_DICTIONARYINDEX_CONFIG.dic_moudle
  is '模块';

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
  is '科研项目表';
comment on column WII_DMAR_PORTFOLIO_MASTER.portfolio_id
  is 'DMAR归档项目编号';
comment on column WII_DMAR_PORTFOLIO_MASTER.portfolio_type
  is '归档项目类型 1-文件夹；2档案';
comment on column WII_DMAR_PORTFOLIO_MASTER.portfolio_name
  is '归档项目名称';
comment on column WII_DMAR_PORTFOLIO_MASTER.portfolio_memo
  is '项目描述';
comment on column WII_DMAR_PORTFOLIO_MASTER.parent_portfolio_id
  is '父DMAR归档项目编号';
comment on column WII_DMAR_PORTFOLIO_MASTER.is_auto
  is '1-自动归档；2-手动归档';
comment on column WII_DMAR_PORTFOLIO_MASTER.ward_codes
  is '搜集患者的病区';
comment on column WII_DMAR_PORTFOLIO_MASTER.captial_source
  is '资金来源';
comment on column WII_DMAR_PORTFOLIO_MASTER.captial_amounts
  is '资金金额';
comment on column WII_DMAR_PORTFOLIO_MASTER.responser
  is '科研课题负责人';
comment on column WII_DMAR_PORTFOLIO_MASTER.administrators
  is '科研课题管理员';
comment on column WII_DMAR_PORTFOLIO_MASTER.primary_members
  is '科研课题组主要成员';
comment on column WII_DMAR_PORTFOLIO_MASTER.creator
  is '创建人';
comment on column WII_DMAR_PORTFOLIO_MASTER.create_time
  is '创建时间';
comment on column WII_DMAR_PORTFOLIO_MASTER.unique_id
  is '物理唯一ID';
comment on column WII_DMAR_PORTFOLIO_MASTER.milestones_point
  is '里程碑节点编号';

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
  is '科研课题里程碑表';
comment on column WII_DMAR_PORTFOLIO_MILESTONES.milestones_id
  is '科研课题里程碑编号';
comment on column WII_DMAR_PORTFOLIO_MILESTONES.portfolio_id
  is 'DMAR归档项目编号';
comment on column WII_DMAR_PORTFOLIO_MILESTONES.milestones_task
  is '科研课题里程任务';
comment on column WII_DMAR_PORTFOLIO_MILESTONES.time_point
  is '里程时间节点';
comment on column WII_DMAR_PORTFOLIO_MILESTONES.remind_time
  is '里程提醒时间';
comment on column WII_DMAR_PORTFOLIO_MILESTONES.creator
  is '创建人';
comment on column WII_DMAR_PORTFOLIO_MILESTONES.create_time
  is '创建时间';
comment on column WII_DMAR_PORTFOLIO_MILESTONES.unique_id
  is '物理唯一ID';
comment on column WII_DMAR_PORTFOLIO_MILESTONES.modifier
  is '修改人';
comment on column WII_DMAR_PORTFOLIO_MILESTONES.modify_time
  is '修改时间';

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
  is '科研课题患者表';
comment on column WII_DMAR_PORTFOLIO_PATIENT.portfolio_id
  is 'DMAR归档项目编号';
comment on column WII_DMAR_PORTFOLIO_PATIENT.group_id
  is '样本组';
comment on column WII_DMAR_PORTFOLIO_PATIENT.patient_id
  is '患者编号';
comment on column WII_DMAR_PORTFOLIO_PATIENT.inpatient_visitid
  is '患者住院活动号';
comment on column WII_DMAR_PORTFOLIO_PATIENT.sample_memo
  is '备注';
comment on column WII_DMAR_PORTFOLIO_PATIENT.operator
  is '操作人';
comment on column WII_DMAR_PORTFOLIO_PATIENT.operate_time
  is '操作时间';
comment on column WII_DMAR_PORTFOLIO_PATIENT.unique_id
  is '物理唯一ID';

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
  is '样本报告编号';
comment on column WII_DMAR_SAMPLE_CAL_CONFIG.cal_item_no
  is '计算项目编号';
comment on column WII_DMAR_SAMPLE_CAL_CONFIG.cal_item_name
  is '计算项目名称';
comment on column WII_DMAR_SAMPLE_CAL_CONFIG.data_source_set
  is '获取来源数据集';
comment on column WII_DMAR_SAMPLE_CAL_CONFIG.data_source_property
  is '获取数据源属性';
comment on column WII_DMAR_SAMPLE_CAL_CONFIG.data_compute_method
  is '计算方式，取值、求和、最大、最小、计数';
comment on column WII_DMAR_SAMPLE_CAL_CONFIG.data_choose_condition
  is '抽取条件，全部、第一条、第n条、最后一条';
comment on column WII_DMAR_SAMPLE_CAL_CONFIG.data_filter_condition
  is '筛选条件';
comment on column WII_DMAR_SAMPLE_CAL_CONFIG.data_sequence_condition
  is '排序条件';
comment on column WII_DMAR_SAMPLE_CAL_CONFIG.is_use
  is '0 不用  1 使用';
comment on column WII_DMAR_SAMPLE_CAL_CONFIG.cal_big_item_name
  is '计算大项名称';

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
  is '科研课题病例分组表';
comment on column WII_DMAR_SAMPLE_GROUP.group_id
  is '样品组ID';
comment on column WII_DMAR_SAMPLE_GROUP.group_code
  is '样品组Code';
comment on column WII_DMAR_SAMPLE_GROUP.group_name
  is '样品组名称';
comment on column WII_DMAR_SAMPLE_GROUP.group_memo
  is '样品组描述';
comment on column WII_DMAR_SAMPLE_GROUP.portfolio_id
  is 'DMAR归档项目编号';
comment on column WII_DMAR_SAMPLE_GROUP.creator
  is '创建人';
comment on column WII_DMAR_SAMPLE_GROUP.create_time
  is '创建时间';
comment on column WII_DMAR_SAMPLE_GROUP.unique_id
  is '物理唯一ID';
comment on column WII_DMAR_SAMPLE_GROUP.inclusion_criteria
  is '归档纳入规则';

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
  is '项目编码';
comment on column WII_DOCTOR_DCL_DIC.name
  is '项目名称';
comment on column WII_DOCTOR_DCL_DIC.value_type
  is '值类型';
comment on column WII_DOCTOR_DCL_DIC.value_ranage
  is '值域';
comment on column WII_DOCTOR_DCL_DIC.view_name
  is '显示名称';
comment on column WII_DOCTOR_DCL_DIC.memo
  is '备注';

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
  is '模板Code';
comment on column WII_DOCTOR_DCL_MASTER.patient_id
  is '病人ID';
comment on column WII_DOCTOR_DCL_MASTER.check_time
  is '核对时间';
comment on column WII_DOCTOR_DCL_MASTER.check_doctor
  is '核查医生';
comment on column WII_DOCTOR_DCL_MASTER.dcl_item_code
  is '核对CODE';
comment on column WII_DOCTOR_DCL_MASTER.check_value
  is '核对结果';
comment on column WII_DOCTOR_DCL_MASTER.creator
  is '创建人';
comment on column WII_DOCTOR_DCL_MASTER.create_time
  is '创建时间';
comment on column WII_DOCTOR_DCL_MASTER.modifier
  is '修改人';
comment on column WII_DOCTOR_DCL_MASTER.modify_time
  is '修改时间';
comment on column WII_DOCTOR_DCL_MASTER.unique_id
  is '物理唯一id';
comment on column WII_DOCTOR_DCL_MASTER.shift_no
  is '班次编号';
comment on column WII_DOCTOR_DCL_MASTER.check_date
  is '核查日期';

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
  is '科室Code';
comment on column WII_DOCTOR_DCL_TEMPLETE.templete_code
  is '模板Code';
comment on column WII_DOCTOR_DCL_TEMPLETE.templete_name
  is '模板名称';
comment on column WII_DOCTOR_DCL_TEMPLETE.dcl_catalog_code
  is '核查类目';
comment on column WII_DOCTOR_DCL_TEMPLETE.dcl_catalog_name
  is '核查类目名称';
comment on column WII_DOCTOR_DCL_TEMPLETE.parent_dcl_item_code
  is '核查父项目';
comment on column WII_DOCTOR_DCL_TEMPLETE.dcl_item_code
  is '核查项目';
comment on column WII_DOCTOR_DCL_TEMPLETE.seq
  is '排序';
comment on column WII_DOCTOR_DCL_TEMPLETE.type
  is '类型';
comment on column WII_DOCTOR_DCL_TEMPLETE.creator
  is '创建人';
comment on column WII_DOCTOR_DCL_TEMPLETE.create_time
  is '创建时间';
comment on column WII_DOCTOR_DCL_TEMPLETE.modifier
  is '修改人';
comment on column WII_DOCTOR_DCL_TEMPLETE.modify_time
  is '修改时间';
comment on column WII_DOCTOR_DCL_TEMPLETE.unique_id
  is '物理唯一id';

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
  is '单据项目大类(用于区分单据上获取数据的分类 如:生命体征,药嘱)';
comment on column WII_DOCTOR_SHIFT_ITEM_CONFIG.item_name
  is '显示的父项';
comment on column WII_DOCTOR_SHIFT_ITEM_CONFIG.subitem_name
  is '用于筛选的显示子项  WII_PATIENT_LAB_RESULT中REPORT_ITEM_NAME';
comment on column WII_DOCTOR_SHIFT_ITEM_CONFIG.search_value
  is '用于筛选的条件 WII_PATIENT_LAB LAB_NAME包含此项 如Labname血气分析组套,这里配血气分析 逗号分隔 为空则不根据此条件筛选';
comment on column WII_DOCTOR_SHIFT_ITEM_CONFIG.order_code
  is '排序码';

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
  is '医院名称';
comment on column WII_DOCUMENT_ITEM_CONFIG.document_name
  is '单子名称';
comment on column WII_DOCUMENT_ITEM_CONFIG.source_type
  is 'sign,lab等';

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
  is '文书接口方法配置';
comment on column WII_DOCUMENT_METHOD_CONFIG.document_method_id
  is '自增长id';
comment on column WII_DOCUMENT_METHOD_CONFIG.datasourse_name
  is '数据源中文名';
comment on column WII_DOCUMENT_METHOD_CONFIG.api_name
  is '接口中文名';
comment on column WII_DOCUMENT_METHOD_CONFIG.api_method_name
  is '接口方法中文名';
comment on column WII_DOCUMENT_METHOD_CONFIG.datasourse_enname
  is '数据源';
comment on column WII_DOCUMENT_METHOD_CONFIG.api_enname
  is '接口名';
comment on column WII_DOCUMENT_METHOD_CONFIG.method_param
  is '参数';
comment on column WII_DOCUMENT_METHOD_CONFIG.api_method_enname
  is '接口方法名';
comment on column WII_DOCUMENT_METHOD_CONFIG.create_time
  is '创建时间';
comment on column WII_DOCUMENT_METHOD_CONFIG.creator
  is '创建人';
comment on column WII_DOCUMENT_METHOD_CONFIG.modify_by
  is '修改人';
comment on column WII_DOCUMENT_METHOD_CONFIG.modify_time
  is '修改时间';
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
  is '文书接口方法配置';
comment on column WII_DOCUMENT_MRCOLS_CONFIG.document_method_id
  is '主表id';
comment on column WII_DOCUMENT_MRCOLS_CONFIG.column_enname
  is '数据源中文名';
comment on column WII_DOCUMENT_MRCOLS_CONFIG.column_name
  is '接口中文名';
comment on column WII_DOCUMENT_MRCOLS_CONFIG.note
  is '接口方法中文名';
comment on column WII_DOCUMENT_MRCOLS_CONFIG.create_time
  is '创建时间';
comment on column WII_DOCUMENT_MRCOLS_CONFIG.creator
  is '创建人';
comment on column WII_DOCUMENT_MRCOLS_CONFIG.modifier
  is '修改人';
comment on column WII_DOCUMENT_MRCOLS_CONFIG.modify_time
  is '修改时间';
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
  is '文书签名修改记录';
comment on column WII_DOCUMENT_SIGNATURE_RECORD.doc_signature_id
  is '签名ID';
comment on column WII_DOCUMENT_SIGNATURE_RECORD.patient_id
  is '患者编码';
comment on column WII_DOCUMENT_SIGNATURE_RECORD.signature_key
  is '签名组套编码';
comment on column WII_DOCUMENT_SIGNATURE_RECORD.start_time
  is '签名覆盖开始时间';
comment on column WII_DOCUMENT_SIGNATURE_RECORD.end_time
  is '签名覆盖结束时间';
comment on column WII_DOCUMENT_SIGNATURE_RECORD.signature
  is '签名';
comment on column WII_DOCUMENT_SIGNATURE_RECORD.signature_code
  is '签名对应工号';
comment on column WII_DOCUMENT_SIGNATURE_RECORD.login_user
  is '系统登录人工号';
comment on column WII_DOCUMENT_SIGNATURE_RECORD.operate_time
  is '修改签名时间';
comment on column WII_DOCUMENT_SIGNATURE_RECORD.record_status
  is '记录状态 0无效；1有效';

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
  is '字段说明
';
comment on column WII_DOCUMENT_SIGN_RECORD.item_code
  is '文书code
';
comment on column WII_DOCUMENT_SIGN_RECORD.item_name
  is '项目代码
';
comment on column WII_DOCUMENT_SIGN_RECORD.type
  is '类型，0是固定格式的，1是自由添加的';
comment on column WII_DOCUMENT_SIGN_RECORD.value
  is '保存值';
comment on column WII_DOCUMENT_SIGN_RECORD.operator
  is '操作人
';
comment on column WII_DOCUMENT_SIGN_RECORD.gen_time
  is '操作时间
';
comment on column WII_DOCUMENT_SIGN_RECORD.create_time
  is '创建时间
';
comment on column WII_DOCUMENT_SIGN_RECORD.creator
  is '创建人';
comment on column WII_DOCUMENT_SIGN_RECORD.modify_by
  is '修改人';
comment on column WII_DOCUMENT_SIGN_RECORD.modify_date
  is '修改时间
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
  is '工号：每个用户分配一个唯一标识号';
comment on column WII_EMPLOYEE.employee_name
  is '用户姓名';
comment on column WII_EMPLOYEE.dept_code
  is '用户所在科室的代码';
comment on column WII_EMPLOYEE.job_code
  is '例如：医生、护士等等';
comment on column WII_EMPLOYEE.telephone
  is '手机';
comment on column WII_EMPLOYEE.wechat_no
  is '微信号';
comment on column WII_EMPLOYEE.qq
  is 'QQ号';
comment on column WII_EMPLOYEE.title
  is '职称（比如主任、副主任、住院总等行政职位）';
comment on column WII_EMPLOYEE.grade
  is '职级 （比如教授、主任医生、主治医生、住院医生等）';
comment on column WII_EMPLOYEE.status
  is '在职状态';
comment on column WII_EMPLOYEE.create_time
  is '建立本用户的日期';
comment on column WII_EMPLOYEE.photo
  is '照片名称或者路径';
comment on column WII_EMPLOYEE.ward_code
  is '用户所在病区的代码';
comment on column WII_EMPLOYEE.sex
  is '性别';
comment on column WII_EMPLOYEE.entry_date
  is '入职时间';
comment on column WII_EMPLOYEE.exp_date
  is '有效期';
comment on column WII_EMPLOYEE.unique_id
  is '物理唯一ID';
comment on column WII_EMPLOYEE.signature_pic
  is '签名图片';
comment on column WII_EMPLOYEE.education_background
  is '学历';
comment on column WII_EMPLOYEE.intowardtime
  is '入科时间';
comment on column WII_EMPLOYEE.memo
  is '备注';
comment on column WII_EMPLOYEE.source
  is '来源';
comment on column WII_EMPLOYEE.birthday
  is '生日';
comment on column WII_EMPLOYEE.groupno
  is '分组';
comment on column WII_EMPLOYEE.isonscheduling
  is '是否参与排班';

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
  is '检查项目编码';
comment on column WII_EXAM_DIC.item_name
  is '检查项目名称';
comment on column WII_EXAM_DIC.item_category
  is '检查项目类别';
comment on column WII_EXAM_DIC.item_subcategory
  is '检查项目子类别';

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
  is '检查检验组别参数对应表';
comment on column WII_EXAM_GROUP_DETAIL.exam_group_no
  is '自增长ID
';
comment on column WII_EXAM_GROUP_DETAIL.create_time
  is '创建时间
';
comment on column WII_EXAM_GROUP_DETAIL.creator
  is '创建人
';
comment on column WII_EXAM_GROUP_DETAIL.modify_by
  is '修改人
';
comment on column WII_EXAM_GROUP_DETAIL.modify_date
  is '修改时间
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
  is '检查检验参数组字典';
comment on column WII_EXAM_GROUP_DIC.exam_group_no
  is '自增长ID
';
comment on column WII_EXAM_GROUP_DIC.exam_group_name
  is '参数组名称
';
comment on column WII_EXAM_GROUP_DIC.his_order_name
  is 'HIS名称
';
comment on column WII_EXAM_GROUP_DIC.belong_type
  is '属于分类
';
comment on column WII_EXAM_GROUP_DIC.create_time
  is '创建时间
';
comment on column WII_EXAM_GROUP_DIC.creator
  is '创建人
';
comment on column WII_EXAM_GROUP_DIC.modify_by
  is '修改人
';
comment on column WII_EXAM_GROUP_DIC.modify_date
  is '修改时间
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
  is '反馈信息ID';
comment on column WII_FEEDBACK.user_id
  is '反馈提交人ID';
comment on column WII_FEEDBACK.feedback_type
  is '反馈信息分类';
comment on column WII_FEEDBACK.content
  is '反馈信息内容';
comment on column WII_FEEDBACK.sub_time
  is '提交时间';
comment on column WII_FEEDBACK.unique_id
  is '物理唯一ID';
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
  is '模块ID';
comment on column WII_FLOWSHEET_MODULE.module_name
  is '模块名称';
comment on column WII_FLOWSHEET_MODULE.module_items
  is 'JSON配置出该模块下的所有项目';
comment on column WII_FLOWSHEET_MODULE.module_memo
  is '模块说明';
comment on column WII_FLOWSHEET_MODULE.creator
  is '创建人';
comment on column WII_FLOWSHEET_MODULE.create_time
  is '创建时间';
comment on column WII_FLOWSHEET_MODULE.modifier
  is '修改人';
comment on column WII_FLOWSHEET_MODULE.modify_time
  is '修改时间';
comment on column WII_FLOWSHEET_MODULE.module_fixed_items
  is '模块下固定项目';
comment on column WII_FLOWSHEET_MODULE.unique_id
  is '物理唯一ID';
comment on column WII_FLOWSHEET_MODULE.special_code
  is '专科code';
comment on column WII_FLOWSHEET_MODULE.module_items_group
  is '模块的成组配置';

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
  is '模板ID';
comment on column WII_FLOWSHEET_TEMPLATE.templet_name
  is '模板名称';
comment on column WII_FLOWSHEET_TEMPLATE.templet_type
  is '模板类别（0：外科；1：急诊急救；2：神内...）';
comment on column WII_FLOWSHEET_TEMPLATE.templet_class
  is '模板级别（0：通用；9：个人）';
comment on column WII_FLOWSHEET_TEMPLATE.templet_memo
  is '模板说明';
comment on column WII_FLOWSHEET_TEMPLATE.creator
  is '创建人';
comment on column WII_FLOWSHEET_TEMPLATE.create_time
  is '创建时间';
comment on column WII_FLOWSHEET_TEMPLATE.modifier
  is '修改人';
comment on column WII_FLOWSHEET_TEMPLATE.modify_time
  is '修改时间';
comment on column WII_FLOWSHEET_TEMPLATE.unique_id
  is '物理唯一ID';
comment on column WII_FLOWSHEET_TEMPLATE.operate_time
  is '操作时间';
comment on column WII_FLOWSHEET_TEMPLATE.special_code
  is '专科Code';

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
  is '模板ID';
comment on column WII_FLOWSHEET_TPCONTENT.module_id
  is '模块ID';
comment on column WII_FLOWSHEET_TPCONTENT.sort_no
  is '排序';
comment on column WII_FLOWSHEET_TPCONTENT.memo
  is '说明';
comment on column WII_FLOWSHEET_TPCONTENT.creator
  is '创建人';
comment on column WII_FLOWSHEET_TPCONTENT.create_time
  is '创建时间';
comment on column WII_FLOWSHEET_TPCONTENT.modifier
  is '修改人';
comment on column WII_FLOWSHEET_TPCONTENT.modify_time
  is '修改时间';
comment on column WII_FLOWSHEET_TPCONTENT.unique_id
  is '物理唯一ID';

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
  is '字典类型';
comment on column WII_GENERAL_DIC.code
  is '字典编码';
comment on column WII_GENERAL_DIC.name
  is '字典名称';
comment on column WII_GENERAL_DIC.input_code
  is '输入首字母';
comment on column WII_GENERAL_DIC.memo
  is '备注';
comment on column WII_GENERAL_DIC.parent_code
  is '父类编码';
comment on column WII_GENERAL_DIC.view_name
  is '显示名称';
comment on column WII_GENERAL_DIC.view_code
  is '显示编号';
comment on column WII_GENERAL_DIC.sort_no
  is '通用字典默认排序';
comment on column WII_GENERAL_DIC.is_default_option
  is '0-非默认值,1-是默认值';

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
  is 'CIS类型编码';
comment on column WII_GENERAL_MAPPING_DIC.code
  is 'CIS编码';
comment on column WII_GENERAL_MAPPING_DIC.his_code
  is 'HIS编码';
comment on column WII_GENERAL_MAPPING_DIC.his_name
  is 'HIS名称';
comment on column WII_GENERAL_MAPPING_DIC.input_code
  is '输入码';
comment on column WII_GENERAL_MAPPING_DIC.memo
  is '备注';

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
  is '含糖液体字典';
comment on column WII_GLU_FLUID_DIC.pharmacy_code
  is 'HIS药品名称编码';
comment on column WII_GLU_FLUID_DIC.pharmacy_chemname
  is 'HIS药品名称 - 化学名称';
comment on column WII_GLU_FLUID_DIC.glu_concentration
  is '含糖浓度';
comment on column WII_GLU_FLUID_DIC.med_route_ciscode
  is '给药途径';
comment on column WII_GLU_FLUID_DIC.dose_units
  is '剂量单位（ml）';
comment on column WII_GLU_FLUID_DIC.input_code
  is '输入首字母(快捷输入）';
comment on column WII_GLU_FLUID_DIC.memo
  is '备注';
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
  is '集成HIS链接路径表';
comment on column WII_HIS_LINK_PATH.his_link_id
  is '自增长ID
';
comment on column WII_HIS_LINK_PATH.show_name
  is '显示名称
';
comment on column WII_HIS_LINK_PATH.link_type
  is '链接类型
';
comment on column WII_HIS_LINK_PATH.link_url
  is '链接URL
';
comment on column WII_HIS_LINK_PATH.parameters
  is '参数组
';
comment on column WII_HIS_LINK_PATH.create_time
  is '创建时间
';
comment on column WII_HIS_LINK_PATH.creator
  is '创建人
';
comment on column WII_HIS_LINK_PATH.modifier
  is '修改人
';
comment on column WII_HIS_LINK_PATH.modify_time
  is '修改时间
';
comment on column WII_HIS_LINK_PATH.unique_id
  is '物理唯一ID';
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
  is '自增长ID';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.user_id
  is '用户ID';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.before_date
  is '调整前日期';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.before_content
  is '调整前内容';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.after_date
  is '调整后日期';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.after_content
  is '调整后内容';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.adjust_type
  is '调整类型(1：调休，2：层级变化，3：科室归属变化，可参照通用字典表)';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.alternates
  is '替补人员';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.reason
  is '申请发起原因';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.is_approve
  is '是否通过(0：未处理，1：通过，2：拒绝)';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.approve_note
  is '审核备注';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.approver
  is '审核人';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.approve_time
  is '审核时间';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.create_time
  is '创建时间';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.creator
  is '创建人';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.modifier
  is '修改人';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.modify_time
  is '修改时间';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.unique_id
  is '物理唯一ID';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.data_flag
  is '有效性，0-有效，1无效';
comment on column WII_HUMAN_ADJUSTMENT_RECORD.before_date_end
  is '调整前日期（范围值）';

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
  is '病区代码';
comment on column WII_ICU_CONFIG.config_content
  is '配置明细（json）';
comment on column WII_ICU_CONFIG.unique_id
  is '物理唯一ID';

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
  is 'ICU诊断编码';
comment on column WII_ICU_DISGNOSE_DIC.icu_disgnose_name
  is 'ICU诊断名称';
comment on column WII_ICU_DISGNOSE_DIC.icd_code
  is 'ICD编码';
comment on column WII_ICU_DISGNOSE_DIC.icd_name
  is 'ICD名称';
comment on column WII_ICU_DISGNOSE_DIC.diagnosis_type_code
  is 'ICU诊断类别代码（有单独的字典）';
comment on column WII_ICU_DISGNOSE_DIC.icu_disgnose_system
  is 'ICU诊断涉及器官系统';
comment on column WII_ICU_DISGNOSE_DIC.input_code
  is '输入首字母(快捷输入）';
comment on column WII_ICU_DISGNOSE_DIC.memo
  is '备注';
comment on column WII_ICU_DISGNOSE_DIC.valid
  is '有效性（0-无效，1-有效）';

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
  is '病人ID';
comment on column WII_ICU_DOCTOR_SHIFT.shift_date
  is '交班日期';
comment on column WII_ICU_DOCTOR_SHIFT.shift_operator
  is '交班人';
comment on column WII_ICU_DOCTOR_SHIFT.shift_time
  is '交班时间';
comment on column WII_ICU_DOCTOR_SHIFT.duty_operator
  is '接班人';
comment on column WII_ICU_DOCTOR_SHIFT.duty_time
  is '接班时间';
comment on column WII_ICU_DOCTOR_SHIFT.rescue_time
  is '抢救时间';
comment on column WII_ICU_DOCTOR_SHIFT.shift_status
  is '交班状态(0：未交班 1：已交班 2：接班中 3：已接班)';
comment on column WII_ICU_DOCTOR_SHIFT.shift_content
  is '交接班内容';
comment on column WII_ICU_DOCTOR_SHIFT.shift_memo
  is '交班备注';
comment on column WII_ICU_DOCTOR_SHIFT.duty_memo
  is '接班备注';
comment on column WII_ICU_DOCTOR_SHIFT.rescue_memo
  is '抢救备注';
comment on column WII_ICU_DOCTOR_SHIFT.creator
  is '创建人';
comment on column WII_ICU_DOCTOR_SHIFT.create_time
  is '创建时间';
comment on column WII_ICU_DOCTOR_SHIFT.modifier
  is '修改人';
comment on column WII_ICU_DOCTOR_SHIFT.modify_time
  is '修改时间';
comment on column WII_ICU_DOCTOR_SHIFT.rescue_operator
  is '抢救签名';
comment on column WII_ICU_DOCTOR_SHIFT.shift_no
  is '班次编号';
comment on column WII_ICU_DOCTOR_SHIFT.inpatient_visitid
  is '住院活动号';
comment on column WII_ICU_DOCTOR_SHIFT.inward_visitid
  is '入病区活动号';

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
  is '医生站交接班操作表';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.id
  is '唯一编号';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.patient_id
  is '病人ID';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.shift_date
  is '交班日期';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.shift_operator
  is '交班人(逗号分隔)';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.shift_status
  is '交班状态(0：未交班 1：已交班 )';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.schedule_no
  is '班次编号';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.bed_doctor
  is '管床医生';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.charge_doctor
  is '主管医生';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.creator
  is '创建人';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.create_time
  is '创建时间';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.modifier
  is '修改人';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.modify_time
  is '修改时间';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.dignose
  is '诊断';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.bed_no
  is '病床NO';
comment on column WII_ICU_DOCTOR_SHIFT_OPERATION.ward_code
  is '病区号';

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
  is '病人ID';
comment on column WII_ICU_PATIENT_SHIFT.shift_date
  is '交班日期';
comment on column WII_ICU_PATIENT_SHIFT.shift_schedule_id
  is '交班班次编号';
comment on column WII_ICU_PATIENT_SHIFT.shift_operator
  is '交班人';
comment on column WII_ICU_PATIENT_SHIFT.shift_time
  is '交班时间';
comment on column WII_ICU_PATIENT_SHIFT.duty_operator
  is '接班人';
comment on column WII_ICU_PATIENT_SHIFT.duty_time
  is '接班时间';
comment on column WII_ICU_PATIENT_SHIFT.shift_status
  is '交班状态(0：未交班 1：已交班 2：接班中 3：已接班)';
comment on column WII_ICU_PATIENT_SHIFT.environment
  is '环境交接';
comment on column WII_ICU_PATIENT_SHIFT.basic_info
  is '基本信息交接';
comment on column WII_ICU_PATIENT_SHIFT.basic_info_memo
  is '基本信息交接备注';
comment on column WII_ICU_PATIENT_SHIFT.vital_signs
  is '生命体征';
comment on column WII_ICU_PATIENT_SHIFT.vital_signs_memo
  is '生命体征接班备注';
comment on column WII_ICU_PATIENT_SHIFT.important_condition
  is '重点病情';
comment on column WII_ICU_PATIENT_SHIFT.important_condition_memo
  is '重点病情接班备注';
comment on column WII_ICU_PATIENT_SHIFT.main_treatment
  is '主要治疗/特殊事件';
comment on column WII_ICU_PATIENT_SHIFT.main_treatment_memo
  is '主要治疗/特殊事件接班备注';
comment on column WII_ICU_PATIENT_SHIFT.nursing_points
  is '护理要点';
comment on column WII_ICU_PATIENT_SHIFT.nursing_points_memo
  is '护理要点接班备注';
comment on column WII_ICU_PATIENT_SHIFT.lab_exam_info
  is '检查检验及异常指标';
comment on column WII_ICU_PATIENT_SHIFT.lab_exam_info_memo
  is '检查检验及异常指标接班备注';
comment on column WII_ICU_PATIENT_SHIFT.special_medical
  is '特殊用药';
comment on column WII_ICU_PATIENT_SHIFT.special_medical_memo
  is '特殊用药接班备注';
comment on column WII_ICU_PATIENT_SHIFT.memo
  is '备注';
comment on column WII_ICU_PATIENT_SHIFT.creator
  is '创建人';
comment on column WII_ICU_PATIENT_SHIFT.create_time
  is '创建时间';
comment on column WII_ICU_PATIENT_SHIFT.duty_schedule_id
  is '接班班次编号';
comment on column WII_ICU_PATIENT_SHIFT.environment_memo
  is '环境交接交班备注（结构化数据）';
comment on column WII_ICU_PATIENT_SHIFT.special_monitoring
  is '特殊检测';
comment on column WII_ICU_PATIENT_SHIFT.special_monitoring_memo
  is '特殊检测备注';
comment on column WII_ICU_PATIENT_SHIFT.catheter_info
  is '导管情况';
comment on column WII_ICU_PATIENT_SHIFT.catheter_info_memo
  is '导管情况备注';
comment on column WII_ICU_PATIENT_SHIFT.unique_id
  is '物理唯一ID';
comment on column WII_ICU_PATIENT_SHIFT.environment_succe_memo
  is '环境交接接班备注（结构化数据）';
comment on column WII_ICU_PATIENT_SHIFT.lab_exam_info_succe_memo
  is '检查检验及异常指标交班备注';
comment on column WII_ICU_PATIENT_SHIFT.main_treatment_succe_memo
  is '主要治疗/特殊事件接班备注';
comment on column WII_ICU_PATIENT_SHIFT.special_medical_succe_memo
  is '特殊用药接班备注';
comment on column WII_ICU_PATIENT_SHIFT.nursing_points_succe_memo
  is '护理要点接班备注';
comment on column WII_ICU_PATIENT_SHIFT.important_condition_succe_memo
  is '重点病情接班备注';
comment on column WII_ICU_PATIENT_SHIFT.catheter_info_succe_memo
  is '导管情况接班备注';
comment on column WII_ICU_PATIENT_SHIFT.special_monitoring_succe_memo
  is '特殊检测接班备注';
comment on column WII_ICU_PATIENT_SHIFT.vital_signs_succe_memo
  is '生命体征接班备注';
comment on column WII_ICU_PATIENT_SHIFT.teacher
  is '带教老师';
comment on column WII_ICU_PATIENT_SHIFT.shift_times
  is '班次内交班次数';
comment on column WII_ICU_PATIENT_SHIFT.start_order
  is '开始医嘱';
comment on column WII_ICU_PATIENT_SHIFT.start_order_memo
  is '开始医嘱备注';
comment on column WII_ICU_PATIENT_SHIFT.stop_order
  is '停止医嘱';
comment on column WII_ICU_PATIENT_SHIFT.stop_order_memo
  is '停止医嘱备注';
comment on column WII_ICU_PATIENT_SHIFT.treatment_plan
  is '诊疗计划';
comment on column WII_ICU_PATIENT_SHIFT.treatment_plan_memo
  is '诊疗计划备注';
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
  is '病人id
';
comment on column WII_INFECTION_STATISTICS.infection_date
  is '感染日期
';
comment on column WII_INFECTION_STATISTICS.infection_part
  is '感染部位
';
comment on column WII_INFECTION_STATISTICS.infection_diagnose
  is '感染诊断
';
comment on column WII_INFECTION_STATISTICS.nosophyte_check
  is '病原菌检查
';
comment on column WII_INFECTION_STATISTICS.nosophyte_name
  is '病原菌名称
';
comment on column WII_INFECTION_STATISTICS.create_time
  is '创建时间
';
comment on column WII_INFECTION_STATISTICS.creator
  is '创建人
';
comment on column WII_INFECTION_STATISTICS.modifier
  is '修改人
';
comment on column WII_INFECTION_STATISTICS.modify_time
  is '修改时间
';
comment on column WII_INFECTION_STATISTICS.update_date
  is '上报日期';
comment on column WII_INFECTION_STATISTICS.assess_id
  is '评估ID
';
comment on column WII_INFECTION_STATISTICS.unique_id
  is '物理唯一ID';

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
  is '感染部位字典表';
comment on column WII_INFECT_PART_DIC.infect_part_code
  is '感染部位Code';
comment on column WII_INFECT_PART_DIC.infect_part_name_c
  is '感染部位名称';
comment on column WII_INFECT_PART_DIC.input_code
  is '存储
输入首字母(快捷输入）';
comment on column WII_INFECT_PART_DIC.memo
  is '备注（特点描述）';
comment on column WII_INFECT_PART_DIC.valid
  is '有效性（0-无效，1-有效）';
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
  is '自增Id';
comment on column WII_INFUSION_CIRCUIT.patient_id
  is '病人Id  ';
comment on column WII_INFUSION_CIRCUIT.order_no
  is '医嘱编号  ';
comment on column WII_INFUSION_CIRCUIT.order_sub_no
  is '医嘱子编号  ';
comment on column WII_INFUSION_CIRCUIT.default_time
  is '默认执行时间  ';
comment on column WII_INFUSION_CIRCUIT.circuit_time
  is '巡回时间  ';
comment on column WII_INFUSION_CIRCUIT.status
  is '状态   0输液中，1暂停，2 完成  ';
comment on column WII_INFUSION_CIRCUIT.drugnames
  is '药品名称  ';
comment on column WII_INFUSION_CIRCUIT.speed
  is '流速  ';
comment on column WII_INFUSION_CIRCUIT.speed_unit
  is '流速单位';
comment on column WII_INFUSION_CIRCUIT.puncture_place
  is '穿刺部位';
comment on column WII_INFUSION_CIRCUIT.untoward_effect
  is '不良反应 与wii_general_dic表Circuit_Type关联  ';
comment on column WII_INFUSION_CIRCUIT.memo
  is '备注';
comment on column WII_INFUSION_CIRCUIT.circuitor
  is '巡视人';
comment on column WII_INFUSION_CIRCUIT.create_time
  is '创建时间';
comment on column WII_INFUSION_CIRCUIT.creator
  is '创建人';
comment on column WII_INFUSION_CIRCUIT.modify_time
  is '修改时间';
comment on column WII_INFUSION_CIRCUIT.modifier
  is '修改人';
comment on column WII_INFUSION_CIRCUIT.unique_id
  is '物理唯一Id';

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
  is '知识类别表';
comment on column WII_KMS_CATEGORY.category_id
  is '类别编号';
comment on column WII_KMS_CATEGORY.category_name
  is '类别名称';
comment on column WII_KMS_CATEGORY.create_time
  is '创建时间';
comment on column WII_KMS_CATEGORY.creator
  is '创建人';
comment on column WII_KMS_CATEGORY.modify_time
  is '修改时间';
comment on column WII_KMS_CATEGORY.modifier
  is '修改人';
comment on column WII_KMS_CATEGORY.category_roles
  is '哪些角色关注这个类别';
comment on column WII_KMS_CATEGORY.unique_id
  is '物理唯一ID';

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
  is '知识类别项目表';
comment on column WII_KMS_CATEGORY_ITEM.category_item_id
  is '类别项目编号';
comment on column WII_KMS_CATEGORY_ITEM.category_id
  is '所属类别编号';
comment on column WII_KMS_CATEGORY_ITEM.category_item_name
  is '类别项目名称';
comment on column WII_KMS_CATEGORY_ITEM.category_item_parent_id
  is '父类别项目编号';
comment on column WII_KMS_CATEGORY_ITEM.create_time
  is '创建时间';
comment on column WII_KMS_CATEGORY_ITEM.creator
  is '创建人';
comment on column WII_KMS_CATEGORY_ITEM.modify_time
  is '修改时间';
comment on column WII_KMS_CATEGORY_ITEM.modifier
  is '修改人';
comment on column WII_KMS_CATEGORY_ITEM.unique_id
  is '物理唯一ID';
comment on column WII_KMS_CATEGORY_ITEM.category_item_code
  is '菜单编码';

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
  is '用户条目收藏表';
comment on column WII_KMS_KNOWLEDGE_FAVORIT.user_id
  is '登陆用户ID';
comment on column WII_KMS_KNOWLEDGE_FAVORIT.knowledge_id
  is '收藏的条目ID';
comment on column WII_KMS_KNOWLEDGE_FAVORIT.create_time
  is '创建时间';
comment on column WII_KMS_KNOWLEDGE_FAVORIT.creator
  is '创建人';

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
  is '知识条目表';
comment on column WII_KMS_KNOWLEDGE_ITEM.knowledge_id
  is '知识条目编号';
comment on column WII_KMS_KNOWLEDGE_ITEM.knowledge_title
  is '知识条目标题';
comment on column WII_KMS_KNOWLEDGE_ITEM.knowledge_version
  is '知识条目版本';
comment on column WII_KMS_KNOWLEDGE_ITEM.knowledge_publish_status
  is '0：保存状态，1：提交状态';
comment on column WII_KMS_KNOWLEDGE_ITEM.knowledge_keywords
  is '知识条目关键字';
comment on column WII_KMS_KNOWLEDGE_ITEM.knowledge_author
  is '知识条目作者';
comment on column WII_KMS_KNOWLEDGE_ITEM.category_item_ids
  is '知识文档所属分类列表';
comment on column WII_KMS_KNOWLEDGE_ITEM.knowledge_type
  is '文档类型（富文本、PDF、WORD）';
comment on column WII_KMS_KNOWLEDGE_ITEM.knowledge_desp
  is '知识条目简述';
comment on column WII_KMS_KNOWLEDGE_ITEM.knowledge_content
  is '知识条目富文本内容';
comment on column WII_KMS_KNOWLEDGE_ITEM.knowledge_url
  is '上传文件关联地址';
comment on column WII_KMS_KNOWLEDGE_ITEM.create_time
  is '创建时间';
comment on column WII_KMS_KNOWLEDGE_ITEM.creator
  is '创建人';
comment on column WII_KMS_KNOWLEDGE_ITEM.modify_time
  is '修改时间';
comment on column WII_KMS_KNOWLEDGE_ITEM.modifier
  is '修改人';
comment on column WII_KMS_KNOWLEDGE_ITEM.unique_id
  is '物理唯一ID';

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
  is '字典名称';
comment on column WII_LAB_GENERAL_DIC.item_code
  is '项目编码';
comment on column WII_LAB_GENERAL_DIC.items_name
  is '项目名称';
comment on column WII_LAB_GENERAL_DIC.input_code
  is '输入首字母(快捷输入）';
comment on column WII_LAB_GENERAL_DIC.memo
  is '备注';

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
  is '检查检验参数组字典';
comment on column WII_LAB_GROUP_DIC.exam_group_no
  is '自增长ID
';
comment on column WII_LAB_GROUP_DIC.exam_group_name
  is '参数组名称
';
comment on column WII_LAB_GROUP_DIC.belong_type
  is '属于分类
';
comment on column WII_LAB_GROUP_DIC.his_order_name
  is 'HIS名称
';
comment on column WII_LAB_GROUP_DIC.type_name
  is '参数组分类';
comment on column WII_LAB_GROUP_DIC.lab_group_code
  is '参数组CODE
';
comment on column WII_LAB_GROUP_DIC.special_code
  is '专科Code';

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
  is '检查检验组别参数对应表';
comment on column WII_LAB_GROUP_ITEMMAPPING_DIC.lab_group_code
  is '参数组编码';
comment on column WII_LAB_GROUP_ITEMMAPPING_DIC.item_code
  is '参数项目在LIS中的编码';
comment on column WII_LAB_GROUP_ITEMMAPPING_DIC.item_originfrom
  is '数据来源';
comment on column WII_LAB_GROUP_ITEMMAPPING_DIC.draw_icon
  is '显示情况（0-散点、1-连接折线、2-连线曲线、3-柱形图、4-数值。。。等）';
comment on column WII_LAB_GROUP_ITEMMAPPING_DIC.memo
  is '备注';
comment on column WII_LAB_GROUP_ITEMMAPPING_DIC.input_code
  is '首字母';
comment on column WII_LAB_GROUP_ITEMMAPPING_DIC.normal_range
  is '正常值范围';
comment on column WII_LAB_GROUP_ITEMMAPPING_DIC.parent_item_code
  is '所属检验项编号';
comment on column WII_LAB_GROUP_ITEMMAPPING_DIC.item_name
  is '参数项目名称';
comment on column WII_LAB_GROUP_ITEMMAPPING_DIC.parent_item_name
  is '所属检验项名称';

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
  is '设备编号';
comment on column WII_LAB_ITEM_DIC.his_orderid
  is 'HIS医嘱代码';
comment on column WII_LAB_ITEM_DIC.his_ordername
  is 'HIS医嘱名称';
comment on column WII_LAB_ITEM_DIC.wii_marker
  is 'WII系统常用标识';
comment on column WII_LAB_ITEM_DIC.item_code
  is '检验项目代码';
comment on column WII_LAB_ITEM_DIC.item_name
  is '检验项目名称';
comment on column WII_LAB_ITEM_DIC.item_name_e
  is '检验项目英文名称';
comment on column WII_LAB_ITEM_DIC.loinc_id
  is '检验项目LOINC代码';
comment on column WII_LAB_ITEM_DIC.unit
  is '正常值单位';
comment on column WII_LAB_ITEM_DIC.normal_range
  is '正常值范围';
comment on column WII_LAB_ITEM_DIC.lower_limit
  is '正常值下限(不受其他条件影响的正常值，如果受其他条件影响，则为空。对固定正常值，与正常值上限相同。对不限制下限，为空。)';
comment on column WII_LAB_ITEM_DIC.upper_limit
  is '正常值上限(不受其他条件影响的正常值，如果受其他条件影响，则为空。对固定正常值，与正常值下限相同。对不限制上限，为空。)';
comment on column WII_LAB_ITEM_DIC.result_type
  is '结果类型(反应标注、阴阳弱、药敏、描述等)';
comment on column WII_LAB_ITEM_DIC.notes
  is '正常值备注';
comment on column WII_LAB_ITEM_DIC.default_value
  is '默认值(当没有值时的系统自动生成数据)';
comment on column WII_LAB_ITEM_DIC.input_code
  is '快捷输入码';

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
  is 'HIS医嘱代码';
comment on column WII_LAB_XPY_DIC.his_ordername
  is 'HIS医嘱名称';

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
  is '细菌编码';
comment on column WII_LAS_GM_GERM.whonetid
  is 'WHONET编码';
comment on column WII_LAS_GM_GERM.chnname
  is '细菌中文名';
comment on column WII_LAS_GM_GERM.cshortname
  is '中文名缩写';
comment on column WII_LAS_GM_GERM.engname
  is '细菌英文名';
comment on column WII_LAS_GM_GERM.eshortname
  is '英文名缩写';
comment on column WII_LAS_GM_GERM.spellcode
  is '拼音码';
comment on column WII_LAS_GM_GERM.wbcode
  is '五笔码';
comment on column WII_LAS_GM_GERM.showorder
  is '排列序号';
comment on column WII_LAS_GM_GERM.memo
  is '备注信息';
comment on column WII_LAS_GM_GERM.isuse
  is '是否可用(1/0)';
comment on column WII_LAS_GM_GERM.gram
  is '革兰氏属性';
comment on column WII_LAS_GM_GERM.whonetgram
  is 'WHONET革兰氏属性';
comment on column WII_LAS_GM_GERM.source
  is '来源(M:梅里埃,W:WHONET,D:用户自定义)';
comment on column WII_LAS_GM_GERM.germgroupid
  is '细菌分组编码';
comment on column WII_LAS_GM_GERM.germgroupname
  is '细菌分组名称';
comment on column WII_LAS_GM_GERM.unique_id
  is '物理唯一ID';
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
  is '条码号';
comment on column WII_LAS_GM_RESULTANTI.testdate
  is '检验日期';
comment on column WII_LAS_GM_RESULTANTI.machineid
  is '仪器ID';
comment on column WII_LAS_GM_RESULTANTI.sampleid
  is '样本号';
comment on column WII_LAS_GM_RESULTANTI.germid
  is '细菌编码';
comment on column WII_LAS_GM_RESULTANTI.resulttime
  is '结果时间';
comment on column WII_LAS_GM_RESULTANTI.antiid
  is '抗生素编码';
comment on column WII_LAS_GM_RESULTANTI.antiname
  is '抗生素名称';
comment on column WII_LAS_GM_RESULTANTI.result
  is '结果';
comment on column WII_LAS_GM_RESULTANTI.ranger
  is '参考范围R(耐药)';
comment on column WII_LAS_GM_RESULTANTI.unit
  is '单位';
comment on column WII_LAS_GM_RESULTANTI.flag
  is '结果标识(S R I  IB)';
comment on column WII_LAS_GM_RESULTANTI.memo
  is '备注信息';
comment on column WII_LAS_GM_RESULTANTI.machineresult
  is '仪器结果';
comment on column WII_LAS_GM_RESULTANTI.method
  is '实验方法(KB、MIC...)';
comment on column WII_LAS_GM_RESULTANTI.amendflag
  is '修正值(S R I IB)';
comment on column WII_LAS_GM_RESULTANTI.priority
  is '药品优先级(A,B,C,O,U)';
comment on column WII_LAS_GM_RESULTANTI.germseq
  is '细菌序列(从1开始)';
comment on column WII_LAS_GM_RESULTANTI.showorder
  is '显示顺序';
comment on column WII_LAS_GM_RESULTANTI.ranges
  is '参考范围S(敏感)';
comment on column WII_LAS_GM_RESULTANTI.rangei
  is '参考范围I(中介)';
comment on column WII_LAS_GM_RESULTANTI.unique_id
  is '物理唯一ID';
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
  is '检验日期';
comment on column WII_LAS_GM_SAMPLEREG.machineid
  is '仪器ID';
comment on column WII_LAS_GM_SAMPLEREG.sampleid
  is '样本号';
comment on column WII_LAS_GM_SAMPLEREG.barcode
  is '条码号';
comment on column WII_LAS_GM_SAMPLEREG.patienttype
  is '患者类型';
comment on column WII_LAS_GM_SAMPLEREG.patientid
  is '患者编码';
comment on column WII_LAS_GM_SAMPLEREG.patientseq
  is '患者流水号';
comment on column WII_LAS_GM_SAMPLEREG.patientname
  is '患者姓名';
comment on column WII_LAS_GM_SAMPLEREG.patientsex
  is '患者性别';
comment on column WII_LAS_GM_SAMPLEREG.patientage
  is '患者年龄';
comment on column WII_LAS_GM_SAMPLEREG.patientageunit
  is '年龄单位';
comment on column WII_LAS_GM_SAMPLEREG.patienttel
  is '患者电话';
comment on column WII_LAS_GM_SAMPLEREG.patientbedno
  is '患者床位号';
comment on column WII_LAS_GM_SAMPLEREG.patientidenno
  is '患者身份证';
comment on column WII_LAS_GM_SAMPLEREG.patientrace
  is '患者民族';
comment on column WII_LAS_GM_SAMPLEREG.patientsite
  is '患者居住地';
comment on column WII_LAS_GM_SAMPLEREG.execsqn
  is '执行单号';
comment on column WII_LAS_GM_SAMPLEREG.emc
  is '急诊标识';
comment on column WII_LAS_GM_SAMPLEREG.hisitemidlist
  is '收费项目编码(15,171,F0001)';
comment on column WII_LAS_GM_SAMPLEREG.hisitemnamelist
  is '收费项目名称列表';
comment on column WII_LAS_GM_SAMPLEREG.hisitemprice
  is '收费项目价格';
comment on column WII_LAS_GM_SAMPLEREG.doctorid
  is '开立医生编码';
comment on column WII_LAS_GM_SAMPLEREG.doctorname
  is '开立医生姓名';
comment on column WII_LAS_GM_SAMPLEREG.deptid
  is '开立科室编码';
comment on column WII_LAS_GM_SAMPLEREG.deptname
  is '开立科室名称';
comment on column WII_LAS_GM_SAMPLEREG.ordertime
  is '开立时间';
comment on column WII_LAS_GM_SAMPLEREG.execdeptid
  is '执行科室编码';
comment on column WII_LAS_GM_SAMPLEREG.execdeptname
  is '执行科室名称';
comment on column WII_LAS_GM_SAMPLEREG.wardid
  is '患者病区编码';
comment on column WII_LAS_GM_SAMPLEREG.wardname
  is '患者病区名称';
comment on column WII_LAS_GM_SAMPLEREG.sampletype
  is '样本类型';
comment on column WII_LAS_GM_SAMPLEREG.samplestate
  is '标本状态';
comment on column WII_LAS_GM_SAMPLEREG.sampleposition
  is '标本采集部位';
comment on column WII_LAS_GM_SAMPLEREG.diagnosis
  is '医生诊断';
comment on column WII_LAS_GM_SAMPLEREG.confirmstate
  is '核准标识.0:未核准,1:核准,2:取消核准,3:待查.4.初审;5:封存';
comment on column WII_LAS_GM_SAMPLEREG.printstate
  is '打印标识:0:未打印,1:已打印';
comment on column WII_LAS_GM_SAMPLEREG.alertstate
  is '危急值状态:0:否,1:是';
comment on column WII_LAS_GM_SAMPLEREG.state
  is '1 患者信息来源;2 费用状态;3 是否为智能核准(自动核准);4 信息发送标识(可以考虑为短信平台提供);5 双向系统复查标识;6 条码是否人工组合;7 外部系统数据已处理标识';
comment on column WII_LAS_GM_SAMPLEREG.testtype
  is '检验类型';
comment on column WII_LAS_GM_SAMPLEREG.groupid
  is '小组编码';
comment on column WII_LAS_GM_SAMPLEREG.nurseid
  is '采样人编码';
comment on column WII_LAS_GM_SAMPLEREG.nursename
  is '采样人名称';
comment on column WII_LAS_GM_SAMPLEREG.sampletime
  is '采样时间';
comment on column WII_LAS_GM_SAMPLEREG.senderid
  is '送检员编码';
comment on column WII_LAS_GM_SAMPLEREG.sendername
  is '送检员名称';
comment on column WII_LAS_GM_SAMPLEREG.sendtime
  is '送检员接收时间';
comment on column WII_LAS_GM_SAMPLEREG.sendformid
  is '送检单编码';
comment on column WII_LAS_GM_SAMPLEREG.inceptorid
  is '检验科接收人编码';
comment on column WII_LAS_GM_SAMPLEREG.inceptorname
  is '检验科接收人姓名';
comment on column WII_LAS_GM_SAMPLEREG.incepttime
  is '检验科接收时间';
comment on column WII_LAS_GM_SAMPLEREG.accepterid
  is '标本核收者编码';
comment on column WII_LAS_GM_SAMPLEREG.acceptername
  is '标本核收者名称';
comment on column WII_LAS_GM_SAMPLEREG.accepttime
  is '标本核收时间';
comment on column WII_LAS_GM_SAMPLEREG.approverid
  is '标本核准者编码';
comment on column WII_LAS_GM_SAMPLEREG.approvername
  is '标本核准者姓名';
comment on column WII_LAS_GM_SAMPLEREG.approvetime
  is '标本核准时间';
comment on column WII_LAS_GM_SAMPLEREG.memo
  is '备注';
comment on column WII_LAS_GM_SAMPLEREG.printedtime
  is '检验单打印时间';
comment on column WII_LAS_GM_SAMPLEREG.printerid
  is '检验单打印者编码';
comment on column WII_LAS_GM_SAMPLEREG.printername
  is '检验单打印者姓名';
comment on column WII_LAS_GM_SAMPLEREG.hospitalid
  is '医院编码(名称)';
comment on column WII_LAS_GM_SAMPLEREG.resulttype
  is '结果类型8位 1短报告(0无1有) 2药敏 3过程记录 4血培养';
comment on column WII_LAS_GM_SAMPLEREG.lismemo
  is 'LIS备注信息';
comment on column WII_LAS_GM_SAMPLEREG.isinoculated
  is '是否已经接种(0:未接种,1:已接种)';
comment on column WII_LAS_GM_SAMPLEREG.birthday
  is '出生日期(YYYY-MM-DD)';
comment on column WII_LAS_GM_SAMPLEREG.isuploadmyla
  is '是否已上传到MYLA(0:未上传，1:已上传)';
comment on column WII_LAS_GM_SAMPLEREG.isolasampletype
  is '接种仪样本编码';
comment on column WII_LAS_GM_SAMPLEREG.isolaplate
  is '接种仪平板组合';
comment on column WII_LAS_GM_SAMPLEREG.bottlebarcode
  is '培养瓶编码';
comment on column WII_LAS_GM_SAMPLEREG.isgcp
  is '是否药物临床试验(0:否,1:是)';
comment on column WII_LAS_GM_SAMPLEREG.ishighrisk
  is '是否高危患者';
comment on column WII_LAS_GM_SAMPLEREG.barprinttime
  is '条码打印时间';
comment on column WII_LAS_GM_SAMPLEREG.samplegetname
  is '采样人姓名';
comment on column WII_LAS_GM_SAMPLEREG.samplegetid
  is '采样人编码';
comment on column WII_LAS_GM_SAMPLEREG.documenttime
  is '归档时间(初审时间)';
comment on column WII_LAS_GM_SAMPLEREG.documentid
  is '归档人ID';
comment on column WII_LAS_GM_SAMPLEREG.documentname
  is '归档人姓名';
comment on column WII_LAS_GM_SAMPLEREG.reporttime
  is '预计报告时间';
comment on column WII_LAS_GM_SAMPLEREG.unique_id
  is '物理唯一ID';
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
  is '药品编码';
comment on column WII_MAPPING_DIC.pharm_name
  is '药品中文名称';
comment on column WII_MAPPING_DIC.med_route_ciscode
  is '给药途径';
comment on column WII_MAPPING_DIC.unit
  is '剂量单位';
comment on column WII_MAPPING_DIC.pack_quan
  is '包装规格剂量';
comment on column WII_MAPPING_DIC.input_code
  is '输入首字母(快捷输入）';
comment on column WII_MAPPING_DIC.memo
  is '备注';
comment on column WII_MAPPING_DIC.valid
  is '有效性（0_无效，1_有效）';
comment on column WII_MAPPING_DIC.pharmacy_code
  is 'HIS药品编码';
comment on column WII_MAPPING_DIC.pharmacy_chemname
  is 'HIS药品化学名称';
comment on column WII_MAPPING_DIC.pharmacy_goodsname
  is 'HIS药品商品名称';
comment on column WII_MAPPING_DIC.dic_code
  is '字典编码';
comment on column WII_MAPPING_DIC.dic_name
  is '字典名称';
comment on column WII_MAPPING_DIC.unique_id
  is '物理唯一ID';

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
  is '关键字';
comment on column WII_MAPPING_KEY.dic_code
  is '字典编码';
comment on column WII_MAPPING_KEY.dic_name
  is '字典名称';
comment on column WII_MAPPING_KEY.memo
  is '备注';
comment on column WII_MAPPING_KEY.create_time
  is '创建时间';
comment on column WII_MAPPING_KEY.creator
  is '创建人';
comment on column WII_MAPPING_KEY.key_code
  is '编码';

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
  is '关键字';
comment on column WII_MAPPING_KEY_CONDITION.dic_code
  is '字典编码';
comment on column WII_MAPPING_KEY_CONDITION.symbol
  is '1相等,2不相等,3包含,4不包含';
comment on column WII_MAPPING_KEY_CONDITION.field
  is '字段(1 化学名 2商品名 3规格)';
comment on column WII_MAPPING_KEY_CONDITION.content
  is '内容';
comment on column WII_MAPPING_KEY_CONDITION.memo
  is '备注';
comment on column WII_MAPPING_KEY_CONDITION.create_time
  is '创建时间';
comment on column WII_MAPPING_KEY_CONDITION.creator
  is '创建人';
comment on column WII_MAPPING_KEY_CONDITION.con_code
  is '条件编码';

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
  is '患者编号';
comment on column WII_MEDICAL_EVENT.event_type
  is '事件类型';
comment on column WII_MEDICAL_EVENT.event_content
  is '内容';
comment on column WII_MEDICAL_EVENT.operator
  is '负责人';
comment on column WII_MEDICAL_EVENT.operate_time
  is '时间';
comment on column WII_MEDICAL_EVENT.creator
  is '创建人';
comment on column WII_MEDICAL_EVENT.create_time
  is '创建时间';
comment on column WII_MEDICAL_EVENT.modifier
  is '修改人';
comment on column WII_MEDICAL_EVENT.modify_time
  is '修改时间';
comment on column WII_MEDICAL_EVENT.unique_id
  is '物理唯一id';

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
  is '流水号';
comment on column WII_NAST_SATISFACTION.name
  is '名称';
comment on column WII_NAST_SATISFACTION.max_score
  is '最大分值';
comment on column WII_NAST_SATISFACTION.create_time
  is '创建时间';
comment on column WII_NAST_SATISFACTION.creator
  is '创建人';
comment on column WII_NAST_SATISFACTION.modifier
  is '修改人';
comment on column WII_NAST_SATISFACTION.modify_time
  is '修改时间';
comment on column WII_NAST_SATISFACTION.unique_id
  is '物理唯一ID';

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
  is '患者ID';
comment on column WII_NAST_SATISFACTION_SCORE.satisfaction_no
  is '配置流水号';
comment on column WII_NAST_SATISFACTION_SCORE.score
  is '分值';
comment on column WII_NAST_SATISFACTION_SCORE.create_time
  is '创建时间';
comment on column WII_NAST_SATISFACTION_SCORE.creator
  is '创建人';
comment on column WII_NAST_SATISFACTION_SCORE.modifier
  is '修改人';
comment on column WII_NAST_SATISFACTION_SCORE.modify_time
  is '修改时间';
comment on column WII_NAST_SATISFACTION_SCORE.month
  is '月份';
comment on column WII_NAST_SATISFACTION_SCORE.unique_id
  is '物理唯一ID';

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
  is '医院感染记录表';
comment on column WII_NOSOCOMIAL_INFECTION.inpatient_visitid
  is '住院活动号';
comment on column WII_NOSOCOMIAL_INFECTION.specimen_name
  is '标本名称
';
comment on column WII_NOSOCOMIAL_INFECTION.infect_time
  is '感染时间
';
comment on column WII_NOSOCOMIAL_INFECTION.etiological_examination
  is '病原学检查
';
comment on column WII_NOSOCOMIAL_INFECTION.predisposing_factor
  is '易感因素
';
comment on column WII_NOSOCOMIAL_INFECTION.infect_disgnose
  is '感染诊断
';
comment on column WII_NOSOCOMIAL_INFECTION.inhospital_disgnose
  is '入院诊断
';
comment on column WII_NOSOCOMIAL_INFECTION.creator
  is '创建人
';
comment on column WII_NOSOCOMIAL_INFECTION.create_time
  is '创建时间
';
comment on column WII_NOSOCOMIAL_INFECTION.modifier
  is '修改人
';
comment on column WII_NOSOCOMIAL_INFECTION.modify_time
  is '修改时间
';
comment on column WII_NOSOCOMIAL_INFECTION.unique_id
  is '物理唯一ID';
comment on column WII_NOSOCOMIAL_INFECTION.patient_id
  is '患者编号';
comment on column WII_NOSOCOMIAL_INFECTION.infect_diagnose_type
  is '感染诊断类型';
comment on column WII_NOSOCOMIAL_INFECTION.infect_status
  is '感染状态（0：疑似  1：确认）';

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
  is '流水号';
comment on column WII_NOTEPAD.timepoint
  is '时间点';
comment on column WII_NOTEPAD.operator
  is '操作人';
comment on column WII_NOTEPAD.content
  is '内容';
comment on column WII_NOTEPAD.type
  is '类型';
comment on column WII_NOTEPAD.creator
  is '创建人';
comment on column WII_NOTEPAD.create_time
  is '创建时间';
comment on column WII_NOTEPAD.modifier
  is '修改人';
comment on column WII_NOTEPAD.modify_time
  is '修改时间';
comment on column WII_NOTEPAD.unique_id
  is '物理唯一ID';

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
  is '公告屏幕配置管理表';
comment on column WII_NOTIFY_SCREEN_CONFIG.screen_id
  is '屏幕ID';
comment on column WII_NOTIFY_SCREEN_CONFIG.ip_address
  is '屏幕IP地址';
comment on column WII_NOTIFY_SCREEN_CONFIG.descption
  is '公告屏幕说明';
comment on column WII_NOTIFY_SCREEN_CONFIG.templete_id
  is '对应模板编号';
comment on column WII_NOTIFY_SCREEN_CONFIG.time_freq
  is '刷新频率';
comment on column WII_NOTIFY_SCREEN_CONFIG.area
  is '公告所在区域编号';
comment on column WII_NOTIFY_SCREEN_CONFIG.screen_content
  is '公告屏幕内容';
comment on column WII_NOTIFY_SCREEN_CONFIG.last_date
  is '上次读取时间';
comment on column WII_NOTIFY_SCREEN_CONFIG.templete_parms
  is '模板传入参数 如有多个,逗号分隔后台自行处理';
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
  is '展示页面表';
comment on column WII_NOTIFY_SCREEN_TEMPLETE.templete_id
  is '页面ID';
comment on column WII_NOTIFY_SCREEN_TEMPLETE.templete_html_soruce
  is '页面代码内容(Html形式)';
comment on column WII_NOTIFY_SCREEN_TEMPLETE.templete_descption
  is '页面描述';
comment on column WII_NOTIFY_SCREEN_TEMPLETE.templete_parms
  is '模板传入参数';
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
  is '病人id';
comment on column WII_NS_NUTRI_RECORD.inward_visitid
  is '入病区活动号';
comment on column WII_NS_NUTRI_RECORD.nutri_code
  is '编号';
comment on column WII_NS_NUTRI_RECORD.nutri_name
  is '名称';
comment on column WII_NS_NUTRI_RECORD.nutri_type
  is '药品类型，1:肠内,2:肠外,3:自制,4:非格式化医嘱';
comment on column WII_NS_NUTRI_RECORD.dosage
  is '药品一次使用剂量';
comment on column WII_NS_NUTRI_RECORD.kcal
  is '所含的能量值';
comment on column WII_NS_NUTRI_RECORD.lipid
  is '所含的脂肪';
comment on column WII_NS_NUTRI_RECORD.ch
  is '所含的碳水化合物/糖';
comment on column WII_NS_NUTRI_RECORD.nitrogen
  is '所含的氮';
comment on column WII_NS_NUTRI_RECORD.operator
  is '操作人';
comment on column WII_NS_NUTRI_RECORD.operate_time
  is '记录日期';
comment on column WII_NS_NUTRI_RECORD.creator
  is '创建人';
comment on column WII_NS_NUTRI_RECORD.create_time
  is '创建时间';
comment on column WII_NS_NUTRI_RECORD.modifier
  is '修改人';
comment on column WII_NS_NUTRI_RECORD.modify_time
  is '修改时间';
comment on column WII_NS_NUTRI_RECORD.unique_id
  is '物理唯一ID';

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
  is '病人id';
comment on column WII_NS_TARGET.inward_visitid
  is '入病区活动号';
comment on column WII_NS_TARGET.height
  is '身高';
comment on column WII_NS_TARGET.weight
  is '体重';
comment on column WII_NS_TARGET.target_kcal
  is '热卡量目标值';
comment on column WII_NS_TARGET.kcal
  is '千卡能量值';
comment on column WII_NS_TARGET.nitrogen
  is '氮目标值';
comment on column WII_NS_TARGET.ch
  is '碳水化合物/糖';
comment on column WII_NS_TARGET.lipid
  is '脂肪';
comment on column WII_NS_TARGET.operator
  is '记录人';
comment on column WII_NS_TARGET.operate_time
  is '记录日期';
comment on column WII_NS_TARGET.creator
  is '创建人';
comment on column WII_NS_TARGET.create_time
  is '创建时间';
comment on column WII_NS_TARGET.modifier
  is '修改人';
comment on column WII_NS_TARGET.modify_time
  is '修改时间';
comment on column WII_NS_TARGET.unique_id
  is '物理唯一ID';

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
  is '护理单元';
comment on column WII_NURSE_TEMPLETE.templete_code
  is '模板代码';
comment on column WII_NURSE_TEMPLETE.templete_name
  is '模板名称';
comment on column WII_NURSE_TEMPLETE.templete_desc
  is '模板内容';
comment on column WII_NURSE_TEMPLETE.input_code
  is '输入码';
comment on column WII_NURSE_TEMPLETE.templete_type
  is '模板类别（护理措施，出院小结，病情，医嘱等－－可以与模版关联）';
comment on column WII_NURSE_TEMPLETE.view_code
  is '显示编码';
comment on column WII_NURSE_TEMPLETE.is_common
  is '是否常用模版（1：常用）';
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
  is '护理等级（高度危险、中度危险、轻度危险、无危险）';
comment on column WII_NURSINGPLAN_ADVICE_DIC.nursing_advice
  is '护理建议';
comment on column WII_NURSINGPLAN_ADVICE_DIC.score_expression
  is '护理评分范围，数学表达式计算，x作代入值，如：
x<=12
x>=13<=14
x>=15<=17
x>=18';
comment on column WII_NURSINGPLAN_ADVICE_DIC.score_code
  is '评估编码';

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
  is '编号（根节点ID为0）';
comment on column WII_NURSINGPLAN_DIC.type
  is '类型(护理问题,护理目标,护理措施)';
comment on column WII_NURSINGPLAN_DIC.content
  is '内容';
comment on column WII_NURSINGPLAN_DIC.plan_source
  is '护理计划来源，0：护士，1：医生，默认值是0';

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
  is '护理问题';
comment on column WII_NURSINGPLAN_INFOHIERARCHY.target
  is '护理目标';
comment on column WII_NURSINGPLAN_INFOHIERARCHY.step
  is '护理措施';
comment on column WII_NURSINGPLAN_INFOHIERARCHY.creator
  is '创建人';
comment on column WII_NURSINGPLAN_INFOHIERARCHY.create_time
  is '创建时间';
comment on column WII_NURSINGPLAN_INFOHIERARCHY.unique_id
  is '物理唯一ID';
comment on column WII_NURSINGPLAN_INFOHIERARCHY.plan_source
  is '护理计划来源，0：护士，1：医生，默认值是0';

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
  is '评估ID
';
comment on column WII_NURSING_ASSESS_CONFIG.assess_name
  is '评估名称
';
comment on column WII_NURSING_ASSESS_CONFIG.module_id
  is '模块ID
';
comment on column WII_NURSING_ASSESS_CONFIG.module_items
  is 'JSON配置出该模块下的所有项目
';
comment on column WII_NURSING_ASSESS_CONFIG.memo
  is '备注
';
comment on column WII_NURSING_ASSESS_CONFIG.create_time
  is '创建时间
';
comment on column WII_NURSING_ASSESS_CONFIG.creator
  is '创建人
';
comment on column WII_NURSING_ASSESS_CONFIG.modify_time
  is '修改时间
';
comment on column WII_NURSING_ASSESS_CONFIG.modifier
  is '修改人
';
comment on column WII_NURSING_ASSESS_CONFIG.unique_id
  is '物理唯一id
';
comment on column WII_NURSING_ASSESS_CONFIG.special_code
  is '专科CODE';

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
  is '评估类型
';
comment on column WII_NURSING_ASSESS_ITEM_DIC.itemname
  is '评估类型名称
';
comment on column WII_NURSING_ASSESS_ITEM_DIC.valuetype
  is '取值类型
R 单选
T 文本
M 多选
RT 多选加文本
D 时间日期
L 多行文本 S特殊处理';
comment on column WII_NURSING_ASSESS_ITEM_DIC.valuerange
  is '取值范围
';
comment on column WII_NURSING_ASSESS_ITEM_DIC.module_id
  is '模块ID
';
comment on column WII_NURSING_ASSESS_ITEM_DIC.parent_itemkey
  is '父类评估类型
';
comment on column WII_NURSING_ASSESS_ITEM_DIC.memo
  is '备注
';
comment on column WII_NURSING_ASSESS_ITEM_DIC.unit
  is '单位或编码';

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
  is '模块ID
';
comment on column WII_NURSING_ASSESS_MODULE_DIC.module_name
  is '模块名称
';
comment on column WII_NURSING_ASSESS_MODULE_DIC.memo
  is '备注
';
comment on column WII_NURSING_ASSESS_MODULE_DIC.create_time
  is '创建时间
';
comment on column WII_NURSING_ASSESS_MODULE_DIC.creator
  is '创建人
';
comment on column WII_NURSING_ASSESS_MODULE_DIC.modify_time
  is '修改时间
';
comment on column WII_NURSING_ASSESS_MODULE_DIC.modifier
  is '修改人
';
comment on column WII_NURSING_ASSESS_MODULE_DIC.unique_id
  is '物理唯一id
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
  is '评分编号';
comment on column WII_NURSING_FREQUENCY.grade_code
  is '等级编号';
comment on column WII_NURSING_FREQUENCY.nursing_code
  is '护理项目编号';
comment on column WII_NURSING_FREQUENCY.frequency
  is '频率';
comment on column WII_NURSING_FREQUENCY.creator
  is '创建人';
comment on column WII_NURSING_FREQUENCY.create_time
  is '创建时间';
comment on column WII_NURSING_FREQUENCY.modifier
  is '修改人';
comment on column WII_NURSING_FREQUENCY.modify_time
  is '修改时间';
comment on column WII_NURSING_FREQUENCY.min_frequency
  is '频率最小值';
comment on column WII_NURSING_FREQUENCY.unique_id
  is '物理唯一ID';

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
  is '病人（编号）唯一标识';
comment on column WII_NURSING_MEMO.order_no
  is '医嘱序号 ';
comment on column WII_NURSING_MEMO.time_point
  is '护理措施时间点';
comment on column WII_NURSING_MEMO.nursing_type
  is '记录类别（护理措施，出院小结，病情，医嘱等－－可以与模版关联）';
comment on column WII_NURSING_MEMO.nursing_desc
  is '记录内容';
comment on column WII_NURSING_MEMO.special_flag
  is '特殊标示（例如：抢救等）';
comment on column WII_NURSING_MEMO.operator
  is '操作者';
comment on column WII_NURSING_MEMO.operate_time
  is '操作时间';
comment on column WII_NURSING_MEMO.creator
  is '创建人 ';
comment on column WII_NURSING_MEMO.create_time
  is '创建时间';
comment on column WII_NURSING_MEMO.verify
  is '审核人';
comment on column WII_NURSING_MEMO.verify_time
  is '审核时间';
comment on column WII_NURSING_MEMO.serial_number
  is '流水号';
comment on column WII_NURSING_MEMO.unique_id
  is '物理唯一ID';
comment on column WII_NURSING_MEMO.template_code
  is '模板编码';

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
  is '　病人（编号）唯一标识';
comment on column WII_NURSING_MEMO_CHANGE.order_no
  is '医嘱序号 ';
comment on column WII_NURSING_MEMO_CHANGE.time_point
  is '护理措施时间点';
comment on column WII_NURSING_MEMO_CHANGE.nursing_type
  is '记录类别（护理措施，出院小结，病情，医嘱等－－可以与模版关联）';
comment on column WII_NURSING_MEMO_CHANGE.nursing_desc
  is '记录内容';
comment on column WII_NURSING_MEMO_CHANGE.special_flag
  is '特殊标示（例如：抢救等）';
comment on column WII_NURSING_MEMO_CHANGE.operator
  is '　操作者';
comment on column WII_NURSING_MEMO_CHANGE.operate_time
  is '　操作时间';
comment on column WII_NURSING_MEMO_CHANGE.creator
  is '创建人 ';
comment on column WII_NURSING_MEMO_CHANGE.create_time
  is '创建时间';
comment on column WII_NURSING_MEMO_CHANGE.verify
  is '审核人';
comment on column WII_NURSING_MEMO_CHANGE.verify_time
  is '审核时间';
comment on column WII_NURSING_MEMO_CHANGE.modifier
  is '修改人';
comment on column WII_NURSING_MEMO_CHANGE.modify_time
  is '修改时间';
comment on column WII_NURSING_MEMO_CHANGE.serial_number
  is '流水号';
comment on column WII_NURSING_MEMO_CHANGE.change_type
  is '变更类型';
comment on column WII_NURSING_MEMO_CHANGE.is_verify
  is '是否已审核';
comment on column WII_NURSING_MEMO_CHANGE.unique_id
  is '物理唯一ID';
comment on column WII_NURSING_MEMO_CHANGE.template_code
  is '模板编码';

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
  is '患者编号
';
comment on column WII_NURSING_ORAL_CLEAN.clean_type
  is '清洁方式
';
comment on column WII_NURSING_ORAL_CLEAN.operator
  is '操作人
';
comment on column WII_NURSING_ORAL_CLEAN.operate_time
  is '操作时间
';
comment on column WII_NURSING_ORAL_CLEAN.creator
  is '创建人
';
comment on column WII_NURSING_ORAL_CLEAN.create_time
  is '创建时间
';
comment on column WII_NURSING_ORAL_CLEAN.modifier
  is '修改人
';
comment on column WII_NURSING_ORAL_CLEAN.modify_time
  is '修改时间
';
comment on column WII_NURSING_ORAL_CLEAN.unique_id
  is '物理唯一ID';

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
  is '口腔清洁评价表';
comment on column WII_NURSING_ORAL_CLEAN_ASSESS.patient_id
  is '患者编号
';
comment on column WII_NURSING_ORAL_CLEAN_ASSESS.operate_time
  is '操作时间
';
comment on column WII_NURSING_ORAL_CLEAN_ASSESS.result
  is '评价结果
';
comment on column WII_NURSING_ORAL_CLEAN_ASSESS.operator
  is '操作人
';
comment on column WII_NURSING_ORAL_CLEAN_ASSESS.creator
  is '创建人
';
comment on column WII_NURSING_ORAL_CLEAN_ASSESS.create_time
  is '创建时间
';
comment on column WII_NURSING_ORAL_CLEAN_ASSESS.modifier
  is '修改人
';
comment on column WII_NURSING_ORAL_CLEAN_ASSESS.modify_time
  is '修改时间
';
comment on column WII_NURSING_ORAL_CLEAN_ASSESS.unique_id
  is '物理唯一ID';

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
  is '自增长编号';
comment on column WII_NURSING_PLAN.patient_id
  is '患者编号';
comment on column WII_NURSING_PLAN.inward_visitid
  is '入病区活动号';
comment on column WII_NURSING_PLAN.question
  is '护理问题编号（以逗号分隔）';
comment on column WII_NURSING_PLAN.question_content
  is '护理问题内容（JSON）';
comment on column WII_NURSING_PLAN.memo
  is '护理措施编号（以逗号分隔）';
comment on column WII_NURSING_PLAN.memo_content
  is '护理措施内容（JSON）';
comment on column WII_NURSING_PLAN.target
  is '预期目标编号（以逗号分隔）';
comment on column WII_NURSING_PLAN.target_content
  is '预期目标内容（JSON）';
comment on column WII_NURSING_PLAN.start_operator
  is '开始人员';
comment on column WII_NURSING_PLAN.start_time
  is '开始时间';
comment on column WII_NURSING_PLAN.stop_operator
  is '结束人员';
comment on column WII_NURSING_PLAN.stop_time
  is '结束时间';
comment on column WII_NURSING_PLAN.result
  is '效果';
comment on column WII_NURSING_PLAN.creator
  is '创建人';
comment on column WII_NURSING_PLAN.create_time
  is '创建时间';
comment on column WII_NURSING_PLAN.modifier
  is '修改人';
comment on column WII_NURSING_PLAN.modify_time
  is '修改时间';
comment on column WII_NURSING_PLAN.unique_id
  is '物理唯一ID';

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
  is '自增长编号';
comment on column WII_NURSING_PLAN_TEMP.ward_code
  is '病区编号';
comment on column WII_NURSING_PLAN_TEMP.question
  is '护理问题（以逗号分隔）';
comment on column WII_NURSING_PLAN_TEMP.memo
  is '护理措施（以逗号分隔）';
comment on column WII_NURSING_PLAN_TEMP.target
  is '预期目标（以逗号分隔）';
comment on column WII_NURSING_PLAN_TEMP.creator
  is '创建人';
comment on column WII_NURSING_PLAN_TEMP.create_time
  is '创建时间';
comment on column WII_NURSING_PLAN_TEMP.modifier
  is '修改人';
comment on column WII_NURSING_PLAN_TEMP.modify_time
  is '修改时间';
comment on column WII_NURSING_PLAN_TEMP.unique_id
  is '物理唯一ID';

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
  is '自增长编号';
comment on column WII_NURSING_PLAN_TEMP_ITEM.ward_code
  is '病区编号';
comment on column WII_NURSING_PLAN_TEMP_ITEM.item_type
  is '护理计划类型（Q：护理问题 M：护理措施 T：预期目标）';
comment on column WII_NURSING_PLAN_TEMP_ITEM.item_content
  is '内容';
comment on column WII_NURSING_PLAN_TEMP_ITEM.input_code
  is '拼音首字母';
comment on column WII_NURSING_PLAN_TEMP_ITEM.creator
  is '创建人';
comment on column WII_NURSING_PLAN_TEMP_ITEM.create_time
  is '创建时间';
comment on column WII_NURSING_PLAN_TEMP_ITEM.modifier
  is '修改人';
comment on column WII_NURSING_PLAN_TEMP_ITEM.modify_time
  is '修改时间';
comment on column WII_NURSING_PLAN_TEMP_ITEM.unique_id
  is '物理唯一ID';

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
  is '流水号';
comment on column WII_NURSING_REMIND.patient_id
  is '患者ID';
comment on column WII_NURSING_REMIND.plan_type
  is '任务类型';
comment on column WII_NURSING_REMIND.plan_time
  is '计划执行开始时间';
comment on column WII_NURSING_REMIND.reminder_time_span
  is '提醒时间间隔分钟数';
comment on column WII_NURSING_REMIND.repeat_flag
  is '重复标识(一次/每天/每周/每月)';
comment on column WII_NURSING_REMIND.repeat_week
  is '重复周(1/2/3/4/5/6/7)';
comment on column WII_NURSING_REMIND.repeat_month
  is '重复月(1/2/3/4/5/6/7/8/9/10………)';
comment on column WII_NURSING_REMIND.repeat_number
  is '重复次数';
comment on column WII_NURSING_REMIND.repeat_start_time
  is '开始时间';
comment on column WII_NURSING_REMIND.repeat_end_time
  is '结束时间';
comment on column WII_NURSING_REMIND.operator
  is '操作人';
comment on column WII_NURSING_REMIND.operate_time
  is '操作时间';
comment on column WII_NURSING_REMIND.creator
  is '创建人';
comment on column WII_NURSING_REMIND.create_time
  is '创建时间';
comment on column WII_NURSING_REMIND.modifier
  is '修正人';
comment on column WII_NURSING_REMIND.modify_time
  is '修正时间';
comment on column WII_NURSING_REMIND.all_day
  is '是否全天(1全天0非全天)';
comment on column WII_NURSING_REMIND.repeat_rule
  is '重复规则(计次/时间)';
comment on column WII_NURSING_REMIND.custom_task
  is '自定义任务';
comment on column WII_NURSING_REMIND.unique_id
  is '物理唯一ID';
comment on column WII_NURSING_REMIND.plan_source
  is '护理计划来源，0：护士，1：医生，默认值是0';
comment on column WII_NURSING_REMIND.nursing_plan_no
  is '与WII_NURSING_PLAN表NURSING_PLAN_NO关联';
comment on column WII_NURSING_REMIND.iscancel
  is '是否失效 0生效 1失效';
comment on column WII_NURSING_REMIND.remind_plan_id
  is '护理提醒计划ID';
comment on column WII_NURSING_REMIND.return_url
  is '跳转路径';
comment on column WII_NURSING_REMIND.return_type
  is '跳转类型 0弹出 1跳转';
comment on column WII_NURSING_REMIND.repeat_type
  is '重复类型 (规则已经生效的情况下，是否可重复触发 0 不可重复 1可重复)';
comment on column WII_NURSING_REMIND.repeat_day
  is '重复天';

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
  is '流水号';
comment on column WII_NURSING_REMIND_EXEC.plan_no
  is '护理计划ID';
comment on column WII_NURSING_REMIND_EXEC.plan_type
  is '任务类型';
comment on column WII_NURSING_REMIND_EXEC.exectue_status
  is '护理计划是否执行(0未执行1执行2取消)';
comment on column WII_NURSING_REMIND_EXEC.executor
  is '执行人';
comment on column WII_NURSING_REMIND_EXEC.execute_time
  is '执行时间';
comment on column WII_NURSING_REMIND_EXEC.creator
  is '创建人';
comment on column WII_NURSING_REMIND_EXEC.create_time
  is '创建时间';
comment on column WII_NURSING_REMIND_EXEC.modifier
  is '修正人';
comment on column WII_NURSING_REMIND_EXEC.modify_time
  is '修正时间';
comment on column WII_NURSING_REMIND_EXEC.plan_time_start
  is '计划执行开始时间';
comment on column WII_NURSING_REMIND_EXEC.reminder_time
  is '提醒时间';
comment on column WII_NURSING_REMIND_EXEC.plan_delete
  is '计划删除(1删除0未删除)';
comment on column WII_NURSING_REMIND_EXEC.plan_time_end
  is '计划执行结束时间';
comment on column WII_NURSING_REMIND_EXEC.cancel_reason
  is '取消原因';
comment on column WII_NURSING_REMIND_EXEC.remark
  is '执行备注';
comment on column WII_NURSING_REMIND_EXEC.unique_id
  is '物理唯一ID';
comment on column WII_NURSING_REMIND_EXEC.indexs
  is '索引';
comment on column WII_NURSING_REMIND_EXEC.patient_id
  is '患者Id';
comment on column WII_NURSING_REMIND_EXEC.allday
  is '是否全天 0:否 1：是';
comment on column WII_NURSING_REMIND_EXEC.return_url
  is '跳转路径';
comment on column WII_NURSING_REMIND_EXEC.return_type
  is '跳转类型 0弹出 1跳转';

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
  is '流水号';
comment on column WII_NURSING_REMIND_EXEC_BAC.plan_no
  is '护理计划ID';
comment on column WII_NURSING_REMIND_EXEC_BAC.plan_type
  is '任务类型';
comment on column WII_NURSING_REMIND_EXEC_BAC.exectue_status
  is '护理计划是否执行(0未执行1执行2取消)';
comment on column WII_NURSING_REMIND_EXEC_BAC.executor
  is '执行人';
comment on column WII_NURSING_REMIND_EXEC_BAC.execute_time
  is '执行时间';
comment on column WII_NURSING_REMIND_EXEC_BAC.creator
  is '创建人';
comment on column WII_NURSING_REMIND_EXEC_BAC.create_time
  is '创建时间';
comment on column WII_NURSING_REMIND_EXEC_BAC.modifier
  is '修正人';
comment on column WII_NURSING_REMIND_EXEC_BAC.modify_time
  is '修正时间';
comment on column WII_NURSING_REMIND_EXEC_BAC.plan_time_start
  is '计划执行开始时间';
comment on column WII_NURSING_REMIND_EXEC_BAC.reminder_time
  is '提醒时间';
comment on column WII_NURSING_REMIND_EXEC_BAC.plan_delete
  is '计划删除(1删除0未删除)';
comment on column WII_NURSING_REMIND_EXEC_BAC.plan_time_end
  is '计划执行结束时间';
comment on column WII_NURSING_REMIND_EXEC_BAC.cancel_reason
  is '取消原因';
comment on column WII_NURSING_REMIND_EXEC_BAC.remark
  is '执行备注';
comment on column WII_NURSING_REMIND_EXEC_BAC.unique_id
  is '物理唯一ID';
comment on column WII_NURSING_REMIND_EXEC_BAC.patient_id
  is '患者Id';
comment on column WII_NURSING_REMIND_EXEC_BAC.allday
  is '是否全天 0:否 1：是';

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
  is '巡视患者、路径点Code';
comment on column WII_NURSING_ROUNDS.rounds_type
  is '巡视类型';
comment on column WII_NURSING_ROUNDS.operator
  is '巡视人';
comment on column WII_NURSING_ROUNDS.operate_time
  is '巡视时间';
comment on column WII_NURSING_ROUNDS.creator
  is '创建人';
comment on column WII_NURSING_ROUNDS.create_time
  is '创建时间';
comment on column WII_NURSING_ROUNDS.modifier
  is '修改人';
comment on column WII_NURSING_ROUNDS.modify_time
  is '修改时间';
comment on column WII_NURSING_ROUNDS.unique_id
  is '物理唯一id';

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
  is '病区编号';
comment on column WII_NURSING_SCORE_CONFIG.score_code
  is '评分编号';
comment on column WII_NURSING_SCORE_CONFIG.nursing_code
  is '护理项目编号';
comment on column WII_NURSING_SCORE_CONFIG.creator
  is '创建人';
comment on column WII_NURSING_SCORE_CONFIG.create_time
  is '创建时间';
comment on column WII_NURSING_SCORE_CONFIG.modifier
  is '修改人';
comment on column WII_NURSING_SCORE_CONFIG.modify_time
  is '修改时间';
comment on column WII_NURSING_SCORE_CONFIG.unique_id
  is '物理唯一ID';

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
  is '肠内营养制剂编码';
comment on column WII_NUTRI_CN_DIC.nutri_cn_name_c
  is '肠内营养制剂中文名称';
comment on column WII_NUTRI_CN_DIC.med_route_ciscode
  is '给药途径';
comment on column WII_NUTRI_CN_DIC.unit
  is '剂量单位';
comment on column WII_NUTRI_CN_DIC.l_kcal
  is '每升含千卡能量值（Kcal)';
comment on column WII_NUTRI_CN_DIC.l_protein
  is '每升含多少克蛋白质（g)';
comment on column WII_NUTRI_CN_DIC.l_lipid
  is '每升含多少克脂肪（g)';
comment on column WII_NUTRI_CN_DIC.l_ch
  is '每升含多少克碳水化合物（g)';
comment on column WII_NUTRI_CN_DIC.pack_quan
  is '包装规格剂量';
comment on column WII_NUTRI_CN_DIC.input_code
  is '输入首字母(快捷输入）';
comment on column WII_NUTRI_CN_DIC.memo
  is '备注（特点描述）';
comment on column WII_NUTRI_CN_DIC.valid
  is '有效性（0-无效，1-有效）';

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
  is '肠外营养制剂编码';
comment on column WII_NUTRI_CW_DIC.nutri_cw_name_c
  is '肠外营养制剂中文名称';
comment on column WII_NUTRI_CW_DIC.nutri_cw_name_e
  is '肠外营养制剂英文名称';
comment on column WII_NUTRI_CW_DIC.nutri_cw_type
  is '肠外营养制剂类型 （A-氨基酸注射液 ；B-脂肪乳类）';
comment on column WII_NUTRI_CW_DIC.med_route_ciscode
  is '给药途径';
comment on column WII_NUTRI_CW_DIC.unit
  is '剂量单位';
comment on column WII_NUTRI_CW_DIC.concentration
  is '浓度';
comment on column WII_NUTRI_CW_DIC.l_kcal
  is '每升含千卡能量值（Kcal)';
comment on column WII_NUTRI_CW_DIC.l_nitrogen
  is '每升含多少克氮（g)';
comment on column WII_NUTRI_CW_DIC.ph
  is 'PH值（mOsm）';
comment on column WII_NUTRI_CW_DIC.osmotic_p
  is '渗透压(mOsm/kg.H2O)';
comment on column WII_NUTRI_CW_DIC.pack_quan
  is '包装规格剂量';
comment on column WII_NUTRI_CW_DIC.input_code
  is '输入首字母(快捷输入）';
comment on column WII_NUTRI_CW_DIC.memo
  is '备注（特点描述）';
comment on column WII_NUTRI_CW_DIC.valid
  is '有效性（0-无效，1-有效）';

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
  is '食物编码';
comment on column WII_NUTRI_FOOD_DIC.name
  is '食物名称';
comment on column WII_NUTRI_FOOD_DIC.weight
  is '重量';
comment on column WII_NUTRI_FOOD_DIC.weight_unit
  is '重量单位';
comment on column WII_NUTRI_FOOD_DIC.water_content
  is '重量中的含水量（单位：ml）';

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
  is '物理唯一ID';
comment on column WII_OPERATION_ANESTHESIA_EVENT.inpatient_visitid
  is '住院活动号';

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
  is '物理唯一ID';
comment on column WII_OPERATION_BADEVENT.inpatient_visitid
  is '住院活动号';

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
  is '物理唯一ID';

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
  is '病人ID';
comment on column WII_OPERATION_CUSTOM_DATA.visit_id
  is '住院ID';
comment on column WII_OPERATION_CUSTOM_DATA.oper_id
  is '手术ID';
comment on column WII_OPERATION_CUSTOM_DATA.item_name
  is '项目名称';
comment on column WII_OPERATION_CUSTOM_DATA.item_value
  is '项目内容';
comment on column WII_OPERATION_CUSTOM_DATA.unique_id
  is '物理唯一ID';
comment on column WII_OPERATION_CUSTOM_DATA.inpatient_visitid
  is '住院活动号';

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
  is '物理唯一ID';
comment on column WII_OPERATION_EMR_ARCHIVE.inpatient_visitid
  is '住院活动号';

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
  is '物理唯一ID';
comment on column WII_OPERATION_MASTER.inpatient_visitid
  is '住院活动号';

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
  is '物理唯一ID';
comment on column WII_OPERATION_SCHEDULE.inpatient_visitid
  is '住院活动号';

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
  is '病人ID';
comment on column WII_OPERATION_TRANS_EVENT.inpatient_visitid
  is '住院活动号';
comment on column WII_OPERATION_TRANS_EVENT.trans_type
  is '流转类型 0:手术出科 1手术入科';
comment on column WII_OPERATION_TRANS_EVENT.time_point
  is '时间点';
comment on column WII_OPERATION_TRANS_EVENT.creator
  is '创建人';
comment on column WII_OPERATION_TRANS_EVENT.create_time
  is '创建时间';
comment on column WII_OPERATION_TRANS_EVENT.modifier
  is '修改人';
comment on column WII_OPERATION_TRANS_EVENT.modify_time
  is '修改时间';
comment on column WII_OPERATION_TRANS_EVENT.unique_id
  is '物理唯一id';

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
  is '　病人（编号）唯一标识';
comment on column WII_ORDERS_EXEC_EVENT.order_no
  is '　医嘱编号';
comment on column WII_ORDERS_EXEC_EVENT.order_sub_no
  is '　子医嘱编号';
comment on column WII_ORDERS_EXEC_EVENT.default_time
  is '　默认执行时间（与之前拆分成ICU order中对应上）';
comment on column WII_ORDERS_EXEC_EVENT.execute_time_point
  is '　实际执行时间';
comment on column WII_ORDERS_EXEC_EVENT.order_item_code
  is '医嘱项目编码';
comment on column WII_ORDERS_EXEC_EVENT.order_key
  is '医嘱唯一标识';
comment on column WII_ORDERS_EXEC_EVENT.order_text
  is '　医嘱正文';
comment on column WII_ORDERS_EXEC_EVENT.speed
  is '　流速';
comment on column WII_ORDERS_EXEC_EVENT.operator
  is '　操作者';
comment on column WII_ORDERS_EXEC_EVENT.operate_time
  is '　操作时间';
comment on column WII_ORDERS_EXEC_EVENT.duty_nurse
  is '　责任护士';
comment on column WII_ORDERS_EXEC_EVENT.verify_nurse
  is '　审核护士';
comment on column WII_ORDERS_EXEC_EVENT.memo
  is '　备注';
comment on column WII_ORDERS_EXEC_EVENT.memo_time_point
  is '　备注时间点';
comment on column WII_ORDERS_EXEC_EVENT.execute_mathod
  is '　执行方法';
comment on column WII_ORDERS_EXEC_EVENT.skinresponse
  is '　皮肤反应';
comment on column WII_ORDERS_EXEC_EVENT.injectionsite
  is '注射部位';
comment on column WII_ORDERS_EXEC_EVENT.event_type
  is '执行状态（1 开始、2 结束、20 暂停、21终止、12流速变更、11 继续、10 持续、3即时完成、22交班、13交班继续）,用于记录医嘱执行的实际操作类型';
comment on column WII_ORDERS_EXEC_EVENT.creator
  is '创建人';
comment on column WII_ORDERS_EXEC_EVENT.create_time
  is '创建时间';
comment on column WII_ORDERS_EXEC_EVENT.execute_dosage
  is '执行量';
comment on column WII_ORDERS_EXEC_EVENT.speed_unit
  is '流速单位';
comment on column WII_ORDERS_EXEC_EVENT.cause
  is '原因';
comment on column WII_ORDERS_EXEC_EVENT.pharm_speed
  is '药物流速';
comment on column WII_ORDERS_EXEC_EVENT.pharm_speed_unit
  is '药物流速单位';
comment on column WII_ORDERS_EXEC_EVENT.unique_id
  is '物理唯一ID';
comment on column WII_ORDERS_EXEC_EVENT.dosage_unit
  is '剂量单位';
comment on column WII_ORDERS_EXEC_EVENT.data_source
  is '匹配的医嘱号';
comment on column WII_ORDERS_EXEC_EVENT.serial_no
  is 'HIS拆分后流水号';
comment on column WII_ORDERS_EXEC_EVENT.save_nursing_memo
  is '是否写入护理措施（1：有 0：没有）';

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
  is '医嘱执行事件修改表';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.patient_id
  is '病人（编号）唯一标识';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.order_no
  is '医嘱编号';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.order_sub_no
  is '子医嘱编号';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.default_time
  is '默认执行时间（与之前拆分成ICU order中对应上）';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.execute_time_point
  is '实际执行时间';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.order_item_code
  is '医嘱项目编码';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.order_key
  is '医嘱唯一标识';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.order_text
  is '医嘱正文';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.speed
  is '液体流速
';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.operator
  is '操作者';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.operate_time
  is '操作时间';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.duty_nurse
  is '责任护士';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.verify_nurse
  is '审核护士';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.memo
  is '备注';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.memo_time_point
  is '备注时间点';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.execute_mathod
  is '执行方法';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.skinresponse
  is '皮肤反应';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.injectionsite
  is '注射部位';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.event_type
  is '执行状态（1 开始、2 结束、20 暂停、21终止、12流速变更、11 继续、10 持续、3即时完成）,用于记录医嘱执行的实际操作类型';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.creator
  is '创建人';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.create_time
  is '创建时间';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.value
  is '执行量';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.speed_unit
  is '液体流速单位
';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.pharm_speed
  is '药物流速';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.pharm_speed_unit
  is '药物流速单位';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.unique_id
  is '物理唯一ID';
comment on column WII_ORDERS_EXEC_EVENT_MODIFY.data_source
  is '匹配的医嘱号';

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
  is '　病人（编号）唯一标识';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.order_no
  is '　医嘱编号';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.order_sub_no
  is '　子医嘱编号';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.order_text
  is '　抢救执行内容';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.administration
  is '    给药途径和方法';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.execute_dosage
  is '　实际执行量';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.dosage_units
  is '    剂量单位';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.operator
  is '　操作者';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.operate_time
  is '　操作时间';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.creator
  is '    创建人';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.create_time
  is '    创建时间';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.is_group
  is '  是否成组(是/否)';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.pharmacy_code
  is '抢救药品编号';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.pharmacy_his_code
  is '抢救药品HIS编号';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.pharmacy_his_name
  is '抢救药品HIS名称';
comment on column WII_ORDERS_EXEC_ICU_RESCUE.unique_id
  is '物理唯一ID';

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
  is '　病人（编号）唯一标识';
comment on column WII_ORDERS_EXEC_PHARMACY.order_no
  is '　医嘱编号';
comment on column WII_ORDERS_EXEC_PHARMACY.order_sub_no
  is '　子医嘱编号';
comment on column WII_ORDERS_EXEC_PHARMACY.default_time
  is '　默认执行时间（与之前拆分成ICU order中对应上）';
comment on column WII_ORDERS_EXEC_PHARMACY.execute_time_point
  is '　实际执行时间';
comment on column WII_ORDERS_EXEC_PHARMACY.order_text
  is '　医嘱正文';
comment on column WII_ORDERS_EXEC_PHARMACY.execute_dosage
  is '　实际执行量';
comment on column WII_ORDERS_EXEC_PHARMACY.operator
  is '　操作者';
comment on column WII_ORDERS_EXEC_PHARMACY.operate_time
  is '　操作时间';
comment on column WII_ORDERS_EXEC_PHARMACY.duty_nurse
  is '　责任护士';
comment on column WII_ORDERS_EXEC_PHARMACY.verify_nurse
  is '　审核护士';
comment on column WII_ORDERS_EXEC_PHARMACY.memo
  is '　备注';
comment on column WII_ORDERS_EXEC_PHARMACY.memo_time_point
  is '　备注时间点';
comment on column WII_ORDERS_EXEC_PHARMACY.execute_mathod
  is '　执行方法';
comment on column WII_ORDERS_EXEC_PHARMACY.skinresponse
  is '　皮肤反应';
comment on column WII_ORDERS_EXEC_PHARMACY.injectionsite
  is '注射部位';
comment on column WII_ORDERS_EXEC_PHARMACY.execute_compute_type
  is '执行计算方式（持续给药流速法、持续给药量估法、持续给药残余量法）';
comment on column WII_ORDERS_EXEC_PHARMACY.creator
  is '创建人';
comment on column WII_ORDERS_EXEC_PHARMACY.create_time
  is '创建时间';
comment on column WII_ORDERS_EXEC_PHARMACY.order_item_code
  is '医嘱项目编码';
comment on column WII_ORDERS_EXEC_PHARMACY.order_key
  is '医嘱唯一标识';
comment on column WII_ORDERS_EXEC_PHARMACY.dosage_unit
  is '剂量单位';
comment on column WII_ORDERS_EXEC_PHARMACY.unique_id
  is '物理唯一ID';
comment on column WII_ORDERS_EXEC_PHARMACY.speed
  is '液体流速';
comment on column WII_ORDERS_EXEC_PHARMACY.speed_unit
  is '液体流速单位';
comment on column WII_ORDERS_EXEC_PHARMACY.pharm_speed
  is '药物流速';
comment on column WII_ORDERS_EXEC_PHARMACY.pharm_speed_unit
  is '药物流速单位';

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
  is '执行单流水号';
comment on column WII_ORDERS_EXEC_SPLIT.inpatient_visitid
  is '住院流水号';
comment on column WII_ORDERS_EXEC_SPLIT.patient_id
  is '病人唯一标识';
comment on column WII_ORDERS_EXEC_SPLIT.order_no
  is '医嘱号';
comment on column WII_ORDERS_EXEC_SPLIT.default_time
  is '默认执行时间';
comment on column WII_ORDERS_EXEC_SPLIT.exec_barcode_type
  is '执行条码类型';
comment on column WII_ORDERS_EXEC_SPLIT.unique_id
  is '物理唯一ID';
comment on column WII_ORDERS_EXEC_SPLIT.order_sub_no
  is '医嘱子编号';
comment on column WII_ORDERS_EXEC_SPLIT.repeat_indicator
  is '长期医嘱标志';

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
  is '病人唯一标识号';
comment on column WII_ORDERS_HIS.inpatient_visitid
  is '住院活动号（标示每次患者住院的唯一号，可用住院号+住院次数）';
comment on column WII_ORDERS_HIS.order_no
  is '医嘱组号';
comment on column WII_ORDERS_HIS.order_sub_no
  is '医嘱子序号(对应组号下有几个子序号）';
comment on column WII_ORDERS_HIS.ordering_dept
  is '开医嘱科室';
comment on column WII_ORDERS_HIS.doctor
  is '开医嘱医生';
comment on column WII_ORDERS_HIS.stop_doctor
  is '停医嘱医生';
comment on column WII_ORDERS_HIS.nurse
  is '开医嘱校对护士';
comment on column WII_ORDERS_HIS.stop_nurse
  is '停医嘱校对护士';
comment on column WII_ORDERS_HIS.enter_time
  is '开医嘱录入日期及时间';
comment on column WII_ORDERS_HIS.stop_order_time
  is '停医嘱录入日期及时间';
comment on column WII_ORDERS_HIS.order_status
  is '医嘱状态（1新开，2校验，3执行，4作废，5停止）';
comment on column WII_ORDERS_HIS.repeat_indicator
  is '长期医嘱标志';
comment on column WII_ORDERS_HIS.order_class
  is '医嘱类别（两层字典－西药、中药等）';
comment on column WII_ORDERS_HIS.order_text
  is '医嘱正文';
comment on column WII_ORDERS_HIS.order_item_code
  is '医嘱项目编码';
comment on column WII_ORDERS_HIS.dosage
  is '药品一次使用剂量';
comment on column WII_ORDERS_HIS.dosage_units
  is '剂量单位';
comment on column WII_ORDERS_HIS.pham_std_code
  is '药品标准代码';
comment on column WII_ORDERS_HIS.pharm_spec
  is '药品规格';
comment on column WII_ORDERS_HIS.qty
  is '数量（一次使用剂量下计算的数量）';
comment on column WII_ORDERS_HIS.administration
  is '给药途径和方法';
comment on column WII_ORDERS_HIS.start_time
  is '医嘱开始执行时间';
comment on column WII_ORDERS_HIS.stop_time
  is '医嘱停止时间';
comment on column WII_ORDERS_HIS.duration
  is '持续时间 （例如，每日换药＊1周）';
comment on column WII_ORDERS_HIS.duration_units
  is '持续时间单位（天，周..)';
comment on column WII_ORDERS_HIS.frequency
  is '执行频率描述（例如tid,qd等）';
comment on column WII_ORDERS_HIS.freq_interval
  is '频率间隔';
comment on column WII_ORDERS_HIS.freq_interval_unit
  is '频率间隔单位(小时，分等）';
comment on column WII_ORDERS_HIS.dispense_memos
  is '摆药描述';
comment on column WII_ORDERS_HIS.order_key
  is '医嘱唯一标识';
comment on column WII_ORDERS_HIS.order_type
  is '1药物/2非药物';
comment on column WII_ORDERS_HIS.subtbl_flag
  is '1辅材/0其他';
comment on column WII_ORDERS_HIS.c_class
  is 'C类';
comment on column WII_ORDERS_HIS.creator
  is '创建人';
comment on column WII_ORDERS_HIS.create_time
  is '创建时间';
comment on column WII_ORDERS_HIS.invalid_time
  is '医嘱作废时间';
comment on column WII_ORDERS_HIS.unique_id
  is '物理唯一ID';
comment on column WII_ORDERS_HIS.flag
  is '标记医嘱同步详情';
comment on column WII_ORDERS_HIS.data_source
  is '数据来源(1:补录)';
comment on column WII_ORDERS_HIS.pharm_liquid_dosage
  is '计算好的药物液体总量';
comment on column WII_ORDERS_HIS.pharm_liquid_unit
  is '药物液体单位';
comment on column WII_ORDERS_HIS.pre_generation_count
  is '预先生成的条数';
comment on column WII_ORDERS_HIS.dosage_modified
  is '调整后的剂量（以分号隔开）';
comment on column WII_ORDERS_HIS.frequency_modified
  is '调整后的频次（以分号隔开）';

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
  is '1药物/2非药物';
comment on column WII_ORDERS_HIS_1.subtbl_flag
  is '1辅材/0其他';
comment on column WII_ORDERS_HIS_1.c_class
  is 'C类';
comment on column WII_ORDERS_HIS_1.create_time
  is '创建时间';
comment on column WII_ORDERS_HIS_1.creator
  is '创建人';
comment on column WII_ORDERS_HIS_1.invalid_time
  is '医嘱作废时间';
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
  is '1药物/2非药物';
comment on column WII_ORDERS_HIS_20160427.subtbl_flag
  is '1辅材/0其他';
comment on column WII_ORDERS_HIS_20160427.c_class
  is 'C类';
comment on column WII_ORDERS_HIS_20160427.create_time
  is '创建时间';
comment on column WII_ORDERS_HIS_20160427.creator
  is '创建人';
comment on column WII_ORDERS_HIS_20160427.invalid_time
  is '医嘱作废时间';

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
  is '病人唯一标识号';
comment on column WII_ORDERS_ICU.order_no
  is '医嘱组号

';
comment on column WII_ORDERS_ICU.order_sub_no
  is '医嘱子序号(对应组号下有几个子序号）
';
comment on column WII_ORDERS_ICU.default_time
  is '默认执行日期时间
';
comment on column WII_ORDERS_ICU.ordering_dept
  is '开医嘱科室';
comment on column WII_ORDERS_ICU.doctor
  is '开医嘱医生';
comment on column WII_ORDERS_ICU.stop_doctor
  is '停医嘱医生';
comment on column WII_ORDERS_ICU.nurse
  is '开医嘱校对护士';
comment on column WII_ORDERS_ICU.stop_nurse
  is '停医嘱校对护士
';
comment on column WII_ORDERS_ICU.enter_time
  is '开医嘱录入日期及时间
';
comment on column WII_ORDERS_ICU.stop_order_time
  is '停医嘱录入日期及时间
';
comment on column WII_ORDERS_ICU.order_status
  is '医嘱状（新开，校验，执行，作废，停止）';
comment on column WII_ORDERS_ICU.repeat_indicator
  is '长期医嘱标志
';
comment on column WII_ORDERS_ICU.order_class
  is '医嘱类别（两层字典－西药、中药等）';
comment on column WII_ORDERS_ICU.order_text
  is '医嘱正文
';
comment on column WII_ORDERS_ICU.order_item_code
  is '医嘱项目编码
';
comment on column WII_ORDERS_ICU.dosage
  is '药品一次使用剂量';
comment on column WII_ORDERS_ICU.dosage_units
  is '剂量单位
';
comment on column WII_ORDERS_ICU.pham_std_code
  is '药品标准代码
';
comment on column WII_ORDERS_ICU.pharm_spec
  is '药品规格
';
comment on column WII_ORDERS_ICU.qty
  is '数量（一次使用剂量下计算的数量）
';
comment on column WII_ORDERS_ICU.administration
  is '给药途径和方法
';
comment on column WII_ORDERS_ICU.start_time
  is '医嘱开始执行时间
';
comment on column WII_ORDERS_ICU.stop_time
  is '医嘱停止时间
';
comment on column WII_ORDERS_ICU.duration
  is '持续时间 （例如，每日换药＊1周）
';
comment on column WII_ORDERS_ICU.duration_units
  is '持续时间单位（天，周..)
';
comment on column WII_ORDERS_ICU.frequency
  is '执行频率描述（例如tid,qd等）
';
comment on column WII_ORDERS_ICU.freq_interval
  is '频率间隔
';
comment on column WII_ORDERS_ICU.freq_interval_unit
  is '频率间隔单位(小时，分等）
';
comment on column WII_ORDERS_ICU.dispense_memos
  is '摆药描述
　';
comment on column WII_ORDERS_ICU.order_abbr
  is '医嘱简称
　';
comment on column WII_ORDERS_ICU.order_attr
  is '医嘱属性
　';
comment on column WII_ORDERS_ICU.use_pump
  is '是否泵入药
　';
comment on column WII_ORDERS_ICU.execute_start_time
  is '执行开始时间
　';
comment on column WII_ORDERS_ICU.execute_end_time
  is '执行结束时间
';
comment on column WII_ORDERS_ICU.icu_execute_status
  is '"执行状态（未执行 = -1,
执行中 = 1,
 执行完成 = 2, 取消执行 = 3,
交班 = 4）"
';
comment on column WII_ORDERS_ICU.injectionsite
  is '注射部位
　';
comment on column WII_ORDERS_ICU.execute_mathod
  is '执行方法
';
comment on column WII_ORDERS_ICU.operator
  is '操作者
';
comment on column WII_ORDERS_ICU.operate_time
  is '操作时间
　';
comment on column WII_ORDERS_ICU.memo
  is '备注
　';
comment on column WII_ORDERS_ICU.memo_time_point
  is '备注时间点
';
comment on column WII_ORDERS_ICU.creator
  is '操作者
';
comment on column WII_ORDERS_ICU.create_time
  is '操作时间
';
comment on column WII_ORDERS_ICU.order_key
  is '医嘱唯一标识
';
comment on column WII_ORDERS_ICU.shift_time
  is '交班时间(此列的作用是用来合并交班医嘱的,正常为空)
';
comment on column WII_ORDERS_ICU.invalid_time
  is '医嘱作废时间
';
comment on column WII_ORDERS_ICU.is_rescue
  is '是否是抢救医嘱(1是0不是)
';
comment on column WII_ORDERS_ICU.order_type
  is '1药物/2非药物';
comment on column WII_ORDERS_ICU.subtbl_flag
  is '数据来源：0-HIS/1-交班
';
comment on column WII_ORDERS_ICU.c_class
  is 'C类
';
comment on column WII_ORDERS_ICU.modifier
  is '创建人
';
comment on column WII_ORDERS_ICU.modify_time
  is '创建时间';
comment on column WII_ORDERS_ICU.unique_id
  is '"物理唯一id
"

';
comment on column WII_ORDERS_ICU.barcode
  is '扫码执行医嘱';
comment on column WII_ORDERS_ICU.first_default_time
  is '首次默认执行时间';
comment on column WII_ORDERS_ICU.complete_time
  is '预计完成时间
';
comment on column WII_ORDERS_ICU.remain_dosage
  is '剩余量';
comment on column WII_ORDERS_ICU.all_dosage
  is '总剂量
';
comment on column WII_ORDERS_ICU.serial_no
  is 'HIS拆分后流水号';
comment on column WII_ORDERS_ICU.origin_default_time
  is '未修改的默认执行时间';
comment on column WII_ORDERS_ICU.cancel_reason
  is '取消原因';

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
  is '序号';
comment on column WII_ORDERS_ITEM_DIC.order_item_code
  is '医嘱项目代码';
comment on column WII_ORDERS_ITEM_DIC.order_item_name
  is '医嘱项目名称';
comment on column WII_ORDERS_ITEM_DIC.input_code
  is '输入码';

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
  is '病人唯一标识号';
comment on column WII_ORDERS_MANUAL.inpatient_visitid
  is '住院活动号（标示每次患者住院的唯一号，可用住院号+住院次数）';
comment on column WII_ORDERS_MANUAL.order_no
  is '医嘱组号';
comment on column WII_ORDERS_MANUAL.order_sub_no
  is '医嘱子序号(对应组号下有几个子序号）';
comment on column WII_ORDERS_MANUAL.match_order_no
  is '匹配医嘱组号';
comment on column WII_ORDERS_MANUAL.ordering_dept
  is '开医嘱科室';
comment on column WII_ORDERS_MANUAL.doctor
  is '开医嘱医生';
comment on column WII_ORDERS_MANUAL.stop_doctor
  is '停医嘱医生';
comment on column WII_ORDERS_MANUAL.nurse
  is '开医嘱校对护士';
comment on column WII_ORDERS_MANUAL.stop_nurse
  is '停医嘱校对护士';
comment on column WII_ORDERS_MANUAL.enter_time
  is '开医嘱录入日期及时间';
comment on column WII_ORDERS_MANUAL.stop_order_time
  is '停医嘱录入日期及时间';
comment on column WII_ORDERS_MANUAL.order_status
  is '医嘱状态（1新开，2校验，3执行，4作废，5停止）';
comment on column WII_ORDERS_MANUAL.repeat_indicator
  is '长期医嘱标志';
comment on column WII_ORDERS_MANUAL.order_class
  is '医嘱类别（两层字典－西药、中药等）';
comment on column WII_ORDERS_MANUAL.order_text
  is '医嘱正文';
comment on column WII_ORDERS_MANUAL.order_item_code
  is '医嘱项目编码';
comment on column WII_ORDERS_MANUAL.dosage
  is '药品一次使用剂量';
comment on column WII_ORDERS_MANUAL.dosage_units
  is '剂量单位';
comment on column WII_ORDERS_MANUAL.pham_std_code
  is '药品标准代码';
comment on column WII_ORDERS_MANUAL.pharm_spec
  is '药品规格';
comment on column WII_ORDERS_MANUAL.qty
  is '数量（一次使用剂量下计算的数量）';
comment on column WII_ORDERS_MANUAL.administration
  is '给药途径和方法';
comment on column WII_ORDERS_MANUAL.start_time
  is '医嘱开始执行时间';
comment on column WII_ORDERS_MANUAL.stop_time
  is '医嘱停止时间';
comment on column WII_ORDERS_MANUAL.duration
  is '持续时间 （例如，每日换药＊1周）';
comment on column WII_ORDERS_MANUAL.duration_units
  is '持续时间单位（天，周..)';
comment on column WII_ORDERS_MANUAL.frequency
  is '执行频率描述（例如tid,qd等）';
comment on column WII_ORDERS_MANUAL.freq_interval
  is '频率间隔';
comment on column WII_ORDERS_MANUAL.freq_interval_unit
  is '频率间隔单位(小时，分等）';
comment on column WII_ORDERS_MANUAL.dispense_memos
  is '摆药描述';
comment on column WII_ORDERS_MANUAL.order_key
  is '医嘱唯一标识';
comment on column WII_ORDERS_MANUAL.order_type
  is '1药物/2非药物';
comment on column WII_ORDERS_MANUAL.subtbl_flag
  is '1辅材/0其他';
comment on column WII_ORDERS_MANUAL.c_class
  is 'C类';
comment on column WII_ORDERS_MANUAL.creator
  is '创建人';
comment on column WII_ORDERS_MANUAL.create_time
  is '创建时间';
comment on column WII_ORDERS_MANUAL.invalid_time
  is '医嘱作废时间';
comment on column WII_ORDERS_MANUAL.unique_id
  is '物理唯一ID';
comment on column WII_ORDERS_MANUAL.data_source
  is '数据来源(1:补录)';

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
  is 'CIS分类类别编号';
comment on column WII_ORDER_CCLASS_DIC.cclass_name
  is 'CIS分类类别名称';
comment on column WII_ORDER_CCLASS_DIC.cclass_execute_way
  is '界面执行方式：10.即时用药（单、多次）/20.静滴/30.泵入/40.描述医嘱';
comment on column WII_ORDER_CCLASS_DIC.order_type
  is '药物/非药物';
comment on column WII_ORDER_CCLASS_DIC.memo
  is '备注';
comment on column WII_ORDER_CCLASS_DIC.sort
  is '排序';

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
  is 'CIS分类类别编号';
comment on column WII_ORDER_CCLASS_MAPPING_DIC.cclass_name
  is 'CIS分类类别名称';
comment on column WII_ORDER_CCLASS_MAPPING_DIC.his_class_code
  is 'HIS类别编号系列';
comment on column WII_ORDER_CCLASS_MAPPING_DIC.his_class_name
  is 'HIS类别名称系列
';
comment on column WII_ORDER_CCLASS_MAPPING_DIC.his_orderroute_key
  is 'HIS途径名称关键词
';
comment on column WII_ORDER_CCLASS_MAPPING_DIC.his_ordername_key
  is 'HIS医嘱名称中关键词
';
comment on column WII_ORDER_CCLASS_MAPPING_DIC.classification_method
  is '分类方法
1:仅通过HIS类别
2:通过HIS类别+HIS途经关键字
3:通过HIS类别+HIS医嘱名称关键字';
comment on column WII_ORDER_CCLASS_MAPPING_DIC.input_code
  is '输入首字母(快捷输入）';
comment on column WII_ORDER_CCLASS_MAPPING_DIC.memo
  is '备注';
comment on column WII_ORDER_CCLASS_MAPPING_DIC.match_relation
  is '匹配关系 1:相等 2:不相等 3:包含 4:不包含';
comment on column WII_ORDER_CCLASS_MAPPING_DIC.group_index
  is '成组索引';
comment on column WII_ORDER_CCLASS_MAPPING_DIC.group_relation
  is '组与组间的关系  1:并且  2:或者';
comment on column WII_ORDER_CCLASS_MAPPING_DIC.sort
  is '排序';

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
  is '医嘱明细编码';
comment on column WII_ORDER_DETAILS_DIC.order_name
  is '医嘱名称';
comment on column WII_ORDER_DETAILS_DIC.class_code
  is '类别编码';
comment on column WII_ORDER_DETAILS_DIC.class_name
  is '类别名称';
comment on column WII_ORDER_DETAILS_DIC.input_code
  is '快捷输入码';
comment on column WII_ORDER_DETAILS_DIC.memo
  is '备注';

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
  is '频次编码';
comment on column WII_ORDER_FREQ_DIC.freq_name
  is '频次名称';
comment on column WII_ORDER_FREQ_DIC.route_code
  is '给药途径编码';
comment on column WII_ORDER_FREQ_DIC.time_point
  is '执行时间点';
comment on column WII_ORDER_FREQ_DIC.time_start
  is '默认起始时间点';
comment on column WII_ORDER_FREQ_DIC.adjust_time
  is '是否可以调整直接输入起始点';
comment on column WII_ORDER_FREQ_DIC.memo
  is '备注';

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
  is '医嘱频次对照表';
comment on column WII_ORDER_FREQ_MAPPING_DIC.code
  is 'CIS编码';
comment on column WII_ORDER_FREQ_MAPPING_DIC.his_code
  is 'HIS编码';
comment on column WII_ORDER_FREQ_MAPPING_DIC.his_name
  is 'HIS名称';
comment on column WII_ORDER_FREQ_MAPPING_DIC.input_code
  is '输入码';
comment on column WII_ORDER_FREQ_MAPPING_DIC.memo
  is '备注';

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
  is '医嘱通用类型';
comment on column WII_ORDER_GENERAL_DIC.cis_code
  is 'CIS项目编码';
comment on column WII_ORDER_GENERAL_DIC.cis_name
  is 'CIS项目名称';
comment on column WII_ORDER_GENERAL_DIC.his_code
  is 'HIS项目编码';
comment on column WII_ORDER_GENERAL_DIC.his_name
  is 'HIS项目名称';
comment on column WII_ORDER_GENERAL_DIC.input_code
  is '输入首字母(快捷输入）';
comment on column WII_ORDER_GENERAL_DIC.memo
  is '备注';

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
  is '医嘱途径CIS编码';
comment on column WII_ORDER_ROUTE_DIC.orderroute_cis_name
  is '医嘱途径CIS中文名称';
comment on column WII_ORDER_ROUTE_DIC.orderroute_cis_abbrev
  is '医嘱途径CIS缩写';
comment on column WII_ORDER_ROUTE_DIC.input_code
  is '医嘱途径CIS缩写';
comment on column WII_ORDER_ROUTE_DIC.memo
  is '备注';

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
  is '主题编号';
comment on column WII_ORDER_TOPIC_MAPPING_DIC.topic_name
  is '主题名称';
comment on column WII_ORDER_TOPIC_MAPPING_DIC.topic_remark
  is '主题备注';
comment on column WII_ORDER_TOPIC_MAPPING_DIC.order_text
  is '医嘱名称';
comment on column WII_ORDER_TOPIC_MAPPING_DIC.administration
  is '医嘱途径';
comment on column WII_ORDER_TOPIC_MAPPING_DIC.pharmacy_code
  is '药品编号';
comment on column WII_ORDER_TOPIC_MAPPING_DIC.input_code
  is '快速录入';
comment on column WII_ORDER_TOPIC_MAPPING_DIC.valid
  is '有效性（0-无效，1-有效）';

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
  is '物理唯一ID';

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
  is '代码';
comment on column WII_ORG_MASTER.org_name
  is '名称';
comment on column WII_ORG_MASTER.org_tier
  is '机构层级（集团->单个医院->科室->病区->医疗组）';
comment on column WII_ORG_MASTER.parent_org_code
  is '父机构';
comment on column WII_ORG_MASTER.in_charges_nusing
  is '负责护士';
comment on column WII_ORG_MASTER.in_charges_doctor
  is '负责医生';
comment on column WII_ORG_MASTER.memo
  is '备注';
comment on column WII_ORG_MASTER.input_code
  is '输入码';
comment on column WII_ORG_MASTER.org_type
  is '1公共科室/2管理及财务科室/3后勤服务科室/4医技辅助科室/5门诊科室/6住院科室';
comment on column WII_ORG_MASTER.unique_id
  is '物理唯一ID';
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
  is '用户ID';
comment on column WII_PATIENTEVALUATE_CHECK.belong_type
  is '所属模块';
comment on column WII_PATIENTEVALUATE_CHECK.dic_code
  is '对应字典表内容';
comment on column WII_PATIENTEVALUATE_CHECK.is_check
  is '1:check,0:未check';
comment on column WII_PATIENTEVALUATE_CHECK.doctor
  is '医生';
comment on column WII_PATIENTEVALUATE_CHECK.check_date
  is 'check日期';
comment on column WII_PATIENTEVALUATE_CHECK.create_time
  is '创建时间';
comment on column WII_PATIENTEVALUATE_CHECK.creator
  is '创建人';
comment on column WII_PATIENTEVALUATE_CHECK.modifier
  is '修改人';
comment on column WII_PATIENTEVALUATE_CHECK.modify_time
  is '修改时间';
comment on column WII_PATIENTEVALUATE_CHECK.unique_id
  is '物理唯一ID';

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
  is '自增长ID';
comment on column WII_PATIENTEVALUATE_CONFIG.type
  is '类型';
comment on column WII_PATIENTEVALUATE_CONFIG.name
  is '显示名称';
comment on column WII_PATIENTEVALUATE_CONFIG.value
  is '值内容';
comment on column WII_PATIENTEVALUATE_CONFIG.parent_id
  is '父类ID';
comment on column WII_PATIENTEVALUATE_CONFIG.create_time
  is '创建时间';
comment on column WII_PATIENTEVALUATE_CONFIG.creator
  is '创建人';
comment on column WII_PATIENTEVALUATE_CONFIG.modifier
  is '修改人';
comment on column WII_PATIENTEVALUATE_CONFIG.modify_time
  is '修改时间';
comment on column WII_PATIENTEVALUATE_CONFIG.unique_id
  is '物理唯一ID';

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
  is '住院活动号';
comment on column WII_PATIENT_APPOINTMENT.patient_id
  is '病人标识';
comment on column WII_PATIENT_APPOINTMENT.reservation_time
  is '预约时间';
comment on column WII_PATIENT_APPOINTMENT.reservation_person
  is '预约人';
comment on column WII_PATIENT_APPOINTMENT.check_place
  is '检查地点';
comment on column WII_PATIENT_APPOINTMENT.feedback_dept
  is '反馈科室';
comment on column WII_PATIENT_APPOINTMENT.feedback_person
  is '反馈人';
comment on column WII_PATIENT_APPOINTMENT.confirm_time
  is '确认时间';
comment on column WII_PATIENT_APPOINTMENT.note
  is '备注';
comment on column WII_PATIENT_APPOINTMENT.status
  is '状态';
comment on column WII_PATIENT_APPOINTMENT.create_time
  is '创建时间';
comment on column WII_PATIENT_APPOINTMENT.creator
  is '创建人';
comment on column WII_PATIENT_APPOINTMENT.modifier
  is '修改人';
comment on column WII_PATIENT_APPOINTMENT.modify_time
  is '修改时间';
comment on column WII_PATIENT_APPOINTMENT.project_name
  is '项目名称';
comment on column WII_PATIENT_APPOINTMENT.unique_id
  is '物理唯一ID';

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
  is '病人标识
';
comment on column WII_PATIENT_ASSESS.inward_visitid
  is '入病区活动号
';
comment on column WII_PATIENT_ASSESS.assess_id
  is '评估ID
';
comment on column WII_PATIENT_ASSESS.assessors
  is '评估人
';
comment on column WII_PATIENT_ASSESS.assess_time
  is '评估时间
';
comment on column WII_PATIENT_ASSESS.auditor
  is '审核人
';
comment on column WII_PATIENT_ASSESS.audit_time
  is '审核时间
';
comment on column WII_PATIENT_ASSESS.memo
  is '备注
';
comment on column WII_PATIENT_ASSESS.create_time
  is '创建时间
';
comment on column WII_PATIENT_ASSESS.creator
  is '创建人
';
comment on column WII_PATIENT_ASSESS.modify_time
  is '修改时间
';
comment on column WII_PATIENT_ASSESS.modifier
  is '修改人
';
comment on column WII_PATIENT_ASSESS.unique_id
  is '物理唯一id
';
comment on column WII_PATIENT_ASSESS.child_code
  is '子CODE说明';

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
  is '病人唯一标识号';
comment on column WII_PATIENT_BED_CHANGE.ward_stayed
  is '所在病区';
comment on column WII_PATIENT_BED_CHANGE.bed_stayed
  is '所在床号';
comment on column WII_PATIENT_BED_CHANGE.bed_from
  is '来自床号';
comment on column WII_PATIENT_BED_CHANGE.change_time
  is '换床日期及时间';
comment on column WII_PATIENT_BED_CHANGE.operator
  is '操作人';
comment on column WII_PATIENT_BED_CHANGE.create_time
  is '创建时间';
comment on column WII_PATIENT_BED_CHANGE.creator
  is '创建人';
comment on column WII_PATIENT_BED_CHANGE.change_reason
  is '换床原因';
comment on column WII_PATIENT_BED_CHANGE.unique_id
  is '物理唯一ID';

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
  is '输血记录表';
comment on column WII_PATIENT_BLOODTRANS_INFO.bloodtrans_info_id
  is '自增长id';
comment on column WII_PATIENT_BLOODTRANS_INFO.create_time
  is '创建时间';
comment on column WII_PATIENT_BLOODTRANS_INFO.creator
  is '创建人';
comment on column WII_PATIENT_BLOODTRANS_INFO.modifier
  is '修改人';
comment on column WII_PATIENT_BLOODTRANS_INFO.modify_time
  is '修改时间';
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
  is 'DMAR归档项目编号';
comment on column WII_PATIENT_DMAR_PORTFOLIO.domain_id
  is '来源域ID';
comment on column WII_PATIENT_DMAR_PORTFOLIO.patient_id
  is '患者编号';
comment on column WII_PATIENT_DMAR_PORTFOLIO.inpatient_visitid
  is '住院活动号';
comment on column WII_PATIENT_DMAR_PORTFOLIO.portfolio_memo
  is '备注';
comment on column WII_PATIENT_DMAR_PORTFOLIO.operator
  is '操作人';
comment on column WII_PATIENT_DMAR_PORTFOLIO.operate_time
  is '操作时间';
comment on column WII_PATIENT_DMAR_PORTFOLIO.unique_id
  is '物理唯一ID';

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
  is '流水号';
comment on column WII_PATIENT_DOCUMENT_CHECK.patient_id
  is '病人唯一标识号';
comment on column WII_PATIENT_DOCUMENT_CHECK.document_code
  is '项目类型';
comment on column WII_PATIENT_DOCUMENT_CHECK.operate_time
  is '检查时间';
comment on column WII_PATIENT_DOCUMENT_CHECK.operate_by
  is '检查人';
comment on column WII_PATIENT_DOCUMENT_CHECK.memo
  is '备注';
comment on column WII_PATIENT_DOCUMENT_CHECK.attachment
  is '附件';
comment on column WII_PATIENT_DOCUMENT_CHECK.creator
  is '创建人';
comment on column WII_PATIENT_DOCUMENT_CHECK.create_time
  is '创建时间';
comment on column WII_PATIENT_DOCUMENT_CHECK.modifier
  is '修改人';
comment on column WII_PATIENT_DOCUMENT_CHECK.modify_time
  is '修改时间';
comment on column WII_PATIENT_DOCUMENT_CHECK.delete_flag
  is '删除标识';
comment on column WII_PATIENT_DOCUMENT_CHECK.delete_reason
  is '删除原因';
comment on column WII_PATIENT_DOCUMENT_CHECK.attachment_time
  is '附件上传时间';
comment on column WII_PATIENT_DOCUMENT_CHECK.operation_id
  is '手术ID';
comment on column WII_PATIENT_DOCUMENT_CHECK.unique_id
  is '物理唯一ID';

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
  is '所属类型';
comment on column WII_PATIENT_DOCUMENT_CONFIG.document_code
  is '编码';
comment on column WII_PATIENT_DOCUMENT_CONFIG.document_name
  is '名称';
comment on column WII_PATIENT_DOCUMENT_CONFIG.html_name
  is '关联的静态页面';
comment on column WII_PATIENT_DOCUMENT_CONFIG.ward_code
  is '病区编码';
comment on column WII_PATIENT_DOCUMENT_CONFIG.creator
  is '创建人';
comment on column WII_PATIENT_DOCUMENT_CONFIG.create_time
  is '创建时间';
comment on column WII_PATIENT_DOCUMENT_CONFIG.modifier
  is '修改人';
comment on column WII_PATIENT_DOCUMENT_CONFIG.modify_time
  is '修改时间';
comment on column WII_PATIENT_DOCUMENT_CONFIG.document_type
  is '文书类别  1:手术相关';
comment on column WII_PATIENT_DOCUMENT_CONFIG.unique_id
  is '物理唯一ID';
comment on column WII_PATIENT_DOCUMENT_CONFIG.system_type
  is '系统类型
"Nurse：护士站
Doctor：医生站"
';
comment on column WII_PATIENT_DOCUMENT_CONFIG.html_content
  is '关联页面内容';

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
  is '关联的流水号';
comment on column WII_PATIENT_DOCUMENT_DETAIL.document_code
  is '项目类型';
comment on column WII_PATIENT_DOCUMENT_DETAIL.control_name
  is '控件名称';
comment on column WII_PATIENT_DOCUMENT_DETAIL.control_value
  is '控件值';
comment on column WII_PATIENT_DOCUMENT_DETAIL.item_code
  is '项目编码';
comment on column WII_PATIENT_DOCUMENT_DETAIL.memo
  is '备注';
comment on column WII_PATIENT_DOCUMENT_DETAIL.creator
  is '创建人';
comment on column WII_PATIENT_DOCUMENT_DETAIL.create_time
  is '创建时间';
comment on column WII_PATIENT_DOCUMENT_DETAIL.modifier
  is '修改人';
comment on column WII_PATIENT_DOCUMENT_DETAIL.modify_time
  is '修改时间';
comment on column WII_PATIENT_DOCUMENT_DETAIL.unique_id
  is '物理唯一ID';

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
  is '流水号';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.patient_id
  is '病人唯一标识号';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.document_code
  is '项目类型';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.operate_time
  is '宣教时间';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.operate_by
  is '宣教人';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.memo
  is '备注';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.attachment
  is '附件';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.creator
  is '创建人';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.create_time
  is '创建时间';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.modifier
  is '修改人';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.modify_time
  is '修改时间';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.delete_flag
  is '删除标识';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.delete_reason
  is '删除原因';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.attachment_time
  is '附件上传时间';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.operation_id
  is '手术ID';
comment on column WII_PATIENT_DOCUMENT_EDUCATION.unique_id
  is '物理唯一ID';

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
  is '流水号';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.patient_id
  is '病人唯一标识号';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.document_code
  is '项目类型';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.operate_time
  is '完成时间';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.ward_from
  is '交出病区';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.operator_from
  is '交出人';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.ward_stayed
  is '接收病区';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.operator_stayed
  is '接收人';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.operator_from_memo
  is '备注';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.attachment
  is '附件';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.creator
  is '创建人';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.create_time
  is '创建时间';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.modifier
  is '修改人';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.modify_time
  is '修改时间';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.delete_flag
  is '删除标识';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.delete_reason
  is '删除原因';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.attachment_time
  is '附件上传时间';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.operation_id
  is '手术ID';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.unique_id
  is '物理唯一ID';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.operator_stayed_memo
  is '接收人备注信息';
comment on column WII_PATIENT_DOCUMENT_EXCHANGE.exchange_item_code
  is '交接物品Code';

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
  is '流水号';
comment on column WII_PATIENT_DOCUMENT_INFORM.patient_id
  is '病人唯一标识号';
comment on column WII_PATIENT_DOCUMENT_INFORM.document_code
  is '项目类型';
comment on column WII_PATIENT_DOCUMENT_INFORM.operate_time
  is '沟通时间';
comment on column WII_PATIENT_DOCUMENT_INFORM.talker_id
  is '沟通者';
comment on column WII_PATIENT_DOCUMENT_INFORM.listener_name
  is '沟通对象';
comment on column WII_PATIENT_DOCUMENT_INFORM.result_code
  is '沟通结果';
comment on column WII_PATIENT_DOCUMENT_INFORM.memo
  is '备注';
comment on column WII_PATIENT_DOCUMENT_INFORM.attachment
  is '附件';
comment on column WII_PATIENT_DOCUMENT_INFORM.creator
  is '创建人';
comment on column WII_PATIENT_DOCUMENT_INFORM.create_time
  is '创建时间';
comment on column WII_PATIENT_DOCUMENT_INFORM.modifier
  is '修改人';
comment on column WII_PATIENT_DOCUMENT_INFORM.modify_time
  is '修改时间';
comment on column WII_PATIENT_DOCUMENT_INFORM.delete_flag
  is '删除标识';
comment on column WII_PATIENT_DOCUMENT_INFORM.delete_reason
  is '删除原因';
comment on column WII_PATIENT_DOCUMENT_INFORM.attachment_time
  is '附件上传时间';
comment on column WII_PATIENT_DOCUMENT_INFORM.operation_id
  is '手术ID';
comment on column WII_PATIENT_DOCUMENT_INFORM.unique_id
  is '物理唯一ID';

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
  is '病人标识号';
comment on column WII_PATIENT_EXAM.inpatient_visitid
  is '住院活动号（标示每次患者住院的唯一号，可用住院号+住院次数）';
comment on column WII_PATIENT_EXAM.name
  is '姓名';
comment on column WII_PATIENT_EXAM.exam_no
  is '申请序号';
comment on column WII_PATIENT_EXAM.priority_indicator
  is '优先标志';
comment on column WII_PATIENT_EXAM.local_id_class
  is '检查号类别';
comment on column WII_PATIENT_EXAM.patient_local_id
  is '检查标识号';
comment on column WII_PATIENT_EXAM.exam_class
  is '检查类别';
comment on column WII_PATIENT_EXAM.exam_sub_class
  is '检查子类';
comment on column WII_PATIENT_EXAM.exam_name
  is '检查项目名称';
comment on column WII_PATIENT_EXAM.exam_mode
  is '检查方式';
comment on column WII_PATIENT_EXAM.req_date_time
  is '申请日期及时间';
comment on column WII_PATIENT_EXAM.req_dept
  is '申请科室';
comment on column WII_PATIENT_EXAM.req_physician
  is '申请医生';
comment on column WII_PATIENT_EXAM.req_memo
  is '申请备注';
comment on column WII_PATIENT_EXAM.scheduled_date_time
  is '预约日期及时间';
comment on column WII_PATIENT_EXAM.notice
  is '注意事项';
comment on column WII_PATIENT_EXAM.exam_group
  is '检查预约分组';
comment on column WII_PATIENT_EXAM.exam_time
  is '检查日期及时间';
comment on column WII_PATIENT_EXAM.exam_para
  is '检查参数';
comment on column WII_PATIENT_EXAM.performed_by
  is '执行科室';
comment on column WII_PATIENT_EXAM.technician
  is '检查操作人';
comment on column WII_PATIENT_EXAM.report_time
  is '报告日期及时间';
comment on column WII_PATIENT_EXAM.reporter
  is '检查报告人';
comment on column WII_PATIENT_EXAM.verified_by
  is '报告审核者';
comment on column WII_PATIENT_EXAM.verified_time
  is '审核时间';
comment on column WII_PATIENT_EXAM.description
  is '检查所见描述';
comment on column WII_PATIENT_EXAM.impression
  is '印象';
comment on column WII_PATIENT_EXAM.recommendation
  is '建议';
comment on column WII_PATIENT_EXAM.if_abnormal
  is '是否正常';
comment on column WII_PATIENT_EXAM.image_uid
  is '报告中图象编号';
comment on column WII_PATIENT_EXAM.memo
  is '备注';
comment on column WII_PATIENT_EXAM.result_status
  is '检查结果状态？';
comment on column WII_PATIENT_EXAM.pathology_recved_date_time
  is '病理标本收到日期及时间';
comment on column WII_PATIENT_EXAM.unique_id
  is '物理唯一ID';

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
  is '患者编号';
comment on column WII_PATIENT_FOLLOW_UP_PLAN.start_time
  is '开始时间';
comment on column WII_PATIENT_FOLLOW_UP_PLAN.bill_type
  is '类型';
comment on column WII_PATIENT_FOLLOW_UP_PLAN.end_time
  is '结束时间';
comment on column WII_PATIENT_FOLLOW_UP_PLAN.creator
  is '创建人';
comment on column WII_PATIENT_FOLLOW_UP_PLAN.create_time
  is '创建时间';
comment on column WII_PATIENT_FOLLOW_UP_PLAN.modifier
  is '修改人';
comment on column WII_PATIENT_FOLLOW_UP_PLAN.modify_time
  is '修改时间';
comment on column WII_PATIENT_FOLLOW_UP_PLAN.nurse_id
  is '计划随访人
';
comment on column WII_PATIENT_FOLLOW_UP_PLAN.unique_id
  is '物理唯一ID';
comment on column WII_PATIENT_FOLLOW_UP_PLAN.fact_time
  is '实际随访时间';
comment on column WII_PATIENT_FOLLOW_UP_PLAN.fact_nurse_id
  is '实际随访人';
comment on column WII_PATIENT_FOLLOW_UP_PLAN.fact_note
  is '随访记录';

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
  is '病人唯一标识';
comment on column WII_PATIENT_ICU_SITUATION.visit_id
  is '住院次数';
comment on column WII_PATIENT_ICU_SITUATION.dep_id
  is '入icu病区次数';
comment on column WII_PATIENT_ICU_SITUATION.inpatient_visitid
  is '住院活动号（标示每次患者住院的唯一号，可用住院号+"_"+住院次数）';
comment on column WII_PATIENT_ICU_SITUATION.inward_visitid
  is '入病区活动号（标示每次患者入病区的唯一号，可用患者ID+时间戳【毫秒级】）';
comment on column WII_PATIENT_ICU_SITUATION.item_code
  is '项目编号';
comment on column WII_PATIENT_ICU_SITUATION.item_value
  is '项目值';
comment on column WII_PATIENT_ICU_SITUATION.gen_date
  is '生成日期';
comment on column WII_PATIENT_ICU_SITUATION.creator
  is '创建人';
comment on column WII_PATIENT_ICU_SITUATION.create_time
  is '创建时间';
comment on column WII_PATIENT_ICU_SITUATION.modifier
  is '修改人';
comment on column WII_PATIENT_ICU_SITUATION.modify_time
  is '修改时间';
comment on column WII_PATIENT_ICU_SITUATION.unique_id
  is '物理唯一ID';
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
  is '住院活动号（标示每次患者住院的唯一号，可用住院号+住院次数）';
comment on column WII_PATIENT_INHOSPITAL_FEE.patient_id
  is '病人标识';
comment on column WII_PATIENT_INHOSPITAL_FEE.fee_item_code
  is '项目代码';
comment on column WII_PATIENT_INHOSPITAL_FEE.fee_item_name
  is '项目名称';
comment on column WII_PATIENT_INHOSPITAL_FEE.tot_cost
  is '费用金额';
comment on column WII_PATIENT_INHOSPITAL_FEE.fee_date
  is '计费日期';
comment on column WII_PATIENT_INHOSPITAL_FEE.fee_code
  is '最小费用代码（项目小归类）';
comment on column WII_PATIENT_INHOSPITAL_FEE.create_time
  is '创建时间';
comment on column WII_PATIENT_INHOSPITAL_FEE.creator
  is '创建人';
comment on column WII_PATIENT_INHOSPITAL_FEE.modifier
  is '修改人';
comment on column WII_PATIENT_INHOSPITAL_FEE.modify_time
  is '修改时间';
comment on column WII_PATIENT_INHOSPITAL_FEE.qty
  is '数量';
comment on column WII_PATIENT_INHOSPITAL_FEE.unit_price
  is '单价';
comment on column WII_PATIENT_INHOSPITAL_FEE.balance_state
  is '结算标志，0：未结算，1：已结算';
comment on column WII_PATIENT_INHOSPITAL_FEE.current_unit
  is '单位';
comment on column WII_PATIENT_INHOSPITAL_FEE.unique_id
  is '物理唯一ID';

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
  is '病人唯一标识';
comment on column WII_PATIENT_INWARD_ICU.visit_id
  is '住院次数';
comment on column WII_PATIENT_INWARD_ICU.dep_id
  is '入icu病区次数';
comment on column WII_PATIENT_INWARD_ICU.inpatient_visitid
  is '住院活动号（标示每次患者住院的唯一号，可用住院号+住院次数）';
comment on column WII_PATIENT_INWARD_ICU.inward_visitid
  is '入病区活动号';
comment on column WII_PATIENT_INWARD_ICU.diagnose
  is '诊断';
comment on column WII_PATIENT_INWARD_ICU.ward_code
  is '病区';
comment on column WII_PATIENT_INWARD_ICU.bed_no
  is '床号';
comment on column WII_PATIENT_INWARD_ICU.doctor_in_charge
  is '责任医生';
comment on column WII_PATIENT_INWARD_ICU.nurse_in_charge
  is '责任护士';
comment on column WII_PATIENT_INWARD_ICU.patient_name
  is '患者姓名';
comment on column WII_PATIENT_INWARD_ICU.patient_gender
  is '性别';
comment on column WII_PATIENT_INWARD_ICU.birthday
  is '出生日期';
comment on column WII_PATIENT_INWARD_ICU.body_weight
  is '体重';
comment on column WII_PATIENT_INWARD_ICU.body_height
  is '身高';
comment on column WII_PATIENT_INWARD_ICU.history_smoking
  is '吸烟史';
comment on column WII_PATIENT_INWARD_ICU.history_drinking
  is '饮酒史';
comment on column WII_PATIENT_INWARD_ICU.history_family_disease
  is '疾病家族史';
comment on column WII_PATIENT_INWARD_ICU.alergy_drugs
  is '过敏药物';
comment on column WII_PATIENT_INWARD_ICU.nursing_class
  is '护理级别';
comment on column WII_PATIENT_INWARD_ICU.patient_condition
  is '病人状况';
comment on column WII_PATIENT_INWARD_ICU.settled_indicator
  is '病人是否稳定';
comment on column WII_PATIENT_INWARD_ICU.abnormal
  is '异常情况';
comment on column WII_PATIENT_INWARD_ICU.antibiotic
  is '抗生素';
comment on column WII_PATIENT_INWARD_ICU.special_note
  is '特别提示';
comment on column WII_PATIENT_INWARD_ICU.informed_consent
  is '知情同意';
comment on column WII_PATIENT_INWARD_ICU.doctor_patient_com
  is '医患沟通';
comment on column WII_PATIENT_INWARD_ICU.commit_status
  is '提交状态';
comment on column WII_PATIENT_INWARD_ICU.creator
  is '创建人';
comment on column WII_PATIENT_INWARD_ICU.create_time
  is '创建时间';
comment on column WII_PATIENT_INWARD_ICU.modifier
  is '修改人';
comment on column WII_PATIENT_INWARD_ICU.modify_time
  is '修改时间';
comment on column WII_PATIENT_INWARD_ICU.doctor_name
  is '责任医生姓名';
comment on column WII_PATIENT_INWARD_ICU.nurse_name
  is '责任护士姓名';
comment on column WII_PATIENT_INWARD_ICU.inward_status
  is '在科状态(0在科 1 出院 2 转科 10 死亡)';
comment on column WII_PATIENT_INWARD_ICU.in_transfer_sequence_no
  is '入科流转编号';
comment on column WII_PATIENT_INWARD_ICU.in_icu_time
  is '入科ICU时间';
comment on column WII_PATIENT_INWARD_ICU.in_icu_operator
  is '入科ICU操作人';
comment on column WII_PATIENT_INWARD_ICU.out_transfer_sequence_no
  is '出科流转编号';
comment on column WII_PATIENT_INWARD_ICU.out_icu_time
  is '出科ICU时间';
comment on column WII_PATIENT_INWARD_ICU.out_icu_operator
  is '出科ICU操作人';
comment on column WII_PATIENT_INWARD_ICU.from_ward_code
  is '来自病区';
comment on column WII_PATIENT_INWARD_ICU.to_ward_code
  is '转出病区';
comment on column WII_PATIENT_INWARD_ICU.is_monitor
  is '是否加入Bundles监控(0 未被监控 1 加入监控)';
comment on column WII_PATIENT_INWARD_ICU.bed_id
  is '床位主表中的BED_ID';
comment on column WII_PATIENT_INWARD_ICU.disease_development
  is '患者转归';
comment on column WII_PATIENT_INWARD_ICU.estimated_weight
  is '预计体重';
comment on column WII_PATIENT_INWARD_ICU.body_surface_area
  is '体表面积';
comment on column WII_PATIENT_INWARD_ICU.history_alergy
  is '过敏史';
comment on column WII_PATIENT_INWARD_ICU.history_disease
  is '既往史';
comment on column WII_PATIENT_INWARD_ICU.is_reentry
  is '是否为48h内重返';
comment on column WII_PATIENT_INWARD_ICU.reentry_reason
  is '重返原因';
comment on column WII_PATIENT_INWARD_ICU.in_icu_source
  is '入科来源 关联GENERAL_DIC的ICU_ADT_FROM
';
comment on column WII_PATIENT_INWARD_ICU.out_icu_situation
  is '出科/出院情况';
comment on column WII_PATIENT_INWARD_ICU.unique_id
  is '物理唯一ID';
comment on column WII_PATIENT_INWARD_ICU.noninvasivediastolic
  is '无创舒张压';
comment on column WII_PATIENT_INWARD_ICU.noninvasivesistolic
  is '无创收缩压';
comment on column WII_PATIENT_INWARD_ICU.card_id
  is '身份证';
comment on column WII_PATIENT_INWARD_ICU.telephone
  is '联系电话';
comment on column WII_PATIENT_INWARD_ICU.is_operation
  is '是否手术患者(1是 0否)';
comment on column WII_PATIENT_INWARD_ICU.is_appointment
  is '是否术前预约 - 1是：计划内转入，0否：非计划转入';
comment on column WII_PATIENT_INWARD_ICU.address
  is '地址';
comment on column WII_PATIENT_INWARD_ICU.diet
  is '饮食';
comment on column WII_PATIENT_INWARD_ICU.attending_doctor
  is '主治医生';
comment on column WII_PATIENT_INWARD_ICU.inward_type
  is '入科方式';
comment on column WII_PATIENT_INWARD_ICU.history_provider
  is '病史提供人';
comment on column WII_PATIENT_INWARD_ICU.inward_chief_complaint
  is '入科主诉';
comment on column WII_PATIENT_INWARD_ICU.nation
  is '民族';
comment on column WII_PATIENT_INWARD_ICU.profession
  is '职业';
comment on column WII_PATIENT_INWARD_ICU.marital_status
  is '婚姻状况';
comment on column WII_PATIENT_INWARD_ICU.faith
  is '宗教信仰';
comment on column WII_PATIENT_INWARD_ICU.educational_level
  is '文化程度';
comment on column WII_PATIENT_INWARD_ICU.skin_test
  is '皮试结果';
comment on column WII_PATIENT_INWARD_ICU.inpatient_no
  is '住院号';
comment on column WII_PATIENT_INWARD_ICU.out_icu_status
  is '患者出科状况';
comment on column WII_PATIENT_INWARD_ICU.present_disease
  is '现病史';
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
  is '病人ID';
comment on column WII_PATIENT_IO.time_point
  is '监测时间点';
comment on column WII_PATIENT_IO.monitoring_name
  is '监测项目名称（源于监测项目字典表）';
comment on column WII_PATIENT_IO.monitoring_code
  is '监测项目编码（源于监测项目字典表）';
comment on column WII_PATIENT_IO.dosage
  is '剂量';
comment on column WII_PATIENT_IO.administration
  is '途径';
comment on column WII_PATIENT_IO.value
  is '数值';
comment on column WII_PATIENT_IO.units
  is '项目单位';
comment on column WII_PATIENT_IO.in_or_out
  is '出入标志';
comment on column WII_PATIENT_IO.operator
  is '操作员';
comment on column WII_PATIENT_IO.operate_time
  is '操作时间';
comment on column WII_PATIENT_IO.memo
  is '备注';
comment on column WII_PATIENT_IO.unique_id
  is '物理唯一ID';
comment on column WII_PATIENT_IO.group_code
  is '分组标识';

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
  is '病人ID';
comment on column WII_PATIENT_IO_MODIFY.time_point
  is '监测时间点';
comment on column WII_PATIENT_IO_MODIFY.monitoring_name
  is '监测项目名称（源于监测项目字典表）';
comment on column WII_PATIENT_IO_MODIFY.monitoring_code
  is '监测项目编码（源于监测项目字典表）';
comment on column WII_PATIENT_IO_MODIFY.dosage
  is '剂量';
comment on column WII_PATIENT_IO_MODIFY.administration
  is '途径';
comment on column WII_PATIENT_IO_MODIFY.value
  is '数值';
comment on column WII_PATIENT_IO_MODIFY.units
  is '项目单位';
comment on column WII_PATIENT_IO_MODIFY.in_or_out
  is '出入标志';
comment on column WII_PATIENT_IO_MODIFY.operator
  is '操作员';
comment on column WII_PATIENT_IO_MODIFY.operate_time
  is '操作时间';
comment on column WII_PATIENT_IO_MODIFY.modify_time
  is '修正时间';
comment on column WII_PATIENT_IO_MODIFY.modifier
  is '修正医生';
comment on column WII_PATIENT_IO_MODIFY.memo
  is '备注';
comment on column WII_PATIENT_IO_MODIFY.unique_id
  is '物理唯一ID';

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
  is '病人唯一标识号';
comment on column WII_PATIENT_LAB.inpatient_visitid
  is '住院活动号（标示每次患者住院的唯一号，可用住院号+住院次数）';
comment on column WII_PATIENT_LAB.test_no
  is '申请序号';
comment on column WII_PATIENT_LAB.priority_indicator
  is '优先标志';
comment on column WII_PATIENT_LAB.working_id
  is '工作单号';
comment on column WII_PATIENT_LAB.requested_date_time
  is '申请日期及时间';
comment on column WII_PATIENT_LAB.ordering_ward
  is '申请病区';
comment on column WII_PATIENT_LAB.ordering_provider
  is '申请医生';
comment on column WII_PATIENT_LAB.test_cause
  is '检验目的';
comment on column WII_PATIENT_LAB.relevant_clinic_diag
  is '临床诊断（检验申请单上）';
comment on column WII_PATIENT_LAB.specimen
  is '标本';
comment on column WII_PATIENT_LAB.specimen_barcode
  is '标本条形码';
comment on column WII_PATIENT_LAB.notes_for_spcm
  is '标本说明';
comment on column WII_PATIENT_LAB.spcm_received_time
  is '标本签收时间';
comment on column WII_PATIENT_LAB.spcm_sample_time
  is '标本采样时间';
comment on column WII_PATIENT_LAB.performed_by
  is '执行科室';
comment on column WII_PATIENT_LAB.spcm_execute_time
  is '标本检测时间';
comment on column WII_PATIENT_LAB.result_status
  is '结果状态';
comment on column WII_PATIENT_LAB.lab_result_time
  is '报告时间';
comment on column WII_PATIENT_LAB.reporter
  is '报告者';
comment on column WII_PATIENT_LAB.verified_by
  is '审核者';
comment on column WII_PATIENT_LAB.lab_no
  is '检验项目编号（医院检验收费项目）';
comment on column WII_PATIENT_LAB.lab_name
  is '检验项目名称';
comment on column WII_PATIENT_LAB.verified_upload_time
  is '审核上传时间';
comment on column WII_PATIENT_LAB.unique_id
  is '物理唯一ID';

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
  is '病人唯一标识号';
comment on column WII_PATIENT_LAB_RESULT.inpatient_visitid
  is '住院活动号（标示每次患者住院的唯一号，可用住院号+住院次数）';
comment on column WII_PATIENT_LAB_RESULT.test_no
  is '申请序号';
comment on column WII_PATIENT_LAB_RESULT.item_no
  is '项目序号';
comment on column WII_PATIENT_LAB_RESULT.lab_result_time
  is '报告时间';
comment on column WII_PATIENT_LAB_RESULT.print_order
  is '打印序号';
comment on column WII_PATIENT_LAB_RESULT.report_item_name
  is '检验报告项目名称';
comment on column WII_PATIENT_LAB_RESULT.report_item_code
  is '检验报告项目代码';
comment on column WII_PATIENT_LAB_RESULT.result
  is '检验结果值';
comment on column WII_PATIENT_LAB_RESULT.units
  is '检验结果值单位';
comment on column WII_PATIENT_LAB_RESULT.abnormal_indicator
  is '结果正常标志';
comment on column WII_PATIENT_LAB_RESULT.reference_result
  is '结果参考值';
comment on column WII_PATIENT_LAB_RESULT.unique_id
  is '物理唯一ID';

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
  is '病人唯一标识号';
comment on column WII_PATIENT_LAB_RESULT_TEST.inpatient_visitid
  is '住院活动号（标示每次患者住院的唯一号，可用住院号+住院次数）';
comment on column WII_PATIENT_LAB_RESULT_TEST.test_no
  is '申请序号';
comment on column WII_PATIENT_LAB_RESULT_TEST.item_no
  is '项目序号';
comment on column WII_PATIENT_LAB_RESULT_TEST.lab_result_time
  is '报告时间';
comment on column WII_PATIENT_LAB_RESULT_TEST.print_order
  is '打印序号';
comment on column WII_PATIENT_LAB_RESULT_TEST.report_item_name
  is '检验报告项目名称';
comment on column WII_PATIENT_LAB_RESULT_TEST.report_item_code
  is '检验报告项目代码';
comment on column WII_PATIENT_LAB_RESULT_TEST.result
  is '检验结果值';
comment on column WII_PATIENT_LAB_RESULT_TEST.units
  is '检验结果值单位';
comment on column WII_PATIENT_LAB_RESULT_TEST.abnormal_indicator
  is '结果正常标志';
comment on column WII_PATIENT_LAB_RESULT_TEST.reference_result
  is '结果参考值';

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
  is '病人唯一标识号';
comment on column WII_PATIENT_LAB_TEST.inpatient_visitid
  is '住院活动号（标示每次患者住院的唯一号，可用住院号+住院次数）';
comment on column WII_PATIENT_LAB_TEST.test_no
  is '申请序号';
comment on column WII_PATIENT_LAB_TEST.priority_indicator
  is '优先标志';
comment on column WII_PATIENT_LAB_TEST.working_id
  is '工作单号';
comment on column WII_PATIENT_LAB_TEST.requested_date_time
  is '申请日期及时间';
comment on column WII_PATIENT_LAB_TEST.ordering_ward
  is '申请病区';
comment on column WII_PATIENT_LAB_TEST.ordering_provider
  is '申请医生';
comment on column WII_PATIENT_LAB_TEST.lab_no
  is '检验项目编号（医院检验收费项目）';
comment on column WII_PATIENT_LAB_TEST.lab_name
  is '检验项目名称';
comment on column WII_PATIENT_LAB_TEST.test_cause
  is '检验目的';
comment on column WII_PATIENT_LAB_TEST.relevant_clinic_diag
  is '临床诊断（检验申请单上）';
comment on column WII_PATIENT_LAB_TEST.specimen
  is '标本';
comment on column WII_PATIENT_LAB_TEST.specimen_barcode
  is '标本条形码';
comment on column WII_PATIENT_LAB_TEST.notes_for_spcm
  is '标本说明';
comment on column WII_PATIENT_LAB_TEST.spcm_received_time
  is '标本签收时间';
comment on column WII_PATIENT_LAB_TEST.spcm_sample_time
  is '标本采样时间';
comment on column WII_PATIENT_LAB_TEST.performed_by
  is '执行科室';
comment on column WII_PATIENT_LAB_TEST.spcm_execute_time
  is '标本检测时间';
comment on column WII_PATIENT_LAB_TEST.result_status
  is '结果状态';
comment on column WII_PATIENT_LAB_TEST.lab_result_time
  is '报告时间';
comment on column WII_PATIENT_LAB_TEST.reporter
  is '报告者';
comment on column WII_PATIENT_LAB_TEST.verified_by
  is '审核者';
comment on column WII_PATIENT_LAB_TEST.unique_id
  is '物理唯一ID';

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
  is '条码号';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.testdate
  is '检验日期';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.machineid
  is '仪器ID';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.sampleid
  is '样本号';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.germid
  is '细菌编码';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.resulttime
  is '结果时间';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.antiid
  is '抗生素编码';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.antiname
  is '抗生素名称';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.result
  is '结果';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.ranger
  is '参考范围R(耐药)';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.unit
  is '单位';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.flag
  is '结果标识(S R I  IB)';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.memo
  is '备注信息';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.machineresult
  is '仪器结果';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.method
  is '实验方法(KB、MIC...)';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.amendflag
  is '修正值(S R I IB)';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.priority
  is '药品优先级(A,B,C,O,U)';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.germseq
  is '细菌序列(从1开始)';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.showorder
  is '显示顺序';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.ranges
  is '参考范围S(敏感)';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.rangei
  is '参考范围I(中介)';
comment on column WII_PATIENT_LAS_GM_RESULTANTI.unique_id
  is '物理唯一ID';

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
  is '检验日期';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.machineid
  is '仪器ID';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.sampleid
  is '样本号';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.barcode
  is '条码号';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.patienttype
  is '患者类型';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.patientid
  is '患者编码';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.patientseq
  is '患者流水号';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.patientname
  is '患者姓名';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.patientsex
  is '患者性别';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.patientage
  is '患者年龄';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.patientageunit
  is '年龄单位';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.patienttel
  is '患者电话';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.patientbedno
  is '患者床位号';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.patientidenno
  is '患者身份证';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.patientrace
  is '患者民族';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.patientsite
  is '患者居住地';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.execsqn
  is '执行单号';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.emc
  is '急诊标识';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.hisitemidlist
  is '收费项目编码(15,171,F0001)';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.hisitemnamelist
  is '收费项目名称列表';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.hisitemprice
  is '收费项目价格';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.doctorid
  is '开立医生编码';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.doctorname
  is '开立医生姓名';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.deptid
  is '开立科室编码';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.deptname
  is '开立科室名称';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.ordertime
  is '开立时间';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.execdeptid
  is '执行科室编码';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.execdeptname
  is '执行科室名称';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.wardid
  is '患者病区编码';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.wardname
  is '患者病区名称';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.sampletype
  is '样本类型';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.samplestate
  is '标本状态';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.sampleposition
  is '标本采集部位';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.diagnosis
  is '医生诊断';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.confirmstate
  is '核准标识.0:未核准,1:核准,2:取消核准,3:待查.4.初审;5:封存';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.printstate
  is '打印标识:0:未打印,1:已打印';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.alertstate
  is '危急值状态:0:否,1:是';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.state
  is '1 患者信息来源;2 费用状态;3 是否为智能核准(自动核准);4 信息发送标识(可以考虑为短信平台提供);5 双向系统复查标识;6 条码是否人工组合;7 外部系统数据已处理标识';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.testtype
  is '检验类型';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.groupid
  is '小组编码';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.nurseid
  is '采样人编码';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.nursename
  is '采样人名称';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.sampletime
  is '采样时间';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.senderid
  is '送检员编码';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.sendername
  is '送检员名称';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.sendtime
  is '送检员接收时间';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.sendformid
  is '送检单编码';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.inceptorid
  is '检验科接收人编码';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.inceptorname
  is '检验科接收人姓名';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.incepttime
  is '检验科接收时间';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.accepterid
  is '标本核收者编码';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.acceptername
  is '标本核收者名称';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.accepttime
  is '标本核收时间';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.approverid
  is '标本核准者编码';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.approvername
  is '标本核准者姓名';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.approvetime
  is '标本核准时间';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.memo
  is '备注';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.printedtime
  is '检验单打印时间';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.printerid
  is '检验单打印者编码';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.printername
  is '检验单打印者姓名';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.hospitalid
  is '医院编码(名称)';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.resulttype
  is '结果类型8位 1短报告(0无1有) 2药敏 3过程记录 4血培养';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.lismemo
  is 'LIS备注信息';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.isinoculated
  is '是否已经接种(0:未接种,1:已接种)';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.birthday
  is '出生日期(YYYY-MM-DD)';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.isuploadmyla
  is '是否已上传到MYLA(0:未上传，1:已上传)';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.isolasampletype
  is '接种仪样本编码';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.isolaplate
  is '接种仪平板组合';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.bottlebarcode
  is '培养瓶编码';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.isgcp
  is '是否药物临床试验(0:否,1:是)';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.ishighrisk
  is '是否高危患者';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.barprinttime
  is '条码打印时间';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.samplegetname
  is '采样人姓名';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.samplegetid
  is '采样人编码';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.documenttime
  is '归档时间(初审时间)';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.documentid
  is '归档人ID';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.documentname
  is '归档人姓名';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.reporttime
  is '预计报告时间';
comment on column WII_PATIENT_LAS_GM_SAMPLEREG.unique_id
  is '物理唯一ID';

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
  is '病人唯一标识号，首选身份证，次选与HIS一致。';
comment on column WII_PATIENT_MASTER.id_card
  is '证件号码';
comment on column WII_PATIENT_MASTER.nationality_code
  is '身份国别代码';
comment on column WII_PATIENT_MASTER.name_family
  is '病人姓名 ［姓 Family/ Last name］';
comment on column WII_PATIENT_MASTER.name_first
  is '病人姓名 ［名First name］';
comment on column WII_PATIENT_MASTER.name_family_phonetic
  is '病人姓 拼音，大写，字间用一个空格分隔，超长截断（可选）';
comment on column WII_PATIENT_MASTER.name_first_phonetic
  is '病人名 拼音，大写，字间用一个空格分隔，超长截断（可选）';
comment on column WII_PATIENT_MASTER.gender
  is '性别：中文的男、女、未知、未定';
comment on column WII_PATIENT_MASTER.marry_status
  is '婚姻状况代码';
comment on column WII_PATIENT_MASTER.birthday
  is '出生日期';
comment on column WII_PATIENT_MASTER.birth_place
  is '出生地';
comment on column WII_PATIENT_MASTER.vip
  is '重要人物标志：1-VIP 0-非VIP';
comment on column WII_PATIENT_MASTER.abo
  is 'ABO血型';
comment on column WII_PATIENT_MASTER.rh
  is 'Rh血型';
comment on column WII_PATIENT_MASTER.nation_code
  is '民族编号';
comment on column WII_PATIENT_MASTER.home_address
  is '家庭住址';
comment on column WII_PATIENT_MASTER.native_address
  is '户籍地址';
comment on column WII_PATIENT_MASTER.mobile
  is '手机号码';
comment on column WII_PATIENT_MASTER.telephone
  is '联系人电话（可发短信作为信息通知）';
comment on column WII_PATIENT_MASTER.home_phone
  is '家庭电话';
comment on column WII_PATIENT_MASTER.work_phone
  is '工作电话';
comment on column WII_PATIENT_MASTER.email_email
  is '电子邮箱';
comment on column WII_PATIENT_MASTER.create_time
  is '创建时间';
comment on column WII_PATIENT_MASTER.creator
  is '创建人';
comment on column WII_PATIENT_MASTER.id_type
  is '证件类型';
comment on column WII_PATIENT_MASTER.unique_id
  is '物理唯一ID';

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
  is '流水号';
comment on column WII_PATIENT_NOTICE.patient_id
  is '病人唯一标识号';
comment on column WII_PATIENT_NOTICE.item_code
  is '项目编码';
comment on column WII_PATIENT_NOTICE.item_name
  is '项目值';
comment on column WII_PATIENT_NOTICE.memo
  is '备注';
comment on column WII_PATIENT_NOTICE.notice_level
  is '提醒级别';
comment on column WII_PATIENT_NOTICE.notice_type
  is '提醒类别';
comment on column WII_PATIENT_NOTICE.operator_by
  is '操作人';
comment on column WII_PATIENT_NOTICE.operate_time
  is '操作时间';
comment on column WII_PATIENT_NOTICE.creator
  is '创建人';
comment on column WII_PATIENT_NOTICE.create_time
  is '创建时间';
comment on column WII_PATIENT_NOTICE.modifier
  is '修改人';
comment on column WII_PATIENT_NOTICE.modify_time
  is '修改时间';
comment on column WII_PATIENT_NOTICE.stop_by
  is '停止人';
comment on column WII_PATIENT_NOTICE.stop_time
  is '停止时间';
comment on column WII_PATIENT_NOTICE.unique_id
  is '物理唯一ID';

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
  is '患者编号';
comment on column WII_PATIENT_NURSING_RECORD.score_code
  is '评分编号';
comment on column WII_PATIENT_NURSING_RECORD.nursing_code
  is '护理项目编号';
comment on column WII_PATIENT_NURSING_RECORD.time_point
  is '护理时间';
comment on column WII_PATIENT_NURSING_RECORD.creator
  is '创建人';
comment on column WII_PATIENT_NURSING_RECORD.create_time
  is '创建时间';
comment on column WII_PATIENT_NURSING_RECORD.modifier
  is '修改人';
comment on column WII_PATIENT_NURSING_RECORD.modify_time
  is '修改时间';
comment on column WII_PATIENT_NURSING_RECORD.unique_id
  is '物理唯一ID';

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
  is '患者编号';
comment on column WII_PATIENT_NURSING_TURN_OVER.nursing_time
  is '翻身时间';
comment on column WII_PATIENT_NURSING_TURN_OVER.postur_before_code
  is '原体位编号';
comment on column WII_PATIENT_NURSING_TURN_OVER.postur_now_code
  is '现在体位编号';
comment on column WII_PATIENT_NURSING_TURN_OVER.water_bag_decompression
  is '是否水囊减压';
comment on column WII_PATIENT_NURSING_TURN_OVER.bed_elevation
  is '是否床头抬高';
comment on column WII_PATIENT_NURSING_TURN_OVER.operator
  is '操作员';
comment on column WII_PATIENT_NURSING_TURN_OVER.operate_time
  is '操作时间';
comment on column WII_PATIENT_NURSING_TURN_OVER.memo
  is '备注';
comment on column WII_PATIENT_NURSING_TURN_OVER.creator
  is '创建人';
comment on column WII_PATIENT_NURSING_TURN_OVER.create_time
  is '创建时间';
comment on column WII_PATIENT_NURSING_TURN_OVER.modifier
  is '修改人';
comment on column WII_PATIENT_NURSING_TURN_OVER.modify_time
  is '修改时间';
comment on column WII_PATIENT_NURSING_TURN_OVER.unique_id
  is '物理唯一ID';
comment on column WII_PATIENT_NURSING_TURN_OVER.tailstock_elevation
  is '床尾抬高';

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
  is '患者ID';
comment on column WII_PATIENT_PIGEONHOLE.inpatient_visitid
  is '住院活动号';
comment on column WII_PATIENT_PIGEONHOLE.inward_visitid
  is '入病区活动号';
comment on column WII_PATIENT_PIGEONHOLE.ward_code
  is '科室CODE';
comment on column WII_PATIENT_PIGEONHOLE.doc_code
  is '文档编码';
comment on column WII_PATIENT_PIGEONHOLE.creator
  is '创建人';
comment on column WII_PATIENT_PIGEONHOLE.create_time
  is '创建时间';
comment on column WII_PATIENT_PIGEONHOLE.modifier
  is '修改人';
comment on column WII_PATIENT_PIGEONHOLE.modify_time
  is '修改时间';
comment on column WII_PATIENT_PIGEONHOLE.unique_id
  is '物理唯一ID';

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
  is '归档文件配置';
comment on column WII_PATIENT_PIGEONHOLE_CONFIG.inward_visitid
  is '入病区活动号';
comment on column WII_PATIENT_PIGEONHOLE_CONFIG.doc_code
  is '归档文件编码';
comment on column WII_PATIENT_PIGEONHOLE_CONFIG.config_content
  is '配置内容';
comment on column WII_PATIENT_PIGEONHOLE_CONFIG.operator
  is '操作员';
comment on column WII_PATIENT_PIGEONHOLE_CONFIG.operate_time
  is '操作时间';
comment on column WII_PATIENT_PIGEONHOLE_CONFIG.create_time
  is '创建时间';
comment on column WII_PATIENT_PIGEONHOLE_CONFIG.creator
  is '创建人';
comment on column WII_PATIENT_PIGEONHOLE_CONFIG.modifier
  is '修改人';
comment on column WII_PATIENT_PIGEONHOLE_CONFIG.modify_time
  is '修改时间';
comment on column WII_PATIENT_PIGEONHOLE_CONFIG.unique_id
  is '物理唯一ID';
comment on column WII_PATIENT_PIGEONHOLE_CONFIG.start_time
  is '开始时间';
comment on column WII_PATIENT_PIGEONHOLE_CONFIG.end_time
  is '结束时间';

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
  is '患者编号';
comment on column WII_PATIENT_PROFILEITEM.ward_code
  is '科室编号';
comment on column WII_PATIENT_PROFILEITEM.module_code
  is '模块编码';
comment on column WII_PATIENT_PROFILEITEM.item_code
  is '患者个性化配置项编码';
comment on column WII_PATIENT_PROFILEITEM.item_value
  is '患者个性化配置项值';
comment on column WII_PATIENT_PROFILEITEM.item_content
  is '项内容';
comment on column WII_PATIENT_PROFILEITEM.description
  is '说明';
comment on column WII_PATIENT_PROFILEITEM.sort_no
  is '排序';
comment on column WII_PATIENT_PROFILEITEM.creator
  is '创建人';
comment on column WII_PATIENT_PROFILEITEM.create_time
  is '创建时间';
comment on column WII_PATIENT_PROFILEITEM.modifier
  is '修改人';
comment on column WII_PATIENT_PROFILEITEM.modify_time
  is '修改时间';
comment on column WII_PATIENT_PROFILEITEM.unique_id
  is '物理唯一ID';

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
  is '抢救记录序号';
comment on column WII_PATIENT_RESCUE_REC.patient_id
  is '患者ID';
comment on column WII_PATIENT_RESCUE_REC.rescue_start_time
  is '抢救开始时间';
comment on column WII_PATIENT_RESCUE_REC.rescue_start_operator
  is '抢救开始操作人';
comment on column WII_PATIENT_RESCUE_REC.rescue_end_time
  is '抢救结束时间';
comment on column WII_PATIENT_RESCUE_REC.rescue_end_operator
  is '抢救结束操作人';
comment on column WII_PATIENT_RESCUE_REC.creator
  is '创建人';
comment on column WII_PATIENT_RESCUE_REC.create_time
  is '创建时间';
comment on column WII_PATIENT_RESCUE_REC.rescue_result
  is '患者转归结果';
comment on column WII_PATIENT_RESCUE_REC.memo
  is '备注';
comment on column WII_PATIENT_RESCUE_REC.modifier
  is '修改人';
comment on column WII_PATIENT_RESCUE_REC.modify_time
  is '修改时间';
comment on column WII_PATIENT_RESCUE_REC.unique_id
  is '物理唯一ID';

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
  is '患者ID';
comment on column WII_PATIENT_SCORE.item_code
  is '评估项目编码';
comment on column WII_PATIENT_SCORE.item_name
  is '评估项目名称';
comment on column WII_PATIENT_SCORE.scoring_date_time
  is '评分时间';
comment on column WII_PATIENT_SCORE.scoring_value
  is '评分值';
comment on column WII_PATIENT_SCORE.degree
  is '危重程度';
comment on column WII_PATIENT_SCORE.death_probability
  is '死亡率';
comment on column WII_PATIENT_SCORE.pat_condition
  is '病情描述';
comment on column WII_PATIENT_SCORE.ward_code
  is '病区代码';
comment on column WII_PATIENT_SCORE.memo
  is '备注';
comment on column WII_PATIENT_SCORE.operator
  is '操作人';
comment on column WII_PATIENT_SCORE.operator_datetime
  is '操作时间';
comment on column WII_PATIENT_SCORE.part_code
  is '部位编号';
comment on column WII_PATIENT_SCORE.unique_id
  is '物理唯一ID';
comment on column WII_PATIENT_SCORE.full_mark
  is '满分';
comment on column WII_PATIENT_SCORE.score_grade
  is '评分等级';

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
  is '病人唯一标识号';
comment on column WII_PATIENT_SCORE_DETAIL.scoring_code
  is '项目类型';
comment on column WII_PATIENT_SCORE_DETAIL.scoring_time
  is '评估时间';
comment on column WII_PATIENT_SCORE_DETAIL.control_name
  is '控件名称';
comment on column WII_PATIENT_SCORE_DETAIL.control_value
  is '控件值';
comment on column WII_PATIENT_SCORE_DETAIL.item_code
  is '项目编码';
comment on column WII_PATIENT_SCORE_DETAIL.memo
  is '备注';
comment on column WII_PATIENT_SCORE_DETAIL.creator
  is '创建人';
comment on column WII_PATIENT_SCORE_DETAIL.create_time
  is '创建时间';
comment on column WII_PATIENT_SCORE_DETAIL.modifier
  is '修改人';
comment on column WII_PATIENT_SCORE_DETAIL.modify_time
  is '修改时间';
comment on column WII_PATIENT_SCORE_DETAIL.unique_id
  is '物理唯一ID';
comment on column WII_PATIENT_SCORE_DETAIL.control_name_c
  is '控件中文名称';

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
  is '项目类型';
comment on column WII_PATIENT_SCORE_DETAIL_C_B.control_name
  is '控件名称';
comment on column WII_PATIENT_SCORE_DETAIL_C_B.control_bind_entity
  is '控件绑定对象名称';
comment on column WII_PATIENT_SCORE_DETAIL_C_B.control_bind_property
  is '控件绑定对象属性名称';
comment on column WII_PATIENT_SCORE_DETAIL_C_B.item_range
  is '可选max，min';

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
  is '病人唯一标识号';
comment on column WII_PATIENT_SIGNS.gen_time
  is '指标生成时间（取Ticks，精确到毫秒，长整形）';
comment on column WII_PATIENT_SIGNS.monitoring_code
  is '指标项编码';
comment on column WII_PATIENT_SIGNS.monitoring_name
  is '指标项名称';
comment on column WII_PATIENT_SIGNS.value
  is '指标值';
comment on column WII_PATIENT_SIGNS.monitoring_unit_code
  is '指标单位编码';
comment on column WII_PATIENT_SIGNS.itemvalue_type
  is '指标值类型（数值，字符，布尔）';
comment on column WII_PATIENT_SIGNS.standard_range
  is '标准值范围';
comment on column WII_PATIENT_SIGNS.device_id
  is '指标采集来源设备标签';
comment on column WII_PATIENT_SIGNS.origin
  is '记录方式（来源）（1 设备获取，0 手工记录）';
comment on column WII_PATIENT_SIGNS.memo
  is '备注';
comment on column WII_PATIENT_SIGNS.create_time
  is '记录生成时间';
comment on column WII_PATIENT_SIGNS.creator
  is '创建人（人员编号或者设备编号）';
comment on column WII_PATIENT_SIGNS.status
  is '记录状态（1 可用，0 不可用）';
comment on column WII_PATIENT_SIGNS.origin_time
  is '设备记录时间';
comment on column WII_PATIENT_SIGNS.unique_id
  is '物理唯一ID';
comment on column WII_PATIENT_SIGNS.operator
  is '操作人';
comment on column WII_PATIENT_SIGNS.flag
  is '标识';
comment on column WII_PATIENT_SIGNS.group_code
  is '分组标识';
comment on column WII_PATIENT_SIGNS.viewreport
  is '显示报告(标识该体征显示位置)';
comment on column WII_PATIENT_SIGNS.input_source
  is '监测表单 =0,单床录入=1,多床录入 = 2,导管 = 3,PDA = 4,';

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
  is '患者ID';
comment on column WII_PATIENT_SIGNS_ALARM.ward_code
  is '病区代码';
comment on column WII_PATIENT_SIGNS_ALARM.signs_code
  is '体征代码';
comment on column WII_PATIENT_SIGNS_ALARM.signs_name
  is '体征名称';
comment on column WII_PATIENT_SIGNS_ALARM.signs_min_values
  is '数值报警下限';
comment on column WII_PATIENT_SIGNS_ALARM.signs_max_values
  is '数值报警上限';
comment on column WII_PATIENT_SIGNS_ALARM.creator
  is '创建人';
comment on column WII_PATIENT_SIGNS_ALARM.create_time
  is '创建时间';
comment on column WII_PATIENT_SIGNS_ALARM.modifier
  is '修改人';
comment on column WII_PATIENT_SIGNS_ALARM.modify_time
  is '修改时间';
comment on column WII_PATIENT_SIGNS_ALARM.unique_id
  is '物理唯一ID';
comment on column WII_PATIENT_SIGNS_ALARM.operate_time
  is '操作时间';
comment on column WII_PATIENT_SIGNS_ALARM.range
  is '范围规则配置（关键字有：[Age]）';
comment on column WII_PATIENT_SIGNS_ALARM.special_code
  is '专科Code';
comment on column WII_PATIENT_SIGNS_ALARM.special_flag
  is '专科标识';
comment on column WII_PATIENT_SIGNS_ALARM.alarm_type
  is '类型 0：体征 1：评分';
comment on column WII_PATIENT_SIGNS_ALARM.remind_min_values
  is '数值提醒下限';
comment on column WII_PATIENT_SIGNS_ALARM.remind_max_values
  is '数值提醒上限';

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
  is '患者ID';
comment on column WII_PATIENT_SIGNS_ALARMHST.ward_code
  is '病区代码';
comment on column WII_PATIENT_SIGNS_ALARMHST.signs_code
  is '体征代码';
comment on column WII_PATIENT_SIGNS_ALARMHST.signs_name
  is '体征名称';
comment on column WII_PATIENT_SIGNS_ALARMHST.signs_min_values
  is '体征值下限';
comment on column WII_PATIENT_SIGNS_ALARMHST.signs_max_values
  is '体征值上限';
comment on column WII_PATIENT_SIGNS_ALARMHST.creator
  is '创建人';
comment on column WII_PATIENT_SIGNS_ALARMHST.create_time
  is '创建时间';
comment on column WII_PATIENT_SIGNS_ALARMHST.modifier
  is '修改人';
comment on column WII_PATIENT_SIGNS_ALARMHST.modify_time
  is '修改时间';
comment on column WII_PATIENT_SIGNS_ALARMHST.unique_id
  is '物理唯一ID';
comment on column WII_PATIENT_SIGNS_ALARMHST.operate_time
  is '操作时间';

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
  is '设备标签';
comment on column WII_PATIENT_SIGNS_GATHER.gen_time
  is '指标生成时间（取Ticks，精确到毫秒，长整形）';
comment on column WII_PATIENT_SIGNS_GATHER.gen_date
  is '指标生成日期（例如：20150205）';
comment on column WII_PATIENT_SIGNS_GATHER.signitem_code
  is '指标项编码';
comment on column WII_PATIENT_SIGNS_GATHER.signtime_value
  is '指标值';
comment on column WII_PATIENT_SIGNS_GATHER.unique_id
  is '物理唯一ID';

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
  is '病人唯一标识号';
comment on column WII_PATIENT_SIGNS_MODIFY.gen_time
  is '指标生成时间（取Ticks，精确到毫秒，长整形）';
comment on column WII_PATIENT_SIGNS_MODIFY.monitoring_code
  is '指标项编码';
comment on column WII_PATIENT_SIGNS_MODIFY.monitoring_name
  is '指标项名称';
comment on column WII_PATIENT_SIGNS_MODIFY.value
  is '指标值';
comment on column WII_PATIENT_SIGNS_MODIFY.monitoring_unit_code
  is '指标单位编码';
comment on column WII_PATIENT_SIGNS_MODIFY.itemvalue_type
  is '指标值类型（数值，字符，布尔）';
comment on column WII_PATIENT_SIGNS_MODIFY.standard_range
  is '标准值范围';
comment on column WII_PATIENT_SIGNS_MODIFY.device_id
  is '指标采集来源设备标签';
comment on column WII_PATIENT_SIGNS_MODIFY.origin
  is '记录方式（来源）（1 设备获取，0 手工记录）';
comment on column WII_PATIENT_SIGNS_MODIFY.memo
  is '备注';
comment on column WII_PATIENT_SIGNS_MODIFY.create_time
  is '记录生成时间';
comment on column WII_PATIENT_SIGNS_MODIFY.creator
  is '创建人（人员编号或者设备编号）';
comment on column WII_PATIENT_SIGNS_MODIFY.status
  is '记录状态（1 可用，0 不可用）';
comment on column WII_PATIENT_SIGNS_MODIFY.modify_time
  is '修正时间';
comment on column WII_PATIENT_SIGNS_MODIFY.modifier
  is '修正医生';
comment on column WII_PATIENT_SIGNS_MODIFY.unique_id
  is '物理唯一ID';
comment on column WII_PATIENT_SIGNS_MODIFY.operator
  is '操作人';
comment on column WII_PATIENT_SIGNS_MODIFY.origin_time
  is '设备采集时间';
comment on column WII_PATIENT_SIGNS_MODIFY.flag
  is '标识';
comment on column WII_PATIENT_SIGNS_MODIFY.group_code
  is '分组标识';

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
  is '病人唯一标识号';
comment on column WII_PATIENT_SIGNS_TARGET.item_code
  is '项目编码';
comment on column WII_PATIENT_SIGNS_TARGET.start_time
  is '开始时间';
comment on column WII_PATIENT_SIGNS_TARGET.item_value
  is '项目值';
comment on column WII_PATIENT_SIGNS_TARGET.end_time
  is '结束时间';
comment on column WII_PATIENT_SIGNS_TARGET.operator_by
  is '操作人';
comment on column WII_PATIENT_SIGNS_TARGET.operate_time
  is '操作时间';
comment on column WII_PATIENT_SIGNS_TARGET.creator
  is '创建人';
comment on column WII_PATIENT_SIGNS_TARGET.create_time
  is '创建时间';
comment on column WII_PATIENT_SIGNS_TARGET.modifier
  is '修改人';
comment on column WII_PATIENT_SIGNS_TARGET.modify_time
  is '修改时间';
comment on column WII_PATIENT_SIGNS_TARGET.unique_id
  is '物理唯一ID';

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
  is '短信发送编号';
comment on column WII_PATIENT_SMS_REC.patient_id
  is '患者编号';
comment on column WII_PATIENT_SMS_REC.sms_batch
  is '短信批次';
comment on column WII_PATIENT_SMS_REC.receiver_phone
  is '手机号码';
comment on column WII_PATIENT_SMS_REC.receiver_type
  is '0:患者本人  1:患者家属  2:其他联系人';
comment on column WII_PATIENT_SMS_REC.receiver_name
  is '接受者姓名';
comment on column WII_PATIENT_SMS_REC.sms_content
  is '短信内容';
comment on column WII_PATIENT_SMS_REC.sms_status
  is '短信状态';
comment on column WII_PATIENT_SMS_REC.operator
  is '通知人';
comment on column WII_PATIENT_SMS_REC.operate_time
  is '发送时间';
comment on column WII_PATIENT_SMS_REC.creator
  is '创建人';
comment on column WII_PATIENT_SMS_REC.create_time
  is '创建时间';
comment on column WII_PATIENT_SMS_REC.modifier
  is '修改人';
comment on column WII_PATIENT_SMS_REC.modify_time
  is '修改时间';
comment on column WII_PATIENT_SMS_REC.unique_id
  is '物理唯一ID';

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
  is '患者ID';
comment on column WII_PATIENT_SOCRE_APACHEII.ward_code
  is '病区代码';
comment on column WII_PATIENT_SOCRE_APACHEII.scoring_date_time
  is '评分时间';
comment on column WII_PATIENT_SOCRE_APACHEII.age
  is '年龄';
comment on column WII_PATIENT_SOCRE_APACHEII.hr
  is '心率(次/Min)';
comment on column WII_PATIENT_SOCRE_APACHEII.map
  is '血压MAP(mmHg)';
comment on column WII_PATIENT_SOCRE_APACHEII.br
  is '呼吸(次/Min)';
comment on column WII_PATIENT_SOCRE_APACHEII.tmp
  is '体温(℃)';
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
  is '肌酐Cr(μmol/L)';
comment on column WII_PATIENT_SOCRE_APACHEII.wbc
  is '白细胞WBC(x10^9/L)';
comment on column WII_PATIENT_SOCRE_APACHEII.k
  is 'K(mmol/L)';
comment on column WII_PATIENT_SOCRE_APACHEII.na
  is 'Na(mmol/L)';
comment on column WII_PATIENT_SOCRE_APACHEII.eyes_reflect
  is '睁眼反应（对应分值0-5）';
comment on column WII_PATIENT_SOCRE_APACHEII.talk_reflect
  is '言语反应（对应分值0-5）';
comment on column WII_PATIENT_SOCRE_APACHEII.limb_reflect
  is '肢体反应（对应分值0-5）';
comment on column WII_PATIENT_SOCRE_APACHEII.health_status
  is '健康状态  择期手术2分  不能手术或急诊手术5分';
comment on column WII_PATIENT_SOCRE_APACHEII.ji_zhen_oper
  is '急性肾功能衰竭 1是 0否';
comment on column WII_PATIENT_SOCRE_APACHEII.score_details
  is '诊断分类系数明细';
comment on column WII_PATIENT_SOCRE_APACHEII.slow_health
  is '慢性健康状况评分';
comment on column WII_PATIENT_SOCRE_APACHEII.memo
  is '病情说明';
comment on column WII_PATIENT_SOCRE_APACHEII.unique_id
  is '物理唯一ID';

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
  is '特护提醒自增长ID';
comment on column WII_PATIENT_SPECIAL_REMINDER.patient_id
  is '患者编号';
comment on column WII_PATIENT_SPECIAL_REMINDER.reminder_time
  is '提醒时间';
comment on column WII_PATIENT_SPECIAL_REMINDER.content
  is '提醒内容';
comment on column WII_PATIENT_SPECIAL_REMINDER.jump_to
  is '跳转内容';
comment on column WII_PATIENT_SPECIAL_REMINDER.indexes
  is '外部唯一索引';
comment on column WII_PATIENT_SPECIAL_REMINDER.system_type
  is '系统类型  0：护士站  1：医生站';
comment on column WII_PATIENT_SPECIAL_REMINDER.creator
  is '创建人';
comment on column WII_PATIENT_SPECIAL_REMINDER.create_time
  is '创建时间';
comment on column WII_PATIENT_SPECIAL_REMINDER.modifier
  is '修改人';
comment on column WII_PATIENT_SPECIAL_REMINDER.modify_time
  is '修改时间';
comment on column WII_PATIENT_SPECIAL_REMINDER.unique_id
  is '物理唯一ID';

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
  is '唯一编号';
comment on column WII_PATIENT_TAG.patient_id
  is '病人ID';
comment on column WII_PATIENT_TAG.ward_code
  is '病区';
comment on column WII_PATIENT_TAG.reminder_name
  is '提醒内容(中文)从科室参数字典表带出的中文';
comment on column WII_PATIENT_TAG.reminder_time
  is '记录时间';
comment on column WII_PATIENT_TAG.status
  is '当前被点亮状态 0:点亮|1:未点亮';
comment on column WII_PATIENT_TAG.doctor
  is '操作医生';
comment on column WII_PATIENT_TAG.inpatient_visitid
  is '住院活动号（标示每次患者住院的唯一号，可用住院号+住院次数）';
comment on column WII_PATIENT_TAG.inward_visitid
  is '入病区活动号';
comment on column WII_PATIENT_TAG.system_type
  is '系统类型（0：护士站，1：医生站）';

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
  is '专科编号';
comment on column WII_PATIENT_TAG_CONFIG.tag_code
  is '标签编号';
comment on column WII_PATIENT_TAG_CONFIG.tag_name
  is '标签名称';
comment on column WII_PATIENT_TAG_CONFIG.parent_tag_code
  is '标签父节点';
comment on column WII_PATIENT_TAG_CONFIG.status
  is '状态(0：不显示，1：只读，2：可编辑）（两位：第一位是护士站，第二位是医生站）';
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
  is '患者流转序号';
comment on column WII_PATIENT_TRANSFER_HIS.inpatient_visitid
  is '住院活动号（标示每次患者住院的唯一号，可用住院号+住院次数）';
comment on column WII_PATIENT_TRANSFER_HIS.transfer_time
  is '流转日期及时间';
comment on column WII_PATIENT_TRANSFER_HIS.transfer_reason_code
  is '流转原因编号';
comment on column WII_PATIENT_TRANSFER_HIS.transfer_reason_memo
  is '流转原因-其他备注';
comment on column WII_PATIENT_TRANSFER_HIS.patient_id
  is '病人唯一标识号';
comment on column WII_PATIENT_TRANSFER_HIS.dept_stayed
  is '所在科室';
comment on column WII_PATIENT_TRANSFER_HIS.ward_stayed
  is '所在病区';
comment on column WII_PATIENT_TRANSFER_HIS.bed_stayed
  is '所在床号';
comment on column WII_PATIENT_TRANSFER_HIS.dept_from
  is '来自科室';
comment on column WII_PATIENT_TRANSFER_HIS.ward_from
  is '来自病区';
comment on column WII_PATIENT_TRANSFER_HIS.bed_from
  is '来自床号';
comment on column WII_PATIENT_TRANSFER_HIS.doctor_in_charge
  is '经治医师';
comment on column WII_PATIENT_TRANSFER_HIS.create_time
  is '创建时间';
comment on column WII_PATIENT_TRANSFER_HIS.creator
  is '创建人';
comment on column WII_PATIENT_TRANSFER_HIS.visit_id
  is '住院次数';
comment on column WII_PATIENT_TRANSFER_HIS.unique_id
  is '物理唯一ID';

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
  is '病人唯一标识号';
comment on column WII_PATIENT_TRANSFER_HIS_VIEW.inpatient_visitid
  is '住院活动号';
comment on column WII_PATIENT_TRANSFER_HIS_VIEW.transfer_time
  is '流转日期及时间';
comment on column WII_PATIENT_TRANSFER_HIS_VIEW.transfer_code
  is '流转原因编号';
comment on column WII_PATIENT_TRANSFER_HIS_VIEW.dept_stayed
  is '所在科室';
comment on column WII_PATIENT_TRANSFER_HIS_VIEW.ward_stayed
  is '所在病区';
comment on column WII_PATIENT_TRANSFER_HIS_VIEW.bed_stayed
  is '所在床号';
comment on column WII_PATIENT_TRANSFER_HIS_VIEW.create_time
  is '创建时间';
comment on column WII_PATIENT_TRANSFER_HIS_VIEW.creator
  is '创建人';
comment on column WII_PATIENT_TRANSFER_HIS_VIEW.unique_id
  is '物理唯一ID';

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
  is '病人标识';
comment on column WII_PATIENT_VISIT_HIS.visit_id
  is '住院次数';
comment on column WII_PATIENT_VISIT_HIS.inpatient_visitid
  is '住院活动号（标示每次患者住院的唯一号，可用住院号+住院次数）';
comment on column WII_PATIENT_VISIT_HIS.inpatient_no
  is '住院号, 病人住院标识（如果没有可同门诊号）,门诊病人为空';
comment on column WII_PATIENT_VISIT_HIS.dept_admission_to
  is '入院科室';
comment on column WII_PATIENT_VISIT_HIS.admission_date_time
  is '入院日期及时间';
comment on column WII_PATIENT_VISIT_HIS.dept_discharge_from
  is '出院科室';
comment on column WII_PATIENT_VISIT_HIS.discharge_date_time
  is '出院日期及时间';
comment on column WII_PATIENT_VISIT_HIS.occupation
  is '职业';
comment on column WII_PATIENT_VISIT_HIS.marital_status
  is '婚姻状况';
comment on column WII_PATIENT_VISIT_HIS.charge_type
  is '费别';
comment on column WII_PATIENT_VISIT_HIS.insurance_type
  is '医疗保险类别';
comment on column WII_PATIENT_VISIT_HIS.insurance_no
  is '医疗保险号';
comment on column WII_PATIENT_VISIT_HIS.service_agency
  is '工作单位';
comment on column WII_PATIENT_VISIT_HIS.mailing_address
  is '通信地址';
comment on column WII_PATIENT_VISIT_HIS.zip_code
  is '邮政编码';
comment on column WII_PATIENT_VISIT_HIS.next_of_kin
  is '联系人姓名';
comment on column WII_PATIENT_VISIT_HIS.relationship
  is '与联系人关系';
comment on column WII_PATIENT_VISIT_HIS.next_of_kin_addr
  is '联系人地址';
comment on column WII_PATIENT_VISIT_HIS.next_of_kin_zipcode
  is '联系人邮政编码';
comment on column WII_PATIENT_VISIT_HIS.next_of_kin_phone
  is '联系人电话';
comment on column WII_PATIENT_VISIT_HIS.admitted_by
  is '办理住院者';
comment on column WII_PATIENT_VISIT_HIS.patient_source
  is '入院方式代码（门诊、急诊、转入等）';
comment on column WII_PATIENT_VISIT_HIS.discharge_disposition
  is '离院方式  (医嘱离院，医嘱转院，医嘱转社区卫生服务机构，非医嘱离院，其他)';
comment on column WII_PATIENT_VISIT_HIS.admission_cause
  is '住院原因';
comment on column WII_PATIENT_VISIT_HIS.consulting_date
  is '接诊日期 ？';
comment on column WII_PATIENT_VISIT_HIS.consulting_doctor
  is '门诊医师 急诊？接诊医生';
comment on column WII_PATIENT_VISIT_HIS.director
  is '科主任';
comment on column WII_PATIENT_VISIT_HIS.attending_doctor
  is '主治医师';
comment on column WII_PATIENT_VISIT_HIS.doctor_in_charge
  is '主管医师';
comment on column WII_PATIENT_VISIT_HIS.total_costs
  is '总费用';
comment on column WII_PATIENT_VISIT_HIS.total_payments
  is '实付费用';
comment on column WII_PATIENT_VISIT_HIS.patient_adm_condition
  is '入院病情 ？ 指哪些内容？';
comment on column WII_PATIENT_VISIT_HIS.body_height
  is '身高';
comment on column WII_PATIENT_VISIT_HIS.body_weight
  is '体重';
comment on column WII_PATIENT_VISIT_HIS.blood_type
  is 'ABO血型';
comment on column WII_PATIENT_VISIT_HIS.blood_type_rh
  is 'Rh血型';
comment on column WII_PATIENT_VISIT_HIS.patient_condition
  is '病人情况';
comment on column WII_PATIENT_VISIT_HIS.spec_level_nurs_days
  is '特别护理天数';
comment on column WII_PATIENT_VISIT_HIS.first_level_nurs_days
  is '一级护理天数';
comment on column WII_PATIENT_VISIT_HIS.second_level_nurs_days
  is '二级护理天数';
comment on column WII_PATIENT_VISIT_HIS.serious_cond_days
  is '病重天数';
comment on column WII_PATIENT_VISIT_HIS.critical_cond_days
  is '病危天数';
comment on column WII_PATIENT_VISIT_HIS.icu_days
  is 'ICU天数';
comment on column WII_PATIENT_VISIT_HIS.abnormal
  is '阳性标志';
comment on column WII_PATIENT_VISIT_HIS.infusion_react_times
  is '输液反应次数';
comment on column WII_PATIENT_VISIT_HIS.blood_tran_times
  is '输血次数';
comment on column WII_PATIENT_VISIT_HIS.blood_tran_vol
  is '输血总量';
comment on column WII_PATIENT_VISIT_HIS.blood_tran_react_times
  is '输血反应次数';
comment on column WII_PATIENT_VISIT_HIS.alergy_drugs
  is '过敏药物';
comment on column WII_PATIENT_VISIT_HIS.adverse_reaction_drugs
  is '不良反应药物';
comment on column WII_PATIENT_VISIT_HIS.decubital_ulcer_times
  is '发生褥疮次数';
comment on column WII_PATIENT_VISIT_HIS.emer_treat_times
  is '抢救次数';
comment on column WII_PATIENT_VISIT_HIS.esc_emer_times
  is '抢救成功次数';
comment on column WII_PATIENT_VISIT_HIS.autopsy_indicator
  is '尸检标识';
comment on column WII_PATIENT_VISIT_HIS.mr_value
  is '病案价值';
comment on column WII_PATIENT_VISIT_HIS.mr_quality
  is '病案质量';
comment on column WII_PATIENT_VISIT_HIS.follow_indicator
  is '随访标志';
comment on column WII_PATIENT_VISIT_HIS.follow_interval
  is '随访间隔时间';
comment on column WII_PATIENT_VISIT_HIS.follow_interval_units
  is '随访间隔时间单位';
comment on column WII_PATIENT_VISIT_HIS.catalog_date
  is '编目日期';
comment on column WII_PATIENT_VISIT_HIS.cataloger
  is '编目人';
comment on column WII_PATIENT_VISIT_HIS.current_ward_code
  is '当前所在病区';
comment on column WII_PATIENT_VISIT_HIS.operate_code
  is '手术编号';
comment on column WII_PATIENT_VISIT_HIS.operate_name
  is '手术名称';
comment on column WII_PATIENT_VISIT_HIS.operate_time
  is '手术时间';
comment on column WII_PATIENT_VISIT_HIS.unique_id
  is '物理唯一ID';
comment on column WII_PATIENT_VISIT_HIS.nationality_code
  is '国籍代码';
comment on column WII_PATIENT_VISIT_HIS.birth_place
  is '出生地';
comment on column WII_PATIENT_VISIT_HIS.native_place
  is '籍贯';
comment on column WII_PATIENT_VISIT_HIS.nation_code
  is '民族编号';
comment on column WII_PATIENT_VISIT_HIS.id_card
  is '身份证号';
comment on column WII_PATIENT_VISIT_HIS.home_phone
  is '家庭电话';
comment on column WII_PATIENT_VISIT_HIS.native_address
  is '户口地址';
comment on column WII_PATIENT_VISIT_HIS.native_zipcode
  is '户口邮政编码';
comment on column WII_PATIENT_VISIT_HIS.service_phone
  is '工作单位电话';
comment on column WII_PATIENT_VISIT_HIS.service_zipcode
  is '工作单位邮政编码';
comment on column WII_PATIENT_VISIT_HIS.nursing_class
  is '护理级别';
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
  is '操作ID';
comment on column WII_PDA_OPERATE_HIS.patient_id
  is '患者编号';
comment on column WII_PDA_OPERATE_HIS.module_id
  is '模块编号';
comment on column WII_PDA_OPERATE_HIS.module_name
  is '模块名称';
comment on column WII_PDA_OPERATE_HIS.time_point
  is '业务时间点';
comment on column WII_PDA_OPERATE_HIS.module_items
  is '模块子项codes';
comment on column WII_PDA_OPERATE_HIS.operate_desc
  is '对应模块值';
comment on column WII_PDA_OPERATE_HIS.operator
  is '操作人';
comment on column WII_PDA_OPERATE_HIS.operate_time
  is '操作时间';
comment on column WII_PDA_OPERATE_HIS.group_code
  is '分组标识';
comment on column WII_PDA_OPERATE_HIS.operator_name
  is '操作人姓名';

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
  is '配置字典id，自增长';
comment on column WII_PERFORMANCE_DIC.name
  is '名称';
comment on column WII_PERFORMANCE_DIC.unit
  is '单位';
comment on column WII_PERFORMANCE_DIC.type
  is '项目类型（基数，系数）';
comment on column WII_PERFORMANCE_DIC.memo
  is '备注';

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
  is '打分主表的ID，对应WII_PERFORMANCE_SCORE_MAIN的自增长';
comment on column WII_PERFORMANCE_SCORE_DETAIL.user_id
  is '人员ID';
comment on column WII_PERFORMANCE_SCORE_DETAIL.dic_id
  is '打分字典的ID，对应WII_PERFORMANCE_DIC表';
comment on column WII_PERFORMANCE_SCORE_DETAIL.score
  is '分值
';
comment on column WII_PERFORMANCE_SCORE_DETAIL.create_time
  is '创建时间';
comment on column WII_PERFORMANCE_SCORE_DETAIL.creator
  is '创建人';
comment on column WII_PERFORMANCE_SCORE_DETAIL.modifier
  is '修改人';
comment on column WII_PERFORMANCE_SCORE_DETAIL.modify_time
  is '修改时间';
comment on column WII_PERFORMANCE_SCORE_DETAIL.unique_id
  is '物理唯一ID';

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
  is '用户ID
';
comment on column WII_PERFORMANCE_SCORE_LOG.month
  is '绩效月份
';
comment on column WII_PERFORMANCE_SCORE_LOG.dic_id
  is '字典ID，对应WII_PERFORMANCE_DIC
';
comment on column WII_PERFORMANCE_SCORE_LOG.reason
  is '原因
';
comment on column WII_PERFORMANCE_SCORE_LOG.before_score
  is '修改之前的分值
';
comment on column WII_PERFORMANCE_SCORE_LOG.modifier
  is '修改人';
comment on column WII_PERFORMANCE_SCORE_LOG.modify_time
  is '修改时间';
comment on column WII_PERFORMANCE_SCORE_LOG.unique_id
  is '物理唯一ID';

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
  is '自增长id';
comment on column WII_PERFORMANCE_SCORE_MAIN.perf_main_id
  is '主打分法id';
comment on column WII_PERFORMANCE_SCORE_MAIN.month
  is '月份';
comment on column WII_PERFORMANCE_SCORE_MAIN.create_time
  is '创建时间';
comment on column WII_PERFORMANCE_SCORE_MAIN.creator
  is '创建人';
comment on column WII_PERFORMANCE_SCORE_MAIN.modifier
  is '修改人';
comment on column WII_PERFORMANCE_SCORE_MAIN.modify_time
  is '修改时间';
comment on column WII_PERFORMANCE_SCORE_MAIN.is_lock
  is '是否锁定';
comment on column WII_PERFORMANCE_SCORE_MAIN.unique_id
  is '物理唯一ID';

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
  is '自增长Id';
comment on column WII_PERFORMANCE_TITLE_DETAIL.dic_id
  is '考核字典ID';
comment on column WII_PERFORMANCE_TITLE_DETAIL.weighting_score
  is '权重分值';
comment on column WII_PERFORMANCE_TITLE_DETAIL.memo
  is '备注';
comment on column WII_PERFORMANCE_TITLE_DETAIL.create_time
  is '创建时间';
comment on column WII_PERFORMANCE_TITLE_DETAIL.creator
  is '创建人';
comment on column WII_PERFORMANCE_TITLE_DETAIL.modifier
  is '修改人';
comment on column WII_PERFORMANCE_TITLE_DETAIL.modify_time
  is '修改时间';
comment on column WII_PERFORMANCE_TITLE_DETAIL.main_no
  is '主表ID';
comment on column WII_PERFORMANCE_TITLE_DETAIL.unique_id
  is '物理唯一ID';

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
  is '自增长ID';
comment on column WII_PERFORMANCE_TITLE_MAIN.name
  is '打分法名称';
comment on column WII_PERFORMANCE_TITLE_MAIN.flag
  is '是否可用';
comment on column WII_PERFORMANCE_TITLE_MAIN.memo
  is '备注';
comment on column WII_PERFORMANCE_TITLE_MAIN.create_time
  is '创建时间';
comment on column WII_PERFORMANCE_TITLE_MAIN.creator
  is '创建人';
comment on column WII_PERFORMANCE_TITLE_MAIN.modifier
  is '修改人';
comment on column WII_PERFORMANCE_TITLE_MAIN.modify_time
  is '修改时间';
comment on column WII_PERFORMANCE_TITLE_MAIN.expiredtime
  is '过期时间';
comment on column WII_PERFORMANCE_TITLE_MAIN.unique_id
  is '物理唯一ID';

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
  is '类别编码';
comment on column WII_PHARMACY_CAT_DIC.cat_name
  is '类别名称';
comment on column WII_PHARMACY_CAT_DIC.parentcat_code
  is '父类别编码';
comment on column WII_PHARMACY_CAT_DIC.input_code
  is '快捷输入码';
comment on column WII_PHARMACY_CAT_DIC.unique_id
  is '物理唯一ID';

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
  is 'HIS药品名称编码
';
comment on column WII_PHARMACY_DIC.pharmacy_chemname
  is 'HIS药品名称 - 化学名称
';
comment on column WII_PHARMACY_DIC.pharmacy_goodsname
  is 'HIS商品名称（通用名称PHARMACY_GOODSNAME)
';
comment on column WII_PHARMACY_DIC.pharmacy_abbrev
  is 'HIS药品简称
';
comment on column WII_PHARMACY_DIC.pharmacy_spec
  is '规格 (例如：10支/盒)
';
comment on column WII_PHARMACY_DIC.spec_unit
  is '规格单位 （例如：盒）
';
comment on column WII_PHARMACY_DIC.pharmacy_form
  is '剂型
';
comment on column WII_PHARMACY_DIC.supplier_name
  is '厂商
';
comment on column WII_PHARMACY_DIC.dose_per_unit
  is '最小单位剂量（10ml/支）
';
comment on column WII_PHARMACY_DIC.dose_units
  is '剂量单位（ml）
';
comment on column WII_PHARMACY_DIC.phy_function1
  is '一级药理分类名称
';
comment on column WII_PHARMACY_DIC.phy_function2
  is '二级药理分类名称
';
comment on column WII_PHARMACY_DIC.phy_function3
  is '三级药理分类名称
';
comment on column WII_PHARMACY_DIC.pharm_cat_cis_code
  is '对应HIS的CIS药品分类编码（药品药理作用类别字典）
';
comment on column WII_PHARMACY_DIC.anesthetic_type
  is '麻醉药类型
';
comment on column WII_PHARMACY_DIC.pharmacy_attribute
  is '药品属性（如中药饮片、原料药、普药、其他等）
';
comment on column WII_PHARMACY_DIC.input_code
  is '输入首字母(快捷输入）
';
comment on column WII_PHARMACY_DIC.memo
  is '备注';
comment on column WII_PHARMACY_DIC.valid
  is '有效性（0-无效，1-有效）';

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
  is '药品编码';
comment on column WII_PHARMACY_DIC_REGULAR.pharmacy_chemname
  is '药品名称';
comment on column WII_PHARMACY_DIC_REGULAR.dose_per_unit_solid
  is '固体单位量';
comment on column WII_PHARMACY_DIC_REGULAR.dose_units_solid
  is '固体单位';
comment on column WII_PHARMACY_DIC_REGULAR.dose_per_unit_liquid
  is '液体单位量';
comment on column WII_PHARMACY_DIC_REGULAR.dose_units_liquid
  is '液体单位';
comment on column WII_PHARMACY_DIC_REGULAR.concentration
  is '浓度';
comment on column WII_PHARMACY_DIC_REGULAR.rate
  is '用户日常使用次数';
comment on column WII_PHARMACY_DIC_REGULAR.rec_md5
  is '记录的MD5值，用于判断记录是否一致（除rate）';
comment on column WII_PHARMACY_DIC_REGULAR.rec_time
  is '最后记录时间';
comment on column WII_PHARMACY_DIC_REGULAR.speed_units
  is '流速单位';
comment on column WII_PHARMACY_DIC_REGULAR.creator
  is '创建人';
comment on column WII_PHARMACY_DIC_REGULAR.create_time
  is '创建时间';
comment on column WII_PHARMACY_DIC_REGULAR.modifier
  is '修改人';
comment on column WII_PHARMACY_DIC_REGULAR.modify_time
  is '修改时间';
comment on column WII_PHARMACY_DIC_REGULAR.unique_id
  is '物理唯一ID';

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
  is '抗凝药品编码';
comment on column WII_PHARM_ANTICOAGULATION_DIC.anticoagulation_pharm_name_c
  is '抗凝药品中文名称';
comment on column WII_PHARM_ANTICOAGULATION_DIC.anticoagulation_pharm_alias_c
  is '抗凝药品中文别名';
comment on column WII_PHARM_ANTICOAGULATION_DIC.anticoagulation_pharm_name_e
  is '抗凝药品英文名称';
comment on column WII_PHARM_ANTICOAGULATION_DIC.input_code
  is '首字母';
comment on column WII_PHARM_ANTICOAGULATION_DIC.memo
  is '备注';
comment on column WII_PHARM_ANTICOAGULATION_DIC.valid
  is '有效性(0:无效  1:有效)';
comment on column WII_PHARM_ANTICOAGULATION_DIC.pharmacy_code
  is '对应药品编码';

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
  is '广谱抗生素药品编码';
comment on column WII_PHARM_B_BIOTICS_DIC.bbiotics_pharm_name_c
  is '广谱抗生素药品中文名称';
comment on column WII_PHARM_B_BIOTICS_DIC.bbiotics_pharm_alias_c
  is '广谱抗生素药品中文别名';
comment on column WII_PHARM_B_BIOTICS_DIC.bbiotics_pharm_name_e
  is '广谱抗生素药品英文名称';
comment on column WII_PHARM_B_BIOTICS_DIC.med_route_ciscode
  is '给药途径';
comment on column WII_PHARM_B_BIOTICS_DIC.unit
  is '剂量单位';
comment on column WII_PHARM_B_BIOTICS_DIC.pack_quan
  is '包装规格剂量';
comment on column WII_PHARM_B_BIOTICS_DIC.input_code
  is '输入首字母(快捷输入）';
comment on column WII_PHARM_B_BIOTICS_DIC.memo
  is '备注';
comment on column WII_PHARM_B_BIOTICS_DIC.valid
  is '有效性（0_无效，1_有效）';
comment on column WII_PHARM_B_BIOTICS_DIC.pharmacy_code
  is '对应药品编码';
comment on column WII_PHARM_B_BIOTICS_DIC.duration
  is '持续时间（小时）';

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
  is '类型编号';
comment on column WII_PHARM_CATEGORY_DIC.category_name
  is '类型名称';
comment on column WII_PHARM_CATEGORY_DIC.pharm_code
  is 'CIS药品编号';
comment on column WII_PHARM_CATEGORY_DIC.pharm_name
  is 'CIS药品名称';
comment on column WII_PHARM_CATEGORY_DIC.pharmacy_code
  is 'HIS药品编号';
comment on column WII_PHARM_CATEGORY_DIC.pharmacy_chemname
  is 'HIS药品化学名称';
comment on column WII_PHARM_CATEGORY_DIC.pharmacy_goodsname
  is 'HIS药品商品名称';
comment on column WII_PHARM_CATEGORY_DIC.custom_match
  is '药品关键字 1、如果有关键字，以关键字判断，药品编码就无效 2、如果是正则表达式，以^开头';
comment on column WII_PHARM_CATEGORY_DIC.input_code
  is '快速录入';
comment on column WII_PHARM_CATEGORY_DIC.memo
  is '备注';
comment on column WII_PHARM_CATEGORY_DIC.valid
  is '有效性（0-无效，1-有效）';

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
  is '胶体药物匹配字典';
comment on column WII_PHARM_COLLOID_DIC.colloid_class_code
  is '胶体药品亚类编码';
comment on column WII_PHARM_COLLOID_DIC.colloid_class_name_c
  is '胶体药品亚类中文名称';
comment on column WII_PHARM_COLLOID_DIC.blood_type_name
  is '血制品名称';
comment on column WII_PHARM_COLLOID_DIC.pharmacy_code
  is 'HIS药品编码';
comment on column WII_PHARM_COLLOID_DIC.pharmacy_chemname
  is 'HIS药品化学名称';
comment on column WII_PHARM_COLLOID_DIC.pharmacy_goodsname
  is 'HIS药品商品名称';
comment on column WII_PHARM_COLLOID_DIC.med_route_ciscode
  is '给药途径CIS编码（可以多个途径）';
comment on column WII_PHARM_COLLOID_DIC.cclass_code
  is 'CIS分类类别编号（医嘱途径分类）';
comment on column WII_PHARM_COLLOID_DIC.input_code
  is '输入首字母(快捷输入）';
comment on column WII_PHARM_COLLOID_DIC.memo
  is '备注';
comment on column WII_PHARM_COLLOID_DIC.valid
  is '有效性（0-无效，1-有效）';

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
  is 'CIS药品剂量单位编码';
comment on column WII_PHARM_DOSEUNIT_DIC.p_doseunit_name
  is 'CIS药品剂量单位名称';
comment on column WII_PHARM_DOSEUNIT_DIC.p_doseunit_his_name
  is 'HIS药品剂量单位名称';
comment on column WII_PHARM_DOSEUNIT_DIC.input_code
  is '输入首字母(快捷输入）';
comment on column WII_PHARM_DOSEUNIT_DIC.memo
  is '备注';

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
  is 'CIS药品剂型编码';
comment on column WII_PHARM_FORMULA_DIC.p_formula_name
  is 'CIS药品剂型名称';
comment on column WII_PHARM_FORMULA_DIC.pharm_cat_his_name
  is 'HIS药品剂型名称';
comment on column WII_PHARM_FORMULA_DIC.input_code
  is '输入首字母(快捷输入）';
comment on column WII_PHARM_FORMULA_DIC.memo
  is '备注';
comment on column WII_PHARM_FORMULA_DIC.valid
  is '有效性（0-无效，1-有效）';

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
  is '广谱抗生素药品编码';
comment on column WII_PHARM_INSULIN_DIC.insulin_pharm_name_c
  is '广谱抗生素药品中文名称';
comment on column WII_PHARM_INSULIN_DIC.pharmacy_code
  is 'HIS药品编码';
comment on column WII_PHARM_INSULIN_DIC.pharmacy_chemname
  is 'HIS药品化学名称';
comment on column WII_PHARM_INSULIN_DIC.pharmacy_goodsname
  is 'HIS药品商品名称';
comment on column WII_PHARM_INSULIN_DIC.dose_per_unit
  is '最小单位剂量（10ml/支）';
comment on column WII_PHARM_INSULIN_DIC.dose_units
  is '计量单位';
comment on column WII_PHARM_INSULIN_DIC.input_code
  is '输入首字母(快捷输入）';
comment on column WII_PHARM_INSULIN_DIC.memo
  is '备注';
comment on column WII_PHARM_INSULIN_DIC.valid
  is '有效性（0-无效，1-有效）';

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
  is 'CIS抗凝药品编码';
comment on column WII_PHARM_JS_DIC.js_pharm_name_c
  is 'CIS抗凝药品中文名称';
comment on column WII_PHARM_JS_DIC.pharmacy_chemname
  is 'HIS药品化学名称';
comment on column WII_PHARM_JS_DIC.pharmacy_goodsname
  is 'HIS药品商品名称';
comment on column WII_PHARM_JS_DIC.pack_quan
  is 'HIS包装规格剂量';
comment on column WII_PHARM_JS_DIC.unit
  is 'HIS剂量单位';
comment on column WII_PHARM_JS_DIC.med_route_ciscode
  is 'CIS给药途径';
comment on column WII_PHARM_JS_DIC.input_code
  is '输入首字母(快捷输入）';
comment on column WII_PHARM_JS_DIC.memo
  is '备注';
comment on column WII_PHARM_JS_DIC.valid
  is '有效性（0-无效，1-有效）';
comment on column WII_PHARM_JS_DIC.pharmacy_code
  is 'HIS 药品编码';

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
  is 'CIS抗凝药品编码';
comment on column WII_PHARM_KN_DIC.kn_pharm_name_c
  is 'CIS抗凝药品中文名称';
comment on column WII_PHARM_KN_DIC.pharmacy_code
  is 'HIS 药品编码';
comment on column WII_PHARM_KN_DIC.pharmacy_chemname
  is 'HIS药品化学名称';
comment on column WII_PHARM_KN_DIC.pharmacy_goodsname
  is 'HIS药品商品名称';
comment on column WII_PHARM_KN_DIC.pack_quan
  is 'HIS包装规格剂量';
comment on column WII_PHARM_KN_DIC.unit
  is 'HIS剂量单位';
comment on column WII_PHARM_KN_DIC.med_route_ciscode
  is 'CIS给药途径';
comment on column WII_PHARM_KN_DIC.input_code
  is '输入首字母(快捷输入）';
comment on column WII_PHARM_KN_DIC.memo
  is '备注';
comment on column WII_PHARM_KN_DIC.valid
  is '有效性（0-无效，1-有效）';

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
  is '泵入药编码';
comment on column WII_PHARM_PUMP_DIC.p_pump_name
  is '泵入药名称';
comment on column WII_PHARM_PUMP_DIC.p_pump_unit
  is '药品单位';
comment on column WII_PHARM_PUMP_DIC.p_pump_attribute
  is '属性';
comment on column WII_PHARM_PUMP_DIC.input_code
  is '输入首字母(快捷输入）';
comment on column WII_PHARM_PUMP_DIC.memo
  is '备注（特点描述）';
comment on column WII_PHARM_PUMP_DIC.valid
  is '有效性（0-无效，1-有效）';
comment on column WII_PHARM_PUMP_DIC.pharmacy_code
  is 'HIS药品编码';
comment on column WII_PHARM_PUMP_DIC.pharmacy_chemname
  is 'HIS药品化学名称';
comment on column WII_PHARM_PUMP_DIC.pharmacy_goodsname
  is 'HIS药品商品名称';

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
  is '抢救药品编码';
comment on column WII_PHARM_RESCUE_DIC.rescue_pharm_name_c
  is '抢救药品中文名称';
comment on column WII_PHARM_RESCUE_DIC.med_route_ciscode
  is '给药途径';
comment on column WII_PHARM_RESCUE_DIC.unit
  is '剂量单位';
comment on column WII_PHARM_RESCUE_DIC.pack_quan
  is '包装规格剂量';
comment on column WII_PHARM_RESCUE_DIC.input_code
  is '输入首字母(快捷输入）';
comment on column WII_PHARM_RESCUE_DIC.memo
  is '备注';
comment on column WII_PHARM_RESCUE_DIC.valid
  is '有效性（0_无效，1_有效）';
comment on column WII_PHARM_RESCUE_DIC.pharmacy_code
  is 'HIS药品编码';
comment on column WII_PHARM_RESCUE_DIC.pharmacy_chemname
  is 'HIS药品化学名称';
comment on column WII_PHARM_RESCUE_DIC.pharmacy_goodsname
  is 'HIS药品商品名称';

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
  is '血管活性药品编码';
comment on column WII_PHARM_XGHX_DIC.xghx_pharm_name_c
  is '血管活性药品中文名称';
comment on column WII_PHARM_XGHX_DIC.xghx_pharm_alias_c
  is '血管活性药品中文别名';
comment on column WII_PHARM_XGHX_DIC.xghx_pharm_name_e
  is '血管活性药品英文名称';
comment on column WII_PHARM_XGHX_DIC.med_route_ciscode
  is '给药途径';
comment on column WII_PHARM_XGHX_DIC.unit
  is '剂量单位';
comment on column WII_PHARM_XGHX_DIC.pack_quan
  is '包装规格剂量';
comment on column WII_PHARM_XGHX_DIC.input_code
  is '输入首字母(快捷输入）';
comment on column WII_PHARM_XGHX_DIC.memo
  is '备注';
comment on column WII_PHARM_XGHX_DIC.valid
  is '有效性（0_无效，1_有效）';
comment on column WII_PHARM_XGHX_DIC.pharmacy_code
  is '对应药品编码';

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
  is 'CIS药品分类编码';
comment on column WII_PHARM_YLZY_CAT_DIC.pharm_cat_cis_name
  is 'CIS药品分类编码';
comment on column WII_PHARM_YLZY_CAT_DIC.pharm_cat_his_code
  is 'HIS药品分类编码';
comment on column WII_PHARM_YLZY_CAT_DIC.his_parentcat_code
  is '父类别编码';
comment on column WII_PHARM_YLZY_CAT_DIC.pharm_cat_his_name
  is 'CIS药品分类名称';
comment on column WII_PHARM_YLZY_CAT_DIC.input_code
  is '输入首字母(快捷输入）';
comment on column WII_PHARM_YLZY_CAT_DIC.memo
  is '备注';
comment on column WII_PHARM_YLZY_CAT_DIC.valid
  is '有效性（0_无效，1_有效）';

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
  is '患者ID';
comment on column WII_PIGEONHOLE_DETAILS.doc_code
  is '文档编码';
comment on column WII_PIGEONHOLE_DETAILS.pdf_url
  is 'PDF文件保存路径';
comment on column WII_PIGEONHOLE_DETAILS.operator
  is '操作人';
comment on column WII_PIGEONHOLE_DETAILS.operate_time
  is '操作时间';
comment on column WII_PIGEONHOLE_DETAILS.creator
  is '创建人';
comment on column WII_PIGEONHOLE_DETAILS.create_time
  is '创建时间';
comment on column WII_PIGEONHOLE_DETAILS.unique_id
  is '物理唯一ID';

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
  is '文档编码';
comment on column WII_PIGEONHOLE_METHOD.method
  is '接口方法名称';
comment on column WII_PIGEONHOLE_METHOD.memo
  is '接口方法备注';
comment on column WII_PIGEONHOLE_METHOD.creator
  is '创建人';
comment on column WII_PIGEONHOLE_METHOD.create_time
  is '创建时间';
comment on column WII_PIGEONHOLE_METHOD.unique_id
  is '物理唯一ID';

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
  is '文档编码';
comment on column WII_PIGEONHOLE_MODULE.doc_name
  is '文档名称';
comment on column WII_PIGEONHOLE_MODULE.doc_type
  is '文档类型(院内/科室)';
comment on column WII_PIGEONHOLE_MODULE.all_locking
  is '全部锁定(1/0)';
comment on column WII_PIGEONHOLE_MODULE.memo
  is '备注（特点描述）';
comment on column WII_PIGEONHOLE_MODULE.creator
  is '创建人';
comment on column WII_PIGEONHOLE_MODULE.create_time
  is '创建时间';
comment on column WII_PIGEONHOLE_MODULE.sort
  is '排序';
comment on column WII_PIGEONHOLE_MODULE.unique_id
  is '物理唯一ID';
comment on column WII_PIGEONHOLE_MODULE.html
  is '页面';
comment on column WII_PIGEONHOLE_MODULE.return_url
  is '静态页面URL';

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
  is '患者ID';
comment on column WII_PIGEONHOLE_REMIND.remind
  is '归档提醒(1不再提醒)';
comment on column WII_PIGEONHOLE_REMIND.creator
  is '创建人';
comment on column WII_PIGEONHOLE_REMIND.create_time
  is '创建时间';
comment on column WII_PIGEONHOLE_REMIND.unique_id
  is '物理唯一ID';

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
  is '病区编号';
comment on column WII_PORTAL_NOTICE.release_time
  is '发布时间';
comment on column WII_PORTAL_NOTICE.expired_time
  is '过期时间';
comment on column WII_PORTAL_NOTICE.title
  is '标题';
comment on column WII_PORTAL_NOTICE.author
  is '作者';
comment on column WII_PORTAL_NOTICE.content
  is '内容';
comment on column WII_PORTAL_NOTICE.abstract
  is '摘要';
comment on column WII_PORTAL_NOTICE.key_word
  is '关键词';
comment on column WII_PORTAL_NOTICE.memo
  is '备注';
comment on column WII_PORTAL_NOTICE.link
  is '链接网址';
comment on column WII_PORTAL_NOTICE.status
  is '状态（启用、作废等）';
comment on column WII_PORTAL_NOTICE.creator
  is '创建人';
comment on column WII_PORTAL_NOTICE.create_time
  is '创建时间';
comment on column WII_PORTAL_NOTICE.modifier
  is '修改人';
comment on column WII_PORTAL_NOTICE.modify_time
  is '修改时间';
comment on column WII_PORTAL_NOTICE.unique_id
  is '物理唯一ID';

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
  is '患者编号';
comment on column WII_POSTOP_MONITOR.visit_id
  is '住院次数';
comment on column WII_POSTOP_MONITOR.operation_id
  is '手术ID';
comment on column WII_POSTOP_MONITOR.start_time
  is '开始时间';
comment on column WII_POSTOP_MONITOR.end_time
  is '结束时间';
comment on column WII_POSTOP_MONITOR.frequency
  is '频率';
comment on column WII_POSTOP_MONITOR.monitor_items
  is '监测项目';
comment on column WII_POSTOP_MONITOR.ward_code
  is '病区编号';
comment on column WII_POSTOP_MONITOR.operator
  is '操作人';
comment on column WII_POSTOP_MONITOR.memo
  is '备注';
comment on column WII_POSTOP_MONITOR.creator
  is '创建人';
comment on column WII_POSTOP_MONITOR.create_time
  is '创建时间';
comment on column WII_POSTOP_MONITOR.modifier
  is '修改人';
comment on column WII_POSTOP_MONITOR.modify_time
  is '修改时间';
comment on column WII_POSTOP_MONITOR.unique_id
  is '物理唯一ID';
comment on column WII_POSTOP_MONITOR.out_ward_time
  is '出科去手术室时间';
comment on column WII_POSTOP_MONITOR.in_ward_time
  is '从手术室回来时间';

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
  is 'IP地址';
comment on column WII_PRINT_CONFIG.print_name
  is '打印机名称';
comment on column WII_PRINT_CONFIG.print_size
  is '纸张';
comment on column WII_PRINT_CONFIG.create_time
  is '创建时间';
comment on column WII_PRINT_CONFIG.creator
  is '创建人';
comment on column WII_PRINT_CONFIG.modify_by
  is '修改人';
comment on column WII_PRINT_CONFIG.modify_time
  is '修改时间';

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
  is '操作项目编码';
comment on column WII_PROCEDURE_DIC.procedure_name
  is '操作项目名称';
comment on column WII_PROCEDURE_DIC.procedure_category
  is '操作项目类别（基础护理操作，呼吸、循环….--中大归类）';
comment on column WII_PROCEDURE_DIC.procedure_describe
  is '操作描述（描述标准操作的流程等）';

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
  is '　病人（编号）唯一标识';
comment on column WII_PROCEDURE_EXEC_ICU.procedure_code
  is '操作项目代码';
comment on column WII_PROCEDURE_EXEC_ICU.procedure_name
  is '操作项目名称';
comment on column WII_PROCEDURE_EXEC_ICU.procedure_memo
  is '操作项目备注说明';
comment on column WII_PROCEDURE_EXEC_ICU.procedure_time
  is '操作实际执行时间';
comment on column WII_PROCEDURE_EXEC_ICU.order_no
  is '　医嘱编号';
comment on column WII_PROCEDURE_EXEC_ICU.operator
  is '操作实际执行护士';
comment on column WII_PROCEDURE_EXEC_ICU.verify_nurse
  is '操作执行核对护士';
comment on column WII_PROCEDURE_EXEC_ICU.creator
  is '创建人';
comment on column WII_PROCEDURE_EXEC_ICU.create_time
  is '创建时间';
comment on column WII_PROCEDURE_EXEC_ICU.unique_id
  is '物理唯一ID';

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
  is '病人唯一标识号';
comment on column WII_PUMP_ORDER_EXTEND_INFO.order_no
  is '医嘱组号';
comment on column WII_PUMP_ORDER_EXTEND_INFO.order_sub_no
  is '医嘱子序号';
comment on column WII_PUMP_ORDER_EXTEND_INFO.default_time
  is '默认执行日期时间';
comment on column WII_PUMP_ORDER_EXTEND_INFO.pharmacy_code
  is '药品CIS编码';
comment on column WII_PUMP_ORDER_EXTEND_INFO.pharmacy_name
  is '药品CIS名称';
comment on column WII_PUMP_ORDER_EXTEND_INFO.pharmacy_dosage
  is '药物CIS剂量';
comment on column WII_PUMP_ORDER_EXTEND_INFO.pharmacy_dosage_unit
  is '药物剂量单位';
comment on column WII_PUMP_ORDER_EXTEND_INFO.injection_code
  is '注射液药品CIS编码';
comment on column WII_PUMP_ORDER_EXTEND_INFO.injection_name
  is '注射液药品CIS名称';
comment on column WII_PUMP_ORDER_EXTEND_INFO.injection_dosage
  is '注射液剂量';
comment on column WII_PUMP_ORDER_EXTEND_INFO.injection_dosage_unit
  is '注射液剂量单位';
comment on column WII_PUMP_ORDER_EXTEND_INFO.dosing_rate_units
  is '药物流速单位';
comment on column WII_PUMP_ORDER_EXTEND_INFO.operator
  is '操作者';
comment on column WII_PUMP_ORDER_EXTEND_INFO.operate_time
  is '操作时间';
comment on column WII_PUMP_ORDER_EXTEND_INFO.memo
  is '备注';
comment on column WII_PUMP_ORDER_EXTEND_INFO.memo_time_point
  is '备注时间点';
comment on column WII_PUMP_ORDER_EXTEND_INFO.creator
  is '创建人';
comment on column WII_PUMP_ORDER_EXTEND_INFO.create_time
  is '创建时间';
comment on column WII_PUMP_ORDER_EXTEND_INFO.modifier
  is '修改人';
comment on column WII_PUMP_ORDER_EXTEND_INFO.modify_time
  is '修改时间';
comment on column WII_PUMP_ORDER_EXTEND_INFO.body_weight
  is '患者体重';
comment on column WII_PUMP_ORDER_EXTEND_INFO.weight_unit
  is '体重单位';
comment on column WII_PUMP_ORDER_EXTEND_INFO.pharmacy_his_code
  is '药品HIS编码';
comment on column WII_PUMP_ORDER_EXTEND_INFO.pharmacy_his_name
  is '药品HIS名称';
comment on column WII_PUMP_ORDER_EXTEND_INFO.injection_his_code
  is '注射液药品HIS编码';
comment on column WII_PUMP_ORDER_EXTEND_INFO.injection_his_name
  is '注射液药品HIS名称';
comment on column WII_PUMP_ORDER_EXTEND_INFO.pharmacy_liquid_dosage
  is '溶质的溶液总量';
comment on column WII_PUMP_ORDER_EXTEND_INFO.pharmacy_liquid_unit
  is '溶质的溶液单位';
comment on column WII_PUMP_ORDER_EXTEND_INFO.unique_id
  is '物理唯一ID';
comment on column WII_PUMP_ORDER_EXTEND_INFO.pharmacy_amount
  is '剩余量';
comment on column WII_PUMP_ORDER_EXTEND_INFO.concentration
  is '浓度';
comment on column WII_PUMP_ORDER_EXTEND_INFO.concentration_unit
  is '浓度单位';
comment on column WII_PUMP_ORDER_EXTEND_INFO.pharmacy_concentration
  is '药物浓度';

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
  is '流水号';
comment on column WII_QUALITY_ASSESSMENT_MASTER.ass_name
  is '考核名称';
comment on column WII_QUALITY_ASSESSMENT_MASTER.ward_code
  is '病区代码';
comment on column WII_QUALITY_ASSESSMENT_MASTER.ass_time
  is '考核时间';
comment on column WII_QUALITY_ASSESSMENT_MASTER.ass_person
  is '考核人';
comment on column WII_QUALITY_ASSESSMENT_MASTER.score_id
  is '得分ID';
comment on column WII_QUALITY_ASSESSMENT_MASTER.total_score
  is '总分';
comment on column WII_QUALITY_ASSESSMENT_MASTER.score
  is '得分';
comment on column WII_QUALITY_ASSESSMENT_MASTER.creator
  is '创建人';
comment on column WII_QUALITY_ASSESSMENT_MASTER.create_time
  is '创建时间';
comment on column WII_QUALITY_ASSESSMENT_MASTER.modifier
  is '修改人';
comment on column WII_QUALITY_ASSESSMENT_MASTER.modify_time
  is '修改时间';
comment on column WII_QUALITY_ASSESSMENT_MASTER.unique_id
  is '物理唯一ID';

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
  is '模板流水号';
comment on column WII_QUALITY_ASSESSMENT_SCORE.parent_no
  is '父节点号';
comment on column WII_QUALITY_ASSESSMENT_SCORE.item_type
  is '项类型';
comment on column WII_QUALITY_ASSESSMENT_SCORE.item_text
  is '项内容';
comment on column WII_QUALITY_ASSESSMENT_SCORE.item_score
  is '项分值';
comment on column WII_QUALITY_ASSESSMENT_SCORE.template_name
  is '模板名称';
comment on column WII_QUALITY_ASSESSMENT_SCORE.template_creator
  is '模板创建人';
comment on column WII_QUALITY_ASSESSMENT_SCORE.total_score
  is '总分';
comment on column WII_QUALITY_ASSESSMENT_SCORE.creator
  is '创建人';
comment on column WII_QUALITY_ASSESSMENT_SCORE.create_time
  is '创建时间';
comment on column WII_QUALITY_ASSESSMENT_SCORE.modifier
  is '修改人';
comment on column WII_QUALITY_ASSESSMENT_SCORE.modify_time
  is '修改时间';
comment on column WII_QUALITY_ASSESSMENT_SCORE.is_check
  is '是否勾选(1勾选/0未勾选)';
comment on column WII_QUALITY_ASSESSMENT_SCORE.score
  is '计算后的分数';
comment on column WII_QUALITY_ASSESSMENT_SCORE.unique_id
  is '物理唯一ID';

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
  is '模板流水号';
comment on column WII_QUALITY_ASSESSMENT_TEMP.parent_no
  is '父节点号';
comment on column WII_QUALITY_ASSESSMENT_TEMP.item_type
  is '项类型';
comment on column WII_QUALITY_ASSESSMENT_TEMP.item_text
  is '项内容';
comment on column WII_QUALITY_ASSESSMENT_TEMP.item_score
  is '项分值';
comment on column WII_QUALITY_ASSESSMENT_TEMP.template_name
  is '模板名称';
comment on column WII_QUALITY_ASSESSMENT_TEMP.template_creator
  is '模板创建人';
comment on column WII_QUALITY_ASSESSMENT_TEMP.total_score
  is '总分';
comment on column WII_QUALITY_ASSESSMENT_TEMP.creator
  is '创建人';
comment on column WII_QUALITY_ASSESSMENT_TEMP.create_time
  is '创建时间';
comment on column WII_QUALITY_ASSESSMENT_TEMP.modifier
  is '修改人';
comment on column WII_QUALITY_ASSESSMENT_TEMP.modify_time
  is '修改时间';
comment on column WII_QUALITY_ASSESSMENT_TEMP.unique_id
  is '物理唯一ID';

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
  is '临床质量相关事件编码
';
comment on column WII_QUALITY_EVENT_DIC.qevent_name
  is '临床质量相关事件名称
';
comment on column WII_QUALITY_EVENT_DIC.input_code
  is '快捷输入码
';
comment on column WII_QUALITY_EVENT_DIC.memo
  is '备注
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
  is '提醒计划执行表';
comment on column WII_REMIND_EXECUTE.patient_id
  is '患者编号
';
comment on column WII_REMIND_EXECUTE.remind_plan_id
  is '计划ID
';
comment on column WII_REMIND_EXECUTE.execute_time
  is '执行时间
';
comment on column WII_REMIND_EXECUTE.execute_result
  is '执行结果
"0：未执行
1：已执行"
';
comment on column WII_REMIND_EXECUTE.creator
  is '创建人
';
comment on column WII_REMIND_EXECUTE.create_time
  is '创建时间
';
comment on column WII_REMIND_EXECUTE.modifier
  is '修改人
';
comment on column WII_REMIND_EXECUTE.modify_time
  is '修改时间
';
comment on column WII_REMIND_EXECUTE.primary_key_value
  is '主键值JSON';
comment on column WII_REMIND_EXECUTE.plan_execute_time
  is '计划执行时间';
comment on column WII_REMIND_EXECUTE.message
  is '提示内容';
comment on column WII_REMIND_EXECUTE.unique_id
  is '物理唯一ID';

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
  is '提醒计划表';
comment on column WII_REMIND_PLAN.remind_plan_id
  is '自增ID
';
comment on column WII_REMIND_PLAN.remind_type
  is '提醒计划类型
"0：当日新入
1：非新入
2：所有在科
3：评分（评分时间）
4：评分（班次时间）
5：评分（连续评分相同）"
';
comment on column WII_REMIND_PLAN.remind_interval
  is '时间间隔或时间点
';
comment on column WII_REMIND_PLAN.score_code
  is '评分项目编码
';
comment on column WII_REMIND_PLAN.condition
  is '判断条件
';
comment on column WII_REMIND_PLAN.next_schedule
  is '是否下个班次开始执行
';
comment on column WII_REMIND_PLAN.message
  is '提示信息
';
comment on column WII_REMIND_PLAN.module_name
  is '跳转模块 Sign:体征，Catheter：导管,Socre:评分，Plan:护理计划,NursingMemo:护理措施';
comment on column WII_REMIND_PLAN.system_type
  is '系统类型
"Nurse：护士站
Doctor：医生站"
';
comment on column WII_REMIND_PLAN.repeat_type
  is '重复类型 (规则已经生效的情况下，是否可重复触发 0 不可重复 1可重复)';
comment on column WII_REMIND_PLAN.show_type
  is '弹框类型
"1：当日事项
2：CDSS
3：报警"
';
comment on column WII_REMIND_PLAN.creator
  is '创建人
';
comment on column WII_REMIND_PLAN.create_time
  is '创建时间
';
comment on column WII_REMIND_PLAN.modifier
  is '修改人
';
comment on column WII_REMIND_PLAN.modify_time
  is '修改时间
';
comment on column WII_REMIND_PLAN.ward_code
  is '科室编号';
comment on column WII_REMIND_PLAN.unique_id
  is '物理唯一ID';
comment on column WII_REMIND_PLAN.interval_type
  is '间隔类型  1：周  2：天  3：小时 4：分钟 5：单次';
comment on column WII_REMIND_PLAN.catheter_id
  is '导管类型编码';
comment on column WII_REMIND_PLAN.catheter_model
  is '导管型号';
comment on column WII_REMIND_PLAN.start_time
  is '开始时间';
comment on column WII_REMIND_PLAN.end_time
  is '结束时间';
comment on column WII_REMIND_PLAN.isshutdown
  is '是否中断';
comment on column WII_REMIND_PLAN.repeat_str
  is '重复标识 重复周：1/2/3/4/5/6/7，重复月：1/2/3/4/5/6/7/8/9/10………';
comment on column WII_REMIND_PLAN.repeat_count
  is '重复次数';
comment on column WII_REMIND_PLAN.remind_timepoint
  is '时间点 10:00/18:00';
comment on column WII_REMIND_PLAN.stop_remind_plan_id
  is '暂停护理提醒计划Id';
comment on column WII_REMIND_PLAN.return_url
  is '跳转地址';
comment on column WII_REMIND_PLAN.nursetempcode
  is '护理模板Code';
comment on column WII_REMIND_PLAN.nursedesc
  is '护理措施';
comment on column WII_REMIND_PLAN.return_type
  is '跳转类型 0弹出 1跳转';

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
  is '归档文件夹、档案ID';
comment on column WII_RESEARCH_ARCHIVES.archives_type
  is '1-文件夹；2档案';
comment on column WII_RESEARCH_ARCHIVES.archives_name
  is '归档文件夹、档案名称';
comment on column WII_RESEARCH_ARCHIVES.inclusion_criteria
  is '档案纳入规则';
comment on column WII_RESEARCH_ARCHIVES.exclusion_criteria
  is '档案排除规则';
comment on column WII_RESEARCH_ARCHIVES.archives_parent_id
  is '档案所属文件夹ID';
comment on column WII_RESEARCH_ARCHIVES.is_auto
  is '1-自动归档；2-手动归档';
comment on column WII_RESEARCH_ARCHIVES.creator
  is '创建人';
comment on column WII_RESEARCH_ARCHIVES.create_time
  is '创建时间';
comment on column WII_RESEARCH_ARCHIVES.modifier
  is '修改人';
comment on column WII_RESEARCH_ARCHIVES.modify_time
  is '修改时间';
comment on column WII_RESEARCH_ARCHIVES.unique_id
  is '物理唯一ID';

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
  is '自动归档数据组编号';
comment on column WII_RESEARCH_GROUP.group_name
  is '自动归档数据组名称';
comment on column WII_RESEARCH_GROUP.diagnose_code
  is '对应的诊断编码 同组以多条记录形式保存';

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
  is '项目编号';
comment on column WII_RESEARCH_ITEM_CONFIG.item_name
  is '项目名';
comment on column WII_RESEARCH_ITEM_CONFIG.is_dispaly
  is '是否显示 0:显示 1:不显示';
comment on column WII_RESEARCH_ITEM_CONFIG.group_codes
  is '所属自动归档数据组编号 空则代表所有自动归档数据组都包含此项,多个逗号分隔';

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
  is '角色ID';
comment on column WII_ROLES.domain_id
  is '域ID(学科领域：麻醉、ICU)';
comment on column WII_ROLES.role_name
  is '角色名称';
comment on column WII_ROLES.description
  is '角色描述 （ICU中心主任，ICU科室主任，主管医生，值班医生，备班医生。ICU中心护士长、病区护士长、护理组长、管床护士、科室技师等）';
comment on column WII_ROLES.create_time
  is '创建的日期';
comment on column WII_ROLES.status
  is '启用状态（0：停用
1：在用）';
comment on column WII_ROLES.unique_id
  is '物理唯一ID';
comment on column WII_ROLES.role_category
  is '角色序列（1：医生序列，2：护士序列）
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
  is '角色ID';
comment on column WII_ROLES_AUTHORITY.authority_id
  is '资源ID';
comment on column WII_ROLES_AUTHORITY.unique_id
  is '物理唯一ID';

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
  is '权限角色ID';
comment on column WII_ROLES_ORG.org_code
  is '代码';
comment on column WII_ROLES_ORG.create_time
  is '创建的日期';
comment on column WII_ROLES_ORG.creator
  is '创建人';
comment on column WII_ROLES_ORG.unique_id
  is '物理唯一ID';

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
  is '病区代码';
comment on column WII_SCHEDULE_MASTER.schedule_no
  is '班次号';
comment on column WII_SCHEDULE_MASTER.schedule_name
  is '班次名称';
comment on column WII_SCHEDULE_MASTER.start_time
  is '开始时间';
comment on column WII_SCHEDULE_MASTER.end_time
  is '结束时间';
comment on column WII_SCHEDULE_MASTER.sort
  is '班次排序';
comment on column WII_SCHEDULE_MASTER.unique_id
  is '物理唯一ID';

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
  is '人员编码';
comment on column WII_SCHEDULE_NURSE_STRUCT.ward_code
  is '人力资源组织结构层级（集团->单个医院->科室->病区）';
comment on column WII_SCHEDULE_NURSE_STRUCT.group_name
  is '排班小组名称';
comment on column WII_SCHEDULE_NURSE_STRUCT.is_director
  is '是否负责人';
comment on column WII_SCHEDULE_NURSE_STRUCT.gen_time
  is '生成时间';
comment on column WII_SCHEDULE_NURSE_STRUCT.create_time
  is '建立日期';
comment on column WII_SCHEDULE_NURSE_STRUCT.creator
  is '创建人';
comment on column WII_SCHEDULE_NURSE_STRUCT.unique_id
  is '物理唯一ID';
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
  is '备注项字典编号';
comment on column WII_SCHEDULE_REMARK.doctor_name
  is '未排班医生';
comment on column WII_SCHEDULE_REMARK.charge_year_month
  is '排班月度';
comment on column WII_SCHEDULE_REMARK.wardcode
  is '所属科室编号(逗号分隔)';
comment on column WII_SCHEDULE_REMARK.remark
  is '备注项内容';
comment on column WII_SCHEDULE_REMARK.dic_name
  is '备注项字典内容';
comment on column WII_SCHEDULE_REMARK.creator
  is '创建人';
comment on column WII_SCHEDULE_REMARK.create_time
  is '创建日期';
comment on column WII_SCHEDULE_REMARK.modifier
  is '修改人';
comment on column WII_SCHEDULE_REMARK.modify_time
  is '修改日期';
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
  is '主表id';
comment on column WII_SCHEDULING_DETAIL.schedule_date
  is '排班日期';
comment on column WII_SCHEDULING_DETAIL.user_id
  is '工号';
comment on column WII_SCHEDULING_DETAIL.schedule_no
  is '班次号';
comment on column WII_SCHEDULING_DETAIL.beds
  is '病床id，多个以分号隔开';
comment on column WII_SCHEDULING_DETAIL.create_time
  is '创建时间';
comment on column WII_SCHEDULING_DETAIL.creator
  is '创建人';
comment on column WII_SCHEDULING_DETAIL.modifier
  is '修改人';
comment on column WII_SCHEDULING_DETAIL.modify_time
  is '修改时间';
comment on column WII_SCHEDULING_DETAIL.unique_id
  is '物理唯一ID';
comment on column WII_SCHEDULING_DETAIL.duty_patientids
  is '责任病人Id(护士长分配的病人 用，分隔)';
comment on column WII_SCHEDULING_DETAIL.charge_patientids
  is '分管病人Id(我的床位显示的所有病人 用，分隔)';

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
  is '自增长ID';
comment on column WII_SCHEDULING_DETAIL_CHANGE.main_id
  is '主表id';
comment on column WII_SCHEDULING_DETAIL_CHANGE.create_date
  is '创建日期yyyyMMdd';
comment on column WII_SCHEDULING_DETAIL_CHANGE.user_id
  is '工号';
comment on column WII_SCHEDULING_DETAIL_CHANGE.schedule_no
  is '班次号';
comment on column WII_SCHEDULING_DETAIL_CHANGE.beds
  is '病床id，多个以分号隔开';
comment on column WII_SCHEDULING_DETAIL_CHANGE.create_time
  is '创建时间';
comment on column WII_SCHEDULING_DETAIL_CHANGE.creator
  is '创建人';
comment on column WII_SCHEDULING_DETAIL_CHANGE.modifier
  is '修改人';
comment on column WII_SCHEDULING_DETAIL_CHANGE.modify_time
  is '修改时间';
comment on column WII_SCHEDULING_DETAIL_CHANGE.unique_id
  is '物理唯一ID';

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
  is '工号：每个用户分配一个唯一标识号';
comment on column WII_SCHEDULING_EMPLOYEE.job
  is '岗位(字典)';
comment on column WII_SCHEDULING_EMPLOYEE.group_no
  is '组编号';
comment on column WII_SCHEDULING_EMPLOYEE.is_director
  is '是否组长';
comment on column WII_SCHEDULING_EMPLOYEE.teacher
  is '带教老师';
comment on column WII_SCHEDULING_EMPLOYEE.isschedule
  is '是否排班（如需要则另外建表）';
comment on column WII_SCHEDULING_EMPLOYEE.noschedulereason
  is '不排班原因';
comment on column WII_SCHEDULING_EMPLOYEE.qualification_level
  is '资质等级';
comment on column WII_SCHEDULING_EMPLOYEE.operate_list
  is '临床操作质目录';
comment on column WII_SCHEDULING_EMPLOYEE.create_time
  is '创建时间';
comment on column WII_SCHEDULING_EMPLOYEE.creator
  is '创建人';
comment on column WII_SCHEDULING_EMPLOYEE.modifier
  is '修改人';
comment on column WII_SCHEDULING_EMPLOYEE.modify_time
  is '修改时间';
comment on column WII_SCHEDULING_EMPLOYEE.dept_code
  is '用户所在科室的代码';
comment on column WII_SCHEDULING_EMPLOYEE.job_code
  is '例如：医生、护士等等';
comment on column WII_SCHEDULING_EMPLOYEE.title
  is '职称（比如主任、副主任、住院总等行政职位）';
comment on column WII_SCHEDULING_EMPLOYEE.grade
  is '职级 （比如教授、主任医生、主治医生、住院医生等）';
comment on column WII_SCHEDULING_EMPLOYEE.sex
  is '性别';
comment on column WII_SCHEDULING_EMPLOYEE.entry_date
  is '入职时间';
comment on column WII_SCHEDULING_EMPLOYEE.exp_date
  is '有效期';
comment on column WII_SCHEDULING_EMPLOYEE.unique_id
  is '物理唯一ID';

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
  is '流水号';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.user_id
  is '工号：每个用户分配一个唯一标识号';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.job
  is '岗位(字典)';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.group_no
  is '组编号';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.is_director
  is '是否组长';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.teacher
  is '带教老师';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.isschedule
  is '是否排班（如需要则另外建表）';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.noschedulereason
  is '不排班原因';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.qualification_level
  is '资质等级';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.operate_list
  is '临床操作质目录';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.create_time
  is '创建时间';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.creator
  is '创建人';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.modifier
  is '修改人';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.modify_time
  is '修改时间';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.dept_code
  is '用户所在科室的代码';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.job_code
  is '例如：医生、护士等等';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.title
  is '职称（比如主任、副主任、住院总等行政职位）';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.grade
  is '职级 （比如教授、主任医生、主治医生、住院医生等）';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.sex
  is '性别';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.entry_date
  is '入职时间';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.exp_date
  is '有效期';
comment on column WII_SCHEDULING_EMPLOYEE_CHANGE.unique_id
  is '物理唯一ID';

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
  is '排班组的组号
';
comment on column WII_SCHEDULING_GROUP.scheduling_type
  is '班次类型，三班OR行政
';
comment on column WII_SCHEDULING_GROUP.group_name
  is '组名称
';
comment on column WII_SCHEDULING_GROUP.ward_code
  is '病区ID
';
comment on column WII_SCHEDULING_GROUP.in_charges_nusing
  is '主管护士
';
comment on column WII_SCHEDULING_GROUP.in_charges_doctor
  is '主管医生
';
comment on column WII_SCHEDULING_GROUP.creator
  is '创建人
';
comment on column WII_SCHEDULING_GROUP.create_time
  is '创建时间
';
comment on column WII_SCHEDULING_GROUP.modifier
  is '修改人
';
comment on column WII_SCHEDULING_GROUP.modify_time
  is '修改时间
';
comment on column WII_SCHEDULING_GROUP.data_flag
  is '是否有效标识
';
comment on column WII_SCHEDULING_GROUP.unique_id
  is '物理唯一ID';
comment on column WII_SCHEDULING_GROUP.group_members
  is '组员';

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
  is '自增长ID';
comment on column WII_SCHEDULING_GROUP_CHANGE.group_no
  is '组编号';
comment on column WII_SCHEDULING_GROUP_CHANGE.scheduling_type
  is '排班类型';
comment on column WII_SCHEDULING_GROUP_CHANGE.group_name
  is '组名称';
comment on column WII_SCHEDULING_GROUP_CHANGE.ward_code
  is '病区';
comment on column WII_SCHEDULING_GROUP_CHANGE.in_charges_nusing
  is '负责护士';
comment on column WII_SCHEDULING_GROUP_CHANGE.in_charges_doctor
  is '负责医生';
comment on column WII_SCHEDULING_GROUP_CHANGE.creator
  is '创建人 ';
comment on column WII_SCHEDULING_GROUP_CHANGE.create_time
  is '创建时间';
comment on column WII_SCHEDULING_GROUP_CHANGE.modifier
  is '修改人';
comment on column WII_SCHEDULING_GROUP_CHANGE.modify_time
  is '修改时间';
comment on column WII_SCHEDULING_GROUP_CHANGE.unique_id
  is '物理唯一ID';

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
  is '流水号';
comment on column WII_SCHEDULING_MAIN.schedule_time
  is '排班时间';
comment on column WII_SCHEDULING_MAIN.ward_code
  is '病区';
comment on column WII_SCHEDULING_MAIN.operator
  is '操作人';
comment on column WII_SCHEDULING_MAIN.operate_time
  is '操作时间';
comment on column WII_SCHEDULING_MAIN.create_time
  is '创建时间';
comment on column WII_SCHEDULING_MAIN.creator
  is '创建人 ';
comment on column WII_SCHEDULING_MAIN.unique_id
  is '物理唯一ID';
comment on column WII_SCHEDULING_MAIN.schedule_no
  is '班次编号';
comment on column WII_SCHEDULING_MAIN.nurses
  is '排班护士 （用,分隔）';

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
  is '评估项目编码';
comment on column WII_SCORE_DIC.score_name_c
  is '评估项目常用名称';
comment on column WII_SCORE_DIC.score_name_full
  is '评估项目中文全称';
comment on column WII_SCORE_DIC.score_user
  is '评估项目使用者类别（N-护理类、D-医生类）';
comment on column WII_SCORE_DIC.score_orgfunc_catname
  is '评估归属器官功能评价的类别名称';
comment on column WII_SCORE_DIC.score_orgfunc_catcode
  is '评估归属器官功能评价的类别编码（1-危重度类，2-皮肤压疮类，3-镇静类、4-疼痛类、5-运动机能类、6-DVT风险类；11-神经系统类、12-呼吸系统类、13-循环系统类、14-消化系统类、15-泌尿系统类、16-多发损伤类；)';
comment on column WII_SCORE_DIC.score_seq
  is '排序';
comment on column WII_SCORE_DIC.score_html
  is '页面';
comment on column WII_SCORE_DIC.valid
  is '有效性（0-无效，1-有效）';
comment on column WII_SCORE_DIC.score_memo
  is '备注';
comment on column WII_SCORE_DIC.isconfig
  is '是否配置(0否 1是)';

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
  is '评估项目编码';
comment on column WII_SCORE_GRADE_DIC.grade_code
  is '等级编码';
comment on column WII_SCORE_GRADE_DIC.grade_name
  is '等级名称';
comment on column WII_SCORE_GRADE_DIC.grade_range
  is '等级范围';
comment on column WII_SCORE_GRADE_DIC.grade_color
  is '等级颜色';
comment on column WII_SCORE_GRADE_DIC.grade_range_config
  is '等级范围配置';

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
  is '体征参数代码';
comment on column WII_SIGNS_DIC.signs_name_c
  is '体征参数中文名称';
comment on column WII_SIGNS_DIC.signs_name_e
  is '体征参数名称英文缩写';
comment on column WII_SIGNS_DIC.item_name_alias
  is '体征参数别名';
comment on column WII_SIGNS_DIC.acquire_method
  is '监测方法（0-自动采集、1-手工输入、2-自动／手工均可、3-系统自动计算）';
comment on column WII_SIGNS_DIC.value_type
  is '值类型 （0：数字  2：下拉框）';
comment on column WII_SIGNS_DIC.signs_unit
  is '体征参数国际标准单位';
comment on column WII_SIGNS_DIC.draw_icon
  is '表示图标';
comment on column WII_SIGNS_DIC.dis_color
  is '显示颜色';
comment on column WII_SIGNS_DIC.draw_style
  is '显示情况（0-散点、1-连接折线、2-连线曲线、3-柱形图、4-数值。。。等）';
comment on column WII_SIGNS_DIC.in_or_out
  is '出入标志  (0-入量、1-出量)';
comment on column WII_SIGNS_DIC.signs_type
  is '体征类型(与出入量类型关联，见每一类上面的标注文字)';
comment on column WII_SIGNS_DIC.priority_indi
  is '优先标志（显示排序）';
comment on column WII_SIGNS_DIC.memo
  is '备注';
comment on column WII_SIGNS_DIC.input_code
  is '输入首字母(快捷输入）';
comment on column WII_SIGNS_DIC.batch_input
  is '是否批量录入项目';
comment on column WII_SIGNS_DIC.value_range
  is '体征值值域范围设定';
comment on column WII_SIGNS_DIC.can_sametime_insert
  is '是否同一时间能够输入不同值';
comment on column WII_SIGNS_DIC.general_type
  is '关联的下拉框类型Code（多个用逗号分隔）';
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
  is '系统体征代码';
comment on column WII_SIGNS_MAPPING.acquire_item_code
  is '设备采集体征项代码';
comment on column WII_SIGNS_MAPPING.acquire_item_name
  is '设备采集体征项名称';
comment on column WII_SIGNS_MAPPING.unique_id
  is '物理唯一ID';
comment on column WII_SIGNS_MAPPING.acquire_value_format
  is '采集体征项值格式';
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
  is '专科通用配置表';
comment on column WII_SPECIAL_COMMON.special_code
  is '科室编码';
comment on column WII_SPECIAL_COMMON.creator
  is '创建人';
comment on column WII_SPECIAL_COMMON.create_time
  is '创建时间';
comment on column WII_SPECIAL_COMMON.memo
  is '备注';
comment on column WII_SPECIAL_COMMON.type
  is '类型';
comment on column WII_SPECIAL_COMMON.item_code
  is '项目编码';
comment on column WII_SPECIAL_COMMON.seq_no
  is '排序';

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
  is '专科编码';
comment on column WII_SPECIAL_CONFIG.special_name
  is '专科名称';
comment on column WII_SPECIAL_CONFIG.org_code
  is '组织编码';
comment on column WII_SPECIAL_CONFIG.org_name
  is '组织名称';
comment on column WII_SPECIAL_CONFIG.authority_name
  is '资源名称';
comment on column WII_SPECIAL_CONFIG.creator
  is '创建人';
comment on column WII_SPECIAL_CONFIG.create_time
  is '创建时间';
comment on column WII_SPECIAL_CONFIG.unique_id
  is '物理唯一ID';
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
  is '科室编码';
comment on column WII_SPECIAL_DICTIONARY.dic_code
  is '字典编码';
comment on column WII_SPECIAL_DICTIONARY.creator
  is '创建人';
comment on column WII_SPECIAL_DICTIONARY.create_time
  is '创建时间';
comment on column WII_SPECIAL_DICTIONARY.memo
  is '备注';
comment on column WII_SPECIAL_DICTIONARY.type
  is '类型';
comment on column WII_SPECIAL_DICTIONARY.item_code
  is '项目编码';
comment on column WII_SPECIAL_DICTIONARY.seq_no
  is '排序';
comment on column WII_SPECIAL_DICTIONARY.authority_id
  is '授权资源ID';
comment on column WII_SPECIAL_DICTIONARY.system_module
  is '系统模块';
comment on column WII_SPECIAL_DICTIONARY.item_display_name
  is '项目显示名称';

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
  is '名称';
comment on column WII_SYSTEM_CONFIG.type
  is '类型(0 系统参数  1 科室系统参数)';
comment on column WII_SYSTEM_CONFIG.path
  is '路径';
comment on column WII_SYSTEM_CONFIG.parentname
  is '父类名称';
comment on column WII_SYSTEM_CONFIG.flag
  is '是否可用(0 不可用 1可用)';
comment on column WII_SYSTEM_CONFIG.code
  is 'Key值';
comment on column WII_SYSTEM_CONFIG.value
  is '内容';
comment on column WII_SYSTEM_CONFIG.describe
  is '描述';
comment on column WII_SYSTEM_CONFIG.moudle
  is '模块';

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
  is '用户ID';
comment on column WII_SYS_USERS.user_name
  is '用户姓名';
comment on column WII_SYS_USERS.employee_id
  is '雇员ID';
comment on column WII_SYS_USERS.login_name
  is '登录名称';
comment on column WII_SYS_USERS.login_pwd
  is '登录密码';
comment on column WII_SYS_USERS.user_type
  is '用户类型（外院、本院）';
comment on column WII_SYS_USERS.status
  is '启用状态（0：停用
1：在用）';
comment on column WII_SYS_USERS.memo
  is '备注';
comment on column WII_SYS_USERS.org_code
  is '组织代码';
comment on column WII_SYS_USERS.last_logintime
  is '上次登录时间';
comment on column WII_SYS_USERS.create_time
  is '创建时间';
comment on column WII_SYS_USERS.creator
  is '创建人';
comment on column WII_SYS_USERS.photo
  is '头像';
comment on column WII_SYS_USERS.unique_id
  is '物理唯一ID';
comment on column WII_SYS_USERS.signature_pic
  is '签名图片';

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
  is '用户ID';
comment on column WII_SYS_WIICARECS.user_name
  is '用户姓名';
comment on column WII_SYS_WIICARECS.employee_id
  is '雇员ID';
comment on column WII_SYS_WIICARECS.login_name
  is '登录名称';
comment on column WII_SYS_WIICARECS.login_pwd
  is '登录密码';
comment on column WII_SYS_WIICARECS.user_type
  is '用户类型（外院、本院）';
comment on column WII_SYS_WIICARECS.status
  is '启用状态（0：停用
1：在用）';
comment on column WII_SYS_WIICARECS.memo
  is '备注';
comment on column WII_SYS_WIICARECS.org_code
  is '组织代码';
comment on column WII_SYS_WIICARECS.last_logintime
  is '上次登录时间';
comment on column WII_SYS_WIICARECS.create_time
  is '创建时间';
comment on column WII_SYS_WIICARECS.creator
  is '创建人';
comment on column WII_SYS_WIICARECS.photo
  is '头像';
comment on column WII_SYS_WIICARECS.unique_id
  is '物理唯一ID';
comment on column WII_SYS_WIICARECS.signature_pic
  is '签名图片';

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
  is '会诊医院医生配置表';
comment on column WII_TELE_HOSPITALDOCTORCONFIG.id
  is '修改时间';
comment on column WII_TELE_HOSPITALDOCTORCONFIG.hospital_name
  is '医院名称';
comment on column WII_TELE_HOSPITALDOCTORCONFIG.doctor_name
  is '医生名称';
comment on column WII_TELE_HOSPITALDOCTORCONFIG.create_time
  is '创建时间';
comment on column WII_TELE_HOSPITALDOCTORCONFIG.creator
  is '创建人';
comment on column WII_TELE_HOSPITALDOCTORCONFIG.modify_by
  is '修改人';
comment on column WII_TELE_HOSPITALDOCTORCONFIG.modify_time
  is '修改时间';
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
  is '病人唯一标识号';
comment on column WII_TREATMENT_PLAN.inpatient_visitid
  is '住院活动号（标示每次患者住院的唯一号，可用住院号+住院次数）';
comment on column WII_TREATMENT_PLAN.plan_time
  is '计划时间';
comment on column WII_TREATMENT_PLAN.content
  is '内容';
comment on column WII_TREATMENT_PLAN.sequence
  is '排序';
comment on column WII_TREATMENT_PLAN.creator
  is '创建人';
comment on column WII_TREATMENT_PLAN.create_time
  is '创建时间';
comment on column WII_TREATMENT_PLAN.modifier
  is '修改人';
comment on column WII_TREATMENT_PLAN.modify_time
  is '修改时间';
comment on column WII_TREATMENT_PLAN.unique_id
  is '物理唯一ID';

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
  is '用户ID';
comment on column WII_USERS_ROLES.role_id
  is '角色ID';
comment on column WII_USERS_ROLES.unique_id
  is '物理唯一ID';

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
  is '用户ID';
comment on column WII_USER_PROFILEITEM.ward_code
  is '科室代码';
comment on column WII_USER_PROFILEITEM.module_code
  is '模块编码';
comment on column WII_USER_PROFILEITEM.item_code
  is '项编码';
comment on column WII_USER_PROFILEITEM.item_value
  is '项值';
comment on column WII_USER_PROFILEITEM.item_content
  is '项内容';
comment on column WII_USER_PROFILEITEM.description
  is '说明';
comment on column WII_USER_PROFILEITEM.sort_no
  is '序列号';
comment on column WII_USER_PROFILEITEM.creator
  is '创建人';
comment on column WII_USER_PROFILEITEM.create_time
  is '创建时间点';
comment on column WII_USER_PROFILEITEM.modify_time
  is '修改时间';
comment on column WII_USER_PROFILEITEM.unique_id
  is '物理唯一ID';

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
  is 'HIS医嘱类别编号';
comment on column WII_VS_HIS_ORDER_CLASS.his_class_name
  is 'HIS医嘱类别名称';
comment on column WII_VS_HIS_ORDER_CLASS.wii_class_code
  is '医嘱类别编号';
comment on column WII_VS_HIS_ORDER_CLASS.unique_id
  is '物理唯一ID';

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
(a.patient_id||a.order_no||a.order_sub_no||to_char(a.default_time,'yyyy-mm-dd,hh24:mi:ss') )as orderexecno,    --医嘱执行标识
c.device_id,                 --输液泵设备号
a.order_no,                   --医嘱组号（标识一致时为组合用药）
a.default_time,              --默认执行时间
a.patient_id,                --患者ID
b.bed_no,                    --床号
b.patient_name,              --患者姓名
d.pharmacy_code,             --药品编号
d.pharmacy_chemname as pharmacy_name,                  --药品名称
a.memo as remark             --备注
from wii_orders_icu a
join wii_patient_inward_icu b on a.patient_id=b.patient_id
join wii_device_master c on a.patient_id=c.current_patient_id --and c.device_label='输液泵'
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
     IF V_COMPARE >= F_NLSSORT('吖') AND V_COMPARE <= F_NLSSORT('驁') THEN
      V_RETURN := V_RETURN || 'A';
     ELSIF V_COMPARE >= F_NLSSORT('八') AND V_COMPARE <= F_NLSSORT('簿') THEN
      V_RETURN := V_RETURN || 'B';
     ELSIF V_COMPARE >= F_NLSSORT('嚓') AND V_COMPARE <= F_NLSSORT('錯') THEN
      V_RETURN := V_RETURN || 'C';
     ELSIF V_COMPARE >= F_NLSSORT('咑') AND V_COMPARE <= F_NLSSORT('鵽') THEN
      V_RETURN := V_RETURN || 'D';
     ELSIF V_COMPARE >= F_NLSSORT('妸') AND V_COMPARE <= F_NLSSORT('樲') THEN
      V_RETURN := V_RETURN || 'E';
     ELSIF V_COMPARE >= F_NLSSORT('发') AND V_COMPARE <= F_NLSSORT('猤') THEN
      V_RETURN := V_RETURN || 'F';
     ELSIF V_COMPARE >= F_NLSSORT('旮') AND V_COMPARE <= F_NLSSORT('腂') THEN
      V_RETURN := V_RETURN || 'G';
     ELSIF V_COMPARE >= F_NLSSORT('妎') AND V_COMPARE <= F_NLSSORT('夻') THEN
      V_RETURN := V_RETURN || 'H';
     ELSIF V_COMPARE >= F_NLSSORT('丌') AND V_COMPARE <= F_NLSSORT('攈') THEN
      V_RETURN := V_RETURN || 'J';
     ELSIF V_COMPARE >= F_NLSSORT('咔') AND V_COMPARE <= F_NLSSORT('穒') THEN
      V_RETURN := V_RETURN || 'K';
     ELSIF V_COMPARE >= F_NLSSORT('垃') AND V_COMPARE <= F_NLSSORT('擽') THEN
      V_RETURN := V_RETURN || 'L';
     ELSIF V_COMPARE >= F_NLSSORT('嘸') AND V_COMPARE <= F_NLSSORT('椧') THEN
      V_RETURN := V_RETURN || 'M';
     ELSIF V_COMPARE >= F_NLSSORT('拏') AND V_COMPARE <= F_NLSSORT('瘧') THEN
      V_RETURN := V_RETURN || 'N';
     ELSIF V_COMPARE >= F_NLSSORT('筽') AND V_COMPARE <= F_NLSSORT('漚') THEN
      V_RETURN := V_RETURN || 'O';
     ELSIF V_COMPARE >= F_NLSSORT('妑') AND V_COMPARE <= F_NLSSORT('曝') THEN
      V_RETURN := V_RETURN || 'P';
     ELSIF V_COMPARE >= F_NLSSORT('七') AND V_COMPARE <= F_NLSSORT('裠') THEN
      V_RETURN := V_RETURN || 'Q';
     ELSIF V_COMPARE >= F_NLSSORT('亽') AND V_COMPARE <= F_NLSSORT('鶸') THEN
      V_RETURN := V_RETURN || 'R';
     ELSIF V_COMPARE >= F_NLSSORT('仨') AND V_COMPARE <= F_NLSSORT('蜶') THEN
      V_RETURN := V_RETURN || 'S';
     ELSIF V_COMPARE >= F_NLSSORT('侤') AND V_COMPARE <= F_NLSSORT('籜') THEN
      V_RETURN := V_RETURN || 'T';
     ELSIF V_COMPARE >= F_NLSSORT('屲') AND V_COMPARE <= F_NLSSORT('鶩') THEN
      V_RETURN := V_RETURN || 'W';
     ELSIF V_COMPARE >= F_NLSSORT('夕') AND V_COMPARE <= F_NLSSORT('鑂') THEN
      V_RETURN := V_RETURN || 'X';
     ELSIF V_COMPARE >= F_NLSSORT('丫') AND V_COMPARE <= F_NLSSORT('韻') THEN
      V_RETURN := V_RETURN || 'Y';
     ELSIF V_COMPARE >= F_NLSSORT('帀') AND V_COMPARE <= F_NLSSORT('咗') THEN
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
