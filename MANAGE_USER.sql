
-- sys as sysdba
CREATE OR REPLACE PROCEDURE MANAGE_USER(
  p_username    IN VARCHAR2,
  p_password    IN VARCHAR2
)
AS
BEGIN
  -- Benutzer erstellen
  EXECUTE IMMEDIATE 'CREATE USER ' || p_username ||
                    ' IDENTIFIED BY ' || p_password;

  -- Berechtigungen erteilen
  EXECUTE IMMEDIATE 'GRANT DB_CONNECT TO ' || p_username;

  -- Quota setzen
  EXECUTE IMMEDIATE 'ALTER USER ' || p_username || 
                    ' QUOTA UNLIMITED ON SYSTEM';

  EXECUTE IMMEDIATE 'ALTER USER ' || p_username || 
                    ' QUOTA UNLIMITED ON SYSAUX';

  EXECUTE IMMEDIATE 'ALTER USER ' || p_username || 
                    ' QUOTA UNLIMITED ON USERS';

  DBMS_OUTPUT.PUT_LINE('Benutzer ' || p_username || ' erfolgreich erstellt.');
END;
/

EXEC MANAGE_USER('CM','cm');