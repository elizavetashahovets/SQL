-- 1. Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd
select model, speed, hd from pc where price<500;

-- 2. Найдите производителей принтеров. Вывести: maker
select maker from product where type ='printer' group by maker;

-- 3. Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
select model, ram, screen from laptop where price>1000;

-- 4. Найдите все записи таблицы Printer для цветных принтеров.
Select * from printer where color like 'y';

-- 5. Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
select model, speed, hd from pc where (cd='12x' or cd='24x') and price<600

-- 6. Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.
select distinct maker, speed from laptop
join product on product.model=laptop.model
where hd>=10

-- 7. Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
select pc.model, price from pc
join product on product.model=pc.model
where maker='B'
UNION
select laptop.model, price from laptop
join product on product.model=laptop.model
where maker='B'
UNION
select printer.model, price from printer
join product on product.model=printer.model
where maker='B'

-- 8. Найдите производителя, выпускающего ПК, но не ПК-блокноты.
select maker from product
where type='pc'
except
select maker from product
where type='laptop'

-- 9. Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
select distinct maker from pc
join product on product.model=pc.model
where speed>=450

-- 10. Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price
select model, price from printer
where price=(select max(price) from printer)

-- 11. Найдите среднюю скорость ПК.
Select avg(speed) from pc

-- 12. Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
select avg(speed) avg_speed from laptop where price>1000

-- 13. Найдите среднюю скорость ПК, выпущенных производителем A.
select avg(speed) avg_speed from pc 
join product on product.model=pc.model
where maker='A'

-- 14. Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.
select ships.class, name, country from ships
join classes on classes.class=ships.class
where numGuns>=10

-- 15. Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
select hd from pc
group by pc.hd having count(*)>=2

-- 16*. Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
select distinct pc_1.model, pc_2.model, pc_1.speed, pc_1.ram
from pc pc_1, pc pc_2
where pc_1.speed=pc_2.speed and pc_1.ram=pc_2.ram
and pc_1.model>pc_2.model

-- 17. Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК. Вывести: type, model, speed
select distinct type, laptop.model, speed from laptop
join product on product.model=laptop.model
where  speed<all(select speed from pc)

-- 18. Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price
select maker, price from printer 
join product on product.model=printer.model
where price=(select min(price) price from printer where color='y') and color='y' 
group by maker, price

-- 19. Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов. Вывести: maker, средний размер экрана.
select maker, avg(screen) avg_screen from laptop
join product on product.model=laptop.model
group by maker

-- 20. Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.
select maker, count(model) count_model from product
where type='pc'
group by maker
having count(model)>=3

-- 21. Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC. Вывести: maker, максимальная цена.
select maker, max(price) from pc
join product on product.model=pc.model
where type='pc'
group by maker

-- 22. Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена.
select speed, avg(price) avg_price from pc
where speed>600
group by speed

-- 23. Найдите производителей, которые производили бы как ПК со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц. Вывести: Maker
select maker from pc
join product on product.model=pc.model
where
type='pc' and speed>=750
INTERSECT
select maker from laptop
join product on product.model=laptop.model
where
type='laptop' and speed>=750

-- 24. Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.


-- 25. Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. Вывести: Maker
select distinct maker from pc 
join product on product.model=pc.model 
where maker in (select distinct maker from product where type='printer') and speed=(select max(speed) from pc where ram=(select min (ram) from pc)) and ram=(select min (ram) from pc)


-- 26.

-- 27. Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. Вывести: maker, средний размер HD.
select maker, avg(hd) from pc
join product on product.model=pc.model
where maker in(select maker from product where type='printer') 
group by maker

-- 28. Используя таблицу Product, определить количество производителей, выпускающих по одной модели.
select count(maker) from (select maker from product group by maker having count(*)=1) this_table

-- 29. 

-- 30.

-- 31. Для классов кораблей, калибр орудий которых не менее 16 дюймов, укажите класс и страну.
Select class, country from classes where bore>=16

-- 32. 

-- 33. Укажите корабли, потопленные в сражениях в Северной Атлантике (North Atlantic). Вывод: ship.
select ship from outcomes
where result='sunk' and battle='North Atlantic'

-- 34. 

-- 35. В таблице Product найти модели, которые состоят только из цифр или только из латинских букв (A-Z, без учета регистра).
Вывод: номер модели, тип модели.
Select model, type from product
where model not like '%[^0-9]%' or model not like '%[^a-z]%'

-- 36.

-- 37.

-- 38.














































