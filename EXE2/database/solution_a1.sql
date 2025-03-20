-- truy vấn
--Lấy danh sách người dùng theo thứ tự Alphabet (A → Z)
SELECT * FROM users
ORDER BY user_name ASC;

-- Lấy 7 người dùng theo thứ tự Alphabet (A → Z)
SELECT TOP 7 * FROM users
ORDER BY user_name ASC;

--Lấy danh sách người dùng có chữ "a" trong tên, sắp xếp Alphabet (A → Z)
SELECT * FROM users
WHERE user_name LIKE '%a%'
ORDER BY user_name ASC;

-- Lấy danh sách người dùng có tên bắt đầu bằng chữ "m"
SELECT * FROM users
WHERE user_name LIKE 'm%';

--Lấy danh sách người dùng có tên kết thúc bằng chữ "i"
SELECT * FROM users
WHERE user_name LIKE '%i';

--Lấy danh sách người dùng có email thuộc Gmail
SELECT * FROM users
WHERE user_email LIKE '%@gmail.com';

--Lấy danh sách người dùng có email Gmail và tên bắt đầu bằng "m"
SELECT * FROM users
WHERE user_email LIKE '%@gmail.com' 
AND user_name LIKE 'm%';

--Lấy danh sách người dùng có email Gmail, tên có chữ "i" và tên dài hơn 5 ký tự
SELECT * FROM users
WHERE user_email LIKE '%@gmail.com'
AND user_name LIKE '%i%'
AND LEN(user_name) > 5;

/*Lấy danh sách người dùng có:
Tên có chữ "a"
Chiều dài tên từ 5 đến 9 ký tự
Email là Gmail
Tên email có chữ "i" (trước @, không phải domain)*/
SELECT * FROM users
WHERE user_name LIKE '%a%'
AND LEN(user_name) BETWEEN 5 AND 9
AND user_email LIKE '%@gmail.com'
AND LEFT(user_email, CHARINDEX('@', user_email) - 1) LIKE '%i%';

/*Lấy danh sách người dùng có:
Tên có chữ "a" và chiều dài từ 5 đến 9
HOẶC tên có chữ "i" và chiều dài nhỏ hơn 9
HOẶC email Gmail và tên email có chữ "i" (trước @, không phải domain)*/
SELECT * FROM users
WHERE 
    (user_name LIKE '%a%' AND LEN(user_name) BETWEEN 5 AND 9)
    OR (user_name LIKE '%i%' AND LEN(user_name) < 9)
    OR (user_email LIKE '%@gmail.com' 
        AND LEFT(user_email, CHARINDEX('@', user_email) - 1) LIKE '%i%');