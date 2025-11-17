-- Consulta 1: somatórios para DF / TJDFT
SELECT 
    SUM(pendentes) AS processos_pendentes,
    SUM(novos) AS processos_novos,
    SUM(baixados) AS processos_baixados
FROM [DB_EGD_DATALAB7].[dbo].[base_sistema_judiciario_stage0]
WHERE uf = 'DF'
  AND tribunal = 'TJDFT';
GO


-- Consulta 2: selecionar toda a base (corrigindo nome da tabela)
SELECT *
FROM [DB_EGD_DATALAB7].[dbo].[base_sistema_judiciario_stage0];
GO
