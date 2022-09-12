USE oficinabd;
-- View 1: clientes e seus respectivos carros
SELECT * FROM clientes;
SELECT * FROM veiculo;

SELECT concat(PrNome, ' ', SobNome) as Nome_Cliente, Modelo as Modelo_Veiculo, Placa as Placa_Veiculo  FROM clientes, veiculo WHERE idClVeic = idVeiculo;

-- View 2: estados de cada serviço por cada cliente
SELECT concat(PrNome, ' ', SobNome) as Nome_Cliente, Modelo as Modelo_Veiculo, Placa as Placa_Veiculo, Estado  FROM clientes, veiculo, ordemServ WHERE idClVeic = idVeiculo AND idVeiculo=idOSVeic;

SELECT * FROM ordemServ;

-- view 3: custo do serviço cada cliente
SELECT concat(PrNome, ' ', SobNome) as Nome_Cliente, Modelo as Modelo_Veiculo, Placa as Placa_Veiculo, Valor as Valor_Serviço  FROM clientes, veiculo, ordemServ WHERE idClVeic = idVeiculo AND idVeiculo=idOSVeic;

-- view 4: uso de peças por veiculo
SELECT * FROM pecaOS;
SELECT * FROM ordemServ;
SELECT * FROM pecas;

SELECT Modelo as Modelo_Veiculo, Placa as Placa_Veiculo, NomePeca FROM veiculo, pecas, pecaOS, ordemServ WHERE idPeca = idPecas AND idOrdServ = idOrdemServ AND idOSVeic = idVeiculo;

-- View 5: agrupando estados de cada serviço 
SELECT Estado, count(*) FROM ordemServ GROUP BY Estado HAVING count(*)>2;

-- view 6: ordenando preços
SELECT * FROM servico ORDER BY Valor;

