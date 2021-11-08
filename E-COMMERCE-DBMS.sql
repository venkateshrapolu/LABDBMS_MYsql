


select *
from 
	`order`
    inner join product_details on `order`.prod_id = product_details.prod_id
    inner join product on product_details.pro_id = product.pro_id
where cus_id = 2;

select cus_gender, COUNT(*)
from 
	`order`,
    customer
where `order`.cus_id = customer.cus_id
and ord_amount >= 3000
group by customer.cus_gender;

select sup.supp_id,sup.supp_name,sup.supp_city,sup.supp_phone,count(prod.prod_id) count
  from `order-directory`.Supplier sup,`order-directory`.product pro, `order-directory`.product_details prod
where pro.pro_id = prod.pro_id
  and sup.SUPP_ID = prod.supp_id
  group by sup.supp_id, sup.supp_name,sup.supp_city,sup.supp_phone
  having count(prod.prod_id) > 1;
  
  select *
from 
	`order`
    inner join product_details on `order`.prod_id = product_details.prod_id
    inner join product on product_details.pro_id = product.pro_id
where cus_id = 2;

select  * from 
supplier join (select  supp_id , count(*) cnt_supplier from PRODUCT_DETAILS group by supp_id having count(*) > 1 ) product_cnt 
on supplier.supp_id = product_cnt.supp_id

select supp_id
from product_details
group by supp_id
having count(*) > 2;

select supp_id
from product_details
group by supp_id
having count(*) > 1;
select supplier.*
from supplier
where supp_id in (
	select supp_id
	from product_details
	group by supp_id
	having count(*) > 1
);

select *
from
	`order`
    inner join product_details on product_details.prod_id = `order`.prod_id
    inner join product on product_details.pro_id = product.pro_id
    inner join category on product.cat_id = category.cat_id
where ord_amount=(select min(ord_amount) from `order`
    inner join product_details on product_details.prod_id = `order`.prod_id
    inner join product on product_details.pro_id = product.pro_id
    inner join category on product.cat_id = category.cat_id);
    
    select *
from `order`
where ord_amount = (
	select min(ord_amount)
	from `order`
);

select o.*, c.*
from
	`order` as o
    inner join product_details as pd on o.prod_id = pd.prod_id
    inner join product as p on pd.pro_id = p.pro_id
    inner join category as c on p.cat_id = c.cat_id
where ord_amount = (
	select min(ord_amount)
	from `order`
);

 10)	Display the total order amount of the male customers.
select cus_gender, sum(ord_amount)
from `order` inner join customer on `order`.cus_id = customer.cus_id
where cus_gender = 'M';

