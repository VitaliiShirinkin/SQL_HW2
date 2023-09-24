-- CREATE TABLE создам таблицу, где genre - название
-- далее один под другим название столбиков
-- таблица жанр
CREATE TABLE IF NOT EXISTS genre (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) not NULL
);

-- таблица исполнитель
CREATE TABLE IF NOT EXISTS performer(
	id SERIAL PRIMARY KEY,
	artist_name VARCHAR(50) not NULL
);

-- таблица альбом
CREATE TABLE IF NOT exists album(
	id SERIAL PRIMARY KEY,
	album_name VARCHAR(50) not null,
	release_year INTEGER
);

-- таблица трек
CREATE TABLE IF NOT exists track(
	id SERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL references album(id),
	track_name VARCHAR(50) not null,
	duration TIME
);

-- таблица сборник
CREATE TABLE IF NOT exists collection(
	id SERIAL PRIMARY KEY,
	collection_name VARCHAR(40) not null,
	release_year INTEGER
);

-- таблица жанр исполнителя
CREATE TABLE IF NOT EXISTS performer_genre(
	genre_id INTEGER NOT NULL references genre(id),
	performer_id INTEGER NOT NULL references performer(id),
	constraint pk PRIMARY KEY(genre_id, performer_id) 
); 

-- таблица альбом исполнителя
CREATE TABLE IF NOT exists artist_album(
	performer_id INTEGER NOT NULL references performer(id),
	albom_id INTEGER NOT NULL references album(id),
	PRIMARY KEY(performer_id, albom_id)
);

-- таблица трек из сборника
CREATE TABLE IF NOT exists track_from_collection(
	track_id INTEGER references track(id),
	collection_id INTEGER references collection(id),
	PRIMARY KEY(track_id, collection_id) 
);
