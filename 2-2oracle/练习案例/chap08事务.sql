��1��ʹ��COMMIT������������ύ
--��SQL*Plus�ͻ��ˣ��Ự1��
SQL> CREATE TABLE test(id NUMBER PRIMARY KEY, name VARCHAR2(10));
SQL> INSERT INTO test VALUES(1, '����');
SQL> COMMIT;
SQL> INSERT INTO test VALUES(2, '����');
SQL> CREATE VIEW v_test AS SELECT * FROM test;
--�ٴ���һ��SQL*Plus�ͻ��ˣ��Ự2��
SQL> SELECT id, name FROM test;
SQL> SELECT id, name FROM test;
SQL> SELECT id, name FROM test; 
SQL> SELECT id, name FROM test;

��2��ʹ��ROLLBACK���ͱ���㼼���������Ĳ��ֻع�����ȫ�ع�
--������1
SQL> INSERT INTO test VALUES(3, '����');
SQL> SAVEPOINT a;
SQL> INSERT INTO test VALUES(4, '����');
SQL> SAVEPOINT b;
SQL> INSERT INTO test VALUES(5, 'Ǯ��');
SQL> SELECT id, name FROM test;    
SQL> ROLLBACK TO SAVEPOINT a; 
SQL> SELECT id, name FROM test;
SQL> ROLLBACK TO SAVEPOINT b; 
SQL> ROLLBACK;

��3��������2������������2�����ݡ�ʹ�ö��ύ��������л��������������
--��SQL*Plus�ͻ��ˣ��Ự1��
SQL> INSERT INTO test VALUES(3, '����');
SQL> COMMIT;
SQL> DELETE FROM test WHERE id = 3;
SQL> COMMIT;
SQL> INSERT INTO test VALUES(3, '����');
SQL> COMMIT;
SQL> UPDATE test SET name = '����1' WHERE id = 2;
SQL> COMMIT;
SQL> UPDATE test SET name = '����' WHERE id = 2;
SQL> COMMIT;
--�ٴ���һ��SQL*Plus�ͻ��ˣ��Ự2��
SQL> SELECT id, name FROM test;
SQL> SELECT id, name FROM test;
SQL> SELECT id, name FROM test;
SQL> SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SQL> SELECT id, name FROM test;
SQL> COMMIT;
SQL> SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SQL> SELECT id, name FROM test;
SQL> COMMIT;
SQL> SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SQL> UPDATE test SET name = '����2' WHERE id= 2;
SQL> UPDATE test SET name = '����2' WHERE id= 2;
SQL> COMMIT;

��4��ʹ��ֻ���������������
--��SQL*Plus�ͻ��ˣ��Ự1��
SQL> INSERT INTO test VALUES(4, '����');
SQL> COMMIT;
SQL> UPDATE test SET name = '����1' WHERE id = 4;
SQL> COMMIT;
--�ٴ���һ��SQL*Plus�ͻ��ˣ��Ự2��
SQL> SET TRANSACTION READ ONLY;
SQL> SELECT id, name FROM test;
SQL> COMMIT;
SQL> SET TRANSACTION READ ONLY;
SQL> SELECT id, name FROM test;
SQL> COMMIT;
SQL> SET TRANSACTION READ ONLY;
SQL> UPDATE test SET name = '����2' WHERE id= 2;

��5��ʹ��SELECT FOR UPDATE��������
--��SQL*Plus�ͻ��ˣ��Ự1��
SQL> UPDATE test SET name ='����' WHERE id=4;
SQL> ROLLBACK;
--�ٴ���һ��SQL*Plus�ͻ��ˣ��Ự2��
SQL> SELECT * FROM test FOR UPDATE NOWAIT;
SQL> SELECT * FROM test FOR UPDATE WAIT 3;
SQL> SELECT * FROM test FOR UPDATE;
SQL> ROLLBACK;

��6��ʹ��LOCK TABLE��������
--��SQL*Plus�ͻ��ˣ��Ự1��
SQL> UPDATE test SET name ='����' WHERE id=4;
SQL> ROLLBACK;
--�ٴ���һ��SQL*Plus�ͻ��ˣ��Ự2��
SQL> LOCK TABLE test IN ROW EXCLUSIVE MODE NOWAIT;
SQL> LOCK TABLE test IN SHARE MODE NOWAIT;
SQL> LOCK TABLE test IN EXCLUSIVE MODE NOWAIT;
SQL> ROLLBACK;

��7��ʹ��v$lock��ͼ�鿴����Ϣ��
SELECT a.type, DECODE(a.lmode, 0, 'None', 1, 'Null', 2, 'Row-S',
3, 'Row-X', 4, 'Share', 5, 'S/Row-X',  6, 'Exclusive', 'Unknown') LockMode
FROM v$lock a WHERE a.type in ('TM', 'TX');
UPDATE teacher SET t_name = '����' WHERE t_id = '060001';
SELECT a.type, DECODE(a.lmode, 0, 'None', 1, 'Null', 2, 'Row-S',
3, 'Row-X', 4, 'Share', 5, 'S/Row-X',  6, 'Exclusive', 'Unknown') LockMode
FROM v$lock a WHERE a.type in ('TM', 'TX');
SELECT a.type, DECODE(a.lmode, 0, 'None', 1, 'Null', 2, 'Row-S', 3, 'Row-X',
'Share', 5, 'S/Row-X',  6, 'Exclusive', 'Unknown') LockMode, object_name
FROM v$lock a, all_objects b WHERE a.type in ('TM', 'TX') AND 
b.object_id(+) = a.id1;
DELETE award_author WHERE award_id = 1;
SELECT a.type, DECODE(a.lmode, 0, 'None', 1, 'Null', 2, 'Row-S', 3, 'Row-X',
4, 'Share', 5, 'S/Row-X',  6, 'Exclusive', 'Unknown') LockMode, object_name
FROM v$lock a, all_objects b WHERE a.type in ('TM', 'TX') AND 
a.id1 = b.object_id(+);
ROLLBACK;
LOCK TABLE test IN SHARE ROW EXCLUSIVE MODE NOWAIT;
SELECT a.type, DECODE(a.lmode, 0, 'None', 1, 'Null', 2, 'Row-S',
3, 'Row-X', 4, 'Share', 5, 'S/Row-X',  6, 'Exclusive', 'Unknown') LockMode
FROM v$lock a WHERE a.type in ('TM', 'TX');
ROLLBACK;
SELECT a.type, DECODE(a.lmode, 0, 'None', 1, 'Null', 2, 'Row-S',
3, 'Row-X', 4, 'Share', 5, 'S/Row-X',  6, 'Exclusive', 'Unknown') LockMode
FROM v$lock a WHERE a.type in ('TM', 'TX');









































































