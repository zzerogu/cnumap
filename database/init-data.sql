-- Building 테이블 데이터 삽입
INSERT INTO Building (node_id, name, alias, category) VALUES
('123', 'Building A', 'Alias A', 'A'),
('124', 'Building B', 'Alias B', 'B');

-- Ramp 테이블 데이터 삽입
INSERT INTO Ramp (building_id2, node_id, floor, location_description) VALUES
(1, 456, 1, 'Building A - Ramp near entrance'),
(2, 789, 2, 'Building B - Ramp near parking');

-- Disabled_Restroom 테이블 데이터 삽입
INSERT INTO Disabled_Restroom (building_id, node_id, floor, location_description) VALUES
(1, 321, 1, 'Building A - First Floor Restroom'),
(2, 654, 2, 'Building B - Second Floor Restroom');

-- Schedule 테이블 데이터 삽입
INSERT INTO Schedule (lecture_id, lecture_name, year, semester, location, room_number, day_of_week, time, professor_name) VALUES
(101, 'Computer Science 101', 2024, '1', 'Building A', '101', '월', '09:00:00', 'Dr. Kim'),
(102, 'Mathematics 202', 2024, '2', 'Building B', '202', '화', '10:30:00', 'Dr. Lee');
