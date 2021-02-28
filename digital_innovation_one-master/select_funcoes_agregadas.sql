-- select nas tabelas

SELECT numero, nome, ativo FROM banco;
SELECT numero, nome, data_criacao FROM banco WHERE ativo = true;
SELECT numero, nome, data_criacao FROM banco WHERE ativo = false;
SELECT banco_numero, numero, nome FROM agencia;
SELECT numero, nome, email FROM cliente;
SELECT id, nome FROM tipo_transacao;
SELECT banco_numero, agencia_numero, numero, cliente_numero FROM conta_corrente;
SELECT banco_numero, agencia_numero, cliente_numero FROM cliente_transacoes;
SELECT * FROM cliente_transacoes;

-- select AVG
SELECT valor FROM cliente_transacoes;

SELECT AVG(valor) FROM cliente_transacoes;

-- select count - having

SELECT COUNT(numero) FROM cliente;

SELECT COUNT(numero), email FROM cliente WHERE email ILIKE '%gmail.com'
GROUP BY email;

SELECT COUNT(id), tipo_transacao_id FROM cliente_transacoes
GROUP BY tipo_transacao_id;

SELECT COUNT(id), tipo_transacao_id FROM cliente_transacoes
GROUP BY tipo_transacao_id
HAVING COUNT(id) > 150;


-- MAX

SELECT MAX(numero) FROM cliente;

SELECT MAX(valor) FROM cliente_transacoes;

SELECT MAX(valor), tipo_transacao_id FROM cliente_transacoes 
GROUP BY tipo_transacao_id;

-- MIN

SELECT MIN(numero) FROM cliente;

SELECT MIN(valor) FROM cliente_transacoes;

SELECT MIN(valor), tipo_transacao_id FROM cliente_transacoes 
GROUP BY tipo_transacao_id;

-- SUM

SELECT SUM(valor) FROM cliente_transacoes;

SELECT SUM(valor), tipo_transacao_id FROM cliente_transacoes
GROUP BY tipo_transacao_id;

SELECT SUM(valor), tipo_transacao_id FROM cliente_transacoes
GROUP BY tipo_transacao_id ORDER BY tipo_transacao_id;

SELECT SUM(valor), tipo_transacao_id FROM cliente_transacoes
GROUP BY tipo_transacao_id ORDER BY tipo_transacao_id DESC;
