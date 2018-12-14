--procedimento mostrar
CREATE PROC SP_MOSTRAR_CATEGORIA
AS
SELECT TOP 100 * FROM tb_categoria
ORDER BY ca_cod DESC
GO

--procedimento buscar nome
CREATE PROC SP_CONSULTA_CATEGORIA
@consultabuscar VARCHAR(50)
AS SELECT * FROM tb_categoria 
WHERE ca_nome like @consultabuscar + '%'
GO

--procedimento inserir categ
CREATE PROC SP_INSERIR_CATEGORIA
@ca_cod INT OUTPUT,
@ca_nome VARCHAR(50)
AS 
INSERT INTO tb_categoria(ca_cod, ca_nome)
 VALUES (@ca_cod, @ca_nome)
 GO

 --procedimento editar categ
CREATE proc speditar_categoria
@idcategoria int output,
@nome varchar(50),
@descricao varchar(256)
as
update categoria set nome=@nome, 
descricao=@descricao where 
idcategoria=@idcategoria
go