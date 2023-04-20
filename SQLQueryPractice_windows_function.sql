
/*Z tabeli Production.Product zwróæ kolumny ProductID, Name, 
ProductNumber, Color, SafetyStockLevel. Wyfiltruj rekordy, które maj¹ kolor 
taki jak produkt o numerze ‘FL-2301’, a ich SafetyStockLevel jest wiêkszy lub 
równy poziomowi produktu o nazwie ‘Chain’. U¿yj podzapytañ. */

select ProductID, Name, ProductNumber, Color, SafetyStockLevel
from Production.Product p1
where color = ALL (Select Color 
					   from Production.Product 
					   where ProductNumber like 'FL-2301')
and safetyStockLevel >= ALL (select SafetyStockLevel
							from Production.Product
							where name like 'Chain');


/*Zmodyfikuj zapytanie z poprzedniego æwiczenia i tym razem zwróæ 
rekordy, których kolor jest zgodny z kolorami produktów o kodach 
(ProductNumber) zaczynaj¹cych siê na literê C. Drugi warunek dotycz¹cy 
SafetyStockLevel ma zwracaæ rekordy, z wartoœci¹ mniejsz¹ lub równ¹ ka¿dej z 
wartoœci SafetyStockLevel produktów o ID powy¿ej 900. U¿yj zapytañ 
wielowierszowych. */


select ProductID, Name, ProductNumber, Color, 
SafetyStockLevel 
from Production.Product 
where 
Color in (select Color 
			from Production.Product 
			where ProductNumber like 'C%') 
and SafetyStockLevel <= ALL (select SafetyStockLevel 
							from Production.Product 
							where ProductID > 900);


select ProductID, Name, ProductNumber, Color, 
SafetyStockLevel 
from Production.Product 
where Color IN (select Color 
 from Production.Product 
 where ProductNumber like 'C%' 
 ) 
and SafetyStockLevel <= ALL (select SafetyStockLevel 
 from Production.Product 
 where ProductID > 900)

 /*Z tabeli Production.Product wyci¹gnij kolumny Name, 
ProductNumber, oraz ListPrice. Dodaj kolumnê rankingu, która najwy¿szym 
wartoœciom w kolumnie ListPrice przypisze wynik 1. Dopilnuj, aby w rankingu 
pojawi³y siê wartoœci wiêksze ni¿ 0, oraz kolejne miejsca nie by³y pomijane tzn. 
ma byæ 1, 2 ,3 itd. */

select Name, ProductNumber, ListPrice, ProductLine,
dense_rank() over (order by ProductLine asc) as MaxListPrice
from Production.Product
where ListPrice > 0 and ProductLine is not null
order by ProductLine

