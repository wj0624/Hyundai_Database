SELECT * FROM DBA_TABLES;
-- ���̺�� $�� ������ �ý��� ���̺�� ������ �� ����, $�� # �Ⱦ��°� ����

SELECT *
FROM DBA_USERS
WHERE USERNAME = 'SCOTT';

GRANT CREATE VIEW TO SCOTT;