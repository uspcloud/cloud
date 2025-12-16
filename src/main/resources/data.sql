-- Create the role table
CREATE TABLE role (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create the users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Create the join table for the many-to-many relationship
CREATE TABLE users_roles (
    user_id BIGINT NOT NULL,
    roles_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, roles_id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (roles_id) REFERENCES role (id)
);

-- Insert sample roles
INSERT INTO role (name) VALUES ('ROLE_USER');
INSERT INTO role (name) VALUES ('ROLE_ADMIN');

-- Insert a sample admin user (password is 'password' encoded with BCrypt)
-- You can generate your own encoded passwords using the PasswordEncoder bean
INSERT INTO users (username, password) VALUES ('admin', '$2a$10$8.A.o.c.3q3a4s5d6f7g8h9i0j/k1l2m3n4o5p6q7r8s9t0u');

-- Assign the ADMIN role to the admin user
INSERT INTO users_roles (user_id, roles_id) VALUES (1, 2);
