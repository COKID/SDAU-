��1��ʹ������Ĳ�ѯ����ȡ���ݿ�ʵ����ǰʹ�õĲ����ļ������ͺ�λ�á�
SELECT value, DECODE(value, NULL, 'PFILE', 'SPFILE') "�ļ�����"
FROM v$parameter WHERE name = 'spfile';

��2��ʹ��SHOW�����ȡspfile�����ļ���λ����Ϣ��
SHOW PARAMETER spfile

��3��ʹ�ø���������ͼ��ȡ������Ϣ��
SELECT name, value FROM v$parameter WHERE name = 'nls_length_semantics'; 
SELECT name, value FROM v$system_parameter WHERE name='nls_length_semantics';
ALTER SESSION SET nls_length_semantics = 'CHAR';
SELECT name, value FROM v$parameter WHERE name = 'nls_length_semantics'; 
SELECT name, value FROM v$system_parameter WHERE name='nls_length_semantics';
ALTER SYSTEM SET nls_length_semantics = 'CHAR';
SELECT name, value FROM v$system_parameter WHERE name='nls_length_semantics';
SHUTDOWN IMMEDIATE
STARTUP
SELECT name, value FROM v$parameter WHERE name = 'nls_length_semantics'; 
SELECT name, value FROM v$system_parameter WHERE name='nls_length_semantics';

��4����ѯ��ʱ������ǿ��������Ϣ��
SELECT kspponm, DECODE(ksppoflg,  1, 'Obsolete',  2,  'Underscored') 
FROM x$ksppo;

��5�����������������ļ�����ͨ�����ļ���
CREATE PFILE FROM SPFILE;                   
CREATE PFILE='F:\init.ora' FROM MEMORY;        
CREATE SPFILE='F:\spfile.ora' FROM PFILE='F:\init.ora';
CREATE SPFILE='F:\spfile.ora' FROM MEMORY; 

��6���鿴����ʶΪDEFERRED�ĳ�ʼ��������
SELECT name, value FROM v$parameter WHERE issys_modifiable='DEFERRED';

��7��ʹ��ALTER SYSTEM SET�����ʵ�������޸Ĳ�����
ALTER SYSTEM SET sort_area_size=52428800 scope = spfile;
ALTER SYSTEM SET sort_area_size=52428800;

��8��ʹ��ALTER SESSION SET����ڻỰ�����޸Ĳ�����
ALTER SESSION SET recyclebin = off;

��9��ʹ��STARTUP �����������ݿ⡣
SHUTDOWN IMMEDIATE                                          
STARTUP  

��10����STARTUP������ʹ��ָ���Ĳ����ļ��������������ݿ�ʵ����
STARTUP NOMOUNT PFILE=F:\init.ora         
SHUTDOWN IMMEDIATE 
STARTUP NOMOUNT PFILE=F:\spfile.ora 

��11����STARTUP������ָ����ͨ�����ļ���
STARTUP NOMOUNT PFILE=F:\init.ora

��12��ʹ��ALTER DATABASE�л����ݿ������״̬��
SHUTDOWN IMMEDIATE                                                                   
STARTUP NOMOUNT                   
SELECT status FROM v$instance;    
SELECT open_mode FROM v$database; 
SELECT * FROM user_users;         
ALTER DATABASE MOUNT;             
SELECT open_mode FROM v$database; 
SELECT username FROM user_users;  
ALTER DATABASE OPEN;
SELECT username FROM user_users;

��13�������ݿ�����Ϊ����״̬��
conn scott/tiger
SHUTDOWN IMMEDIATE                   
STARTUP RESTRICT                     
conn scott/tiger                     
conn / as sysdba
GRANT RESTRICTED SESSION TO scott;  
conn scott/tiger

��15�������ݿ�����Ϊֻ��״̬��
SQL> SHUTDOWN IMMEDIATE                                           
SQL> STARTUP NOMOUNT                                                                                  
SQL> ALTER DATABASE MOUNT;
SQL> ALTER DATABASE OPEN READ ONLY;                       
SQL> conn learner/learner123
SQL> UPDATE teacher SET t_gender = '��';

��16���������ݿ�ľ�Ĭ״̬��Ǿ�Ĭ״̬��
--��SQL*Plus�ͻ��ˣ��Ự1��
conn / as sysdba;
ALTER SYSTEM QUIESCE RESTRICTED;
SELECT status, active_state FROM v$instance;
ALTER SYSTEM UNQUIESCE;
--����һ��SQL*Plus�ͻ��ˣ��Ự2��
conn learner/learner123;
UPDATE teacher SET t_name = 'aa'; 
ROLLBACK;
UPDATE teacher SET t_name = 'aa';
--����һ��SQL*Plus�ͻ��ˣ��Ự3��
conn scott/tiger

��17���������ݿ�Ĺ���״̬��ǹ���״̬��
--��SQL*Plus�ͻ��ˣ��Ự1��
SQL> conn / as sysdba;
SQL> ALTER SYSTEM SUSPEND;
SQL> SELECT status, database_status FROM v$instance;
SQL> ALTER SYSTEM RESUME;
--����һ��SQL*Plus�ͻ��ˣ��Ự2��
SQL> conn learner/learner123;
SQL> UPDATE teacher SET t_name = 'aa'; 
SQL> ROLLBACK;
SQL> UPDATE teacher SET t_name = 'aa';
SQL> ROLLBACK;


��18��ʹ��SHUTDOWN�������ݿ�Ĺرա�
--��SQL*Plus�ͻ��ˣ��Ự1��
conn / as sysdba;
SHUTDOWN TRANSACTIONAL;
STARTUP;
SHUTDOWN IMMEDIATE;
--����һ��SQL*Plus�ͻ��ˣ��Ự2��
conn learner/learner123;
UPDATE teacher SET t_name = 'aa';
ROLLBACK;
UPDATE teacher SET t_name = 'aa';


