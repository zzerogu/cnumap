-- Building Table
CREATE TABLE IF NOT EXISTS Building (
    building_id SERIAL PRIMARY KEY,
    node_id VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    alias VARCHAR(255),
    category ENUM('A', 'B', 'C', 'D', 'E') NOT NULL
);

-- Ramp Table
CREATE TABLE IF NOT EXISTS Ramp (
    ramp_id SERIAL PRIMARY KEY,
    building_id2 INT NOT NULL,
    node_id INT NOT NULL,
    floor INT NOT NULL,
    location_description TEXT NOT NULL,
    FOREIGN KEY (building_id2) REFERENCES Building(building_id)
);

-- Disabled Restroom Table
CREATE TABLE IF NOT EXISTS Disabled_Restroom (
    restroom_id SERIAL PRIMARY KEY,
    building_id INT NOT NULL,
    node_id INT NOT NULL,
    floor INT NOT NULL,
    location_description TEXT NOT NULL,
    FOREIGN KEY (building_id) REFERENCES Building(building_id)
);

-- Schedule Table
CREATE TABLE IF NOT EXISTS Schedule (
    schedule_id SERIAL PRIMARY KEY,
    lecture_id INT NOT NULL,
    lecture_name VARCHAR(255) NOT NULL,
    year YEAR NOT NULL,
    semester ENUM('1', '2', '하기', '동기') NOT NULL,
    location VARCHAR(255) NOT NULL,
    room_number VARCHAR(255) NOT NULL,
    day_of_week ENUM('월', '화', '수', '목', '금', '토', '일') NOT NULL,
    time TIME NOT NULL,
    professor_name TEXT NOT NULL
);

-- Construction News Table
CREATE TABLE IF NOT EXISTS Construction_News (
    news_id SERIAL PRIMARY KEY,
    content TEXT NOT NULL,
    location TEXT NOT NULL,
    end_time DATETIME NOT NULL,
    start_time DATETIME NOT NULL
);
