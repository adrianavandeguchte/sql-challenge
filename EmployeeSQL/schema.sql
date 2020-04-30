-- QUICKDBD created schema

-- department table creation, dept_id set as primary key
CREATE TABLE "department" (
    "dept_id" VARCHAR(4)   NOT NULL,
    "dept_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_department" PRIMARY KEY (
        "dept_id"
     )
);

-- titles table creation, title_id set as primary key
CREATE TABLE "titles" (
    "title_id" VARCHAR(5)   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

-- employees table creation, employee id (emp_id) set as primary key
-- hire date is in varchar format because it was not in correct format for sql date format
CREATE TABLE "employees" (
    "emp_id" INT(6)   NOT NULL,
    "emp_title" VARCHAR(5)   NOT NULL,
    "birth_date" VARCHAR(10)   NOT NULL,
    "first_name" VARCHAR(50)   NOT NULL,
    "last_name" VARCHAR(50)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" VARCHAR(10)   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_id"
     )
);

-- department employee table creation, serial key used as primary key due to both columns being foreign keys
CREATE TABLE "dept_emp" (
    "key" SERIAL,
    "emp_id" INT(6)   NOT NULL,
    "dept_id" VARCHAR(4)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "key"
     )
);

-- department managers table creation, serial key used as primary key due to both columns being foreign keys
CREATE TABLE "dept_managers" (
    "key" SERIAL,
    "dept_id" VARCHAR(4)   NOT NULL,
    "emp_id" INT(6)   NOT NULL,
    CONSTRAINT "pk_dept_managers" PRIMARY KEY (
        "key"
     )
);

-- salaries table creation, serial key used as primary key because emp_id is a foreign key
CREATE TABLE "salaries" (
    "key" SERIAL,
    "emp_id" INT(6)   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "key"
     )
);


-- set all foreign keys
-- employees table foreign key to title table
ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title" FOREIGN KEY("emp_title")
REFERENCES "titles" ("title_id");

-- department employees foreign keys to employees table and department table
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_id" FOREIGN KEY("emp_id")
REFERENCES "employees" ("emp_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_id" FOREIGN KEY("dept_id")
REFERENCES "department" ("dept_id");

-- department managers foreign keys to employees table and department table
ALTER TABLE "dept_managers" ADD CONSTRAINT "fk_dept_managers_dept_id" FOREIGN KEY("dept_id")
REFERENCES "department" ("dept_id");

ALTER TABLE "dept_managers" ADD CONSTRAINT "fk_dept_managers_emp_id" FOREIGN KEY("emp_id")
REFERENCES "employees" ("emp_id");

-- salaries foreign key to employees table
ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_id" FOREIGN KEY("emp_id")
REFERENCES "employees" ("emp_id");
