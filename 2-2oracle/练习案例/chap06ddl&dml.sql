��1��������ֵ���������ʽ��
SELECT NULL + 15, NULL * 20 FROM dual;

��2��������ֵ�����ӱ��ʽ��
SELECT 'learn' || NULL, NULL || 'Oracle' FROM dual;

��3��ʹ��NUMBER���Ͷ������ݡ�
CREATE TABLE testnumbers(
  n1 NUMBER(8), n2 NUMBER(8), n3 NUMBER(8, 1), n4 NUMBER(8, 2),
  n5 NUMBER(8, 8), n6 NUMBER(8, 10), n7 NUMBER(8, -2),
  n8 NUMBER(8, -2) , n9 NUMBER(*, 2)
);
INSERT INTO testnumbers
VALUES(123.45678, 1234.5678, 1234.5678, 1234.5678,
       0.12345, 0.00123456789, 1245.5678, 1250.5678, 12345678912.345);
SELECT * FROM testnumbers; 

��4��ʹ��FLOAT���帡����ʾ����
CREATE TABLE testfloats(
  f1 FLOAT, f2 FLOAT(5), f3 FLOAT(10)
);
INSERT INTO testfloats VALUES(1234.5678, 1234.5678, 1234.5678);

��5��ʹ��BINARY_FLOAT��BINARY_DOUBLE���帡������
CREATE TABLE testbfd(
  n1 NUMBER, n2 FLOAT, n3 BINARY_FLOAT, n4 BINARY_DOUBLE
);
INSERT INTO testbfd
VALUES(123456789.123456789, 123456789.123456789,
        123456789.123456789, 123456789.123456789);
COL n1 FORMAT 999999999.999999999
COL n2 FORMAT 999999999.999999999
COL n3 FORMAT 999999999.999999999
COL n4 FORMAT 999999999.999999999
SELECT n1, n2, n3, n4 FROM testbfd;

��6����ֵ�������ۺ�ʾ����������ʹ���˸�����ֵ�����ݣ���ʹ��user_tab_columns��ͼ�˽�����������͵ľ��Ⱥͱ�ȡ�
CREATE TABLE numbers (
n1 NUMBER, n2 NUMBER(10), n3 NUMBER(10,2), n4 NUMBER(*,2),
n5 NUMERIC, n6 NUMERIC(10), n7 NUMERIC(10,2), n8 NUMERIC(*,2),
n9 DECIMAL, n10 DECIMAL(10), n11 DECIMAL(10,2), n12 DECIMAL(*,2),
n13 INTEGER, n14 INT, n15 SMALLINT,
n16 FLOAT, n17 FLOAT(10), n18 DOUBLE PRECISION, n19 REAL
);
SELECT column_name, data_precision, data_scale
FROM user_tab_columns WHERE table_name = 'NUMBERS';

��5��ʹ��SYSDATE������ȡ��ǰ��������ʱ�䡣
SELECT SYSDATE AS now1, TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS now2 FROM dual; 

��8���ֱ�ʹ��SYSDATE������SYSTIMESTAMP������ȡ��ǰ��������ʱ�䡣
SELECT SYSDATE, SYSTIMESTAMP FROM dual; 

��9��ʱ�������ʹ��ʾ����
CREATE TABLE testtimestamp(
  t1 TIMESTAMP DEFAULT SYSTIMESTAMP,           --����Ĭ��Ϊ6
  t2 TIMESTAMP(8) DEFAULT SYSTIMESTAMP,       --��������Ϊ8
  t3 TIMESTAMP WITH TIME ZONE DEFAULT SYSTIMESTAMP,
  t4 TIMESTAMP WITH LOCAL TIME ZONE DEFAULT SYSTIMESTAMP
);
INSERT INTO testtimestamp(t1) VALUES(SYSTIMESTAMP);
SELECT t1, t2 FROM testtimestamp;
SELECT t3, t4 FROM testtimestamp;
INSERT INTO testtimestamp(t1, t2, t3, t4)
VALUES(TO_TIMESTAMP('14-12��-11 10.441.12345678 ����', 'DD-MON-RR hh:mi:ss.ff AM'),
TO_DATE('14-12��-11 10.441', 'DD-MON-RR hh:mi:ss'),
TIMESTAMP '2011-12-14 13:46:41.12345678', TIMESTAMP '2011-12-14 13:46:41.12345678');
SELECT t1, t2 FROM testtimestamp WHERE t1 = '14-12�� -11 10.441.123457 ����';
SELECT t3, t4 FROM testtimestamp WHERE t1 = '14-12�� -11 10.441.123457 ����';

��10���������Ϊ��λ��ʾ��ʱ�������͵�ʹ��ʾ����
CREATE TABLE test(id NUMBER(9), time INTERVAL YEAR(4) TO MONTH); 
INSERT INTO test VALUES(1, INTERVAL '12-3' YEAR TO MONTH);
SELECT id, time FROM test;
UPDATE test SET time = time + INTERVAL '-1-6' YEAR TO MONTH;
SELECT id, time FROM test;
UPDATE test SET time = time + INTERVAL '6' MONTH;
SELECT id, time FROM test;

��11�������ʱ����Ϊ��λ��ʾ��ʱ�������͵�ʹ��ʾ����
CREATE TABLE test(id NUMBER(9), time INTERVAL DAY TO SECOND); 
INSERT INTO test VALUES(1, INTERVAL '12 3' DAY TO HOUR);
INSERT INTO test VALUES(2, INTERVAL '1 2:3' DAY TO MINUTE);
INSERT INTO test VALUES(3, INTERVAL '1 2:3:4' DAY TO SECOND);
INSERT INTO test VALUES(4, INTERVAL '12:34' HOUR TO MINUTE);
INSERT INTO test VALUES(5, INTERVAL '12:34' MINUTE TO SECOND);
INSERT INTO test VALUES(6, INTERVAL '123' DAY(3));
INSERT INTO test VALUES(7, INTERVAL '12' HOUR);
INSERT INTO test VALUES(8, INTERVAL '123' HOUR(3));
INSERT INTO test VALUES(9, INTERVAL '12.34567' SECOND(2,4));
INSERT INTO test VALUES(10, INTERVAL '12.123456789' SECOND(2,9));
SELECT id, time FROM test;

��12����ѯѧ��Ϊ0807010303��ѧ����¼��rowid��
SELECT rowid FROM student WHERE s_id = '0807010303';

��13��ʹ��DBMS_ROWID������ѯѧ��Ϊ0807010303��ѧ����¼��rowid������ϸ��Ϣ��
SELECT ROWID,
DBMS_ROWID.ROWID_OBJECT(rowid) "OBJECT_NUMBER",
DBMS_ROWID.ROWID_RELATIVE_FNO(rowid) "FILE_NUMBER",
DBMS_ROWID.ROWID_BLOCK_NUMBER(rowid) "BLOCK_NUMBER",
DBMS_ROWID.ROWID_ROW_NUMBER(rowid) "ROW_NUMBER"
FROM student WHERE s_id = '0807010303';

��14��ʹ��DBMS_ROWID������ѯrowidΪAAASaBAAEAAAAKFAAF�ļ�¼������λ����Ϣ��
SELECT file_name FROM dba_data_files WHERE file_id =
DBMS_ROWID. ROWID_TO_ABSOLUTE_FNO('AAASZ/AAEAAAAJsAAA', user, 'TEACHER');

INSERT INTO test VALUES(1, 'ha');
SELECT * FROM test WHERE id = 'a';
SELECT * FROM test WHERE content = 1;

��15������ѧ������Ķ�����ֻ�б������������е��������͡�
CREATE TABLE diploma(        --ѧ��������Ϊdiploma
  diploma_id    NUMBER(2),    --����Ϊdiploma_id������ΪNUMBER
  diploma_name VARCHAR2(20)  --����Ϊdiploma_name������ΪVARCHAR2
);

��16��
CREATE TABLE course(                   --�γ̱�
  c_theoryhours NUMBER(3),              --����ѧʱ
  c_designhours NUMBER(3) DEFAULT 0,  --���ѧʱ
  c_prachours NUMBER(3) DEFAULT 0      --�ϻ�ѧʱ
);
INSERT INTO course(c_theoryhours) VALUES(64); 
SELECT c_theoryhours, c_designhours, c_prachours  FROM course; 
INSERT INTO course(c_theoryhours, c_prachours) VALUES(64, 16);
SELECT c_theoryhours, c_designhours, c_prachours FROM course; 
INSERT INTO course VALUES(64, DEFAULT, 16); --c_designhours�в���Ĭ��ֵ         
SELECT c_theoryhours, c_designhours, c_prachours FROM course; 

��17��������ʦ�����ڴ�����ͬʱΪ�����ж����˸���Լ����
CREATE TABLE teacher(               --��ʦ��
  t_id CHAR(6) CONSTRAINT pk_teacher PRIMARY KEY, --��ʦ���,����Լ��
  t_name VARCHAR2(50) CONSTRAINT nn_t_name NOT NULL, --��ʦ����,�ǿ�Լ��
  t_gender VARCHAR2(2) CONSTRAINT nn_t_gender NOT NULL CONSTRAINT chk_t_gender CHECK(t_gender IN('��','Ů')), --��ʦ�Ա𣬷ǿ�Լ��,����Լ��
  t_ishere VARCHAR2(10) NOT NULL, --��ְ״̬,�ǿ�Լ��
  t_entertime DATE NOT NULL, --��ְʱ��,�ǿ�Լ��
  t_idcard VARCHAR2(18) UNIQUE, --���֤��,ΨһԼ��
  t_duty VARCHAR2(50) NOT NULL, --ְ��,�ǿ�Լ��
  t_titleid NUMBER(2) CONSTRAINT fk_titleid REFERENCES title(title_id), --ְ�Ʊ��,���Լ��
  t_titletime DATE, --ְ�ƻ��ʱ��
  t_research VARCHAR2(50), --�о�����
  t_university VARCHAR2(50) NOT NULL, --��ҵѧУ,�ǿ�Լ��
  t_graduatetime DATE NOT NULL, --��ҵʱ��,�ǿ�Լ��
  t_specialty VARCHAR2(50) NOT NULL, --רҵ,�ǿ�Լ��
  t_diplomaid NUMBER(2) NOT NULL, --ѧ��,�ǿ�Լ��
  t_birthday DATE NOT NULL, --��������,�ǿ�Լ��
  t_marrige VARCHAR2(4) NOT NULL, --����״�����ǿ�Լ��
  CONSTRAINT fk_diploma FOREIGN KEY(t_diplomaid) REFERENCES diploma  --���Լ��
);

��18�������ʦ������3����¼��t_idcard�ж�����ΨһԼ����������Ȼ������t_idcard���в�������ֵ����2���͵�3��������䣩��
CREATE TABLE teacher(
  t_id CHAR(6) CONSTRAINT pk_teacher PRIMARY KEY, --��ʦ���
  t_idcard VARCHAR2(18) UNIQUE   --���֤��
); 
INSERT INTO teacher VALUES('070001', '21010119631102001X'); 
INSERT INTO teacher VALUES('070002', null);
INSERT INTO teacher VALUES('070003', null);
SELECT * FROM teacher WHERE t_idcard IS NULL;

��19������17�е������м�Լ������Ϊ��Լ����
CREATE TABLE teacher(
	t_id CHAR(6), --��ʦ���
	t_name VARCHAR2(50) CONSTRAINT nn_t_name NOT NULL,  --��ʦ����
	t_gender VARCHAR2(2) CONSTRAINT nn_t_gender NOT NULL,  --��ʦ�Ա�
	t_ishere VARCHAR2(10) NOT NULL,  --��ְ״̬
	t_entertime DATE NOT NULL,  --��ְʱ��
	t_idcard VARCHAR2(18),  --���֤��
	t_duty VARCHAR2(50) NOT NULL,  --ְ��
	t_titleid NUMBER(2),  --ְ�Ʊ��
	t_titletime DATE,  --ְ�ƻ��ʱ��
	t_research VARCHAR2(50),  --�о�����
	t_university VARCHAR2(50) NOT NULL,  --��ҵѧУ
	t_graduatetime DATE NOT NULL,  --��ҵʱ��
	t_specialty VARCHAR2(50) NOT NULL,  --רҵ
	t_diplomaid NUMBER(2) NOT NULL,  --ѧ��
	t_birthday DATE NOT NULL,  --��������
	t_marrige VARCHAR2(4) NOT NULL, --���
	CONSTRAINT pk_teacher PRIMARY KEY(t_id),
	CONSTRAINT chk_t_gender CHECK(t_gender IN('��', 'Ů')),
	CONSTRAINT unq_t_idcard UNIQUE(t_idcard),
	CONSTRAINT fk_titleid FOREIGN KEY(t_titleid) REFERENCES title(title_id),
	CONSTRAINT fk_diploma FOREIGN KEY(t_diplomaid) REFERENCES diploma(diploma_id)
);

��20�������Ķ���γ̱��������ɶ�����ɵġ�
CREATE TABLE course(
  c_term VARCHAR2(20) NOT NULL,  --ѧ��
  c_num CHAR(6) NOT NULL,  --�γ̱��
  c_seq VARCHAR2(2) NOT NULL,  --�����
  c_name VARCHAR2(80) NOT NULL,  --�γ�����
  c_type VARCHAR2(30) NOT NULL,  --�γ����
  c_nature VARCHAR2(30) NOT NULL,  --�γ�����
  c_thours NUMBER(3) NOT NULL,  --��ѧʱ
  c_credits NUMBER(2,1) NOT NULL,  --ѧ��
  c_class VARCHAR2(200),  --�Ͽΰ༶
  c_togeclass NUMBER(2),  --�ϰ���
  c_stunum NUMBER(4),  --ѧ����
  t_id CHAR(6),  --�ον�ʦ
  c_theoryhours NUMBER(3) NOT NULL,  --����ѧʱ
  c_designhours NUMBER(3) DEFAULT 0 NOT NULL,  --���ѧʱ
  c_prachours NUMBER(3) DEFAULT 0 NOT NULL,  --�ϻ�ѧʱ
  c_college VARCHAR2(100) NOT NULL,  --����ѧԺ
  c_faculty VARCHAR2(100) NOT NULL,  --����ϵ
  c_assway VARCHAR2(10) NOT NULL,  --���˷�ʽ
  CONSTRAINT pk_course PRIMARY KEY(c_term, c_seq, c_num),  --��������
  CONSTRAINT fk_course FOREIGN KEY (t_id) REFERENCES teacher(t_id)
);

��21����ʦ���t_titleid�ж��������������ְ�Ʊ��title_id�У���ʹ����ON DELETE CASCADE����˵�ְ�Ʊ��t_titleid����title_id = 1�����ݱ�ɾ��ʱ����ʦ����t_titleid����ֵΪ1�ļ�¼Ҳ��ɾ���ˡ�
CREATE TABLE title(            --ְ�Ʊ�
  title_id NUMBER(2) CONSTRAINT pk_title PRIMARY KEY,  --ְ�Ʊ�ţ�����
  title_name VARCHAR2(50) NOT NULL                         --ְ������
); 
INSERT INTO title VALUES (1, '����');
INSERT INTO title VALUES (2, '������'); 
CREATE TABLE teacher(              --�򻯵Ľ�ʦ��
  t_id CHAR(6) CONSTRAINT pk_teacher PRIMARY KEY,  --��ʦ���
  t_titleid NUMBER(2) CONSTRAINT fk_title REFERENCES title(title_id) ON DELETE CASCADE  --ְ�Ʊ��
); 
INSERT INTO teacher VALUES('070001', 1);
INSERT INTO teacher VALUES('070002', 1);
INSERT INTO teacher VALUES('070003', 2);
DELETE FROM title WHERE title_id = 1;
SELECT t_id, t_titleid FROM teacher;

��22����ʦ���t_titleid�ж��������������ְ�Ʊ��title_id�У���ʹ����ON DELETE SET NULL����˵�ְ�Ʊ��t_titleid����title_id = 1�����ݱ�ɾ��ʱ����ʦ����t_titleid����ֵΪ1��ֵ������Ϊ��ֵ�ˡ�
CREATE TABLE teacher(                   --���´�����ʦ��
  t_id CHAR(6) CONSTRAINT pk_teacher PRIMARY KEY,  --��ʦ���
	t_titleid NUMBER(2) CONSTRAINT fk_title REFERENCES title(title_id) ON DELETE SET NULL --ְ�Ʊ��
);
INSERT INTO teacher VALUES('070001', 1);
INSERT INTO teacher VALUES('070002', 1); 
INSERT INTO teacher VALUES('070003', 2);
DELETE FROM title WHERE title_id = 1;
SELECT * FROM teacher;

��23����ѯuser_constraints��ͼ���鿴��ǰ�û������Լ������Ϣ��
SELECT constraint_name, constraint_type, table_name, search_condition
FROM user_constraints;

��24��ͨ����ѯuser_cons_columns��ͼ���鿴�����Լ����Ϣ��
SELECT * FROM user_cons_columns ORDER BY constraint_name;

��25����ְ�Ʊ��д���һ���±�title1��title1������ְ�Ʊ���ͬ��
CREATE TABLE title1 AS SELECT * FROM title;
SELECT * FROM title1;

��26��������teacher1������ʦ���ǰ4������Ϊ�±���С�
CREATE TABLE teacher1
AS SELECT t_id, t_name, t_gender, t_ishere FROM teacher;

��27������ʦ���ǰ4���к�ְ�Ʊ�ĵ�һ����Ϊ�±���С�
CREATE TABLE teacher1
AS SELECT t_id, t_name, t_gender, t_ishere, title_id FROM teacher, title;

��28���鿴ְ�Ʊ������Ϣ��
SELECT column_name, data_type, data_length, nullable, column_id 
FROM user_tab_columns WHERE table_name = 'TITLE';

��29��ʹ��DBMA_METADATA����ȡ��ʦ��Ķ�����Ϣ��
SELECT DBMS_METADATA.GET_DDL('TABLE', 'TEACHER') FROM dual; 

��30�����´�����ʦ����ʼʱֻ����һ����t_id��Ȼ��ʹ��ALTER TABLE ADD��������������У�������Լ��������
CREATE TABLE teacher(t_id CHAR(6));
ALTER TABLE teacher ADD
 (t_name VARCHAR2(50) CONSTRAINT nn_t_name NOT NULL,  --��ʦ����
  t_gender VARCHAR2(2) CONSTRAINT nn_t_gender NOT NULL CONSTRAINT chk_t_gender CHECK(t_gender IN('��', 'Ů')),  --��ʦ�Ա�
  t_ishere VARCHAR2(10) NOT NULL,  --��ְ״̬
  t_entertime DATE NOT NULL,  --��ְʱ��
  t_idcard VARCHAR2(18) UNIQUE,  --���֤��
  t_duty VARCHAR2(50) NOT NULL,  --ְ��
  t_titleid NUMBER(2) CONSTRAINT fk_title REFERENCES title(title_id),  --ְ�Ʊ��
  t_titletime DATE, --ְ�ƻ��ʱ��
  t_research VARCHAR2(50), --�о�����
  t_university VARCHAR2(50) NOT NULL, --��ҵѧУ
  t_graduatetime DATE NOT NULL, --��ҵʱ��
  t_specialty VARCHAR2(50) NOT NULL, --רҵ
  t_diplomaid NUMBER(2) NOT NULL, --ѧ��
  t_birthday DATE NOT NULL, --��������
  t_marrige VARCHAR2(4) NOT NULL --����״��
);

��31������30�Ļ����ϣ�Ϊ��ʦ���������Լ�������Լ����
ALTER TABLE teacher ADD                                       --�������Լ��
CONSTRAINT pk_teacher PRIMARY KEY(t_id);
ALTER TABLE teacher ADD CONSTRAINT fk_diploma              --������Լ��
FOREIGN KEY(t_diplomaid) REFERENCES diploma(diploma_id);

��32����ְʱ��һ��Ҫ�ȳ������������Կ���Ϊ��ʦ���������Լ����ʹ��t_entertime��������һҪ��
ALTER TABLE teacher ADD                                         --�������Լ��
CONSTRAINT chk_t_entertime CHECK(t_entertime > t_birthday);

��33�����´�����ʦ��ֻ�����У����������Ͻ����κ�Լ��������
CREATE TABLE teacher(
  t_id CHAR(6), --��ʦ���
  t_name VARCHAR2(50), --��ʦ����
  t_gender VARCHAR2(2), --��ʦ�Ա�
  t_ishere VARCHAR2(10), --��ְ״̬
  t_entertime DATE, --��ְʱ��
  t_idcard VARCHAR2(18), --���֤��
  t_duty VARCHAR2(50), --ְ��
  t_titleid NUMBER(2), --ְ�Ʊ��
  t_titletime DATE, --ְ�ƻ��ʱ��
  t_research VARCHAR2(50), --�о�����
  t_university VARCHAR2(50), --��ҵѧУ
  t_graduatetime DATE, --��ҵʱ��
  t_specialty VARCHAR2(50), --רҵ
  t_diplomaid NUMBER(2), --ѧ��
  t_birthday DATE,  --��������
  t_marrige VARCHAR2(4)  --����״��
);

��34������33�Ļ����ϣ���t_id�е��������ͺͳ��Ƚ�����һϵ�е��޸ġ�
ALTER TABLE teacher MODIFY(t_id CHAR(10));      --��t_id�ĳ��ȸ�Ϊ10��
ALTER TABLE teacher MODIFY(t_id VARCHAR2(20)); 
ALTER TABLE teacher MODIFY(t_id NUMBER(10, 6)); 
ALTER TABLE teacher MODIFY(t_id NUMBER(10));

��35������33�Ļ����ϣ�����ʦ���t_research�еĳ��ȸ�Ϊ100����ӷǿ�Լ����
ALTER TABLE teacher MODIFY t_id VARCHAR2(100) NOT NULL;

��36������33�Ļ����ϣ�Ϊ��ʦ���t_gender����Ĭ��ֵ��Ĭ��ֵΪ���С���
ALTER TABLE teacher MODIFY t_gender DEFAULT '��';

��37������33�Ļ����ϣ�Ϊ��ʦ���t_id���������Լ����
ALTER TABLE teacher MODIFY t_id PRIMARY KEY;
ALTER TABLE teacher MODIFY t_id CONSTRAINT pk_teacher PRIMARY KEY;
ALTER TABLE teacher MODIFY t_id CHAR(10) CONSTRAINT pk_teacher PRIMARY KEY;
ALTER TABLE teacher MODIFY(t_id CONSTRAINT pk_teacher PRIMARY KEY);
ALTER TABLE teacher MODIFY(CONSTRAINT pk_teacher PRIMARY KEY(t_id));
ALTER TABLE teacher MODIFY(t_id CHAR(6) CONSTRAINT pk_teacher PRIMARY KEY);

��38������33�Ļ����ϣ�Ϊ��ʦ������������Լ����
ALTER TABLE teacher MODIFY(
  t_name CONSTRAINT nn_t_name NOT NULL,
  t_gender CONSTRAINT nn_t_gender NOT NULL CONSTRAINT chk_t_gender CHECK(t_gender IN('��', 'Ů')),
  t_ishere NOT NULL,
  t_entertime NOT NULL,
  t_idcard UNIQUE,
  t_duty NOT NULL,
  t_titleid CONSTRAINT fk_titleid REFERENCES title(title_id),
  t_university NOT NULL,
  t_graduatetime NOT NULL,
  t_specialty NOT NULL,
  t_diplomaid NOT NULL,
  t_birthday NOT NULL,
  t_marrige NOT NULL,
  CONSTRAINT fk_diploma FOREIGN KEY(t_diplomaid) REFERENCES diploma
);

��39������޸�t_id���ϵ�Լ����
ALTER TABLE teacher MODIFY t_id PRIMARY KEY;
ALTER TABLE teacher MODIFY t_id NOT NULL;
ALTER TABLE teacher MODIFY t_id NULL;

��40������ʦ��ı�����Ϊteacher1���ٽ�teacher1���t_id�е�������Ϊteacher_id��
RENAME teacher TO teacher1;
ALTER TABLE teacher1 RENAME COLUMN t_id TO teacher_id;

��41��ʹ�õ�һ�ַ���ɾ����ʦ���t_diplomaid�С�t_birthday�к�ְ�Ʊ��title_id�С�
ALTER TABLE teacher DROP COLUMN t_diplomaid;
ALTER TABLE teacher DROP COLUMN t_birthday;
SELECT * FROM user_cons_columns WHERE table_name = 'TITLE' OR 
table_name = 'TEACHER';                      
ALTER TABLE title DROP COLUMN title_id;
ALTER TABLE title DROP COLUMN title_id CASCADE CONSTRAINTS;
SELECT * FROM user_cons_columns WHERE table_name = 'TITLE' OR 
table_name = 'TEACHER';                     
CREATE TABLE test(c1 number, c2 varchar2(2), c3 varchar2(2), 
CONSTRAINT c UNIQUE(c2, c3)); 
SELECT * FROM user_cons_columns WHERE table_name = 'TEST';
ALTER TABLE test DROP COLUMN c2;
ALTER TABLE test DROP COLUMN c2 CASCADE CONSTRAINTS;
SELECT * FROM user_cons_columns WHERE table_name = 'TEST';

��42��ʹ�õڶ��ַ���ɾ������С�
ALTER TABLE teacher DROP(t_diplomaid, t_birthday);
ALTER TABLE test DROP(c2, c3); 

��43������ʦ���t_gender�к�ְ�Ʊ��title_id������Ϊ����ʹ��״̬��Ȼ��ɾ����
SELECT constraint_name FROM user_cons_columns
WHERE table_name = 'TEACHER' and column_name = 'T_GENDER';
ALTER TABLE teacher SET UNUSED(t_gender);
SELECT t_id, t_name, t_gender FROM teacher; 
SELECT constraint_name FROM user_cons_columns
WHERE table_name = 'TEACHER' and column_name = 'T_GENDER';
ALTER TABLE title SET UNUSED (title_id);
ALTER TABLE title SET UNUSED (title_id) CASCADE CONSTRAINTS;
ALTER TABLE teacher DROP UNUSED COLUMNS;

��44�������ò���ʹ��״̬ʱɾ��ÿ1000��ִ��һ�μ��㡣
ALTER TABLE teacher DROP UNUSED COLUMNS CHECKPOINT 1000;

��45��ɾ����ʦ���t_titleid���ϵ����Լ����t_idcard���ϵ�ΨһԼ����
SELECT * FROM user_cons_columns 
WHERE table_name = 'TEACHER' ORDER BY constraint_name;
ALTER TABLE teacher DROP CONSTRAINT FK_TITLEID;
ALTER TABLE teacher DROP CONSTRAINT SYS_C0011586;

��46�����ý�ʦ��ͬ���ϵ�Լ����
CREATE TABLE teacher(              --����һ���򻯵Ľ�ʦ��
t_id CHAR(6) CONSTRAINT pk_teacher PRIMARY KEY, 
t_name VARCHAR2(50) CONSTRAINT nn_t_name NOT NULL DISABLE,--���÷ǿ�Լ��
t_gender VARCHAR2(2) CONSTRAINT nn_t_gender NOT NULL CONSTRAINT chk_t_gender CHECK(t_gender IN('��', 'Ů')),     
t_titleid NUMBER(2) CONSTRAINT fk_titleid REFERENCES title(title_id) 
);
INSERT INTO teacher VALUES ('060001', null, '��', 3);
ALTER TABLE teacher DISABLE CONSTRAINT chk_t_gender;   --���ü��Լ��
INSERT INTO teacher VALUES('060002', '����', '��', 3);
ALTER TABLE title DISABLE CONSTRAINT pk_title;   --��������Լ��
ALTER TABLE title DISABLE CONSTRAINT pk_title CASCADE;  
INSERT INTO teacher VALUES('060003', '����', '��', 99);

��47�����ɽ��õ�ǰ�û�ģʽ������Լ���Ľű���
SPOOL D:\teacher.txt
SELECT 'ALTER TABLE ' || table_name || ' DISABLE CONSTRAINT ' || constraint_name ||';'
FROM user_constraints WHERE  constraint_type = 'R';
SPOOL OFF

��48�����ý�ʦ���б����õ�Լ����
ALTER TABLE teacher ENABLE CONSTRAINT nn_t_name;  
ALTER TABLE teacher ENABLE NOVALIDATE CONSTRAINT nn_t_name;
INSERT INTO teacher VALUES ('060004', null, '��', 3);
ALTER TABLE teacher ENABLE CONSTRAINT fk_titleid; 
ALTER TABLE title ENABLE CONSTRAINT pk_title;
INSERT INTO teacher VALUES('060003', '����', '��', 99);
ALTER TABLE teacher ENABLE NOVALIDATE CONSTRAINT fk_titleid; 
INSERT INTO teacher VALUES('060003', '����', '��', 99);

��49��Լ���ӳ�״̬�����á�
CREATE TABLE teacher(
t_id NUMBER CONSTRAINT pk_id PRIMARY KEY,
t_name VARCHAR2(10) CONSTRAINT nn_con NOT NULL DEFERRABLE,
t_gender VARCHAR2(2)
CONSTRAINT nn_t_gender NOT NULL DEFERRABLE INITIALLY IMMEDIATE
CONSTRAINT chk_t_gender CHECK(t_gender IN('��', 'Ů')) DEFERRABLE INITIALLY DEFERRED
);
SELECT constraint_name, deferrable, deferred, validated
FROM user_constraints WHERE table_name = 'TEACHER';  
INSERT INTO teacher VALUES(1, '����', '��');
INSERT INTO teacher VALUES(1, '����', '��');    
SET CONSTRAINT pk_id DEFERRED;   --������DEFERRABLEΪNOT DEFERRABLE����
INSERT INTO teacher VALUES(2, '', '��');
SET CONSTRAINT nn_con DEFERRED;                    
INSERT INTO teacher VALUES(2, '', '��');
COMMIT;                      
ALTER TABLE teacher DROP CONSTRAINT pk_id;      
ALTER TABLE teacher ADD CONSTRAINT pk_id PRIMARY KEY(t_id) INITIALLY DEFERRED;
INSERT INTO teacher VALUES(1, '����', '��');
COMMIT;

��50���ı�Լ���ӳٵ�����ʱ�䡣
CREATE TABLE test(
  id NUMBER CONSTRAINT pk_id PRIMARY KEY DEFERRABLE,
  name VARCHAR2(10) CONSTRAINT nn_name NOT NULL DEFERRABLE
);
SET CONSTRAINT pk_id DEFERRED;
INSERT INTO test VALUES(1, '����');
INSERT INTO test VALUES(1, '����');       
COMMIT;                                         
INSERT INTO test VALUES(1, '����');
INSERT INTO test VALUES(1, '����');      
ALTER SESSION SET CONSTRAINTS = DEFERRED;  
INSERT INTO test VALUES(2, '');               
INSERT INTO test VALUES(1, '����');          
COMMIT;

��51����ѧ�����ȫ�����в������ݡ�
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political,
s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010232', '�α�', '��', '����', '������Ա', '����082', 'Ӣ��', 99,
122, 117, null);

��52����������INSERT�����ѧ���������������ɾ������Ч����������ͬ��
INSERT INTO student VALUES ('0807010232', '�α�', '��','����','������Ա',
'����082', 'Ӣ��', 99, 122, 117, null);

��53����ѧ�����ָ�����в������ݡ�
INSERT INTO student 
(s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language)
VALUES ('0807010232', '�α�', '��', '����', '������Ա', '����082', 'Ӣ��');

��54����ѧ�����ָ�����в������ݣ��е�˳��������ж����˳��ͬ��
INSERT INTO student 
(s_nation, s_political, s_classname, s_language, s_gender, s_name, s_id)
VALUES ('����', '������Ա', '����082', 'Ӣ��', '��', '�α�', '0807010232');

��55����ѧ�����s_name�в�����ַ�����
INSERT INTO student (s_id, s_name) VALUES ('0807010232', '');

��56������һ����ʱ��student_temp����ṹ��ѧ������ȫ��ͬ��Ȼ��ʹ��INSERT INTO SELECT��佫ѧ�����е��������ݶ����뵽��student_temp�С�
CREATE TABLE student_temp(
	s_id VARCHAR2(10) CONSTRAINT pk_student1 PRIMARY KEY, 
	s_name VARCHAR2(20) NOT NULL, 
	s_gender VARCHAR2(10) CONSTRAINT nn_s_gender1 NOT NULL CONSTRAINT check_gender1 CHECK (s_gender IN('��', 'Ů')),
	s_nation VARCHAR2(10) NOT NULL, 
	s_political VARCHAR2(20) NOT NULL, 
	s_classname VARCHAR2(100) NOT NULL,  
	s_language VARCHAR2(20) NOT NULL,  
	s_chinese NUMBER(4, 1),
	s_math NUMBER(4, 1),
	s_foreign NUMBER(4, 1),
	s_duty VARCHAR2(50)
);
INSERT INTO student_temp SELECT * FROM student;

��57����ѧ�����е�ָ���е����ݲ��뵽��student_temp�С�
INSERT INTO student_temp(s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language)
SELECT s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language FROM student;

��58��ʹ��INSERT ALL��佫��������ͬʱ���뵽ѧ�����С�
INSERT ALL
INTO student VALUES ('0807010232', '�α�', '��', '����', '������Ա', '����082', 'Ӣ��', 99, 122, 127, null)
INTO student VALUES ('0807010233', '����', 'Ů', '����', '������Ա', '����082', 'Ӣ��', 103, 104, 98, null)
INTO student VALUES ('0807010234', '���ӭ', 'Ů', '����', '������Ա', '����082', 'Ӣ��', 116, 78, 109, '��֧��')
INTO student VALUES ('0807010301', '��ӨӨ', 'Ů', '����', '������Ա', '����083', '����', 115, 94, 132, '����ίԱ')
INTO student VALUES ('0807010302', '��׺�', '��', '����', '������Ա', '����083', 'Ӣ��', 104, 112, 102, null)
SELECT * FROM dual;

��59��ʹ��INSERT ALL��佫����ѧ��������ݲ��뵽student_temp���С�
INSERT ALL
INTO student_temp(s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language)
VALUES (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language)
SELECT * FROM student;

��60��ʹ��INSERT ALL��佫����ѧ��������ݷֱ���뵽student_temp���student_temp2���У�student_temp2��Ķ�����student_temp��ȫ��ͬ��������student_temp2������һ�У�s_duty�����ݡ�
INSERT ALL
INTO student_temp(s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language)
VALUES (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language)
INTO student_temp2(s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language,s_duty)
VALUES (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_duty)
SELECT s_id, s_name, s_gender

��61�����������������������������Ҫ��ְ࣬һ�ǰ������ַ֣����ǰ��ճɼ��֡�ʹ��INSERT ALL��佫����ѧ��������ݰ��������ԭ��ֵ�����ְ��fclass�С�
CREATE TABLE fclass(  --����ְ��
	s_id VARCHAR2(10) CONSTRAINT pk_student_fclass PRIMARY KEY, --����
	c_type VARCHAR2(20) --�༶����
);
INSERT ALL
WHEN s_language = 'Ӣ��' AND s_foreign >= 120
THEN INTO fclass(s_id, c_type) VALUES(s_id, 'Ӣ��A��')
WHEN s_language = 'Ӣ��' AND s_foreign >= 100 AND s_foreign < 120
THEN INTO fclass(s_id, c_type) VALUES(s_id, 'Ӣ��B��')
WHEN s_language = 'Ӣ��' AND s_foreign < 100
THEN INTO fclass(s_id, c_type) VALUES(s_id, 'Ӣ��C��')
WHEN s_language = '����' THEN INTO fclass(s_id, c_type) VALUES(s_id, '�����')
ELSE INTO fclass(s_id, c_type) VALUES(s_id, '�����')
SELECT s_id, s_language, s_foreign FROM student;
SELECT s_id, c_type FROM fclass;

��62������60��WHEN���������Ķ�һ�£���ԭ��Ӣ��B��ķ������� ��s_foreign >= 100 AND s_foreign < 120����Ϊ��s_foreign >= 100����Ȼ����Ȼʹ��INSERT ALL�������ݡ�
INSERT ALL
WHEN s_language = 'Ӣ��' AND s_foreign >= 120
THEN INTO fclass(s_id, c_type) VALUES(s_id, 'Ӣ��A��')
WHEN s_language = 'Ӣ��' AND s_foreign >= 100
THEN INTO fclass(s_id, c_type) VALUES(s_id, 'Ӣ��B��')
WHEN s_language = 'Ӣ��' AND s_foreign < 100
THEN INTO fclass(s_id, c_type) VALUES(s_id, 'Ӣ��C��')
WHEN s_language = '����' THEN INTO fclass(s_id, c_type) VALUES(s_id, '�����')
ELSE INTO fclass(s_id, c_type) VALUES(s_id, '�����')
SELECT s_id, s_language, s_foreign FROM student;

��63������62�е�INSERT ALL��ΪINSERT FIRST���ڿ�һ�����н����
INSERT FIRST
WHEN s_language = 'Ӣ��' AND s_foreign >= 120
THEN INTO fclass(s_id, c_type) VALUES(s_id, 'Ӣ��A��')
WHEN s_language = 'Ӣ��' AND s_foreign >= 100
THEN INTO fclass(s_id, c_type) VALUES(s_id, 'Ӣ��B��')
WHEN s_language = 'Ӣ��' AND s_foreign < 100
THEN INTO fclass(s_id, c_type) VALUES(s_id, 'Ӣ��C��')
WHEN s_language = '����' THEN INTO fclass(s_id, c_type) VALUES(s_id, '�����')
ELSE INTO fclass(s_id, c_type) VALUES(s_id, '�����')
SELECT s_id, s_language, s_foreign FROM student;
SELECT s_id, c_type FROM fclass;

��64����ѧ�����е�Ӣ��ɼ�����ɰٷ��ƣ�����Ϊ�������ݶ�ԭ�ɼ����и��¡�
UPDATE student SET s_foreign = s_foreign * 100/150;
SELECT s_id, s_name, s_foreign, s_classname FROM student;

��65������ѧ������ѧ��Ϊ��0807010234����ѧ��������Ϊ�����塱��Ӣ��ɼ�Ϊ120��
UPDATE student SET s_nation = '����', s_foreign = 120, s_classname = '
�Ź�081' WHERE s_id = '0807010234';   --����һ������
SELECT s_id, s_name, s_nation, s_foreign, s_classname FROM student 
WHERE s_id = '0807010234';
UPDATE student SET s_nation = '����', s_foreign = 120, s_classname = '
�Ź�081' WHERE s_id > '0807010234';  --���¶�������
UPDATE student SET s_nation = '����', s_foreign = 120, s_classname = '
�Ź�081';                                 --������������
UPDATE student SET s_nation = '����', s_foreign = 120, s_classname = ' 
�Ź�081' WHERE s_id = '0907010234';

��66��ɾ��ѧ�����е�ѧ����Ϣ��
DELETE FROM student WHERE s_id = '0807010234';   
DELETE FROM student WHERE s_foreign > 130;       
DELETE student;              
DELETE FROM student WHERE s_id = '0907010234';

��67��ʹ��TRUNCATE���ɾ��ѧ�����е��������ݡ�
TRUNCATE TABLE student;
 
��68��ɾ��ѧ����
DROP TABLE student;
  
��69���ָ���68ɾ����ѧ����  
SELECT COUNT(*) FROM student;
show recyclebin;
FLASHBACK TABLE student TO BEFORE DROP RENAME TO student_test;
SELECT COUNT(*) FROM student_test;

��70������ɾ����student_test����������������վ�С�
DROP TABLE student_test PURGE;