��1����scott�û�����ݷ���learnerģʽ�Ľ�ʦ��
conn scott/tiger                                                    
SELECT t_id, t_name, t_research FROM learner.teacher;        
conn learner/learner123
GRANT SELECT ON teacher TO scott;       --���Խ�ʦ��Ĳ�ѯȨ�������û�scott
conn scott/tiger                                                    
SELECT t_id, t_name, t_research FROM learner.teacher;     
 
��2������2�����û�user1��user2��
conn scott/tiger                      
CREATE USER user1 IDENTIFIED BY 123;  
conn / as sysdba                      
CREATE USER user1 IDENTIFIED BY 123;
SELECT property_name, property_value FROM database_properties
WHERE property_name IN('DEFAULT_TEMP_TABLESPACE', 'DEFAULT_PERMANENT_TABLESPACE');
SELECT default_tablespace, temporary_tablespace FROM dba_users 
WHERE username = 'USER1';
CREATE TABLESPACE test DATAFILE 'test.dbf' SIZE 10M;     
CREATE TEMPORARY TABLESPACE test_temp TEMPFILE 'test_temp.dbf' SIZE 10M; 
CREATE USER user2 IDENTIFIED BY 123
DEFAULT TABLESPACE test TEMPORARY TABLESPACE test_temp
QUOTA UNLIMITED ON test;
SELECT default_tablespace, temporary_tablespace FROM dba_users 
SELECT username, tablespace_name, max_bytes 
FROM dba_ts_quotas WHERE USERNAME = 'USER1' OR USERNAME = 'USER2'; 

��3��Ϊ������ͨ���ݿ��û����в���ϵͳ��֤�����÷����Ͳ��衣����������ϵͳ���û���Ϊuser_os��
CREATE USER "WWW-19B4B6E899F\USER_OS" IDENTIFIED EXTERNALLY; 
GRANT CREATE SESSION TO "WWW-19B4B6E899F\USER_OS";    
SELECT username, password, account_status FROM dba_users 
WHERE username LIKE '%USER_OS%';     
SHOW PARAMETER os_authent_prefix
ALTER SYSTEM SET os_authent_prefix = '' SCOPE=SPFILE;   
SHUTDOWN IMMEDIATE                                           
STARTUP
C:\Users\user_os.WWW-19B4B6E899F>sqlplus /

��4��ΪԶ����ͨ���ݿ��û����в���ϵͳ��֤�����÷����Ͳ��衣����Զ�̲���ϵͳ���û���Ϊuser_os1��
SQL> CREATE USER user_os1 IDENTIFIED EXTERNALLY; 
SQL> GRANT CREATE SESSION TO user_os1;     
SQL> SELECT username, password, account_status FROM dba_users WHERE username = 'USER_OS1';
SQL> SHOW PARAMETER remote_os_authent
SQL> ALTER SYSTEM SET remote_os_authent = true SCOPE=SPFILE;
SQL> SHUTDOWN IMMEDIATE
SQL> STARTUP
C:\Documents and Settings\user_os1>sqlplus /@192.168.1.66/orcl

��5�����ò���ϵͳ��֤�����ÿ�����֤��ʽ����Ȩ�û����кϷ�����֤�����÷����Ͳ��衣
C:\Users\Administrator>sqlplus / as sysdba       
C:\Users\Administrator>sqlplus sys/linDB123 as sysdba 

��6����2�������������ã�ʹֻ��SYS�û����ܵ�¼��ֻ��ʹ�ÿ�����֤��ʽ��¼��
ALTER SYSTEM SET remote_login_passwordfile = shared SCOPE = SPFILE;
conn sys/linDB123 as sysdba
STARTUP
SHOW PARAMETER remote_login_passwordfile
GRANT sysdba TO scott;     
SELECT username, sysdba, sysoper FROM v$pwfile_users;
conn user1/123 as sysdba
ALTER USER user1 IDENTIFIED BY 1;

��7��ʹ��ALTER USER����޸��û�user1��
conn / as sysdba
ALTER USER user1 ACCOUNT LOCK;    
conn user1/123                    
conn / as sysdba
ALTER USER user1 PASSWORD EXPIRE ACCOUNT UNLOCK;   
conn user1/123
conn / as sysdba
ALTER USER user1 DEFAULT TABLESPACE test;  
SELECT default_tablespace, temporary_tablespace FROM dba_users 
WHERE username = 'USER1';

��8�����û�user2�ڱ�ռ�test�ϵ�����������Ƹ�Ϊ5M��
ALTER USER user2 QUOTA 5M ON test;

��9��ɾ����ǰ�Ѿ���¼�����ݿ��е��û�user2��
DROP USER user2;              
SELECT sid, serial#, username FROM v$session WHERE username = 'USER2';
ALTER SYSTEM KILL SESSION '22, 17';
DROP USER user2;

��10���ֱ�ʹ��user_users��all_users��dba_users��ͼ��ѯ�û�����Ϣ��
SELECT USERNAME, USER_ID, ACCOUNT_STATUS, EXPIRY_DATE FROM user_users;           
SELECT * FROM all_users;                        
SELECT * FROM dba_users;
GRANT SELECT ANY DICTIONARY TO user1;  
SELECT * FROM dba_users;

��11��Ϊ���ݿ��е�ÿλ�û������贴����ɫ�ʹ�����ͼ��Ȩ�ޡ�
GRANT CREATE ROLE, CREATE VIEW TO PUBLIC;
SELECT * FROM dba_sys_privs WHERE grantee = 'PUBLIC';

��12������ѯ�κ�ģʽ�б��Ȩ�������û�user1����������Ȩ�޺����������û���
conn user1/123
SELECT t_id, t_name, t_research FROM learner.teacher;
conn / as sysdba
GRANT SELECT ANY TABLE TO user1 WITH ADMIN OPTION;
conn user1/123
SELECT t_id, t_name, t_research FROM learner.teacher;
GRANT SELECT ANY TABLE TO user2 WITH ADMIN OPTION;
conn user2/123
GRANT SELECT ANY TABLE TO user3; 

��13����������PUBLIC�û����CREATE ROLE��CREATE VIEW��ϵͳȨ�ޡ�
REVOKE CREATE ROLE, CREATE VIEW FROM PUBLIC;
SELECT * FROM dba_sys_privs WHERE grantee = 'PUBLIC';

��14������ֱ������ͼ�������Ȩ�ޡ�
conn user1/123
REVOKE SELECT ANY TABLE FROM user2;          
conn user3/123
SELECT t_id, t_name, t_research FROM learner.teacher;
conn user1/123
REVOKE SELECT ANY TABLE FROM user3;    
conn user3/123
SELECT t_id, t_name, t_research FROM learner.teacher;

��15��ʹ��user_sys_privs��dba_sys_privs��ͼ��ѯ�û���ϵͳȨ����Ϣ��
SELECT * FROM user_sys_privs;               
SELECT * FROM dba_sys_privs WHERE grantee = 'USER1' OR grantee = 'LEARNER';

��16��ʹ��session_privs��ͼ��ѯ��ǰ�û���ӵ�е�ȫ��ϵͳȨ�ޡ�
SELECT * FROM session_privs;

��17�����û�learner����ݵ�¼�����ݿ��У�Ϊ�û�user2�����ѯѧ����ɾ��ѧ����͸���t_id��t_name��t_research�еĶ���Ȩ�ޡ�
GRANT SELECT, UPDATE(t_id, t_name, t_research),DELETE ON learner.teacher TO user2;     

��18�������������û�user2��learnerģʽ��ѧ����Ĳ�ѯȨ�������û�user3��
conn user2/123
GRANT SELECT ON learner.student TO user3;
conn learner/learner123
GRANT SELECT ON learner.student TO user2 WITH GRANT OPTION;
conn user2/123
GRANT SELECT ON learner.student TO user3;

��19����PUBLIC�û��������ѯlearnerģʽ�µĿγ̱�Ķ���Ȩ�ޡ�
GRANT SELECT ON learner.course TO PUBLIC;

��20�����û�learner��¼���ݿ⣬��������PUBLIC�û���Ĳ�ѯlearnerģʽ�Ŀγ̱�Ķ���Ȩ�ޡ�
REVOKE SELECT ON learner.course FROM PUBLIC;
conn user3/123
SELECT * FROM learner.course;

��21�����û�learner��¼���ݿ⣬���������û�user2�ĸ���learnerģʽ�Ľ�ʦ��Ķ���Ȩ�ޡ�
REVOKE UPDATE ON learner.teacher FROM user2; 

��22��ʹ��user_tab_privs��dba_tab_privs��user_col_privs��ͼ�鿴����Ȩ�ޡ�
SELECT * FROM user_tab_privs;
SELECT * FROM dba_tab_privs WHERE grantee = 'PUBLIC' and grantor = 'LEARNER';
SELECT * FROM user_col_privs;

��23�����û�learner����ݵ�¼���ݿ⣬����3����ɫ���ֱ����ڹ���ѧ����Ϣ�ͽ�ʦ��Ϣ��
CREATE ROLE s_man1;          
CREATE ROLE s_man2;          
CREATE ROLE t_man IDENTIFIED BY tea;

����24������һ���ⲿ��ɫexter_role������DBA��ɫ����exter_role��
conn scott/tiger
SELECT * FROM user_role_privs;
ALTER SYSTEM SET os_roles = true SCOPE = SPFILE;
SHUTDOWN IMMEDIATE
STARTUP
CREATE ROLE exterrole IDENTIFIED EXTERNALLY;  
GRANT DBA TO exterrole WITH ADMIN OPTION;

��25��Ϊ��ɫs_man1����learnerģʽ��ѧ����Ĳ�ѯȨ�޺����κ�ģʽ�´�����ͼ��ɾ����ͼ��ϵͳȨ�ޡ�Ϊ��ɫs_man2����learnerģʽ��ѧ������롢���º�ɾ��Ȩ�ޣ�Ϊ��ɫt_man����learnerģʽ�Ľ�ʦ��Ĳ�ѯ�����롢���º�ɾ��Ȩ�ޡ�
GRANT SELECT ON learner.student TO s_man1;        
GRANT CREATE ANY VIEW, DROP ANY VIEW TO s_man1;  
GRANT INSERT, UPDATE, DELETE ON learner.student TO s_man2; 
GRANT SELECT, INSERT, UPDATE, DELETE ON learner.teacher TO t_man;

��26��Ϊ�û�user2����s_man1��ɫ��t_man��ɫ��Ȩ�ޡ�Ϊ��ɫt_man����s_man2��ɫ��Ȩ�ޣ�Ȼ���ٽ���ɫt_man�����û�user3��
GRANT s_man1, t_man TO user2;
GRANT s_man2 TO t_man;
GRANT t_man TO user3;

��27��ʹ��ALTER USERΪ�û�user2����Ĭ�Ͻ�ɫ��
ALTER USER user2 DEFAULT ROLE NONE;  
ALTER USER user2 DEFAULT ROLE ALL EXCEPT s_man1;  
ALTER USER user2 DEFAULT ROLE ALL;  
ALTER USER user2 DEFAULT ROLE s_man1;  
conn user2/123
DELETE FROM learner.student WHERE s_id = '0807070326';
ALTER USER user2 DEFAULT ROLE s_man1, s_man2;
conn user2/123
DELETE FROM learner.student WHERE s_id = '0807070326';

��28��ʹ��SET ROLE������ý��ý�ɫ��
GRANT t_man TO user2;      
conn user2/123
SELECT t_id, t_name, t_research, t_university FROM learner.teacher;
SET ROLE t_man;  
SET ROLE t_man IDENTIFIED BY tea;    
SELECT t_id, t_name, t_research, t_university FROM learner.teacher;
SET ROLE ALL;     
SET ROLE ALL EXCEPT t_man;       
SET ROLE NONE;                   
SET ROLE t_man identified by tea, s_man2;

��29�����������ɫ��Ȩ�ޡ�
REVOKE CREATE ANY VIEW, DROP ANY VIEW FROM s_man1; 
REVOKE INSERT, DELETE ON learner.student FROM s_man2;  

��30�����û�user3����t_man��ɫ��
REVOKE t_man FROM user3;

��31��ɾ����ɫs_man1��
DROP ROLE s_man1;

��32��ʹ�ø�����ͼ�˽��ɫ�����Ϣ��
SELECT * FROM user_role_privs;          
SELECT * FROM session_roles;       
SELECT * FROM role_role_privs;

��33������һ����Ҫ�ļ���Ҫ����û��ڻỰ��ռ��CPU��ʱ��û�����ƣ���ÿ�ε���SQL������ռ�õ�CPUʱ��Ϊ10�룬ÿ���Ự�������ʱ��Ϊ20���ӣ������ڼ�ÿ���Ự�������ʱ��Ϊ5���ӣ�ÿ���û�����ͬʱ����5�������Ự��������û�����3����������������������û�������ʱ��Ϊ3�졣
CREATE PROFILE myprofile LIMIT
CPU_PER_SESSION unlimited
CPU_PER_CALL 1000
CONNECT_TIME 20
IDLE_TIME 5
SESSIONS_PER_USER 5
FAILED_LOGIN_ATTEMPTS 3
PASSWORD_LOCK_TIME 3;

��34���޸ĸ�Ҫ�ļ�myprofile��Ҫ����û��ڻỰ��ռ��CPU��ʱ������Ϊ100�룬ÿ���Ự�������ʱ��Ϊ30���ӣ�ÿ���û�����ͬʱ����10�������Ự��
ALTER PROFILE myprofile LIMIT
CPU_PER_SESSION 10000
CPU_PER_CALL 1000
CONNECT_TIME 30
SESSIONS_PER_USER 10;

��35��ʹ��CREATE USER����ALTER USER���Ϊ�û������Ҫ�ļ���
CREATE USER user4 IDENTIFIED BY 123 PROFILE myprofile;   
ALTER USER user3 PROFILE myprofile;  
ALTER USER user4 PROFILE DEFAULT;

��36���޸Ĳ���resource_limit��ֵΪtrue��ʹ��Ҫ�ļ�����Դ���Ʋ�����Ч��
SHOW PARAMETER resource_limit
ALTER SYSTEM SET resource_limit = true SCOPE = SPFILE;
SHUTDOWN IMMEDIATE
STARTUP

��37��ɾ����Ҫ�ļ���
DROP PROFILE myprofile; 
DROP PROFILE myprofile CASCADE;

��38���鿴��Ҫ�ļ���Ϣ��
SELECT username, profile FROM dba_users;       
SELECT * FROM dba_profiles WHERE profile = 'DEFAULT'; --��ѯĬ�ϸ�Ҫ�ļ� 
SELECT * FROM user_password_limits;
SELECT * FROM user_resource_limits;










