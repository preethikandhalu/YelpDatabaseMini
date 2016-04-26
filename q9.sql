--QUERY 9. Find the businesses whose average rating was doubled from May 2015 to June 2015 and has the most no. 
--of checkins. Average rating is the average numbers of stars from all reviews given to a particular business.
 
 (SELECT DISTINCT R.BUSINESS_ID, 2* AVG(R.STARS) AS DOUBLED_AVG_STARS
 FROM REVIEWS R, YELP_USER_BUSINESS YUB
 WHERE YUB.CHECKED_IN_BUSINESS = R.BUSINESS_ID AND R.PUB_DATE = TO_DATE('MAY-05-15 17:15:00', 'MM-DD-YY hh24:mi:ss')
 GROUP BY R.BUSINESS_ID)
INTERSECT
(SELECT DISTINCT R.BUSINESS_ID, AVG(R.STARS)
 FROM REVIEWS R, YELP_USER_BUSINESS YUB
 WHERE YUB.CHECKED_IN_BUSINESS = R.BUSINESS_ID AND R.PUB_DATE = TO_DATE('JUN-07-15 17:15:00', 'MM-DD-YY hh24:mi:ss')
 GROUP BY R.BUSINESS_ID)
 ;