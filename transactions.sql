--Transações

SELECT numero, nome, ativo FROM banco ORDER BY numero;

UPDATE banco SET ativo = false WHERE numero = 0;

--ROLLBACK
BEGIN;
UPDATE banco SET ativo = true WHERE numero = 0;
SELECT numero, nome, ativo FROM banco ORDER BY numero;

ROLLBACK;
SELECT numero, nome, ativo FROM banco ORDER BY numero;

--COMMIT

BEGIN;
UPDATE banco SET ativo = true WHERE numero = 0;
SELECT numero, nome, ativo FROM banco ORDER BY numero;

COMMIT;
SELECT numero, nome, ativo FROM banco ORDER BY numero;



--SAVEPOINT
SELECT id, gerente, nome FROM funcionarios ORDER BY id;
BEGIN;
UPDATE funcionarios SET gerente = null where id = 2;
SAVEPOINT sp_func;
SELECT id, gerente, nome FROM funcionarios ORDER BY id;

UPDATE funcionarios SET gerente = null;
SELECT id, gerente, nome FROM funcionarios ORDER BY id;

ROLLBACK TO sp_func;
SELECT id, gerente, nome FROM funcionarios ORDER BY id;

UPDATE funcionarios SET gerente = 2 WHERE id = 5;
COMMIT;
SELECT id, gerente, nome FROM funcionarios ORDER BY id;





