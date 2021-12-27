use nanohub;

Create table Appache_data(
request_date date, request_time time, IP varchar(16), 
req varchar(16), req_URL varchar(8000), RC integer, 
refer_name varchar(256), refer_url varchar(6000), agent varchar(700), 
req_type varchar(256) default null, req_tag varchar(256) default null, req_residue text(10000) default null, 
resource_type varchar(256) default null, resource_title varchar(256) default null, ID int, key(IP, request_date, request_time));

Insert into Appache_data select * from july2;
Insert into Appache_data select * from august2;
Insert into Appache_data select * from  september2;


#the /invoke
#make sure not to include accounts.google.com


select count(*) from (SELECT ID from Appache_data where ((refer_url like '%youtube%') or (refer_url like '%google%')) group by ID) a;
select  * from Appache_data;
drop table Appache_data;