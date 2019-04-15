��1������һ����������ѧ����Ϣ����ͼ��
CREATE VIEW student_view AS SELECT * FROM student;
SELECT s_id, s_name, s_gender, s_nation, s_classname FROM student_view;

��2������һ����רҵ����ʦ��ѯ��ѧ����Ϣ����ͼ������ͼ����ѧ����ѧ�š��������Ա����ֺ�������3�Ƶ��ܳɼ���Ϣ��
CREATE OR REPLACE VIEW student_view2 AS
SELECT s_id, s_name, s_language, s_chinese + s_math + s_foreign
AS s_totalscore FROM student;
SELECT s_id, s_name, s_language, s_totalscore FROM student_view2;

��3������һ��ר��ѧ����ѯ���Գɼ�����ͼ������ͼ����ѧ����ѧ�š��������γ������ܳɼ���Ϣ��
CREATE OR REPLACE VIEW score_view(id, name, course, totalscore)
AS
SELECT s_id, s_name, c_name,
   c_common * score.s_commongrade + c_final * s_finalgrade AS totalscore
FROM course
NATURAL JOIN score
NATURAL JOIN student;

��4����student_view��ͼ�в������ݡ�
INSERT INTO student_view VALUES('0807010235', '����', '��', '����', '������Ա', '����082', 'Ӣ��', 110, 88, 124, NULL);
SELECT s_id, s_name, s_foreign FROM student WHERE s_id = '0807010235';
SELECT s_id, s_name, s_foreign FROM student_view WHERE s_id = '0807010235';

��5������student_view��ͼ�е����ݡ�
UPDATE student_view SET s_name = '����' WHERE s_id = '0807010235';
SELECT s_id, s_name, s_foreign FROM student WHERE s_id = '0807010235';
SELECT s_id, s_name, s_foreign FROM student_view WHERE s_id = '0807010235';

��6��ɾ��student_view��ͼ�е����ݡ�
DELETE FROM student_view WHERE s_id = '0807010235';
SELECT s_id, s_name, s_foreign FROM student_view WHERE s_id = '0807010235';
SELECT s_id, s_name, s_foreign FROM student WHERE s_id = '0807010235';

��7��ɾ��student_view��ͼ��
DROP VIEW student_view;

��8����ѯ����ѧ����ѧ�š���������Ϣ������ʶÿ�е��к�
SELECT rownum, s_id, s_name, s_nation, s_classname FROM student;

��9����ѯ�кŴ���10��ѧ����ѧ�š����������塣
SELECT * FROM (SELECT rownum s_no, s_id, s_name, s_nation FROM student)
WHERE s_no > 10;

��10����ѯ����ɼ���ǰ21-25����ѧ����Ϣ��
SELECT * FROM(
SELECT rownum topnum, s_id, s_name, s_foreign FROM
(SELECT * FROM student ORDER BY s_foreign DESC)
)
WHERE topnum BETWEEN 21 AND 25;

��11����ѯstudent_view2��ͼ�Ķ�����Ϣ��
SET LONG 2000
COL TEXT FORMAT A200
SELECT view_name, text FROM user_views WHERE view_name = 'STUDENT_VIEW2';

��12��ʹ��DBMA_METADATA����ȡstudent_view��ͼ�Ķ�����Ϣ��
SET LONG 2000
COL VIEW_DEF FORMAT A60
SELECT DBMS_METADATA.GET_DDL('VIEW','STUDENT_VIEW') AS VIEW_DEF
FROM dual;

��13��Ϊlearner�û���ѧ������һ��˽��ͬ��ʡ�
CREATE SYNONYM l_student FOR learner.student;
SELECT s_id, s_name, s_nation, s_political FROM l_student;
conn learner1/learner123
SELECT s_id, s_name FROM l_student;

��14��Ϊlearner�û���ѧ������һ������ͬ��ʡ�
CREATE OR REPLACE PUBLIC SYNONYM l_student FOR learner.student;
SELECT s_id, s_name, s_nation, s_political FROM l_student;

��15��ɾ������ͬ���l_student��
DROP PUBLIC SYNONYM l_student;

��16��ʹ��user_synonyms��ͼ�鿴ͬ��ʵ���Ϣ��
SELECT synonym_name, table_owner, table_name, db_link FROM user_synonyms;

��17��Ϊѧ�����diploma_id�ж������С�
CREATE SEQUENCE diploma_seq;

��18��Ϊ���ı��paper _id�ж������С�
CREATE SEQUENCE paper_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 10000000
NOCACHE;

��19����ѯ����diploma_seq�ĵ�ǰֵ��
SELECT diploma_seq.CURRVAL FROM dual;

��20����ȡ����diploma_seq�ĵ�ǰֵ��
SELECT diploma_seq.NEXTVAL FROM dual;
SELECT diploma_seq.CURRVAL FROM dual;

��21��ʹ������diploma_seq��ֵ��Ϊ����diploma��������ݡ�
INSERT INTO diploma VALUES(diploma_seq.NEXTVAL, 'ר��');
INSERT INTO diploma VALUES(diploma_seq.NEXTVAL, '����');
INSERT INTO diploma VALUES(diploma_seq.NEXTVAL, '˶ʿ');
INSERT INTO diploma VALUES(diploma_seq.NEXTVAL, '��ʿ');
INSERT INTO diploma VALUES(diploma_seq.NEXTVAL, '��ʿ��');
SELECT * FROM diploma;
ROLLBACK;
INSERT INTO diploma VALUES(diploma_seq.NEXTVAL, 'ר��');
INSERT INTO diploma VALUES(diploma_seq.NEXTVAL, '����');
INSERT INTO diploma VALUES(diploma_seq.NEXTVAL, '˶ʿ');
INSERT INTO diploma VALUES(diploma_seq.NEXTVAL, '��ʿ');
INSERT INTO diploma VALUES(diploma_seq.NEXTVAL, '��ʿ��');
SELECT * FROM diploma;

��22���޸�����diploma_seq����������Ϊ10��û�����ֵ�һ���Ϊ50��
ALTER SEQUENCE diploma_seq
INCREMENT BY 10
NOMAXVALUE
CACHE 50;

��23��Ϊ��ʦ��Ľ�ʦ�����д���B��������������������test��ռ䡢Ϊְ�Ʊ��ְ�����д���Ψһ������
CREATE INDEX tname_idx ON teacher(t_name) TABLESPACE test;   
CREATE UNIQUE INDEX title_idx ON title(title_name);

��24��Ϊѧ�����������ò�д���λͼ������Ϊ�����д��������������
CREATE BITMAP INDEX spolitical_idx ON student(s_political);
CREATE INDEX sforeign_idx ON student(s_foreign) REVERSE;

��25��Ϊ�γ̱�Ŀγ̱���кͿ�����д��������������Կ�����н���ѹ�����γ����ƴ�������������
CREATE INDEX cnumseq_idx ON course(c_num, c_seq) COMPRESS 2;
CREATE INDEX cname_idx ON course(LOWER(c_name));

��26��Ϊѧ����Ĵ������������������ı��ʽ�����ĳɼ�����ѧ�ɼ�������ɼ��ĺ͡�
CREATE INDEX total_idx ON student(s_chinese + s_math + s_foreign);

��27��������sforeign_idx�ɷ����������Ϊ��ͨ�������ٸ�Ϊ�����������
ALTER INDEX sforeign_idx REBUILD NOREVERSE;                 
ALTER INDEX sforeign_idx REBUILD REVERSE;

��28��������total_idx������Ϊscore_idx��
ALTER INDEX total_idx RENAME TO score_idx;

��29��ȡ������cnumseq_idx��c_seq�ϵ�ѹ����������ame_idx����ѹ����
ALTER INDEX cnumseq_idx REBUILD NOCOMPRESS;                 
ALTER INDEX tname_idx REBUILD COMPRESS 1;

��30��������cnumseq_idx����д���д��������־�ļ������á�
ALTER INDEX cnumseq_idx REBUILD NOLOGGING;                 
ALTER INDEX cnumseq_idx REBUILD LOGGING;

��31�����洢����tname_idx�ı�ռ��Ϊusers��ռ䡣
ALTER INDEX tname_idx REBUILD TABLESPACE users;

��32��������tname_idx��Ҷ����Ƭ���кϲ���
ALTER INDEX tname_idx COALESCE;

��33��ɾ������tname_idx��Ҷ����Ƭ���кϲ���
DROP INDEX tname_idx;

��34��ʹ��user_indexes��ͼ�鿴������Ϣ��
SELECT index_name, index_type, table_name, uniqueness FROM user_indexes

��35��ʹ��user_ind_columns��ͼ�鿴�����е���Ϣ��
SELECT index_name, table_name, column_name, column_position, descend 
FROM user_ind_columns;

��36��ʹ��user_ind_expressions��ͼ�鿴�����е���Ϣ��
SELECT * FROM user_ind_expressions;

��37������student_p1��ͬʱΪstudent_p1����3��������
CREATE TABLE student_p1(
  s_id VARCHAR2(10) CONSTRAINT pk_student PRIMARY KEY, --ѧ�ţ�����
  s_name VARCHAR2(20) NOT NULL, --ѧ������
  s_gender VARCHAR2(10) CONSTRAINT nn_s_gender NOT NULL CONSTRAINT check_gender CHECK (s_gender IN('��', 'Ů')), --ѧ���Ա�
  s_nation VARCHAR2(10) NOT NULL, --����
  s_political VARCHAR2(20) NOT NULL, --������ò
  s_classname VARCHAR2(100) NOT NULL, --�༶��
  s_language VARCHAR2(20) NOT NULL, --����
  s_chinese NUMBER(4, 1), --���ĳɼ�
  s_math NUMBER(4, 1), --��ѧ�ɼ�
  s_foreign NUMBER(4, 1), --����ɼ�
  s_duty VARCHAR2(50)  --ְ��
)
PARTITION BY RANGE (s_id)                                 --����ѧ����ѧ�ŷ���
(
  PARTITION s_p1 VALUES LESS THAN('0807020104'), 
  PARTITION s_p2 VALUES LESS THAN('0807070117'),
  PARTITION s_p3 VALUES LESS THAN('0807070331')
);

��38����student_p��1�в������ݡ�
INSERT INTO student_p1 VALUES('0807010101', '����', '��', '����',
'������Ա', '����081', 'Ӣ��', 110, 88 ,104, null);
INSERT INTO student_p1 VALUES('0807020104', '����', '��', '����',
'������Ա', '����082', 'Ӣ��', 120, 88, 114, null);
INSERT INTO student_p1 VALUES('0807070331', '����', '��', '����',
'������Ա', '����082', 'Ӣ��', 130, 88, 124, null);
SELECT s_id, s_name, s_political, s_classname FROM student_p1;
SELECT s_id, s_name, s_political, s_classname FROM student_p1 PARTITION(s_p1);
SELECT s_id, s_name, s_political, s_classname FROM student_p1 PARTITION(s_p2);
SELECT s_id, s_name, s_political, s_classname FROM student_p1 PARTITION(s_p3);

��39�����´���student_p1��ͬʱΪstudent_p1����4������������������ѧ����ѧ�š�
CREATE TABLE student_p1(
  s_id VARCHAR2(10) CONSTRAINT pk_student PRIMARY KEY, --ѧ�ţ�����
  s_name VARCHAR2(20) NOT NULL, --ѧ������
  s_gender VARCHAR2(10) CONSTRAINT nn_s_gender NOT NULL CONSTRAINT check_gender CHECK (s_gender IN('��', 'Ů')), --ѧ���Ա�
  s_nation VARCHAR2(10) NOT NULL, --����
  s_political VARCHAR2(20) NOT NULL, --������ò
  s_classname VARCHAR2(100) NOT NULL, --�༶��
  s_language VARCHAR2(20) NOT NULL, --����
  s_chinese NUMBER(4, 1), --���ĳɼ�
  s_math NUMBER(4, 1), --��ѧ�ɼ�
  s_foreign NUMBER(4, 1), --����ɼ�
  s_duty VARCHAR2(50)  --ְ��
)
PARTITION BY RANGE (s_id)                              --����ѧ����ѧ�ŷ���
(
  PARTITION s_p1 VALUES LESS THAN('0807020104'),
  PARTITION s_p2 VALUES LESS THAN('0807070117'),
  PARTITION s_p3 VALUES LESS THAN('0807070331'),
  PARTITION s_p4 VALUES LESS THAN(MAXVALUE)
);
INSERT INTO student_p1 VALUES('0807070331', '����', '��', '����',
'������Ա', '����081', 'Ӣ��', 110, 88, 124, null);

��40������teacher_p1��ͬʱΪ�ñ�����Χ������������Ϊ3�����������ǽ�ʦ����ְʱ�䡣
CREATE TABLE teacher_p1 (
 t_id CHAR(6) PRIMARY KEY,  --��ʦ���
 t_name VARCHAR2(50) NOT NULL,  --��ʦ����
 t_gender VARCHAR2(2) NOT NULL CHECK(t_gender IN('��', 'Ů')), --��ʦ�Ա�
 t_ishere VARCHAR2(10) NOT NULL, --��ְ״̬
 t_entertime DATE NOT NULL, --��ְʱ��
 t_idcard VARCHAR2(18) UNIQUE, --���֤�ţ�ΨһԼ��
 t_departmentid NUMBER(2), --ϵ��
 t_duty VARCHAR2(50) NOT NULL, --ְ��
 t_titleid NUMBER(2), --ְ�Ʊ��
 t_titletime DATE, --ְ�ƻ��ʱ��
 t_research VARCHAR2(50), --�о�����
 t_university VARCHAR2(50) NOT NULL, --��ҵѧУ
 t_graduatetime DATE NOT NULL, --��ҵʱ��
 t_specialty VARCHAR2(50) NOT NULL, --רҵ
 t_diplomaid NUMBER(2) NOT NULL, --ѧ��
 t_birthday DATE NOT NULL, --��������
 t_marrige VARCHAR2(4) NOT NULL  --����״��
)
PARTITION BY RANGE (t_entertime)                --������ְʱ�����
(
  PARTITION t_p1 VALUES LESS THAN(DATE '2006-1-1'),
  PARTITION t_p2 VALUES LESS THAN(DATE '2010-1-1'),
  PARTITION t_p3 VALUES LESS THAN(MAXVALUE)
);

��41������teacher_p2��ͬʱΪ�ñ���������������������ǽ�ʦ����ְʱ�䲢���·�����
CREATE TABLE teacher_p2 (            
t_id CHAR(6) PRIMARY KEY,        --��ʦ���
t_name VARCHAR2(50) NOT NULL,   --��ʦ����
t_entertime DATE NOT NULL        --��ְʱ��
)
PARTITION BY RANGE (t_entertime)                                           --������ְʱ�����
INTERVAL(NUMTOYMINTERVAL(1, 'MONTH'))
(
  PARTITION t_p1 VALUES LESS THAN(DATE '2006-1-1'),
  PARTITION t_p2 VALUES LESS THAN(DATE '2010-1-1')
);
CREATE TABLE teacher_p2 (            
t_id CHAR(6) PRIMARY KEY,        --��ʦ���
t_name VARCHAR2(50) NOT NULL,   --��ʦ����
t_entertime DATE NOT NULL        --��ְʱ��
)
PARTITION BY RANGE (t_entertime)                                           --������ְʱ�����
INTERVAL(NUMTOYMINTERVAL(1, 'MONTH'))
(
  PARTITION t_p1 VALUES LESS THAN(DATE '2006-1-1'),
  PARTITION t_p2 VALUES LESS THAN(DATE '2010-1-1')
);
SELECT partition_name, high_value FROM user_tab_partitions
WHERE table_name= 'TEACHER_P2';
INSERT INTO teacher_p2 VALUES(1, '����', '1-1��-10');
SELECT partition_name, high_value FROM user_tab_partitions
WHERE table_name = 'TEACHER_P2';
INSERT INTO teacher VALUES(2, '����', '1-6��-10');
INSERT INTO teacher_p2 VALUES(3, '����', '21-6��-10');                 --6�µķ����Ѿ�����
INSERT INTO teacher_p2 VALUES(4, '����', '31-3��-10');
SELECT partition_name, high_value FROM user_tab_partitions
WHERE table_name = 'TEACHER_P2';

��42��������course_p1��ͬʱΪ�ñ���3���б���������������ǿγ����
CREATE TABLE course_p1(
	c_term VARCHAR2(20) NOT NULL,  --ѧ��
	c_num CHAR(6) NOT NULL,  --�γ̱��
	c_seq VARCHAR2(2) NOT NULL,  --�����
	c_name VARCHAR2(80) NOT NULL,  --�γ�����
	c_ename VARCHAR2(80) NOT NULL,  --�γ�Ӣ������
	c_type VARCHAR2(30) NOT NULL,  --�γ����
	c_nature VARCHAR2(30) NOT NULL,  --�γ�����
	c_thours NUMBER(3) NOT NULL,  --��ѧʱ
	c_credits NUMBER(2,1) NOT NULL,  --ѧ��
	c_class VARCHAR2(200),  --�Ͽΰ༶
	c_togeclass NUMBER(2),  --�ϰ���
	c_stunum NUMBER(4),  --ѧ����
	t_id CHAR(6),  --�ον�ʦ
	c_theoryhours NUMBER(3) NOT NULL  ,--����ѧʱ
	c_designhours NUMBER(3) DEFAULT 0 NOT NULL,  --���ѧʱ
	c_prachours NUMBER(3) DEFAULT 0 NOT NULL,  --�ϻ�ѧʱ
	c_common NUMBER(2, 1) NOT NULL,  --ƽʱ�ɼ�Ȩ��
	c_final NUMBER(2, 1) NOT NULL,  --��ĩ�ɼ�Ȩ��
	c_assway VARCHAR2(10) NOT NULL,  --���˷�ʽ
	CONSTRAINT pk_course PRIMARY KEY(c_term, c_seq, c_num), --��������
CONSTRAINT fk_course FOREIGN KEY (t_id) REFERENCES teacher(t_id)
)
PARTITION BY LIST (c_type)                      --���ݿγ����ͷ���
(
    PARTITION compulsory_course VALUES('ѧ�ƻ���', 'רҵ����'),
    PARTITION elective_course VALUES('רҵ��ѡ'),
    PARTITION specialized_course VALUES('רҵ��ѡ')
);
INSERT INTO course_p1 SELECT * FROM course;
SELECT c_term, c_num, c_seq, c_name, c_class FROM course_p1
PARTITION(compulsory_course);
SELECT c_term, c_num, c_seq, c_name, c_class FROM course_p1
PARTITION(elective_course);
SELECT c_term, c_num, c_seq, c_name, c_class FROM course_p1
PARTITION(specialized_course);

��43������course_p2��ͬʱΪ�ñ���3����ϣ��������������ѧ�ڡ�
CREATE TABLE course_p2 (
c_term VARCHAR2(20) NOT NULL,  --ѧ��
c_num CHAR(6) NOT NULL,  --�γ̱��
c_seq VARCHAR2(2) NOT NULL,  --�����
c_name VARCHAR2(80) NOT NULL,  --�γ�����
c_ename VARCHAR2(80) NOT NULL,  --�γ�Ӣ������
c_type VARCHAR2(30) NOT NULL,  --�γ����
c_nature VARCHAR2(30) NOT NULL,  --�γ�����
c_thours NUMBER(3) NOT NULL,  --��ѧʱ
c_credits NUMBER(2, 1) NOT NULL,  --ѧ��
c_class VARCHAR2(200), --�Ͽΰ༶
c_togeclass NUMBER(2), --�ϰ���
c_stunum NUMBER(4),  --ѧ����
t_id CHAR(6), --�ον�ʦ
c_theoryhours NUMBER(3) NOT NULL, --����ѧʱ
c_designhours NUMBER(3) DEFAULT 0 NOT NULL, --���ѧʱ
c_prachours NUMBER(3) DEFAULT 0 NOT NULL, --�ϻ�ѧʱ
c_common NUMBER(2, 1) NOT NULL, --ƽʱ�ɼ�Ȩ��
c_final NUMBER(2, 1) NOT NULL, --��ĩ�ɼ�Ȩ��
c_assway VARCHAR2(10) NOT NULL, --���˷�ʽ
CONSTRAINT pk_course PRIMARY KEY(c_term, c_seq, c_num), --��������
CONSTRAINT fk_course FOREIGN KEY (t_id) REFERENCES teacher(t_id)
)
PARTITION BY HASH (c_num)                                --���ݿγ̱�ŷ���            
(
  PARTITION c_p1,
  PARTITION c_p2,
  PARTITION c_p3
);
INSERT INTO course_p2 SELECT * FROM course; 
SELECT COUNT(*) FROM course_p2 PARTITION(c_p1);
SELECT COUNT(*) FROM course_p2 PARTITION(c_p2);
SELECT COUNT(*) FROM course_p2 PARTITION(c_p3);

��44������teacher_p3��course_p3��ͬʱΪteacher_p3������ϣ�������������ǽ�ʦ��ţ�Ϊcourse_p3�������÷�����ͨ�����������teacher_p3��ķ�����
CREATE TABLE teacher_p3(        --Ϊ�˲�������,����ʦ������˼�,��ʦ��Ϊ����
t_id CHAR(6) PRIMARY KEY,        --��ʦ���
t_name VARCHAR2(50) NOT NULL,   --��ʦ����
t_entertime DATE NOT NULL        --��ְʱ��
)
PARTITION BY HASH (t_id)                             --���ݽ�ʦ��Ž��й�ϣ����
(
PARTITION t_p1,
PARTITION t_p2
);
CREATE TABLE course_p3(         --Ϊ�˲�������,���γ̱�����˼�,�γ̱�Ϊ�ӱ�
	c_term VARCHAR2(20) NOT NULL,  --ѧ��
	c_num CHAR(6) NOT NULL,   --�γ̱��
	c_seq VARCHAR2(2) NOT NULL,  --�����
	c_name VARCHAR2(80) NOT NULL,  --�γ�����
	t_id CHAR(6) NOT NULL,--�ον�ʦ
	CONSTRAINT pk_course1 PRIMARY KEY(c_term, c_seq, c_num),  --��������
 CONSTRAINT fk_course1 FOREIGN KEY (t_id) REFERENCES teacher_p3(t_id)
) PARTITION BY REFERENCE (fk_course1); 
INSERT INTO teacher_p3(t_id, t_name, t_entertime)
SELECT t_id, t_name, t_entertime FROM teacher;
INSERT INTO course_p3(c_term, c_num, c_seq, c_name, t_id)
SELECT c_term, c_num, c_seq, c_name, t_id FROM course; 
SELECT COUNT(*) FROM teacher_p3 PARTITION(t_p1);
SELECT COUNT(*) FROM teacher_p3 PARTITION(t_p2);      
SELECT COUNT(*) FROM course_p3 PARTITION(t_p1);       
SELECT COUNT(*) FROM course_p3 PARTITION(t_p2);

��45��������student_p2��ͬʱΪ�ñ��������У������б�ʾѧ��������ɼ��ȼ���ͨ��CASE������ɣ�Ϊ�䴴�������з������������������С�
CREATE TABLE student_p2(
s_id VARCHAR2(10) CONSTRAINT pk_student PRIMARY KEY, --ѧ��,����
s_name VARCHAR2(20) NOT NULL, --ѧ������
s_language VARCHAR2(20) NOT NULL,   --����
s_chinese NUMBER(4, 1),       --���ĳɼ�
s_math NUMBER(4, 1),           --��ѧ�ɼ�
s_foreign NUMBER(4, 1),        --����ɼ�
s_category VARCHAR2(6)         --������,��������ɼ���ΪA��B��C��D����
    GENERATED ALWAYS AS
    (
      CASE
         WHEN s_foreign >= 130 THEN 'A'
         WHEN s_foreign >= 115 THEN 'B'
         WHEN s_foreign >= 100 THEN 'C'
         ELSE 'D'
      END
    ) VIRTUAL
)
PARTITION BY LIST (s_category)
(
   PARTITION p_a VALUES ('A'),
   PARTITION p_b VALUES ('B'),
   PARTITION p_c VALUES ('C'),
   PARTITION p_d VALUES ('D')
);
INSERT INTO student_p2(s_id, s_name, s_language, s_chinese, s_math, s_foreign)
SELECT s_id, s_name, s_language, s_chinese, s_math ,s_foreign FROM student;
SELECT COUNT(*) FROM student_p2 PARTITION(p_a);    --A��ѧ��16��
SELECT COUNT(*) FROM student_p2 PARTITION(p_b);    --B��ѧ��135��
SELECT COUNT(*) FROM student_p2 PARTITION(p_c);    --C��ѧ��96��
SELECT COUNT(*) FROM student_p2 PARTITION(p_d); 

��46������student_p3��ͬʱΪ�ñ�ϵͳ������
CREATE TABLE student_p3(
s_id VARCHAR2(10) CONSTRAINT pk_student PRIMARY KEY, --ѧ�ţ�����
s_name VARCHAR2(20) NOT NULL,  --ѧ������
s_language VARCHAR2(20) NOT NULL   --����
)
PARTITION BY SYSTEM
(
  PARTITION p1,
  PARTITION p2
);
INSERT INTO student_p3 VALUES ('0808010101', '����', 'Ӣ��');
INSERT INTO student_p3 PARTITION(p1) VALUES('0808010101', '����', 'Ӣ��');
DELETE FORM student_p3 PARTITION (p1) WHERE s_name = '����';

��47������student_p4��ͬʱΪ�ñ�����Χ-�б�������ϲ�Ϊ��Χ�������ӷ���Ϊ�б������
CREATE TABLE student_p4(
 s_id VARCHAR2(10) PRIMARY KEY, --ѧ�ţ�����
 s_name VARCHAR2(20) NOT NULL, --ѧ������
 s_gender VARCHAR2(10) NOT NULL CHECK (s_gender IN('��', 'Ů'))--ѧ���Ա�
)
PARTITION BY RANGE (s_id)                                  --����ѧ����ѧ�ŷ���
SUBPARTITION BY LIST (s_gender)
(
  PARTITION p1 VALUES LESS THAN('0807020104')
  ( SUBPARTITION p_man1 VALUES('��'),  SUBPARTITION p_woman1 VALUES('Ů') ),
  PARTITION p2 VALUES LESS THAN('0807070117')
  ( SUBPARTITION p_man2 VALUES('��'),  SUBPARTITION p_woman2 VALUES('Ů') ),
  PARTITION p3 VALUES LESS THAN('0807070331'),
  PARTITION p4 VALUES LESS THAN(MAXVALUE)
  ( SUBPARTITION p_man4 VALUES('��'),  SUBPARTITION p_woman4 VALUES('Ů') )
);
INSERT INTO student_p4(s_id, s_name, s_gender) SELECT s_id, s_name, s_gender FROM student;
SELECT s_id, s_name, s_gender FROM student_p4 SUBPARTITION(p_woman1);
SELECT s_id, s_name, s_gender FROM student_p4 PARTITION(p1);

��48������teacher_p4��Ϊ�ñ�����Χ-��ϣ�������ϲ�Ϊ��Χ�������ӷ���Ϊ��ϣ������
CREATE TABLE teacher_p4(
t_id CHAR(6) PRIMARY KEY,  --��ʦ���
t_name VARCHAR2(50) NOT NULL,  --��ʦ����
t_entertime DATE NOT NULL --��ְʱ��
)
PARTITION BY RANGE (t_entertime)                            --������ְʱ�����
SUBPARTITION BY HASH (t_id)
(
PARTITION t_p1 VALUES LESS THAN(DATE '2006-1-1') SUBPARTITIONS 3,
PARTITION t_p2 VALUES LESS THAN(DATE '2010-1-1')
(
SUBPARTITION t_p4,
SUBPARTITION t_p5
),
PARTITION t_p3 VALUES LESS THAN(MAXVALUE) SUBPARTITIONS 5
);
SELECT table_name, partition_name, subpartition_name
FROM user_tab_subpartitions WHERE table_name IN ('STUDENT_P4', 'TEACHER_P4');

��49��Ϊstudent_p1�����һ����Χ������
ALTER TABLE student_p1 ADD PARTITION s_p4 VALUES LESS THAN(MAXVALUE);

��50��Ϊ��course_p2�����һ����ϣ������
ALTER TABLE course_p2 ADD PARTITION c_p4;

��51��Ϊteacher_p4���t_p3�������һ���ӷ�����
ALTER TABLE teacher_p4 MODIFY PARTITION t_p3 ADD SUBPARTITION t_p6;

��52���ض�course_p1���elective_course������
ALTER TABLE course_p1 TRUNCATE PARTITION elective_course;

��53���ض�student_p4���p_woman1�ӷ�����
ALTER TABLE student_p4 TRUNCATE SUBPARTITION p_woman1;

��54��ɾ������student_p1���s_p4������
ALTER TABLE student_p1 DROP PARTITION s_p4;

��55��ɾ��teacher_p2���t_p1������
ALTER TABLE teacher_p2 DROP PARTITION t_p1;

��56��ɾ��student_p4���p_woman2�ӷ�����
ALTER TABLE student_p4 DROP subPARTITION p_woman2;

��57��Ϊstudent_p1���s_p3������ s_p4�����ϲ���
ALTER TABLE student_p1 MERGE PARTITIONS s_p3, s_p4 INTO PARTITION s_merge;

��58��Ϊstudent_p4���p_man1�ӷ�����p_woman1�ӷ����ϲ���
ALTER TABLE student_p4 MERGE SUBPARTITIONS p_man1, p_woman1
INTO SUBPARTITION p_gender1;

��59����student_p1���s_p2�������в�֡�
SELECT partition_name, high_value FROM user_tab_partitions 
WHERE table_name = 'STUDENT_P1';
ALTER TABLE student_p1 SPLIT PARTITION s_p2 AT ('0807020104')
INTO (PARTITION s_p3, PARTITION s_p4);
ALTER TABLE student_p1 SPLIT PARTITION s_p2 AT ('0807070117')
INTO (PARTITION s_p3, PARTITION s_p4);
ALTER TABLE student_p1 SPLIT PARTITION s_p2 AT ('0807050101')
INTO (PARTITION s_p3, PARTITION s_p4);
SELECT partition_name, high_value FROM user_tab_partitions 
WHERE table_name = 'STUDENT_P1';

��60����course_p1���s_p2�������в�֡�
SELECT partition_name, high_value FROM user_tab_partitions 
WHERE table_name = 'COURSE_P1';
ALTER TABLE course_p1 SPLIT PARTITION compulsory_course VALUES('ѧ�ƻ���')
INTO (PARTITION compulsory_course1, PARTITION compulsory_course2);
SELECT partition_name, high_value FROM user_tab_partitions 
WHERE table_name = 'COURSE_P1';

��61����student_p1���s_merge����������Ϊs_p5����teacher_p4���t_p5�ӷ���������Ϊt_p6��
ALTER TABLE student_p1 RENAME PARTITION s_merge TO s_p5;
ALTER TABLE teacher_p4 RENAME SUBPARTITION t_p5 TO t_p6;

��62��ʹ��user_part_tables��ͼ�鿴���������Ϣ��
SELECT table_name, partitioning_type, subpartitioning_type, 
partition_count FROM user_part_tables;

��63��ʹ��user_tab_partitions��ͼ�鿴ÿ�������ľ�����Ϣ��
SELECT table_name, composite, partition_name, subpartition_count
FROM user_tab_partitions;

��63��ʹ��user_tab_partitions��ͼ�鿴ÿ�������ľ�����Ϣ��
SELECT table_name, composite, partition_name, subpartition_count
FROM user_tab_partitions;

��64��������ʱ��ʹ��ʾ����
CREATE GLOBAL TEMPORARY TABLE title_temp(    --����������ʱ��
title_id NUMBER(2) CONSTRAINT pk_title PRIMARY KEY, --����
title_name VARCHAR2(50) NOT NULL
);
INSERT INTO title_temp VALUES (1, '����');
INSERT INTO title_temp VALUES (2, '������');
SELECT title_id, title_name FROM title_temp;
--��¼����һ��SQL*Plus��ִ���������䣨�Ự2��
SELECT title_id, title_name FROM title_temp;
--�ص�ԭ����SQL*Plus��ִ���������䣨�Ự1��
COMMIT;                
SELECT title_id, title_name FROM title_temp;

��65���Ự����ʱ��ʹ��ʾ����
CREATE GLOBAL TEMPORARY TABLE diploma_temp(  --���ǻỰ����ʱ��
diploma_id NUMBER(2) CONSTRAINT pk_diploma PRIMARY KEY, --����
diploma_name VARCHAR2(20) NOT NULL
) ON COMMIT PRESERVE ROWS;
INSERT INTO diploma_temp VALUES (1, 'ר��');
INSERT INTO diploma_temp VALUES (2, '����');
COMMIT;
SELECT diploma_id, diploma_name  FROM diploma_temp;
--��¼����һ��SQL*Plus��ִ���������䣨�Ự2��
SELECT title_id, title_name FROM title_temp;
--�˳��Ự1�����µ�¼��SQL*Plus��ִ����������
SELECT title_id, title_name FROM title_temp;

