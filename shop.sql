CREATE
DATABASE shop

CREATE TABLE Categories
(
    id   varchar(100) PRIMARY KEY,
    name VARCHAR(100) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL
);

CREATE TABLE Products
(
    id         INT PRIMARY KEY IDENTITY (1, 1),
    name       VARCHAR(100) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL,
    image      varchar(100) COLLATE Latin1_General_100_BIN2_UTF8,
    price      float,
    Categoryid VARCHAR(100)                                      NOT NULL,
    Createdate DATE                                              NOT NULL,
    available  tinyint,
    FOREIGN KEY (Categoryid) REFERENCES Categories (id)
);

select * from Products

INSERT INTO Products (name, image, price, Categoryid, Createdate, available)
VALUES 
('IPhone x', 'http://didonghan.vn/pic/Product/iphone-x-1-min.png', 10.99, '1', '2023-06-15', 1),
('Iphone xs Max', 'https://tse3.mm.bing.net/th?id=OIP.ewwhHHowJsWUepJ39KiT0AHaHa&pid=Api&P=0&h=180', 19.99, '1', '2023-06-18', 1),
('xeomi', 'https://tse1.mm.bing.net/th?id=OIP.hWg38Pk92kLAb8GWWHCKxAHaGO&pid=Api&P=0&h=180', 8.50, '2', '2023-06-20', 0),
('IPhone x', 'http://didonghan.vn/pic/Product/iphone-x-1-min.png', 10.99, '1', '2023-06-15', 1),
('Iphone xs Max', 'https://tse3.mm.bing.net/th?id=OIP.ewwhHHowJsWUepJ39KiT0AHaHa&pid=Api&P=0&h=180', 19.99, '1', '2023-06-18', 1),
('xeomi', 'https://tse1.mm.bing.net/th?id=OIP.hWg38Pk92kLAb8GWWHCKxAHaGO&pid=Api&P=0&h=180', 8.50, '2', '2023-06-20', 0);


CREATE TABLE Accounts
(
    username  varchar(100) PRIMARY KEY,
    password  varchar(100) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL,
    fullname  varchar(100) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL,
    email     varchar(100) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL,
    photo     varchar(500) COLLATE Latin1_General_100_BIN2_UTF8,
    activated tinyint,
    admin     tinyint
);

create table Orders
(
    id         BIGINT PRIMARY KEY IDENTITY (1, 1),
    address    VARCHAR(100) COLLATE Latin1_General_100_BIN2_UTF8 NOT NULL,
    Createdate DATE                                              NOT NULL,
    Username   varchar(100),
    FOREIGN KEY (Username) REFERENCES Accounts (username)
);

create table OrderDetails
(
    id        BIGINT PRIMARY KEY IDENTITY (1, 1),
    price     float,
    quantity  int,
    Productid INT    NOT NULL,
    Orderid   BIGINT NOT NULL,
    FOREIGN KEY (Productid) REFERENCES Products (id),
    FOREIGN KEY (Orderid) REFERENCES Orders (id)
);

delete
Accounts
select *
from Accounts

delete
from Categories
where name = 'tubm';

select *
from OrderDetails

delete
from Orders
select *
from Orders