��1��ֻʹ��SELECT�Ӿ�����ȡ��ǰ��������ʱ�䡣
SELECT SYSDATE;

��2����ѯѧ�����������е���Ϣ��
SELECT * FROM diploma;
 
��3���ӽ�ʦ���в�ѯ��ʦ��š���ʦ��������ְʱ�䡢ְ����о�����
SELECT t_id, t_name, t_entertime, t_duty, t_research FROM teacher; 

��4����ѧ�����в�ѯѧ����ְ����������ϵ�ֵΪ��ֵ������ʾ��û��ְ�񡱡�
SELECT s_id, s_name, s_classname, NVL(s_duty, 'û��ְ��') FROM student;

��5����ѧ�����в�ѯѧ����ѧ�ţ���ͨ���������ʽ�������ѧ�������ġ��������ѧ���ܳɼ���
SELECT s_id, s_name, s_classname, s_chinese+ s_math + s_foreign FROM student;

��6����ѧ�����в�ѯѧ����ѧ�ź�����������ѧ�ź�������ǰ��ֱ�����ַ�������ѧ��ѧ�š��͡�ѧ����������
SELECT 'ѧ��ѧ���ǣ�' || s_id ѧ��,'ѧ�������ǣ�' ||s_name ���� FROM student;

��7���ӽ�ʦ�в�ѯ��t_id��t_name��t_research�����ֱ�Ϊ��3�������������ʦ��š�������ʦ�������͡��о����򡱡�
SELECT t_id ��ʦ���, t_name ��ʦ����, t_research �о����� FROM teacher; 

��8��ʹ��AS�ؼ���Ϊ��7�е�3�����������Ч������7��ͬ��
SELECT t_id AS ��ʦ���, t_name AS ��ʦ����, t_research AS �о�����FROM teacher;

��9��ʹ��AS�ؼ���Ϊt_id�к�t_name���������������Ӣ�ĵ�������Ұ����ո񣬴�ʱ����ʹ��˫���š�
SELECT t_id AS "Id of teacher", t_name AS "Name of teacher" FROM teacher; 

��10����ѯרҵ�ǡ������ѧ�빤�̡��Ľ�ʦ�ı�š��������о�����ͱ�ҵѧУ��
SELECT t_id, t_name, t_research, t_university FROM teacher
WHERE t_specialty = '�����ѧ�빤��';

��11����ѯ2006��1��1��֮����ְ�Ľ�ʦ�ı�ź�������
SELECT t_id, t_name, t_research FROM teacher WHERE t_entertime > '2006-1-1';

��12���޸ĻỰ�����ڸ�ʽ��Ȼ���ѯ2006��1��1��֮����ְ�Ľ�ʦ�ı�ź�������
ALTER SESSION SET NLS_LANGUAGE = 'AMERICAN';
SELECT t_id, t_name,t_research FROM teacher WHERE t_entertime>'01-Jan-2006'; 

��13�����ݿγ̵�Ӣ��������ѯ�γ̵��������ơ�ѧ�֡����˷�ʽ���Ͽΰ༶��
SELECT c_name, c_credits, c_assway, c_class FROM course
WHERE c_ename = 'SPECIAL ENGLISH'; 

��14����ѯ�ڿ����������ڿ����а�����INFORMATION�����ڿ���
SELECT * FROM journal WHERE journal_name LIKE UPPER('%information%');

��15����ѯѧ������Ӣ��ɼ���120�ֵ�130��֮���ѧ����Ϣ��
SELECT s_id, s_name, s_nation, s_political, s_classname FROM student
WHERE s_foreign BETWEEN 120 AND 130;

��16����ѯ��ְʱ����2003��4��1�յ�2003��4��30��֮��Ľ�ʦ�������Ϣ��
SELECT t_id, t_name, t_entertime, t_research FROM teacher
WHERE t_entertime BETWEEN '1-4��-2003' AND '30-4��-2003';

��17����ѯרҵΪ�������Ӧ�á��򡰼����ϵͳ�ṹ���Ľ�ʦ��š��������о�����
SELECT t_id, t_name, t_research FROM teacher
WHERE t_specialty IN ('�����Ӧ��', '�����ϵͳ�ṹ');

��18����ѯְ��Ϊ����֧�顱�򡰰೤����ѧ����ѧ�š�������������ò�Ͱ༶��
SELECT s_id, s_name, s_political, s_classname FROM student
WHERE s_duty IN ('��֧��', '�೤');

��19����ѯְ���ǡ���֧�顱�򡰰೤�� ��ѧ����ѧ�š�������������ò�Ͱ༶��
SELECT s_id, s_name, s_political, s_classname FROM student
WHERE s_duty NOT IN ('��֧��', '�೤');
SELECT s_id, s_name, s_political, s_classname FROM student
WHERE s_duty IS NOT NULL;

��20����ѯ��ҵѧУ�ǡ��������´�ѧ����רҵ�ǡ������Ӧ�á��ͱ�ҵѧУ�ǡ����пƼ���ѧ����רҵ�ǡ��������ѧ�뼼�����Ľ�ʦ�ı�š���������ҵѧУ��רҵ��
SELECT t_id, t_name, t_university, t_specialty FROM teacher
WHERE (t_university, t_specialty)
IN (('�������´�ѧ', '�����Ӧ��'), ('���пƼ���ѧ', '�������ѧ�뼼��'));

��21����ѯ�о���������������ھ򡱵Ľ�ʦ�ı�š��������о�����
SELECT t_id, t_name, t_research FROM teacher
WHERE t_research LIKE '%�����ھ�%';

��22����ѯ������òΪ����Ա����Ԥ����Ա����ѧ����ѧ�š�������������ò�Ͱ༶��
SELECT s_id, s_name, s_political, s_classname FROM student
WHERE s_political LIKE '%��Ա';

��23����ѯ��Ϊ����������������Ϊ2���ֵ�ѧ����ѧ�š������Ͱ༶��
SELECT s_id, s_name, s_classname FROM student WHERE s_name LIKE '��_';

��24����ѯ2003����ְ�����н�ʦ�ı�š���������ְʱ����о�����
SELECT t_id, t_name, t_entertime, t_research FROM teacher
WHERE t_entertime LIKE '%2003%';

��25����ѯ2003��4����ְ�����н�ʦ�ı�š���������ְʱ����о�����
SELECT t_id, t_name, t_entertime, t_research FROM teacher
WHERE TO_CHAR(t_entertime, 'yyyy-mm-dd') LIKE '%2003-04%';

��26����ѯ����������òΪ��Ա��ѧ����ѧ�š�������������ò�����ڰ༶��
SELECT s_id, s_name, s_political, s_classname FROM student
WHERE s_political LIKE '��Ա';

��27����ѯû�вμ���ĩ���Ե�ѧ����ѧ�źͿγ̺š�
SELECT s_id, c_num FROM score WHERE s_finalgrade IS NULL; 

��28����ѯ����ְ���ѧ����ѧ�š�������ְ��
SELECT s_id, s_name, s_duty FROM student WHERE s_duty IS NOT NULL;

��29����ѯ����Ϊ��ѧ�ƻ�������ѧ�ִ���3��Ϊ���Źܡ�רҵ�����Ŀγ̵���Ϣ��
SELECT c_num, c_name, c_type, c_nature FROM course
WHERE c_type = 'ѧ�ƻ���' AND c_credits >=3 AND C_CLASS LIKE '%�Ź�%';

��30����ѯ�о������롰���ݿ⡱���˹����ܡ���صĽ�ʦ�ı�ź�������
SELECT t_id, t_name, t_research FROM teacher
WHERE t_research LIKE '%���ݿ�%' OR t_research LIKE '%�˹�����%';

��31����ѯ����Ϊ"Ӣ��"�ҳɼ�����130�ֻ�����Ϊ"����"�ҳɼ�����120�ֵ�ѧ����ѧ�ź�������
SELECT s_id, s_name, s_language, s_classname FROM student
WHERE (s_language = 'Ӣ��' AND s_foreign > 130)
OR (s_language = '����' AND s_foreign > 120);

��32����ѯ�γ̱��н�ʦ�ı�ţ�Ҳ���ǿ��˿γ̵Ľ�ʦ�ı�ţ���
SELECT t_id FROM course; 

��33����ѯ�γ̱��п��ν�ʦ�ı�ż������ڵĿγ�����
SELECT DISTINCT t_id, c_name FROM course;

��34����ѯ��ʾ����ѧ��ְ���ֵ����Щ��
SELECT DISTINCT s_duty FROM student;

��35�����տγ����Կγ̱���з��顣
SELECT c_type FROM course GROUP BY c_type; 

��36����ѯѧ������ѧ�����ĳɼ���ƽ��ֵ��
SELECT AVG(s_chinese) FROM student; 

��37�����հ༶�����ѯѧ������ѧ�����ĳɼ���ƽ��ֵ��
SELECT AVG(s_chinese), s_classname FROM student
GROUP BY s_classname;

��38�����տγ��������ѯ�γ̱���ÿ�����͵Ŀγ̵��ܿ�ʱ����
SELECT SUM(c_thours), c_type FROM course GROUP BY c_type; 

��39��ͳ��ѧ�����е���ѧ�����͵���ְ���ѧ������
SELECT COUNT(*), COUNT(1), COUNT(s_duty) FROM student;

��40����ѯ�ɼ����е�ѧ��Ϊ0807070303��ѧ����ĩ�ɼ���ƽ��ֵ��
SELECT s_id, s_finalgrade FROM score WHERE s_id = '0807070303';

��41���ֱ��ѯ��ʦ���е�������������ְʱ�䡣
SELECT MIN(t_entertime), MAX(t_entertime) FROM teacher;

��42����ѯ�γ̱��п��ν�ʦ��������
SELECT COUNT(DISTINCT t_id), COUNT(t_id) FROM course;

��43�����ݿγ̵����ͺͿ��˷�ʽ�Կγ���Ϣ���з��ࡣ
SELECT c_type, c_assway FROM course GROUP BY c_type, c_assway;

��44����ѯѧ��������ߵİ༶����ƽ���ɼ���
SELECT MAX(AVG(s_foreign)) FROM student GROUP BY s_classname;

��45�����հ༶�����ѯѧ������ѧ�����ĵ�ƽ���ɼ�����108�ֵİ༶��
SELECT AVG(s_chinese), s_classname FROM student
GROUP BY s_classname
HAVING AVG(s_chinese) > 108;

��46������Ź�רҵ���༶����ѧ��ƽ���ɼ���
SELECT AVG(s_math) FROM student
GROUP BY s_classname HAVING s_classname LIKE '%�Ź�%';
SELECT AVG(s_math) FROM student
WHERE s_classname LIKE '%�Ź�%' GROUP BY s_classname;

��47����ѯ��ʦ���еĽ�ʦ��š���������ְʱ����о����򣬲����ս�ʦ����ְʱ��������ķ�ʽ����
SELECT t_id,t_name,t_entertime,t_research FROM teacher
ORDER BY t_entertime;

��48����ѯѧ�����е�ѧ����š���������������ܳɼ������ڰ༶����������������ܳɼ��Խ���ķ�ʽ����
SELECT s_id, s_name, s_chinese+s_foreign+s_math, s_classname FROM student
ORDER BY s_chinese + s_foreign + s_math DESC;

��49����ѯѧ�����е�ѧ����š���������������ܳɼ������ڰ༶����������������ܳɼ��Խ���ķ�ʽ����
SELECT s_id, s_name, s_chinese + s_foreign + s_math, s_classname FROM student 
ORDER BY 3 DESC;

��50����ѯѧ�����е�ѧ����š����������ڰ༶������������ɼ��Խ���ķ�ʽ����
SELECT s_id, s_name, s_classname FROM student ORDER BY 10 DESC;

��51����ѯѧ�����е�ѧ����š�����������ɼ�����ѧ�ɼ�������������ɼ�������ѧ�ɼ�����ķ�ʽ����
SELECT s_id, s_name, s_foreign, s_math FROM student ORDER BY 3 DESC,4 ASC;

��52������50�е����10ȥ������Ϊ�����Ϳ�����ȷ��ѯ����Ҫ�����ݡ�
SELECT s_id, s_name, s_classname FROM student ORDER BY s_foreign DESC;

��53����ѯѧ��Ϊ��0807070303����ѧ����2010-2011(1)ѧ�ڵ���ĩ���Գɼ����ɼ���������ķ�ʽ���С�
SELECT s_finalgrade FROM score
WHERE s_id = '0807070303' AND c_term = '2010-2011(1)'
ORDER BY s_finalgrade;

��54����ѯ���н�ʦ�ı�š��������о����򣬲�������������
SELECT t_id, t_name, t_research FROM teacher ORDER BY t_name;

��55����ѯ���н�ʦ�ı�š�������ѧ����
SELECT t_id, t_name, t_research, diploma_name
FROM teacher, diploma
WHERE teacher.t_diplomaid = diploma.diploma_id;

��56����ѯ����רҵΪ�������Ӧ�á��򡰼����ϵͳ�ṹ���Ľ�ʦ��ѧ������Ϣ��
SELECT t_id, t_name, t_research, diploma_name
FROM teacher, diploma
WHERE teacher.t_diplomaid = diploma.diploma_id AND
(teacher.t_specialty='�����Ӧ��' OR teacher.t_specialty='�����ϵͳ�ṹ');

��57����ѯ���л񽱽�ʦ�ı�š������ͻ񽱵����Ƽ������������ս�ʦ��źͻ���������
SELECT teacher.t_id, t_name, award_name,'������' || award_sequence AS ����
FROM award, award_author, teacher
WHERE award.award_id = award_author.award_id AND
award_author.t_id = teacher.t_id ORDER BY t_id, award_sequence;

��58��ʹ��USING�Ӿ�Խ�ʦ��Ϳγ̱��������ӣ���ѯ��ѯ��ʦ���εĿγ�������Ϣ��
SELECT t_id, t_name, t_specialty, c_name  --t_idǰ����ʹ�ñ����������п���
FROM course JOIN teacher USING(t_id);

��59����ѯ���н�ʦ���ڿ���Ϣ�����ظ���ʾͬһ����ʦ��������ͬ���ƵĿγ̣�������û�п��εĽ�ʦ��Ϣ��
SELECT DISTINCT teacher.t_id, t_name, c_name
FROM teacher, course
WHERE teacher.t_id = course.t_id(+)
ORDER BY t_id;

��60����ѯ�ڿ��������е��ڿ����Ƽ������ڸ��ڿ��ϵ�������Ϣ��
SELECT journal_name, journal_level AS jlevel, paper_title
FROM paper p, journal j
WHERE p.paper_journal(+) = j.journal_name
ORDER BY jlevel;

��61����ѯ��ʦ�����������Ϣ������Ƿ�����ѧУ�涨�ĺ����ڿ��ϣ�����ʾ�����ڿ������ȼ���������Ŀ������ֻ��ʾ������Ŀ��
SELECT journal_name, journal_level AS jlevel, paper_title
FROM paper p, journal j
WHERE j.journal_name(+) = p.paper_journal
UNION
SELECT journal_name, journal_level, paper_title
FROM paper p, journal j
WHERE j.journal_name = p.paper_journal(+)
ORDER BY jlevel;

��62���Խ�ʦ��Ϳγ̱�����Ȼ���ӣ���ѯ��ʦ���εĿγ�������Ϣ��
SELECT t_id, t_name, t_specialty, c_name
FROM teacher NATURAL JOIN course;

��63����ѯ��ʦ��Ϳγ̱�Ľ�ʦ���Ϳγ�����
SELECT t_name, t_duty, t_research, c_name, c_type, c_nature
FROM teacher, course;

��64����ѯ�͡������¡�������ְͬ�ƵĽ�ʦ�ı�ź�������
SELECT t1.t_id, t1.t_name, t1.t_duty, t1.t_research, t.title_name
FROM teacher t1, teacher t2, title t
WHERE t1.t_titleid = t2.t_titleid AND t2.t_name = '������'
AND  t1.t_titleid = t.title_id;

��65����ѯѧ��Ϊ��0807070315����ѧ�����ڰ༶�İ೤��ѧ�ź�������
SELECT s1.s_id, s1.s_name, s2.s_id, s2.s_name
FROM student s1, student s2
WHERE s1.s_classname = s2.s_classname AND
s1.s_id = '0807070315' AND s2.s_duty = '�೤';

��66��ʹ�ñ�׼��SQL�﷨��д��64��
SELECT t1.t_id, t1.t_name, t1.t_duty, t1.t_research, t.title_name
FROM teacher t1 JOIN teacher t2
ON t1.t_titleid = t2.t_titleid JOIN title t
ON t1.t_titleid = t.title_id AND t2.t_name = '������';

��67����SELECT�Ӿ���ʹ���Ӳ�ѯ��ͳ�ƽ�ʦ��ѧ����������
SELECT (SELECT COUNT(*) FROM teacher) AS ��ʦ����,
(SELECT COUNT(*) FROM student) AS ѧ������ FROM dual;

��68����INSERT�Ӿ���ʹ���Ӳ�ѯ�������SQL��䴴��һ���±�test��Ȼ���򽫽�ʦ���еļ�¼ȫ�����뵽test���С�
CREATE TABLE test(id NUMBER, name VARCHAR2(20));
INSERT INTO test SELECT t_id, t_name FROM teacher;

��69����UPDATE�Ӿ���ʹ���Ӳ�ѯ�������SQL��佫ѧ��Ϊ��0807070115����ѧ��������ɼ��޸�Ϊ����ѧ������ɼ���ƽ��ֵ��
UPDATE student SET s_foreign = (SELECT AVG(s_foreign) FROM student)
WHERE s_id = '0807070115';

��70����DELETE�Ӿ���ʹ���Ӳ�ѯ�������SQL���ɾ����ʦ����û�п��εĽ�ʦ����Ϣ��
DELETE FROM student WHERE s_id IN
(SELECT s_id FROM student WHERE s_duty = 'ѧϰίԱ');

��71����ѯ�ڡ�����ΰ����ְ֮����ְ�Ľ�ʦ�ı�š��������о�����
SELECT t_id, t_name, t_research FROM teacher WHERE t_entertime >
(SELECT t_entertime FROM teacher WHERE t_name='����ΰ');

��72����ѯ��ѧ��Ϊ��0807070105����ѧ������ͬ�༶��������ò��ͬ��ѧ����ѧ�š��������༶��������ò��
SELECT s_name, s_classname, s_political FROM student
WHERE (s_classname, s_political) =
(SELECT s_classname, s_political FROM student
WHERE s_id = '0807070105');

��73����ѯ����ɼ����ڵ���130�ֵ�ѧ�����ڰ༶�೤��ѧ�š����������ڰ༶��
SELECT s_id, s_name, s_classname  FROM student
WHERE s_classname IN (
SELECT DISTINCT s_classname FROM student
WHERE s_foreign >= 130)  AND s_duty = '�೤';

��74����óרҵ08��ѧ����ֻҪ��ɼ�����08�����κ�һ���༶����ѧƽ���֣��ͽ�����Ϣ��ѯ������
SELECT s_id, s_name, s_classname, s_math FROM student
WHERE s_math > ANY (SELECT AVG(s_math) FROM student
WHERE s_classname LIKE '%08%' GROUP BY s_classname)
AND s_classname LIKE '%��ó08%';

��75����ѯ��óרҵ08��ѧ���ɼ���������08����רҵ�༶��ѧƽ���ֵ�ѧ������Ϣ��
SELECT s_id, s_name, s_classname, s_math FROM student
WHERE s_math > ALL (SELECT AVG(s_math) FROM student
WHERE s_classname LIKE '%08%' GROUP BY s_classname)
AND s_classname LIKE '%��ó08%';

��76����ѯѧ��Ϊ��0807070301����ѧ��ѡ�޵Ŀγ̵���Ϣ��
SELECT c_term, c_num, c_seq, c_name FROM course
WHERE (c_term, c_num, c_seq) IN (SELECT c_term, c_num, c_seq FROM score
WHERE s_id = '0807070301');

��77����ѯÿ���༶�бȱ�������ɼ�ƽ���ָߵ�ѧ����ѧ�š�����ɼ��Ͱ༶��
SQL> SELECT s_id, s_name, s_foreign, s_classname FROM student s1
  2  WHERE s_foreign >(SELECT AVG(s_foreign) FROM student s2
  3                        WHERE s1.s_classname = s2.s_classname);

��78����ѯû�п��ν�ʦ�ı�ŵ���Ϣ��
SELECT t_id, t_name, t_duty, t_research FROM teacher WHERE NOT EXISTS
(SELECT c_num, c_seq, c_name FROM course WHERE course.t_id = teacher.t_id);

��79����д��78�����Ӳ�ѯ��SELECT�Ӿ���ʹ�ó�����
SELECT t_id, t_name, t_duty, t_research FROM teacher
WHERE NOT EXISTS (SELECT 1 FROM course WHERE course.t_id = teacher.t_id);

��80����ѯ�ڡ�����A�������ڿ��Ϸ������ĵĽ�ʦ����Ϣ��
SELECT t_id, t_name, t_duty, t_research FROM teacher WHERE EXISTS
(SELECT * FROM journal, paper, paper_author WHERE journal.journal_name
= paper.paper_journal AND journal_level = '����A' AND paper_author.paper_id
= paper.paper_id AND paper_author.t_id = teacher.t_id);

��81��ʹ��NOT IN���������78��
SELECT t_id, t_name, t_duty, t_research FROM teacher
WHERE t_id NOT IN (SELECT t_id FROM course);

��82��ʹ��IN���������80��Ϊ����Ĳ�ѯ��䣺
SELECT t_id, t_name, t_duty, t_research FROM teacher WHERE t_id IN
(SELECT teacher.t_id FROM journal, paper, paper_author
WHERE journal.journal_name = paper.paper_journal
AND journal_level = '����A' AND paper_author.paper_id = paper.paper_id
AND paper_author.t_id = teacher.t_id);

��83����ѯ��ó081������ɼ�����120���Լ�����083������ɼ�����130�ֵ�ѧ����Ϣ��
SELECT s_id, s_name, s_classname, s_language, s_foreign FROM student
WHERE s_classname = '��ó081' AND s_foreign >= 120
UNION
SELECT s_id, s_name, s_classname, s_language, s_foreign FROM student
WHERE s_classname = '����083' AND s_foreign >= 130;

��84��ʹ��UNION�������ѯ����083�����ĳɼ�����120�ֻ�����ɼ�����130�ֵ�ѧ����Ϣ��
SELECT s_id, s_name, s_classname, s_language, s_chinese, s_foreign
FROM student WHERE s_classname = '����083' AND s_chinese >= 120
UNION
SELECT s_id, s_name, s_classname, s_language, s_chinese, s_foreign
FROM student WHERE s_classname = '����083' AND s_foreign >= 130;

��85��ʹ��UNION ALL�������ѯ����083�����ĳɼ�����120�ֻ�����ɼ�����130�ֵ�ѧ����Ϣ��
SELECT s_id, s_name, s_classname, s_language, s_chinese, s_foreign
FROM student WHERE s_classname = '����083' AND s_chinese >= 120
UNION ALL
SELECT s_id, s_name, s_classname, s_language, s_chinese, s_foreign
FROM student WHERE s_classname = '����083' AND s_foreign >= 130;

��86��ʹ��UNION�������ѯΪ����081���ϿεĽ�ʦ��������Щ��ʦ����081��ѧ������Ϣ����һ�������
SELECT s_id id, s_name name, s_gender gender
FROM student WHERE s_classname = '����081'
UNION
SELECT t_id, t_name, t_gender FROM teacher WHERE EXISTS
(SELECT 1 FROM course
WHERE teacher.t_id = course.t_id AND course.c_class LIKE '%����081%')
ORDER BY id;

��87��ʹ��INTERSECT�������ѯ����083�����ĳɼ�����120��������ɼ�����130�ֵ�ѧ����Ϣ��
SELECT s_id, s_name, s_classname, s_language, s_chinese, s_foreign
FROM student WHERE s_classname = '����083' AND s_chinese >= 120
INTERSECT
SELECT s_id, s_name, s_classname, s_language, s_chinese, s_foreign
FROM student WHERE s_classname = '����083' AND s_foreign >= 130;

��88��ʹ��MINUS�����ʵ����84�Ĳ�ѯ���ܡ�
SELECT s_id, s_name, s_classname, s_language, s_chinese, s_foreign
FROM student WHERE s_classname = '����083' AND s_chinese >= 120
MINUS
SELECT s_id, s_name, s_classname, s_language, s_chinese, s_foreign
FROM student WHERE s_classname = '����083' AND s_foreign <= 130;



