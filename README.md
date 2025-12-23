# Vehicle Rental System - SQL Queries

## Project Overview
This project demonstrates SQL queries for managing a **vehicle rental system**.  
The system includes three main tables: `users`, `vehicles`, and `bookings`.  

- `users` stores customer and admin information.  
- `vehicles` stores details about each vehicle, including type, model, rental price, and availability.  
- `bookings` tracks vehicle reservations with dates, status, and total cost.

The queries cover important SQL concepts such as **JOINs, EXISTS, WHERE filtering, GROUP BY, and HAVING**.



## Queries

### Query 1: JOIN

```sql

select booking_id, u.name as customer_name, v.name as vehicle_name, start_date, end_date, b.status from bookings as b
join users as u on b.user_id = u.user_id
join vehicles as v on b.vehicle_id = v.vehicle_id;
```

### Explanation: 
#### Retrieve detailed booking information including the customer's name and the vehicle name.
- JOIN combines data from multiple tables.
- This query links bookings with users and vehicles to get human-readable information.
- The result shows each booking with customer name, vehicle name, booking dates, and status.


### Query 2: EXISTS
```sql
select * from vehicles as v
where not exists (
  select * from bookings as b  where v.vehicle_id = b.vehicle_id
)
```


### Explanation: 
#### Find all vehicles that have never been booked.
- EXISTS checks if a subquery returns any row.
- NOT EXISTS ensures only vehicles with no bookings are selected.
- Useful for identifying vehicles that are completely free.


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
### Explanation: 
#### Find available vehicles by type.
- WHERE filters rows based on specific conditions.-
- The query selects vehicles that are currently available and of a specific type (car, bike, or truck).-
- This is essential for showing available inventory to customers.


### Query 4: GROUP BY and HAVING
```sql
select v.name as vehicle_name, count(*) as total_bookings from bookings as b
join vehicles as v on b.vehicle_id = v.vehicle_id
group by v.vehicle_id
having count(*) > 2
```
### Explanation: 
#### Count total bookings per vehicle and filter vehicles with more than 2 bookings
- GROUP BY groups rows by vehicle.
- COUNT(*) calculates the number of bookings per vehicle.
- HAVING filters groups with more than 2 bookings.
- This query is useful for identifying high-demand vehicles.
