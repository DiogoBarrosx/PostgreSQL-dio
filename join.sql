SELECT numero, nome FROM banco;
SELECT banco_numero, numero, nome FROM agencia;
SELECT numero, nome FROM cliente;
SELECT banco_numero, agencia_numero, numero, digito, cliente_numero FROM conta_corrente;
SELECT id, nome FROM tipo_transacao;
SELECT banco_numero, agencia_numero, conta_corrente_numero, conta_corrente_digito, cliente_numero, valor FROM cliente_transacoes;

-- INNER JOIN

SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero;

SELECT banco.numero FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero
GROUP BY banco.numero;

SELECT COUNT(DISTINCT banco.numero) FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero;


--LEFT JOIN

SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco LEFT JOIN agencia
ON agencia.banco_numero = banco.numero;

SELECT agencia.numero, agencia.nome, banco.numero, banco.nome
FROM agencia LEFT JOIN banco
ON banco.numero = agencia.banco_numero;


-- RIGHT JOIN

SELECT agencia.numero, agencia.nome, banco.numero, banco.nome
FROM agencia RIGHT JOIN banco
ON banco.numero = agencia.banco_numero;


-- FULL JOIN

SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco FULL JOIN agencia
ON banco.numero = agencia.banco_numero;


-- JOIN COM VARIAS TABELAS

SELECT banco.nome, agencia.nome,
	conta_corrente.numero, conta_corrente.digito,
	cliente.nome
FROM banco
	JOIN agencia ON agencia.banco_numero = banco.numero
	JOIN conta_corrente ON conta_corrente.banco_numero = banco.numero
--ou JOIN conta_corrente ON conta_corrente.banco_numero = agencia.banco_numero
		AND conta_corrente.agencia_numero = agencia.numero
	JOIN cliente ON cliente.numero = conta_corrente.cliente_numero;


--transações de clientes e os tipos de transações

SELECT id, nome FROM tipo_transacao;
SELECT tipo_transacao_id, cliente_numero, valor FROM cliente_transacoes ORDER BY cliente_numero;

SELECT cliente.nome, tipo_transacao.nome, cliente_transacoes.valor FROM cliente
	JOIN cliente_transacoes ON cliente_transacoes.cliente_numero = cliente.numero
	JOIN tipo_transacao ON tipo_transacao.id = cliente_transacoes.tipo_transacao_id
ORDER BY cliente.nome;


SELECT banco.nome, agencia.nome, conta_corrente.numero, conta_corrente.digito,
	   cliente.nome, tipo_transacao.nome, cliente_transacoes.valor
FROM banco
	JOIN agencia ON agencia.banco_numero = banco.numero
	JOIN conta_corrente ON conta_corrente.banco_numero = banco.numero
		AND conta_corrente.agencia_numero = agencia.numero
	JOIN cliente ON cliente.numero = conta_corrente.cliente_numero
	JOIN cliente_transacoes ON cliente_transacoes.cliente_numero = cliente.numero
	JOIN tipo_transacao ON tipo_transacao.id = cliente_transacoes.tipo_transacao_id
ORDER BY cliente.nome;

SELECT banco.nome, agencia.nome, conta_corrente.numero, conta_corrente.digito,
	   cliente.nome, tipo_transacao.nome, cliente_transacoes.valor
FROM banco
	JOIN agencia ON agencia.banco_numero = banco.numero
	JOIN conta_corrente ON conta_corrente.banco_numero = banco.numero
		AND conta_corrente.agencia_numero = agencia.numero
	JOIN cliente ON cliente.numero = conta_corrente.cliente_numero
	JOIN cliente_transacoes ON cliente_transacoes.cliente_numero = cliente.numero
	JOIN tipo_transacao ON tipo_transacao.id = cliente_transacoes.tipo_transacao_id
ORDER BY cliente.nome, cliente_transacoes.valor;
















