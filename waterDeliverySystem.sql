use waterDelivery;

create table waterOrder (
	id int primary key auto_increment not null,
    orderDetailsID int not null,
    customerID int not null,
    foreign key(orderDetailsID) references orderDetails(id),
    foreign key(customerID) references customer(id)
);

create table orderDetails (
	id int primary key auto_increment not null,
    quantity int not null,
    waterPrice int not null,
    containerPrice int,
    deliveryPrice int not null,
    cashierEmployeeID int not null,
    deliveryEmployeeID int not null,
    isOrderDispatched boolean not null,
    isOrderArrived boolean not null,
    dispatchedTime timestamp,
    arrivalTime timestamp,
    customerServiceRating int,
    foreign key(deliveryEmployeeID) references employee(id),
    foreign key(cashierEmployeeID) references employee(id)
);

create table customer (
	id int primary key auto_increment not null,
    firstName varchar(10) Not null,
    lastName varchar(10) Not null,
    mobileNumber varchar(10) Not null,
    whatsAppNumber varchar(10),
    email varchar(20),
    birthDate date,
    addressID int not null,
    genderID int,
    foreign key(addressID) references address(id),
    foreign key(genderID) references gender(id)
);

create table employee (
	id int primary key auto_increment not null,
    firstName varchar(10) Not null,
    lastName varchar(10) Not null,
    mobileNumber varchar(10) Not null,
    whatsAppNumber varchar(10),
    email varchar(20),
    birthDate date,
    addressID int,
    genderID int,
    designationID int not null,
    foreign key(addressID) references address(id),
    foreign key(genderID) references gender(id),
    foreign key(designationID) references designation(id)
);

create table designation(
	id int auto_increment not null,
    positionName varchar(10) not null unique,
    departmentID int not null,
    primary key(id),
    foreign key (departmentID) references department(id)
);

create table gender(
	id int auto_increment not null,
    gender varchar(10) not null unique,
    primary key(id)
);

create table department(
	id int auto_increment not null,
    departmentName varchar(20) not null unique,
    primary key(id)
);

create table address(
	id int auto_increment not null,
    country varchar(15) not null,
    province varchar(20) not null,
    city varchar(20) not null,
    street varchar(20) not null,
    houseNumber varchar(10) not null,
    googleLink varchar(1000),
    pinCode varchar(10) not null,
    primary key(id)
);