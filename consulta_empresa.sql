USE momento;

-- Inclua suas próprias informações no departamento de tecnologia da empresa
INSERT INTO funcionarios(primeiro_nome,sobrenome,email,telefone,data_contratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES
 ('Gleyce','Pereira','pereira.gleyce7@gmail.com','011.234.9880','2023-11-08',9,4200.00,NULL,6);

-- A administração está sem funcionários. Inclua alguns colegas de turma nesse departamento. 
INSERT INTO funcionarios(primeiro_nome,sobrenome,email,telefone,data_contratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES
 ('Ana','Marques','ana.marques@gmail.com','011.876.3446','2023-10-20',3,3000.00,NULL,1),
 ('Paulo','Santos','santosPaulo@gmail.com','011.776.8966','2023-10-30',3,3500.00,NULL,1),
 ('Beatriz','Oliveira','beatriz_oli@gmail.com','011.348.1128','2023-11-03',3,4100.00,NULL,1);
 
 -- Agora diga, quantos funcionários temos ao total na empresa?
 SELECT COUNT(*) FROM funcionarios;
 -- O COUNT para contar o total de registros na tabela funcionarios. 
 
 
 -- Quantos funcionários temos no departamento de finanças?
 SELECT COUNT(*) FROM funcionarios WHERE departamento_id = 10;
 
 -- Qual a média salarial do departamento de tecnologia?
SELECT AVG(funcionarios.salario) 
FROM funcionarios
JOIN departamento ON funcionarios.departamento_id = departamento.departamento_id
WHERE departamento.departamento_nome = 'Tecnologia';
-- O  AVG para calcular a média dos salários dos funcionários desse departamento.


-- Quanto o departamento de Transportes gasta em salários?
SELECT SUM(funcionarios.salario)
FROM funcionarios
INNER JOIN departamento ON funcionarios.departamento_id = departamento.departamento_id
WHERE departamento.departamento_nome = 'Transportes';
-- SUM é usado para calcular a soma de valores em uma coluna.


-- Um novo departamento foi criado. O departamento de inovações. Ele será locado no Brasil. Por favor, adicione-o no banco de dados.
INSERT INTO departamento(departamento_id,departamento_nome,posicao_id) VALUES (12,'Inovações',5400);
INSERT INTO ocupacoes(ocupacao_id,ocupacao_nome,min_salario,max_salario) VALUES (20,'Gerente de Inovações',6000.00,8500.00);

-- Três novos funcionários foram contratados para o departamento de inovações. 
INSERT INTO funcionarios(primeiro_nome,sobrenome,email,telefone,data_contratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES 
('William','Ferreira','william_fer@momento.org','515.987.0977','2023-11-19',9,5000.00,NULL,12),
('Fernanda','Lima','fer_limar@momento.org','876.890.9812','2023-11-23',9,5200.00,NULL,12),
('Sumaia','Azevedo','sumaia_azevedo@momento.org','564.986.5674','2023-10-06',20,5000.00,NULL,12);

SELECT * FROM FUNCIONARIOS;

INSERT INTO dependentes(primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES 
('Inara','Ferreira','Cônjuge',217),
('Maria Antônia','Ferreira','Filho(a)',217),
('Rodrigo','Lima','Cônjuge',218),
('Giulia','Azevedo','Cônjuge',219),
('Tainã','Azevedo','Filho(a)',219),
('Nathalia','Azevedo','Filho(a)',219);

-- Informe todas as regiões em que a empresa atua acompanhadas de seus países.
SELECT regiao.regiao_nome AS continente, paises.pais_name AS nome
FROM regiao
INNER JOIN paises ON regiao.regiao_id = paises.regiao_id;

-- Joe Sciarra é filho de quem?
SELECT * FROM dependentes WHERE primeiro_nome = "Joe";

-- Jose Manuel possui filhos?
SELECT * FROM dependentes WHERE funcionario_id = 112;

-- Qual região possui mais países?
SELECT regiao.regiao_nome AS continente, COUNT(paises.pais_id) AS total_paises
FROM regiao
INNER JOIN paises ON regiao.regiao_id = paises.regiao_id
GROUP BY regiao.regiao_nome
ORDER BY total_paises DESC;
-- GROUP BY agrupa os resultados por região
-- COUNT conta o número de países para cada região 
-- ORDER BY com DESC ordena os resultados do maior para o menor número de países


-- Exiba o nome cada funcionário acompanhado de seus dependentes.
SELECT funcionarios.primeiro_nome AS nome_funcionario, dependentes.primeiro_nome AS nome_dependente , dependentes.parentesco
FROM funcionarios
INNER JOIN dependentes ON funcionarios.funcionario_id = dependentes.funcionario_id;

-- Karen Partners possui um(a) cônjuge? 146
SELECT * FROM dependentes WHERE funcionario_id = 146;


