# EV Charging Analytics

An end-to-end data analytics project using **MySQL, SQL, and Power BI** to analyze electric vehicle charging infrastructure, charging sessions, energy consumption, revenue, station performance, customer behavior, and peak charging demand.

## Project Overview

This project analyzes EV charging data using SQL for data storage, transformation, querying, and business analysis, followed by Power BI for interactive visualization and dashboard development.

The project demonstrates an end-to-end analytics workflow:

**MySQL Database → SQL Analysis → Business Insights → Power BI Dashboard → Recommendations**

## Objectives

- Analyze EV charging sessions and energy consumption
- Measure charging station performance
- Analyze charging revenue
- Identify high-demand states
- Identify peak charging hours
- Compare charging station usage
- Analyze customer charging behavior
- Generate business insights and recommendations

## Technologies Used

- **MySQL**
- **SQL**
- **Power BI Desktop**
- **DAX**

## Database

The project uses a relational MySQL database named:

`EV_Charging_Analytics`

### Main Tables

- Customers
- Vehicles
- Charging_Stations
- Charging_Session
- Energy_Usage
- Payments

## SQL Analysis

SQL was used for:

- Data aggregation
- Filtering and sorting
- GROUP BY and HAVING analysis
- JOIN operations
- Common Table Expressions (CTEs)
- Window functions
- Revenue analysis
- Customer analysis
- Charging station performance analysis
- Energy demand analysis
- Peak-hour analysis
- View creation

The complete SQL analysis script is available here:

[SQL Analysis](SQL/ev_charging_analytics.sql)

## Power BI Dashboard

Power BI was used to transform the SQL analysis into an interactive dashboard.

### Key Dashboard Metrics

- Total Revenue
- Total Energy Consumption
- Total Charging Sessions
- Average Energy per Session
- Average Charging Duration

### Dashboard Visualizations

- Revenue by Charging Station
- Charging Sessions by Station
- Energy Demand by State
- Peak Charging Demand by Hour
- Interactive State Filter

More details about the dashboard:

[Power BI Dashboard](PowerBI/README.md)

## Key Insights

- Tamil Nadu has the highest energy demand at approximately **520.4 kWh**.
- Karnataka follows with approximately **206.4 kWh**.
- Hyderabad EV Plaza generates the highest charging revenue.
- Charging demand reaches its peak around **18:00** with approximately **237 kWh**.
- Coimbatore EV Hub and Hyderabad EV Plaza record the highest number of charging sessions.
- Peak-hour analysis can help optimize charging station capacity and reduce congestion.

## Business Recommendations

- Increase charging capacity during the **18:00 peak period**.
- Prioritize high-performing charging stations for infrastructure expansion.
- Monitor state-level energy demand for future station planning.
- Use peak-hour demand analysis to reduce charging congestion.
- Focus investment on stations with strong revenue and session performance.

## Project Structure

EV-Charging-Analytics   
│  
├── SQL  
│   └── ev_charging_analytics.sql  
│   
├── PowerBI   
│   ├── README.md  
│   ├── dashboard.png  
│   └── insights.png  
│  
└── README.md
