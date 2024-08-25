
-- 2. 宠物信息表
CREATE TABLE pets (
    pet_id SERIAL PRIMARY KEY,
    species VARCHAR(50) NOT NULL,
    blood_type VARCHAR(5) NOT NULL,
    nickname VARCHAR(50) NOT NULL
);

-- 1. 用户表
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    phone_number VARCHAR(15) NOT NULL,
    pet_id INT,
    FOREIGN KEY (pet_id) REFERENCES pets(pet_id)
);

-- 3. 医院表
CREATE TABLE hospitals (
    hospital_id SERIAL PRIMARY KEY,
    hospital_name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL
);

-- 4. 发帖表
CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY,
    content TEXT NOT NULL,
    user_id INT NOT NULL,
    post_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- 5. 回帖表
CREATE TABLE replies (
    reply_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    reply_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- 6. 消息表
CREATE TABLE messages (
    message_id SERIAL PRIMARY KEY,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    content TEXT NOT NULL,
    message_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users(user_id),
    FOREIGN KEY (receiver_id) REFERENCES users(user_id)
);

-- 7. 订单表
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    matched_blood_type VARCHAR(5) NOT NULL,
    hospital_id INT NOT NULL,
    pet_id INT NOT NULL,
    FOREIGN KEY (hospital_id) REFERENCES hospitals(hospital_id),
    FOREIGN KEY (pet_id) REFERENCES pets(pet_id)
);
