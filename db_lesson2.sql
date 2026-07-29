Q1
CREATE TABLE departments (
    -> department_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> name VARCHAR(20) NOT NULL,
    -> created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -> updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    -> );
DESC departments;

Q2
ALTER TABLE people ADD department_id INT UNSIGNED AFTER email;
DESC people;

Q3
INSERT INTO departments (name)
    -> VALUES
    -> ('営業'),
    -> ('開発'),
    -> ('経理'),
    -> ('人事'),
    -> ('情報システム');
DESC departments;
INSERT INTO people (name, email, department_id, age, gender)
    -> VALUES
    -> ('武藤遊戯', 'mutou@beyond-works.co.jp', 4, 30, 1),
    -> ('遊城十代', 'yuuki@beyond-works.co.jp', 1, 28, 1),
    -> ('不動遊星', 'fudou@beyond-works.co.jp', 2, 26, 1),
    -> ('九十九遊馬', 'tsukumo@beyond-works.co.jp', 1, 24, 1),
    -> ('榊遊矢', 'sakaki@beyond-works.co.jp', 1, 22, 1),
    -> ('月野うさぎ', 'tsukino@beyond-works.co.jp', 2, 35, 2),
    -> ('水野亜美', 'mizuno@beyond-works.co.jp', 5, 35, 2),
    -> ('火野レイ', 'hino@beyond-works.co.jp', 2, 35, 2),
    -> ('木野まこと', 'kino@beyond-works.co.jp', 3, 35, 2),
    -> ('愛野美奈子', 'aino@beyond-works.co.jp', 2, 35, 2);
SELECT * FROM people;
INSERT INTO reports (person_id, content)
    -> VALUES
    -> (7, '9月人事異動のお知らせ'),
    -> (8, '今日の架電数80件、獲得件数2件、獲得見込み2件'),
    -> (9, '来週月曜日に新システムのテストお願いします。'),
    -> (10, '今日の架電数75件、獲得件数1件、獲得見込み3件'),
    -> (11, '今日の架電件数70件、獲得件数1件、獲得見込み1件'),
    -> (12, '了解。来週月曜日の9:00からテストを始めます。'),
    -> (13, '今月は繁忙期を過ぎたのもあり、獲得率が先月の-30%でした。'),
    -> (14, '来週月曜日9:00からテストですね。デバッグはいつやりますか？'),
    -> (15, '先月の収入12,000,000円、 支出8,000,000円でした。'),
    -> (16, 'デバッグは再来週月曜日10:00からにしましょう。');
SELECT * FROM reports;

Q4
SELECT * FROM people;

SELECT * FROM people WHERE department_id IS NULL;

UPDATE people SET department_id = 1 WHERE person_id = 1;

SELECT * FROM people;

UPDATE people SET department_id = 2 WHERE person_id = 2;

SELECT * FROM people;

UPDATE people SET department_id = 3 WHERE person_id = 3;

SELECT * FROM people;

UPDATE people SET department_id = 4 WHERE person_id = 4;

SELECT * FROM people;

UPDATE people SET department_id = 5 WHERE person_id = 6;

SELECT * FROM people;

Q5
SELECT name, age FROM people WHERE gender = 1 ORDER BY age DESC;

Q6
SELECT
  `name`, `email`, `age`
FROM
  `people`
WHERE
  `department_id` = 1
ORDER BY
  `created_at`;

"作成した順になるように部署が営業の名前、メールアドレス、年齢をpeopleテーブルから取得する。"

Q7
SELECT name FROM people WHERE gender = 2 AND age BETWEEN 20 AND 29 OR gender = 1 AND age BETWEEN 40 AND 49;

Q8
SELECT * FROM people WHERE department_id = 1 ORDER BY age ASC;

Q9
SELECT AVG(age) AS average_age FROM people WHERE gender = 2;

Q10
SELECT p.name, d.name, r.content FROM people p JOIN departments d USING (department_id) JOIN reports r USING (person_id);

Q11
SELECT name FROM people LEFT OUTER JOIN reports ON people.person_id = reports.person_id WHERE reports.content IS NULL;