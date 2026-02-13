# 🧬 SQL-Driven Analysis of Skin Cancer Lesion Data  

## 📌 Project Summary  

This project applies structured SQL analytics to explore demographic, lifestyle, and environmental factors associated with different skin cancer lesion diagnoses.

Using PostgreSQL, I designed and executed analytical queries to extract clinically relevant insights from relational healthcare data. The project demonstrates how SQL can support data-driven decision-making in healthcare, particularly in understanding population-level risk patterns and diagnosis distributions.

This work forms part of my applied analytics portfolio, with relevance to healthcare data analysis, clinical research support, and AI-enabled health systems.

---

## 🏥 Healthcare & Business Context  

Skin cancer represents a significant public health challenge, with diagnosis influenced by a combination of biological, behavioural, and environmental factors.

From a healthcare and operational perspective, understanding these relationships can support:
- Early risk stratification  
- Preventive healthcare planning  
- Resource allocation for screening programmes  
- Data preparation for downstream machine learning models  

This project mirrors real-world analytical workflows commonly found in healthcare analytics teams, where SQL is used to interrogate clinical databases before advanced modelling or reporting.

---

## 🎯 Analytical Objectives  

The analysis was designed to answer the following business- and clinically-relevant questions:

- How are skin cancer diagnoses distributed across gender groups?
- Are lifestyle factors (smoking, alcohol consumption) associated with specific lesion types?
- Does environmental exposure (e.g. pesticide use) vary across diagnostic categories?
- How do infrastructural factors (access to piped water and sewage systems) correlate with lesion diagnoses?
- What is the overall prevalence of each lesion category within the dataset?

---

## 🗂 Data Model Overview  

The analysis is based on two relational tables linked via a unique patient identifier.

### Patient & Risk Factor Table
- Demographics: age, gender  
- Lifestyle factors: smoking, alcohol consumption  
- Medical history: prior cancer history  
- Environmental exposure: pesticide use
