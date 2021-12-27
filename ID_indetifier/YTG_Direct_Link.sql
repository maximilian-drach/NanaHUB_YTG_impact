use nanohub;
show tables;
select * from august2;
#IDs that had a YTG link
SELECT ID from august2 where (((refer_url like '%youtube%') or (refer_url like '%google%')) and (refer_url not like '%accounts%'));
#Number of IDs that came from YTG links
select count(*) as 'YTG links to NanoHUB' from (SELECT ID from Appache_data where (((refer_url like '%youtube%') or (refer_url like '%google%')) and (refer_url not like '%accounts%'))) a;


#direct YTG links to tool viewage
SELECT ID from august2 where (((refer_url like '%youtube%') or (refer_url like '%google%')) and (refer_url not like '%accounts%')) and (req_type like '%tool%') group by ID;
#numbers of IDs that did direct YTG links to tool viewage
select count(*) as 'direct YTG links tool viewage count' from (SELECT ID from Appache_data where (((refer_url like '%youtube%') or (refer_url like '%google%')) and (refer_url not like '%accounts%')) and (req_type like '%tool%') group by ID) a;


#direct YTG links to tool usage
select ID from august2 where (((refer_url like '%youtube%') or (refer_url like '%google%')) and (refer_url not like 'accounts')) and ((req_URL like '%/invoke%') or (req_URL like '%session?sess=%')) group by ID;
#numbers of IDs that did direct YTG links to tool usage
select count(*) as 'direct YTG links tool usage count' from (select ID from Appache_data where (((refer_url like '%youtube%') or (refer_url like '%google%')) and (refer_url not like 'accounts')) and ((req_URL like '%/invoke%') or (req_URL like '%session?sess=%')) group by ID) a;


#returns the tool viewage breakdown from Direct YTG links
select a.req_tag , count(distinct a.ID) as distinct_ID from (SELECT * from august2 where (((refer_url like '%youtube%') or (refer_url like '%google%')) and (refer_url not like '%accounts%')) and (req_type like '%tool%')) a group by a.req_tag order by distinct_ID desc;


#return the tools usage breakdown from Direct YTG Links
select a.req_tag , count(distinct a.ID) as distinct_ID from (SELECT * from august2 where (((refer_url like '%youtube%') or (refer_url like '%google%')) and (refer_url not like 'accounts')) and ((req_URL like '%/invoke%') or (req_URL like '%session?sess=%'))) a group by a.req_tag order by distinct_ID desc;
select * from august2;

#/tools/name, /resources/name, /resources/number
