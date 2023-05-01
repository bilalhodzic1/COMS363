MATCH(t:tweets)-[:posted_by]->(u:users) 
RETURN u.screen_name, u.category, u.sub_category, t.textbody, t.retweet_count ORDER BY t.retweet_count DESC LIMIT 10

MATCH (h:hashtags)<-[:hastag]-(t:tweets)-[:posted_by]->(u:users) WHERE t.posted.year = 2016 and not(u.ofstate = 'na') return h.tag_name, count(distinct u.ofstate) as counted, collect(DISTINCT u.ofstate) ORDER BY counted desc LIMIT 10

MATCH (u:users)<-[:posted_by]-(t:tweets)-[:hastag]->(h:hashtags)
where h.tag_name = 'iowacaucus' OR h.tag_name = 'iacaucus' WITH distinct u
return u.screen_name as screen_name, u.ofstate ORDER BY u.numFollowers DESC

MATCH (u:users)
WHERE u.sub_category = 'GOP' 
return u.screen_name, u.sub_category, u.numFollowers ORDER BY u.numFollowers DESC LIMIT 5

MATCH (u:users)
WHERE u.sub_category = 'democrat' 
return u.screen_name, u.sub_category, u.numFollowers ORDER BY u.numFollowers DESC LIMIT 5

MATCH (h:hashtags)<-[:hastag]-(t:tweets)-[:posted_by]->(u:users) 
WHERE t.posted.year = 2016 AND t.posted.month = 1  AND u.ofstate = 'Iowa' 
return h.tag_name, count(t.tid)

MATCH (u:users)<-[:posted_by]-(t:tweets)-[:hastag]->(h:hashtags) 
WHERE h.tag_name = 'Iowa' AND (u.sub_category = 'GOP' OR u.sub_category = 'Democrat') AND t.posted STARTS WITH '2016-02' return t.textbody, t.posting_user, u.sub_category, h.tag_name

MATCH (u:users)<-[:posted_by]-(t:tweets) WHERE u.sub_category = 'GOP' 
OPTIONAL MATCH (d:users)<-[:posted_by]-(m:tweets)-[:hasurl]->(j:urls) where d.sub_category = 'GOP' and u.screen_name = d.screen_name and t.tid = m.tid
return u.screen_name, count(distinct t.tid) as tweets, collect(distinct j.url) ORDER BY tweets DESC

MATCH (u:users)
MATCH (d:users)<-[:mentions]-(t:tweets)-[:posted_by]->(m:users) 
WHERE not (m.screen_name = u.screen_name) AND d.screen_name = u.screen_name
return u.screen_name, count(distinct m.screen_name) as mentioned ORDER BY mentioned DESC LIMIT 10

MATCH (u:urls)<-[:hasurl]-(t:tweets)-[:posted_by]->(m:users) 
WHERE m.sub_category = 'GOP' AND(t.posted.month = 1 OR t.posted.month = 2 OR t.posted.month = 3) AND t.posted.year = 2016
return u.url, count(t.tid) as counted ORDER BY counted DESC LIMIT 10