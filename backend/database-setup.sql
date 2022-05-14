-- APP_USER
CREATE TABLE app_user (
  APP_USER_ID SERIAL NOT NULL,
  FIRST_NAME varchar(30) NOT NULL,
  LAST_NAME varchar(30),
  USERNAME varchar(255),
  EMAIL varchar(320),
  PASSWORD varchar(255),
  PRIMARY KEY (APP_USER_ID)
);

-- LEAGUE
CREATE TABLE league (
  LEAGUE_ID SERIAL NOT NULL,
  TV_SHOW varchar(255),
  PRIMARY KEY (LEAGUE_ID)
)

-- LEAGUE USER
CREATE TABLE league_user (
league_id INT REFERENCES league (league_id),
app_user_id INT REFERENCES app_user (app_user_id)
);

-- QUIZ
CREATE TABLE quiz (
	quiz_id SERIAL,
  league_id INT,
  PRIMARY KEY (quiz_id),
  FOREIGN KEY (league_id) REFERENCES league (league_id)
);

-- LEAGUE QUIZ
CREATE TABLE league_quiz (
	league_quiz_id SERIAL NOT NULL,
  league_id INT NOT NULL,
  episode INT NOT NULL,
  PRIMARY KEY (league_quiz_id),
  FOREIGN KEY (league_id) REFERENCES league (league_id)
);

-- QUIZ QUESTIONS
CREATE TABLE quiz_questions (
	quiz_questions_id SERIAL NOT NULL,
  league_quiz_id INT NOT NULL,
  points INT NOT NULL,
  prompt TEXT NOT NULL,
  PRIMARY KEY (quiz_questions_id),
  FOREIGN KEY (league_quiz_id) REFERENCES league_quiz (league_quiz_id)
);

-- QUIZ ANSWERS
CREATE TABLE quiz_answers (
	quiz_answers_id SERIAL NOT NULL,
  quiz_questions_id INT NOT NULL,
  answer TEXT NOT NULL,
  correct BOOLEAN,
  PRIMARY KEY (quiz_answers_id),
  FOREIGN KEY (quiz_questions_id) REFERENCES quiz_questions (quiz_questions_id)
);