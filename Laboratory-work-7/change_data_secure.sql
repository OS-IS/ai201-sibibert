CREATE OR REPLACE FUNCTION change_data_secure(attribute1 VARCHAR, attribute2 VARCHAR)
RETURNS VOID AS $$
BEGIN
    EXECUTE 'UPDATE worker SET name = $1 WHERE name = $2'
    USING attribute2, attribute1;
END;
$$ LANGUAGE plpgsql;