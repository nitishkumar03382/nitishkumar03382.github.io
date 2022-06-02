use ASM

GO

CREATE TABLE Admin(
	admin_id int identity(1,1) primary key,
	fname varchar(255),
	lname varchar(255),
	email varchar(255) not null unique,
	password varchar(255)not null unique,
	contact_NO int,
	address varchar(255),
	DOB date,
	DOJ date
);

GO

CREATE TABLE Department(
	dept_id int identity(1,1) primary key,
	dept_name varchar(255)
);

GO

CREATE TABLE Job_Title(
	job_id int identity(1,1) primary key,
	job_title varchar(255),
	dept_id int
);

ALTER TABLE Job_Title
ADD CONSTRAINT FK_dept_id
FOREIGN KEY (dept_id)
references Department(dept_id);

GO

create table Duty_Duration(
	duty_id int identity(1,1) primary key,
	emp_id int,
	job_id int,
	in_Time date,
	out_Time date,
	duration int,
	date date
);

ALTER TABLE Duty_Duration
ADD CONSTRAINT FK_job_id
FOREIGN KEY (job_id)
references Job_Title(job_id);

ALTER TABLE Duty_Duration
ADD CONSTRAINT FK_emp_id
FOREIGN KEY (emp_id)
references Employee(emp_id);

GO

create table Leave(
	leave_id int identity(1,1) primary key,
	emp_id int,
	job_id int,
	date date,
	start_DayOf_Leave date,
	end_DayOf_Leave date,
	reason varchar(500),
	status_Of_Leave varchar(255),

);

ALTER TABLE Leave
ADD CONSTRAINT FK_emp_id
FOREIGN KEY (emp_id)
references Employee(emp_id);

ALTER TABLE Leave
ADD CONSTRAINT FK_job_id
FOREIGN KEY (job_id)
references Job_Title(job_id);

GO

create table Attendance_Report(
	attend_id int identity(1,1) primary key,
	emp_id int,
	duty_id int,
	job_id int,
	leave_id int,
	total_Labour int,
	total_Absent int,
	salary decimal,
	date date

);

ALTER TABLE Attendance_Report
ADD CONSTRAINT FK_emp_id
FOREIGN KEY (emp_id)
references Employee(emp_id);

ALTER TABLE Attendance_Report
ADD CONSTRAINT FK_job_id
FOREIGN KEY (job_id)
references Job_Title(job_id);

ALTER TABLE Attendance_Report
ADD CONSTRAINT FK_duty_id
FOREIGN KEY (duty_id)
references Duty_Duration(duty_id);

ALTER TABLE Attendance_Report
ADD CONSTRAINT FK_leave_id
FOREIGN KEY (leave_id)
references Leave(leave_id);