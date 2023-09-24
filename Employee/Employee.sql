-- Таблица Сотрудник
create table if not exists Employee(
	id SERIAL primary key,
	name VARCHAR(60) not null,
	manager_id INTEGER references Employee(id),
	department_id INTEGER
);