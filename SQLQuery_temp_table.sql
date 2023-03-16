-- Create Temp Table 

SELECT vendor_id,
Product_id,
sum(quantity * original_price) as WholePayment
FROM farmers_market.vendor_inventory
group by 1,2;

 
IF (SELECT object_id('TempDB..#Temp_WholePayment ')) IS NOT NULL
BEGIN
    DROP TABLE #Temp_WholePayment 
END
Create Table #Temp_WholePayment 
(
VendorID int,
ProductID int,
WholePayment float)

Insert Into #Temp_WholePayment
SELECT vendor_id,
Product_id,
sum(quantity * original_price) as WholePayment
FROM farmers_market.vendor_inventory
group by 1,2;

Select *
From #Temp_WholePayment
