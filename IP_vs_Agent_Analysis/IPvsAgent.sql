use nanohub;


#unique IPs and unique agent, comapre the numbers

#unique agent numbers vs unique IP & Agent
#count up unique agent numbers vs unique IP & Agent
#count(*) etc
#histogram, agent and number of IP associated with it
#the number of agent with 1 IP vs 2 IP vs 3 IPs
#then the number of IPs with diffent agent string
#93302

#number of distinct IP
select count(*) as 'distinct IPs' from (select distinct IP from august1) a;
#number of distinct Agents
select count(*) as 'distinct Agents' from (select distinct agent from august1) a;
#number of distinct agents and IPs
select count(distinct IP) as distinct_IP, count(distinct agent) as distinct_agent from august1;

#returns the agent and the number of distinct IPs associated with an agent
select agent, count(distinct IP) as distinct_IP from august1 group by agent order by distinct_IP desc;

#returns the IP and the number of distinct agents associated with an IP
select IP, count(distinct agent) as distinct_agent from august1 group by IP order by distinct_agent desc;