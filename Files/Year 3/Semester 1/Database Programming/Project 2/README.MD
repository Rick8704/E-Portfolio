# 🛵 Database Programming — Project 2: Food Delivery Record System

**Year 3 · Semester 1 · Database Programming**

A NoSQL database system built with MongoDB to manage a food delivery platform — leveraging document modelling, aggregation pipelines, and indexing strategies to handle real-time delivery tracking efficiently.

---

## 🎯 Overview

Unlike the relational approach in Project 1, this project used MongoDB's document model to handle the flexible, semi-structured data of a delivery service — covering customer records, rider profiles, and live delivery status tracking. The design emphasised both read/write performance and data consistency under distributed conditions.

---

## 🏗️ Data Model

The system is built around four collections, using a mix of embedding and referencing to balance performance and flexibility:

| Collection | Design Approach |
|---|---|
| **Customers** | Demographics with embedded address objects and multi-value phone number arrays |
| **Riders** | Profile and vehicle details via embedded objects |
| **Deliveries** | Real-time status history stored as an array of timestamped embedded documents |
| **Orders** | Links customers, riders, and items with payment and total amount fields |

---

## 🛠️ Advanced MongoDB Features

**Aggregation Pipelines**
- Revenue analytics grouping orders by payment method to calculate totals and sort by popularity
- Delivery performance tracking filtering for completed deliveries and grouping by rider for incentive calculations

**Indexing & Optimisation**

| Index Type | Target | Benefit |
|---|---|---|
| Single-Field | `orderDate` | Fast chronological reporting |
| Compound | `customerId_1_totalAmount_-1` | Instant retrieval of a customer's most expensive orders |

Both indexes shifted query execution from Collection Scans to Index Scans, significantly reducing lookup cost.

**Distributed Systems & Security**
- Configured for **CP (Consistency + Partition Tolerance)** — every read reflects the most recent write
- Write concern `w: "majority"` applied to order placement for integrity
- `readPreference: "secondaryPreferred"` used for catalogue browsing to reduce load on the primary node
- Input validation applied to mitigate NoSQL Injection and JavaScript Injection risks

---

## 💻 CRUD Implementation

| Operation | Methods Used |
|---|---|
| Insert | `insertOne`, `insertMany` with nested arrays |
| Query | `$gt`, `$lt`, `$and`, `$or`, `$in` operators |
| Update | `$push` for array updates, `$inc` for calculated fields |
| Delete | `$ne` and ObjectId-targeted deletions |

---

## 👥 Contributors

| Name | Role |
|---|---|
| Chau Ying Jia (A23CS0213) | CRUD Implementation & Documentation |
| **Ng Yu Hin (A23CS0148)** | NoSQL Data Model & JSON Structure |
| Tan Zhi Ming (A23CS0189) | Advanced Operations & Aggregation |
| Elijah She Yu Sheng (A23CS0073) | Security, CAP Theorem & Final Editing |

**Instructor:** Prof. Madya Dr. Roliana Binti Ibrahim

---

## 📁 Folder Contents

| File | Description |
|---|---|
| `DATABASE PROGRAMMING PRO2.pdf` | Full project report — data model, implementation, and advanced operations |

---

## 📖 What I Did

My primary contribution was designing the NoSQL data model and structuring the JSON documents for each collection. I decided on the embedding vs referencing strategy for each collection based on the access patterns of the system — embedding where data was always read together, referencing where it was updated independently. I also worked on the JSON schema structure and validated the document design against the query requirements before implementation.

---

## 💭 Reflection

**What I gained:** A practical understanding of document-oriented database design and how it differs from relational modelling. Choosing between embedding and referencing requires thinking about how data is accessed, not just how it is structured — which is a different mindset from normalisation in SQL.

**Suggestions for improvement:** Testing the aggregation pipelines on a larger dataset would reveal how pipeline stage ordering affects performance. Understanding the cost of `$lookup` operations versus pre-joining data through embedding is an important optimisation consideration that becomes visible only at scale.

**Other thoughts:** Project 2 was a genuinely different kind of database work from Project 1. Switching from the strict structure of relational SQL to the flexibility of MongoDB required unlearning some habits — particularly the instinct to normalise everything. Knowing when flexibility is an advantage and when it creates risk is a judgement call that this project helped me develop.

---

<p align="left"><sub><a href="../README.MD">← Back to Database Programming</a></sub></p>
