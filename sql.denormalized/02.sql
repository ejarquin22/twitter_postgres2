/*
 * Calculates the hashtags that are commonly used with the hashtag #coronavirus
 */
SELECT
    '#'|| taken_tag AS tag,
     COUNT(*) AS count
FROM (
    SELECT DISTINCT
       data ->> 'id',
        jsonb_array_elements(
            COALESCE(data->'entities'->'hashtags','[]') ||
            COALESCE(data->'extended_tweet'->'entities'->'hashtags','[]')
        )->>'text' AS taken_tag
    FROM tweets_jsonb
    WHERE (data -> 'entities' -> 'hashtags') @> '[{"text": "coronavirus"}]'
        OR (data -> 'extended_tweet' -> 'entities' -> 'hashtags') @> '[{"text": "coronavirus"}]'
    ) t
GROUP BY (1)
ORDER BY count DESC,tag
LIMIT 1000;
