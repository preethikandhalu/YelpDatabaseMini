--QUERY 1. Count the number of businesses having business category name as “National Parks” situated in Arizona.
SELECT COUNT(*)
FROM BUSINESS B, BUSINESS_CATEGORY C
WHERE B.BUSINESS_CATEGORY=C.BUSINESS_CATEGORY_ID AND B.ADDRESS_STATE='AZ' AND C.BUSINESS_CATEGORY_NAME='NATIONAL PARKS'
;