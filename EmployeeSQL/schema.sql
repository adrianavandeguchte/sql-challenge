-- QUICKDBD created schema

-- department table creation, dept_id set as primary key
CREATE TABLE "department" (
    "dept_id" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_department" PRIMARY KEY (
        "dept_id"
     )
);

-- titles table creation, title_id set as primary key
CREATE TABLE "titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

-- employees table creation, employee id (emp_id) set as primary key
CREATE TABLE "employees" (
    "emp_id" INT   NOT NULL,
    "emp_title" VARCHAR   NOT NULL,
    "birth_date" VARCHAR   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" VARCHAR   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_id"
     )
);

-- department employee table creation, serial key used as primary key due to both columns being foreign keys
CREATE TABLE "dept_emp" (
    "key" SERIAL,
    "emp_id" INT   NOT NULL,
    "dept_id" VARCHAR   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "key"
     )
);

-- department managers table creation, serial key used as primary key due to both columns being foreign keys
CREATE TABLE "dept_managers" (
    "key" SERIAL,
    "dept_id" VARCHAR   NOT NULL,
    "emp_id" INT   NOT NULL,
    CONSTRAINT "pk_dept_managers" PRIMARY KEY (
        "key"
     )
);

-- salaries table creation, serial key used as primary key because emp_id is a foreign key
CREATE TABLE "salaries" (
    "key" SERIAL,
    "emp_id" int   NOT NULL,
    "salary" int   NOT NULL,
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