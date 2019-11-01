DROP TABLE Achievement_status;
DROP TABLE Achievement;
DROP TABLE Adventure_status;
DROP TABLE Adventure;
DROP TABLE Activity;
DROP TABLE Disney_user;

	-- @ /home/draigoza/Desktop/DisneyApp/Disney_my_tables.sql;

create table Disney_user(user_id varchar(10), first_name varchar(50), last_name varchar(50), user_pwd varchar(50), date_created date, favorite_land varchar(50), PRIMARY KEY(user_id));

create table Activity(actv_id varchar(10), title varchar(50), description varchar(1000), park_land varchar(50), kid_friendly varchar(50), trivia varchar(1000), type varchar(1000), theme varchar(50), PRIMARY KEY(actv_id));

create table Adventure(adv_id varchar(10), user_id varchar(10), start_date date, complete_date date, theme varchar(50), title varchar(50), density varchar(50), PRIMARY KEY(adv_id), FOREIGN KEY(user_id) references Disney_user(user_id));

create table Adventure_status(actv_id varchar(10), adv_id varchar(10), start_date date, date_completed date, FOREIGN KEY(actv_id) references Activity(actv_id), FOREIGN KEY(adv_id) references Adventure(adv_id));

create table Achievement(achv_id varchar(10), title varchar(50), count_required number, description varchar(1000), PRIMARY KEY(achv_id));

create table Achievement_status(user_id varchar(10), achv_id varchar(10), date_earned date, count_achieved number, FOREIGN KEY(user_id) references Disney_user(user_id), FOREIGN KEY(achv_id) references Achievement(achv_id));
