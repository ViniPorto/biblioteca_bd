CREATE DATABASE trabalho_banco_de_dados;
USE trabalho_banco_de_dados;

CREATE TABLE editora(
id_editora INT NOT NULL AUTO_INCREMENT,
telefone VARCHAR(11),
nome VARCHAR(50),
endereco VARCHAR(50),
email VARCHAR(40),
PRIMARY KEY(id_editora)
);

CREATE TABLE autor (
id_autor INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(50),
email VARCHAR(40),
pais_origem VARCHAR(30),
PRIMARY KEY(id_autor)
);

CREATE TABLE livro (
isbn VARCHAR(13) NOT NULL,
genero VARCHAR(30),
data_publicacao DATE,
titulo VARCHAR(50),
autor_id INT,
editora_id INT,
PRIMARY KEY(isbn),
FOREIGN KEY(autor_id) REFERENCES autor(id_autor),
FOREIGN KEY(editora_id) REFERENCES editora(id_editora)
);

CREATE TABLE estante (
id_estante INT NOT NULL AUTO_INCREMENT,
localizacao VARCHAR(30),
assuntos VARCHAR(30),
letras_alfabeticas VARCHAR(50),
PRIMARY KEY(id_estante)
);

CREATE TABLE exemplar (
id_exemplar INT NOT NULL AUTO_INCREMENT,
data_impressao DATE,
data_aquisicao DATE,
edicao VARCHAR(50),
disponivel VARCHAR(1),
livro_isbn VARCHAR(13) NOT NULL,
estante_id INT NOT NULL,
PRIMARY KEY(id_exemplar),
FOREIGN KEY(livro_isbn) REFERENCES livro(isbn),
FOREIGN KEY(estante_id) REFERENCES estante(id_estante)
);

CREATE TABLE usuario (
cpf VARCHAR(15) NOT NULL,
email VARCHAR(40),
endereco VARCHAR(50),
telefone VARCHAR(11),
data_nascimento DATE,
nome VARCHAR(50),
PRIMARY KEY(cpf)
);

CREATE TABLE livros_emprestimo (
id_livros_emprestimo INT NOT NULL AUTO_INCREMENT,
livro_exemplar_id_1 INT NOT NULL, /* ao menos 1 livro deve ser emprestado */
livro_exemplar_id_2 INT,
livro_exemplar_id_3 INT,
livro_exemplar_id_4 INT,
livro_exemplar_id_5 INT,
PRIMARY KEY(id_livros_emprestimo),
FOREIGN KEY(livro_exemplar_id_1) REFERENCES exemplar(id_exemplar),
FOREIGN KEY(livro_exemplar_id_2) REFERENCES exemplar(id_exemplar),
FOREIGN KEY(livro_exemplar_id_3) REFERENCES exemplar(id_exemplar),
FOREIGN KEY(livro_exemplar_id_4) REFERENCES exemplar(id_exemplar),
FOREIGN KEY(livro_exemplar_id_5) REFERENCES exemplar(id_exemplar)
);

CREATE TABLE emprestimo (
id_emprestimo INT NOT NULL AUTO_INCREMENT,
multa INT,
data_devolucao DATE,
data_emprestimo DATE,
livros_emprestimo_id INT NOT NULL,
usuario_cpf VARCHAR(15) NOT NULL,
PRIMARY KEY(id_emprestimo),
FOREIGN KEY(livros_emprestimo_id) REFERENCES livros_emprestimo(id_livros_emprestimo),
FOREIGN KEY(usuario_cpf) REFERENCES usuario(cpf)
);

/* inserts */

/* ps: autores de alguns dos meus livros favoritos :D */

INSERT INTO autor(nome, email, pais_origem) VALUES('Eduardo Spohr', 'eduardospohr@gmail.com', 'Brasil');
INSERT INTO autor(nome, email, pais_origem) VALUES('George Orwell', 'georgeorwell@gmail.com', 'India');
INSERT INTO autor(nome, email, pais_origem) VALUES('Dan Brown', 'danbrown@gmail.com', 'Estados Unidos');
INSERT INTO autor(nome, email, pais_origem) VALUES('Stephen Hawking', 'stephenhawking@gmail.com', 'Reino Unido');
INSERT INTO autor(nome, email, pais_origem) VALUES('Hans-Hermann Hoppe', 'hanshermannhoppe@gmail.com', 'Alemanha');
INSERT INTO autor(nome, email, pais_origem) VALUES('Friedrich Nietzsche', 'friedrichnietzsche@gmail.com', 'Alemanha');
INSERT INTO autor(nome, email, pais_origem) VALUES('Richard Dawkins', 'richarddawkins@gmail.com', 'Reino Unido');
INSERT INTO autor(nome, email, pais_origem) VALUES('Brian Greene', 'briangreene@gmail.com', 'Estados Unidos');

INSERT INTO editora(nome, telefone, endereco, email) VALUES('Arvore Verde', '48978654465', 'Rua Salgado Filho, Sao Leonardo, Criciuma - SC', 'arvoreverde@gmail.com');
INSERT INTO editora(nome, telefone, endereco, email) VALUES('Espaço', '21978656764', 'Rua Marechal Deodoro, Leblon, Rio De Janeiro - RJ', 'espaco@gmail.com');
INSERT INTO editora(nome, telefone, endereco, email) VALUES('Abril', '54999657815', 'Rua São Leopoldo, Caraguata, Erechim - RS', 'abril@gmail.com');

INSERT INTO livro(isbn, genero, data_publicacao, titulo, autor_id, editora_id) VALUES('9780436350221', 'Distopia, ficção política', '1949-06-08', '1984', '2', '1');
INSERT INTO livro(isbn, genero, data_publicacao, titulo, autor_id, editora_id) VALUES('9788576860761', 'Literatura fantástica', '2007-04-01', 'A Batalha Do Apocalipse', '1', '3');
INSERT INTO livro(isbn, genero, data_publicacao, titulo, autor_id, editora_id) VALUES('9780593015186', 'Divulgação científica', '1988-12-21', 'Uma Breve História Do Tempo', '4', '2');
INSERT INTO livro(isbn, genero, data_publicacao, titulo, autor_id, editora_id) VALUES('9788896675434', 'Ficção distópica', '1945-09-17', 'A Revolução Dos Bichos', '2', '1');
INSERT INTO livro(isbn, genero, data_publicacao, titulo, autor_id, editora_id) VALUES('9781428124523', 'Suspense, Ficção Científica', '2003-01-19', 'Anjos E Demônios', '3', '3');
INSERT INTO livro(isbn, genero, data_publicacao, titulo, autor_id, editora_id) VALUES('9780765808684', 'Economia, Ciencias Sociais', '2001-11-29', 'Democracia O Deus Que Falhou', '5', '1');
INSERT INTO livro(isbn, genero, data_publicacao, titulo, autor_id, editora_id) VALUES('9780191537554', 'Biologia Evolutiva', '1976-02-12', 'O Gene Egoísta', '7', '2');
INSERT INTO livro(isbn, genero, data_publicacao, titulo, autor_id, editora_id) VALUES('9780224052993', 'Fisica Teórica', '1999-07-23', 'O Universo Elegante', '8', '2');

INSERT INTO estante(localizacao, assuntos, letras_alfabeticas) VALUES('1 andar, corredor 3', 'ciencia', 'a - z');
INSERT INTO estante(localizacao, assuntos, letras_alfabeticas) VALUES('2 andar, corredor 2', 'politica e historia', 'a - z');
INSERT INTO estante(localizacao, assuntos, letras_alfabeticas) VALUES('2 andar, corredor 1', 'romance', 'a - z');
INSERT INTO estante(localizacao, assuntos, letras_alfabeticas) VALUES('1 andar, corredor 2', 'economia e filosofia', 'a - z');

INSERT INTO exemplar(data_impressao, data_aquisicao, edicao, disponivel, livro_isbn, estante_id) VALUES('2010-01-01', '2020-01-08', 'Original', 'N', '9780436350221', '2');
INSERT INTO exemplar(data_impressao, data_aquisicao, edicao, disponivel, livro_isbn, estante_id) VALUES('2011-01-01', '2020-02-07', 'Especial', 'S', '9788576860761', '3');
INSERT INTO exemplar(data_impressao, data_aquisicao, edicao, disponivel, livro_isbn, estante_id) VALUES('2012-01-01', '2020-03-06', 'Original', 'N', '9780593015186', '1');
INSERT INTO exemplar(data_impressao, data_aquisicao, edicao, disponivel, livro_isbn, estante_id) VALUES('2013-01-01', '2020-04-05', 'Edição De Bolso', 'N', '9788896675434', '4');
INSERT INTO exemplar(data_impressao, data_aquisicao, edicao, disponivel, livro_isbn, estante_id) VALUES('2014-01-01', '2020-05-04', 'Original', 'S', '9781428124523', '3');
INSERT INTO exemplar(data_impressao, data_aquisicao, edicao, disponivel, livro_isbn, estante_id) VALUES('2015-01-01', '2020-06-03', 'Edição De Bolso', 'S', '9780765808684', '4');
INSERT INTO exemplar(data_impressao, data_aquisicao, edicao, disponivel, livro_isbn, estante_id) VALUES('2016-01-01', '2020-07-02', 'Comemorativa', 'S', '9780191537554', '1');
INSERT INTO exemplar(data_impressao, data_aquisicao, edicao, disponivel, livro_isbn, estante_id) VALUES('2017-01-01', '2020-08-01', 'Original', 'N', '9780224052993', '1');

INSERT INTO usuario(cpf, email, endereco, telefone, data_nascimento, nome) VALUES('99999999999', 'viniciusporto@gmail.com', 'Rua Imaginaria, 28, Santo Antônio, Joinville - SC', '49988365687', '2000-04-25', 'Vinicius Leinate Porto');
INSERT INTO usuario(cpf, email, endereco, telefone, data_nascimento, nome) VALUES('99999999998', 'casimito@gmail.com', 'Rua Laranjeiras, 2548, Leblon, Rio De Janeiro - RJ', '21999855699', '1988-06-26', 'Casimiro Miguel Da Silva');
INSERT INTO usuario(cpf, email, endereco, telefone, data_nascimento, nome) VALUES('99999999997', 'mirellanaspolini@gmail.com', 'Rua Limao, 976, Jardim Iririu, Joinville - SC', '47988250418', '2004-02-11', 'Mirella De Avila Naspolini');
INSERT INTO usuario(cpf, email, endereco, telefone, data_nascimento, nome) VALUES('99999999996', 'robertdowneyjr@gmail.com', 'Rua Nascimento, 977, Agua Verde, Blumenau - SC', '47999568701', '1978-05-02', 'Robert Downey Jr');

INSERT INTO livros_emprestimo(livro_exemplar_id_1) VALUES(1);
INSERT INTO livros_emprestimo(livro_exemplar_id_1, livro_exemplar_id_2) VALUES(3, 4);
INSERT INTO livros_emprestimo(livro_exemplar_id_1) VALUES(8);
INSERT INTO livros_emprestimo(livro_exemplar_id_1) VALUES(2);

INSERT INTO emprestimo(multa, data_devolucao, data_emprestimo, livros_emprestimo_id, usuario_cpf) VALUES(0, '2022-05-20', '2022-05-10', 4, '99999999999');
INSERT INTO emprestimo(multa, data_emprestimo, livros_emprestimo_id, usuario_cpf) VALUES(10, '2022-05-01', 1, '99999999998');
INSERT INTO emprestimo(multa, data_devolucao, data_emprestimo, livros_emprestimo_id, usuario_cpf) VALUES(0, '2022-04-01', '2022-03-28', 2, '99999999997');
INSERT INTO emprestimo(multa, data_devolucao, data_emprestimo, livros_emprestimo_id, usuario_cpf) VALUES(0, '2022-05-10', '2022-05-01', 3, '99999999996');

/* UPDATES */

UPDATE usuario SET nome = 'Vinícius Porto' WHERE cpf = '99999999999';
UPDATE exemplar SET edicao = 'Especial' WHERE livro_isbn = '9780593015186';

/* SELECT */
/*PS: dei UNION entre cada SELECT prof, então pode selecionar todos e rodar que vai juntar num SELECT só */

SELECT emprestimo.data_emprestimo as 'Data do emprestimo', usuario.nome as 'Usuário', livro.titulo as 'Livro', 
exemplar.edicao as 'Edição', autor.nome as 'Autor', editora.nome as 'Editora', estante.localizacao as 'Localização'
FROM emprestimo INNER JOIN usuario ON emprestimo.usuario_cpf = usuario.cpf
                INNER JOIN livros_emprestimo ON emprestimo.livros_emprestimo_id = livros_emprestimo.id_livros_emprestimo
                INNER JOIN exemplar ON livros_emprestimo.livro_exemplar_id_1 = exemplar.id_exemplar
                INNER JOIN estante ON exemplar.estante_id = estante.id_estante
                INNER JOIN livro ON exemplar.livro_isbn = livro.isbn
                INNER JOIN editora ON livro.editora_id = editora.id_editora
                INNER JOIN autor ON livro.autor_id = autor.id_autor
WHERE id_emprestimo = 1
UNION
SELECT emprestimo.data_emprestimo as 'Data do emprestimo', usuario.nome as 'Usuário', livro.titulo as 'Livro', 
exemplar.edicao as 'Edição', autor.nome as 'Autor', editora.nome as 'Editora', estante.localizacao as 'Localização'
FROM emprestimo INNER JOIN usuario ON emprestimo.usuario_cpf = usuario.cpf
                INNER JOIN livros_emprestimo ON emprestimo.livros_emprestimo_id = livros_emprestimo.id_livros_emprestimo
                INNER JOIN exemplar ON livros_emprestimo.livro_exemplar_id_1 = exemplar.id_exemplar
                INNER JOIN estante ON exemplar.estante_id = estante.id_estante
                INNER JOIN livro ON exemplar.livro_isbn = livro.isbn
                INNER JOIN editora ON livro.editora_id = editora.id_editora
                INNER JOIN autor ON livro.autor_id = autor.id_autor
WHERE id_emprestimo = 2
UNION
SELECT emprestimo.data_emprestimo as 'Data do emprestimo', usuario.nome as 'Usuário', livro.titulo as 'Livro', 
exemplar.edicao as 'Edição', autor.nome as 'Autor', editora.nome as 'Editora', estante.localizacao as 'Localização'
FROM emprestimo INNER JOIN usuario ON emprestimo.usuario_cpf = usuario.cpf
                INNER JOIN livros_emprestimo ON emprestimo.livros_emprestimo_id = livros_emprestimo.id_livros_emprestimo
                INNER JOIN exemplar ON livros_emprestimo.livro_exemplar_id_1 = exemplar.id_exemplar
                INNER JOIN estante ON exemplar.estante_id = estante.id_estante
                INNER JOIN livro ON exemplar.livro_isbn = livro.isbn
                INNER JOIN editora ON livro.editora_id = editora.id_editora
                INNER JOIN autor ON livro.autor_id = autor.id_autor
WHERE id_emprestimo = 3
UNION
SELECT emprestimo.data_emprestimo as 'Data do emprestimo', usuario.nome as 'Usuário', livro.titulo as 'Livro', 
exemplar.edicao as 'Edição', autor.nome as 'Autor', editora.nome as 'Editora', estante.localizacao as 'Localização'
FROM emprestimo INNER JOIN usuario ON emprestimo.usuario_cpf = usuario.cpf
                INNER JOIN livros_emprestimo ON emprestimo.livros_emprestimo_id = livros_emprestimo.id_livros_emprestimo
                INNER JOIN exemplar ON livros_emprestimo.livro_exemplar_id_2 = exemplar.id_exemplar
                INNER JOIN estante ON exemplar.estante_id = estante.id_estante
                INNER JOIN livro ON exemplar.livro_isbn = livro.isbn
                INNER JOIN editora ON livro.editora_id = editora.id_editora
                INNER JOIN autor ON livro.autor_id = autor.id_autor
WHERE id_emprestimo = 3
UNION
SELECT emprestimo.data_emprestimo as 'Data do emprestimo', usuario.nome as 'Usuário', livro.titulo as 'Livro', 
exemplar.edicao as 'Edição', autor.nome as 'Autor', editora.nome as 'Editora', estante.localizacao as 'Localização'
FROM emprestimo INNER JOIN usuario ON emprestimo.usuario_cpf = usuario.cpf
                INNER JOIN livros_emprestimo ON emprestimo.livros_emprestimo_id = livros_emprestimo.id_livros_emprestimo
                INNER JOIN exemplar ON livros_emprestimo.livro_exemplar_id_1 = exemplar.id_exemplar
                INNER JOIN estante ON exemplar.estante_id = estante.id_estante
                INNER JOIN livro ON exemplar.livro_isbn = livro.isbn
                INNER JOIN editora ON livro.editora_id = editora.id_editora
                INNER JOIN autor ON livro.autor_id = autor.id_autor
WHERE id_emprestimo = 4;