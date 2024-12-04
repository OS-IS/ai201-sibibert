CREATE OR REPLACE FUNCTION get_data(value TEXT, user_token TEXT)
RETURNS TABLE(p_id INT, name TEXT, bd DATE, spot_conf INT) AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM session_tokens WHERE token = user_token
    ) THEN
        RAISE EXCEPTION 'Invalid token';
    END IF;

    RETURN QUERY EXECUTE format(
        'SELECT p_id::INT, name::TEXT, bd::DATE, spot_conf::INT FROM worker WHERE name = %L',
        value
    );
END;
$$ LANGUAGE plpgsql;