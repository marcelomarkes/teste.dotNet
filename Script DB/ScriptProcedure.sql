--PROCEDIMENTO MOSTRAR
CREATE PROC SP_MOSTRAR_LIVRO
AS
SELECT TOP 100 * FROM tb_livro
ORDER BY li_cod DESC
GO

--PROCEDIMENTO DE BUSCA
CREATE PROC SP_CONSULTA_LIVRO
@consultabuscar NVARCHAR(50),
@consultacolecao NVARCHAR(50),
@consultaedicao NVARCHAR (50)
AS
SELECT * FROM tb_livro 
WHERE li_nome like @consultabuscar + '%' or
li_colecao like @consultacolecao + '%' or
li_edicao like @consultaedicao 
GO

--PROCEDIMENTO DE INSERIR
CREATE PROC SP_INSERIR_LIVRO
@li_cod INT OUTPUT,
@li_nome NVARCHAR (50),
@li_colecao NVARCHAR(50),
@li_ano INT,
@li_edicao NVARCHAR(10),
@us_cod INT,
@ct_cod INT,
@au_cod INT,
@ed_cod INT
AS 
INSERT INTO tb_livro(li_cod, li_nome, li_colecao, li_ano, li_edicao, us_cod, ct_cod, au_cod, ed_cod)
 VALUES (@li_cod, @li_nome, @li_colecao, @li_ano, @li_edicao, @us_cod, @ct_cod, @au_cod, @ed_cod)
 GO

 --PROCEDIMENTO EDITAR
CREATE PROC SP_EDITAR_LIVRO
@li_cod INT OUTPUT,
@li_nome NVARCHAR (50),
@li_colecao NVARCHAR(50),
@li_ano INT,
@li_edicao NVARCHAR(10),
@us_cod INT,
@ct_cod INT,
@au_cod INT,
@ed_cod INT
AS
UPDATE tb_livro SET li_nome = @li_nome, li_colecao = @li_colecao, li_ano = @li_ano, li_edicao = @li_edicao, ct_cod = @ct_cod, au_cod = @au_cod, ed_cod = @ed_cod
WHERE 
li_cod=@li_cod
GO

--PROCEDIMENTO DELETAR
CREATE PROC SP_DELETAR_LIVRO
@li_cod INT 
AS
DELETE FROM tb_livro WHERE
@li_cod=@li_cod
GO