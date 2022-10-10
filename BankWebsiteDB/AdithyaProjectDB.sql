use ServletUser;
show tables;

create table RegisterDetails(accNo int auto_increment, username varchar(20), passwd varchar(20), pin int, balance double, primary key(accNo));


create table User(username varchar(20), passwd varchar(20), pin int);


create table Transaction(accNo int, dt datetime, Paid_To varchar(20), amount double, description varchar(20), DrORCr varchar(10), balance double);


create table Transfer(Ben_AccNo int, Ben_Name varchar(20), amount double, balance double);


create table Beneficiary(accNo int, name varchar(20));

insert into Beneficiary values(3, "Umar");
insert into Beneficiary values(4, "Venkatesh");
insert into Beneficiary values(5, "Pramod");
insert into Beneficiary values(6, "Pavan");

create table ElectricityBill(consumerNo int, name varchar(20), ElectricityBiller varchar(20), Consumption int, BillDate date, BillDueDate date, 
PaymentDate date, PaymentStatus varchar(50), BillAmount double);

insert into ElectricityBill values(1, "Sanjeev", "BESCOM", 274, "2022-09-29", "2022-10-29", "2022-10-22", "Pending", 2450);
insert into ElectricityBill values(2, "Adithya", "BESCOM", 125, "2022-09-29", "2022-10-29", "2022-10-22", "Pending", 1000);
insert into ElectricityBill values(3, "Umar", "BESCOM", 50, "2022-09-29", "2022-10-29", "2022-10-22", "Pending", 560);
insert into ElectricityBill values(4, "Venkatesh", "BESCOM", 346, "2022-09-29", "2022-10-29", "2022-10-22", "Pending", 3000);
insert into ElectricityBill values(5, "Thriveni", "MESCOM", 100, "2022-09-29", "2022-10-29", "2022-10-22", "Pending", 300);
insert into ElectricityBill values(6, "Niranjan", "HESCOM", 60, "2022-09-29", "2022-10-29", "2022-10-22", "Pending", 120);


create table Fastag(name varchar(20), vehicleNum varchar(30), vehicleName varchar(20), amount double);
insert into Fastag(name, vehicleNum, vehicleName) values("Sanjeev", "AP 05 BV 7917", "Mahindra Scorpio");
insert into Fastag(name, vehicleNum, vehicleName) values("Adithya", "KA 16 MP 2423", "Ford Figo");
insert into Fastag(name, vehicleNum, vehicleName) values("Shivu", "KA 05 QM 5463", "MAruthi Suzuki Brezza");

