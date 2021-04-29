
CREATE INDEX tweets_jsonb_idx_text ON tweets_jsonb USING GIN(to_tsvector('english', data->>'text'));
CREATE INDEX tweets_jsonb_idx_hashtags ON tweets_jsonb USING GIN((data -> 'extended_tweet' -> 'entities' -> 'hashtags'));
CREATE INDEX twees_jsonb_idx_full_text ON tweets_jsonb USING GIN(to_tsvector('english', (data->'extended_tweet' ->> 'full_text')));

