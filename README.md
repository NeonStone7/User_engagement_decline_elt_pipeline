# User Engagement Decline Analysis - ELT Pipeline Project
## Overview
This project aims to analyze the issue of declining user engagement after users sign up for a product. Using an ELT (Extract, Load, Transform) pipeline, we ingest user sign-up and engagement data from simulated source systems (OLTP and customer experience platforms) and transform it to analyze key metrics. The goal is to provide insights into user engagement patterns over time, with a focus on churn rates, retention rates, and other critical KPIs.

# Business Problem
## Problem:
Users are signing up for the product, but engagement is decreasing over time.

# Objective:
To understand why users are losing engagement and identify opportunities for improving the product experience. The analysis will enable the business team to optimize strategies for user retention.

# Key Performance Indicators (KPIs)
- Churn Rate - The percentage of users who stop using the product after signing up.
- Retention Rate - The percentage of users who continue to use the product over specific periods (e.g., 1 month, 6 months).
- Active Users - The number of users who actively engage with the product within a defined time period.
- Engagement Frequency - How often users interact with the product after signing up.
- Average Session Duration - The time users spend on the product per session.
- Days Since Signup - Time elapsed since the user signed up.

# Pipeline Architecture
## Data Sources
- User Signups (OLTP) - Contains information about user signups, including user_id, signup_date, and product type.
- User Engagement - Contains details about user activities, such as user_id, engagement_date, session_duration, and interaction type.
- Churn Data - Contains churn-related data, including user_id and churn_date.

# Steps
## Extract:
Extract raw data from the OLTP systems and customer experience platforms, simulating various events like user signups and engagements.

## Load:
Load the extracted data into a data warehouse (Snowflake) in its raw form.

## Transform:
Using dbt (Data Build Tool), transform the data into a format that is suitable for analysis. Key transformations include:

- Calculating Churn Rate using the time between signup and churn.
- Calculating Retention Rate to track how long users stay engaged.
- Aggregating User Engagement Metrics such as session duration and engagement frequency.

# Visualize (BI Tool):
Build a dashboard in a BI tool (Snowplow) to display KPIs, churn trends, and engagement metrics, providing actionable insights to business stakeholders.

