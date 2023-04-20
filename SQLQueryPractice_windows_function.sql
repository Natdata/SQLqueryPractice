
/*Z tabeli Production.Product zwr�� kolumny ProductID, Name, 
ProductNumber, Color, SafetyStockLevel. Wyfiltruj rekordy, kt�re maj� kolor 
taki jak produkt o numerze �FL-2301�, a ich SafetyStockLevel jest wi�kszy lub 
r�wny poziomowi produktu o nazwie �Chain�. U�yj podzapyta�. */

select ProductID, Name, ProductNumber, Color, SafetyStockLevel
from Production.Product p1
where color = ALL (Select Color 
					   from Production.Product 
					   where ProductNumber like 'FL-2301')
and safetyStockLevel >= ALL (select SafetyStockLevel
							from Production.Product
							where name like 'Chain');


/*Zmodyfikuj zapytanie z poprzedniego �wiczenia i tym razem zwr�� 
rekordy, kt�rych kolor jest zgodny z kolorami produkt�w o kodach 
(ProductNumber) zaczynaj�cych si� na liter� C. Drugi warunek dotycz�cy 
SafetyStockLevel ma zwraca� rekordy, z warto�ci� mniejsz� lub r�wn� ka�dej z 
warto�ci SafetyStockLevel produkt�w o ID powy�ej 900. U�yj zapyta� 
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

 /*Z tabeli Production.Product wyci�gnij kolumny Name, 
ProductNumber, oraz ListPrice. Dodaj kolumn� rankingu, kt�ra najwy�szym 
warto�ciom w kolumnie ListPrice przypisze wynik 1. Dopilnuj, aby w rankingu 
pojawi�y si� warto�ci wi�ksze ni� 0, oraz kolejne miejsca nie by�y pomijane tzn. 
ma by� 1, 2 ,3 itd. */

select Name, ProductNumber, ListPrice, ProductLine,
dense_rank() over (order by ProductLine asc) as MaxListPrice
from Production.Product
where ListPrice > 0 and ProductLine is not null
order by ProductLine

