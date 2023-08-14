create database Assessment3Db
use Assessment3Db
create table CompanyInfo
(CId int Primary key,
CName nvarchar(50) not null)
insert into CompanyInfo values (1,'Samsung'),(2,'HP'),(3,'Apple'),(4,'Dell'),(5,'Toshiba'),(6,'Redmi')
select *from CompanyInfo
drop table Productinfo
create table Productinfo
(PId int Primary key,
PName nvarchar(50) not null,
PPrice float not null,
PMDate date not null,
CId int foreign key references CompanyInfo(CId)) 
insert into ProductInfo values (101,'Laptop',55000.90,'12/12/2023',1)
insert into ProductInfo values (102,'Laptop',35000.90,'12/12/2012',2)
insert into ProductInfo values (103,'Mobile',15000.90,'12/03/2013',2)
insert into ProductInfo values (104,'Laptop',85000.90,'12/12/2012',3)
insert into ProductInfo values (105,'Earphone',75000.90,'12/12/2020',3)
insert into ProductInfo values (106,'Laptop',25000.90,'12/12/2021',3)
insert into ProductInfo values (107,'Mobile',65000.90,'12/12/2012',5)
insert into ProductInfo values (108,'Earphone',85000.90,'12/12/2012',5)
insert into ProductInfo values (109,'Mobile',95000.90,'12/12/2012',6)
select * from ProductInfo
select * from ProductInfo join CompanyInfo on ProductInfo.CId=CompanyInfo.CId
--select CName,PName from CompanyInfo cross join ProductInfo order by CName,PName
select * from ProductInfo p cross join CompanyInfo c
---------------------------------------------------------------------------------------
create table Products (
PId int Primary key,
PQ int,
PPrice float,
Discount float)
drop table Products
insert into Products (PId, PQ, PPrice, Discount) values 
(1, 10, 100.00, 10),
(2, 5, 50.00, 40),
(3, 20, 200.00, 30)
select * from Products
create function CalculateDiscount(@price float,@discountPercentage float)
returns float
as
begin
declare @discountedValue float
set @discountedValue = @price - (@price * (@discountPercentage / 100.0))
return @discountedValue
end
select PId, PPrice Price, Discount, dbo.CalculateDiscount(PPrice, Discount) as 'Price after Discount' from Products