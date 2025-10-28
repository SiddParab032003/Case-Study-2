# Case-Study-2
Advanced SQL case study focused on analyzing business data using CTEs, window functions, and subqueries to derive insights on sales, customers, and revenue performance.
#  SQL Case Study 2 — Advanced Business Analysis

##  Overview
This project is the second part of a series of SQL case studies focused on gaining actionable insights from a business dataset.  
It extends the concepts from *Case Study 1* and demonstrates advanced SQL features such as window functions, common table expressions (CTEs), subqueries, and stored procedures for data-driven decision making.

---

## + Database Used
**Database Name:** `case2`

**Main Tables:**
- **Customer** — Customer and region details  
- **Product** — Product categories and pricing  
- **Sales** — Transactional data with revenue, discount, and profit fields  

*(Table names may vary based on your dataset—update as needed.)*

---

##  Objectives & Problem Statements
The case study answers around **25–30 analytical questions**, including:

| # | Question | SQL Concept |
|---|-----------|-------------|
| 1 | List all customers and their total purchase amount | `JOIN`, `SUM()` |
| 2 | Find top 5 products by revenue | `ORDER BY … DESC`, `TOP N` |
| 3 | Identify products never sold | `LEFT JOIN`, `IS NULL` |
| 4 | Show monthly sales trend | `GROUP BY DATEPART(MONTH, …)` |
| 5 | Find most profitable region | Aggregation + `GROUP BY` |
| 6 | Display rank of products by profit | `DENSE_RANK()` |
| 7 | Compare actual vs budgeted sales | Subqueries |
| 8 | List customers with above-average purchase value | Subquery in `WHERE` |
| 9 | Calculate cumulative revenue | Window function `SUM() OVER()` |
| 10 | Create procedure to get sales by region | `CREATE PROCEDURE` |
| 11 | Use CTE to find year-over-year growth | `WITH CTE` |
| 12 | Demonstrate set operations (UNION, INTERSECT) | Set operators |

---

##  SQL Concepts Covered
- Aggregations (SUM, AVG, MIN, MAX)  
- Filtering (`WHERE`, `HAVING`, `IN`, `BETWEEN`)  
- Joins (Inner / Left / Right)  
- Subqueries and Correlated Subqueries  
- Common Table Expressions (CTEs)  
- Window Functions (RANK, DENSE_RANK, ROW_NUMBER, CUME_DIST)  
- Stored Procedures & User-Defined Functions  
- Set Operations (`UNION`, `INTERSECT`, `EXCEPT`)  
- Transaction Control (`BEGIN`, `COMMIT`, `ROLLBACK`)  

---

##  Key Learnings
- Apply SQL to extract complex business insights  
- Write efficient analytical queries using CTEs and window functions  
- Create reusable logic with stored procedures and UDFs  
- Strengthen data-driven reporting skills  

---

##  Tools Used
- **Database:** Microsoft SQL Server (SSMS)  
- **Diagram Tool:** dbdiagram.io (for ER Diagram)  
- **OS:** Windows  

---

##  Author
**Siddharth Parab**  
SQL | Data Analytics | Business Intelligence  
📧 sidd032003@gmail.com  
🔗 [GitHub Profile](https://github.com/SiddParab032003)

---

###  How to Use
1. Open **SQL Server Management Studio (SSMS)**.  
2. Create database `case2`.  
3. Run the provided `.sql` file step by step.  
4. View outputs and screenshots for each task (if included).  
5. (Optionally) Generate ER diagram to visualize relationships.

---
