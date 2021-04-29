
CREATE INDEX tweets_idx_id_tweets ON tweets(id_tweets);
CREATE INDEX tweets_idx_text ON tweets USING GIN(to_tsvector('english', text ));
CREATE INDEX tweet_tags_idx_id_tweets ON tweet_tags(id_tweets);
CREATE INDEX tweets_tags_idx ON tweet_tags(tag, id_tweets);
