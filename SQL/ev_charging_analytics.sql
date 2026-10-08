create database EV_Charging_Analytics;
use EV_Charging_Analytics;

create table Customers( Customer_id int primary key auto_increment,
                        Customer_name varchar(100) not null,
                        Gender varchar(10),
                        City varchar(50),
                        State varchar(50),
                        Signup_date Date);

create table Vehicles ( Vehicles_id int primary key auto_increment,
                        Customer_id int,
                        Vehicles_model varchar(100) not null,
                        Vehicles_type varchar(100),
                        Battery_Capacity_kwh decimal(5,2),
                        Foreign key (Customer_id) references Customers (Customer_id));

Create table Charging_Stations ( Station_id int primary key auto_increment,
                                 Station_name varchar(100) not null,
                                 City varchar(50) not null,
                                 State varchar(50) not null,
                                 Charge_type varchar(50),
                                 Total_Charges int);
								
create table Charging_Session ( Session_id int primary key auto_increment,
                                Customer_id int not null,
                                Vehicles_id int not null,
                                Station_id int not null,
                                Start_time datetime not null,
                                End_time datetime not null,
                                Energy_Consumed_kwh decimal(6,2),
                                Charging_Cost decimal(10,2),
                                
                                foreign key (Customer_id) references Customers(Customer_id),
                                
                                foreign key (Vehicles_id) references Vehicles(Vehicles_id),
                                
                                foreign key (Station_id) references Charging_Stations(Station_id));

create table Payments ( Payment_id int primary key auto_increment,
						Session_id int not null,
                        Payment_Date datetime not null,
                        Payment_Method varchar(30),
                        Payment_Status varchar(20),
                        Amount_Paid Decimal(10,2),
                        
                        foreign key (Session_id) references Charging_Session(Session_id));

create table Energy_Usage ( Usage_id int primary key auto_increment,
                            Station_id int not null,
                            Usage_date datetime not null,
                            Total_Energy_kwh Decimal(10,2),
                            Peak_Energy_kwh Decimal(10,2),
                            
                            foreign key (Station_id) references Charging_Stations(Station_id));

Alter table Energy_Usage Modify Usage_Date date not null;

INSERT INTO Customers
(Customer_name, Gender, City, State, Signup_date)
VALUES
('Arun Kumar', 'Male', 'Coimbatore', 'Tamil Nadu', '2026-01-15'),
('Priya Sharma', 'Female', 'Chennai', 'Tamil Nadu', '2026-01-22'),
('Rahul Verma', 'Male', 'Bangalore', 'Karnataka', '2026-02-05'),
('Sneha Raj', 'Female', 'Madurai', 'Tamil Nadu', '2026-02-18'),
('Vijay Kumar', 'Male', 'Salem', 'Tamil Nadu', '2026-03-02'),
('Ananya Rao', 'Female', 'Hyderabad', 'Telangana', '2026-03-15'),
('Karthik S', 'Male', 'Trichy', 'Tamil Nadu', '2026-03-28'),
('Divya Nair', 'Female', 'Kochi', 'Kerala', '2026-04-10'),
('Suresh Babu', 'Male', 'Bangalore', 'Karnataka', '2026-04-21'),
('Meena Krishnan', 'Female', 'Chennai', 'Tamil Nadu', '2026-05-03'),
('Aditya Menon', 'Male', 'Kochi', 'Kerala', '2026-05-12'),
('Kavya Reddy', 'Female', 'Hyderabad', 'Telangana', '2026-05-20'),
('Manoj Raj', 'Male', 'Coimbatore', 'Tamil Nadu', '2026-06-01'),
('Aishwarya V', 'Female', 'Madurai', 'Tamil Nadu', '2026-06-08'),
('Naveen Prakash', 'Male', 'Bangalore', 'Karnataka', '2026-06-15'),
('Harini Kumar', 'Female', 'Salem', 'Tamil Nadu', '2026-06-22'),
('Rohit Singh', 'Male', 'Chennai', 'Tamil Nadu', '2026-07-01'),
('Pooja Das', 'Female', 'Kochi', 'Kerala', '2026-07-10'),
('Gokul Krishna', 'Male', 'Coimbatore', 'Tamil Nadu', '2026-07-18'),
('Lakshmi Devi', 'Female', 'Hyderabad', 'Telangana', '2026-07-25');

select * from  Customers;

INSERT INTO Vehicles
(Customer_id, Vehicles_model, Vehicles_type, Battery_Capacity_kwh)
VALUES
(1, 'Tata Nexon EV', 'SUV', 40.50),
(2, 'MG ZS EV', 'SUV', 50.30),
(3, 'Hyundai Ioniq 5', 'SUV', 72.60),
(4, 'Tata Tiago EV', 'Hatchback', 24.00),
(5, 'Mahindra XUV400 EV', 'SUV', 39.40),
(6, 'BYD Atto 3', 'SUV', 60.48),
(7, 'Tata Punch EV', 'SUV', 35.00),
(8, 'Kia EV6', 'SUV', 77.40),
(9, 'MG Comet EV', 'Hatchback', 17.30),
(10, 'Hyundai Kona Electric', 'SUV', 39.20),
(11, 'Citroen eC3', 'Hatchback', 29.20),
(12, 'Tata Curvv EV', 'SUV', 55.00),
(13, 'Tata Nexon EV', 'SUV', 40.50),
(14, 'Mahindra BE 6', 'SUV', 59.00),
(15, 'BYD Seal', 'Sedan', 82.56),
(16, 'Tata Punch EV', 'SUV', 35.00),
(17, 'Hyundai Creta Electric', 'SUV', 51.40),
(18, 'MG Windsor EV', 'SUV', 38.00),
(19, 'Tata Tiago EV', 'Hatchback', 24.00),
(20, 'Kia EV6', 'SUV', 77.40);

select * from  Vehicles;

select C.Customer_name, V.Vehicles_model, V.Battery_Capacity_kwh from Customers as C
Join Vehicles as V on C.Customer_id=V.Customer_id;

INSERT INTO Charging_Stations
(Station_name, City, State, Charge_type, Total_Charges)
VALUES
('Coimbatore EV Hub', 'Coimbatore', 'Tamil Nadu', 'DC Fast', 12),
('Chennai Green Charge', 'Chennai', 'Tamil Nadu', 'DC Fast', 20),
('Bangalore Power Station', 'Bangalore', 'Karnataka', 'Super Fast', 24),
('Madurai EV Point', 'Madurai', 'Tamil Nadu', 'AC', 8),
('Salem Charge Zone', 'Salem', 'Tamil Nadu', 'DC Fast', 10),
('Hyderabad EV Plaza', 'Hyderabad', 'Telangana', 'Super Fast', 18),
('Trichy Green Energy', 'Trichy', 'Tamil Nadu', 'AC', 6),
('Kochi EV Station', 'Kochi', 'Kerala', 'DC Fast', 14),
('Bangalore Green Charge', 'Bangalore', 'Karnataka', 'DC Fast', 16),
('Chennai EV Power Hub', 'Chennai', 'Tamil Nadu', 'Super Fast', 22);

select * from Charging_Stations;

select * from Charging_Stations where State = "Tamil Nadu";

INSERT INTO Charging_Session (Customer_id, Vehicles_id, Station_id, Start_time, End_time, Energy_Consumed_kwh, Charging_Cost)
VALUES (1, 1, 1, '2026-07-01 08:15:00', '2026-07-01 09:10:00', 28.50, 456.00),
(2, 2, 2, '2026-07-01 18:20:00', '2026-07-01 19:35:00', 36.80, 588.80),
(3, 3, 3, '2026-07-02 07:45:00', '2026-07-02 08:50:00', 48.20, 819.40),
(4, 4, 4, '2026-07-02 20:10:00', '2026-07-02 21:05:00', 18.60, 279.00),
(5, 5, 5, '2026-07-03 10:30:00', '2026-07-03 11:40:00', 30.40, 486.40),
(6, 6, 6, '2026-07-03 17:50:00', '2026-07-03 19:00:00', 45.60, 775.20),
(7, 7, 7, '2026-07-04 09:20:00', '2026-07-04 10:15:00', 22.80, 342.00),
(8, 8, 8, '2026-07-04 19:30:00', '2026-07-04 20:50:00', 51.20, 819.20),
(9, 9, 9, '2026-07-05 08:40:00', '2026-07-05 09:20:00', 13.50, 216.00),
(10, 10, 10, '2026-07-05 18:10:00', '2026-07-05 19:20:00', 32.40, 550.80),
(11, 11, 8, '2026-07-06 11:15:00', '2026-07-06 12:05:00', 20.80, 332.80),
(12, 12, 6, '2026-07-06 20:00:00', '2026-07-06 21:25:00', 42.50, 722.50),
(13, 13, 1, '2026-07-07 07:30:00', '2026-07-07 08:35:00', 29.60, 473.60),
(14, 14, 5, '2026-07-07 17:40:00', '2026-07-07 18:55:00', 39.80, 636.80),
(15, 15, 3, '2026-07-08 18:25:00', '2026-07-08 19:50:00', 52.60, 894.20),
(16, 16, 7, '2026-07-08 09:10:00', '2026-07-08 10:00:00', 21.40, 321.00),
(17, 17, 10, '2026-07-09 19:15:00', '2026-07-09 20:30:00', 35.70, 606.90),
(18, 18, 8, '2026-07-09 13:20:00', '2026-07-09 14:10:00', 24.30, 388.80),
(19, 19, 1, '2026-07-10 08:05:00', '2026-07-10 08:55:00', 19.80, 316.80),
(20, 20, 2, '2026-07-10 18:45:00', '2026-07-10 20:00:00', 44.20, 707.20),
(1, 1, 3, '2026-07-11 17:30:00', '2026-07-11 18:40:00', 31.50, 535.50),
(2, 2, 1, '2026-07-11 09:25:00', '2026-07-11 10:35:00', 34.70, 555.20),
(3, 3, 6, '2026-07-12 20:15:00', '2026-07-12 21:35:00', 50.30, 855.10),
(4, 4, 4, '2026-07-12 12:10:00', '2026-07-12 12:55:00', 16.90, 253.50),
(5, 5, 5, '2026-07-13 18:05:00', '2026-07-13 19:20:00', 33.60, 537.60),
(6, 6, 9, '2026-07-13 07:50:00', '2026-07-13 09:05:00', 47.80, 812.60),
(7, 7, 10, '2026-07-14 19:40:00', '2026-07-14 20:30:00', 25.50, 433.50),
(8, 8, 2, '2026-07-14 10:20:00', '2026-07-14 11:40:00', 49.70, 795.20),
(9, 9, 9, '2026-07-15 16:30:00', '2026-07-15 17:10:00', 12.80, 204.80),
(10, 10, 6, '2026-07-15 18:50:00', '2026-07-15 20:05:00', 37.40, 635.80);

select * from Charging_Session;

INSERT INTO Payments (Session_id, Payment_Date, Payment_Method, Payment_Status, Amount_Paid)
VALUES (1, '2026-07-01 09:15:00', 'UPI', 'Completed', 456.00),
(2, '2026-07-01 19:40:00', 'Credit Card', 'Completed', 588.80),
(3, '2026-07-02 09:00:00', 'UPI', 'Completed', 819.40),
(4, '2026-07-02 21:15:00', 'Debit Card', 'Completed', 279.00),
(5, '2026-07-03 11:50:00', 'UPI', 'Completed', 486.40),
(6, '2026-07-03 19:10:00', 'Credit Card', 'Completed', 775.20),
(7, '2026-07-04 10:25:00', 'Wallet', 'Completed', 342.00),
(8, '2026-07-04 21:00:00', 'UPI', 'Completed', 819.20),
(9, '2026-07-05 09:30:00', 'Debit Card', 'Completed', 216.00),
(10, '2026-07-05 19:30:00', 'UPI', 'Completed', 550.80),
(11, '2026-07-06 12:15:00', 'Wallet', 'Completed', 332.80),
(12, '2026-07-06 21:35:00', 'Credit Card', 'Completed', 722.50),
(13, '2026-07-07 08:45:00', 'UPI', 'Completed', 473.60),
(14, '2026-07-07 19:05:00', 'Debit Card', 'Completed', 636.80),
(15, '2026-07-08 20:00:00', 'Credit Card', 'Completed', 894.20),
(16, '2026-07-08 10:10:00', 'UPI', 'Completed', 321.00),
(17, '2026-07-09 20:40:00', 'Wallet', 'Completed', 606.90),
(18, '2026-07-09 14:20:00', 'UPI', 'Completed', 388.80),
(19, '2026-07-10 09:10:00', 'Debit Card', 'Completed', 316.80),
(20, '2026-07-10 20:10:00', 'Credit Card', 'Completed', 707.20),
(21, '2026-07-11 18:50:00', 'UPI', 'Completed', 535.50),
(22, '2026-07-11 10:45:00', 'Wallet', 'Completed', 555.20),
(23, '2026-07-12 21:50:00', 'Credit Card', 'Completed', 855.10),
(24, '2026-07-12 13:10:00', 'UPI', 'Completed', 253.50),
(25, '2026-07-13 19:35:00', 'Debit Card', 'Completed', 537.60),
(26, '2026-07-13 09:20:00', 'UPI', 'Completed', 812.60),
(27, '2026-07-14 20:45:00', 'Wallet', 'Completed', 433.50),
(28, '2026-07-14 11:55:00', 'Credit Card', 'Completed', 795.20),
(29, '2026-07-15 17:25:00', 'UPI', 'Completed', 204.80),
(30, '2026-07-15 20:20:00', 'Debit Card', 'Completed', 635.80);

select * from  Payments;

INSERT INTO Energy_Usage (Station_id, Usage_date, Total_Energy_kwh, Peak_Energy_kwh)
VALUES (1, '2026-07-01', 285.50, 52.40),
(1, '2026-07-02', 312.80, 61.20),
(1, '2026-07-03', 298.60, 58.70),
(2, '2026-07-01', 420.30, 78.50),
(2, '2026-07-02', 455.70, 86.20),
(2, '2026-07-03', 438.90, 82.60),
(3, '2026-07-01', 510.80, 95.40),
(3, '2026-07-02', 548.60, 102.30),
(3, '2026-07-03', 525.40, 98.70),
(4, '2026-07-01', 165.40, 31.80),
(4, '2026-07-02', 182.70, 35.60),
(4, '2026-07-03', 174.50, 33.90),
(5, '2026-07-01', 248.60, 46.70),
(5, '2026-07-02', 265.30, 51.40),
(5, '2026-07-03', 257.80, 49.20),
(6, '2026-07-01', 390.50, 74.60),
(6, '2026-07-02', 425.80, 81.30),
(6, '2026-07-03', 412.40, 78.90),
(7, '2026-07-01', 135.80, 26.40),
(7, '2026-07-02', 148.60, 28.90),
(7, '2026-07-03', 142.30, 27.50),
(8, '2026-07-01', 320.70, 62.80),
(8, '2026-07-02', 345.90, 68.40),
(8, '2026-07-03', 334.60, 65.70),
(9, '2026-07-01', 365.40, 70.20),
(9, '2026-07-02', 382.70, 74.60),
(9, '2026-07-03', 374.80, 72.90),
(10, '2026-07-01', 475.60, 89.30),
(10, '2026-07-02', 498.40, 94.70),
(10, '2026-07-03', 487.20, 92.10);

select * from Energy_Usage;

# To Check Total number of Records
select Count(*) as Total_number_of_Customers from Customers;
select Count(*) as Total_number_of_Vehicles from Vehicles;
select count(*) as Total_number_of_Stations from Charging_Stations;
select count(*) as Total_number_of_Sessions from Charging_Session;
select count(*) as Total_number_of_Payments from Payments;
select count(*) as Total_number_of_Energy_Records from Energy_Usage;

# To check the null values
## Customers
select count(*) as total_customers,
       sum(Customer_name is null) as Missing_name,
       sum(Gender is null) as Missing_Gender,
       sum(City is null) as Missing_City,
       sum(State is null) as Missing_State,
       sum(Signup_date is null) as Missing_Signup_date 
from  Customers;

## Vehicles
select * from Vehicles;
select count(*) AS Total_Vehicles,
    sum(Vehicles_model is null) as Missing_Model,
    sum(Vehicles_type is null) as Missing_Type,
    sum(Battery_Capacity_kwh is null) as Missing_Battery
from Vehicles;

## Total number of Session
select count(*) as Total_Sessions,
    sum(Customer_id is null) as Missing_Customer,
    sum(Vehicles_id is null) as Missing_Vehicle,
    sum(Station_id is null) as Missing_Station,
    sum(Start_time is null) as Missing_Start,
    sum(End_time is null) as Missing_End,
    sum(Energy_Consumed_kwh is null) as Missing_Energy,
    sum(Charging_Cost is null) as Missing_Cost
from Charging_Session;

##
select Customer_name,
    City,
    State,
    count(*) as Duplicate_Count
from Customers
group by Customer_name, City, State
having count(*) > 1;

select Session_id,
    Start_time,
    End_time
from Charging_Session
where End_time <= Start_time;

##
select Session_id,
    Start_time,
    End_time,
    timestampdiff(minute, Start_time, End_time) as Charging_Duration_Minutes
from Charging_Session;

select
    count(*) as Total_Sessions,
    round(sum(Energy_Consumed_kwh), 2) as Total_Energy_kwh,
    round(sum(Charging_Cost), 2) as Total_Revenue,
    round(avg(Energy_Consumed_kwh), 2) as Avg_Energy_Per_Session,
    round(avg(timestampdiff(minute, Start_time, End_time)), 2) 
        as Avg_Charging_Duration_Minutes
from Charging_Session;

select * from Charging_Session;
select * from Charging_Stations;

# Each Charging Station that has Total Charging Sessions
select distinct cst.Station_name, 
                count(*) as Total_Session 
from charging_stations as cst left join charging_session as cse on cst.station_id = cse.station_id 
group by station_name;

# Each Charging Stations that Consumed Energy and Total Revenue Generated
select distinct cst.Station_name, 
                sum(Energy_Consumed_kwh) as Total_Energy_Consumed,
                sum(Charging_cost) as Total_Revenue_Generated
from Charging_Stations as cst left join Charging_Session as cse on cst.Station_id = cse.Station_id
group by cst.Station_name;

# The Charging Stations that has Generated Total Revenue more than 1500
select distinct cst.station_name,
                sum(Charging_cost) as Total_Revenue_Generated
from Charging_Stations as cst left join Charging_Session as cse on cst.Station_id = cse.Station_id
group by cst.Station_name
having Total_Revenue_Generated > 1500;

select * from Charging_session;

# The Customers who have charged their EV more than once.
select distinct C.Customer_name,
                count(*) as Number_of_Charging_Sessions
from Customers as C left join Charging_session as cs on C.customer_id = cs.Customer_id
group by C.Customer_name
having count(CS.Session_id)>1;

# Top 5 Customers by Revenue
select C.Customer_name,
       count(Session_id) as Total_Session,
       sum(charging_cost) as Revenue_Generated
from Customers as C left join Charging_session as CS on C.Customer_id = CS.Customer_id
group by C.Customer_id
order by Revenue_Generated desc limit 5;
select * from Charging_Session;

# Average Energy consumed per charging session for each charging station.
SELECT
    Cst.Station_name,
    COUNT(CS.Session_id) AS Total_Sessions,
    AVG(CS.Energy_Consumed_kwh) AS Average_Energy_Per_Session
FROM Charging_Stations AS Cst
LEFT JOIN Charging_Session AS CS
    ON Cst.Station_id = CS.Station_id
GROUP BY Cst.Station_id, Cst.Station_name
HAVING AVG(CS.Energy_Consumed_kwh) > 30
ORDER BY Average_Energy_Per_Session DESC;

# Charging Stations experienced the highest peak energy demand
select cst.Station_name,
       sum(eu.Total_Energy_kwh) as Total_Energy_Consumed,
       max(eu.Peak_Energy_kwh) as Peak_Energy
from Charging_stations as cst left join Energy_Usage as eu on cst.station_id = eu.station_id
group by cst.Station_name
having max(eu.Peak_Energy_kwh) > 60
order by Peak_Energy desc;

# Most Popular Charging Station
select cst.Station_name,
       cst.City,
       count(cse.station_id) as Total_Sessions,
       sum(Charging_Cost) as Total_Revenue
from  Charging_Stations as cst left join Charging_Session as cse on cst.Station_id = cse.Station_id
group by cst.Station_name, cst.City
having count(cse.station_id)>=3
order by Total_Sessions desc;

# Customer Spending Analysis
## customers who have spent more than ₹1,500 on EV charging.
select C.Customer_name,
       count(Customer_name) as Total_Session,
       sum(Energy_Consumed_kwh) as Total_Energy_Consumed,
       sum(Charging_cost) as Total_amount_Spend
from Customers as C left join Charging_session as cse on C.Customer_id = cse.Customer_id
group by C.Customer_name
having sum(Charging_cost)>1500
order by Total_amount_Spend desc;

# Payment Analysis
## What is the payment success rate for each payment method
select Payment_Method,
       count(payment_Method) as Total_Payments,
       
       sum(case
               when Payment_Status = 'Completed' then 1
               else 0
			end) as Completed_Payments,
            
       sum(case
               when Payment_Status = 'Completed' then Amount_Paid
			   else 0
			end) as Total_Amount_Collected,
	   round(
        sum(case when Payment_Status = 'Completed' then 1 else 0 end)
        / count(Payment_id) * 100,
        2
    ) AS Completion_Rate
from Payments
group by Payment_Method
order by Total_Amount_Collected desc;


# Charging Duration Analysis
## Which charging stations have the longest average charging duration
select cst.Station_name,
       count(cse.Session_id) as Total_session,
       avg(timestampdiff(minute, cse.start_time, cse.end_time)) as Avg_Charging_Duration_Minutes
from Charging_Stations as cst left join Charging_Session as cse on cst.Station_id = cse.Station_id
group by cst.Station_id
having Avg_Charging_Duration_Minutes>60
order by Avg_Charging_Duration_Minutes desc;

# Daily Charging Demand
## Which days had the highest charging demand
select date(cs.Start_time) as Charging_date,
       count(cs.Session_id) as Total_Sessions,
       sum(Energy_Consumed_kwh) as Total_Energy_Consumed,
       sum(Charging_cost) as Total_Revenue
from Charging_session as cs
group by date(cs.start_time)
order by Total_Energy_Consumed desc;

# Peak Charging Hour
## At which hour do customers charge their EVs most frequently
select hour(Start_time) as Charging_Hours,
	   count(Session_id) as Total_Sessions,
       sum(Energy_Consumed_kwh) as Total_Energy_Consumed,
       sum(Charging_cost) as Total_Revenue
from Charging_session
group by Charging_Hours
order by Total_Energy_Consumed desc;

# Weekday vs Weekend Analysis
## Do customers charge more on weekdays or weekends
select case
           when dayofweek(Start_time) in (1,7) then 'Weekend'
           else 'Weekdays'
	   end as day_type,
       count(Session_id) as Total_sessions,
       sum(Energy_Consumed_kwh) as Total_Energy_Consumed,
       sum(Charging_Cost) as Total_Revenue
from Charging_session
group by case
           when dayofweek(Start_time) in (1,7) then 'Weekend'
           else 'Weekdays'
	   end
order by Total_Energy_Consumed desc;
    
# Station Revenue Ranking
## Rank all charging stations based on their total revenue.
select cst.Station_name,
       cst.City,
       count(cse.Session_id) as Total_sessions,
       sum(Charging_Cost) as Total_Revenue,
       dense_rank() over ( order by sum(Charging_Cost) desc) as Rank_of_Stations
from Charging_Stations as cst left join Charging_Session as cse on cst.Station_id = cse.Station_id
group by cst.Station_name, cst.City;

# Customer Spending Rank
## Rank customers based on their total charging expenditure.
select C.Customer_name,
       count(cse.session_id) as Total_Sessions,
       sum(Energy_Consumed_kwh) as Total_Energy_Consumed,
       sum(cse.Charging_Cost) as Total_Amount_Spend,
       dense_rank() over ( order by sum(cse.Charging_Cost) desc) as Total_Charging_Expenditure
from Customers as C left join Charging_Session as cse on C.Customer_id = cse.Customer_id
group by C.Customer_name;

# Station Revenue vs Average Revenue
## Which charging stations generate more revenue than the average station revenue
with Station_Revenue as (
select cst.Station_id,
       cst.Station_name,
       cst.City,
       count(cse.Session_id) as Total_Sessions,
       sum(cse.Charging_Cost) as Total_revenue
from Charging_Stations as cst left join Charging_session as cse on cst.Station_id = cse.station_id
group by cst.Station_id, cst.Station_name, cst.City)
select Station_name,
       City,
       Total_Sessions,
       Total_Revenue
from Station_Revenue
where Total_Revenue > (select avg(Total_Revenue) from Station_Revenue)
order by Total_Revenue desc;
       
# Above-Average Customers
## Find customers whose total spending is greater than the average spending of all customers.
with Customer_Revenue as
(select C.Customer_id,
        C.Customer_name,
       count(Cse.Session_id) as Total_Sessions,
       sum(cse.Energy_Consumed_kwh) as Total_Energy_Consumed,
       sum(cse.Charging_cost) as Total_Revenue
from Customers as C left join Charging_Session as cse on C.Customer_id = cse.Customer_id
group by C.Customer_id, C.Customer_name)
select Customer_name,
       Total_Sessions,
       Total_Energy_Consumed,
       Total_Revenue
from  Customer_Revenue
where Total_Revenue > (select avg(Total_Revenue) from Customer_Revenue)
order by Total_Revenue desc;

# Monthly Charging Analysis
## Analyze charging performance month by month.
select month(cse.start_time),
	   count(Cse.Session_id) as Total_Sessions,
       sum(cse.Energy_Consumed_kwh) as Total_Energy_Consumed,
       sum(cse.Charging_cost) as Total_Revenue,
       avg(cse.Energy_Consumed_kwh) as Avg_Energy_Consumed
from Charging_Session as cse
group by month(Start_time)
order by month(Start_time);

# Peak Charging Hour
## Which hours of the day have the highest EV charging demand?
select hour(Start_time) as Charging_Hour,
       count(Cse.Session_id) as Total_Sessions,
       sum(cse.Energy_Consumed_kwh) as Total_Energy_Consumed,
       sum(cse.Charging_cost) as Total_Revenue,
       avg(cse.Energy_Consumed_kwh) as Avg_Energy_Consumed
from charging_session as cse
group by Charging_Hour
order by Total_Sessions desc;

# Peak Revenue Hour
## Which charging hours generate the highest revenue
select hour(Start_time) as Charging_Hour,
       count(Cse.Session_id) as Total_Sessions,
       sum(cse.Energy_Consumed_kwh) as Total_Energy_Consumed,
       sum(cse.Charging_cost) as Total_Revenue,
       avg(Charging_cost) as Avg_Revenue_Per_Session
from Charging_Session as cse
group by Charging_Hour
order by Total_Revenue desc;

# Identify the Peak Charging Hour
## Find the charging hour with the highest total energy consumed.
select hour(Start_time) as Charging_Hour,
       count(Cse.Session_id) as Total_Sessions,
       sum(cse.Energy_Consumed_kwh) as Total_Energy_Consumed,
       sum(cse.Charging_cost) as Total_Revenue
from Charging_Session as cse
group by Charging_Hour
order by Total_Energy_Consumed desc limit 1;

# Station Performance
## Find the charging station with the highest average revenue per charging session.
select cst.Station_name,
       count(cse.Session_id) as Total_session,
       sum(cse.Charging_Cost) as Total_Revenue,
       avg(cse.Charging_Cost) as Avg_Revenue_Per_Session
from Charging_Stations as cst left join Charging_Session as cse on cst.Station_id = cse.Station_id
group by Station_name
order by Avg_Revenue_Per_Session desc limit 1;

select * from Charging_Session;
# Customer vs Average Spending
## Find all customers whose total charging expenditure is greater than the average customer expenditure.
with Customer_Detail as (
select C.Customer_name,
       count(cse.Session_id) as Total_session,
       sum(cse.Energy_Consumed_kwh) as Total_Energy_Consumed,
       sum(cse.Charging_Cost) as Total_Revenue
from Customers as c left join Charging_Session as cse on C.Customer_id = cse.Customer_id
group by C.Customer_name)
select * from Customer_detail
where Total_Revenue > (select avg(Total_Revenue)
                       from Customer_detail)
order by Total_Revenue desc;

# Customer Energy Efficiency
## Find the customers whose average energy consumed per charging session is greater than 30 kWh.
select C.Customer_name,
       count(cse.Session_id) as Total_session,
       sum(cse.Energy_Consumed_kwh) as Total_Energy_Consumed,
       avg(cse.Energy_Consumed_kwh) as Avg_Energy_Consumed_kwh
from Customers as C left join Charging_Session as cse on C.Customer_id = cse.Customer_id
group by C.Customer_name
having avg(cse.Energy_Consumed_kwh) > 30
order by Total_Energy_Consumed desc;

# Customer Charging Frequency
## Find the customers who have completed more than 1 charging session.
select C.Customer_name,
       count(cse.Session_id) as Total_Session,
       sum(cse.Energy_Consumed_kwh) as Total_Energy_Consumed,
       sum(cse.Charging_Cost) as Total_Revenue
from  Customers as C left join Charging_Session as cse on C.Customer_id = cse.Customer_id
group by C.Customer_name
Having count(cse.Session_id) > 1
order by Total_Session desc;

# Customer Revenue Ranking
## Find the top 5 customers based on their total charging revenue.
select C.Customer_name,
       count(cse.Session_id) as Total_Session,
       sum(cse.Energy_Consumed_kwh) as Total_Energy_Consumed,
       sum(cse.Charging_Cost) as Total_Revenue,
       Dense_rank() over (order by sum(cse.Charging_Cost) desc) as Rank_of_Customers
from Customers as C left join Charging_Session as cse on C.Customer_id = cse.Customer_id
group by C.Customer_name
order by Rank_of_Customers limit 5;

# Station Energy Ranking
## Find the top 3 charging stations based on total energy consumed.
select cst.Station_name,
       cst.City,
       count(cse.Session_id) as Total_Session,
       sum(cse.Energy_Consumed_kwh) as Total_Energy_Consumed,
       sum(cse.Charging_Cost) as Total_Revenue,
       dense_rank() over ( order by sum(cse.Energy_Consumed_kwh) desc) as Station_ranking
from Charging_Stations as cst left join Charging_Session as cse on cst.Station_id = cse.Station_id
group by Station_name, city
order by Station_ranking limit 3;


# Create station_performance View
create view Station_Performance as
Select cst.Station_id,
       cst.Station_name,
       cst.City,
       cst.state,
       cst.Charge_Type,
       count(cse.Session_id) as Total_Sessions,
       sum(cse.Energy_Consumed_kwh) as Total_Energy_Consumed,
       sum(cse.Charging_cost) as Total_Revenue,
       avg(cse.Energy_Consumed_kwh) as Average_energy_per_session,
       avg(cse.Charging_cost) as Average_Revenue_per_session
from Charging_Stations as cst left join Charging_Session as cse on cst.Station_id = cse.Station_id
group by Station_id, Station_name, City, State, Charge_Type;

select * from Station_Performance;

# Phase-2 Create a view

# Create Customer_Performance View
create view Customer_Performance as
select C.Customer_id,
       C.Customer_name,
       count(cse.Session_id) as Total_Sessions,
       sum(cse.Energy_Consumed_kwh) as Total_Energy_Consumed,
       sum(cse.Charging_cost) as Total_Revenue,
       avg(cse.Energy_Consumed_kwh) as Average_energy_per_session,
       avg(cse.Charging_cost) as Average_Revenue_per_session
from Customers as C left join Charging_Session as cse on C.Customer_id =  cse.Customer_id
group by Customer_id, Customer_name;

select * from Customer_Performance;

# Create Payment_Performance View
create view Payment_Performance as
select Payment_Method,
       count(Payment_id) as Total_Payments,
       sum(Amount_Paid) as Total_Amount_Paid
from Payments
group by Payment_Method
order by Total_Amount_Paid desc;

select * from Payment_Performance;

# Create Payment Status Analysis View
create view Payment_Status_Analysis as
select Payment_Status,
       count(Payment_id) as Total_Payments,
       sum(Amount_Paid) as Total_Amount_Paid
from Payments
group by Payment_Status
order by Total_Amount_Paid desc;

select * from Payment_Status_Analysis;

# Create Daily Energy Demand View
create view Daily_Energy_Demand as
select Usage_Date,
       sum(Total_Energy_kwh) as Total_Energy_kwh,
       sum(Peak_Energy_kwh) as Peak_Energy_kwh
from Energy_Usage
group by Usage_Date
order by Total_Energy_kwh desc;

select * from Daily_Energy_Demand;

# Create Station_Energy_Demand view
create view Station_Energy_Demand as
select cst.Station_name,
       cst.City,
       sum(eu.Total_Energy_kwh) as Total_Energy_kwh,
       sum(eu.Peak_Energy_kwh) as Peak_Energy_kwh
from Charging_Stations as cst left join Energy_Usage as eu on cst.Station_id = eu.Station_id
group by Station_name, city
order by Total_Energy_kwh desc;

select * from  Station_Energy_Demand;

# Create Energy_Demand_by_State View
create view Energy_Demand_by_State as
select cst.State,
       sum(eu.Total_Energy_kwh) as Total_Energy_kwh,
       sum(eu.Peak_Energy_kwh) as Peak_Energy_kwh
from Charging_Stations as cst left join Energy_Usage as eu on cst.Station_id = eu.station_id
group by State
order by Total_Energy_kwh desc;

select * from Energy_Demand_by_State;

# Create Peak_Demand_Analysis View
create view Peak_Demand_Analysis as
select cst.Station_name,
       cst.City,
       sum(eu.Peak_Energy_kwh) as Peak_Energy_kwh
from Charging_Stations as cst left join Energy_Usage as eu on cst.Station_id = eu.station_id
group by Station_name, City
order by Peak_Energy_kwh desc;

select * from Peak_Demand_Analysis;

# Create Station_Profitability View
create view Station_Profitability as
select cst.Station_name,
       cst.City,
       sum(cse.Energy_Consumed_kwh) as Total_Energy_Consumed,
       sum(cse.Charging_Cost) as Total_Revenue
from Charging_Stations as cst left join Charging_session as cse on cst.Station_id = cse.station_id
group by Station_name, City
having (Total_Energy_Consumed > 120) and (Total_Revenue > 2000)
order by Total_Revenue desc;

select * from Station_Profitability;

# Create Customer_Revenue_Ranking View
create view Customer_Revenue_Ranking as
select C.Customer_id,
       C.Customer_name,
       count(cse.Session_id) as Total_sessions,
       sum(cse.Energy_Consumed_kwh) as Total_Energy_Consumed,
       sum(cse.Charging_Cost) as Total_Revenue
from Customers as C left join Charging_session as cse on C.Customer_id = cse.Customer_id
group by Customer_name,Customer_id
order by Total_Revenue desc limit 5;

select * from  Customer_Revenue_Ranking;

# Create Station_Utilization_Analysis View
create view Station_Utilization_Analysis as
select cst.Station_id,
       cst.Station_name,
       cst.City,
       count(cse.Session_id) as Total_sessions,
       sum(cse.Energy_Consumed_kwh) as Total_Energy_Consumed,
       sum(cse.Charging_Cost) as Total_Revenue
from Charging_Stations as cst left join Charging_Session as cse on cst.Station_id = cse.station_id
group by Station_id, Station_name, City
order by Total_sessions desc limit 5;

select * from Station_Utilization_Analysis;

# Create Charging_Duration_Analysis View
create view Charging_Duration_Analysis as
select cst.station_id,
       cst.Station_name,
       cst.City,
       count(cse.Session_id) as Total_sessions,
       avg(timestampdiff(minute, start_time, end_time)) as Avg_Charging_Duration,
       sum(cse.Energy_Consumed_kwh) as Total_Energy_Consumed,
       sum(cse.Charging_Cost) as Total_Revenue
from Charging_Stations as cst left join Charging_Session as cse on cst.Station_id = cse.station_id
group by station_id, station_name, city
order by Avg_Charging_Duration;

select * from Charging_Duration_Analysis;

# Create Peak_Hour_Analysis View
create view Peak_Hour_Analysis as
select hour(Start_time) as Charging_Hour,
       count(Session_id) as Total_sessions,
       sum(Energy_Consumed_kwh) as Total_Energy_Consumed,
       sum(Charging_Cost) as Total_Revenue,
       avg(Energy_Consumed_kwh) as Avg_Energy_Per_Session
from Charging_Session
group by Charging_Hour
order by Total_sessions desc;

select * from Peak_Hour_Analysis;

# Create Customer_Energy_Analysis View
create view Customer_Energy_Analysis as
select C.Customer_id,
       C.Customer_name,
       count(cse.Session_id) as Total_sessions,
       sum(cse.Energy_Consumed_kwh) as Total_Energy_Consumed,
       avg(cse.Energy_Consumed_kwh) as Avg_Energy_Consumed_Per_Session,
       sum(cse.Charging_Cost) as Total_Revenue
from Customers as C left join Charging_Session as cse on C.Customer_id = cse.Customer_id
group by Customer_id, Customer_name
order by Total_Energy_Consumed desc;
       
select * from Customer_Energy_Analysis;

# Create Payment_Method_Analysis View
create view Payment_Method_Analysis as
select Payment_Method,
       count(Payment_id) as Total_Payments,
       sum(Amount_Paid) as Total_Amount_Paid,
       avg(Amount_Paid) as Avg_Amount_Paid
from Payments
group by Payment_Method
order by Total_Amount_Paid desc;

select * from Payment_Method_Analysis;

# Phase-3 Executive KPI Analysis

## 1.Overall EV Charging Performance (Find: 1. Total Charging Sessions 2. Total Energy Consumed (kWh) 3. Total Revenue 4. Average Energy per Session 5. Average Charging Cost per Session 6. Average Charging Duration(minutes))
select count(cse.Session_id) as Total_Charging_Sessions,
       round(sum(cse.Energy_Consumed_kwh),2) as Total_Energy_Consumed,
       round(sum(cse.Charging_cost),2) as Total_Revenue,
       round(avg(cse.Energy_Consumed_kwh),2) as Avg_Energy_Consumed,
       round(avg(cse.Charging_cost),2) as Avg_Charging_cost,
       round(avg(timestampdiff(minute, Start_time, End_time)),2) as Avg_Charging_Duration
from Charging_session as cse;

## 2.Which stations generate the highest revenue?Which stations generate the highest revenue?
select * from Station_performance;
select Station_id,
       Station_name,
       Total_Sessions,
	   Total_Energy_Consumed,
       Total_Revenue,
       Average_Revenue_per_session
from Station_Performance
order by Total_Revenue desc;

# 3.Energy Leaders (Which stations consume the most charging energy)
select * from Station_Energy_Demand;

# 4.Peak Charging Hour
select * from Peak_Hour_Analysis;

# 5. top customers by revenue
select Customer_id,
       Customer_name,
       Total_Sessions,
       Total_Energy_Consumed,
       Total_Revenue,
       Average_Revenue_per_session
from Customer_Performance
order by Total_Revenue desc;


# 6. customers with highest energy consumption
select Customer_id,
       Customer_name,
       Total_Sessions,
       Total_Energy_Consumed,
       Average_energy_per_session,
       Total_Revenue
from Customer_Performance
order by Total_Energy_Consumed desc;


# 7. stations with longest charging duration
select Station_name,
       City,
       Total_sessions,
       Avg_Charging_Duration,
       Total_Energy_Consumed,
       Total_Revenue
from Charging_Duration_Analysis
order by Avg_Charging_Duration desc;


# 8. energy demand by state
select State,
       Total_Energy_kwh,
       Peak_Energy_kwh
from Energy_Demand_by_State
order by Total_Energy_kwh desc;


# 9. most profitable stations
select Station_name,
       City,
       Total_Energy_Consumed,
       Total_Revenue
from Station_Profitability
order by Total_Revenue desc;


# 10. payment method performance
select Payment_Method,
       Total_Payments,
       Total_Amount_Paid,
       Avg_Amount_Paid
from Payment_Method_Analysis
order by Total_Amount_Paid desc;


# 11. peak energy demand by station
select Station_name,
       City,
       Peak_Energy_kwh
from Peak_Demand_Analysis
order by Peak_Energy_kwh desc;


# 12. daily energy demand
select Usage_Date,
       Total_Energy_kwh,
       Peak_Energy_kwh
from Daily_Energy_Demand
order by Usage_Date;


# 13. station utilization
select Station_id,
       Station_name,
       City,
       Total_sessions,
       Total_Energy_Consumed,
       Total_Revenue
from Station_Utilization_Analysis
order by Total_sessions desc;


# 14. customers spending above average
with customer_detail as (
    select Customer_id,
           Customer_name,
           Total_Sessions,
           Total_Energy_Consumed,
           Total_Revenue
    from Customer_Performance
)
select Customer_id,
       Customer_name,
       Total_Sessions,
       Total_Energy_Consumed,
       Total_Revenue
from customer_detail
where Total_Revenue > (
    select avg(Total_Revenue)
    from customer_detail
)
order by Total_Revenue desc;


# 15. payment status analysis
select Payment_Status,
       Total_Payments,
       Total_Amount_Paid
from Payment_Status_Analysis
order by Total_Amount_Paid desc;




# Phase 4 — Dashboard

## 4.1 KPI 1 — Overall Performance
select count(cse.Session_id) as Total_Charging_Sessions,
       round(sum(cse.Energy_Consumed_kwh),2) as Total_Energy_Consumed,
       round(sum(cse.Charging_cost),2) as Total_Revenue,
       round(avg(cse.Energy_Consumed_kwh),2) as Avg_Energy_Consumed,
       round(avg(cse.Charging_cost),2) as Avg_Charging_Cost,
       round(avg(timestampdiff(minute, Start_time, End_time)),2) as Avg_Charging_Duration
from Charging_session as cse;

## 4.2 — Dashboard Chart #1
select Station_name,
       Total_Revenue
from Station_Performance
order by Total_Revenue desc;

## 4.3 — Chart 2
select Station_name,
       Total_Energy_kwh
from Station_Energy_Demand
order by Total_Energy_kwh desc;

## 4.4 — Chart 3
select Charging_Hour,
       Total_sessions
from Peak_Hour_Analysis
order by Charging_Hour;

## 4.5 — Chart 4
select State,
       Total_Energy_kwh
from Energy_Demand_by_State
order by Total_Energy_kwh desc;

## 4.6 — Chart 5
select Payment_Method,
       Total_Amount_Paid
from Payment_Method_Analysis
order by Total_Amount_Paid desc;

## 4.7 — Chart 6
select Customer_name,
       Total_Revenue
from Customer_Performance
order by Total_Revenue desc;
