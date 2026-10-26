drop database if exists FnSDB;
create database FnSDB;
use FnSDB;

create table Inventory (
    itemId int primary key auto_increment,
    itemName varchar(255) not null,
    price decimal(10, 2) not null,
    quantity int not null,
    itemDescription varchar(255) not null,
    itemPicture varchar(255) not null
)

create procedure set_known_good_state()
begin
    delete from Inventory;
    alter table Inventory auto_increment = 1;
    insert into Inventory (itemName, price, quantity, itemDescription, itemPicture) values
    ('Sample Item', 9.99, 10, 'This is a sample item description.', 'sample.jpg'),
    ('Another Sample Item', 19.99, 1, 'This is another sample item description.', 'another_sample.jpg');
end;

call set_known_good_state();