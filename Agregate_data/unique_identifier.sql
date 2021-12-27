use nanohub;

create table users( ID int not null auto_increment, IP varchar(16), agent varchar(700), primary key (ID), unique(IP,agent));
drop table users;


select IP, Agent from july1 group by IP, Agent;
#inserts july values into the users
insert into users(IP, agent) select IP, Agent from july1 group by IP, Agent;


select IP, agent from august1 group by IP, agent;
#inserts the august data into the users
insert into users(IP,agent) select a.IP, a.agent from (select IP, agent from august1 group by IP, agent) a left join users b on (a.IP=b.IP and a.agent = b.agent) where (b.IP is NULL and b.agent is NULL);

#inserts september into it
insert into users(IP,agent) select a.IP, a.agent from (select IP, agent from september1 group by IP, agent) a left join users b on (a.IP=b.IP and a.agent = b.agent) where (b.IP is NULL and b.agent is NULL);

select * from users;

#tell how many times a user signs in
#user_id, how many times they login, look in th quilify data it says login,NEW TABLE 
#how many have logged in and how many logged in multiple times
#picking up people logining with accont.google

#if they came in and then used anthoer tools afterwards
#looking for similities and patterns in the same tool runs
#delete the russian spam https://www.youtube.com/channel/UC3tNvNFjVHJN_5qy3qNEDyw
#russian spams
select b.IP, a.ID from Appache_data a, Appache_data b where a.ID = b.ID and a.refer_url = 'https://www.youtube.com/channel/UC3tNvNFjVHJN_5qy3qNEDyw';
select * from Appache_data;
select count(distinct ID), count(distinct IP), count(distinct agent) from Appache_data where refer_url = 'https://www.youtube.com/channel/UC3tNvNFjVHJN_5qy3qNEDyw';