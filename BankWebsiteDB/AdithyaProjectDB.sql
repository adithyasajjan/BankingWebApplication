use ServletUser;
show tables;

show databases;

select * from  Beneficiary;

select * from Transaction;

delete from Transaction;

create table ElectricityBill(consumerNo int, name varchar(20), ElectricityBiller varchar(20), Consumption int, BillDate date, BillDueDate date, PaymentDate date, PaymentStatus varchar(50), BillAmount double);

insert into ElectricityBill values(1, "Sanjeev", "BESCOM", 274, "2022-09-29", "2022-10-29", "2022-10-22", "Pending", 2450);
insert into ElectricityBill values(2, "Adithya", "BESCOM", 125, "2022-09-29", "2022-10-29", "2022-10-22", "Pending", 1000);
insert into ElectricityBill values(3, "Umar", "BESCOM", 50, "2022-09-29", "2022-10-29", "2022-10-22", "Pending", 560);
insert into ElectricityBill values(4, "Venkatesh", "BESCOM", 346, "2022-09-29", "2022-10-29", "2022-10-22", "Pending", 3000);
insert into ElectricityBill values(5, "Thriveni", "MESCOM", 100, "2022-09-29", "2022-10-29", "2022-10-22", "Pending", 300);
insert into ElectricityBill values(6, "Niranjan", "HESCOM", 60, "2022-09-29", "2022-10-29", "2022-10-22", "Pending", 120);

delete from ElectricityBill;

select BillAmount from ElectricityBill where PaymentStatus = 'Pending';

insert into ElectricityBill(PaymentDate) values("2022-10-22");

update ElectricityBill set PaymentDate="2022-10-22" where consumerNo=1;

select * from ElectricityBill;

select BillAmount from ElectricityBill where consumerNo=1;

select * from RegisterDetails;

update ElectricityBill set PaymentStatus="Pending" where consumerNo=1;

update ElectricityBill set PaymentStatus="Pending" where consumerNo=1;	

drop table ElectricityBill;

delete from ElectricityBill where PaymentDate="2022-10-22";

select * from Transaction;

delete from Transaction;

create table Fastag(name varchar(20), vehicleNum varchar(30), vehicleName varchar(20), amount double);
insert into Fastag(name, vehicleNum, vehicleName) values("Sanjeev", "AP 05 BV 7917", "Maruthi");

delete from Fastag where vehicleNum="AP 05 BV 7917";

select * from Fastag;

create table fname(fullname varchar(20));

drop table fname;

select * from User;