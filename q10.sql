--QUERY 10. List all yelp users who haven't reviewed any businesses but have provided at least 2 comments on 
--other user's reviews.
(SELECT DISTINCT YELP_ID
FROM YELP_USER
MINUS
SELECT DISTINCT YELP_ID
FROM REVIEWS)
INTERSECT
(SELECT COMMENTS
FROM REVIEW_COMMENTS
GROUP BY COMMENTS
HAVING COUNT(*)>1
);