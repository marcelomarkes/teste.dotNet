use db_biblioteca


ALTER TABLE tb_autor
ADD FOREIGN KEY (us_cod)  REFERENCES tb_usuario(us_cod);

alter table tb_livro
add foreign key (au_cod) references tb_autor(au_cod);

alter table tb_editora
add foreign key (us_cod) references tb_usuario(us_cod);

