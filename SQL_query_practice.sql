select ProductID, sum(StandardCost)
from Production.ProductCostHistory
group by ProductID;

select floor(ProductID/10)*10 as bin, round(sum(StandardCost),2) as suma
from Production.ProductCostHistory
group by floor(ProductID/10)*10