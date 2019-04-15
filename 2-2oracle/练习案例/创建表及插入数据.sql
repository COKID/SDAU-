--�����û�
conn sys/test as sysdba
DROP USER learner CASCADE;
GRANT DBA,SYSDBA TO learner IDENTIFIED BY learner;
conn learner/learner

--title��,ְ�Ʊ�
CREATE TABLE title(
  title_id NUMBER(2) CONSTRAINT pk_title PRIMARY KEY, --ְ�Ʊ��
  title_name VARCHAR2(50) NOT NULL --ְ����
);
INSERT INTO title (title_id, title_name)
VALUES (1, '����');
INSERT INTO title (title_id, title_name)
VALUES (2, '������');
INSERT INTO title (title_id, title_name)
VALUES (3, '��ʦ');
INSERT INTO title (title_id, title_name)
VALUES (4, '����');
INSERT INTO title (title_id, title_name)
VALUES (5, '�߼�����ʦ');
INSERT INTO title (title_id, title_name)
VALUES (6, '����ʦ');
INSERT INTO title (title_id, title_name)
VALUES (7, '�о�Ա');
INSERT INTO title (title_id, title_name)
VALUES (8, '���о�Ա');
INSERT INTO title (title_id, title_name)
VALUES (9, '�����о�Ա');
COMMIT;

--diploma��ѧ����
CREATE TABLE diploma(
  diploma_id NUMBER(2) CONSTRAINT pk_diploma PRIMARY KEY, --ѧ�����
  diploma_name VARCHAR2(20) NOT NULL --ѧ����
);
INSERT INTO diploma (diploma_id, diploma_name)
VALUES (1, 'ר��');
INSERT INTO diploma (diploma_id, diploma_name)
VALUES (2, '����');
INSERT INTO diploma (diploma_id, diploma_name)
VALUES (3, '˶ʿ');
INSERT INTO diploma (diploma_id, diploma_name)
VALUES (4, '��ʿ');
INSERT INTO diploma (diploma_id, diploma_name)
VALUES (5, '��ʿ��');
COMMIT;

--teacher����ʦ��
CREATE TABLE teacher(
  t_id CHAR(6) CONSTRAINT pk_teacher PRIMARY KEY, --��ʦ���
  t_name VARCHAR2(30) CONSTRAINT nn_t_name NOT NULL, --��ʦ����
  t_gender VARCHAR2(3) CONSTRAINT nn_t_gender NOT NULL CONSTRAINT chk_t_gender CHECK(t_gender IN('��','Ů')), --��ʦ�Ա�
  t_ishere VARCHAR2(10) NOT NULL, --��ְ״̬
  t_entertime DATE NOT NULL,  --��ְʱ��
  t_idcard VARCHAR2(18) UNIQUE, --���֤�ţ�ΨһԼ�� 
  t_departmentid NUMBER(2), --ϵ��
  t_duty VARCHAR2(50) NOT NULL, --ְ��
  t_titleid NUMBER(2) CONSTRAINT fk_titleid REFERENCES title(title_id), --ְ�Ʊ��
  t_titletime DATE, --ְ�ƻ��ʱ��
  t_research VARCHAR2(200), --�о�����
  t_university VARCHAR2(100) NOT NULL, --��ҵѧУ
  t_graduatetime DATE NOT NULL, --��ҵʱ��
  t_specialty VARCHAR2(100) NOT NULL, --רҵ
  t_diplomaid NUMBER(2) NOT NULL, --ѧ��
  t_birthday DATE NOT NULL, --��������
  t_marrige VARCHAR2(6) NOT NULL, --���
  CONSTRAINT fk_diploma FOREIGN KEY (t_diplomaid) REFERENCES diploma
);
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('060001', '���', '��', '��ְ', to_date('01-06-2007 13:13:14', 'dd-mm-yyyy hh24:mi:ss'), '220421197909220031', 1, '��ʦ', 3, to_date('01-06-2008', 'dd-mm-yyyy'), '������̼����������㷨', '����������ѧ', to_date('01-04-2006', 'dd-mm-yyyy'), '�����Ӧ��', 2, to_date('12-09-1979', 'dd-mm-yyyy'), 'δ��');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('060002', '����ΰ', '��', '��ְ', to_date('29-05-2006 09:30:15', 'dd-mm-yyyy hh24:mi:ss'), '130225197110048213', 1, 'ϵ����', 1, to_date('01-06-2008', 'dd-mm-yyyy'), '���ݲֿ⣬�����ھ�Web�ھ����ݿ�ϵͳ����', '���ִ�ѧ', to_date('01-06-1994', 'dd-mm-yyyy'), '�����Ӧ��', 2, to_date('04-10-1971', 'dd-mm-yyyy'), '�ѻ�');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('060003', '��˧', '��', '��ְ', to_date('08-08-2006 11:33:34', 'dd-mm-yyyy hh24:mi:ss'), '130227197803207237', 1, '��ʦ', 3, to_date('01-06-2008', 'dd-mm-yyyy'), '��������簲ȫ', '���пƼ���ѧ', to_date('01-07-2006', 'dd-mm-yyyy'), '�������ѧ�뼼��', 4, to_date('07-03-1978', 'dd-mm-yyyy'), '�ѻ�');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('060004', '����', 'Ů', '��ְ', to_date('07-05-2006 08:43:28', 'dd-mm-yyyy hh24:mi:ss'), '150304198002181518', 1, '��ʦ', 3, to_date('01-06-2008', 'dd-mm-yyyy'), '������ԡ�.net�����������ھ�', '������ͨ��ѧ', to_date('01-04-2006', 'dd-mm-yyyy'), '�����ϵͳ�ṹ', 2, to_date('18-02-1980', 'dd-mm-yyyy'), '�ѻ�');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('060005', '��˫˫', 'Ů', '��ְ', to_date('01-08-2007 09:33:24', 'dd-mm-yyyy hh24:mi:ss'), '152601198004030644', 1, '��ʦ', 4, to_date('01-06-2008', 'dd-mm-yyyy'), '�����ھ�,�ֲڼ�', '���пƼ���ѧ', to_date('01-06-2007', 'dd-mm-yyyy'), '�������ѧ�뼼��', 2, to_date('03-04-1980', 'dd-mm-yyyy'), '�ѻ�');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('060006', '������', 'Ů', '��ְ', to_date('08-08-2006 14:53:43', 'dd-mm-yyyy hh24:mi:ss'), '210201198001040012', 1, '��ʦ', 3, to_date('01-06-2008', 'dd-mm-yyyy'), '���������', '���ϴ�ѧ', to_date('01-03-2000', 'dd-mm-yyyy'), '�����Ӧ��', 2, to_date('04-01-1980', 'dd-mm-yyyy'), 'δ��');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('060007', '�', 'Ů', '��ְ', to_date('19-06-2006 13:43:21', 'dd-mm-yyyy hh24:mi:ss'), '220421197906110032', 1, '��ʦ', 3, to_date('01-06-2008', 'dd-mm-yyyy'), '�����������ƣ�������̣�.net', '��������ѧ', to_date('01-04-2005', 'dd-mm-yyyy'), '����������������', 2, to_date('11-06-1979', 'dd-mm-yyyy'), '�ѻ�');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('060008', '����', 'Ů', '��ְ', to_date('03-04-2007 08:43:46', 'dd-mm-yyyy hh24:mi:ss'), '130225197909128218', 1, '��ʦ', 4, to_date('01-06-2008', 'dd-mm-yyyy'), '�˹�����', '�������´�ѧ', to_date('01-04-2007', 'dd-mm-yyyy'), '�����Ӧ��', 4, to_date('12-09-1979', 'dd-mm-yyyy'), 'δ��');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('060009', 'ʯɺ', 'Ů', '��ְ', to_date('30-03-2007 15:56:36', 'dd-mm-yyyy hh24:mi:ss'), '130227198104167234', 1, 'ϵ������', 4, to_date('01-06-2008', 'dd-mm-yyyy'), '�����ھ�', '���ϴ�ѧ', to_date('01-03-2007', 'dd-mm-yyyy'), '�����ϵͳ�ṹ', 2, to_date('16-04-1981', 'dd-mm-yyyy'), 'δ��');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('060010', '̷���', 'Ů', '��ְ', to_date('03-04-2007 14:07:04', 'dd-mm-yyyy hh24:mi:ss'), '150304198103181518', 1, '��ʦ', 3, to_date('01-06-2008', 'dd-mm-yyyy'), '�˹����ܻ�������ȷ������ͼ�������ݿ�', '�������´�ѧ', to_date('01-04-2007', 'dd-mm-yyyy'), '�����Ӧ��', 2, to_date('18-03-1981', 'dd-mm-yyyy'), 'δ��');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('070002', '�����', 'Ů', '��ְ', to_date('04-07-2002 09:23:14', 'dd-mm-yyyy hh24:mi:ss'), '152601197502060644', 3, 'ϵ����', 2, to_date('01-06-2008', 'dd-mm-yyyy'), '��Ա���ʲ�����ʤ����ģ�͹���', '���пƼ���ѧ', to_date('01-12-2002', 'dd-mm-yyyy'), '���̹���', 3, to_date('06-02-1975', 'dd-mm-yyyy'), '�ѻ�');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('070003', '��ɭ', '��', '��ְ', to_date('30-04-2003 11:04:04', 'dd-mm-yyyy hh24:mi:ss'), '210201197611260011', 2, 'ϵ������', 3, to_date('01-06-2008', 'dd-mm-yyyy'), '���ݿ⣬���簲ȫ', '��������ѧ', to_date('01-06-2002', 'dd-mm-yyyy'), 'Ӧ����ѧ', 4, to_date('26-11-1976', 'dd-mm-yyyy'), '�ѻ�');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('070004', '�����', '��', '��ְ', to_date('19-07-2002 10:03:24', 'dd-mm-yyyy hh24:mi:ss'), '220421197201230031', 2, '��ʦ', 1, to_date('01-06-2008', 'dd-mm-yyyy'), '���������', '��������ѧ', to_date('01-04-2002', 'dd-mm-yyyy'), '�����Ӧ��', 2, to_date('23-01-1972', 'dd-mm-yyyy'), '�ѻ�');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('070005', '������', 'Ů', '��ְ', to_date('01-03-2003 14:45:33', 'dd-mm-yyyy hh24:mi:ss'), '130225197207218216', 2, '��ʦ', 2, to_date('01-06-2008', 'dd-mm-yyyy'), '�������', '������ͨ��ѧ', to_date('01-04-1997', 'dd-mm-yyyy'), '�����Ӧ��', 2, to_date('21-07-1972', 'dd-mm-yyyy'), '�ѻ�');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('070006', '������', '��', '��ְ', to_date('13-01-2003 16:23:10', 'dd-mm-yyyy hh24:mi:ss'), '130227196909227237', 3, '��ʦ', 2, to_date('01-06-2008', 'dd-mm-yyyy'), '����������', '�Ϻ���ѧ', to_date('01-04-1998', 'dd-mm-yyyy'), '���̹���', 4, to_date('22-09-1969', 'dd-mm-yyyy'), '�ѻ�');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('070007', '����', 'Ů', '��ְ', to_date('10-07-2000 15:33:19', 'dd-mm-yyyy hh24:mi:ss'), '150304197312251518', 2, '��ʦ', 1, to_date('01-06-2008', 'dd-mm-yyyy'), '����������Ϣϵͳ����', '��������ѧ', to_date('01-07-1999', 'dd-mm-yyyy'), '�����ѧ�빤��', 2, to_date('25-12-1973', 'dd-mm-yyyy'), '�ѻ�');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('070008', '���', 'Ů', '��ְ', to_date('03-04-2003 09:30:22', 'dd-mm-yyyy hh24:mi:ss'), '152601197802150644', 2, '��ʦ', 3, to_date('01-06-2008', 'dd-mm-yyyy'), '��Ϣ��ȫ��Ϊ�����簲ȫ', '���������̴�ѧ', to_date('01-04-2003', 'dd-mm-yyyy'), '�����ѧ�빤��', 2, to_date('15-02-1978', 'dd-mm-yyyy'), '�ѻ�');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('070009', '����ѩ', 'Ů', '��ְ', to_date('07-04-2003 10:02:40', 'dd-mm-yyyy hh24:mi:ss'), '210201197702040012', 3, '��ʦ', 3, to_date('01-06-2008', 'dd-mm-yyyy'), '��ҵ����������Դ����', '��������ѧ', to_date('01-04-2003', 'dd-mm-yyyy'), '���̹���', 2, to_date('24-02-1977', 'dd-mm-yyyy'), '�ѻ�');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('070010', '����ӱ', 'Ů', '��ְ', to_date('01-07-2003', 'dd-mm-yyyy hh24:mi:ss'), '220421198001040032', 2, '��ʦ', 3, to_date('01-06-2008', 'dd-mm-yyyy'), '���ݿ�����', 'ɽ����ѧ', to_date('01-02-2003', 'dd-mm-yyyy'), '�����Ӧ��', 4, to_date('04-01-1980', 'dd-mm-yyyy'), '�ѻ�');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('070011', '������', '��', '��ְ', to_date('14-04-2003 16:33:21', 'dd-mm-yyyy hh24:mi:ss'), '130225197503208213', 2, 'ϵ����', 2, to_date('01-12-2008', 'dd-mm-yyyy'), '���������', '�������ӿƼ���ѧ', to_date('01-03-2003', 'dd-mm-yyyy'), '�����ϵͳ�ṹ', 2, to_date('20-03-1975', 'dd-mm-yyyy'), '�ѻ�');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('070012', '�����', '��', '��ְ', to_date('07-01-2003 15:38:31', 'dd-mm-yyyy hh24:mi:ss'), '130227197803187237', 3, 'ϵ������', 3, to_date('01-06-2008', 'dd-mm-yyyy'), '��ҵ����', '�Ϻ���ͨ��ѧ', to_date('01-04-2003', 'dd-mm-yyyy'), '���̹���', 4, to_date('18-03-1978', 'dd-mm-yyyy'), '�ѻ�');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('070018', '��ά��', 'Ů', '��ְ', to_date('30-03-2006 08:40:10', 'dd-mm-yyyy hh24:mi:ss'), '150304198001041518', 2, '��ʦ', 3, to_date('01-06-2008', 'dd-mm-yyyy'), '�����ھ���Ϣϵͳ����', '��������ҵ��ѧ', to_date('01-01-1980', 'dd-mm-yyyy'), '�����ѧ�빤��', 2, to_date('04-01-1980', 'dd-mm-yyyy'), 'δ��');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('070019', '���ͩ', 'Ů', '��ְ', to_date('07-04-2003 10:29:16', 'dd-mm-yyyy hh24:mi:ss'), '152601197904306444', 2, '��ʦ', 3, to_date('01-06-2008', 'dd-mm-yyyy'), '���ݿ�ϵͳ', '�������ӿƼ���ѧ', to_date('01-03-2003', 'dd-mm-yyyy'), '�������ѧ�뼼��', 2, to_date('30-04-1979', 'dd-mm-yyyy'), '�ѻ�');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('070020', '����', 'Ů', '��ְ', to_date('07-11-2000 11:21:54', 'dd-mm-yyyy hh24:mi:ss'), '210201197612210012', 3, 'ϵ������', 3, to_date('01-06-2008', 'dd-mm-yyyy'), '�������á�Ӧ��ͳ��', '��������ѧ', to_date('01-07-2007', 'dd-mm-yyyy'), '���̹���', 2, to_date('21-12-1976', 'dd-mm-yyyy'), '�ѻ�');
COMMIT;

--award��,��ʦ�񽱱�
CREATE TABLE award(
  award_id NUMBER(10) CONSTRAINT pk_award PRIMARY KEY, --�񽱱��
  award_name VARCHAR2(200) NOT NULL,  --������
  award_level VARCHAR2(50) NOT NULL,  --�񽱼���
  award_time VARCHAR2(50) NOT NULL    --��ʱ��
);
INSERT INTO award (award_id, award_name, award_level, award_time)
VALUES (1, 'ʡ��һ�������������ߵȽ����飨Web���ý�弼����', '���㽱', '2007-09');
INSERT INTO award (award_id, award_name, award_level, award_time)
VALUES (2, 'ʡ�ڶ��������������ߵȽ����飨Linuxϵͳ����', '���Ƚ�', '2008-09');
INSERT INTO award (award_id, award_name, award_level, award_time)
VALUES (3, 'ʡ�ڶ��������������ߵȽ����飨Web���ý�弼����', '���Ƚ�', '2008-09');
INSERT INTO award (award_id, award_name, award_level, award_time)
VALUES (4, '����Ȼ��ѧ����ѧ������', '���Ƚ�', '2007-10');
INSERT INTO award (award_id, award_name, award_level, award_time)
VALUES (5, '2010��ȫ�������ʦ����������������Ĵ���', '���㽱', '2005-12');
COMMIT;

--award_author��,��ʦ�񽱱�
CREATE TABLE award_author(
  award_id NUMBER(10),   --�񽱱��
  t_id CHAR(6),          --��ʦ���
  award_sequence NUMBER(2) NOT NULL,   --������
  CONSTRAINT pk_award_author PRIMARY KEY(award_id,t_id),
  CONSTRAINT fk_award_id FOREIGN KEY (award_id) REFERENCES award(award_id),
  CONSTRAINT fk_award_t_id FOREIGN KEY (t_id) REFERENCES teacher(t_id)
);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (1, '060002', 1);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (1, '060008', 2);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (1, '070005', 3);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (2, '060001', 1);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (2, '060002', 2);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (2, '060006', 3);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (2, '060007', 4);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (3, '070003', 1);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (3, '070018', 2);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (3, '070005', 3);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (3, '070004', 4);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (3, '070019', 5);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (3, '070008', 6);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (4, '070007', 1);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (4, '070003', 2);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (5, '060010', 1);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (5, '060005', 2);
COMMIT;

--course���γ̱�
CREATE TABLE course(
	c_term VARCHAR2(20) NOT NULL, --ѧ��
	c_num CHAR(6) NOT NULL,  --�γ̱��
	c_seq VARCHAR2(2) NOT NULL, --�����
	c_name VARCHAR2(80) NOT NULL, --�γ�����
	c_ename VARCHAR2(80) NOT NULL, --�γ�Ӣ������
	c_type VARCHAR2(30) NOT NULL, --�γ����
	c_nature VARCHAR2(30) NOT NULL, --�γ�����
	c_thours NUMBER(3) NOT NULL, --��ѧʱ
	c_credits NUMBER(3,1) NOT NULL, --ѧ��
	c_class VARCHAR2(200), --�Ͽΰ༶
	c_togeclass NUMBER(2), --�ϰ���
	c_stunum NUMBER(4), --ѧ����
	t_id CHAR(6), --�ον�ʦ
	c_theoryhours NUMBER(3) NOT NULL, --����ѧʱ
	c_designhours NUMBER(3) DEFAULT 0 NOT NULL, --���ѧʱ
	c_prachours NUMBER(3) DEFAULT 0 NOT NULL, --�ϻ�ѧʱ
	c_common NUMBER(2,1) NOT NULL, --ƽʱ�ɼ�Ȩ��
	c_final NUMBER(2,1) NOT NULL, --��ĩ�ɼ�Ȩ��
	c_assway VARCHAR2(20) NOT NULL, --���˷�ʽ
	CONSTRAINT pk_course PRIMARY KEY(c_term,c_seq,c_num),	
  CONSTRAINT fk_course FOREIGN KEY (t_id) REFERENCES teacher(t_id)
);
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '060151', '0', '�������������', 'OBJECT ORIENTED PROGRAMMING', 'רҵ��ѡ', '��ѡ��', 40, 2, '�Ź�081;�Ź�082', 2, 64, '070004', 24, 0, 16, 1, .7, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '060164', '0', '�������ݿ����', 'FUNDAMENTALS OF NETWORK DATABASE', 'רҵ��ѡ', '��ѡ��', 40, 2, '�Ź�081;�Ź�082', 2, 64, '070004', 24, 0, 16, 1, .7, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070197', '0', '����֧��ϵͳ', 'DECISION SUPPORT SYSTEMS', 'רҵ��ѡ', '��ѡ��', 32, 2, '�Ź�072;�Ź�071;����083;����082;����081', 5, 200, '070019', 32, 0, 0, 1, .7, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070427', '0', 'רҵӢ��', 'SPECIAL ENGLISH', 'רҵ����', '���޿�', 32, 2, '����081;����082;����083', 3, 96, '070018', 32, 0, 0, 1, .8, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070011', '1', '��������', 'E-COMMERCE', 'ѧ�ƻ���', '���޿�', 48, 2.5, '����081;����082;����083', 3, 96, '070007', 32, 0, 0, 1, .8, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070017', '0', '������Ϣϵͳ', 'MANAGEMENT INFORMATION SYSTEMS', 'ѧ�ƻ���', '���޿�', 48, 3, '����081;����082;����083', 3, 96, '070007', 40, 0, 0, 1, .8, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070171', '2', '��Ӧ������', 'Supply Chain Management', 'רҵ����', '���޿�', 32, 2, '����081;����082;����083', 3, 96, '070007', 24, 0, 0, 1, .8, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070005', '0', '�������', 'FINANCIAL MANAGEMENT', 'ѧ�ƻ���', '���޿�', 48, 3, '����081;����082;����083', 3, 96, '070006', 48, 0, 0, 1, .8, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070005', '1', '�������', 'FINANCIAL MANAGEMENT', 'רҵ����', '���޿�', 48, 3, '����081;����082;����083', 3, 96, '070006', 48, 0, 0, 1, .8, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070011', '0', '��������', 'E-COMMERCE', 'רҵ����', '���޿�', 48, 2.5, '����081;����082;����083', 3, 96, '070007', 32, 0, 0, 1, .8, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070019', '0', '����ѧ', 'MANAGEMENT', 'ѧ�ƻ���', '���޿�', 56, 3.5, '����091;����092;����093;�Ź�092;�Ź�091', 5, 170, '070002', 48, 0, 0, 1, .8, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070019', '1', '����ѧ', 'MANAGEMENT', 'ѧ�ƻ���', '���޿�', 56, 3.5, '����091;����092;����093', 3, 102, '070002', 48, 0, 0, 1, .8, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070019', '2', '����ѧ', 'MANAGEMENT', 'ѧ�ƻ���', '���޿�', 56, 3.5, '��ó091;��ó092;��ó093;��ó094', 5, 166, '070002', 48, 0, 0, 1, .8, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070019', '3', '����ѧ', 'MANAGEMENT', 'ѧ�ƻ���', '���޿�', 56, 3.5, '����091;����092;����093;��������091', 4, 136, '070012', 48, 0, 0, 1, .8, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070043', '0', '���÷�', 'ECONOMICS LAWS', 'ѧ�ƻ���', '���޿�', 48, 3, '����091;����092;����093', 3, 102, '070009', 48, 0, 0, 1, .8, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070067', '0', '�г�Ӫ��ѧ', 'MARKETING', 'ѧ�ƻ���', '���޿�', 48, 3, '��������091', 1, 34, '070012', 48, 0, 0, 1, .8, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070067', '1', '�г�Ӫ��ѧ', 'MARKETING', 'ѧ�ƻ���', '���޿�', 64, 3.5, '����081;����082;����083', 3, 96, '070012', 48, 0, 0, 1, .8, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070067', '2', '�г�Ӫ��ѧ', 'MARKETING', 'ѧ�ƻ���', '���޿�', 48, 3, '�Ź�081;�Ź�082', 2, 64, '070012', 48, 0, 0, 1, .8, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070067', '3', '�г�Ӫ��ѧ', 'MARKETING', 'ѧ�ƻ���', '���޿�', 64, 4, '��ó091;��ó092;��ó093', 5, 166, '070020', 64, 0, 0, 1, .8, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070067', '4', '�г�Ӫ��ѧ', 'MARKETING', 'רҵ����', '���޿�', 64, 4, '����081;����082;����083', 3, 96, '070020', 56, 0, 0, 1, .8, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070171', '0', '��Ӧ������', 'Supply Chain Management', 'רҵ����', '���޿�', 48, 3, '����071;����072;����073', 4, 128, '070007', 48, 0, 0, 1, .8, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070243', '0', '���ѧ', 'Financial Accounting', 'ѧ�ƻ���', '���޿�', 64, 4, '����091;����092;����093', 3, 102, '070009', 64, 0, 0, 1, .8, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070243', '1', '���ѧ', 'Financial Accounting', 'ѧ�ƻ���', '���޿�', 48, 3, '����091;����092;����093', 3, 102, '070009', 48, 0, 0, 1, .8, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070418', '0', 'Ӧ��ͳ��ѧ', 'STATISTICS', 'ѧ�ƻ���', '���޿�', 56, 3.5, '����081;����082;����083;�Ź�082;�Ź�081', 3, 96, '070020', 48, 0, 0, 1, .8, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070418', '1', 'Ӧ��ͳ��ѧ', 'STATISTICS', 'ѧ�ƻ���', '���޿�', 56, 3.5, '����081;����082;����083;��������081', 4, 128, '070020', 48, 0, 0, 1, .8, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070040', '0', '���������ԭ����Ӧ��', 'COMPUTER NETWORK PRINCIPALS AND APPLICATIONS', 'ѧ�ƻ���', '���޿�', 56, 3, '�Ź�091;�Ź�092;��������091', 3, 102, '060001', 40, 0, 16, 1, .7, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070042', '0', '�����ԭ��', 'COMPUTER PRINCIPALS', 'ѧ�ƻ���', '���޿�', 32, 2, '�Ź�091;�Ź�092', 2, 68, '060002', 32, 0, 0, 1, .7, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070084', '0', '��Ϣϵͳ���������', 'Information Systems Analyses And Design', 'רҵ����', '���޿�', 64, 4, '�Ź�081;�Ź�082', 2, 64, '060006', 48, 0, 16, 1, .7, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070089', '0', '�˳�ѧ', 'OPERATIONS RESEARCH', 'ѧ�ƻ���', '���޿�', 64, 4, '����081;����082;����083', 3, 96, '070006', 56, 0, 0, 1, .7, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070089', '2', '�˳�ѧ', 'OPERATIONS RESEARCH', 'ѧ�ƻ���', '���޿�', 64, 4, '����081;����082;����083', 3, 96, '070006', 56, 0, 0, 1, .7, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070171', '1', '��Ӧ������', 'Supply Chain Management', 'רҵ����', '���޿�', 48, 3, '�Ź�071;�Ź�072', 2, 64, '070012', 48, 0, 0, 1, .7, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070302', '0', '������Ӧ���뿪��', 'INTERNET APPLICATIONS AND DEVELOPMENT', 'רҵ����', '���޿�', 48, 2.5, '�Ź�081;�Ź�082;��������081', 3, 96, '060004', 32, 0, 16, 1, .7, '����');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070498', '0', '���ݿ�ԭ��Ӧ��', 'DATABASE PRINCIPALS AND APPLICATIONS', 'רҵ����', '���޿�', 56, 3, '�Ź�081;�Ź�082;��������081', 3, 96, '070005', 40, 0, 16, 1, .7, '����');
COMMIT;

--score���ɼ���
CREATE TABLE score(
	s_id VARCHAR2(10), --ѧ��
	c_term VARCHAR2(20) NOT NULL, --ѧ��
	c_num CHAR(6) NOT NULL, --�γ̱��
	c_seq VARCHAR2(2) NOT NULL, --�����
	s_commongrade NUMBER(4,1), --ƽʱ�ɼ�
	s_finalgrade NUMBER(3,1), --��ĩ�ɼ�
	CONSTRAINT pk_score PRIMARY KEY(s_id,c_term,c_seq,c_num),
  CONSTRAINT fk_score FOREIGN KEY (c_term,c_seq,c_num) REFERENCES course(c_term,c_seq,c_num)
);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070301', '2010-2011(1)', '060151', '0', 24, 86);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070301', '2010-2011(1)', '060164', '0', 28, 90);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070301', '2010-2011(1)', '070067', '2', 13, 75);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070301', '2010-2011(1)', '070084', '0', 22, 79);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070301', '2010-2011(1)', '070418', '1', 15, 80);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070301', '2010-2011(1)', '070302', '0', 20, 76);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070301', '2010-2011(1)', '070498', '0', 24, 90);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070302', '2010-2011(1)', '060151', '0', 18, 65);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070302', '2010-2011(1)', '060164', '0', 20, 78);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070302', '2010-2011(1)', '070067', '2', 12, 80);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070302', '2010-2011(1)', '070084', '0', 20, 76);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070302', '2010-2011(1)', '070418', '1', 12, 60);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070302', '2010-2011(1)', '070302', '0', 18, 75);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070302', '2010-2011(1)', '070498', '0', 24, 79);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070303', '2010-2011(1)', '060151', '0', 18, null);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070303', '2010-2011(1)', '060164', '0', 20, 67);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070303', '2010-2011(1)', '070067', '2', 12, null);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070303', '2010-2011(1)', '070084', '0', 21, 60);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070303', '2010-2011(1)', '070418', '1', 12, 62);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070303', '2010-2011(1)', '070302', '0', 18, 50);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070303', '2010-2011(1)', '070498', '0', 20, 55);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070304', '2010-2011(1)', '060151', '0', 20, 70);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070304', '2010-2011(1)', '060164', '0', 18, 75);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070304', '2010-2011(1)', '070067', '2', 12, 82);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070304', '2010-2011(1)', '070084', '0', 21, 68);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070304', '2010-2011(1)', '070418', '1', 12, 69);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070304', '2010-2011(1)', '070302', '0', 18, 80);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070304', '2010-2011(1)', '070498', '0', 25, 87);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070305', '2010-2011(1)', '060151', '0', 19, 75);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070305', '2010-2011(1)', '060164', '0', 22, 70);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070305', '2010-2011(1)', '070067', '2', 14, 89);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070305', '2010-2011(1)', '070084', '0', 27, 90);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070305', '2010-2011(1)', '070418', '1', 16, 87);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070305', '2010-2011(1)', '070302', '0', 18, '63');
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070305', '2010-2011(1)', '070498', '0', 20, 87);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070306', '2010-2011(1)', '060151', '0', 24, 70);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070306', '2010-2011(1)', '060164', '0', 20, 73);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070306', '2010-2011(1)', '070067', '2', 12, 85);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070306', '2010-2011(1)', '070084', '0', 25, 75);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070306', '2010-2011(1)', '070418', '1', 17, 87);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070306', '2010-2011(1)', '070302', '0', 29, 90);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070306', '2010-2011(1)', '070498', '0', 22, 87);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070307', '2010-2011(1)', '060151', '0', 26, 70);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070307', '2010-2011(1)', '060164', '0', 18, null);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070307', '2010-2011(1)', '070067', '2', 15, 85);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070307', '2010-2011(1)', '070084', '0', 20, 86);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070307', '2010-2011(1)', '070418', '1', 19, 78);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070307', '2010-2011(1)', '070302', '0', 29, 87);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070307', '2010-2011(1)', '070498', '0', 21, 69);
COMMIT;

--student��ѧ����
CREATE TABLE student(
	s_id VARCHAR2(10) CONSTRAINT pk_student PRIMARY KEY, --ѧ��
	s_name VARCHAR2(30) NOT NULL, --ѧ������
	s_gender VARCHAR2(3) CONSTRAINT nn_s_gender NOT NULL CONSTRAINT check_gender CHECK (s_gender IN('��','Ů')), --ѧ���Ա�
	s_nation VARCHAR2(20) NOT NULL, --����
	s_political VARCHAR2(20) NOT NULL, --������ò
	s_classname VARCHAR2(100) NOT NULL, --�༶��
	s_language VARCHAR2(20) NOT NULL, --����
	s_chinese NUMBER(4,1),   --�߿��ĳɼ�
	s_math NUMBER(4,1),    --�߿���ѧ�ɼ�
	s_foreign NUMBER(4,1), --�߿�����ɼ�
	s_duty VARCHAR2(50)  --ְ��
);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010101', '�ָ���', 'Ů', '����', '������Ա', '����081', 'Ӣ��', 112, 81, 119, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010102', '��˼ӱ', 'Ů', '����', '������Ա', '����081', 'Ӣ��', 114, 100, 121, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010103', '÷�', '��', '����', '������Ա', '����081', 'Ӣ��', 102, 102, 83, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010104', '����ϼ', 'Ů', '����', 'Ԥ����Ա', '����081', 'Ӣ��', 108, 117, 96, '��֯ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010105', '������', 'Ů', '����', '������Ա', '����081', 'Ӣ��', 113, 108, 115, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010106', '������', 'Ů', '����', '������Ա', '����081', 'Ӣ��', 113, 94, 111, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010107', '�����', '��', '����', '������Ա', '����081', 'Ӣ��', 104, 104, 124, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010108', '������', 'Ů', '����', '������Ա', '����081', 'Ӣ��', 109, 81, 118, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010109', '����', '��', '����', '������Ա', '����081', 'Ӣ��', 105, 85, 121, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010110', '��ɺ', 'Ů', '����', '������Ա', '����081', 'Ӣ��', 111, 94, 102, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010111', '����', 'Ů', '����', '������Ա', '����081', 'Ӣ��', 103, 100, 118, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010112', '������', 'Ů', '����', '������Ա', '����081', 'Ӣ��', 106, 106, 74, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010113', '����', '��', '����', '������Ա', '����081', 'Ӣ��', 126, 98, 126, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010114', '��Ծ̩', '��', '����', 'Ⱥ��', '����081', 'Ӣ��', 113, 117, 118, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010115', '������', 'Ů', '����', '������Ա', '����081', 'Ӣ��', 103, 94, 119, 'ѧϰίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010116', '����÷', 'Ů', '����', '������Ա', '����081', 'Ӣ��', 105, 105, 111, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010117', '������', 'Ů', '����', '������Ա', '����081', 'Ӣ��', 103, 79, 127, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010118', '����ͮ', 'Ů', '����', '������Ա', '����081', '����', 98, 107, 111, '�೤');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010119', '����', 'Ů', '����', '������Ա', '����081', 'Ӣ��', 109, 70, 125, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010120', '����', 'Ů', '����', '������Ա', '����081', 'Ӣ��', 107, 77, 131, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010121', '����', 'Ů', '����', '������Ա', '����081', '����', 111, 79, 119, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010122', '��ϣ', 'Ů', '����', '������Ա', '����081', 'Ӣ��', 113, 85, 124, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010123', '���ؼ�', '��', '����', '������Ա', '����081', 'Ӣ��', 110, 134, 111, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010124', '�︣��', 'Ů', '����', '������Ա', '����081', 'Ӣ��', 102, 105, 122, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010125', '��ӱ��', 'Ů', '����', '������Ա', '����081', 'Ӣ��', 114, 103, 112, '��֧��');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010126', '����', '��', '����', 'Ԥ����Ա', '����081', 'Ӣ��', 103, 118, 121, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010127', '���޺�', 'Ů', '����', '������Ա', '����081', '����', 99, 83, 118, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010128', '������', '��', '����', '������Ա', '����081', 'Ӣ��', 91, 119, 119, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010129', '�����', 'Ů', '����', '������Ա', '����081', 'Ӣ��', 99, 86, 114, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010130', '����', 'Ů', '����', '������Ա', '����081', 'Ӣ��', 109, 97, 121, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010131', '�߷�', '��', '����', '������Ա', '����081', 'Ӣ��', 111, 111, 116, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010132', '����', 'Ů', '����', '������Ա', '����081', 'Ӣ��', 103, 101, 102, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010201', '������', 'Ů', '����', '������Ա', '����082', 'Ӣ��', 110, 89, 124, 'ѧϰίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010202', 'Ф��', '��', '����', '������Ա', '����082', 'Ӣ��', 109, 75, 105, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010203', 'Է��', '��', '������', '������Ա', '����082', 'Ӣ��', 109, 90, 116, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010204', '������', 'Ů', '����', '������Ա', '����082', 'Ӣ��', 115, 72, 108, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010205', '���㝻', '��', '����', '��Ա', '����082', 'Ӣ��', 111, 85, 114, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010206', '��˳��', 'Ů', '������', '������Ա', '����082', '����', 130, 80, 130, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010207', '��˼', 'Ů', '����', '������Ա', '����082', 'Ӣ��', 104, 110, 114, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010208', '�����', '��', '����', '������Ա', '����082', 'Ӣ��', 101, 79, 110, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010209', '����ΰ', '��', '����', '������Ա', '����082', 'Ӣ��', 108, 109, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010210', '����', 'Ů', '����', '������Ա', '����082', 'Ӣ��', 113, 91, 108, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010211', '��ˬ', 'Ů', '����', '������Ա', '����082', 'Ӣ��', 90, 99, 119, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010212', '����', 'Ů', '������', '������Ա', '����082', 'Ӣ��', 107, 82, 114, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010213', '������', '��', '����', '������Ա', '����082', 'Ӣ��', 101, 75, 94, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010214', '����', 'Ů', '����', '������Ա', '����082', 'Ӣ��', 110, 97, 119, '��֯ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010215', '����', 'Ů', '����', '������Ա', '����082', '����', 113, 68, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010216', '��ӨӨ', 'Ů', '����', '������Ա', '����082', 'Ӣ��', 114, 73, 115, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010217', '����', 'Ů', '����', 'Ԥ����Ա', '����082', 'Ӣ��', 116, 66, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010218', '�����', 'Ů', '����', '������Ա', '����082', '����', 114, 99, 117, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010219', '�Ʊ�', 'Ů', '����', '������Ա', '����082', 'Ӣ��', 106, 86, 103, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010220', '����', 'Ů', '�ɹ���', '������Ա', '����082', 'Ӣ��', 104, 91, 118, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010221', '������', 'Ů', '����', '������Ա', '����082', 'Ӣ��', 104, 101, 117, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010222', '�Գ���', '��', '����', '������Ա', '����082', 'Ӣ��', 108, 81, 132, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010223', '������', 'Ů', '����', '������Ա', '����082', '����', 112, 90, 131, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010224', '�����', 'Ů', '����', '������Ա', '����082', 'Ӣ��', 115, 84, 102, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010225', '��Ǫ', '��', '�ɹ���', '������Ա', '����082', 'Ӣ��', 105, 91, 93, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010226', '������', '��', '����', '������Ա', '����082', '����', 95, 113, 122, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010227', '����', 'Ů', '����', '��Ա', '����082', 'Ӣ��', 103, 96, 105, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010228', '����Ө', 'Ů', '����', '������Ա', '����082', 'Ӣ��', 118, 101, 126, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010229', '��ٻ', 'Ů', '����', '������Ա', '����082', 'Ӣ��', 110, 92, 102, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010230', '�ް���', 'Ů', '������', '������Ա', '����082', 'Ӣ��', 128, 100, 123, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010231', '������', '��', '����', '������Ա', '����082', 'Ӣ��', 110, 88, 124, '�೤');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010232', '�α�', '��', '����', '������Ա', '����082', 'Ӣ��', 99, 122, 127, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010233', '����', 'Ů', '����', '������Ա', '����082', 'Ӣ��', 103, 104, 98, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010234', '���ӭ', 'Ů', '����', '������Ա', '����082', 'Ӣ��', 116, 78, 109, '��֧��');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010301', '��ӨӨ', 'Ů', '����', '������Ա', '����083', '����', 115, 94, 132, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010302', '��׺�', '��', '����', '������Ա', '����083', 'Ӣ��', 104, 112, 102, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010303', '��ѩ�', 'Ů', '����', '������Ա', '����083', 'Ӣ��', 102, 81, 119, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010304', '����', 'Ů', '����', '������Ա', '����083', 'Ӣ��', 110, 89, 116, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010305', '������', 'Ů', '����', '������Ա', '����083', 'Ӣ��', 105, 108, 111, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010307', 'Ҧ�', 'Ů', '����', '������Ա', '����083', 'Ӣ��', 103, 97, 116, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010308', '������', '��', '����', '������Ա', '����083', 'Ӣ��', 105, 124, 88, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010309', '��Խ', '��', '����', '������Ա', '����083', '����', 107, 69, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010310', '����', 'Ů', '����', '������Ա', '����083', 'Ӣ��', 106, 84, 133, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010311', '����', '��', '����', '������Ա', '����083', 'Ӣ��', 113, 77, 124, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010313', '����', 'Ů', '����', '������Ա', '����083', 'Ӣ��', 103, 93, 104, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010314', '����', 'Ů', '����', '������Ա', '����083', 'Ӣ��', 113, 94, 116, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010315', '������', 'Ů', '����', '������Ա', '����083', 'Ӣ��', 101, 84, 97, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010316', '�����', '��', '����', 'Ԥ����Ա', '����083', 'Ӣ��', 105, 106, 110, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010317', '�����', 'Ů', '������', '������Ա', '����083', '����', 124, 60, 131, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010318', '����', '��', '����', '������Ա', '����083', 'Ӣ��', 112, 116, 77, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010319', '���', 'Ů', '����', '������Ա', '����083', 'Ӣ��', 118, 94, 121, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010320', '��ˬ', 'Ů', '����', '������Ա', '����083', 'Ӣ��', 110, 107, 116, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010321', '�Ծ�', 'Ů', '����', '������Ա', '����083', 'Ӣ��', 118, 109, 126, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010322', '��Խ', 'Ů', '����', '������Ա', '����083', 'Ӣ��', 110, 95, 131, '��֧��');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010323', '������', 'Ů', '����', '������Ա', '����083', 'Ӣ��', 107, 99, 120, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010324', '��³�', '��', '����', '��Ա', '����083', 'Ӣ��', 102, 98, 121, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010325', '��ӱ', 'Ů', '����', '������Ա', '����083', '����', 98, 79, 129, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010326', '����', 'Ů', '����', '������Ա', '����083', 'Ӣ��', 120, 77, 128, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010327', '������', 'Ů', '����', '������Ա', '����083', 'Ӣ��', 102, 92, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010328', '����', 'Ů', '����', '������Ա', '����083', '����', 116, 113, 117, 'ѧϰίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010329', '����ͮ', 'Ů', '����', '������Ա', '����083', 'Ӣ��', 97, 124, 124, '��֯ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010330', '��ʥ��', 'Ů', '����', '������Ա', '����083', 'Ӣ��', 99, 117, 120, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010331', '��־��', '��', '����', '������Ա', '����083', 'Ӣ��', 118, 99, 126, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010332', 'ʷ��', 'Ů', '�ɹ���', '������Ա', '����083', 'Ӣ��', 116, 123, 115, '�೤');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070101', '����', 'Ů', '����', '������Ա', '��ó081', 'Ӣ��', 112, 101, 119, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070102', '���', 'Ů', '����', '������Ա', '��ó081', 'Ӣ��', 116, 91, 122, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070103', '�ƹ���', '��', '����', '������Ա', '��ó081', 'Ӣ��', 97, 93, 99, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070104', '��˧', 'Ů', '����', '������Ա', '��ó081', 'Ӣ��', 105, 79, 117, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070105', 'ë����', 'Ů', '����', '��Ա', '��ó081', 'Ӣ��', 108, 115, 99, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070106', '������', '��', '����', '������Ա', '��ó081', 'Ӣ��', 117, 69, 123, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070107', '������', 'Ů', '����', '������Ա', '��ó081', 'Ӣ��', 103, 98, 122, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070108', '������', 'Ů', '����', '������Ա', '��ó081', 'Ӣ��', 100, 89, 120, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070109', '������', '��', '����', '������Ա', '��ó081', 'Ӣ��', 107, 120, 112, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070110', '����', 'Ů', '����', '������Ա', '��ó081', 'Ӣ��', 100, 86, 111, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070111', '������', 'Ů', '����', '������Ա', '��ó081', 'Ӣ��', 110, 81, 128, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070112', '���Ǳ�', '��', '����', '������Ա', '��ó081', 'Ӣ��', 117, 98, 98, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070113', '����', 'Ů', '����', '������Ա', '��ó081', 'Ӣ��', 110, 87, 111, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070114', '�����', 'Ů', '����', '������Ա', '��ó081', 'Ӣ��', 106, 117, 111, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070115', '����', 'Ů', '����', '������Ա', '��ó081', 'Ӣ��', 111, 100, 120, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070116', '����ʵ', '��', '����', '������Ա', '��ó081', 'Ӣ��', 101, 104, 122, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070117', 'ë����', 'Ů', '����', '������Ա', '��ó081', 'Ӣ��', 102, 109, 98, 'ѧϰίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070118', '����', 'Ů', '����', '������Ա', '��ó081', 'Ӣ��', 113, 88, 111, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070119', '�Ծ���', 'Ů', '����', '������Ա', '��ó081', 'Ӣ��', 110, 95, 113, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070120', '����', 'Ů', '����', '������Ա', '��ó081', 'Ӣ��', 112, 88, 119, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070121', '������', 'Ů', '����', '������Ա', '��ó081', 'Ӣ��', 116, 112, 110, '��֧��');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070122', '������', '��', '����', '������Ա', '��ó081', 'Ӣ��', 104, 100, 104, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070123', '����', 'Ů', '����', '��Ա', '��ó081', 'Ӣ��', 113, 99, 104, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070124', 'ɳ����', 'Ů', '����', '��Ա', '��ó081', 'Ӣ��', 104, 101, 128, '�೤');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070125', '����', 'Ů', '����', '������Ա', '��ó081', 'Ӣ��', 103, 106, 113, '��֯ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070126', '����', 'Ů', '����', '������Ա', '��ó081', 'Ӣ��', 96, 83, 110, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070127', '¬�η�ٳ', 'Ů', '����', '������Ա', '��ó081', 'Ӣ��', 111, 131, 126, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070128', '�ں��', 'Ů', '����', '������Ա', '��ó081', 'Ӣ��', 113, 113, 112, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070129', '������', 'Ů', '����', '������Ա', '��ó081', 'Ӣ��', 110, 127, 127, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070130', '����', 'Ů', '����', 'Ԥ����Ա', '��ó081', 'Ӣ��', 122, 76, 126, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070201', '������', 'Ů', '����', '������Ա', '��ó082', 'Ӣ��', 104, 82, 116, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070202', '����', '��', '����', '������Ա', '��ó082', 'Ӣ��', 106, 113, 111, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070203', '����', 'Ů', '����', '������Ա', '��ó082', 'Ӣ��', 109, 90, 116, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070204', '������', '��', '����', '������Ա', '��ó082', 'Ӣ��', 109, 113, 120, '�೤');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070205', 'Ѧ����', 'Ů', '����', '������Ա', '��ó082', 'Ӣ��', 108, 113, 115, '��֧��');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070206', '��˶', 'Ů', '����', '������Ա', '��ó082', 'Ӣ��', 115, 92, 116, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070207', '������', '��', '����', '������Ա', '��ó082', 'Ӣ��', 113, 112, 119, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070208', '������', '��', '����', '������Ա', '��ó082', 'Ӣ��', 107, 80, 128, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070209', '����', 'Ů', '����', '������Ա', '��ó082', 'Ӣ��', 103, 94, 122, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070210', '������', 'Ů', '����', '������Ա', '��ó082', 'Ӣ��', 96, 97, 121, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070212', '������', 'Ů', '����', '������Ա', '��ó082', 'Ӣ��', 105, 85, 109, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070214', '����', 'Ů', '����', '������Ա', '��ó082', 'Ӣ��', 101, 93, 126, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070215', '�첨', '��', '����', '��Ա', '��ó082', 'Ӣ��', 107, 72, 97, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070216', '������', 'Ů', '����', '������Ա', '��ó082', 'Ӣ��', 106, 107, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070217', '����', 'Ů', '����', '������Ա', '��ó082', 'Ӣ��', 92, 100, 122, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070218', '������', 'Ů', '����', '������Ա', '��ó082', 'Ӣ��', 106, 103, 121, '��֯ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070219', '��Ƽ', 'Ů', '����', '������Ա', '��ó082', 'Ӣ��', 115, 119, 112, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070220', 'Ф··', 'Ů', '����', '������Ա', '��ó082', 'Ӣ��', 111, 92, 131, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070221', '�޴���', 'Ů', '����', '������Ա', '��ó082', 'Ӣ��', 111, 83, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070222', '��͡', 'Ů', '����', '������Ա', '��ó082', 'Ӣ��', 117, 92, 129, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070223', 'ëʫ��', 'Ů', '����', '������Ա', '��ó082', 'Ӣ��', 113, 62, 119, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070224', '����', 'Ů', '����', '������Ա', '��ó082', 'Ӣ��', 104, 116, 104, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070225', '��ѩ', 'Ů', '����', '������Ա', '��ó082', 'Ӣ��', 109, 95, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070226', '��̩��', '��', '����', '������Ա', '��ó082', 'Ӣ��', 98, 110, 93, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070227', '����', 'Ů', '����', '������Ա', '��ó082', 'Ӣ��', 116, 119, 111, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070228', '����', 'Ů', '����', '������Ա', '��ó082', 'Ӣ��', 109, 110, 123, 'ѧϰίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070229', '������', 'Ů', '����', '������Ա', '��ó082', 'Ӣ��', 99, 108, 123, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070230', '����', 'Ů', '����', '������Ա', '��ó082', 'Ӣ��', 112, 102, 137, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070231', '������', 'Ů', '����', '������Ա', '��ó082', 'Ӣ��', 121, 82, 115, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070301', '�����', 'Ů', '����', '������Ա', '�Ź�081', 'Ӣ��', 116, 105, 124, '��֧��');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070302', '������', 'Ů', '������', '������Ա', '�Ź�081', 'Ӣ��', 130, 80, 109, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070303', '����Ȼ', 'Ů', '����', '������Ա', '�Ź�081', 'Ӣ��', 110, 76, 105, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070304', '������', '��', '����', 'Ԥ����Ա', '�Ź�081', 'Ӣ��', 107, 79, 105, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070305', '��ӱ', 'Ů', '����', '������Ա', '�Ź�081', 'Ӣ��', 110, 105, 119, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070306', '����', 'Ů', '����', '������Ա', '�Ź�081', 'Ӣ��', 111, 91, 124, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070307', '̷ѩ÷', 'Ů', '����', '������Ա', '�Ź�081', 'Ӣ��', 112, 101, 129, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070308', '������', 'Ů', '����', '������Ա', '�Ź�081', 'Ӣ��', 106, 114, 116, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070309', '������', 'Ů', '����', '������Ա', '�Ź�081', 'Ӣ��', 99, 105, 133, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070310', '��ɺɺ', 'Ů', '����', '������Ա', '�Ź�081', 'Ӣ��', 109, 94, 119, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070311', '����', 'Ů', '����', '������Ա', '�Ź�081', 'Ӣ��', 110, 86, 115, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070312', '������', '��', '����', '��Ա', '�Ź�081', 'Ӣ��', 102, 103, 104, '�೤');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070313', '�����', 'Ů', '����', '������Ա', '�Ź�081', 'Ӣ��', 72, 95, 128, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070314', '������', '��', '����', '������Ա', '�Ź�081', 'Ӣ��', 106, 63, 116, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070315', '�־���', 'Ů', '����', '������Ա', '�Ź�081', 'Ӣ��', 108, 115, 124, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070316', '�', 'Ů', '����', '������Ա', '�Ź�081', 'Ӣ��', 105, 105, 122, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070317', '�޲���', 'Ů', '����', '������Ա', '�Ź�081', 'Ӣ��', 114, 94, 119, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070318', '����', 'Ů', '����', '������Ա', '�Ź�081', 'Ӣ��', 110, 115, 77, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070319', '����', 'Ů', '����', '������Ա', '�Ź�081', 'Ӣ��', 108, 90, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070320', '��һ��', 'Ů', '����', '������Ա', '�Ź�081', 'Ӣ��', 109, 84, 117, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070321', '������', 'Ů', '����', '��Ա', '�Ź�081', 'Ӣ��', 102, 87, 120, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070322', '����»', '��', '����', '������Ա', '�Ź�081', 'Ӣ��', 107, 107, 120, 'ѧϰίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070323', '������', '��', '����', '������Ա', '�Ź�081', 'Ӣ��', 108, 97, 117, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070324', '��һ��', 'Ů', '����', '������Ա', '�Ź�081', 'Ӣ��', 116, 79, 119, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070325', '��ʿ��', 'Ů', '����', '������Ա', '�Ź�081', 'Ӣ��', 111, 80, 111, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070326', '��Ө', 'Ů', '����', '������Ա', '�Ź�081', 'Ӣ��', 100, 100, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070327', '��ԭ', '��', '����', '������Ա', '�Ź�081', 'Ӣ��', 113, 106, 111, '��֯ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070328', 'л���', 'Ů', '����', '������Ա', '�Ź�081', 'Ӣ��', 108, 94, 120, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070329', '�ױ���', 'Ů', '����', '������Ա', '�Ź�081', 'Ӣ��', 115, 118, 131, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070330', '����ӱ', 'Ů', '����', '������Ա', '�Ź�081', 'Ӣ��', 117, 109, 134, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070331', '���', '��', '����', '������Ա', '�Ź�081', 'Ӣ��', 110, 103, 118, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040101', '��ѩ', 'Ů', '����', '������Ա', '�Ź�082', 'Ӣ��', 107, 110, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040102', '������', 'Ů', '����', '������Ա', '�Ź�082', 'Ӣ��', 115, 105, 112, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040103', '������', '��', '����', '��Ա', '�Ź�082', 'Ӣ��', 102, 89, 93, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040104', '������', 'Ů', '����', '������Ա', '�Ź�082', 'Ӣ��', 101, 88, 121, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040105', '������', 'Ů', '����', '������Ա', '�Ź�082', 'Ӣ��', 94, 95, 105, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040106', '������', 'Ů', '����', '������Ա', '�Ź�082', 'Ӣ��', 119, 91, 125, '��֧��');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040107', '��ͮ', 'Ů', '����', '������Ա', '�Ź�082', 'Ӣ��', 110, 107, 115, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040108', '������', '��', '����', '������Ա', '�Ź�082', 'Ӣ��', 99, 112, 91, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040109', '���', 'Ů', '����', 'Ԥ����Ա', '�Ź�082', 'Ӣ��', 115, 95, 121, 'ѧϰίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040110', '����', 'Ů', '����', '������Ա', '�Ź�082', 'Ӣ��', 96, 103, 101, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040111', '����', '��', '����', '������Ա', '�Ź�082', 'Ӣ��', 100, 93, 84, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040112', '����', 'Ů', '����', '������Ա', '�Ź�082', 'Ӣ��', 110, 79, 113, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040113', '����', 'Ů', '����', '������Ա', '�Ź�082', 'Ӣ��', 110, 91, 128, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040114', '��ܰ��', 'Ů', '����', '������Ա', '�Ź�082', 'Ӣ��', 104, 76, 120, '��֯ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040115', '������', 'Ů', '����', '������Ա', '�Ź�082', 'Ӣ��', 106, 87, 109, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040116', '����Ȼ', '��', '����', '������Ա', '�Ź�082', 'Ӣ��', 96, 114, 108, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040117', '�γ�', 'Ů', '����', '������Ա', '�Ź�082', 'Ӣ��', 107, 113, 129, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040118', '�Ժ�', '��', '����', '������Ա', '�Ź�082', 'Ӣ��', 120, 95, 115, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040119', '�½�', 'Ů', '����', '������Ա', '�Ź�082', 'Ӣ��', 113, 73, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040120', '������', 'Ů', '����', '������Ա', '�Ź�082', 'Ӣ��', 114, 95, 117, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040121', '���ν�', 'Ů', '����', '������Ա', '�Ź�082', 'Ӣ��', 95, 105, 89, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040122', '�����', 'Ů', '����', '������Ա', '�Ź�082', 'Ӣ��', 112, 72, 111, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040123', '�����', 'Ů', '����', '��Ա', '�Ź�082', 'Ӣ��', 106, 107, 106, '�೤');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040124', '����', 'Ů', '����', '������Ա', '�Ź�082', 'Ӣ��', 119, 104, 126, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040125', '�ƾ�', 'Ů', '�ɹ���', '������Ա', '�Ź�082', 'Ӣ��', 121, 59, 99, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040126', '����', 'Ů', '����', '������Ա', '�Ź�082', 'Ӣ��', 114, 100, 119, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040127', '��ѩ', 'Ů', '����', '������Ա', '�Ź�082', 'Ӣ��', 111, 95, 127, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040128', '����', 'Ů', '����', '������Ա', '�Ź�082', 'Ӣ��', 109, 104, 99, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040130', '��÷��', 'Ů', '������', '������Ա', '�Ź�082', 'Ӣ��', 126, 102, 137, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040131', '������', 'Ů', '����', '������Ա', '�Ź�082', 'Ӣ��', 111, 119, 130, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020101', '����', '��', '������', '������Ա', '����091', 'Ӣ��', 126, 92, 103, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020102', '������', 'Ů', '����', '������Ա', '����091', 'Ӣ��', 114, 101, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020103', '����', 'Ů', '����', '������Ա', '����091', 'Ӣ��', 108, 72, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020104', '������', 'Ů', '����', '������Ա', '����091', 'Ӣ��', 104, 99, 109, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020105', '����', '��', '����', '������Ա', '����091', 'Ӣ��', 106, 79, 117, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020106', '�賿', 'Ů', '����', '������Ա', '����091', 'Ӣ��', 112, 91, 132, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020107', '�ڽ�÷', 'Ů', '����', '������Ա', '����091', 'Ӣ��', 112, 75, 116, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020108', '������', 'Ů', '����', '������Ա', '����091', 'Ӣ��', 104, 81, 124, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020109', '������', 'Ů', '����', '������Ա', '����091', 'Ӣ��', 114, 87, 119, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020110', '��Դ�', 'Ů', '����', 'Ԥ����Ա', '����091', 'Ӣ��', 113, 84, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020111', '����', '��', '����', '������Ա', '����091', 'Ӣ��', 112, 80, 112, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020112', '����', 'Ů', '����', '������Ա', '����091', 'Ӣ��', 99, 89, 109, 'ѧϰίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020113', '������', 'Ů', '����', '������Ա', '����091', 'Ӣ��', 103, 70, 116, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020114', '������', '��', '����', '������Ա', '����091', 'Ӣ��', 105, 77, 129, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020115', '�γ�', '��', '����', '������Ա', '����091', 'Ӣ��', 114, 84, 124, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020116', '������', '��', '����', '������Ա', '����091', 'Ӣ��', 103, 87, 124, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020117', '����ܲ', 'Ů', '����', '������Ա', '����091', 'Ӣ��', 108, 76, 108, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020118', 'Ԭ�h', 'Ů', '����', '������Ա', '����091', 'Ӣ��', 121, 85, 120, '�೤');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020119', '�ܜ�', 'Ů', '����', '������Ա', '����091', '����', 116, 56, 129, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020120', '������', 'Ů', '����', '������Ա', '����091', 'Ӣ��', 108, 71, 91, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020121', '���ϴ�', 'Ů', '����', 'Ԥ����Ա', '����091', 'Ӣ��', 105, 108, 111, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020122', '١����', 'Ů', '����', '������Ա', '����091', '����', 111, 89, 109, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020123', '�����', 'Ů', '����', '������Ա', '����091', 'Ӣ��', 104, 66, 122, '��֯ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020124', 'Ƥ��', 'Ů', '����', '������Ա', '����091', 'Ӣ��', 107, 86, 112, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020126', '����', 'Ů', '����', '������Ա', '����091', 'Ӣ��', 111, 93, 119, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020127', '����', 'Ů', '����', '������Ա', '����091', '����', 113, 100, 110, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020128', '��ǿ', '��', '����', '������Ա', '����091', 'Ӣ��', 109, 111, 107, '��֧��');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020129', '�����', 'Ů', '����', '������Ա', '����091', 'Ӣ��', 109, 104, 125, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020201', '������', '��', '����', '������Ա', '����092', 'Ӣ��', 113, 111, 129, 'ѧϰίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020202', '�ƻ�', 'Ů', '����', '������Ա', '����092', 'Ӣ��', 117, 76, 107, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020203', '�ߺ���', 'Ů', '����', '������Ա', '����092', 'Ӣ��', 111, 80, 103, '��֯ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020204', '������', 'Ů', '����', '������Ա', '����092', 'Ӣ��', 105, 104, 111, '��֧��');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020205', '��ٻ', 'Ů', '����', '������Ա', '����092', 'Ӣ��', 104, 111, 126, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020206', '���', 'Ů', '����', '������Ա', '����092', 'Ӣ��', 101, 99, 116, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020207', '��С��', 'Ů', '����', '������Ա', '����092', 'Ӣ��', 109, 93, 118, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020208', '���', 'Ů', '����', '������Ա', '����092', '����', 110, 72, 120, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020209', '����', 'Ů', '����', '������Ա', '����092', 'Ӣ��', 114, 79, 128, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020210', '������', 'Ů', '����', '������Ա', '����092', 'Ӣ��', 102, 105, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020211', '��ӨӨ', 'Ů', '����', '������Ա', '����092', 'Ӣ��', 112, 90, 108, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020212', '�龵��', 'Ů', '����', '������Ա', '����092', 'Ӣ��', 106, 91, 106, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020213', '��ԣ��', 'Ů', '�ɹ���', '������Ա', '����092', 'Ӣ��', 97, 100, 90, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020214', '���ڷ�', '��', '����', '������Ա', '����092', 'Ӣ��', 107, 83, 113, '�೤');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020215', '½�', 'Ů', '����', '������Ա', '����092', 'Ӣ��', 101, 103, 111, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020216', '����', 'Ů', '����', '������Ա', '����092', 'Ӣ��', 102, 81, 107, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020217', '�µ���', 'Ů', '����', '������Ա', '����092', 'Ӣ��', 101, 70, 116, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020219', '���', 'Ů', '����', '������Ա', '����092', 'Ӣ��', 109, 87, 120, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020220', '������', 'Ů', '����', '������Ա', '����092', 'Ӣ��', 114, 68, 112, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020221', '����', 'Ů', '�ɹ���', '������Ա', '����092', 'Ӣ��', 96, 83, 104, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020222', '����', 'Ů', '������', '��Ա', '����092', 'Ӣ��', 132, 80, 112, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020223', '�½�', 'Ů', '����', '��Ա', '����092', '����', 103, 92, 112, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020224', '��һ��', '��', '����', '������Ա', '����092', 'Ӣ��', 99, 82, 83, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020225', '�ޱ���', 'Ů', '����', '������Ա', '����092', '����', 113, 67, 114, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020226', '��ѩ��', '��', '����', '������Ա', '����092', 'Ӣ��', 122, 92, 112, '����ίԱ');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020227', '����ΰ', '��', '����', '������Ա', '����092', 'Ӣ��', 96, 110, 122, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020228', '������', '��', '����', '������Ա', '����092', 'Ӣ��', 96, 91, 109, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020229', '������', '��', '����', '������Ա', '����092', 'Ӣ��', 110, 91, 123, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020230', '�γ̬b', 'Ů', '����', 'Ԥ����Ա', '����092', 'Ӣ��', 115, 101, 109, '����ίԱ');
COMMIT;

--journal��,�ڿ����洢ѧУ�Ͽɵ���Ҫ�ڿ���
CREATE TABLE journal(
  journal_name VARCHAR2(200) CONSTRAINT pk_journal PRIMARY KEY, --�ڿ�����
  journal_level VARCHAR2(50) NOT NULL, --�ڿ�����
  journal_weight NUMBER(2,1) NOT NULL --�ڿ�Ȩ��
);
INSERT INTO journal (journal_name, journal_level, journal_weight)
VALUES ('INFORMATION SYSTEMS RESEARCH', 'TOP', 5);
INSERT INTO journal (journal_name, journal_level, journal_weight)
VALUES ('MIS QUARTERLY', 'TOP', 5);
INSERT INTO journal (journal_name, journal_level, journal_weight)
VALUES ('DATA MINING AND KNOWLEDGE DISCOVERY', '����A', 4);
INSERT INTO journal (journal_name, journal_level, journal_weight)
VALUES ('EXPERT SYSTEMS WITH APPLICATIONS', '����A', 4);
INSERT INTO journal (journal_name, journal_level, journal_weight)
VALUES ('JOURNAL OF INFORMATION TECHNOLOGY', '����B', 3);
INSERT INTO journal (journal_name, journal_level, journal_weight)
VALUES ('MATHEMATICAL PROGRAMMING', '����B', 3);
INSERT INTO journal (journal_name, journal_level, journal_weight)
VALUES ('COMPUTERS AND INDUSTRIAL ENGINEERING', '����C', 3);
INSERT INTO journal (journal_name, journal_level, journal_weight)
VALUES ('INFORMATION TECHNOLOGY MANAGEMENT', '����C', 3);
INSERT INTO journal (journal_name, journal_level, journal_weight)
VALUES ('ϵͳ����������ʵ��', '����A', 3);
INSERT INTO journal (journal_name, journal_level, journal_weight)
VALUES ('ϵͳ�������۷���Ӧ��', '����A', 3);
INSERT INTO journal (journal_name, journal_level, journal_weight)
VALUES ('ϵͳ����', '����B', 2);
INSERT INTO journal (journal_name, journal_level, journal_weight)
VALUES ('��ҵ���������', '����B', 2);
COMMIT;

--paper��,�������ı�
CREATE TABLE paper(
  paper_id NUMBER(10) CONSTRAINT paper_pk_paper_id PRIMARY KEY, --���ı�� 
  paper_title VARCHAR2(200) NOT NULL, --������Ŀ
  paper_journal VARCHAR2(200) NOT NULL, --���ķ����ڿ�
  paper_time VARCHAR2(20) NOT NULL  --���ķ���ʱ��
);
create sequence paper_id_seq;
INSERT INTO paper (paper_id, paper_title, paper_journal, paper_time)
VALUES (1, '�ռ��Ŀ��ʶ�����ģ������ϵͳӦ���о�', 'ϵͳ����������ʵ��', '2008-12');
INSERT INTO paper (paper_id, paper_title, paper_journal, paper_time)
VALUES (2, '"WebӦ���뿪��"�γ̽�ѧ����', '���������', '2009-03');
INSERT INTO paper (paper_id, paper_title, paper_journal, paper_time)
VALUES (3, 'A wireless vending machine system based on GSM', 'DATA MINING AND KNOWLEDGE DISCOVERY', '2009-03');
INSERT INTO paper (paper_id, paper_title, paper_journal, paper_time)
VALUES (4, 'RESEARCH ON WEB INFORMATION SEARCH SYSTEM', 'COMPUTERS AND INDUSTRIAL ENGINEERING', '2009-05');
INSERT INTO paper (paper_id, paper_title, paper_journal, paper_time)
VALUES (5, 'Application of genetic local search algorithm', 'MATHEMATICAL PROGRAMMING', '2009-07');
INSERT INTO paper (paper_id, paper_title, paper_journal, paper_time)
VALUES (6, '���ݿ���������Լ����ͼ��ʾ�������㷨', '�����������Ӧ��', '2009-07');
INSERT INTO paper (paper_id, paper_title, paper_journal, paper_time)
VALUES (7, 'EJB��ϵ�ṹ����Ӧ���о�', '����֪ʶ�뼼��', '2009-07');
INSERT INTO paper (paper_id, paper_title, paper_journal, paper_time)
VALUES (8, 'һ�ֻ���MVCģʽWeb�������Webwork���о�', '�����Ӧ���о�', '2009-07');
INSERT INTO paper (paper_id, paper_title, paper_journal, paper_time)
VALUES (9, 'Web�û����ģʽ�����㷨�о�', 'ϵͳ����������ʵ��', '2009-09');
INSERT INTO paper (paper_id, paper_title, paper_journal, paper_time)
VALUES (10, '��ϵ�����ݿ��д洢OWL����ķ���', 'ϵͳ�������۷���Ӧ��', '2009-12');
COMMIT;

--paper_author���������߱�
CREATE TABLE paper_author(
  paper_id NUMBER(10),  --���ı��
  t_id CHAR(6),     --��ʦ���
  paper_sequence NUMBER(2) NOT NULL,  --��������
  CONSTRAINT pk_paper_author PRIMARY KEY(paper_id,t_id),
  CONSTRAINT fk_paper_id FOREIGN KEY (paper_id) REFERENCES paper(paper_id),
  CONSTRAINT fk_paper_t_id FOREIGN KEY (t_id) REFERENCES teacher(t_id)
);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (1, '060002', 1);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (1, '070011', 2);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (2, '060008', 1);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (3, '070018', 1);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (3, '070019', 2);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (4, '060005', 1);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (4, '060002', 2);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (4, '060001', 3);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (5, '070003', 1);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (5, '070007', 2);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (6, '070010', 1);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (7, '060009', 1);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (7, '060010', 2);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (8, '070005', 1);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (9, '070003', 1);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (9, '070012', 1);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (10, '070012', 1);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (10, '070007', 2);
COMMIT;