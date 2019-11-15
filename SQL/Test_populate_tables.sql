delete from achievement_status;
delete from achievement;
delete from adventure_status;
delete from adventure;
delete from disney_user;
delete from activity;

insert into Disney_user values('001', 'Edmond', 'Williams', 'cat', to_date('19900101','YYYYMMDD'), 'apple');
insert into Disney_user values('002', 'Joe', 'Smith', 'dog', to_date('19900201','YYYYMMDD'), 'orange');
insert into Disney_user values('003', 'Bob', 'Stone', 'log', to_date('19900301','YYYYMMDD'), 'pear');
insert into Disney_user values('004', 'Bill', 'Stone', 'pot', to_date('19900301','YYYYMMDD'), 'tomato');
insert into Disney_user values('005', 'Jane', 'Will', 'cop', to_date('19900304','YYYYMMDD'), 'mandarin');

insert into Adventure values('101', '001', to_date('19910101','YYYYMMDD'), to_date('19910103','YYYYMMDD'), 'pink', 'Party','high');
insert into Adventure values('102', '001', to_date('19910103','YYYYMMDD'), to_date('19910105','YYYYMMDD'), 'yellow', 'Go','low');
insert into Adventure values('103', '002', to_date('19910303','YYYYMMDD'), to_date('19910404','YYYYMMDD'), 'pink', 'Fun','medium');
insert into Adventure values('104', '003', to_date('19910305','YYYYMMDD'), to_date('19910505','YYYYMMDD'), 'yellow', 'Yup','low');

insert into Activity values('201', 'Go go', 'fast and fun', 'orange', 'no', NULL, 'ride', 'yellow');
insert into Activity values('202', 'Run', 'run run', 'pear', 'yes', NULL, 'activity', 'pink');
insert into Activity values('203', 'Water Blast', 'get wet', 'apple', 'yes', 'oldest ride', 'ride', 'blue');

insert into Adventure_status values('201', '101', to_date('19910101', 'YYYYMMDD'), to_date('19910101', 'YYYYMMDD'));
insert into Adventure_status values('202', '102', to_date('19910103', 'YYYYMMDD'), NULL);

insert into Achievement values('401', 'Find mickeys', '5', 'Find lots of mickeys');
insert into Achievement values('402', 'Ride Water Blast', '3', 'Ride Water Blast a lot');

insert into Achievement_status values('001','401',NULL, 4);
insert into Achievement_status values('002','402', to_date('19910404', 'YYYYMMDD'), 10);


	-- @ /home/draigoza/Desktop/DisneyApp/Test_populate_tables.sql;



