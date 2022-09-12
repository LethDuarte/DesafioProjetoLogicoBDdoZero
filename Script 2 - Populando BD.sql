USE oficinabd;
-- inserindo dados na tabela veiculo(idVeiculo AUTO_INCREMENT, Placa NOT NULL, Modelo NOT NULL, Cor NOT NULL, Montadora NOT NULL, NumChassi CHAR(17) NOT NULL)
INSERT INTO veiculo (Placa, Modelo, Cor, Montadora, NumChassi) VALUES 
					('MNH 1456', 'Gol 2006', 'branco', 'Volkswagem', '124578lkmh78956ol'),
                    ('AZX 5675', 'Honda Civic 2019', 'preto', 'Honda', 'optf7485rfds4587'),
                    ('WDF 8712', 'Uno 2010', 'verde limão', 'FIAT', 'IOWSD6531UITBG97G'),
                    ('QIL 7748', 'Santana 1998', 'azul cobalto', 'Volkswagem', 'AZXIYGB732148PHAB'),
                    ('UCV 3125', 'Celta 2015', 'cinza', 'Chevrolet', '675UHBPOL7796098');
                    
-- conferindo SELECT * FROM veiculo;

-- inserindo dados na tabela clientes(idCliente AUTO_INCREMENT, idClVeic FK, PrNome NOT NULL, SobNome NOT NULL, CPF NOT NULL, RG NOT NULL, Logr, Bairro, Cidade, UF, Email, Celular)
INSERT INTO clientes (idClVeic, PrNome, SobNome, CPF, RG, Logr, Bairro, Cidade, UF, Email, Celular) VALUES
					 (1, 'Mario Henrique', 'Sobral e Melo', '45687932154', '2987402546', 'Av das Camelias, 451, apto 1502', 'Central', 'São Gonçalo', 'RJ', 'mhsobral@gmail.com', '21997855417'),
                     (2, 'Fernanda', 'Costa Marques', '14785296374', '5414789653', 'Rua Santa Amelia, 28', 'Laranjal', 'São Gonçalo', 'RJ', 'fernadacosta@hotmail.com', '21987480021'),
                     (3, 'Bruno', 'Carneiro Mota', '77485412474', '2147800974', 'Estrada Velha de Guaxindiba, 1200', 'Guaxindiba', 'São Gonçalo', 'RJ', 'bcm1998@gmmail.com', '21974459874'),
                     (4, 'Camille Yasmin', 'Silva', '24188456011', '1244589716', 'Rua Ana de Macedo, 145, casa 3', 'Alcantara', 'São Gonçalo', 'RJ', 'camillesilva95@hotmail.com', '21984456631'),
                     (5, 'Ricardo', 'Carvalho Santos', '47190087613', '5489711234', 'Av Grandes Marchas, 1567, apto 401, bloco B', 'Neves', 'São Gonçalo', 'RJ', 'ricardocarvsantos@gmail.com', '21998763345');
                     
-- conferindo SELECT * FROM clientes;

-- inserindo dados na tabela Serviço (idServico AUTO_INCREMENT, Valor FLOAT, Descricao)
INSERT INTO servico (Valor, Descricao) VALUES 
				  (99.99, 'Lanternagem'),
                  (200.15, 'Dessamassar carcaça'),
                  (145.99, 'Pintura'),
                  (59.99, 'Troca de óleo'),
                  (79.99, 'Revisão de Freio');

-- conferindo 
SELECT * FROM servico;
SELECT * FROM ordemServ;

-- inserindo dados na  tabela  ordemServ(idOrdemServ AUTO_INCREMENT, idOSVeic fk idVeiculo, Descricao, Estado ENUM ('Em andamento', 'Em espera', 'Entregue') NOT NULL DEFAULT 'Em Espera',
--   DataEmissao DATE, DataEntrega DATE, Valor FLOAT);
INSERT INTO ordemServ(idOSVeic, Descricao, Estado, DataEmissao, DataEntrega, Valor) VALUES
					 (1, 'Lanternagem', 'Entregue', '2022-07-14', '2022-07-21', 99.99),
                     (2, 'Pintura', 'Em andamento', '2022-08-29', '2022-09-20', 145.99),
                     (3, 'Troca de óleo', 'Entregue', '2022-07-21', '2022-07-22', 59.99),
                     (4, 'Revisão de freio', 'Em andamento', '2022-09-08', '2022-09-14', 79.99),
                     (5, 'Dessamassar carcaça', 'Entregue', '2022-05-18', '2022-06-15', 200.15);
-- conferindo SELECT * FROM ordemServ;

-- inserindo dados na tabela mecanico(idMecanico AUTO_INCREMENT, PrNome, SobNome, CPF, RG, Logr, Bairro, Cidade, UF, Email, Celular)
INSERT INTO mecanico(PrNome, SobNome, CPF, RG, Logr, Bairro, Cidade, UF, Email, Celular) VALUES
					('Leandro', 'Perreira da Costa', '15748963254', '2874159632', 'Rua Olibeira Marinho lt 14 qd 215', 'Jardim Catarina', 'São Gonçalo', 'RJ', 'leandrocosta1987@gmail.com', '21977445689'),
                    ('Daniel Augusto', 'Silva Santos', '24569782365', '8799566123', 'Av Visconde de Seabra 215 casa3', 'Santa Luzia', 'São Gonçalo', 'RJ', 'daniboy345@hotmail.com', '21974856631'),
                    ('Henrique', 'Barbosa Couto', '67899067613', '2109877590', 'Rua Mario da Costa lt 45 qd 290', 'Venda das Pedras', 'Itaboraí', 'RJ', 'henriquemengo1999@gmail.com', '219788456321'),
                    ('Wesley', 'da Cruz Barbosa', '12387496525', '2144475984', 'Travessa São Luiz 18', 'Manilha', 'Itaboraí', 'RJ', 'wbarbosa@gmail.com', '21987452366'),
                    ('Antonio', 'Lira Bezerra', '58098754321', '9812563800', 'Rua Santa Lucia lt 54 qd 110', 'Jardim Alcantara', 'São Gonçalo', 'RJ', 'antoniobezerra1960@gmail.com', '21998734356');

-- conferindo SELECT * FROM mecanico;

-- inserindo dados na tabela pecas(idPeca AUTO_INCREMENT, NomePeca, Categoria, QuantEst);
INSERT INTO pecas(NomePeca, Categoria, QuantEst) VALUES
				 ('Pincel a jato', 'Pintuta', 15),
                 ('Martelino n 12', 'Lanternagem', 10),
                 ('Prensa tipo 15', 'Dessamassar', 5),
                 ('Mangueira n 7', 'Troca de óleo', 20),
                 ('Sensor tipo 2', 'Revisão de freio', 2);
                 
-- corrigindo
UPDATE pecas SET NomePeca = 'Martelinho n 12' WHERE idPeca = 2;

-- conferindo 
SELECT * FROM pecas;
SELECT * FROM ordemServ;

-- inserindo dados na tabela  fornecedor(idFornecedor AUTO_INCREMENT, RazSocial,  CNPJ CHAR(14), Logr, Bairro, Cidade, UF, Email)
INSERT INTO fornecedor(RazSocial,  CNPJ, Logr, Bairro, Cidade, UF, Email) VALUES
					  ('Marçal Pinturas LTDA', '21358467422330', 'Rua Aldeia da Prata, 215', 'Aldeia da Prata', 'Itaboraí', 'RJ', 'marcalpinturas@contato.com'),
                      ('Denis Metais e Construção LTDA', '1575423610002', 'Estrada da Caixa d Água 1415', 'Porto Caxias', 'Itaboraí', 'RJ', 'dnmateriais@contato.com'),
                      ('Santos Eletrônicos S.A.', '4557182390009', 'Rua Armando Januário 280', 'Manilha', 'Itaboraí', 'RJ', 'santoseletric@contato.com');
-- conferindo
SELECT * FROM fornecedor;
SELECT * FROM pecas;

-- inserindo dados na tabela relacionameto serviço gera ordem de serviço serv_OrdemServ( idServ INT, idOrdem INT);
INSERT INTO serv_OrdemServ(idServ, idOrdem) VALUES
						  (1,1),
                          (3, 2),
                          (4, 3),
                          (5, 4),
                          (2, 5);
-- conferindo
SELECT * FROM serv_OrdemServ;

-- inserindo dados na tabela relacionamento serviço e mecanico = equipe (idServicos, idMecan)
INSERT INTO equipe (idServicos, idMecan) VALUES
					(1, 4),
                    (3, 5),
                    (2, 2),
                    (5, 3),
                    (4, 1);
-- conferindo
SELECT * FROM equipe;

-- inserindo dados na tabela relacionamento peca e ordem de serviço = pecaOS(idPecas INT, idOrdServ INT, Quant INT NOT NULL DEFAULT 0)
INSERT INTO pecaOS(idPecas, idOrdServ, Quant) VALUES 
				  (1, 2, 2),
                  (2, 1, 4),
                  (3, 5, 2),
                  (4, 3, 5),
                  (5, 4, 2);
-- conferindo
SELECT * FROM pecaOS;

-- inserindo dados na tabela relacionamento peça e fornecedor = pecaForn(idPec INT, idForn INT, Quant INT NOT NULL DEFAULT 0)
INSERT INTO pecaForn(idPec, idForn, Quant) VALUES
					(1, 1, 150),
                    (2, 2, 200),
                    (3, 3, 5),
                    (4, 2, 100),
                    (5, 3, 25);
 -- conferindo
SELECT * FROM pecaForn;                   



                          

                     