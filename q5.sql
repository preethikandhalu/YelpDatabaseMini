--QUERY 5. List top 10 5-star businesses that are reviewed by users between the ages of 20 and 25.
--Top means, businesses with the most number of reviews. Order by number of reviews (decreasing), 
--break ties by business ID (increasing). For each business, print its bid (business id), name, average number of stars, 
--and number of reviews.
CREATE FUNCTION CAL_AGE(DOB IN DATE)
RETURN NUMBER IS
BEGIN
  RETURN ((SYSDATE-DOB)/365);
END;
/

SELECT  * 
FROM(SELECT R.BUSINESS_ID,B.BUSINESS_NAME, R.STARS
     FROM REVIEWS R, BUSINESS B
	 WHERE R.BUSINESS_ID = B.BUSINESS_ID
	 AND R.STARS = 5
	 AND R.YELP_ID IN (SELECT YELP_ID
					  FROM YELP_USER
					  WHERE CAL_AGE(DOB) BETWEEN 20 AND 25)
	 GROUP BY R.BUSINESS_ID,B.BUSINESS_NAME, R.STARS)
WHERE ROWNUM <=10
;
