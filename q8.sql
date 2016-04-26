--QUERY 8. List all businesses in CA that are closed on Sunday and have touristy ambient with the highest number of 
--reviews from users not from CA. Order by the number of reviews from non-CA authors, break ties business ID.
SELECT DISTINCT R.BUSINESS_ID , B.BUSINESS_NAME, COUNT(DISTINCT R.REVIEW_ID) AS REVIEW_COUNT
FROM BUSINESS B, BUSINESS_DAYS_OF_OP O, REVIEWS R
WHERE O.BUSINESS_ID = B.BUSINESS_ID AND R.BUSINESS_ID = B.BUSINESS_ID AND B.ADDRESS_STATE = 'CA' AND B.AMBIENT_TYPE = 'TOURISTY' 
AND O.DAYS <> 'SUN' AND R.YELP_ID NOT IN (SELECT YELP_ID 
										  FROM YELP_USER 
										  WHERE BIRTHPLACE = 'CA'
										 )
GROUP BY R.BUSINESS_ID, B.BUSINESS_NAME
ORDER BY COUNT(DISTINCT R.REVIEW_ID) DESC, R.BUSINESS_ID
;
