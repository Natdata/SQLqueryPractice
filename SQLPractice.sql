
select [IdOsoby], Imię, Nazwisko
from Osoby
where IdOsoby not in (select [IdUczestnika] from [dbo].[Wydarzenie_Uczestnicy]);

SELECT o.Imię, o.Nazwisko
FROM Wydarzenie_Uczestnicy wu
      RIGHT JOIN Osoby o
            ON o.IdOsoby = wu.IdUczestnika
WHERE IdWydarzenia IS NULL

--Znajdź wszystkie filmy, które mają średnią ocenę powyżej 4

select f.IdFilmy, f.Tytul, avg(r.Ocena) as srednia_ocena
from Recenzje r 
left join Film_Premiera fp on fp.IdFilm_Premiera = r.IdFilm_Premiera
join Filmy f on f.IdFilmy = fp.IdFilmu
group by f.IdFilmy, f.Tytul
having avg(r.Ocena) > 4


SELECT f.Tytul, AVG(r.Ocena) as SredniaOcena
FROM Filmy f
    INNER JOIN Film_Premiera fp 
        ON f.IdFilmy = fp.IdFilmu
    INNER JOIN Recenzje r 
        ON fp.IdFilm_Premiera = r.IdFilm_Premiera
GROUP BY f.Tytul
HAVING AVG(r.Ocena) > 4

-- Jaki jest średni czas trwania filmów wydanych po roku 2000

select avg(CzasTrwania_min)
from Filmy
where RokProdukcji > 2000

-- Znajdź 5 filmów z największą liczbą aktorów

select top 5 IdFilmu, count(IdAktora) as ilosc_aktorow
from Film_Aktor
group by IdFilmu
order by ilosc_aktorow desc;

SELECT TOP 5 f.Tytul, 
    COUNT(*) as LiczbaAktorow
FROM Filmy f
    INNER JOIN Film_Aktor FA 
        ON f.IdFilmy = fa.IdFilmu
GROUP BY f.Tytul
ORDER BY COUNT(*) DESC;

-- Znajdź filmy, które nie mają jeszcze recenzji
select *
from Film_Premiera fp
left join Recenzje r on fp.IdFilm_Premiera = r.IdFilm_Premiera
where r.IdRecenzje is NULL


-- Pokaż filmy trwające dłużej niż średni czas trwania wszystkich filmów

select Tytul
from Filmy
where CzasTrwania_min > (select avg([CzasTrwania_min])
						from Filmy)







