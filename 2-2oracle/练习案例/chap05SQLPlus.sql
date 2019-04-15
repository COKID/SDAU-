��1��ʹ��sqlplus �Chelp����鿴sqlplus�����ʹ�÷�����
sqlplus -help

��2��ʹ��sqlplus�����¼SQL*Plus��Ȼ���������û����������������ݿ⡣
sqlplus

��3����sqlplus�������ָ���������ݿ���û��������룬Ȼ���������ݿ⡣
sqlplus learner/learner123

��4��ʹ��Oracle10g��SQL*Plus��¼��Զ�̵�Oracle11g�������ϡ�
sqlplus learner/learner123@10.1.236.12:1521/myorcl

��5�������ݿ����Ա����ݵ�¼�����ݿ��С�
sqlplus sys/linDB123 as sysdba

��6�������ݿ����Ա����ݵ�¼�����ݿ��С�
sqlplus sys/linDB123 as sysoper

��7��ʡ���û�������������ݿ����Ա��¼������
sqlplus / as sysdba

��8�������ڶ�����ݿ�ʱ����¼��ָ�������ݿ��С�
set oracle_sid=orcl1
sqlplus / as sysdba

��9��ʹ��sqlplus�����¼��SQL*Plus��Ȼ����ʹ��connect��������Oracle���ݿ⡣
sqlplus /nolog
conn / as sysdba

��10��ʹ��HELP INDEX�����ȡSQL*Plus֧�ֵ�������Ϣ��
HELP INDEX

��11��ʹ��HELP CONNECT�ķ�����ȡCONNECT��������ʹ�÷�����
HELP CONNECT

��12��ʹ��? CONNECT�ķ�����ȡCONNECT��������ʹ�÷�����
? CONNECT

��13������Ĳ�ѯ����ѯ��V_$PARAMETER��ͼ�Ķ��壬�����ʹ��SET LONG��������text�е���ʾ����������ȫ��ʾ���е����ݡ�
SET LONG 1000
SELECT text FROM dba_views WHERE view_name = 'V_$PARAMETER';

��14��ʹ��SET ECHO���������Ƿ���ʾ�ű��ļ������
SHOW ECHO
SELECT username FROM dba_users WHERE rownum < 3;
save c:\test.sql
@c:\test.sql
SET ECHO ON
@c:\test.sql
SELECT username FROM dba_users WHERE rownum < 3
/

��15��ʹ��SET FEEDBACK���������Ƿ���ʾSQL���ִ�еĽ����Ϣ��
SHOW FEEDBACK
SELECT paper_id, paper_title FROM paper WHERE rownum <= 5;
SELECT paper_id, paper_title FROM paper WHERE rownum <= 6;
CREATE TABLE test(id NUMBER(6));
SET FEEDBACK 0
CREATE TABLE test(id NUMBER(6));

��16��ʹ��SET HEADING�������ò���ʾ��ͷ��Ϣ��
SET HEADING OFF;
SELECT s_id, s_name, s_gender, s_nation, s_political FROM student;

��17��ʹ��SET NUMFORMAT�����������ֵ���ʾ���
SET NUMFORMAT $9,999,999,999
SELECT 12345678 n1, 1234.5678 n2, 1234.5678 n3 FROM dual;

��18��ʹ��SET TIME���������Ƿ���ʾϵͳʱ�䡣
SET TIME ON
SHOW ARRAYSIZE

��19��ʹ��SET TIMING���������Ƿ���ʾSQL���ִ��ʱ�䡣
SET TIMING ON
SELECT COUNT(*) FROM dba_objects;

��20��ʹ��SET PAUSE���������Ƿ񻺳���ʾ��ѯ�����
SET PAUSE ON
SET PAUSE '�밴�س����鿴��һҳ��¼'
SELECT s_id, s_name, s_classname FROM student;

��21��ʹ��SHOW PARAMETERS�����ȡ�����ļ��в�����������undo���Ĳ�����Ϣ��
SHOW PARAMETERS undo

��22��ʹ��SHOW SGA����鿴��ǰʵ����ϵͳȫ��������Ϣ��
SHOW SGA

��23��ʹ��SHOW USER����鿴��ǰ����SQL*Plus���û������ơ�
SHOW USER

��24��ʹ��SHOW RECYCLEBIN�����user_recyclebin��ͼ�鿴����վ�еĶ���
CREATE TABLE testrecyc(id NUMBER, name VARCHAR2(20));
DROP TABLE testrecyc;
SHOW RECYCLEBIN;    --���ֻ������
SELECT original_name, object_name, type, droptime FROM user_recyclebin;

��25���鿴recyclebin�����ĵ�ǰֵ��
SHOW PARAMETER recyclebin

��26���ڻỰ������û����û���վ��
CREATE TABLE testrecyc(id NUMBER PRIMARY KEY, name VARCHAR2(20));
ALTER SESSION SET recyclebin = OFF;   
DROP TABLE testrecyc;
SELECT original_name, object_name, type , droptime FROM user_recyclebin;

��27��ʹ�� PROMPT����������ʾ��Ϣ��
prompt
prompt ѡ���ʦ���е�ǰ2�м�¼
prompt
SELECT t_id, t_name, t_gender FROM teacher WHERE rownum < 3
/

��28��ʹ�� SAVE����滺�����е�SQL��䡣
SELECT t_id, t_name, t_gender FROM teacher WHERE rownum < 3;
SAVE c:\query1.sql

��29��ʹ�� @����ִ����6.24������query1.sql�е�SQL��䡣
@c:\query1.sql

��30��ʹ��EDIT�����ڼ��±��б༭SQL��䡣
SELECT t_id, t_name, t_gender FROM teacher WHERE rownum < 3;
ed
/

��31��ʹ��RUN����ִ�л������е�SQL��䡣
R

��32��ʹ��COLUMN�������ʾ������и�ʽ����
COL n1 FORMAT $9,999,999,999
COL n2 FORMAT 9999.999
COL n3 FORMAT 999.999
SELECT 12345678 n1, 1234.5678 n2, 1234.5678 n3 FROM dual;

��33��ʹ��COLUMN������ͷ��
COL n1 FORMAT $9,999,999,999 HEADING �ܽ��
COL n2 HEADING �ڶ�����
SELECT 12345678 n1, 1234.5678 n2, 1234.5678 n3 FROM dual;

��34��ʹ��DESC����鿴ѧ����Ľṹ��
DESC student

��35���ӽ�ʦ���а����н�ʦ����Ϣ��ѯ������������ı��ļ�d:\teacher.txt�С�
SPOOL D:\teacher.txt
SELECT t_id, t_name , t_duty, t_research FROM teacher;
SPOOL OFF

��36������SPOOL��������ɾ��ĳ�û��������б��SQL�ű���
SPOOL C:\drop_tables.sql
SELECT 'DROP TABLE '|| table_name ||';' AS ALLTABLES FROM user_tables;
SPOOL OFF

��37�������32���õ�����ʾ��ʽ��
CLEAR COLUMNS
SELECT 12345678 n1, 1234.5678 n2, 1234.5678 n3 FROM dual;

��38��ʹ�� login.sql�����û��Ļ���������
--������glogin.sql�Ĳ�������
SET LONG 500
SET LINESIZE 10
--������login.sql�Ĳ�������
SET LINESIZE 50






