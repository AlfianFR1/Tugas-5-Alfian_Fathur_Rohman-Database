--Saya langsng mencoba sql-sql ini melalui Xampp phpMyAdmin MariaDB--

------------Soal 1---------------
--Membuat database--
create database books_store;
--membuat tabel books--
CREATE TABLE books (
    id_buku INT AUTO_INCREMENT PRIMARY KEY,
    judul_buku VARCHAR(255) NOT NULL,
    pengarang VARCHAR(255) NOT NULL,
    tahun_terbit INT NOT NULL,
    penerbit VARCHAR(255) NOT NULL,
    tanggal_dibuat DATE NOT NULL,
    tanggal_diupdate DATE NOT NULL
);
--membuat tabel category--
CREATE TABLE category (
    id_category INT AUTO_INCREMENT PRIMARY KEY,
    nama_category VARCHAR(255) NOT NULL,
    tanggal_dibuat DATE NOT NULL,
    tanggal_diupdate DATE NOT NULL
);

-----------Soal 2---------------
--memasukan 10 data tabel books--
INSERT INTO books (judul_buku, pengarang, tahun_terbit, penerbit, tanggal_dibuat, tanggal_diupdate)
VALUES
    ('Building Microservices', 'Sam Newman', 2014, 'O''Reilly Media', '2023-09-18', '2023-09-18'),
    ('Clean Code', 'Robert C. Martin', 2008, 'Prentice Hall', '2023-09-18', '2023-09-18'),
    ('The Pragmatic Programmer', 'Andrew Hunt', 1999, 'AddisonWesley', '2023-09-18', '2023-09-18'),
    ('Design Patterns', 'Erich Gamma', 1994, 'AddisonWesley', '2023-09-18', '2023-09-18'),
    ('Introduction to Algorithms', 'Thomas H. Cormen', 1990, 'MIT Press', '2023-09-18', '2023-09-18'),
    ('The Art of Computer Programming', 'Donald E. Knuth', 1968, 'AddisonWesley', '2023-09-18', '2023-09-18'),
    ('Clean Architecture', 'Robert C. Martin', 2017, 'Prentice Hall', '2023-09-18', '2023-09-18'),
    ('Refactoring', 'Martin Fowler', 1999, 'AddisonWesley', '2023-09-18', '2023-09-18'),
    ('Domain-Driven Design', 'Eric Evans', 2003, 'AddisonWesley', '2023-09-18', '2023-09-18'),
    ('The Mythical Man-Month', 'Frederick Brooks', 1975, 'AddisonWesley', '2023-09-18', '2023-09-18');
--memasukan 10 data tabel category--
INSERT INTO category (nama_category, tanggal_dibuat, tanggal_diupdate)
VALUES
    ('Pemrograman', '2023-09-18', '2023-09-18'),
    ('Fiksi', '2023-09-18', '2023-09-18'),
    ('Nonfiksi', '2023-09-18', '2023-09-18'),
    ('Bisnis', '2023-09-18', '2023-09-18'),
    ('Teknologi', '2023-09-18', '2023-09-18'),
    ('Seni', '2023-09-18', '2023-09-18'),
    ('Sejarah', '2023-09-18', '2023-09-18'),
    ('Sains', '2023-09-18', '2023-09-18'),
    ('Hukum', '2023-09-18', '2023-09-18'),
    ('Kesehatan', '2023-09-18', '2023-09-18');

------------Soal 3---------------
--menampilkan semua data pada tabel books--
SELECT * FROM books;
--menampilkan semua data pada tabel category--
SELECT * FROM category;

------------Soal 4---------------
--update id buku = 1--
UPDATE books SET judul_buku="Building Microservices: Designing FineGrained Systems 1st", tahun_terbit=2015, tanggal_diupdate="2023-09-20" WHERE id_buku=1;

------------Soal 6--------------
--menghapus id data 10 pada tabel books dan category--
DELETE FROM books WHERE id_buku = 10;
DELETE FROM category WHERE id_category = 10;

----------Soal 7------------
-- Membuat tabel book_categories--
CREATE TABLE book_categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_category INT NOT NULL REFERENCES category(id_category),
    id_book INT NOT NULL REFERENCES books(id_buku),
    tanggal_dibuat DATE NOT NULL,
    tanggal_diupdate DATE NOT NULL
);

------------Soal 8----------
-- menambahkan 3 data ke tabel book_categories--
-- Memasukkan 3 data baru ke dalam tabel book_categories--
INSERT INTO book_categories (id_category, id_book, tanggal_dibuat, tanggal_diupdate)
VALUES
    (1, 2, '2023-09-18', '2023-09-18'),
    (5, 3, '2023-09-18', '2023-09-18'),
    (1, 1, '2023-09-18', '2023-09-18');

----------Soal 9------------
--menampilkan data books dan category yang terdapat relasi yang di tampilkan di tabel book_categories--
SELECT books.id_buku, books.judul_buku, category.nama_category FROM books, category, book_categories WHERE books.id_buku=book_categories.id_book AND category.id_category=book_categories.id_category;

----------Soal 10-----------
--Menambah kolom jumlah halaman--
ALTER TABLE books
ADD jumlah_halaman INT;
