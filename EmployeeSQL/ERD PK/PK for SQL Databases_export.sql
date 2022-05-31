-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

-- Data Modeling for Employees Database and Documentation
CREATE TABLE [departments] (
    -- Department number is a primary key, and it is
    -- aslo found in department employees and department manager list
    [dept_no] VARCHAR  NOT NULL ,
    -- Department names
    [dept_name] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_departments] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
)

CREATE TABLE [titles] (
    -- Title id is a primary key,
    -- and it also found in employees as emp_title_id
    [title_id] VARCHAR  NOT NULL ,
    -- List of titles
    [title] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_titles] PRIMARY KEY CLUSTERED (
        [title_id] ASC
    )
)

CREATE TABLE [employees] (
    -- Employees number is a primary key
    -- and also found in department employees, department manager
    -- and salaries list
    [emp_no] INT  NOT NULL ,
    -- Employees have a title id employees(emp_title_id)
    -- So, this id has relationship with-
    -- the composite foreign key titles(title_id)
    [emp_title_id] VARCHAR  NOT NULL ,
    -- Employees birth date
    [birth_date] DATE  NOT NULL ,
    -- Employees first name
    [first_name] VARCHAR  NOT NULL ,
    -- Employees last name
    [last_name] VARCHAR  NOT NULL ,
    -- Employees sex
    [sex] VARCHAR  NOT NULL ,
    -- Employees hired date
    [hire_date] DATE  NOT NULL ,
    CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [dept_emp] (
    -- Employees number in department employees list and
    -- which shared a unique key with employees(emp_no)
    [emp_no] INT  NOT NULL ,
    -- Department number in department employees list and
    -- which shared a unique key with dept_emp(dept_no)
    [dept_no] VARCHAR  NOT NULL 
)

CREATE TABLE [dept_manager] (
    -- Department number in department manger list and
    -- which shared a unique key with dept_emp(dept_no)
    [dept_no] VARCHAR  NOT NULL ,
    -- Employees number in department manger list and
    -- which  shared a unique key with employees(emp_no)
    [emp_no] INT  NOT NULL 
)

CREATE TABLE [salaries] (
    -- Employees number in salaries and
    -- which shared unique keys with employees(emp_no)
    [emp_no] INT  NOT NULL ,
    -- Employees salaries
    [salary] INT  NOT NULL 
)

ALTER TABLE [employees] WITH CHECK ADD CONSTRAINT [FK_employees_emp_title_id] FOREIGN KEY([emp_title_id])
REFERENCES [titles] ([title_id])

ALTER TABLE [employees] CHECK CONSTRAINT [FK_employees_emp_title_id]

ALTER TABLE [dept_emp] WITH CHECK ADD CONSTRAINT [FK_dept_emp_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [dept_emp] CHECK CONSTRAINT [FK_dept_emp_emp_no]

ALTER TABLE [dept_emp] WITH CHECK ADD CONSTRAINT [FK_dept_emp_dept_no] FOREIGN KEY([dept_no])
REFERENCES [departments] ([dept_no])

ALTER TABLE [dept_emp] CHECK CONSTRAINT [FK_dept_emp_dept_no]

ALTER TABLE [dept_manager] WITH CHECK ADD CONSTRAINT [FK_dept_manager_dept_no] FOREIGN KEY([dept_no])
REFERENCES [departments] ([dept_no])

ALTER TABLE [dept_manager] CHECK CONSTRAINT [FK_dept_manager_dept_no]

ALTER TABLE [dept_manager] WITH CHECK ADD CONSTRAINT [FK_dept_manager_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [dept_manager] CHECK CONSTRAINT [FK_dept_manager_emp_no]

ALTER TABLE [salaries] WITH CHECK ADD CONSTRAINT [FK_salaries_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [salaries] CHECK CONSTRAINT [FK_salaries_emp_no]

COMMIT TRANSACTION QUICKDBD