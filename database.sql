CREATE TABLE expense (
    id SERIAL PRIMARY KEY,
    branch_id INT NOT NULL,
    description VARCHAR(255) NOT NULL,
    amount NUMERIC(12,2) NOT NULL,
    txn_date DATE NOT NULL,
    CONSTRAINT fk_branch FOREIGN KEY (branch_id)
        REFERENCES branch(id)
        ON DELETE CASCADE
);
