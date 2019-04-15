��1�������ʦ��ţ���ѯ�ý�ʦ�Ľ�ʦ����������Ĵ洢���̶����ǲ��Ϸ��ģ�������һ���������
CREATE OR REPLACE PROCEDURE proc_tea(
v_id IN CHAR(6),       --�������������ͳ��ȣ��⽫�����������
v_name OUT VARCHAR2
) IS
BEGIN 
SELECT t_name INTO v_name FROM teacher WHERE t_id = v_id;
END;
/

��2������һ���޲����Ĵ洢���̣������ǰϵͳ��ʱ�䡣
CREATE OR REPLACE PROCEDURE out_date
IS
BEGIN
DBMS_OUTPUT.PUT_LINE('��ǰϵͳʱ��Ϊ: '||SYSDATE);
END out_date;
/

��3������һ������������Ĵ洢���̣���ָ����ŵĽ�ʦ��ְ�ƽ���һ����
CREATE OR REPLACE PROCEDURE update_tea(
v_id IN teacher.t_id%TYPE
)
IS
BEGIN
UPDATE teacher SET t_titleid = t_titleid - 1 WHERE t_id = v_id;
COMMIT;
END update_tea;
/

��4������һ�����������������Ĵ洢���̣����ݸ����Ľ�ʦ�ŷ��ؽ�ʦ���������о�����
CREATE OR REPLACE PROCEDURE query_tea(
v_id IN teacher.t_id%TYPE,
v_name OUT teacher.t_name%TYPE,
v_research OUT teacher.t_research%TYPE
)
IS
BEGIN
SELECT t_name, t_research INTO v_name, v_research
FROM teacher WHERE t_id = v_id;
END query_tea;
/

��5������һ����������������Ĵ洢���̣�����ĩ�ɼ���70%���㣬�����ء�
CREATE OR REPLACE PROCEDURE account_score(v_finalgrade IN OUT NUMBER)
IS
BEGIN
v_finalgrade:=v_finalgrade*0.7;
END account_score;
/

��6��ʹ��EXECUTE�����ô洢����out_date��
EXECUTE out_date();

��7����PL/SQL�����е��ô洢����out_date��
BEGIN
out_date();
END;
/

��8��ʹ��EXECUTE������ô洢����update_tea��
EXEC update_tea('060009');

��9��ʹ�����ƴ��ݵķ�������ʹ��EXECUTE�����е��ô洢����update_tea��
EXEC update_tea(v_id=>'060009');

��10����PL/SQL�����е��ô洢����update_tea��
BEGIN
update_tea('060009');
END;
/

��11��ʹ��&������ʵ�ֶ�̬�������벢��PL/SQL�����е��ô洢����update_tea��
DECLARE
v_id teacher.t_id%TYPE:=&p_id;
BEGIN
update_tea(v_id);
END;
/

��12����PL/SQL�����е��ô洢����query_tea����ѯ��ʦ���Ϊ��070004���Ľ�ʦ�������о�����
DECLARE
t_name teacher.t_name%TYPE;
t_research teacher.t_research%TYPE;
BEGIN
query_tea('070004', t_name, t_research);
DBMS_OUTPUT.PUT_LINE('��ʦ����Ϊ: '|| t_name);
DBMS_OUTPUT.PUT_LINE('�о�����Ϊ: '|| t_research);
END;
/

��13����PL/SQL�����е��ô洢����account_score������ĩ�ɼ�����70%���㡣
DECLARE
v_finalgrade number;
BEGIN
SELECT s_finalgrade INTO v_finalgrade FROM score
WHERE s_id = &p_id AND c_num = &p_num;
DBMS_OUTPUT.PUT_LINE('��ĩ���Ծ���ɼ�Ϊ: '|| v_finalgrade);
account_score(v_finalgrade);
DBMS_OUTPUT.PUT_LINE('��70%�����ɼ�Ϊ: '|| v_finalgrade);
END;
/

��14��ɾ���洢����out_date��
DROP PROCEDURE out_date;

��15���鿴�洢����query_tea�Ĳ�����Ϣ��
DESC query_tea;

��16����ѯ��ǰ�û��µ����д洢���̵����ơ�
SELECT DISTINCT(NAME) FROM user_source WHERE TYPE = 'PROCEDURE';

��17����ѯ�洢����query_tea��Դ���롣  
SELECT text FROM user_source WHERE NAME = 'QUERY_TEA';

��18������scott�û�ִ�д洢����out_date��Ȩ�ޡ�
GRANT EXECUTE ON out_date TO scott;
conn scott/tiger
SET SERVEROUTPUT ON;
EXECUTE LEARNER.out_date;

��19������һ���޲����Ĵ洢���������ؽ�ʦ��������ְʱ�䡣
CREATE OR REPLACE FUNCTION f_entertime
RETURN teacher.t_entertime%TYPE
IS
min_entertime teacher.t_entertime%TYPE;
BEGIN
SELECT MIN(t_entertime) INTO min_entertime
FROM teacher;
RETURN min_entertime;
END f_entertime;
/

��20������һ���޲����Ĵ洢���������ص�ǰϵͳ��ʱ�䡣
CREATE OR REPLACE FUNCTION f_out_date
RETURN DATE
IS
BEGIN
RETURN SYSDATE;
END f_out_date;
/

��21������һ���������Ĵ洢���������ݽ�ʦ�ŷ��ؽ�ʦ���ڵ�ϵ��š�
CREATE OR REPLACE FUNCTION f_departmentid(
v_id teacher.t_id%TYPE
)
RETURN teacher.t_departmentid%TYPE
IS
v_departmentid teacher.t_departmentid%TYPE;
BEGIN
SELECT t_departmentid INTO v_departmentid
FROM teacher
WHERE t_id = v_id;
RETURN v_departmentid;
END f_departmentid;
/

��22������һ�����������������Ĵ洢���������ݸ����Ľ�ʦ�ŷ��ؽ�ʦ���������Ա���о�����
CREATE OR REPLACE FUNCTION f_query_tea(
v_id IN teacher.t_id%TYPE,
v_gender OUT teacher.t_gender%TYPE,
v_research OUT teacher.t_research%TYPE
)
RETURN teacher.t_name%TYPE
IS
v_name teacher.t_research%TYPE;
BEGIN
SELECT t_name, t_gender, t_research
INTO v_name, v_gender, v_research
FROM teacher
WHERE t_id = v_id;
RETURN v_name;
END f_query_tea;
/

��23��ʹ�ñ������ܺ���f_entertime�ķ���ֵ��
var v1 VARCHAR2(100)
EXECUTE :v1 := f_entertime;
PRINT v1;

��24����SQL�����ֱ�ӵ��ú���f_entertime��
SELECT f_entertime FROM dual;

��25��ʹ�ð�DBMS_PUTPUT.PUT_LINE���ú���f_departmentid��
SET SERVEROUTPUT ON
EXEC DBMS_OUTPUT.PUT_LINE('������ְʱ��Ϊ��' || f_entertime);

��26����PL/SQL�����е��ô洢������
BEGIN
DBMS_OUTPUT.PUT_LINE('������ְʱ��Ϊ��' || f_entertime);
END;
/

��27��ʹ�ñ������ܺ���f_departmentid�ķ���ֵ��
var v1 VARCHAR2(100)
EXEC :v1:=f_departmentid('060001');

��28����SQL�����ֱ�ӵ��ú���f_departmentid��
SELECT f_departmentid('060001') FROM dual;

��29��ʹ�ð�DBMS_PUTPUT.PUT_LINE���ú���f_departmentid��
EXEC DBMS_OUTPUT.PUT_LINE('�ý�ʦ����ϵ��Ϊ��'||f_departmentid('060001'));

��30����PL/SQL�����е��ô洢����f_departmentid��
BEGIN
dbms_output.put_line('�ý�ʦ����ϵ��Ϊ��'||f_departmentid('060001'));
END;
/

��31����PL/SQL�����е��ô洢����f_query_tea��
var v_name VARCHAR2(30)
var v_gender VARCHAR2(3)
var v_research VARCHAR2(200)
EXECUTE :v_name := f_query_tea('070004', :v_gender, :v_research);

��32��ɾ���洢����f_departmentid��
DROP FUNCTION f_departmentid;

��33���鿴�洢����f_departmentid�Ĳ�����Ϣ
DESC f_query_tea;

��34���鿴�洢����f_query_tea��Դ�롣
SELECT text FROM user_source WHERE NAME = 'F_QUERY_TEA';

��35����һ�����ڲ�����һ��������һ�����̡�������ϵ���Ϊ�������ظ�ϵ��������Ա���ĳ������ڣ�������ϵ���Ϊ�������ظ�ϵ������Ա���ĳ������ڡ�
DECLARE
s_departmentid teacher.t_departmentid%TYPE;
s_maxbirthday teacher.t_birthday%TYPE;
s_lowbirthday teacher.t_birthday%TYPE;
FUNCTION return_maxbirthday
(v_departmentid teacher.t_departmentid%TYPE)
RETURN teacher.t_birthday%TYPE
AS
v_max teacher.t_birthday%TYPE;
BEGIN
SELECT MAX(t_birthday) INTO v_max FROM teacher
WHERE t_departmentid = v_departmentid;
RETURN v_max;
END return_maxbirthday;
PROCEDURE get_lowbirthday
(v_departmentid teacher.t_departmentid%TYPE,
v_low OUT teacher.t_birthday%TYPE)
AS
BEGIN
SELECT MIN(t_birthday) INTO v_low FROM teacher
WHERE t_departmentid= v_departmentid;
END get_lowbirthday;
BEGIN
s_departmentid:=&p_departmentid;
s_maxbirthday:= return_maxbirthday(s_departmentid);
get_lowbirthday(s_departmentid, s_lowbirthday);
DBMS_OUTPUT.PUT_LINE('��ϵ������Ľ�ʦ�����ϵĽ�ʦ�����շֱ�Ϊ��'||
s_maxbirthday||','||s_lowbirthday);
END;
/

��36����һ��PL/SQL���������������̣�һ�������ı��Ϊ��������һ����������ĿΪ��������������ĵķ������ڡ�
DECLARE
PROCEDURE show_paperinfo
(v_pid paper.paper_id%TYPE)
AS
v_ptime paper.paper_time%TYPE;
BEGIN
SELECT paper_time INTO v_ptime FROM paper
WHERE paper_id=v_pid;
DBMS_OUTPUT.PUT_LINE(v_ptime);
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('���ı�Ų���ȷ��');
END show_paperinfo;
PROCEDURE show_paperinfo
(v_ptitle paper.paper_title%TYPE)
AS
v_ptime paper.paper_time%TYPE;
BEGIN
SELECT paper_time INTO v_ptime FROM paper
WHERE paper_title LIKE '%' || v_ptitle || '%';
DBMS_OUTPUT.PUT_LINE(v_ptime);
EXCEPTION
WHEN TOO_MANY_ROWS THEN
DBMS_OUTPUT.PUT_LINE('������Ϣ������һ����');
END show_paperinfo;
BEGIN
show_paperinfo(1);
show_paperinfo('�����㷨�о�');
END;
/

��37������һ�����淶������Ϊtea_package�����а���һ���洢���̣�����ְ�Ʊ�Ż��ְ�����ƣ�������һ���洢����������ְ�Ʊ�Ż�ø�ְ�ư�����ʦ��������
CREATE OR REPLACE PACKAGE tea_package
IS
PROCEDURE get_titlename(
v_titleid title.title_id%TYPE,
v_titlename OUT title.title_name%TYPE
);
FUNCTION get_count(v_titleid title.title_id%TYPE)
RETURN NUMBER;
END tea_package;
/

��38������tea_package���İ����塣
CREATE OR REPLACE PACKAGE BODY tea_package
IS
PROCEDURE get_titlename(
v_titleid title.title_id%TYPE,
v_titlename OUT title.title_name%TYPE
)
IS
BEGIN
SELECT title_name INTO v_titlename FROM title
WHERE title_id = v_titleid;
END get_titlename;
FUNCTION get_count(v_titleid title.title_id%TYPE)
RETURN NUMBER
IS
v_count NUMBER;
BEGIN
SELECT COUNT(t_id) INTO v_count FROM teacher
WHERE t_titleid = v_titleid;
RETURN v_count;
END get_count;
END;
/

��39����PL/SQL�����е��ð�tea_package�еĴ洢����get_titlename��
DECLARE
s_titlename title.title_name%TYPE;
BEGIN
tea_package.get_titlename(1, s_titlename);
DBMS_OUTPUT.PUT_LINE('��ְ�Ƶ�����Ϊ��' || s_titlename);
END;
/

��40����PL/SQL�����е��ð�tea_package�еĴ洢����get_count��
DECLARE
s_count NUMBER;
BEGIN
s_count:=tea_package.get_count(1);
DBMS_OUTPUT.PUT_LINE('������Ϊ��' || s_count);
END;
/

��41��ͬʱ��PL/SQL�����е��ð�tea_package�еĴ洢����get_titlename�ʹ洢����get_count��
DECLARE
s_titlename title.title_name%TYPE;
s_count NUMBER;
BEGIN
tea_package.get_titlename(1, s_titlename);
s_count:=tea_package.get_count(1);
DBMS_OUTPUT.PUT_LINE('��ְ�Ƶ�����Ϊ��' || s_titlename);
DBMS_OUTPUT.PUT_LINE('��ְ�ƵĽ�ʦ����Ϊ��' || s_count);
END;
/

��42����һ�����������������̣���һ�������Խ�ʦ���Ϊ�������ڶ��������Խ�ʦ���������֤��Ϊ��������������������ͬ�������ĸ�����ͬ����˹��������ء�
CREATE OR REPLACE PACKAGE tea_overload
AS
PROCEDURE get_teaduty(v_id teacher.t_id%TYPE);
PROCEDURE get_teaduty(v_name teacher.t_name%TYPE,
v_card teacher.t_idcard%TYPE);
END tea_overload;
/

CREATE OR REPLACE PACKAGE BODY tea_overload
AS
PROCEDURE get_teaduty(v_id teacher.t_id%TYPE)
AS
v_duty teacher.t_duty%TYPE;
BEGIN
SELECT t_duty INTO v_duty FROM teacher
WHERE t_id=v_id;
DBMS_OUTPUT.PUT_LINE(v_duty);
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('���޴���');
END get_teaduty;
PROCEDURE get_teaduty(v_name teacher.t_name%TYPE,
v_card teacher.t_idcard%TYPE)
AS
v_duty  teacher.t_duty%TYPE;
BEGIN
SELECT t_duty INTO v_duty FROM teacher
WHERE t_name=v_name
AND t_idcard=v_card;
DBMS_OUTPUT.PUT_LINE(v_duty);
EXCEPTION
WHEN TOO_MANY_ROWS THEN
DBMS_OUTPUT.PUT_LINE('��ʦ��ְ����Ϣ������һ����¼');
END get_teaduty;
END;
/

BEGIN
tea_overload.get_teaduty('060001');
tea_overload.get_teaduty('����ΰ', '130225197110048213');
END;
/

��43����ѯ��tea_package�Ļ����ṹ��
DESC tea_package;

��44����ѯ��tea_package��Դ���롣
SELECT text FROM user_source WHERE name = 'TEA_PACKAGE';

��45����paper���ϴ���һ����伶�󴥷���������paper��ִ��INSERT����ʱ��ִ�д�������
CREATE OR REPLACE TRIGGER paper_insert
AFTER INSERT ON paper
BEGIN
DBMS_OUTPUT.PUT_LINE('��ִ���˲��������');
END paper_insert;
/

��46������һ����伶ǰ����������ֹ��3��1��֮ǰ�Գɼ��������ɾ�Ĳ����������3��1��֮ǰ�Գɼ���������κβ��������жϲ���������ʾ�û��������ڴ�ʱ��֮ǰ���в�����
CREATE OR REPLACE TRIGGER trigger_score
BEFORE INSERT OR UPDATE OR DELETE ON score
BEGIN
IF SYSDATE < '01-3�� -12' THEN
RAISE_APPLICATION_ERROR(-20500,'3��1��֮ǰ���ܶԳɼ���ִ����ɾ�Ĳ�����');
END IF;
END trigger_paper;
/

��47���Գɼ���ִ�и��²�������ǰ������2��29�գ����ִ�д������Ĳ�����
UPDATE score SET s_finalgrade = 70
WHERE s_id = '0807070301' AND c_num = '060151';

��48����paper_author����һ����伶�Լ��м���DELETE���������Ƚ���ִ�н����
CREATE OR REPLACE TRIGGER tg_delete             --������伶������
AFTER DELETE ON paper_author
--FOR EACH ROW
BEGIN
DBMS_OUTPUT.PUT_LINE('��ִ����ɾ��������');
END tg_delete;
/
DELETE FROM paper_author WHERE paper_id = 1;
CREATE OR REPLACE TRIGGER tg_delete             --�����м�������
AFTER DELETE ON paper_author
FOR EACH ROW
BEGIN
DBMS_OUTPUT.PUT_LINE('��ִ����ɾ��������');
END tg_delete;
/
DELETE FROM paper_author WHERE paper_id = 1;

��49������46������չ���������ݽ�����ɾ�ĵ�ʱ�����ϸ����
CREATE OR REPLACE TRIGGER trigger_score
BEFORE INSERT OR UPDATE OR DELETE ON score
BEGIN
IF SYSDATE < '01-3�� -12' AND INSERTING THEN
RAISE_APPLICATION_ERROR(-20501,'3��1��֮ǰ���ܶԳɼ���ִ�в��������');
ELSIF SYSDATE < '15-3�� -12' AND UPDATING THEN
RAISE_APPLICATION_ERROR(-20502,'3��15��֮ǰ���ܶԳɼ���ִ�и��²�����');
ELSIF SYSDATE < '01-4�� -12' AND DELETING THEN
RAISE_APPLICATION_ERROR(-20503,'4��1��֮ǰ���ܶԳɼ���ִ��ɾ��������');
END IF;
END trigger_paper;
/

��50��Ϊpaper����һ����伶�󴥷�������ִ�в������ʱ��ͳ�Ʋ�����������������ִ��ɾ������ʱ��ͳ��ɾ�����������·������ڡ�
CREATE OR REPLACE TRIGGER paper_ins_del
AFTER INSERT OR DELETE ON paper
DECLARE
v_count NUMBER;
v_time paper.paper_time%TYPE;
BEGIN
IF INSERTING THEN
SELECT COUNT(*) INTO v_count FROM paper;
DBMS_OUTPUT.PUT_LINE('��������Ϊ: '||v_count);
END IF;
IF DELETING THEN
SELECT MAX(paper_time) INTO v_time FROM paper;
DBMS_OUTPUT.PUT_LINE('�����������Ϊ: '||v_time);
END IF;
END paper_ins_del;
/

��51������һ�������������޸�paper������ĺ�ʱ��ͬʱ����paper_author������Ӧ�����ı�š�	
CREATE OR REPLACE TRIGGER tg_upd_paper
AFTER UPDATE OF paper_id ON paper
FOR EACH ROW
BEGIN
UPDATE paper_author SET paper_id = :new.paper_id
WHERE paper_id = :old.paper_id;
END tg_upd_paper;
/
UPDATE paper SET paper_id = 20 WHERE paper_id = 10;

��52������һ��������������UPDATE���������޸Ľ�ʦ��ְ��ʱ��ֻ���ϵ��Ϊ1�Ľ�ʦ�������¾�ְ�Ʊ�š�
CREATE OR REPLACE TRIGGER tg_upd_tea
AFTER UPDATE OF t_titleid  ON teacher
FOR EACH ROW
WHEN(old.t_departmentid=1)
BEGIN
DBMS_OUTPUT.PUT_LINE('��ʦ����Ϊ��'||:old.t_name);
DBMS_OUTPUT.PUT_LINE('��ʦ��ְ��Ϊ��'||:old.t_titleid);
DBMS_OUTPUT.PUT_LINE('��ʦ��ְ��Ϊ��'||:new.t_titleid);
END tg_upd_tea;
/
UPDATE teacher SET t_titleid = 1 WHERE t_id = '060001';

��53������һ����ʦ��������Ϣ����ͼpa_info��Ȼ������ͼ�в���һ����¼���в��ԡ�
CREATE OR REPLACE VIEW pa_info         --������ͼ
AS
SELECT t_id, paper_title, paper_sequence
FROM paper, paper_author
WHERE paper.paper_id = paper_author.paper_id
WITH CHECK OPTION;
INSERT INTO pa_info
VALUES('060001', '�ռ��Ŀ��ʶ�����ģ������ϵͳӦ���о�', 3);
CREATE OR REPLACE TRIGGER tg_view   --����������
INSTEAD OF INSERT ON pa_info
FOR EACH ROW
DECLARE
v_paperid paper.paper_id%TYPE;
BEGIN
SELECT paper_id INTO v_paperid FROM paper
WHERE paper_title=:new.paper_title;
INSERT INTO paper_author(paper_id, t_id, paper_sequence)
VALUES(v_paperid, :new.t_id, :new.paper_sequence);
END tg_view;
/
SELECT * FROM paper_author WHERE t_id = '060001';
INSERT INTO pa_info
VALUES('060001', '�ռ��Ŀ��ʶ�����ģ������ϵͳӦ���о�', 3);
SELECT * FROM paper_author WHERE t_id = '060001';

��54����ÿ���û��ĵ�¼��Ϣд�뵽log_user_connection���У��Լ�¼��¼�û��Լ���¼ʱ�䡣
CREATE TABLE log_user_connection  --������log_user_connection
(user_name VARCHAR2(20), login_time DATE);
CREATE OR REPLACE TRIGGER log_user_connection
AFTER LOGON ON DATABASE
BEGIN
INSERT INTO learner.log_user_connection VALUES(user, SYSDATE);
COMMIT;
END log_user_connection;
/
conn scott/tiger
SELECT * FROM log_user_connection;

��55�����ô�����tg_view��Ȼ���������д�������
ALTER TRIGGER tg_upd_tea DISABLE;
ALTER TRIGGER  teacher ENABLE ALL TRIGGERS;

��56��ɾ��������log_user_connection��
DROP TRIGGER log_user_connection;

��57���鿴������tg_view��Դ�롣
SELECT text FROM user_source WHERE name = 'TG_VIEW';




