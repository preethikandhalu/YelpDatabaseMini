--QUERY 6. List top 10 most travelled yelp users who checked in to 5-star businesses.
--Most travelled yelp users are those who have checked in businesses located in more than 5 distinct states. 
--Top means, yelp user with the highest number of checkins, break the ties by user ID.

SELECT * 
FROM(SELECT DISTINCT YUB.YELP_ID, U.FIRST_NAME , U.LAST_NAME,COUNT(YUB.CHECKED_IN_BUSINESS) AS NUM_0F_CHECKINS 
	 FROM YELP_USER_BUSINESS YUB, YELP_USER U 
	 WHERE U.YELP_ID = YUB.YELP_ID AND YUB.YELP_ID IN (SELECT DISTINCT YUB.YELP_ID
													   FROM YELP_USER U, BUSINESS B, YELP_USER_BUSINESS YUB
													   WHERE U.YELP_ID = YUB.YELP_ID AND YUB.CHECKED_IN_BUSINESS = B.BUSINESS_ID
													   GROUP BY YUB.YELP_ID
													   HAVING COUNT (B.ADDRESS_STATE)>=5) AND YUB.CHECKED_IN_BUSINESS IN (SELECT DISTINCT R.BUSINESS_ID 
																														  FROM REVIEWS R
																														  WHERE  STARS>=5)
GROUP BY YUB.YELP_ID,U.FIRST_NAME , U.LAST_NAME
ORDER BY COUNT(YUB.CHECKED_IN_BUSINESS) DESC , YUB.YELP_ID)
WHERE ROWNUM<=10;