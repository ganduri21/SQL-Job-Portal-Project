create database jobportaldb;
use jobportaldb;
create table users(
userid int primary key auto_increment,
name varchar(100),
email varchar(100) unique,
phone varchar(10),
skills varchar(25),
experince int
);
create table companies(
companyid int primary key auto_increment,
companyname varchar(100),
location varchar(100)
);
create table jobs(
jobid int primary key auto_increment,
companyid int,
jobtitle varchar(100),
salary decimal(10,2),
reqskills varchar(255),
foreign key (companyid)references companies (companyid)
);
CREATE TABLE Applications (
    applicationid INT PRIMARY KEY AUTO_INCREMENT,
    userid INT,
    jobid INT,
    applicationdate DATE,
    status VARCHAR(50),
    FOREIGN KEY (userid) REFERENCES Users(userid),
    FOREIGN KEY (jobid) REFERENCES Jobs(jobid)
);
INSERT INTO Users (name, email, phone, skills, experince) VALUES
('Harshitha', 'harshi@gmail.com', '9876543210', 'Java, SQL', 0),
('Rahul', 'rahul@gmail.com', '9123456780', 'Python, SQL', 2);
insert into companies (companyname ,location)values
('tcs','hyderbad'),
('hcl','banglore');
insert into jobs (companyid, jobtitle, salary, reqskills) values
(1, 'Java Developer', 35000.00, 'Java, SQL'),
(2, 'Data Analyst', 40000.00, 'SQL, Excel');
insert into Applications(userid,jobid,applicationdate,status)values
(1,1,'2026-02-15','applied'),
(2,2,'2026-02-16','selected');
SELECT u.name, j.jobtitle, c.companyname, a.status
FROM Applications a
JOIN Users u ON a.userid = u.userid
JOIN Jobs j ON a.jobid = j.jobid
JOIN Companies c ON j.companyid = c.companyid;
SELECT j.jobtitle, COUNT(a.applicationid) AS totalapplicants
FROM Jobs j
LEFT JOIN Applications a ON j.jobid = a.jobid
GROUP BY j.jobtitle;
