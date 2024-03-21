Microsoft Windows [Version 10.0.22631.3296]
(c) Microsoft Corporation. All rights reserved.

C:\Users\HP User>mysql -u root
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 10
Server version: 10.4.28-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> create database RPL_Book;
Query OK, 1 row affected (0.005 sec)

MariaDB [(none)]> use RPL_Book;
Database changed

MariaDB [RPL_Book]> create table Author(
    -> name varchar(100) not null primary key,
    -> address varchar(255) not null,
    -> URL varchar(255) not null
    -> );
Query OK, 0 rows affected (0.017 sec)

MariaDB [RPL_Book]> create table Publisher(
    -> name varchar(100) not null primary key,
    -> address varchar(255) not null,
    -> phone varchar(255) not null,
    -> URL varchar(255) not null
    -> );
Query OK, 0 rows affected (0.078 sec)

MariaDB [RPL_Book]> create table Customer(
    -> email varchar(100) not null primary key,
    -> name varchar(100) not null,
    -> phone varchar(15) not null,
    -> address varchar(255) not null
    -> );
Query OK, 0 rows affected (0.018 sec)

MariaDB [RPL_Book]> create table Shopping_basket(
    -> basketID int not null primary key,
    -> CustomerEmail varchar(100) not null
    -> Order_BookISBN varchar(255) not null,
    -> );
Query OK, 0 rows affected (0.077 sec)

MariaDB [RPL_Book]> create table Warehouse(
    -> code int not null primary key key,
    -> phone varchar(15) not null,
    -> address varchar(255) not null
    -> );
Query OK, 0 rows affected (0.021 sec)

MariaDB [RPL_Book]> create table Warehouse_Stock(
    -> ID_Warehouse int not null,
    -> Count int not null,
    -> BookISBN varchar(100) not null
    -> );
Query OK, 0 rows affected (0.105 sec)

MariaDB [RPL_Book]> create table Book(
    -> ISBN varchar(100) not null primary key,
    -> title varchar(255) not null,
    -> PublisherName varchar(100) not null;
    -> AuthorName varchar(100) not null;
    -> year int not null,
    -> price int not null
    -> );
Query OK, 0 rows affected (0.020 sec)

MariaDB [RPL_Book]> ALTER TABLE Shopping_basket
    -> ADD CONSTRAINT fk_Shopping_basket_Customer
    -> FOREIGN KEY (CustomerEmail)
    -> REFERENCES Customer(email);
Query OK, 0 rows affected (0.134 sec)

MariaDB [RPL_Book]> ALTER TABLE Book
    -> ADD CONSTRAINT fk_Book_Publisher
    -> FOREIGN KEY (PublisherName)
    -> REFERENCES Publisher(name);
Query OK, 0 rows affected (0.063 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [RPL_Book]> ALTER TABLE Book
    -> ADD CONSTRAINT fk_Book_Author
    -> FOREIGN KEY (AuthorName)
    -> REFERENCES Author(name);
Query OK, 0 rows affected (0.138 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [RPL_Book]> ALTER TABLE Warehouse_Stock
    -> ADD CONSTRAINT fk_IDWarehouse_Code
    -> FOREIGN KEY (ID_Warehouse)
    -> REFERENCES Warehouse(code);
Query OK, 0 rows affected (0.143 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [RPL_Book]> ALTER TABLE Warehouse_Stock
    -> ADD CONSTRAINT fk_BookISBN_ISBN
    -> FOREIGN KEY (BookISBN)
    -> REFERENCES Book(ISBN);
Query OK, 0 rows affected (0.098 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [RPL_Book]> ALTER TABLE Shopping_Basket
    -> ADD CONSTRAINT fk_OrderBookISBN_ISBN
    -> FOREIGN KEY (Order_BookISBN)
    -> REFERENCES Book(ISBN);
Query OK, 0 rows affected (0.107 sec)
Records: 0  Duplicates: 0  Warnings: 0
