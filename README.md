---

## Project Overview
This project demonstrates SQL queries for managing a **vehicle rental system**.  
The system includes three main tables: `users`, `vehicles`, and `bookings`.  

- `users` stores customer and admin information.  
- `vehicles` stores details about each vehicle, including type, model, rental price, and availability.  
- `bookings` tracks vehicle reservations with dates, status, and total cost.

The queries cover important SQL concepts such as **JOINs, EXISTS, WHERE filtering, GROUP BY, and HAVING**.

---

## Queries

### Query 1: JOIN

```sql

select booking_id, u.name as customer_name, v.name as vehicle_name, start_date, end_date, b.status from bookings as b
join users as u on b.user_id = u.user_id
join vehicles as v on b.vehicle_id = v.vehicle_id;
```



### Query 2: EXISTS
```sql
select * from vehicles as v
where not exists (
  select * from bookings as b  where v.vehicle_id = b.vehicle_id
)
```

### Query 3: EXISTS
```sql
select 
select * from vehicles as v 
where v.status = 'available' and v.type = 'car';

select * from vehicles as v 
where v.status = 'available' and v.type = 'bike';

select * from vehicles as v 
where v.status = 'available' and v.type = 'truck';
```


### Query 4: GROUP BY and HAVING
```sql
select v.name as vehicle_name, count(*) as total_bookings from bookings as b
join vehicles as v on b.vehicle_id = v.vehicle_id
group by v.vehicle_id
having count(*) > 2
```
