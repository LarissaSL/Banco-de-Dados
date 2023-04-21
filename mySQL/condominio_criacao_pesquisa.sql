 CREATE DATABASE condominio;
 USE condominio;
 
CREATE TABLE Unidade_condominal (
  id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  endereco VARCHAR(30)  NULL  ,
  numero int  NULL  ,
  complemento varchar(10)  NULL    ,
PRIMARY KEY(id));

CREATE TABLE Pessoa (
  id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nome_pessoa VARCHAR(40)  NULL    ,
PRIMARY KEY(id));

CREATE TABLE Aluguel (
  id_Unidade INTEGER UNSIGNED NOT NULL  ,
  id_Pessoa INTEGER UNSIGNED NOT NULL  ,
  data_inicio_aluguel DATE  NOT NULL  ,
  valor_aluguel DOUBLE  NULL  ,
  data_termino_aluguel DATE  NULL ,
  FOREIGN KEY(id_Pessoa) REFERENCES Pessoa(id),
  FOREIGN KEY(id_Unidade) REFERENCES Unidade_condominal(id));

CREATE TABLE Proprietario (
  id_Unidade INTEGER UNSIGNED NOT NULL  ,
  id_Pessoa INTEGER UNSIGNED NOT NULL  ,
  FOREIGN KEY(id_Pessoa) REFERENCES Pessoa(id),
  FOREIGN KEY(id_Unidade) REFERENCES Unidade_condominal(id));
  
 #Inserir dados no Banco

#Tabela Pessoa
Insert into `Pessoa` (`nome_pessoa`) values ("Buzz Lightyear");
Insert into `Pessoa` (`nome_pessoa`) values ("Woody");
Insert into `Pessoa` (`nome_pessoa`) values ("Slinky");
Insert into `Pessoa` (`nome_pessoa`) values ("Jessie");
Insert into `Pessoa` (`nome_pessoa`) values ("Bala no Alvo");


#Tabela Unidade
Insert into `Unidade_condominal` (`endereco`,`numero`,`complemento`) values ("Rua do Andy, Disney Pixar", 22, '');

Insert into `Unidade_condominal` (`endereco`,`numero`,`complemento`) values ("Rua da Molly, Disney Pixar", 23, '');

Insert into `Unidade_condominal` (`endereco`,`numero`,`complemento`) values ("Rua do All, Disney Pixar", 24, '');

Insert into `Unidade_condominal` (`endereco`,`numero`,`complemento`) values ("Rua Sunshine, Disney Pixar", 25, '');

Insert into `Unidade_condominal` (`endereco`,`numero`,`complemento`) values ("Rua Sunshine, Disney Pixar", 26, '');

Insert into `Unidade_condominal` (`endereco`,`numero`,`complemento`) values ("Rua Sunshine, Disney Pixar", 27, '');

#Tabela Proprietário
Insert into `Proprietario` (`id_Unidade`,`id_Pessoa`) values (1,1);
Insert into `Proprietario` (`id_Unidade`,`id_Pessoa`) values (2,1);
Insert into `Proprietario` (`id_Unidade`,`id_Pessoa`) values (1,4);
Insert into `Proprietario` (`id_Unidade`,`id_Pessoa`) values (2,4);

Insert into `Proprietario` (`id_Unidade`,`id_Pessoa`) values (3,2);
Insert into `Proprietario` (`id_Unidade`,`id_Pessoa`) values (3,3);

Insert into `Proprietario` (`id_Unidade`,`id_Pessoa`) values (4,5);
Insert into `Proprietario` (`id_Unidade`,`id_Pessoa`) values (5,5);

Insert into `Proprietario` (`id_Unidade`,`id_Pessoa`) values (6,2);
Insert into `Proprietario` (`id_Unidade`,`id_Pessoa`) values (6,3);

#Tabela Aluguel
Insert into `Aluguel` (`id_Unidade`,`id_Pessoa`,`data_inicio_aluguel`,`data_termino_aluguel`,`valor_aluguel`) values (1,3,"20230218","20230219",550.50);

Insert into `Aluguel` (`id_Unidade`,`id_Pessoa`,`data_inicio_aluguel`,`data_termino_aluguel`,`valor_aluguel`) values (1,5,"20230218","20230219",750.50);

Insert into `Aluguel` (`id_Unidade`,`id_Pessoa`,`data_inicio_aluguel`,`data_termino_aluguel`,`valor_aluguel`) values (1,4,"20230418","20230422",350.50);

Insert into `Aluguel` (`id_Unidade`,`id_Pessoa`,`data_inicio_aluguel`,`data_termino_aluguel`,`valor_aluguel`) values (3,1,"20230504","20230504",650.50);

Insert into `Aluguel` (`id_Unidade`,`id_Pessoa`,`data_inicio_aluguel`,`data_termino_aluguel`,`valor_aluguel`) values (5,2,"20231018","20231022",850.50);

select * from aluguel;
select * from pessoa;
select * from proprietario;
select * from unidade_condominal;

/* Operadores Lógicos AND /OR /NOT */
#Selecios os alugueis da Unidade 1 tem o valor de aluguel maior que 500
select id_pessoa, valor_aluguel from aluguel where id_unidade = 1 and valor_aluguel > 500;

#Selecionar os alugueis da unidade 1 e 3
select id_pessoa, valor_aluguel,id_unidade from aluguel where id_unidade = 1 or id_unidade = 3;

#Selecionar os alugueis que não sejam da Unidade 1
select id_pessoa, valor_aluguel, id_unidade from aluguel where not id_unidade = 1;

/* BETWEEN e NOT BETWEEN 
Selecionar os apartamentos que estejam entre o número 23 e 26*/
select id, endereco, numero from unidade_condominal where numero between 23 and 26;

#Selecionar os apartamentos que não estejam entre o número 23 e 26
select id, endereco, numero from unidade_condominal where numero not between 23 and 26;

#Selecionar as datas de inicio dos alugueis que estejam entre 01/02/2023 e 01/05/2023
select * from aluguel where data_inicio_aluguel between '2023-02-01' and '2023-05-01';

#Selecionar as datas de inicio dos alugueis que não estejam entre 01/02/2023 e 01/05/2023
select * from aluguel where data_termino_aluguel not between '2023-02-01' and '2023-05-01';

#Selecionar os valores de aluguel que estejam entre 700 e 1000
select id_pessoa, id_unidade, valor_aluguel from aluguel where valor_aluguel between 700 and 1000;

#Selecionar os valores de aluguel que não estejam entre 700 e 1000
select id_pessoa , id_unidade, valor_aluguel from aluguel where valor_aluguel not between 700 and 1000;

/* LIKE e NOT LIKE */
# Selecionar quais nomes começam com a Letra B
select * from pessoa where nome_pessoa like 'B%';

#Selecionar quais nomes terminam com AR
select * from pessoa where nome_pessoa like '%AR';

#Selecionar quais nomes terminam com Y
select * from pessoa where nome_pessoa like '%Y';

#Selecionar quais nomes tem a Letra A
select * from pessoa where nome_pessoa like '%a%';

#Selecionar quais nomes não tem a Letra A
select * from pessoa where nome_pessoa not like '%A%';

#Selecionar os nomes que a 6 letra seja L
select * from pessoa where nome_pessoa like '_____L%';

/* IN e NOT IN */
#Selecionar as informações das unidades condominais cujo número seja 22, 23 e 27
select * from unidade_condominal where numero in (22, 23, 27);

#Selecionar as informações das unidades condominais cujo número não seja 22, 23 e 27
select *  from unidade_condominal where numero not in (22, 23, 27);

#Selecionar as informações das pessoas Buzz Lightyear e Woody
select * from pessoa where nome_pessoa in ('Buzz Lightyear', 'Woody');

select count(*) as 'qtd pessoa' from pessoa;

/* BUSCANDO MINIMO E MAXIMO */
#Valor do menor Aluguel
select min(valor_aluguel) as 'Menor Aluguel' from aluguel;

#Valor do Maior Aluguel
select max(valor_aluguel) as 'Maior Aluguel' from aluguel where id_pessoa = 1 ;

/* TOTALIZANDO */
#Total de Alugueis
select sum(valor_aluguel) as 'Total de Alugueis' from aluguel;

#Média dos Alugueis feitos
select avg(valor_aluguel) as 'Média de Alugueis' from aluguel ;

#Quantidade de Alugueis feitos
select count(valor_aluguel) as 'Qtd. de Alugueis' from aluguel;

/* Inner Join */
#Selecionar, id da pessoa e da unidade, junto ao endereço e número que ela for Proprietária
select p.id, p.nome_pessoa, u.id as 'id_unid.', u.endereco, u.numero from unidade_condominal as u 
inner join proprietario as po 
on u.id = po.id_unidade 
join pessoa as p 
on p.id = po.id_Pessoa
order by id_Unidade; 

#Selecionar, id da pessoa e da unidade, junto ao endereço e número que ela for Proprietária
select a.id_unidade as 'Und. Alugada', u.endereco, u.numero, p.nome_pessoa as 'Alugou', a.valor_aluguel as 'Valor R$' from aluguel as a 
inner join unidade_condominal as u on a.id_Unidade = u.id 
join pessoa as p on p.id = a.id_Pessoa
order by a.valor_aluguel;

select po.id_unidade, po.id_pessoa, p.nome_pessoa from proprietario as po join pessoa as p on po.id_Pessoa = p.id order by id_unidade;

#Quantas unidades o proprietario 1 tem:
select count(*) as 'qtd. do Proprietario 1' from proprietario where id_pessoa = 1;

#Selecione o valor de aluguel que seja maior que 300 e da unidade 1
select * from aluguel where valor_aluguel > 300 and id_unidade = 1;

#Quais unidades foram alugadas entre 12/2022 e 04/2023
select * from aluguel where data_inicio_aluguel between '2022-12-01' and  '2023-04-30';
select * from aluguel where data_inicio_aluguel not between '2022-12-01' and  '2023-04-30';

#Selecionar os nomes que começam com a Letra J
select nome_pessoa from pessoa where nome_pessoa like 'J%';

#Selecionar os nomes que terminam com a letra Y
select nome_pessoa from pessoa where nome_pessoa like '%Y';

#Selecionar os nomes que tem A 
select nome_pessoa from pessoa where nome_pessoa like '%A%';

#Selecionar os nomes que tem A 
select nome_pessoa from pessoa where nome_pessoa like '_A%';

#Mostrar os valores de Aluguel do maior pro menor
select valor_aluguel from aluguel order by valor_aluguel desc;

#Mostrar os valores de Aluguel do menor pro maior
select valor_aluguel from aluguel order by valor_aluguel asc;

#Mostre o maior valor de aluguel
select MAX(valor_aluguel) as 'Maior Valor de Aluguel' from aluguel; 

#Mostre o menor valor de Aluguel
select MIN(valor_aluguel) as 'Menor Valor de Aluguel' from aluguel; 

#Mostre a media de alugueis feitos
select AVG(valor_aluguel) as 'Média de Aluguel' from aluguel;

#Mostre o valor total de alugueis feitos
select SUM(valor_aluguel) as 'Total de Aluguel' from aluguel;

#Mostre id_unidade,Endereço e o Nome do Proprietario das unidades Condominais
select po.id_unidade, u.endereco, p.nome_pessoa from proprietario as po
inner join unidade_condominal as u on po.id_Unidade = u.id 
inner join pessoa as p on p.id = po.id_pessoa 
order by id_unidade asc; 

