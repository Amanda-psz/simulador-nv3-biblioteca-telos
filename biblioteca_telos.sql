-- Cria o Banco de Dados
CREATE DATABASE biblioteca_telos

USE biblioteca_telos

--Cria tabela books
CREATE TABLE books (
	id INT PRIMARY KEY IDENTITY(1, 1),
	title VARCHAR(255) NOT NULL UNIQUE,
	author VARCHAR(255) NOT NULL,
	genre VARCHAR(100) NOT NULL,
	published_year INT NOT NULL
)

--Insere as informações da tabela books
INSERT INTO books (title, author, genre, published_year) VALUES 
('Quincas Borba', 'Machado de Assis', 'Ficção', 2023),
('Memórias póstumas de Brás Cubas', 'Machado de Assis', 'Literatura Clássica', 2018),
('Entendendo Algoritmos: Um Guia Ilustrado Para Programadores e Outros Curiosos', 'Aditya Bhargava', 'Didático', 2017),
('A arte da guerra', 'Sun Tzu', 'Didático', 2019),
('A outra face', 'Sidney Sheldon', 'Suspense', 2011),
('Se houver amanhã', 'Sidney Sheldon', 'Suspense', 2012),
('Mindset: A nova psicologia do sucesso', 'Carol S. Dweck', 'Psicologia e Aconselhamento', 2017),
('A estratégia do oceano azul: Como criar novos mercados e tornar a concorrência irrelevante', 'W. Chan Kim', 'Didático', 2019),
('A coragem para liderar: Trabalho duro, conversas difíceis, corações plenos', 'Brené Brown', 'Didático', 2019),
('O poder do hábito: Por que fazemos o que fazemos na vida e nos negócios', 'Charles Duhigg', 'Didático', 2012),
('Otimize seu aprendizado: 94 dicas práticas para aprender mais rápido e fixar o conhecimento', 'Daniel T. Willingham', 'Autoajuda', 2024),
('Cem anos de solidão', 'Gabriel García Márquez', 'Ficção', 1977),
('Dom Quixote', 'Miguel de Cervantes', 'Didático', 2023),
('Introdução à Estatística', 'Mario F. Triola', 'Didático', 2017),
('Python Para Análise de Dados: Tratamento de Dados com Pandas, NumPy & Jupyter', 'Wes McKinney', 'Didático', 2023),
('SQL Para Análise de Dados: Técnicas Avançadas Para Transformar Dados em Insights', 'Cathy Tanimura', 'Didático', 2022),
('O diário de Anne Frank - edição oficial', 'Anne Frank', 'Biografia', 1995),
('Sistemas Operacionais Modernos', 'Andrew S. Tanenbaum', 'Didático', 2015),
('Babel: Ou a necessidade de violência', 'R. F. Kuang', 'Fantasia', 2024),
('Rápido e devagar: Duas formas de pensar', 'Daniel Kahneman', 'Didático', 2012)

--Cria a tabela users
CREATE TABLE users (
	id INT PRIMARY KEY IDENTITY(1, 1),
	name VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL UNIQUE,
)

--Insere as informações da tabela users
INSERT INTO users (name, email) VALUES 
('Fulana de Tal', 'fulanadetal@email.com'),
('Sicrano', 'sicrano@email.com'),
('Beltrano', 'beltrano@gmail.com'),
('Fulano de Tal', 'fulano@email.com'),
('Testando', 'testando@email.com'),
('Teste', 'teste@email.com'),
('Sicraninha', 'sicraninha@email.com'),
('Beltrana', 'beltrana@email.com'),
('Testinho', 'testinho@email.com'),
('Testeteste', 'testeteste@email.com')

--Cria a tabela loans
CREATE TABLE loans (
	loan_id INT PRIMARY KEY,
	book_id INT NOT NULL,
	user_id INT NOT NULL,
	loan_date DATE NOT NULL,
	return_date DATE,
	FOREIGN KEY (book_id) REFERENCES books(id),
	FOREIGN KEY (user_id) REFERENCES users(id)
)

--Insere as informações da tabela loans(emprestimos)
INSERT INTO loans (loan_id, book_id, user_id, loan_date, return_date) VALUES
(1, 1, 2, '2024-03-20', '2024-03-27'),
(2, 10, 6, '2024-06-10', '2024-06-20'),
(3, 19, 8, '2024-09-02', NULL),
(4, 5, 1, '2024-09-04', NULL),
(5, 3, 4, '2024-09-01', NULL),
(6, 18, 6, '2024-09-03', NULL),
(7, 4, 3, '2024-08-09', '2024-08-17'),
(8, 20, 5, '2024-09-02', NULL),
(9, 15, 7, '2024-09-05', NULL),
(10, 2, 9, '2024-09-04', NULL),
(11, 7, 4, '2024-09-05', NULL),
(12, 16, 10, '2024-09-05', NULL),
(13, 12, 9, '2024-09-05', NULL)


--Gerenciamento de Livros:
--Adicionar novos livros ao catálogo
INSERT INTO books (title, author, genre, published_year) VALUES 
('Estatística e Ciência de Dados', 'Pedro Alberto Morettin', 'Didático', 2022)

-- Atualizar informações de livros existentes
UPDATE books SET genre = 'Computação' WHERE id = 21

--Excluir livros do catálogo com um id específico
DELETE FROM books WHERE id IN (7, 18, 20)

-- Buscar livros no catálogo por título, autor, gênero, etc.
SELECT * FROM books 
WHERE title = 'A arte da guerra' AND author = 'Sun Tzu' AND genre = 'Didático'
--buscar livros no catálogo por author ou genero
SELECT * FROM books 
WHERE  author = 'Sidney Sheldon' OR genre = 'Suspense'
--buscar livros no catálogo por autor
SELECT * FROM books 
WHERE author = 'Machado de Assis'

--Gerenciamento de Usuários:
-- Adicionar novos usuários
INSERT INTO users (name, email) VALUES 
('Fulana de Tal', 'fulanadetal@email.com'),
('Sicrano', 'sicrano@email.com'),
('Beltrano', 'beltrano@gmail.com')

--Atualizar informações de usuários existentes
UPDATE users SET email = 'fulana@example.com' WHERE name = 'Fulana de Tal'
--Atualizar informações do usuário caso tenha mudado o nome para casado(a) ou outra situação
UPDATE users SET name = 'Sicrano de Tal' WHERE id = 2

--Buscar usuários por nome, email, etc
SELECT * FROM users
WHERE name IN ('Fulana de Tal', 'Beltrano') OR email IN('testando@email.com', 'sicraninha@email.com')
ORDER BY name

--Empréstimo de Livros:
--Registrar empréstimos de livros:
INSERT INTO loans (loan_id, book_id, user_id, loan_date, return_date) VALUES
(1, 1, 6, '2024-09-02', NULL),
(2, 8, 3, '2024-09-05', NULL)

-- Registrar devoluções de livros, exemplo de devolução:
UPDATE loans
SET return_date = '2024-09-06'
WHERE user_id = 8

--Verificar a disponibilidade de um livro antes de realizar um empréstimo:
SELECT books.title as titulo_livro, books.author as autor
FROM books
LEFT JOIN loans ON books.id = loans.book_id AND loans.return_date IS NULL
WHERE loans.book_id IS NULL

--Relatórios:
-- Gerar relatórios de livros emprestados e devolvidos:
SELECT books.title as titulo_livro, users.name as nome, loans.loan_date as data_emprestimo, loans.return_date as data_devolucao
FROM loans
JOIN books ON loans.book_id = books.id
JOIN users ON loans.user_id = users.id
WHERE loans.return_date IS NULL OR loans.return_date IS NOT NULL

--Gerar relatórios de livros atualmente emprestados:
SELECT books.title as titulo_livro, users.name as nome, users.email as contato, loans.loan_date as data_emprestimo, loans.return_date as data_devolucao
FROM loans
JOIN books ON loans.book_id = books.id
JOIN users ON loans.user_id = users.id
WHERE loans.return_date IS NULL

--Gerar relatórios de usuários com mais empréstimos:
SELECT TOP 3 users.name,
COUNT(loans.loan_id) as total_emprestimos
FROM loans
JOIN users ON loans.user_id = users.id
GROUP BY users.name
ORDER BY total_emprestimos DESC
