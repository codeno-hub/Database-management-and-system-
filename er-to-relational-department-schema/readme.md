# Mapping Strong Entities and Multivalued Attributes

This repository contains the relational database schema and design justification for mapping a strong entity (`DEPARTMENT`) and its multivalued attribute (`Location`) into normalized SQL tables.

## Overview

In Entity-Relationship (ER) modeling, multivalued attributes cannot be stored directly within a single column of a strong entity table without violating First Normal Form (1NF). To maintain model integrity, this implementation separates the `Location` attribute into its own dedicated relation (`DEPT_LOCATIONS`) linked via a foreign key constraint.

## Deliverables

* **`schema.sql`**: Contains the Data Definition Language (DDL) statements creating the `DEPARTMENT` and `DEPT_LOCATIONS` tables along with primary and foreign key constraints.

## Schema Architecture

1. **`DEPARTMENT` (Strong Entity)**
   * **Primary Key:** `Dnumber`
   * Stores core, single-valued department attributes.

2. **`DEPT_LOCATIONS` (Multivalued Attribute Relation)**
   * **Composite Primary Key:** `(Dnumber, Dlocation)`
   * **Foreign Key:** `Dnumber` references `DEPARTMENT(Dnumber)`

## Primary Key Justification

A department can have several locations, so `Dnumber` alone would allow only one row per department. `Dlocation` alone would fail because several departments can share a location. Together, they form a composite key that identifies each department–location pair exactly once, which blocks duplicate pairs while still allowing many locations per department and many departments per location. `Dnumber` is also a foreign key to `DEPARTMENT`, ensuring referential integrity so no location can exist for a nonexistent department while keeping the schema in First Normal Form (1NF).

## Usage

Run the schema script in any standard SQL-compliant RDBMS (PostgreSQL, MySQL, SQLite):

```bash
psql -U <username> -d <database_name> -f schema.sql
