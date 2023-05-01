use Proj_3;
SELECT retweet_count, text_body, screen_name, category
FROM tweets
INNER JOIN TwitterUser ON TwitterUser.screen_name = tweets.posting_user
ORDER BY retweet_count DESC LIMIT 10;

SELECT tag_name,COUNT(distinct state) as numstates,  GROUP_CONCAT(distinct state)
FROM hashtag_used
INNER JOIN tweets ON tweets.tweet_id = hashtag_used.tweet_id
INNER JOIN TwitterUser ON TwitterUser.screen_name = tweets.posting_user
WHERE year_posted = 2016 AND state != 'na'
GROUP BY tag_name
ORDER BY numstates DESC limit 10;

SELECT screen_name as names, state
FROM TwitterUser
INNER JOIN tweets ON tweets.posting_user = TwitterUser.screen_name
INNER JOIN hashtag_used ON hashtag_used.tweet_id = tweets.tweet_id
WHERE tag_name = 'iowacaucus' OR tag_name = 'iacaucus'
GROUP BY screen_name
ORDER BY followers DESC;

SELECT screen_name, sub_category, followers
FROM TwitterUser
WHERE sub_category = 'GOP'
ORDER BY followers DESC LIMIT 5;

SELECT screen_name, sub_category, followers
FROM TwitterUser
WHERE sub_category = 'Democrat'
ORDER BY followers DESC LIMIT 5;

SELECT count(t.tweet_id) as numTweets, tag_name
FROM hashtag_used h, tweets t
INNER JOIN TwitterUser ON TwitterUser.screen_name = t.posting_user
WHERE month_posted = 1 AND year_posted = 2016 AND state = 'Iowa' AND t.tweet_id = h.tweet_id
GROUP BY tag_name
ORDER BY numTweets DESC;

SELECT t.text_body, h.tag_name, t.posting_user, j.sub_category
FROM tweets t, hashtag_used h, TwitterUser j
WHERE (sub_category = 'GOP' OR sub_category = 'Democrat') AND month_posted = 2 AND year_posted = 2016 AND 
tag_name = 'Iowa' AND h.tweet_id = t.tweet_id AND j.screen_name = t.posting_user
GROUP BY t.posting_user, t.text_body, j.sub_category;


SELECT urls, numTweets, screen_name from
(SELECT count(t.tweet_id) as numTweets, t.posting_user
FROM tweets t 
WHERE t.posting_user in (SELECT posting_user FROM tweets INNER JOIN TwitterUser j ON t.posting_user = j.screen_name WHERE j.sub_category = 'GOP') 
GROUP BY posting_user
) t1 LEFT JOIN
(SELECT group_concat(u.url) as urls, j.screen_name
FROM url_used u
INNER JOIN tweets t on  t.tweet_id = u.tweet_id
INNER JOIN TwitterUser j on t.posting_user = j.screen_name
WHERE j.sub_category = 'GOP'
group by j.screen_name )t2 ON t1.posting_user = t2.screen_name
ORDER BY numTweets DESC;

SELECT tm.screen_name, COUNT(DISTINCT t.posting_user) AS num_users_mentioning, u.followers
FROM tweet_mentions tm
INNER JOIN tweets t ON tm.tweet_id = t.tweet_id
INNER JOIN TwitterUser u ON tm.screen_name = u.screen_name
GROUP BY tm.screen_name
ORDER BY num_users_mentioning DESC
LIMIT 10;

SELECT u.url, COUNT(distinct t.tweet_id) as nums
FROM url_used u
INNER JOIN tweets t ON t.tweet_id = u.tweet_id
GROUP BY u.url
ORDER BY nums DESC LIMIT 10








