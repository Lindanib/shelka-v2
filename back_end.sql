CREATE TABLE admin(
id INT PRIMARY KEY,
username VARCHAR(45) NOT NULL,
password VARCHAR(45) NOT NULL
);
INSERT INTO admin VALUES (100, 'Arjun', 'abc123');
CREATE TABLE department(
Depart_id INT PRIMARY KEY,
Depart_name VARCHAR(45) UNIQUE
);
INSERT INTO department VALUES ('101', 'IT');
INSERT INTO department VALUES ('102', 'Electronics');
INSERT INTO department VALUES ('103', 'Customer Care');
INSERT INTO department VALUES ('104', 'Marketing');
INSERT INTO department VALUES ('105', 'Development');
INSERT INTO department VALUES ('106', 'Finance');
SELECT * FROM department;
CREATE TABLE `job`(
Job_Title varchar(20),
basic_salary int(10),
PRIMARY KEY (`Job_Title`) );
INSERT INTO `job`(`Job_Title`,`basic_salary`) VALUES ('manager',40000);
INSERT INTO `job`(`Job_Title`,`basic_salary`) VALUES ('executive',45000);
INSERT INTO `job`(`Job_Title`,`basic_salary`) VALUES ('director',50000);
INSERT INTO `job`(`Job_Title`,`basic_salary`) VALUES ('chief',60000);
INSERT INTO `job`(`Job_Title`,`basic_salary`) VALUES ('accountant',35000);
CREATE TABLE `employee` (
`Employee_id` INT NOT NULL,
`Name` varchar(200) NOT NULL,
`Address` varchar(200) NOT NULL,
`Phone_no` varchar(15) UNIQUE,
`Email` varchar(50) UNIQUE,
`Start_date` date NOT NULL,
`dob` date NOT NULL,
`gender` varchar(15) NOT NULL,
`loan` INT NOT NULL,
`p_fund` INT NOT NULL,
`jobtitle` varchar(50) NOT NULL,
`Depart_id` INT NOT NULL,
`managesDepart_id` INT ,
`bank_accno` INT UNIQUE,
PRIMARY KEY (`Employee_id`),
CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Depart_id`) REFERENCES `department`(`Depart_id`),
CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`managesDepart_id`) REFERENCES `department`(`Depart_id`),
CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`jobtitle`) REFERENCES `job`(`Job_Title`));
INSERT INTO `employee` (`Employee_id`, `Name`, `Address`, `Phone_no`, `Email`, `Start_date`, `dob`, `gender`, `loan`, `p_fund`, `jobtitle`, `Depart_id`, `managesDepart_id`, `bank_accno`) VALUES
(1604023, 'Lenhle', 'Dlamini', '12345678', 'LD@gmail.com', '2018-10-10', '1996-02-29', 'female', 0, 2000, 'manager', 106, 106, 236954128),
(1604025, 'Tom', 'Jones', '9977661230', 'TJ@gmail.com', '2018-12-18', '2000-01-01', 'male', 3610, 1500, 'executive', 104, null, 123654784),

CREATE TABLE `payment` (
`pay_no` int(11) unique,
`emp_id` INT NOT NULL,
`year` int(11) NOT NULL,
`month` varchar(50) NOT NULL,
`absence` int(11) NOT NULL,
`loan_cut` float NOT NULL,
`pfund_cut` float NOT NULL,
`overtime` float NOT NULL,
`season_bonus` float NOT NULL,
`other_bonus` float NOT NULL,
`medi_allow` float NOT NULL,
`house_allow` float NOT NULL,
`total_pay` float NOT NULL,
PRIMARY KEY(`emp_id`,`year`,`month`),
CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee`(`Employee_id`));
INSERT INTO payment VALUES(1234,1604023,2022,'december',2,0,1000,6,2000,0,1200,3200,1604023);
INSERT INTO payment VALUES(1234,1604023,2022,'november',2,0,1000,6,2000,0,1200,3200,1604023);
INSERT INTO payment VALUES(1235,1604026,2018,'november',2,0,1000,6,2000,0,1200,3200,1604025);
INSERT INTO payment VALUES(1234,1604023,2022,'december',2,0,1000,6,2000,0,1200,3200,1604025);

