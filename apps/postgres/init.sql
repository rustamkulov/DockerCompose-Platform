create table users
(
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name varchar(20) not null,
    last_name varchar(20)
);