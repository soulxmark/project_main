
CREATE TABLE branch (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    location VARCHAR(150)
);

CREATE TABLE income (
    id SERIAL PRIMARY KEY,
    branch_id INT REFERENCES branch(id) ON DELETE CASCADE,
    description VARCHAR(255),
    amount NUMERIC(14,2) NOT NULL,
    txn_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE expense (
    id SERIAL PRIMARY KEY,
    branch_id INT REFERENCES branch(id) ON DELETE CASCADE,
    description VARCHAR(255),
    amount NUMERIC(14,2) NOT NULL,
    txn_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE balance_sheet (
    id SERIAL PRIMARY KEY,
    branch_id INT REFERENCES branch(id) ON DELETE CASCADE,
    category VARCHAR(20) CHECK (category IN ('Asset','Liability','Equity')),
    description VARCHAR(255),
    amount NUMERIC(14,2) NOT NULL,
    txn_date DATE DEFAULT CURRENT_DATE
);



SELECT 
  b.id AS branch_id,
  b.name AS branch_name,
  b.location,
  l.name_manager AS manager_fullname,
  l.role AS manager_role
FROM branch b
LEFT JOIN login l ON b.manager_id = l.id;
