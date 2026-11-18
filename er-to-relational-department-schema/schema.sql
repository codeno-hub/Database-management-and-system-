-- Task 1: Mapping a strong entity and its multivalued attribute
-- Assumed conceptual design (classic COMPANY schema):
--   DEPARTMENT(Dnumber, Dname, Mgr_ssn, Mgr_start_date, {Dlocation})
--   Dnumber is the key; Dlocation is multivalued.

CREATE TABLE DEPARTMENT (
    Dnumber         INT           NOT NULL,
    Dname           VARCHAR(50)   NOT NULL,
    Mgr_ssn         CHAR(9),
    Mgr_start_date  DATE,
    PRIMARY KEY (Dnumber),
    UNIQUE (Dname)
    -- If an EMPLOYEE table exists, add:
    -- , FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE(Ssn)
);

-- The multivalued attribute Dlocation becomes its own relation.
CREATE TABLE DEPT_LOCATIONS (
    Dnumber    INT          NOT NULL,
    Dlocation  VARCHAR(50)  NOT NULL,
    PRIMARY KEY (Dnumber, Dlocation),
    FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
