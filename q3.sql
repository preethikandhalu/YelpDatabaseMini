--QUERY 3. List the users who are Male and complimented at least one female friend.
SELECT DISTINCT Y.YELP_ID
FROM YELP_USER Y, YELP_USER_COMPLIMENT C
WHERE Y.YELP_ID=C.YELP_ID AND Y.GENDER='M' AND (C.COMPLEMENTED_FRIEND IN (SELECT YELP_ID 
																		  FROM YELP_USER 
																		  WHERE GENDER='F'))
;