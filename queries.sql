-- Query 1: JOIN
select booking_id, u.name as customer_name, v.name as vehicle_name, start_date, end_date, b.status from bookings as b
join users as u on b.user_id = u.user_id
join vehicles as v on b.vehicle_id = v.vehicle_id;
 
--  Query 2: EXISTS
select * from vehicles as v
where not exists (
  select * from bookings as b  where v.vehicle_id = b.vehicle_id
)

-- Query 3: WHERE
select * from vehicles as v 
where v.status = 'available' and v.type = 'car';

select * from vehicles as v 
where v.status = 'available' and v.type = 'bike';

select * from vehicles as v 
where v.status = 'available' and v.type = 'truck';

-- Query 4:  GROUP BY and HAVING
select v.name as vehicle_name, count(*) as total_bookings from bookings as b
join vehicles as v on b.vehicle_id = v.vehicle_id
group by v.vehicle_id
having count(*) > 2