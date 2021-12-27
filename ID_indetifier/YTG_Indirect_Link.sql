use nanohub;

#try using a sub-query
#this list all the people who just used tool and clicked a ytg link
#the /invoke or session?sess=
#
#make sure not to include accounts.google.com

#selects the IDs of people who viewed tools and came from YTG links
Select b.ID from august2 a, august2 b where (a.ID = b.ID) and (((a.refer_url like '%youtube%') or (a.refer_url like '%google%')) and (a.refer_url not like '%accounts%')) and (b.req_type like '%tool%') group by b.ID;
#returns the number of IDs that did YTG indirect tool viewage
select count(*) as 'indirect YTG links tool viewage count' from (Select b.ID from Appache_data a, Appache_data b where (a.ID = b.ID) and (((a.refer_url like '%youtube%') or (a.refer_url like '%google%')) and (a.refer_url not like '%accounts%')) and (b.req_type like '%tool%') group by b.ID) a;

#returns the IDs of people who ran tools and came from YTG links
select b.ID from august2 a, august2 b where (a.ID = b.ID) and (((a.refer_url like '%youtube%') or (a.refer_url like '%google%')) and (a.refer_url not like 'accounts')) and ((b.req_URL like '%/invoke%') or (b.req_URL like '%session?sess=%')) group by b.ID;
#returns the number of IDs that did YTG indirect tool usage
select count(*) as 'indirect YTG links tool usage count' from (select b.ID from Appache_data a, Appache_data b where (a.ID = b.ID) and (((a.refer_url like '%youtube%') or (a.refer_url like '%google%')) and (a.refer_url not like '%accounts%')) and ((b.req_URL like '%/invoke%') or (b.req_URL like '%session?sess=%')) group by b.ID) a;

#returns the tool viewage breakdown from Indirect YTG links
select a.req_tag , count(distinct a.ID) as distinct_ID from (Select b.* from august2 a, august2 b where (a.ID = b.ID) and (((a.refer_url like '%youtube%') or (a.refer_url like '%google%')) and (a.refer_url not like '%accounts%')) and (b.req_type like '%tool%')) a group by a.req_tag order by distinct_ID desc;


#return the tools usage breakdown from Direct YTG Links
select a.req_tag , count(distinct a.ID) as distinct_ID from (Select b.* from august2 a, august2 b where (a.ID = b.ID) and (((a.refer_url like '%youtube%') or (a.refer_url like '%google%')) and (a.refer_url not like 'accounts')) and ((b.req_URL like '%/invoke%') or (b.req_URL like '%session?sess=%'))) a group by a.req_tag order by distinct_ID desc;









#what went on in a session and increasing the table
