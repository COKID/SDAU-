��1������һ�������������֡�ִ�в��ֺ��쳣�����ֵ�PL/SQL�顣
DECLARE
/*��������*/
v_t_name VARCHAR2(30);
BEGIN
/*ִ�в���*/
SELECT t_name INTO v_t_name FROM teacher WHERE t_id = '060001';
DBMS_OUTPUT.PUT_LINE('�ý�ʦ����Ϊ��' || v_t_name);
EXCEPTION
/*�쳣������*/
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('���޴���');
END;
/

��2������һ��ֻ����ִ�в��ֵ�PL/SQL�顣
BEGIN
DBMS_OUTPUT.PUT_LINE('Hello Everybody');
END;
/

��3������һ�������ӿ��PL/SQL�飬��ѯ���Ϊ��060001���Ľ�ʦ����ϵ�Ľ�ʦ��������
DECLARE
v_num NUMBER;
v_t_departmentid NUMBER(2);
BEGIN
BEGIN
SELECT t_departmentid INTO v_t_departmentid
FROM teacher WHERE t_id = '060001';
END;
SELECT COUNT(t_id) INTO v_num FROM teacher
WHERE t_departmentid = v_t_departmentid;
DBMS_OUTPUT.PUT_LINE('��ϵ��ʦ����Ϊ��' || v_num);
END;
/

��4����ְ�Ʊ��в���һ����ְ����Ϣ��
DECLARE
v_title title%ROWTYPE;
BEGIN
v_title.title_id:='10';
v_title.title_name:='��Ƹ';
INSERT INTO title VALUES(v_title.title_id, v_title.title_name);
COMMIT;
END;
/

��5�������û��Զ������������EMPLOYEES_TYPE��
CREATE OR REPLACE TYPE EMPLOYEES_TYPE  AS OBJECT(
id NUMBER(5),
firstname VARCHAR2(20),
lastname  VARCHAR2(20));
/

��6����ѧ������ɾ��s_idΪ0807070304��ѧ����¼��
DECLARE
t_id VARCHAR2(30) :='0807070304';
BEGIN
DELETE FROM student WHERE t_id = t_id;
END;
/

��7����ѯϵ���Ϊ1�Ľ�ʦ�����Ƿ񳬹�5�ˡ�
SET SERVEROUTPUT ON
DECLARE
v_num NUMBER;
BEGIN
SELECT COUNT(*) INTO v_num
FROM teacher
WHERE t_departmentid = '1';
IF v_num > 5 THEN
DBMS_OUTPUT.PUT_LINE('��ϵ��Ľ�ʦ��������5��');
END IF;
END;
/

��8����ѯϵ���Ϊ1ϵ�Ľ�ʦ�����Ƿ񳬹�5�ˡ��������5����ʾ����ϵ��ʦ����������5�ˡ��� ������ʾ����ϵ��ʦ������С�ڵ���5�ˡ���
DECLARE
v_num NUMBER;
BEGIN
SELECT COUNT(*) INTO v_num
FROM teacher
WHERE t_departmentid = '1';
IF v_num > 5 THEN
DBMS_OUTPUT.PUT_LINE('��ϵ��Ľ�ʦ��������5��');
ELSE
DBMS_OUTPUT.PUT_LINE('��ϵ��Ľ�ʦ����С�ڵ���5��');
END IF;
END;
/

��9������ѧ��������ɼ����пγ̵ķְ࣬�ְ�ԭ�����£�
130<S_FOREIGN<=150   A��
110<S_FOREIGN<=130   B��
90<S_FOREIGN<=110    C��
S_FOREIGN<=90         D��
DECLARE
v_foreign student.s_foreign%TYPE;
BEGIN
SELECT s_foreign INTO v_foreign FROM student
WHERE s_id=&p_id and s_language = 'Ӣ��';
IF v_foreign<=90  THEN
DBMS_OUTPUT.PUT_LINE('D��');
ELSIF v_foreign<=110  THEN
DBMS_OUTPUT.PUT_LINE('C��');
ELSIF v_foreign<=130  THEN
DBMS_OUTPUT.PUT_LINE('B��');
ELSE
DBMS_OUTPUT.PUT_LINE('A��');
END IF;
END;
/

��10���ж�3�����е����ֵ��
DECLARE
a NUMBER:=5;
b NUMBER:=6;
c NUMBER:=7;
x NUMBER;
BEGIN
IF(a > b) AND (a > c) THEN
x := a;
ELSE
x := b;
IF c > x THEN
x := c;
END IF;
END IF;
DBMS_OUTPUT.PUT_LINE('���ֵΪ:' || x);
END;
/

��11����CASE����ж�v_grade������ֵ�Ƿ����A��B��C��D��E�����ֱ���
DECLARE
v_grade VARCHAR2(10):= 'B';
BEGIN
CASE v_grade
WHEN 'A' THEN DBMS_OUTPUT.PUT_LINE('Excellent');
WHEN 'B' THEN DBMS_OUTPUT.PUT_LINE('Very Good');
WHEN 'C' THEN DBMS_OUTPUT.PUT_LINE('Good');
WHEN 'D' THEN DBMS_OUTPUT.PUT_LINE('Fair');
WHEN 'E' THEN DBMS_OUTPUT.PUT_LINE('Poor');
ELSE  DBMS_OUTPUT.PUT_LINE('No such grade');
END CASE;
END;
/

��12��ʹ��CASE���ʵ����9�Ĺ��ܡ�
DECLARE
v_foreign student.s_foreign%TYPE;
BEGIN
SELECT s_foreign INTO v_foreign FROM student
WHERE s_id = &p_id and s_language = 'Ӣ��';
CASE
WHEN v_foreign<=90  THEN
DBMS_OUTPUT.PUT_LINE('D��');
WHEN v_foreign<=110  THEN
DBMS_OUTPUT.PUT_LINE('C��');
WHEN v_foreign<=130  THEN
DBMS_OUTPUT.PUT_LINE('B��');
ELSE
DBMS_OUTPUT.PUT_LINE('A��');
END CASE;
END;
/

��13��ʹ��LOOP���ʵ�����1-5֮���ƽ������
DECLARE
i NUMBER:=1;
BEGIN
LOOP
DBMS_OUTPUT.PUT_LINE( i || '��ƽ����Ϊ' || i*i);
i:=i+1;
EXIT WHEN i>5;
END LOOP;
END;
/

��14��ʹ��LOOPѭ������в���30����¼��
CREATE TABLE student_temp         
(s_id VARCHAR2(10), s_name VARCHAR2(30));
DECLARE                     
v_counter NUMBER:=1;
BEGIN
LOOP
INSERT INTO student_temp VALUES('11070101' || LPAD(v_counter,2,'0'),
'tester');
v_counter:=v_counter+1;
IF v_counter > 30 THEN
Exit;
END IF;
END LOOP;
END;
/
SELECT * FROM student_temp;

��15����WHILEѭ��ʵ����13�Ĺ���
DECLARE
i NUMBER:=1;
BEGIN
While(i<=5) LOOP
DBMS_OUTPUT.PUT_LINE(i || '��ƽ����Ϊ' || i*i);
i:=i+1;
END LOOP;
END;
/

��16��ʹ��WHILEѭ��ʵ����14�Ĺ��ܡ�
DECLARE
v_counter NUMBER:=1;
BEGIN
WHILE v_counter <= 30 LOOP
INSERT INTO student_temp VALUES('11070101' || LPAD(v_counter,2,'0'),
'tester');
v_counter:=v_counter + 1;
END LOOP;
END;
/

��17��ʹ��FORѭ��ʵ����14�Ĺ��ܡ�
DECLARE
v_counter NUMBER:=1;
BEGIN
FOR v_counter IN 1..30 LOOP
INSERT INTO student_temp VALUES('11070101' || LPAD(v_counter,2,'0'),
'tester');
END LOOP;
END;
/

��18����FORѭ���ṹ��10�Ľ׳ˡ�
DECLARE
n NUMBER:=1;
BEGIN
FOR v_count IN 1..10  LOOP
n:=n* v_count;
END LOOP;
DBMS_OUTPUT.PUT_LINE(n);
END;
/

��19���������1��5֮���������
BEGIN
FOR i IN REVERSE 1..5 LOOP
DBMS_OUTPUT.PUT_LINE('i=' || i);
END LOOP;
END;
/

��20������10��20��100���ۼӺ͡�
DECLARE
v_total NUMBER:=0;
BEGIN
FOR v_num IN 1..100 LOOP
IF MOD(v_num,10)=0 THEN
v_total:=v_total+v_num;
END if;
END LOOP;
DBMS_OUTPUT.PUT_LINE(v_total);
END;
/

��21��ȫ�ֱ�����ѭ��������
DECLARE
v_total NUMBER:=0;
BEGIN
FOR v_num IN 1..10 LOOP
v_total:=total+v_num;
END LOOP;
DBMS_OUTPUT.PUT_LINE(v_num);
DBMS_OUTPUT.PUT_LINE(v_total);
END;
/

��22��ѭ�����1-10֮���ƽ������ֱ��������һ������3�ı���Ϊֹ��
DECLARE
i NUMBER:=1;
BEGIN
While(i<=10) LOOP
IF mod(i, 3)=0 THEN EXIT;
END IF;
DBMS_OUTPUT.PUT_LINE(i || '��ƽ����Ϊ' || i*i);
i:=i+1;
END LOOP;
END;
/

��23��ʹ�ñ�ǩ��ʾ��ͬ��ѭ����
BEGIN
<<outer>>
FOR i IN  REVERSE  1..3 LOOP
<<inner>>
FOR j IN  1..3 LOOP
DBMS_OUTPUT.PUT_LINE('i='||i||','||'j='||j);
END LOOP;
END LOOP;
END;
/

��24��GOTO���ͱ�ǩ����ʵ��ѭ�����ܡ�
DECLARE
x NUMBER:=0;
BEGIN
<<repeat_loop>>
x:=x+1;
DBMS_OUTPUT.PUT_LINE('x��ֵ��'||x);
IF x<3 THEN
GOTO repeat_loop;
END IF;
END;
/

��25����ʹ���α괦��������
DECLARE
v_name diploma.diploma_name%TYPE;
BEGIN
SELECT diploma_name INTO v_name FROM diploma;
END;
/

��26����ְ�Ʊ���ȡ������ְ�Ƶ�ְ�Ʊ���Լ�ְ�����ơ�
DECLARE
CURSOR diploma_cursor IS SELECT * FROM diploma;
v_id diploma.diploma_id%TYPE;
v_name diploma.diploma_name%TYPE;
BEGIN
IF NOT diploma_cursor%ISOPEN THEN
OPEN diploma_cursor;
END IF;
LOOP
FETCH diploma_cursor INTO v_id, v_name;
EXIT WHEN diploma_cursor%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('��' || diploma_cursor%ROWCOUNT ||
'����¼��' || 'ְ�Ʊ��Ϊ' || v_id || ',ְ������Ϊ' || v_name);
END LOOP;
CLOSE diploma_cursor;
END;
/

��27�����α���ʹ��%ROWTYPE����ʵ����26�Ĺ��ܡ�
DECLARE
CURSOR diploma_cursor IS SELECT * FROM diploma;
v_diploma diploma%ROWTYPE;
BEGIN
IF NOT diploma_cursor%ISOPEN THEN
OPEN diploma_cursor;
END IF;
LOOP
FETCH diploma_cursor INTO v_diploma;
EXIT WHEN diploma_cursor%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('��' || diploma_cursor%ROWCOUNT || '����¼��' ||
'ְ�Ʊ��Ϊ' || v_diploma.diploma_id ||
',ְ������Ϊ' || v_diploma.diploma_name);
END LOOP;
CLOSE diploma_cursor;
END;
/

��28�����α���ʹ��%ROWTYPE����ʵ����27�Ĺ��ܡ�
DECLARE
CURSOR diploma_cursor IS SELECT * FROM diploma;
v_diploma diploma_cursor%ROWTYPE;
BEGIN
IF NOT diploma_cursor%ISOPEN THEN
OPEN diploma_cursor;
END IF;
LOOP
FETCH diploma_cursor INTO v_diploma;
EXIT WHEN diploma_cursor%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('��' || diploma_cursor%ROWCOUNT || '����¼��' ||
'ְ�Ʊ��Ϊ' || v_diploma.diploma_id ||
',ְ������Ϊ' || v_diploma.diploma_name);
END LOOP;
CLOSE diploma_cursor;
END;
/

��29��ʹ��WHILEѭ��ʵ����27�Ĺ��ܡ�
DECLARE
CURSOR diploma_cursor IS SELECT * FROM diploma;
v_diploma diploma%ROWTYPE;
BEGIN
IF NOT diploma_cursor%ISOPEN THEN
OPEN diploma_cursor;
END IF;
FETCH diploma_cursor INTO v_diploma;
WHILE diploma_cursor%FOUND LOOP
DBMS_OUTPUT.PUT_LINE('��' || diploma_cursor%ROWCOUNT || '����¼��' ||
'ְ�Ʊ��Ϊ' || v_diploma.diploma_id ||
',ְ������Ϊ' || v_diploma.diploma_name);
FETCH diploma_cursor INTO v_diploma;
END LOOP;
CLOSE diploma_cursor;
END;
/

��30��ʹ��FORѭ��ʵ����26�Ĺ��ܡ�
DECLARE
CURSOR diploma_cursor IS SELECT * FROM diploma;
BEGIN
FOR v_diploma IN diploma_cursor LOOP
DBMS_OUTPUT.PUT_LINE('��' || diploma_cursor%ROWCOUNT || '����¼��' ||
'ְ�Ʊ��Ϊ' || v_diploma.diploma_id ||
',ְ������Ϊ' || v_diploma.diploma_name);
END LOOP;
END;
/

��31��ʹ���Ӳ�ѯ��FORѭ��ʵ����30�Ĺ��ܡ�
BEGIN
FOR v_diploma IN (SELECT * FROM diploma) LOOP
DBMS_OUTPUT.PUT_LINE('ְ�Ʊ��Ϊ' || v_diploma.diploma_id ||
',ְ������Ϊ' || v_diploma.diploma_name);
END LOOP;
END;
/

��32����û�вμӿγ̱��Ϊ060151��ĩ���ԣ���ĩ�ɼ�Ϊ��ֵ����ѧ���ĳɼ�����Ϊ0�֡�
SELECT s_id FROM score WHERE c_num =  '060151' AND s_finalgrade IS NULL;
DECLARE
v_num score.c_num%type:='060151';
CURSOR score_cursor IS SELECT * FROM score
WHERE c_num = v_num
FOR UPDATE OF s_finalgrade;
BEGIN
FOR score_record IN score_cursor LOOP
IF score_record.s_finalgrade IS NULL THEN
UPDATE score SET s_finalgrade = 0 WHERE CURRENT OF score_cursor;
END IF;
END LOOP;
COMMIT;
END;
/
SELECT s_id FROM score WHERE c_num =  '060151' AND s_finalgrade IS NULL;

��33��ʹ���α�ɾ��ְ��Ϊ����֯ίԱ����ѧ����Ϣ��
SELECT COUNT(*) FROM student WHERE s_duty = '��֯ίԱ';
DECLARE
CURSOR student_cursor IS SELECT * FROM student WHERE s_duty ='��֯ίԱ'
FOR UPDATE;
BEGIN
FOR student_record IN student_cursor LOOP
DELETE student WHERE CURRENT OF student_cursor;
END LOOP;
COMMIT;
END;
/
SELECT COUNT(*) FROM student WHERE s_duty = '��֯ίԱ';

��34��������2���������α꣬��ʹ���α�ӽ�ʦ���в�ѯϵ��Ϊ1���о�����Ϊ�������ھ򡱵Ľ�ʦ�ı�š��������о�����
DECLARE
CURSOR teacher_cursor(v_departmentid NUMBER, v_research VARCHAR2)
IS SELECT t_id, t_name, t_research FROM teacher
WHERE t_departmentid = v_departmentid AND t_research
LIKE '%' || v_research || '%';
teacher_record teacher_cursor%ROWTYPE;
BEGIN
OPEN teacher_cursor(1, '�����ھ�');
LOOP
FETCH teacher_cursor INTO teacher_record;
EXIT WHEN teacher_cursor%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('��ʦ���Ϊ:' || teacher_record.t_id || '������Ϊ:'
|| teacher_record.t_name || '���о�����Ϊ:' || teacher_record.t_research);
END LOOP;
CLOSE teacher_cursor;
END;
/

��35����������34��ͬ��ֻ��Ϊ�α궨����Ĭ��ֵ��
DECLARE
CURSOR teacher_cursor(v_departmentid NUMBER DEFAULT 1,
v_research VARCHAR2 DEFAULT '�����ھ�')
IS SELECT t_id, t_name, t_research FROM teacher
WHERE t_departmentid = v_departmentid AND t_research
LIKE '%' || v_research || '%';
teacher_record teacher_cursor%ROWTYPE;
BEGIN
OPEN teacher_cursor;       --û��ָ��������ʹ�õ���Ĭ��ֵ
LOOP
FETCH teacher_cursor INTO teacher_record;
EXIT WHEN teacher_cursor%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('��ʦ���Ϊ:' || teacher_record.t_id || '������Ϊ:'
|| teacher_record.t_name || '���о�����Ϊ:' || teacher_record.t_research);
END LOOP;
CLOSE teacher_cursor;
END;
/

��36���ô������α��FORѭ���������ÿһ��ϵ���ţ���ϵ���ŵ����������ϵ�Ľ�ʦ��ź�������
DECLARE
CURSOR dept_cursor IS SELECT DISTINCT(t_departmentid) FROM teacher;
CURSOR teacher_cursor(v_departmentid NUMBER) IS SELECT t_id,t_name
FROM teacher WHERE t_departmentid = v_departmentid;
BEGIN
FOR dept_record IN dept_cursor LOOP
DBMS_OUTPUT.PUT_LINE('ϵ����Ϊ:' || dept_record.t_departmentid);
FOR teacher_record IN teacher_cursor(dept_record.t_departmentid) LOOP
DBMS_OUTPUT.PUT_LINE('��ʦ���Ϊ:' || teacher_record.t_id
|| '����Ϊ��' || teacher_record.t_name);
END LOOP;
END LOOP;
END;
/

��37������ְ�Ʊ����û���ҵ����µļ�¼������ְ�Ʊ��в���һ����¼��
BEGIN
UPDATE title SET title_name = '��Ƹ' WHERE title_id = 10;
IF SQL%NOTFOUND THEN
DBMS_OUTPUT.PUT_LINE('û���ҵ�Ҫ���µļ�¼��');
INSERT INTO title VALUES(10, '��Ƹ');
COMMIT;
END IF;
END;
/

��38��ʹ��SQL%ROWCOUNT���������������ͬ�Ĺ��ܡ�
BEGIN
UPDATE title SET title_name = '��Ƹ' WHERE  title_id =10;
IF SQL%ROWCOUNT = 0 THEN
DBMS_OUTPUT.PUT_LINE('û���ҵ�Ҫ���µļ�¼��' );
INSERT INTO title VALUES(10,'��Ƹ');
COMMIT;
END IF;
END;
/

��39��ʹ��DUP_VAL_ON_INDEX�쳣��������ظ�ֵ�����⡣
BEGIN
UPDATE teacher SET t_idcard ='220421197909220031'--��060001���֤���ظ�
WHERE t_id = '060002';
EXCEPTION
WHEN DUP_VAL_ON_INDEX THEN
DBMS_OUTPUT.PUT_LINE('���֤���ظ���');
END;
/

��40��ʹ��NO_DATA_FOUND�쳣����δ�ҵ���ѯ��¼�Ĵ���
DECLARE
v_name teacher.t_name%TYPE;
BEGIN
SELECT t_name INTO v_name
FROM teacher WHERE t_id = '1234';
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('û���ҵ��κ����ݣ�');
END;
/

��41��ʹ��NO_DATA_FOUND�쳣����δ�ҵ���ѯ��¼�Ĵ���
DECLARE
e_title_id_fk EXCEPTION;
PRAGMA EXCEPTION_INIT(e_title_id_fk, -2292);
BEGIN
DELETE FROM title WHERE title_id=1;
EXCEPTION
WHEN e_title_id_fk THEN
DBMS_OUTPUT.PUT_LINE('��ʦ���д��ڸ�ְ�ƽ�ʦ�������޷�ɾ��!');
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('������������!');
END;
/

��42���жϽ�ʦ���Ϊ060001�Ľ�ʦ���Ƿ�Ϊ����������������ǣ������Զ����쳣������ñ�Ų����ڣ��򴥷�ϵͳԤ�����쳣��
DECLARE
v_name teacher.t_name%TYPE;
e_name EXCEPTION;
BEGIN
SELECT t_name INTO v_name FROM teacher WHERE t_id = '060001';
IF v_name <> '����' THEN RAISE e_name;
END IF;
EXCEPTION
WHEN e_name THEN
DBMS_OUTPUT.PUT_LINE('���󣬴˽�ʦ����������');
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('���޴��ˣ�');
END;
/

��43����ѯ��Ϊ���������Ľ�ʦ��ְ�񣬵�ǰ�����и��쳣��������
DECLARE
v_duty teacher.t_duty%TYPE;
BEGIN
BEGIN
SELECT t_duty INTO v_duty FROM teacher WHERE t_name = '����';
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('���޴��ˣ�');
END;
DBMS_OUTPUT.PUT_LINE('����������飡');
END;
/

��44����ѯϵ����Ϊ1�Ľ�ʦ��������ǰ����û�и��쳣��������
DECLARE
v_name teacher.t_name%TYPE;
BEGIN
BEGIN
SELECT t_name INTO v_name FROM teacher WHERE t_departmentid = 1;
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('���޴��ˣ�');
END;
DBMS_OUTPUT.PUT_LINE('����������飡');
EXCEPTION
WHEN TOO_MANY_ROWS THEN
DBMS_OUTPUT.PUT_LINE('�������Ƕ��У���ʱ�޷���ʾ��');
END;
/

��45�������þ�������Ӽ���˵���������ֵ��쳣��
DECLARE
v_var NUMBER(3):='abc';
BEGIN
v_var:=10;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('�����ڲ������쳣�����֣�');
END;
/

��45���ظ���������ӣ�������Ч�ؽ������쳣����
BEGIN
DECLARE
v_var NUMBER(3):='abc';
BEGIN
v_var:=10;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('�����ڲ������쳣�����֣�');
END;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('������������쳣�����֣�');
END;
/

��46�����±��Ϊ070002�Ľ�ʦ����ְʱ�䣬�����º����ְʱ�����ڡ�2002-1-1��ʱ�׳��Զ����쳣�������ȡ�������ʹ�����Ϣ�����������ڸ�ʽ��ƥ��Ĵ���
DECLARE
e_entertime EXCEPTION; --�����ƶ�һ�������������쳣
v_entertime DATE; --��ʦ����ְ����
v_ErrorCode number; --��ô�����Ϣ����ı���
v_ErrorText varchar2(200); --��ô�����Ϣ�ı��ı���
BEGIN
UPDATE teacher SET t_entertime = '2007-06-01' WHERE t_id = '070002'
RETURNING t_entertime INTO v_entertime;
IF v_entertime < '1-1�� -02' THEN
RAISE e_entertime;
END IF;
EXCEPTION
WHEN e_entertime THEN
DBMS_OUTPUT.PUT_LINE('��ְ���ڲ�������2002-1-1');
ROLLBACK;
WHEN OTHERS THEN
v_ErrorCode:=SQLCODE;
v_ErrorText:=SUBSTR(SQLERRM,1,200);
DBMS_OUTPUT.PUT_LINE('�������Ϊ��' || v_ErrorCode);
DBMS_OUTPUT.PUT_LINE('������ϢΪ��' || v_ErrorText);
END;
/
