---1. Create a Table with More Than 1,000 Rows

-- Create the table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT
);

-- Insert more than 1,000 rows using generate_series
INSERT INTO users (name, age)
SELECT 
    'User ' || gs,  -- Name
    (gs % 79) + 1   -- Age, ensuring age is between 1 and 78
FROM generate_series(1, 1000) AS gs;
select * from users


--2. Add a Constraint to Check Age Should Not Be Greater Than 78

-- Add a constraint to the existing table
ALTER TABLE users
ADD CONSTRAINT age_check CHECK (age <= 78);

---3. Add a Custom Constraint to Restrict Values in a Column

-- Add a new column to the table
ALTER TABLE users
ADD COLUMN status VARCHAR(20);

-- Add a custom constraint to restrict certain values
ALTER TABLE users
ADD CONSTRAINT status_check CHECK (status NOT IN ('a1', 'b1', 'check'));

select * from users 