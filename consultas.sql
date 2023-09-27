-- exercicio 1 --
/***
consulta para um relatório de todas as vendas pagas em dinheiro. 
Necessários para o relatório data da venda, valor total; produtos vendidos, quantidade e valor unitário; nome do cliente, cpf e telefone.
Ordena-se pela data de venda, as mais recentes primeiro.
**/
SELECT data, valor_total, nome_produto, quantidade, valor_unitario
FROM venda v, item_venda iv, produto p, cliente c, funcionario f
WHERE v.id = iv.venda_id AND c.id = v.cliente_id AND p.id = iv.produto_id AND f.id = v.funcionario_id and tipo_pagamento = 'D';

/***
consulta para encontrar todas as vendas de produtos de um dado fabricante
Mostrar dados do produto, quantidade vendida, data da venda.
Ordena-se pelo nome do produto.
***/
SELECT nome_produto, produto_id, quantidade, data
FROM produto p, item_venda iv, venda v
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND p.fabricante like '%lar%';
 
/***
Relatório de vendas de produto por cliente.
Mostrar dados do cliente, dados do produto e valor e quantidade totais de venda ao cliente de cada produto.
*/
SELECT c.nome, cpf, endereco, telefone, usuario_iD, nome_produto, descricao, estoque, fabricante, SUM(iv.subtotal), SUM(iv.quantidade)
FROM produto p, item_venda iv, venda v, cliente c
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND c.id = v.cliente_id /*f.id = v.funcionario_id*/
GROUP BY c.nome, p.nome;

select * from produto;

-- exercicio 2 --

create index idx_nome on cliente(nome);
select * from cliente where nome = 'Eric Caeira';

create index idx_cpf on cliente(cpf);
select * from cliente where cpf = '10101262733';

create index idx_endereco on cliente(endereco);
select * from cliente where endereco = 'Rua Lagos 149';

create index idx_telefone on cliente(telefone);
select * from cliente where telefone = '56 1699 2013';

show index from cliente;
-- exercicio 3 --

EXPLAIN select * from cliente where nome;
EXPLAIN select * from cliente where nome = 'Eric Caeira';

EXPLAIN select * from cliente where cpf;
EXPLAIN select * from cliente where cpf = '10101262733';

EXPLAIN select * from cliente where endereco;
EXPLAIN select * from cliente where endereco = 'Rua Lagos 149';

EXPLAIN select * from cliente where telefone;
EXPLAIN select * from cliente where telefone = '56 1699 2013';

-- exercicio 4 --

create view v_vendas_pagas_dinheiro as
SELECT data, valor_total, nome_produto, quantidade, valor_unitario
FROM venda v, item_venda iv, produto p, cliente c, funcionario f
WHERE v.id = iv.venda_id AND c.id = v.cliente_id AND p.id = iv.produto_id AND f.id = v.funcionario_id and tipo_pagamento = 'D';

create view v_vendas_produtos_fabricante as
SELECT nome_produto, produto_id, quantidade, data
FROM produto p, item_venda iv, venda v
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND p.fabricante like '%lar%';

create view v_vendas_produto_cliente as
SELECT c.nome, cpf, endereco, telefone, usuario_iD, nome_produto, descricao, estoque, fabricante, SUM(iv.subtotal), SUM(iv.quantidade)
FROM produto p, item_venda iv, venda v, cliente c
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND c.id = v.cliente_id /*f.id = v.funcionario_id*/
GROUP BY c.nome, p.nome;

-- exercicio 5 --










