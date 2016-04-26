--QUERY 4. Find all the businesses whose reviewers have at least 1 friend in their friend list. 
--Order by number of reviews (decreasing), break ties by business ID (increasing). 
SELECT R.BUSINESS_ID, B.BUSINESS_NAME, COUNT(R.REVIEW_ID)
FROM REVIEWS R, BUSINESS B
WHERE B.BUSINESS_ID =R.BUSINESS_ID AND R.BUSINESS_ID IN (SELECT DISTINCT R.BUSINESS_ID
														 FROM REVIEWS R, BUSINESS B, YELP_USER Y, YELP_USER_FRIEND_LIST F
														 WHERE R.BUSINESS_ID=B.BUSINESS_ID
														 AND Y.YELP_ID=R.YELP_ID
														 AND Y.YELP_ID=F.YELP_ID
														 GROUP BY R.BUSINESS_ID
														 )
GROUP BY R.BUSINESS_ID, B.BUSINESS_NAME
ORDER BY COUNT(R.REVIEW_ID) DESC, R.BUSINESS_ID
;