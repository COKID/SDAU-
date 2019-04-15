��1��Ϊ��ʦ�����ò�ͬ��Ĭ�ϻ���ء�
SELECT table_name, buffer_pool FROM user_tables WHERE table_name = 'TEACHER';
ALTER TABLE teacher STORAGE (BUFFER_POOL KEEP);  
SELECT table_name, buffer_pool FROM user_tables WHERE table_name = 'TEACHER';
ALTER TABLE teacher STORAGE (BUFFER_POOL RECYCLE);  
SELECT table_name, buffer_pool FROM user_tables WHERE table_name = 'TEACHER';
ALTER TABLE teacher STORAGE (BUFFER_POOL DEFAULT);

��2��Ϊ��ʦ�����û��淽ʽ��
SELECT table_name, buffer_pool, cache FROM user_tables WHERE table_name = 'TEACHER';
ALTER TABLE teacher CACHE;        
SELECT table_name, buffer_pool, cache FROM user_tables WHERE table_name = 'TEACHER';

��3��������־�ļ���4���������2��������־�ļ���
ALTER DATABASE ADD LOGFILE GROUP 4 ('D:\BACKUP\REDO041.LOG', 'D:\BACKUP\REDO042.LOG') SIZE 8M;

��4����ָ����־�ļ������ţ�������־�ļ���5���������2��������־�ļ���
ALTER DATABASE ADD LOGFILE ('D:\BACKUP\REDO051.LOG', 'D:\BACKUP\REDO052.LOG') SIZE 8M;

��5������־�ļ���3����־�ļ���4�������־�ļ���
ALTER DATABASE ADD LOGFILE MEMBER 'D:\BACKUP\REDO032.LOG' TO GROUP 3, 'D:\BACKUP\REDO043.LOG' TO GROUP 4;
SELECT * FROM v$logfile;

��6����ָ����־�ļ�����������־�ļ���5�������־�ļ���
ALTER DATABASE ADD LOGFILE MEMBER 'D:\BACKUP\REDO053.LOG' TO ('D:\BACKUP\REDO051.LOG', 'D:\BACKUP\REDO052.LOG');

��7��ɾ����־�ļ���
ALTER DATABASE DROP LOGFILE MEMBER 'D:\BACKUP\REDO032.LOG';
SELECT group# from v$log WHERE status = 'CURRENT';

��8��ɾ����־�ļ��顣
ALTER DATABASE DROP LOGFILE GROUP 6;
ALTER DATABASE DROP LOGFILE GROUP 5;

��9�������־�ļ��顣
ALTER DATABASE CLEAR LOGFILE GROUP 4;   
ALTER SYSTEM SWITCH LOGFILE;
SELECT group#, status FROM v$log;
ALTER DATABASE CLEAR LOGFILE GROUP 1; 
ALTER DATABASE CLEAR UNARCHIVED LOGFILE GROUP 1;

��10����ѯѧ����ʹ�õ����ݶε���Ϣ�ͽ�ʦ�������ĸ������ļ���
SELECT segment_name, segment_type, tablespace_name, bytes, blocks, extents FROM user_segments WHERE SEGMENT_NAME = 'STUDENT';
SELECT file_name, file_id FROM dba_data_files WHERE file_id IN (SELECT DISTINCT file_id FROM dba_extents WHERE segment_name='TEACHER');

��11��������ռ�test1�������ļ���Ĭ��Ŀ¼�£���С��100M������ѡ�ΪĬ��ֵ��
CREATE TABLESPACE test1 DATAFILE 'test1.dbf' SIZE 100M; 
SELECT tablespace_name, file_name FROM dba_data_files; 
SELECT name FROM v$datafile;

��12��������ռ�test2���ñ�ռ�����3�������ļ�����С�ֱ���70M��80M��90M������ѡ�ΪĬ��ֵ��
CREATE TABLESPACE test2 DATAFILE 'D:\test21.dbf' SIZE 70M,'D:\test22.dbf' SIZE 80M, 'D:\test23.dbf' SIZE 90M;

��13��������ռ�test3���ñ�ռ�����1�������ļ�����С��100M���������ļ���ռ��ʱ�����Զ�����10M�Ŀռ䣬�������ļ������ռ�Ϊ300M������������־�Ĺ��ܣ�������ͳһ����ķ�ʽ����Ĭ�ϴ�СΪ1M������ѡ�ΪĬ��ֵ��
CREATE TABLESPACE test3 DATAFILE 'D:\test3.dbf' SIZE 100M
AUTOEXTEND ON NEXT 10M MAXSIZE 300M
NOLOGGING
EXTENT MANAGEMENT LOCAL UNIFORM;

��14��������ʱ��ռ�temp1������ʱ�����ļ��Ĵ�СΪ20M������ѡ�ΪĬ��ֵ��
CREATE TEMPORARY TABLESPACE temp1 TEMPFILE 'D:\TEMP\temp1.dbf' SIZE 20M;
SELECT tablespace_name, file_name FROM dba_temp_files;  
SELECT name FROM v$tempfile;

��15��������ʱ��ռ�temp2������2����С�ֱ���10M��20M����ʱ�����ļ�����һ����ʱ�����ļ���ռ��ʱ�����Զ�����2M�Ŀռ������ռ�Ϊ100M���ڶ�����ʱ�����ļ���ռ��ʱ�����Զ�����10M�Ŀռ������ռ�Ϊ300M��������ͳһ����ķ�ʽ������СΪ512K��
CREATE TEMPORARY TABLESPACE temp2
TEMPFILE 'D:\TEMP\temp21.dbf' SIZE 10M AUTOEXTEND ON NEXT 2M MAXSIZE 100M,
'D:\TEMP\temp22.dbf' SIZE 20M AUTOEXTEND ON NEXT 10M MAXSIZE 300M
EXTENT MANAGEMENT LOCAL UNIFORM SIZE 512K;

��16������������ռ�undo1������2����С����20M�������ļ������ڶ��������ļ���ռ��ʱ�����Զ�����10M�Ŀռ������ռ�Ϊ300M���������Զ�����ķ�ʽ��
CREATE UNDO TABLESPACE undo1
DATAFILE 'D:\UNDO\undo11.dbf' SIZE 20M, 
'D:\UNDO\undo12.dbf' SIZE 20M AUTOEXTEND ON NEXT 10M MAXSIZE 300M;

��17����test1��ռ�����Ϊ�ѻ�״̬��Ȼ�������û�����״̬��
ALTER TABLESPACE test1 OFFLINE;    
ALTER TABLESPACE test1 ONLINE;

��18����test1��ռ�����Ϊֻ��״̬��Ȼ�������û�ɶ�д״̬��
ALTER TABLESPACE test1 READ ONLY;    
ALTER TABLESPACE test1 READ WRITE;

��19�������ݿ��Ĭ����ʱ��ռ�����Ϊtemp1��Ĭ�����ñ�ռ�����Ϊtest1�����û�scott����ʱ��ռ�����Ϊtemp2��
ALTER DATABASE DEFAULT TEMPORARY TABLESPACE temp1;     
ALTER DATABASE DEFAULT TABLESPACE test1;            
ALTER USER scott TEMPORARY TABLESPACE temp2;

��20������ռ�temp1�����Ƹ�Ϊrtest��
ALTER TABLESPACE test1 RENAME TO rtest;

��21������ռ�temp2�Ĵ�С����Ϊ10M��
SELECT bytes/1024/1024 Mbytes, blocks, maxbytes/1024/1024 MmaxBytes,maxblocks FROM dba_temp_files WHERE tablespace_name = 'TEMP2';
ALTER TABLESPACE temp1 SHRINK SPACE KEEP 10M;
SELECT bytes/1024/1024 Mbytes, blocks, maxbytes/1024/1024 MmaxBytes, maxblocks FROM dba_temp_files WHERE tablespace_name = 'TEMP2';

��22��ɾ����ռ�test3������ɾ�������ļ�����˸������ļ����Ա����á�
DROP TABLESPACE test3;  
CREATE TABLESPACE test3 DATAFILE 'D:\test3.dbf' SIZE 100M;
CREATE TABLESPACE test3 DATAFILE 'D:\test3.dbf' SIZE 100M REUSE;
CREATE TABLE test(id NUMBER, name varchar2(10)) TABLESPACE test3;
DROP TABLESPACE test3;
DROP TABLESPACE test3 INCLUDING CONTENTS AND DATAFILES;

��23��ɾ����ʱ��ռ�temp1��
ROP TABLESPACE temp1;
ALTER DATABASE DEFAULT TEMPORARY TABLESPACE temp;
DROP TABLESPACE temp1;

��24��Ϊ��ռ�test2���һ�������ļ��������ļ���СΪ10M���Զ���չ�����ռ������ơ�Ϊ��ռ�temp2���������С�ֱ�Ϊ30M��40M����ʱ�����ļ���Ϊ��ռ�undo1���һ��30M�������ļ���
ALTER TABLESPACE test2 ADD DATAFILE 'test22.dbf' SIZE 10M AUTOEXTEND ON MAXSIZE UNLIMITED;
ALTER TABLESPACE temp2 ADD TEMPFILE 'D:\TEMP\temp23.dbf' SIZE 30M, 'D:\TEMP\temp24.dbf' SIZE 40M;
ALTER TABLESPACE undo1 ADD DATAFILE 'D:\UNDO\undo13.dbf' SIZE 30M;


��25��ɾ��test2��ռ�������ļ�test22.dbf��ɾ��temp2��ռ����ʱ�����ļ�temp23.dbf��ͨ���ļ����ɾ��undo1��ռ�������ļ�undo13.dbf��
ALTER TABLESPACE test2 DROP DATAFILE 'test22.dbf';    
ALTER TABLESPACE temp2 DROP TEMPFILE 'D:\TEMP\temp23.dbf';
SELECT file_name,file_id FROM dba_data_files WHERE TABLESPACE_NAME = 'UNDO1';
ALTER TABLESPACE undo1 DROP DATAFILE 14; 

��26��������ʱ�ļ�temp24.dbf�Ĵ�С��150M��Ȼ���ٽ�������Ϊ�Զ���չ��ʽ��ÿ����չ5M����Сû�����ޡ�
ALTER DATABASE TEMPFILE 'D:\TEMP\temp24.dbf' RESIZE 150M;  
ALTER DATABASE TEMPFILE 'D:\TEMP\temp24.dbf' AUTOEXTEND ON NEXT 5M MAXSIZE UNLIMITED;

��27���������ļ�test22.dbf����ʱ�����ļ�temp24.dbf����Ϊ�ѻ�״̬��
ARCHIVE LOG LIST
ALTER DATABASE DATAFILE 'D:\test22.dbf' OFFLINE;
ALTER DATABASE DATAFILE 'D:\test22.dbf' OFFLINE FOR DROP;    
ALTER DATABASE TEMPFILE 'D:\TEMP\temp24.dbf' OFFLINE;
ALTER DATABASE TEMPFILE 'D:\TEMP\temp24.dbf' ONLINE;
ALTER DATABASE DATAFILE 'D:\test22.dbf' ONLINE;
ALTER DATABASE RECOVER DATAFILE 'D:\test22.dbf';
ALTER DATABASE DATAFILE 'D:\test22.dbf' ONLINE;

��28���鿴��ռ��ʹ����Ϣ��
SELECT dbf.tablespace_name,
dbf.totalspace "����(M)",
dbf.totalblocks as �ܿ���,
dfs.freespace "ʣ������(M)",
dfs.freeblocks "ʣ�����",
(dfs.freespace/dbf.totalspace)*100 "���б���"
FROM (SELECT t.tablespace_name,
SUM(t.bytes)/1024/1024 totalspace,
SUM(t.blocks) totalblocks
FROM dba_data_files t
GROUP BY t.tablespace_name) dbf,
(SELECT tt.tablespace_name,
SUM(tt.bytes)/1024/1024 freespace,
SUM(tt.blocks) freeblocks
FROM dba_free_space tt
GROUP BY tt.tablespace_name) dfs
WHERE TRIM(dbf.tablespace_name) = TRIM(dfs.tablespace_name);

