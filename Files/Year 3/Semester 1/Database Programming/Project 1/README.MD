# 🗓️ Database Programming — Project 1: Smart Digital Attendance System

**Year 3 · Semester 1 · Database Programming**

A SQL-based backend system for managing student attendance — replacing paper-based processes with a structured relational database designed for integrity, performance, and scalability.

---

## 🎯 Overview

This project was developed for the SECP3623 Database Programming course at Universiti Teknologi Malaysia. The goal was to design and implement a centralised relational database that handles attendance records across students, lecturers, courses, and sessions. The focus was on enforcing data integrity through constraints, writing advanced queries for real reporting needs, and optimising performance through indexing.

---

## 🛠️ Tech Stack

- **Database Engine:** MySQL
- **Core Tables:** Students, Lecturers, Courses, Enrollments, Sessions, AttendanceRecords
- **Key Techniques:**
  - DDL with `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, and `CHECK` constraints to maintain data consistency
  - Complex DQL using various `JOIN` types (Inner, Left, Natural, Self), correlated and multi-row subqueries, and `CASE WHEN` conditional logic
  - Set operations including `UNION` and `NOT EXISTS` for advanced record filtering

---

## 📊 Performance Optimisation

Query performance was analysed before and after indexing using the `EXPLAIN` command:

| Index Type | Target Column(s) | Result |
|---|---|---|
| BTREE Index | `EnrollmentDate` | Rows examined reduced from 9 to 1 |
| FULLTEXT Index | `SFirstName`, `SLastName` | Rows examined reduced from 10 to 1 |

---

## 📁 Folder Contents

| File | Description |
|---|---|
| `Project1.pdf` | Full project report — schema design, SQL implementation, and performance analysis |

---

## 📖 What I Did

I designed the six-table schema for the attendance system, implemented all DDL with appropriate constraints, wrote a range of queries covering joins, subqueries, set operations, and conditional logic, and applied indexing strategies to improve query performance. The EXPLAIN command was used to verify and document the impact of each index.

---

## 💭 Reflection

**What I gained:** A solid understanding of how database constraints, query planning, and indexing work together to produce a reliable and performant system. Writing advanced SQL — correlated subqueries, self-joins, FULLTEXT indexes — required thinking about the data model and query behaviour at a level that basic SQL does not demand.

**Suggestions for improvement:** Testing the system against a dataset of realistic scale — tens of thousands of attendance records — would reveal performance bottlenecks that small test data hides. Understanding how index choice affects performance at scale is an important step beyond what this project demonstrated.

**Other thoughts:** This project made database design feel consequential. Every schema decision — whether to embed a constraint, how to name a foreign key, which column to index — has a direct effect on data quality and query speed. Working through those decisions on a meaningful system was more instructive than any theoretical exercise.

---

<p align="left"><sub><a href="../README.MD">← Back to Database Programming</a></sub></p>
