drop table contact
drop table users
drop table card

CREATE TABLE roles (
id_role int primary key identity(1,1),
name varchar (30)
)

CREATE TABLE users(
id_user int primary key identity(1,1),
email varchar (50),
password varchar(50),
id_role int,
constraint fk_user_rol foreign key (id_role) references roles(id_role)
)

CREATE TABLE departamento(
id_departamento int primary key identity(1,1),
name varchar(50)
)

CREATE TABLE municipio (
id_municipio int primary key identity(1,1),
name varchar(50),
id_departamento int
constraint fk_municipio_departamento foreign key (id_departamento) references departamento(id_departamento)
)

CREATE TABLE contact(
id_contact int primary key identity(1,1),
first_name varchar(50),
last_name varchar(50),
phone_number varchar(8),
home_address varchar(50),
id_user int,
id_municipio int,
constraint fk_contacts_user foreign key (id_user) references users(id_user),
constraint fk_contacts_municipio foreign key (id_municipio) references municipio(id_municipio)
)

CREATE TABLE card(
id_card int primary key identity(1,1),
cardtype varchar(20),
number nvarchar(16),
exp_month nvarchar(2),
exp_year nvarchar(2),
id_user int,
constraint fk_card_user foreign key (id_user) references users(id_user)
)