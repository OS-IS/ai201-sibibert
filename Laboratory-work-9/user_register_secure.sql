CREATE OR REPLACE FUNCTION user_register_secure(password_input TEXT)
RETURNS BOOLEAN AS $$
DECLARE
    special_chars CONSTANT TEXT := '!@#$%^&*'; 
BEGIN
    -- Перевірка на наявність паролю у списку найгірших
    IF EXISTS (
        SELECT 1
        FROM probable_v2_top1575
        WHERE password = password_input
    ) THEN
        RAISE EXCEPTION 'This password is on the list of worst passwords. Please choose a different one.';
        RETURN FALSE;
    END IF;

    -- Перевірка довжини паролю
    IF LENGTH(password_input) < 14 THEN
        RAISE EXCEPTION 'Password must be at least 14 characters long.';
    END IF;

    -- Перевірка наявності мінімум 1 цифр
    IF LENGTH(REGEXP_REPLACE(password_input, '[^0-9]', '', 'g')) < 1 THEN
        RAISE EXCEPTION 'Password must contain at least 1 digits.';
    END IF;

    -- Перевірка наявності мінімум 4 символів у нижньому регістрі
    IF LENGTH(REGEXP_REPLACE(password_input, '[^a-z]', '', 'g')) < 4 THEN
        RAISE EXCEPTION 'Password must contain at least 4 lowercase letters.';
    END IF;

    -- Перевірка наявності мінімум 2 символів у верхньому регістрі
    IF LENGTH(REGEXP_REPLACE(password_input, '[^A-Z]', '', 'g')) < 2 THEN
        RAISE EXCEPTION 'Password must contain at least 2 uppercase letters.';
    END IF;

    IF LENGTH(REGEXP_REPLACE(password_input, '[^!@#$%^&*]', '', 'g')) < 4 THEN
        RAISE EXCEPTION 'Password must contain at least 4 special characters.';
    END IF;

    RETURN TRUE;
END;
$$ LANGUAGE plpgsql;