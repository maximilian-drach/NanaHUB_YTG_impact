use nanohub;

#try using a sub-query
#this list all the people who just used tool and clicked a ytg link
#the /invoke or session?sess=
#
#make sure not to include accounts.google.com

#selects the IDs of people who viewed tools and came from YTG links
Select b.ID from august2 a, august2 b where (a.ID = b.ID) and (((a.refer_url like '%youtube%') or (a.refer_url like '%google%')) and (a.refer_url not like '%accounts%')) and (b.req_type like '%tool%') group by b.ID;
#returns the number of IDs that did YTG indirect tool viewage
select count(*) as 'indirect YTG links tool viewage count' from (Select b.ID from august2 a, august2 b where (a.ID = b.ID) and (((a.refer_url like '%youtube%') or (a.refer_url like '%google%')) and (a.refer_url not like '%accounts%')) and (b.req_type like '%tool%') group by b.ID) a;

#returns the IDs of people who ran tools and came from YTG links
select b.ID from august2 a, august2 b where (a.ID = b.ID) and (((a.refer_url like '%youtube%') or (a.refer_url like '%google%')) and (a.refer_url not like 'accounts')) and ((b.req_URL like '%/invoke%') or (b.req_URL like '%session?sess=%')) group by b.ID;
#returns the number of IDs that did YTG indirect tool usage
select count(*) as 'indirect YTG links tool usage count' from (select b.ID from august2 a, august2 b where (a.ID = b.ID) and (((a.refer_url like '%youtube%') or (a.refer_url like '%google%')) and (a.refer_url not like '%accounts%')) and ((b.req_URL like '%/invoke%') or (b.req_URL like '%session?sess=%')) group by b.ID) a;

#returns the tool viewage breakdown from Indirect YTG links
select a.req_tag , count(distinct a.ID) as distinct_ID from (Select b.* from august2 a, august2 b where (a.ID = b.ID) and (((a.refer_url like '%youtube%') or (a.refer_url like '%google%')) and (a.refer_url not like '%accounts%')) and (b.req_type like '%tool%')) a group by a.req_tag order by distinct_ID desc;


#return the tools usage breakdown from Direct YTG Links
select a.req_tag , count(distinct a.ID) as distinct_ID from (Select b.* from august2 a, august2 b where (a.ID = b.ID) and (((a.refer_url like '%youtube%') or (a.refer_url like '%google%')) and (a.refer_url not like 'accounts')) and ((b.req_URL like '%/invoke%') or (b.req_URL like '%session?sess=%'))) a group by a.req_tag order by distinct_ID desc;









#what went on in a session and increasing the table







Select b.IP, a.request_date as ytg_refer_date, a.refer_url ytg_refer_url, b.request_date as tool_req_date, b.refer_url, b.req_type, b.req_URL, b.RC, b.req_tag
from august1 a, august1 b where (a.IP = b.IP) and (a.refer_url like '%youtube%' or '%google%') and (b.req_type = 'tool') group by b.IP;

#this list all the different tools used by people who used a ytg link in septmber
Select b.IP, a.request_date as ytg_refer_date, a.request_time, a.refer_url as ytg_refer_url, b.request_date as tool_req_date, b.request_time, b.refer_url, b.req_URL, b.RC, b.req_type, b.req_tag
from august1 a, august1 b where (a.IP = b.IP) and (a.refer_url like '%youtube%' or '%google%') and (b.req_type = 'tool') group by b.IP, b.req_tag;


Select *
from august1 a, august1 b where (a.IP = b.IP) 
and (a.refer_url like '%youtube%' or '%google%') and (b.req_type = 'tool');

#shaw256

Select * from august1 a inner join august1 b on a.IP = b.IP and a.Agent = b.Agent where (a.refer_url like '%youtube%' or '%google%') and (b.req_type = 'tool') group by b.IP, b.Agent;
show status;