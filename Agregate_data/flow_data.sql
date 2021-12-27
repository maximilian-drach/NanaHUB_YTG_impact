use nanohub;
SELECT from august1 where req_URL = '/';
#Select * from (SELECT * from august1 where req_URL = '/') a lead(a.req_URL,1);
select * from august1;
Insert into august1 (request_time) SELECT cast(concat(request_date, ' ', request_time) as datetime) from august1;

select request_date, request_time, IP, req_URL, refer_name, refer_url, req_type from august1 where req_URL = '/';

select a.request_date, a.request_time, a.IP, a.req_URL, a.refer_name, a.refer_url, a.req_type, b.request_date, b.request_time, b.IP, b.req_URL, b.refer_name, b.refer_url, b.req_type from august1 a, august1 b where ((a.req_URL like '%/register%' and a.req = 'Post') or (b.req_URL = '/')) and (a.IP = b.IP);


select request_date, request_time, IP, req_URL, refer_name, refer_url, req_type from august1 where (req_URL like '%/register%' and req = 'Post') group by IP
union 
select request_date, request_time, IP, req_URL, refer_name, refer_url, req_type from august1 where req_URL = '/';

create table uni as select * from august1 where (req_URL like '%/register%' and req = 'Post') group by IP
union 
select * from august1 where req_URL = '/'; 

select IP, req_URL from august1 where exists (select IP, req_URL from august1 where req_URL = '/');
 #and (select request_date, request_time, IP, req_URL, refer_name, refer_url, req_type from august1 where (req_URL like '%/register%' and req = 'Post') group by IP));

select C.* from 
(select request_date, request_time, IP, req_URL, refer_name, refer_url, req_type, req from august1 where req_URL = '/') A, 
(select IP, req_url, req from august1 where (req_URL like '%/register%' and req = 'Post') group by IP) B, 
(select * from august1 where (req_URL like '%/register%' and req = 'Post') group by IP union 
select * from august1 where req_URL = '/') C where A.IP = B.IP = C.IP;
 
 
 select * from uni a, uni b, uni c where (a.IP = b.IP); #where ((a.req_URL like '%/register%' and a.req = 'Post') or (b.req_URL = '/')) and (a.IP = b.IP = c.IP);
 
 select c.*, a.req_URL, a.req, b.req_URL from  a, august1 b, august1 c where ((a.req_URL like '%/register%' and a.req = 'Post') and (b.req_URL = '/')) and (a.IP = b.IP = c.IP);

SET GLOBAL innodb_buffer_pool_size=268435456;
select c.* from august1 a, august1 b where ((a.req_URL like '%/register%' and a.req = 'Post') or (b.req_URL = '/')) and (a.IP = b.IP);

select 

select request_date, request_time, IP, req_URL, refer_name, refer_url, req_type, req from august1 where req_URL = '/';
select * from august1 where (req_URL like '%/register%' and req = 'Post') group by IP union 
select * from august1 where req_URL = '/';


select b.IP, a.refer_name, b.req_url, b.req from august1 a, august1 b where (b.req_url like '%/register%' and b.req = 'Post')

