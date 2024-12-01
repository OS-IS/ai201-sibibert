CREATE OR REPLACE FUNCTION user_logout(logout_token TEXT)
RETURNS VOID AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM session_tokens WHERE token = logout_token
    ) THEN
        RAISE NOTICE 'Token not found: %', logout_token;
        RETURN;
    END IF;

    DELETE FROM session_tokens WHERE token = logout_token;
    RAISE NOTICE 'Token successfully logged out: %', logout_token;
END;
$$ LANGUAGE plpgsql;