-- Table: public.school
-- Drop the table and sequence if they exist
DROP TABLE IF EXISTS public.school;
DROP SEQUENCE IF EXISTS public.school_id_seq;

-- Create the sequence
CREATE SEQUENCE IF NOT EXISTS public.school_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

-- Create the school table with a school_id column
CREATE TABLE IF NOT EXISTS public.school
(
    school_id integer NOT NULL DEFAULT nextval('school_id_seq'::regclass),
    school_name character varying(40) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT school_pkey PRIMARY KEY (school_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.school
    OWNER to postgres;

COMMENT ON TABLE public.school
    IS 'Physical entity that houses instructors and course offerings.';


-- Alter the sequence to own the school_id column
ALTER SEQUENCE public.school_id_seq
    OWNED BY public.school.school_id;

-- Set the owner of the sequence
ALTER SEQUENCE public.school_id_seq
    OWNER TO postgres;

-- Table: public.department
-- Drop the the table then the sequence if they exist
DROP TABLE IF EXISTS public.department;
DROP SEQUENCE IF EXISTS public.department_id_seq;

--Create the sequence then the table
CREATE SEQUENCE IF NOT EXISTS public.department_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
CREATE TABLE IF NOT EXISTS public.department
(
    department_id integer NOT NULL DEFAULT nextval('department_id_seq'::regclass),
    department_name character varying(40) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT department_pkey PRIMARY KEY (department_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.department
    OWNER to postgres;

COMMENT ON TABLE public.department
    IS 'The department in a school responsible for a course.';

-- Alter the sequence to own the course_id column
ALTER SEQUENCE public.department_id_seq
    OWNED BY public.department.department_id;

-- Set the owner of the sequence
ALTER SEQUENCE public.department_id_seq
    OWNER TO postgres;


-- Table: public.course
-- Drop the the table then the sequence if they exist
DROP TABLE IF EXISTS public.course;
DROP SEQUENCE IF EXISTS public.course_id_seq;

--Create the sequence then the table
CREATE SEQUENCE IF NOT EXISTS public.course_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;


CREATE TABLE IF NOT EXISTS public.course
(
    course_id integer NOT NULL DEFAULT nextval('course_id_seq'::regclass),
    title character varying(100) COLLATE pg_catalog."default" NOT NULL,
    department_id integer NOT NULL,
    CONSTRAINT course_pkey PRIMARY KEY (course_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.course
    OWNER to postgres;

COMMENT ON TABLE public.course
    IS 'Master table for courses offered at the institution.';

COMMENT ON COLUMN public.course.title
    IS 'The title for the course. Example: Calculus 101';

COMMENT ON COLUMN public.course.department_id
    IS 'Foreign Key to the department table.';

-- Alter the sequence to own the course_id column
ALTER SEQUENCE public.course_id_seq
    OWNED BY public.course.course_id;

-- Set the owner of the sequence
ALTER SEQUENCE public.course_id_seq
    OWNER TO postgres;

-- Table: public.course_offering
-- Drop the the table then the sequence if they exist
DROP TABLE IF EXISTS public.course_offering;
DROP SEQUENCE IF EXISTS public.course_offering_id_seq;

--Create the sequence then the table
CREATE SEQUENCE IF NOT EXISTS public.course_offering_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
	
CREATE TABLE IF NOT EXISTS public.course_offering
(
    course_offering_id integer NOT NULL DEFAULT nextval('course_offering_id_seq'::regclass),
    course_id integer NOT NULL,
    location character varying(40) COLLATE pg_catalog."default" NOT NULL,
    days character varying(40) COLLATE pg_catalog."default" NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    CONSTRAINT course_offering_pkey PRIMARY KEY (course_offering_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.course_offering
    OWNER to postgres; 
	
-- Alter the sequence to own the course_offering_id column
ALTER SEQUENCE public.course_offering_id_seq
    OWNED BY public.course_offering.course_offering_id;

-- Set the owner of the sequence
ALTER SEQUENCE public.course_offering_id_seq
    OWNER TO postgres;

-- Table: public.person
-- Drop the the table then the sequence if they exist
DROP TABLE IF EXISTS public.person;
DROP SEQUENCE IF EXISTS public.person_id_seq;

--Create the sequence then the table
CREATE SEQUENCE IF NOT EXISTS public.person_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE TABLE IF NOT EXISTS public.person
(
    person_id integer NOT NULL DEFAULT nextval('person_id_seq'::regclass),
    last_name character varying(40) COLLATE pg_catalog."default" NOT NULL,
    first_name character varying(40) COLLATE pg_catalog."default" NOT NULL,
    middle_name character varying(40) COLLATE pg_catalog."default",
    personal_title character varying(10) COLLATE pg_catalog."default",
    suffix character varying(10) COLLATE pg_catalog."default",
    nickname character varying(30)[] COLLATE pg_catalog."default",
    gender_id integer,
    birth_date date,
    comment text COLLATE pg_catalog."default",
    CONSTRAINT person_pkey PRIMARY KEY (person_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.person
    OWNER to postgres;

COMMENT ON TABLE public.person
    IS 'Represents the base information for a person. A person can serve different roles. For example, parent, teacher, student, ....';

COMMENT ON COLUMN public.person.person_id
    IS 'Primary key for the person table.';

COMMENT ON COLUMN public.person.personal_title
    IS 'This is titles such as Jr., Sr. etc';

COMMENT ON COLUMN public.person.suffix
    IS 'Dr., Mr., Ms., etc.';

-- Alter the sequence to own the person_id column
ALTER SEQUENCE public.person_id_seq
    OWNED BY public.person.person_id;

-- Set the owner of the sequence
ALTER SEQUENCE public.person_id_seq
    OWNER TO postgres;

-- Table: public.guardian
-- Drop the the table then the sequence if they exist
DROP TABLE IF EXISTS public.guardian;
DROP SEQUENCE IF EXISTS public.guardian_id_seq;

--Create the sequence then the table
CREATE SEQUENCE IF NOT EXISTS public.guardian_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE TABLE IF NOT EXISTS public.guardian
(
    guardian_id integer NOT NULL DEFAULT nextval('guardian_id_seq'::regclass),
    person_id integer NOT NULL,
    authorized_indicator character(1) COLLATE pg_catalog."default" NOT NULL DEFAULT 'N'::bpchar,
    emergency_indicator character(1) COLLATE pg_catalog."default" NOT NULL DEFAULT 'N'::bpchar,
    CONSTRAINT guardian_pkey PRIMARY KEY (guardian_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.guardian
    OWNER to postgres;

COMMENT ON TABLE public.guardian
    IS 'This is a subtype of the person table.';

-- Alter the sequence to own the person_id column
ALTER SEQUENCE public.guardian_id_seq
    OWNED BY public.guardian.guardian_id;

-- Set the owner of the sequence
ALTER SEQUENCE public.guardian_id_seq
    OWNER TO postgres;

-- Table: public.student
-- Drop the the table then the sequence if they exist
DROP TABLE IF EXISTS public.student;
DROP SEQUENCE IF EXISTS public.student_id_seq;

--Create the sequence then the table
CREATE SEQUENCE IF NOT EXISTS public.student_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE TABLE IF NOT EXISTS public.student
(
    student_id integer NOT NULL DEFAULT nextval('student_id_seq'::regclass),
    person_id integer,
    grade_id integer,
    CONSTRAINT student_pkey PRIMARY KEY (student_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.student
    OWNER to postgres;

-- Alter the sequence to own the student_id column
ALTER SEQUENCE public.student_id_seq
    OWNED BY public.student.student_id;


-- Set the owner of the sequence
ALTER SEQUENCE public.student_id_seq
    OWNER TO postgres;

-- Table: public.address
-- Drop the the table then the sequence if they exist
DROP TABLE IF EXISTS public.address;
DROP SEQUENCE IF EXISTS public.address_id_seq;

--Create the sequence then the table
CREATE SEQUENCE IF NOT EXISTS public.address_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE TABLE IF NOT EXISTS public.address
(
    address_id integer NOT NULL,
    address1 character varying(255) COLLATE pg_catalog."default" NOT NULL,
    address2 character varying(255) COLLATE pg_catalog."default",
    city_name character varying(40) COLLATE pg_catalog."default" NOT NULL,
    state_code character varying(2) COLLATE pg_catalog."default" NOT NULL DEFAULT 'CO'::character varying,
    zip_code character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT address_pkey PRIMARY KEY (address_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.address
    OWNER to postgres;

COMMENT ON TABLE public.address
    IS 'Master table for holding addresses.';

-- Alter the sequence to own the address_id column
ALTER SEQUENCE public.address_id_seq
    OWNED BY public.address.address_id;

-- Set the owner of the sequence
ALTER SEQUENCE public.address_id_seq
    OWNER TO postgres;

-- Table: public.telecommunications_number
-- Drop the the table then the sequence if they exist
DROP TABLE IF EXISTS public.telecommunications_number;
DROP SEQUENCE IF EXISTS public.telecommunications_number_id_seq;

--Create the sequence then the table
CREATE SEQUENCE IF NOT EXISTS public.telecommunications_number_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
CREATE TABLE IF NOT EXISTS public.telecommunications_number
(
    telecommunications_number_id integer NOT NULL DEFAULT nextval('telecommunications_number_id_seq'::regclass),
    area_code smallint NOT NULL,
    contact_number character varying(40) COLLATE pg_catalog."default" NOT NULL,
    country_code integer,
    CONSTRAINT telecommunications_number_pkey PRIMARY KEY (telecommunications_number_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.telecommunications_number
    OWNER to postgres;

COMMENT ON TABLE public.telecommunications_number
    IS 'Method of contacting by phone, etc. Examples: home phone, work phone, fax, mobile phone.';

-- Alter the sequence to own the telecommunications_number_id column
ALTER SEQUENCE public.telecommunications_number_id_seq
    OWNED BY public.telecommunications_number.telecommunications_number_id;

-- Set the owner of the sequence
ALTER SEQUENCE public.telecommunications_number_id_seq
    OWNER TO postgres;

-- Table: public.role_type
-- Drop the the table then the sequence if they exist
DROP TABLE IF EXISTS public.role_type;
DROP SEQUENCE IF EXISTS public.role_type_id_seq;

--Create the sequence then the table
CREATE SEQUENCE IF NOT EXISTS public.role_type_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
CREATE TABLE IF NOT EXISTS public.role_type
(
    role_type_id integer NOT NULL DEFAULT nextval('role_type_id_seq'::regclass),
    description character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT role_type_pkey PRIMARY KEY (role_type_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.role_type
    OWNER to postgres;

-- Alter the sequence to own the role_type_id column
ALTER SEQUENCE public.role_type_id_seq
    OWNED BY public.role_type.role_type_id;

-- Set the owner of the sequence
ALTER SEQUENCE public.role_type_id_seq
    OWNER TO postgres;

-- Table: public.gender
-- Drop the the table then the sequence if they exist
DROP TABLE IF EXISTS public.gender;
DROP SEQUENCE IF EXISTS public.gender_id_seq;

--Create the sequence then the table
CREATE SEQUENCE IF NOT EXISTS public.gender_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
	
CREATE TABLE IF NOT EXISTS public.gender
(
    gender_id integer NOT NULL DEFAULT nextval('gender_id_seq'::regclass),
    gender_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT genders_pkey PRIMARY KEY (gender_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.gender
    OWNER to postgres;
-- Alter the sequence to own the gender_id column
ALTER SEQUENCE public.gender_id_seq
    OWNED BY public.gender.gender_id;

-- Set the owner of the sequence
ALTER SEQUENCE public.gender_id_seq
    OWNER TO postgres;

/*

-- Insert data into the Person table.
USE School
GO
SET IDENTITY_INSERT dbo.Person ON
GO
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (1, 'Abercrombie', 'Kim', '1995-03-11', null, 'Instructor');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (2, 'Barzdukas', 'Gytis', null, '2005-09-01', 'Student');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (3, 'Justice', 'Peggy', null, '2001-09-01', 'Student');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (4, 'Fakhouri', 'Fadi', '2002-08-06', null, 'Instructor');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (5, 'Harui', 'Roger', '1998-07-01', null, 'Instructor');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (6, 'Li', 'Yan', null, '2002-09-01', 'Student');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (7, 'Norman', 'Laura', null, '2003-09-01', 'Student');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (8, 'Olivotto', 'Nino', null, '2005-09-01', 'Student');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (9, 'Tang', 'Wayne', null, '2005-09-01', 'Student');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (10, 'Alonso', 'Meredith', null, '2002-09-01', 'Student');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (11, 'Lopez', 'Sophia', null, '2004-09-01', 'Student');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (12, 'Browning', 'Meredith', null, '2000-09-01', 'Student');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (13, 'Anand', 'Arturo', null, '2003-09-01', 'Student');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (14, 'Walker', 'Alexandra', null, '2000-09-01', 'Student');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (15, 'Powell', 'Carson', null, '2004-09-01', 'Student');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (16, 'Jai', 'Damien', null, '2001-09-01', 'Student');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (17, 'Carlson', 'Robyn', null, '2005-09-01', 'Student');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (18, 'Zheng', 'Roger', '2004-02-12', null, 'Instructor');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (19, 'Bryant', 'Carson', null, '2001-09-01', 'Student');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (20, 'Suarez', 'Robyn', null, '2004-09-01', 'Student');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (21, 'Holt', 'Roger', null, '2004-09-01', 'Student');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (22, 'Alexander', 'Carson', null, '2005-09-01', 'Student');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (23, 'Morgan', 'Isaiah', null, '2001-09-01', 'Student');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (24, 'Martin', 'Randall', null, '2005-09-01', 'Student');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (25, 'Kapoor', 'Candace', '2001-01-15', null, 'Instructor');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (26, 'Rogers', 'Cody', null, '2002-09-01', 'Student');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (27, 'Serrano', 'Stacy', '1999-06-01', null, 'Instructor');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (28, 'White', 'Anthony', null, '2001-09-01', 'Student');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (29, 'Griffin', 'Rachel', null, '2004-09-01', 'Student');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (30, 'Shan', 'Alicia', null, '2003-09-01', 'Student');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (31, 'Stewart', 'Jasmine', '1997-10-12', null, 'Instructor');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (32, 'Xu', 'Kristen', '2001-7-23', null, 'Instructor');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (33, 'Gao', 'Erica', null, '2003-01-30', 'Student');
INSERT INTO dbo.Person (PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator)
VALUES (34, 'Van Houten', 'Roger', '2000-12-07', null, 'Instructor');
GO
SET IDENTITY_INSERT dbo.Person OFF
GO

-- Insert data into the Department table.
INSERT INTO dbo.Department (DepartmentID, [Name], Budget, StartDate, Administrator)
VALUES (1, 'Engineering', 350000.00, '2007-09-01', 2);
INSERT INTO dbo.Department (DepartmentID, [Name], Budget, StartDate, Administrator)
VALUES (2, 'English', 120000.00, '2007-09-01', 6);
INSERT INTO dbo.Department (DepartmentID, [Name], Budget, StartDate, Administrator)
VALUES (4, 'Economics', 200000.00, '2007-09-01', 4);
INSERT INTO dbo.Department (DepartmentID, [Name], Budget, StartDate, Administrator)
VALUES (7, 'Mathematics', 250000.00, '2007-09-01', 3);
GO



-- Insert data into the Course table.
INSERT INTO dbo.Course (CourseID, Title, Credits, DepartmentID)
VALUES (1050, 'Chemistry', 4, 1);
INSERT INTO dbo.Course (CourseID, Title, Credits, DepartmentID)
VALUES (1061, 'Physics', 4, 1);
INSERT INTO dbo.Course (CourseID, Title, Credits, DepartmentID)
VALUES (1045, 'Calculus', 4, 7);
INSERT INTO dbo.Course (CourseID, Title, Credits, DepartmentID)
VALUES (2030, 'Poetry', 2, 2);
INSERT INTO dbo.Course (CourseID, Title, Credits, DepartmentID)
VALUES (2021, 'Composition', 3, 2);
INSERT INTO dbo.Course (CourseID, Title, Credits, DepartmentID)
VALUES (2042, 'Literature', 4, 2);
INSERT INTO dbo.Course (CourseID, Title, Credits, DepartmentID)
VALUES (4022, 'Microeconomics', 3, 4);
INSERT INTO dbo.Course (CourseID, Title, Credits, DepartmentID)
VALUES (4041, 'Macroeconomics', 3, 4);
INSERT INTO dbo.Course (CourseID, Title, Credits, DepartmentID)
VALUES (4061, 'Quantitative', 2, 4);
INSERT INTO dbo.Course (CourseID, Title, Credits, DepartmentID)
VALUES (3141, 'Trigonometry', 4, 7);
GO

-- Insert data into the OnlineCourse table.
INSERT INTO dbo.OnlineCourse (CourseID, URL)
VALUES (2030, 'http://www.fineartschool.net/Poetry');
INSERT INTO dbo.OnlineCourse (CourseID, URL)
VALUES (2021, 'http://www.fineartschool.net/Composition');
INSERT INTO dbo.OnlineCourse (CourseID, URL)
VALUES (4041, 'http://www.fineartschool.net/Macroeconomics');
INSERT INTO dbo.OnlineCourse (CourseID, URL)
VALUES (3141, 'http://www.fineartschool.net/Trigonometry');

--Insert data into OnsiteCourse table.
INSERT INTO dbo.OnsiteCourse (CourseID, Location, Days, [Time])
VALUES (1050, '123 Smith', 'MTWH', '11:30');
INSERT INTO dbo.OnsiteCourse (CourseID, Location, Days, [Time])
VALUES (1061, '234 Smith', 'TWHF', '13:15');
INSERT INTO dbo.OnsiteCourse (CourseID, Location, Days, [Time])
VALUES (1045, '121 Smith','MWHF', '15:30');
INSERT INTO dbo.OnsiteCourse (CourseID, Location, Days, [Time])
VALUES (4061, '22 Williams', 'TH', '11:15');
INSERT INTO dbo.OnsiteCourse (CourseID, Location, Days, [Time])
VALUES (2042, '225 Adams', 'MTWH', '11:00');
INSERT INTO dbo.OnsiteCourse (CourseID, Location, Days, [Time])
VALUES (4022, '23 Williams', 'MWF', '9:00');

-- Insert data into the CourseInstructor table.
INSERT INTO dbo.CourseInstructor(CourseID, PersonID)
VALUES (1050, 1);
INSERT INTO dbo.CourseInstructor(CourseID, PersonID)
VALUES (1061, 31);
INSERT INTO dbo.CourseInstructor(CourseID, PersonID)
VALUES (1045, 5);
INSERT INTO dbo.CourseInstructor(CourseID, PersonID)
VALUES (2030, 4);
INSERT INTO dbo.CourseInstructor(CourseID, PersonID)
VALUES (2021, 27);
INSERT INTO dbo.CourseInstructor(CourseID, PersonID)
VALUES (2042, 25);
INSERT INTO dbo.CourseInstructor(CourseID, PersonID)
VALUES (4022, 18);
INSERT INTO dbo.CourseInstructor(CourseID, PersonID)
VALUES (4041, 32);
INSERT INTO dbo.CourseInstructor(CourseID, PersonID)
VALUES (4061, 34);
GO

--Insert data into the OfficeAssignment table.
INSERT INTO dbo.OfficeAssignment(InstructorID, Location)
VALUES (1, '17 Smith');
INSERT INTO dbo.OfficeAssignment(InstructorID, Location)
VALUES (4, '29 Adams');
INSERT INTO dbo.OfficeAssignment(InstructorID, Location)
VALUES (5, '37 Williams');
INSERT INTO dbo.OfficeAssignment(InstructorID, Location)
VALUES (18, '143 Smith');
INSERT INTO dbo.OfficeAssignment(InstructorID, Location)
VALUES (25, '57 Adams');
INSERT INTO dbo.OfficeAssignment(InstructorID, Location)
VALUES (27, '271 Williams');
INSERT INTO dbo.OfficeAssignment(InstructorID, Location)
VALUES (31, '131 Smith');
INSERT INTO dbo.OfficeAssignment(InstructorID, Location)
VALUES (32, '203 Williams');
INSERT INTO dbo.OfficeAssignment(InstructorID, Location)
VALUES (34, '213 Smith');

-- Insert data into the StudentGrade table.
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (2021, 2, 4);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (2030, 2, 3.5);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (2021, 3, 3);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (2030, 3, 4);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (2021, 6, 2.5);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (2042, 6, 3.5);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (2021, 7, 3.5);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (2042, 7, 4);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (2021, 8, 3);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (2042, 8, 3);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (4041, 9, 3.5);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (4041, 10, null);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (4041, 11, 2.5);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (4041, 12, null);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (4061, 12, null);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (4022, 14, 3);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (4022, 13, 4);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (4061, 13, 4);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (4041, 14, 3);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (4022, 15, 2.5);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (4022, 16, 2);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (4022, 17, null);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (4022, 19, 3.5);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (4061, 20, 4);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (4061, 21, 2);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (4022, 22, 3);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (4041, 22, 3.5);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (4061, 22, 2.5);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (4022, 23, 3);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (1045, 23, 1.5);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (1061, 24, 4);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (1061, 25, 3);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (1050, 26, 3.5);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (1061, 26, 3);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (1061, 27, 3);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (1045, 28, 2.5);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (1050, 28, 3.5);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (1061, 29, 4);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (1050, 30, 3.5);
INSERT INTO dbo.StudentGrade (CourseID, StudentID, Grade)
VALUES (1061, 30, 4);
GO*/