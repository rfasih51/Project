USE FASIH_KI_LIBRARY;

-- Create Login Table
CREATE TABLE Login (
    login_id INT PRIMARY KEY,
    member_id INT NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    CONSTRAINT fk_member_login
        FOREIGN KEY (member_id)
        REFERENCES Members(member_id)
);

-- Insertion into Login Table
INSERT INTO Login (login_id, member_id, username, password_hash) VALUES
(3, 3, 'alikhan00', 'pasword456' ),
(1, 1, 'johndoe', 'hashedpassword123' ),
(2, 2, 'janesmith', 'hashedpassword456');

ALTER TABLE Login
DROP COLUMN last_login;

SELECT *
FROM Login
WHERE username = 'johndoe';

SELECT *
FROM Members
WHERE member_id = 2;


-- SELECT queries to verify the data
SELECT *
FROM Login;


SELECT L.login_id, M.first_name, M.last_name, L.username, L.password_hash
FROM Login L
INNER JOIN Members M ON L.member_id = M.member_id;





