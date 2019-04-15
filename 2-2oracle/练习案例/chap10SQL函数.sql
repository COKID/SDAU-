��1��ʹ��ASCII������ȡ�����ַ���ASCII���ֵ��
SELECT ASCII('a'),ASCII('A'),ASCII('1'),ASCII('9'),ASCII('��'),ASCII('��')

��2��ʹ��CHR������ȡ����ASCIIֵ����Ӧ���ַ���
SELECT CHR(97), CHR(65), CHR(49), CHR(57), CHR(54992), CHR(47610)
FROM dual;

��3����ѯ�ڿ����������ڿ������ƣ������ڿ������ڿ��ȼ�����������
SELECT CONCAT(CONCAT(journal_name, ' is '),journal_level) AS journal_level
FROM journal;

��4����ѯ�ڿ����������ڿ������ƣ�����Ӣ���ڿ�������ȫ���Դ�д�ķ�ʽ���ء�
SELECT INITCAP(journal_name) FROM journal;

��5�����ַ�����Information Systems Research����Ѱ���ַ���i����һ�γ��ֵ�λ�á�
SELECT INSTR('Information Systems Research', 'i') FROM dual;

��6�����ַ�����Information Systems Research����Ѱ���ַ���s���ڶ��γ��ֵ�λ�ã������Ǵӵ�16λ�ַ���ʼѰ�ҡ�
SELECT INSTR('Information Systems Research', 's', 16, 2) FROM dual;

��7����ѯ�ڿ����������ڿ����а�����INFORMATION�����ڿ���
SELECT journal_name FROM journal
WHERE INSTR(journal_name, UPPER('infor')) > 0;

��8��ʹ��INSTR����ʵ����7.22�Ĳ�ѯ���ܡ�
SELECT s_id, s_name, s_nation, s_political, s_classname FROM student
WHERE INSTR(s_political, '��Ա') > 0;

��9����ѯ�ڿ����������ڿ������ƣ�����Ӣ���ڿ�������ȫ����Сд�ķ�ʽ���ء�
SELECT LOWER(journal_name), journal_level FROM journal;

��10����ѯ�ڿ����������ڿ������ƣ�����Ӣ���ڿ�������ȫ���Դ�д�ķ�ʽ���ء�
SELECT UPPER(journal_name), journal_level FROM journal;

��11���ֱ���0����ʦ������Ҳ���10λ��
SELECT LPAD(t_id, 10, '0'),RPAD(t_id, 10, '0') FROM teacher;

��12��ʹ��LTRIM������ȡ�ո���ַ���
SELECT LENGTH(LTRIM(' oracle  ')), LENGTH(LTRIM(' oracle  ', ' ')) FROM dual;

��13��ʹ��RTRIM������ȡ�ո���ַ���
SELECT LENGTH(RTRIM(' oracle  ')), LENGTH(RTRIM(' oracle  ', ' ')) FROM dual;

��14��ʹ��TRIM������ȡ�ո���ַ���
SELECT TRIM(LEADING '*' FROM '**oracle*') c1, TRIM(TRAILING '*' FROM
'**oracle*') c2, TRIM(BOTH '*' FROM '**oracle*') c3, TRIM('*' FROM
'**ora*cle*') c4, LENGTH(TRIM('  oracle ')) c5 FROM dual;

��15��ʹ��LENGTH������LENGTHB�����ֱ����Ӣ���ַ����������ַ����ĳ��ȡ�
SELECT LENGTH('oracle'), LENGTHB('oracle'),
LENGTH('���ݿ�'), LENGTHB('���ݿ�') FROM dual;

��16��ʹ�� ��Oracle���ݿ⡱�����ѧϰ���ݿ⡱�еġ����ݿ⡱��
SELECT REPLACE('ѧϰ���ݿ�', '���ݿ�', 'Oracle���ݿ�') FROM dual;

��17��ʹ��SUBSTR������SUBSTRB�����ֱ��ȡӢ���ַ����������ַ������Ӵ���
SELECT SUBSTR('oracle', 1, 3) c1, SUBSTRB('oracle', 1, 3) c2,
SUBSTR('ѧϰ���ݿ�', 1, 3) c3, SUBSTRB('ѧϰ���ݿ�', 1, 3) c4 FROM dual;

��18��ʹ��SUBSTR������SUBSTRB�������Ҳ෵��Ӣ���ַ����������ַ������Ӵ���
SELECT SUBSTR('oracle', -2, 3) c1, SUBSTRB('oracle', -2, 3) c2,
SUBSTR('ѧϰ���ݿ�', -2, 3) c3, SUBSTRB('ѧϰ���ݿ�', -2, 3) c4 FROM dual;

��19��ʹ��ABS������ȡ��ֵ�ľ���ֵ��
SELECT ABS(123.456), ABS(0), ABS(-123.456) FROM dual;

��20��CEIL����ʹ��ʾ����
SELECT AVG(s_foreign), CEIL(AVG(s_foreign)) FROM student;
SELECT CEIL(-98.76), CEIL(-123.456) FROM dual;

��21��FLOOR����ʹ��ʾ����ע����CEIL�������жԱȡ�
SELECT AVG(s_foreign), FLOOR(AVG(s_foreign)) FROM student;
SELECT FLOOR(-98.76), FLOOR(-123.456) FROM dual;

��22��ʹ��MOD������ȡ2��������������
SELECT MOD(123, 4), MOD(4, 123) FROM dual;

��23����ѯ�����༶����ѧ�ɼ���ƽ��ֵ����������������롣
SELECT s_classname, AVG(s_math), ROUND(AVG(s_math)), ROUND(AVG(s_math),2) FROM student
WHERE s_classname LIKE '%08%' GROUP BY s_classname ORDER BY s_classname;

��24����ѯ�����༶����ѧ�ɼ���ƽ��ֵ���Բ�������н�ȡ��
SELECT s_classname, AVG(s_math), TRUNC(AVG(s_math)), TRUNC(AVG(s_math),2) FROM student
WHERE s_classname LIKE '%08%' GROUP BY s_classname ORDER BY s_classname;

��25��ʹ��ADD_MONTHS�����������ڵĴ���
SELECT t_name, t_entertime, ADD_MONTHS(t_entertime, 12) FROM teacher;
SELECT ADD_MONTHS(SYSDATE, -2) FROM dual; 
SELECT ADD_MONTHS(TO_DATE('01-1��-2012 11:12:13','DD-MON-YYYY
2 HH24:MI:SS'), 5) FROM dual;

��26��ʹ��CURRENT_DATE��CURRENT_TIMESTAMP������ȡ��ǰʱ�䡣
SELECT CURRENT_DATE, CURRENT_TIMESTAMP FROM dual;
ALTER SESSION SET NLS_DATE_FORMAT = 'yyyy-mon-dd';
SELECT CURRENT_DATE, CURRENT_TIMESTAMP FROM dual;
ALTER SESSION SET NLS_TIMESTAMP_FORMAT = 'yyyy-mm-dd hh24:mi:ssxff';
SELECT CURRENT_DATE, CURRENT_TIMESTAMP FROM dual;
ALTER SESSION SET NLS_DATE_LANGUAGE = 'AMERICAN';
SELECT CURRENT_DATE, CURRENT_TIMESTAMP FROM dual;

��27��ʹ��EXTRACT������ȡ��ݡ��·ݵ����ڡ�
SELECT EXTRACT(YEAR FROM SYSDATE) year, EXTRACT(MONTH FROM SYSDATE) month,
EXTRACT(DAY FROM SYSDATE) day, EXTRACT(HOUR FROM SYSTIMESTAMP) + 8 hour,
EXTRACT(MINUTE FROM SYSTIMESTAMP) minute, EXTRACT(SECOND FROM SYSTIMESTAMP)
second FROM dual;
SELECT EXTRACT(HOUR FROM SYSDATE) hour FROM dual;
SELECT TO_CHAR(SYSDATE, 'hh24') hour, TO_CHAR(SYSDATE, 'mi') MINUTE,
TO_CHAR(SYSDATE, 'ss') SECOND FROM dual;
SELECT EXTRACT(YEAR FROM DATE '2012-1-1') year,
EXTRACT(HOUR FROM TIMESTAMP '2012-01-14 13:46:41') hour FROM dual;

��28��ʹ��EXTRACT��������2������֮���ʱ��
SELECT EXTRACT(DAY FROM (t2-t1) DAY TO SECOND) day, EXTRACT(HOUR FROM (t2-t1))
hour,EXTRACT(SECOND FROM (t2-t1)) second FROM
(SELECT TIMESTAMP '2011-02-04 15:07:00' t1
,TIMESTAMP '2012-05-17 19:08:46' t2 FROM dual);
SELECT t_id, t_name, t_entertime, '��ְʱ��Ϊ:' ||
EXTRACT(YEAR FROM (SYSDATE - t_entertime) YEAR TO MONTH) || '��' ||
EXTRACT(MONTH FROM (SYSDATE - t_entertime) YEAR TO MONTH)||'��' ��ְʱ��
FROM teacher;

��29��ʹ��LAST_DAY������ȡ��ǰ���������µ����һ�졣
SELECT SYSDATE, LAST_DAY(SYSDATE) last_day FROM dual;

��30��ʹ��MONTHS_BETWEEN��������2������֮����·ݲ
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') d1,
MONTHS_BETWEEN('01-2��-12', SYSDATE) d2,
MONTHS_BETWEEN('01-2��-12', TRUNC(SYSDATE)) d3 FROM dual;

��31��ʹ��NEXT_DAY������ȡ��ǰ����֮��ĵ�һ�������ʱ�䡣
SELECT SYSDATE, NEXT_DAY(SYSDATE, '������') FROM dual;

��32��ʹ��ROUND���������ڽ����������롣
SELECT ROUND(TO_DATE('2012-6-15 11:59:59', 'YYYY-MM-DD HH24:MI:SS')) d1,
TO_CHAR(ROUND(TO_DATE('2012-6-15 11:59:59', 'YYYY-MM-DD HH24:MI:SS')),'YYYY-MM-DD HH24:MI:SS') d2,
ROUND(TO_DATE('2012-6-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS')) d3,
TO_CHAR(ROUND(TO_DATE('2012-6-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),'YYYY-MM-DD HH24:MI:SS') d4
FROM dual;

SELECT
TO_CHAR(ROUND(TO_DATE('2012-6-15 12:29:59', 'YYYY-MM-DD HH24:MI:SS'), 'HH'), 'YYYY-MM-DD HH24:MI:SS') d1,
TO_CHAR(ROUND(TO_DATE('2012-6-15 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'HH'), 'YYYY-MM-DD HH24:MI:SS') d2,
TO_CHAR(ROUND(TO_DATE('2012-6-15 12:30:29', 'YYYY-MM-DD HH24:MI:SS'), 'MI'), 'YYYY-MM-DD HH24:MI:SS') d3,
TO_CHAR(ROUND(TO_DATE('2012-6-15 12:30:30', 'YYYY-MM-DD HH24:MI:SS'), 'MI'), 'YYYY-MM-DD HH24:MI:SS') d4
FROM dual;

SELECT ROUND(DATE '2012-6-15','MM') d1, ROUND(DATE '2012-6-16','MM') d2,
ROUND(DATE '2012-6-30','YY') d3, ROUND(DATE '2012-7-1','YY') d4
FROM dual;

��33��ʹ��TRUNC���������ڽ��н�ȡ��
SELECT TRUNC(TO_DATE('2012-6-15 11:59:59', 'YYYY-MM-DD HH24:MI:SS')) d1,
TO_CHAR(TRUNC(TO_DATE('2012-6-15 11:59:59', 'YYYY-MM-DD HH24:MI:SS')),'YYYY-MM-DD HH24:MI:SS') d2,
TRUNC(TO_DATE('2012-6-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS')) d3,
TO_CHAR(TRUNC(TO_DATE('2012-6-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),'YYYY-MM-DD HH24:MI:SS') d4
FROM dual;
SELECT
TO_CHAR(TRUNC(TO_DATE('2012-6-15 12:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'HH'), 'YYYY-MM-DD HH24:MI:SS') d1,
TO_CHAR(TRUNC(TO_DATE('2012-6-15 12:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'MI'), 'YYYY-MM-DD HH24:MI:SS') d2
FROM dual;
SELECT TRUNC(DATE '2012-12-30', 'YY') d1, TRUNC(DATE '2012-12-30', 'MM')d2
FROM dual;

��34����ѧ��Ϊ0807070303��ѧ����ĩ���Ե��ܳɼ���
SELECT s_id, s_commongrade + s_finalgrade AS total FROM score
WHERE s_id = '0807070303';

��35������ѧ�����ܳɼ���������ĩ�ɼ���Ȩ����0.7��
SELECT s_id, s_commongrade + NVL2(s_finalgrade, s_finalgrade*0.7, 0) AS
total FROM score  WHERE s_id = '0807070303';

��36��ʹ��NULLIF�����ж�ѧ����ְ��
SELECT NULLIF(s_duty, '����ίԱ'), NULLIF(s_duty, '����ίԱ')
FROM student WHERE s_name = '�����';

��37��ʹ��COALESCE������д��34��
SELECT s_id, s_commongrade + COALESCE(s_finalgrade, 0) AS total
FROM score WHERE s_id = '0807070303';

��38��ʹ��TO_CHAR����ֵ������ת���ɸ��ָ�ʽ���ַ������ݡ�
SELECT TO_CHAR(1234567, '9,999,999') c1, TO_CHAR(123.456, '9999.9999') c2,
TO_CHAR(123.456, '999.99') c3, TO_CHAR(123.4, '09999.990') c4,
TO_CHAR(12.466666, '99.99') c5, TO_CHAR(1234, '$9,999') c6,
TO_CHAR(12.35, 'L99.9') c7 FROM dual;

��39��ʹ��TO_CHAR����ֵ������ת���ɸ��ָ�ʽ���ַ������ݡ�
SELECT TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD hh24:mi:ss.ff3') d1,
TO_CHAR(SYSTIMESTAMP, 'YEAR-month','nls_date_language = American') d2,
TO_CHAR(SYSTIMESTAMP, 'WW') d3, TO_CHAR(SYSDATE, 'W') d4 FROM dual;

��40��ʹ��TO_DATE����ֵ������ת���ɸ��ָ�ʽ���ַ������ݡ�


��41��ʹ��TO_NUMBER����ֵ������ת���ɸ��ָ�ʽ���ַ������ݡ�


��42��ʹ��DECODE��������ʦ���е�ְ�ƺű�Ϊְ������
SELECT t_id, t_name, t_research,
DECODE(t_titleid, 1, '����', 2, '������', 3, '��ʦ', 4, '����',
5, '�߼�����ʦ', 6, '����ʦ', 7, '�о�Ա', 8,'���о�Ա', 9, '�����о�Ա',
'����') AS title
FROM teacher;

��43��ʹ��DECODE��������ڲ�ͬ�ȼ��ڿ��Ϸ������ĵĿ��з�����
SELECT p.paper_title, p.paper_journal,
DECODE(journal_level, 'TOP', 5*10, '����A', 4*10, '����B', 3*10,
'����A', 3*10, '����B', 2*10, 1*10
) AS paper_score
FROM paper p, journal j
WHERE p.paper_journal = j.journal_name(+)
ORDER BY paper_score DESC;

��44��DECODE��������ֵΪ��ֵ�������
SELECT s_id, s_name, DECODE(s_duty, NULL, 'û��ְ��', s_duty) FROM student;

��45����ORDER BY�Ӿ���ʹ��DECODE����ʵ�̶ֹ�����Ĺ��ܡ�
SELECT AVG(s_foreign), s_classname FROM student GROUP BY s_classname
ORDER BY DECODE(s_classname, '�Ź�081', 1, '�Ź�082',2,'����081', 3,'����082',
4, '����083', 5, '��ó081', 6, '��ó082', 7, '����091', 8, '����092', 8);

��46��ʹ��DUMP������ȡ���ݵ��ڲ��������ݡ�
SELECT DUMP('dba') a, DUMP('dba', 16) b,DUMP('dba',1016) c, DUMP('dba',1016, 2, 3) d
FROM dual;
