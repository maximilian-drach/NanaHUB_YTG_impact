use nanohub;

#length 
#take the angent string, take a hash
#take the IP and agent, and assing a unique id
#what are the most poupluar urls
#filter by uniquie idenfiter 
#agian the moist popleur
#cennect the biggest dots

#look for session, histogram of the sessions
#take a small handful session


select distinct req_type from july1;

select req_URL, count(*) as 'value_occurrence' from july1 where (req_URL not like '/api%') and (req_URL not like '/core%') and (req_URL not like '/app%') group by req_URL order by count(*) desc limit 20;


#top 100 most popular URLS
select req_URL, count(req_URL) as 'value_occurrence' from july1 where req_type != 'noise' group by req_URL order by count(req_URL) desc limit 100;


select A.req_URL, count(*) as 'value_occurrence' from (select req_URL, count(*) as 'value_occurrence' from july1 where req_type != 'noise' group by req_URL order by count(*) desc limit 100) A, july1 B where (A.req_URL = B.req_URL) group by B.IP, B.Agent;