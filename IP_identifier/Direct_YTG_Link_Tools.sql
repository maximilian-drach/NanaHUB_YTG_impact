use nanohub;
show tables;
select * from august1;
#IDs that had a YTG link
SELECT ID from august2 where (((refer_url like '%youtube%') or (refer_url like '%google%')) and (refer_url not like '%accounts%'));
#Number of IDs that came from YTG links
select count(*) as 'YTG links to NanoHUB' from (SELECT ID from august2 where (((refer_url like '%youtube%') or (refer_url like '%google%')) and (refer_url not like '%accounts%'))) a;


#direct YTG links to tool viewage
SELECT ID from august2 where (((refer_url like '%youtube%') or (refer_url like '%google%')) and (refer_url not like '%accounts%')) and (req_type like '%tool%') group by ID;
#numbers of IDs that did direct YTG links to tool viewage
select count(*) as 'direct YTG links tool viewage count' from (SELECT ID from august2 where (((refer_url like '%youtube%') or (refer_url like '%google%')) and (refer_url not like '%accounts%')) and (req_type like '%tool%') group by ID) a;


#direct YTG links to tool usage
select ID from august2 where (((refer_url like '%youtube%') or (refer_url like '%google%')) and (refer_url not like 'accounts')) and ((req_URL like '%/invoke%') or (req_URL like '%session?sess=%')) group by ID;
#numbers of IDs that did direct YTG links to tool usage
select count(*) as 'direct YTG links tool usage count' from (select ID from august2 where (((refer_url like '%youtube%') or (refer_url like '%google%')) and (refer_url not like 'accounts')) and ((req_URL like '%/invoke%') or (req_URL like '%session?sess=%')) group by ID) a;


#returns the tool viewage breakdown from Direct YTG links
select a.req_tag , count(distinct a.ID) as distinct_ID from (SELECT * from august2 where (((refer_url like '%youtube%') or (refer_url like '%google%')) and (refer_url not like '%accounts%')) and (req_type like '%tool%')) a group by a.req_tag order by distinct_ID desc;


#return the tools usage breakdown from Direct YTG Links
select a.req_tag , count(distinct a.ID) as distinct_ID from (SELECT * from august2 where (((refer_url like '%youtube%') or (refer_url like '%google%')) and (refer_url not like 'accounts')) and ((req_URL like '%/invoke%') or (req_URL like '%session?sess=%'))) a group by a.req_tag order by distinct_ID desc;






select * from august1;
#this shows direct google and youtube links the tools that are utilized, ie click on a link and strait to tool usage
Select * from august2 where (refer_url like '%youtube%' or '%google%') and (req_type = 'tool') group by ID, req_tag;

#gets the unique ID that directly viewed a tool from a youtube/ google link
select * from august2 where ((refer_url like '%youtube%') or (refer_url like '%google%')) and (req_type = 'tool') group by ID;
select * from august1 where req = 'POST';

#gets the ammount of people who registered for VIP NanoHUB
select * from august1 where req_url like '%/register%' and  req = 'POST' group by IP;

#gets the ammount of people who can from outside links and registered for nanohub
select b.IP, a.refer_name, b.req_url, b.req from august1 a, august1 b where (b.req_url like '%/register%' and b.req = 'Post') and (a.IP = b.IP) and (a.refer_name != '') group by IP;

#gets the ammount of people who can from outside links and registered for nanohub, then used a tool
select c.IP, a.refer_name, b.req_url, b.req, c.req_type from august1 a, august1 b, august1 c where (b.req_url like '%/register%' and b.req = 'Post') and (a.IP = b.IP = c.IP) and (a.refer_name != '') and (c.req_type = 'tool');


SELECT 
    c.IP, a.refer_name, b.req_url, b.req, c.req_type
FROM
    august1 a,
    august1 b,
    august1 c
WHERE (a.IP = b.IP = c.IP) AND 
(b.req_url LIKE '%/register%' AND b.req = 'Post') 
    AND (a.refer_name != '') 
    AND (c.req_type = 'tool');
    
SELECT * FROM august1 a, august1 b, august1 c;
SELECT b.IP, b.req_type AS req_type, a.refer_name, b.req_url, b.req, b.req_type FROM august1 a, august1 b
WHERE (b.req_url LIKE '%/register%' AND b.req = 'Post') AND (a.IP = b.IP) or (a.refer_name != '') or b.req_type = 'tool';

select A.IP, A.req_type, A.refer_name, A.req_url, A.req from (
select b.IP as IP, b.req_type as req_type, a.refer_name as refer_name, b.req_url as req_url, b.req as req from august1 a, august1 b where (b.req_url like '%/register%' and b.req = 'Post') and (a.IP = b.IP) or (a.refer_name != '') or (b.req_type = 'tool')) A 
where A.req_type = 'tool' group by A.IP;



#shows the IPs, who did direct link to tool usage
Select request_date, request_time, IP, req, req_URL, RC, refer_name, refer_url, agent, req_type, req_tag, req_residue, resource_type, resource_title from august1 
where (refer_url like '%youtube%' or '%google%') and (req_type = 'tool') group by IP, Agent;