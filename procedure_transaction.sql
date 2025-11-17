USE DB_ACADEMICONEW;
GO


/* ============================================================
   01. Procedure simples (sem argumentos)
   ============================================================ */
CREATE OR ALTER PROCEDURE proc_OlaIbmec
AS
    SELECT 'Olá, Ibmec!' AS mensagem;
GO

-- Executando
EXEC proc_OlaIbmec;
GO


/* ============================================================
   02. Procedure com argumento (@idade)
   ============================================================ */
CREATE OR ALTER PROCEDURE proc_BuscaAlunoPorIdade
    @idade INT
AS
    SELECT *
    FROM aluno
    WHERE idade >= @idade;
GO

-- Executando
EXEC proc_BuscaAlunoPorIdade @idade = 20;
GO


/* ============================================================
   03. Transação com COMMIT
   ============================================================ */
BEGIN TRANSACTION;

-- Operação 1
UPDATE professor
SET idade = 30
WHERE id = 1;

-- Operação 2
UPDATE aluno
SET departamento = 'Tech_SQL'
WHERE id = 1;

-- Salva todas as mudanças
COMMIT TRANSACTION;
GO


/* ============================================================
   04. Transação com ROLLBACK (desfazer mudanças)
   ============================================================ */
BEGIN TRANSACTION;

-- Mudança TEMPORÁRIA
UPDATE professor
SET email_academico = 'teste_rollback@gmail.com'
WHERE id = 4;

-- Cancela todas as alterações
ROLLBACK TRANSACTION;
GO

-- Conferindo se voltou ao valor original
SELECT *
FROM professor
WHERE id = 4;
GO
