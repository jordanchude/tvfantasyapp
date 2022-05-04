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