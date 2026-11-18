# Implementing Weak Entity Relationships

This repository contains the relational database schema and structural documentation for mapping a `DEPENDENT` weak entity and its identifying relationship with an `EMPLOYEE` strong entity into normalized SQL tables.

## Overview

In Entity-Relationship (ER) modeling, a weak entity lacks a primary key of its own and cannot exist independently without an owner (strong) entity. To establish existence dependency and unique identification, the primary key of the owner entity (`EMPLOYEE`) is migrated into the weak entity relation (`DEPENDENT`) as a foreign key and combined with the weak entity's partial key.

## Deliverables

* **`schema_task2.sql`**: Contains the Data Definition Language (DDL) statements creating the `EMPLOYEE` and `DEPENDENT` tables, including simple attributes, primary keys, and foreign key constraints.

## Schema Architecture

1. **`EMPLOYEE` (Strong Entity)**
   * **Primary Key:** `Ssn`
   * Stores core employee attributes and acts as the identifying owner entity.

2. **`DEPENDENT` (Weak Entity)**
   * **Composite Primary Key:** `(Essn, Dependent_name)`
   * **Foreign Key:** `Essn` references `EMPLOYEE(Ssn)`
   * **Simple Attributes:** `Sex`, `Bdate` (Birth_date), `Relationship`

## Relationship & Key Mapping

```text
EMPLOYEE (Ssn [PK], ...)
   ▲
   │  1 : N (Identifying Relationship)
   │  Essn references EMPLOYEE(Ssn)
   │
DEPENDENT (Essn [PK, FK], Dependent_name [PK], Sex, Bdate, Relationship)
