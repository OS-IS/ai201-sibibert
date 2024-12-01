CREATE OR REPLACE FUNCTION user_login(client_ip INET, client_port INTEGER, server_pid INTEGER)
RETURNS TEXT AS $$
DECLARE
    generated_token TEXT;
BEGIN
    IF NOT EXISTS (
        SELECT FROM information_schema.tables
        WHERE table_name = 'user_tokens'
    ) THEN
        EXECUTE 'CREATE TABLE user_tokens (
            id SERIAL PRIMARY KEY,
            token TEXT NOT NULL UNIQUE,
            client_ip INET NOT NULL,
            client_port INTEGER NOT NULL,
            server_pid INTEGER NOT NULL,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )';
    END IF;

    generated_token := md5(random()::TEXT || clock_timestamp()::TEXT);

    INSERT INTO user_tokens (token, client_ip, client_port, server_pid)
    VALUES (generated_token, client_ip, client_port, server_pid);

    RETURN generated_token;
END;
$$ LANGUAGE plpgsql;