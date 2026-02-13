# SQL-Driven-Analysis-of-Skin-Cancer-Lesion-Data
📌 Project Summary

This project applies structured SQL analytics to explore demographic, lifestyle, and environmental factors associated with different skin cancer lesion diagnoses.

Using PostgreSQL, I designed and executed analytical queries to extract clinically relevant insights from relational healthcare data. The project demonstrates how SQL can support data-driven decision-making in healthcare, particularly in understanding population-level risk patterns and diagnosis distributions.

This work forms part of my applied analytics portfolio, with relevance to healthcare data analysis, clinical research support, and AI-enabled health systems.

🏥 Healthcare & Business Context

Skin cancer represents a significant public health challenge, with diagnosis influenced by a combination of biological, behavioural, and environmental factors.

From a healthcare and operational perspective, understanding these relationships can support:

Early risk stratification

Preventive healthcare planning

Resource allocation for screening programmes

Data preparation for downstream machine learning models

This project mirrors real-world analytical workflows commonly found in healthcare analytics teams, where SQL is used to interrogate clinical databases before advanced modelling or reporting.

🎯 Analytical Objectives

The analysis was designed to answer the following business- and clinically-relevant questions:

How are skin cancer diagnoses distributed across gender groups?

Are lifestyle factors (smoking, alcohol consumption) associated with specific lesion types?

Does environmental exposure (e.g. pesticide use) vary across diagnostic categories?

How do infrastructural factors (access to piped water and sewage systems) correlate with lesion diagnoses?

What is the overall prevalence of each lesion category within the dataset?

🗂 Data Model Overview

The analysis is based on two relational tables linked via a unique patient identifier.

Patient & Risk Factor Table

Demographics: age, gender

Lifestyle factors: smoking, alcohol consumption

Medical history: prior cancer history

Environmental exposure: pesticide use

Infrastructure indicators: piped water, sewage system

Clinical Diagnosis Table

Lesion identifier

Diagnostic category (e.g. ACK, BCC, NEV, SEK, SCC, MEL)

These tables are joined using:

INNER JOIN table2 ON table1.patient_id = table2.patient_id

🔎 Analytical Approach

The project follows a structured healthcare analytics workflow:

1️⃣ Demographic Analysis

Diagnosis frequency by gender

Population-level distribution across lesion types

2️⃣ Lifestyle Risk Assessment

Smoking status vs diagnosis

Alcohol consumption vs diagnosis

3️⃣ Environmental & Infrastructure Factors

Pesticide exposure vs lesion category

Access to piped water and sewage systems

Combined environmental condition analysis

Aggregations were performed using GROUP BY and COUNT() to generate interpretable frequency metrics.

📊 Key Insights

Distinct diagnosis patterns emerge across gender groups.

Lifestyle behaviours show varying distributions across lesion types.

Environmental and infrastructural factors differ in prevalence by diagnosis category.

Certain lesion types account for a disproportionately large share of total cases.

These insights demonstrate how SQL can be used to support evidence-based healthcare analysis and form a foundation for predictive modelling or epidemiological research.

🛠 Tools & Technologies

PostgreSQL 18

pgAdmin

SQL (Joins, Aggregations, Filtering, Grouping)

🧠 Skills Demonstrated

Healthcare data analytics

Relational database design and querying

Multi-table joins and aggregations

Translating clinical data into actionable insights

Preparing structured datasets for machine learning workflows

Clear communication of analytical findings

📂 Repository Contents

Final_SQL_Query.sql – Complete SQL script containing all analytical queries

SQL_Capstone_Project.pdf – Project brief and problem statement

Query output screenshots demonstrating analytical results

📌 Relevance for Healthcare & AI Roles

This project demonstrates practical skills used in:

Healthcare analytics

Clinical research support

Health data science

AI-driven healthcare innovation

It reflects the ability to work with real-world clinical data, apply analytical reasoning, and communicate insights clearly — all critical competencies in healthcare and AI-focused roles.
