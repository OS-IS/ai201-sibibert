CREATE OR REPLACE FUNCTION get_data_secure(attribute_value VARCHAR)
RETURNS TABLE(p_id INTEGER, name VARCHAR, bd DATE, spot_conf INTEGER) AS $$
BEGIN
    RETURN QUERY EXECUTE 'SELECT * FROM worker WHERE name = $1' 
    USING attribute_value;
END;
$$ LANGUAGE plpgsql;