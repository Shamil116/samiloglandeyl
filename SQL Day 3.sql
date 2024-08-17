-- salam
use code_train;
describe superstore;
select * from superstore;
-- 1. Superstore cədvəlinin yaradılma scriptini sorğulayın
show create table superstore;
-- 2. Autocommiti deaktivləşdirin
SET autocommit = 0;
-- 3. Kateqoriyası mebel və Daşınma növü Standart olan sifariş sayını Region və Şəhərə görə sorğulayın
Select Region, City, count(1) Say
from superstore
where Category = "Furniture" and ShipMode = "Standart Class"
group by Region, City;
-- 4. Region və şəhərə görə müştəri və Sifariş sayını sorğulayın. Müştəri sayı 10-dan yuxarı olan region və şəhər kombinasiyaları qalsın
Select Region, City, count(distinct CustomerID) Musteri_sayi, count(1) Sifaris_sayi
from superstore
group by Region, City
having Musteri_sayi >10;
-- 5. Sifariş tarixinin ilinə görə, Müştəri sayı, Sifariş sayı, Toplam Gəlir, Müştəri başı gəliri sorğulayın
select year(OrderDate), count(1) Musteri_sayi, sum(Quantity) Sifaris_sayi, sum(Profit) Toplam_gelir, round(avg(Profit),2) Musteri_basi_gelir
from superstore
group by year(OrderDate);
-- 6. Kateqoriyası ofi ləvazimatları və sub-kateqoriyası incəsənət olan sifarişlərdə, Daşınma növü və seqmentə görə maksimal və minimal endirimi sorğulayın.
select ShipMode, Segment, min(Discount), max(Discount)
from superstore
where Category= "Office Supplies" and SubCategory = "Art"
group by ShipMode, Segment;
-- 7. Məhsul kateqoriya və sub-kateqoriyaya görə sifariş sayı, toplam gəlir, və məhsul başı düşən gəliri hesablayın. İlk 10 nəticə qalsın
select Category, SubCategory, count(1) Sifaris_sayi, sum(Profit) Toplam_gelir, round(sum(Profit)/sum(Quantity),2) Musteri_basi_gelir
from superstore
group by Category, SubCategory
limit 10;
-- 8. Daşınma növü və regiona görə ortalama mənfəəti hesablayın.
select ShipMode, Region, round(avg(Profit),2) Avgg_menfeet
from superstore
group by ShipMode, Region;
-- 9. Unikal region və məhsul kateqoriyasını sorğulayın.
select distinct region, category
from superstore;
-- 10. Toplam sifariş sayı 100-dən çox olan ştatların siyahısını sorğulayın.
select State, sum(Quantity) Sifaris_sayi
from superstore
group by State
having Sifaris_sayi>100;
