--QUERY 2. Find the users who were born in CA but never visited CA.
SELECT YELP_ID
FROM YELP_USER
WHERE BIRTHPLACE='CA'
MINUS
SELECT DISTINCT YELP_ID
FROM YELP_USER_BUSINESS
WHERE CHECKED_IN_BUSINESS =ANY(SELECT BUSINESS_ID 
							   FROM BUSINESS 
							   WHERE ADDRESS_STATE='CA')
;