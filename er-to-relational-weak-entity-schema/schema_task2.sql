-- Task 2: Mapping a weak entity (DEPENDENT) that depends on EMPLOYEE
-- Assumed design (classic COMPANY schema):
--   EMPLOYEE(Ssn, Fname, Lname, ...)
--   DEPENDENT(Dependent_name, Sex, Bdate, Relationship)  -- weak entity
--   Identifying relationship: DEPENDENTS_OF (EMPLOYEE 1 --- N DEPENDENT)
--   Partial key: Dependent_name

-- Minimal EMPLOYEE stub so this script runs on its own.
-- If you already have a full EMPLOYEE table, skip this block.
CREATE TABLE EMPLOYEE (
    Ssn    CHAR(9)      NOT NULL,
    Fname  VARCHAR(30)  NOT NULL,
    Lname  VARCHAR(30)  NOT NULL,
    PRIMARY KEY (Ssn)
);

CREATE TABLE DEPENDENT (
    Essn            CHAR(9)      NOT NULL,  -- migrated key (owner's Ssn)
    Dependent_name  VARCHAR(50)  NOT NULL,  -- partial key
    Sex             CHAR(1),
    Bdate           DATE,
    Relationship    VARCHAR(20),
    PRIMARY KEY (Essn, Dependent_name),
    FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn)
        ON DELETE CASCADE     -- existence dependency: no employee, no dependent
        ON UPDATE CASCADE
);

-- Text diagram
--
--   EMPLOYEE                         DEPENDENT
--   +-----------+                    +-----------------------+
--   | Ssn  (PK) |<-------------------| Essn (PK, FK)         |
--   | Fname     |   1          N     | Dependent_name (PK)   |
--   | Lname     |                    | Sex                   |
--   +-----------+                    | Bdate                 |
--                                    | Relationship          |
--                                    +-----------------------+
--   Composite primary key of DEPENDENT: (Essn, Dependent_name)
