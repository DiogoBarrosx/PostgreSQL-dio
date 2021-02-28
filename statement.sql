SELECT numero, nome FROM banco;
SELECT banco_numero, numero, nome FROM agencia;

--STATEMENT SIMPLES
WITH tbl_tmp_banco AS (
	SELECT numero, nome
	FROM banco
)
SELECT numero, nome FROM tbl_tmp_banco;


WITH params AS (
	SELECT 213 AS banco_numero
), tbl_tmp_banco AS (
	SELECT numero, nome FROM banco
	JOIN params ON params.banco_numero = banco.numero
)
SELECT numero, nome FROM tbl_tmp_banco;


-- SUB SELECT
SELECT banco.numero, banco.nome FROM banco
	JOIN (
		SELECT 213 AS banco_numero
	) params ON params.banco_numero = banco.numero;


--STATEMENT VARIAS TABELAS


WITH clientes_e_transacoes AS (
	SELECT  cliente.nome AS cliente_nome, --muda nome do campo
			tipo_transacao.nome AS tipo_transacao_nome,
			cliente_transacoes.valor AS tipo_transacao_valor
	--relação errada
	FROM cliente_transacoes
	JOIN cliente ON cliente.numero = cliente_transacoes.cliente_numero
	JOIN tipo_transacao ON tipo_transacao_id = cliente_transacoes.tipo_transacao_id
)
SELECT cliente_nome, tipo_transacao_nome, tipo_transacao_valor
FROM clientes_e_transacoes ORDER BY cliente_nome;


WITH clientes_e_transacoes AS (
	SELECT  cliente.nome AS cliente_nome, --muda nome do campo
			tipo_transacao.nome AS tipo_transacao_nome, --muda nome do campo
			cliente_transacoes.valor AS tipo_transacao_valor --muda nome do campo
	--relação correta
	FROM cliente
	JOIN cliente_transacoes ON cliente_transacoes.cliente_numero = cliente.numero
	JOIN tipo_transacao ON tipo_transacao.id = cliente_transacoes.tipo_transacao_id
)
SELECT cliente_nome, tipo_transacao_nome, tipo_transacao_valor
FROM clientes_e_transacoes ORDER BY cliente_nome, tipo_transacao_valor;




