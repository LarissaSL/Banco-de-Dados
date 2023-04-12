--Atividade 09

--a) Criar as tabelas e Relacionamentos.
create table Cursos
(Cod_Curso int,
Nome_Curso varchar(20),
Constraint pk_cod primary key(Cod_Curso));

create table Alunos
(Cod_RM int,
Nome_Aluno varchar(45),
Curso int,
Serie int,
Periodo varchar(20),
constraint pk_Cod_RM primary key (Cod_RM),
constraint fk_cod foreign key (Curso) references Cursos (Cod_Curso));

create table Disciplinas
(Cod_Discipl int,
Nome_Disciplina varchar (20),
constraint pk_cod_Disc primary key (Cod_Discipl));

create table Notas 
(Cod_RM int,
Cod_Discipl int,
Nota_1 numeric(10,2),
Nota_2 numeric (10,2),
constraint pk_Notas primary key (Cod_RM, Cod_Discipl),
constraint fk_cod_RM foreign key (Cod_RM) references Alunos(Cod_RM),
constraint fk_cod_Discipl foreign key (Cod_Discipl) references Disciplinas(Cod_Discipl));

-- delete tabela
drop table Cursos;

drop table Alunos;

drop table Disciplinas;

drop table Notas;

-- Mostrar tabelas
Select * from Cursos;

Select * from Alunos;

Select * from Disciplinas;

Select * from Notas;

--b) Inserir 5 registrosem cada tabela.

Insert into Cursos values
(01,'Informática'),
(02,'Plástico'),
(03,'Engenharia');

Insert into Alunos values
(123,'Gumball',01,01,'1º periodo'),
(231,'Darwin',02,01,'2º periodo'),
(345,'Jordan',02,02,'1º periodo'),
(678,'Jesus',03,02,'4º periodo');

Insert into Alunos values
(679,'Luciana',03,02,'4º periodo');

Insert into Disciplinas values
(03,'Matemática'),
(04,'Banco de Dados'),
(05,'LPII');

Insert into Notas values
(123,03,9.5,8.9),
(123,04,5.8,9.5),
(231,05,6.8,7.2);

insert into Notas (Cod_RM, Cod_Discipl) values 
(345,03),
(678,03);

insert into Alunos  values
(283, 'Larissa', 01,02,'4º periodo'); 

--c) Selecionar nome, período e série de todos os alunos do curso de Informática;
Select Alunos.Nome_Aluno, Alunos.Periodo, Alunos.Serie, Cursos.Nome_Curso from Alunos inner join Cursos
on Alunos.Curso = Cursos.Cod_Curso where Cursos.Nome_Curso = 'Informática';

--d) Selecionar Nome do aluno, curso, nome da disciplina, nota1 e nota2, de todos os alunos.
Select Alunos.Nome_Aluno, Alunos.Curso, Disciplinas.Nome_Disciplina, Notas.Nota_1, Notas.Nota_2 from Notas  inner join Alunos
on Notas.Cod_RM = Alunos.Cod_RM
inner join Disciplinas on Notas .Cod_Discipl = Disciplinas.Cod_Discipl;  

--e) Selecionar todas as notas do aluno  (Seu nome);
Select Alunos.Nome_Aluno, Notas.Nota_1, Notas.Nota_2 from  Alunos  left outer join notas
on Notas.Cod_RM = Alunos.Cod_RM where Alunos.Nome_Aluno = 'Larissa';

--f) Selecionar RM, nome e curso de todos os alunos com nota1 superior a 8 na disciplina Matemática;
Select Alunos.Cod_RM, Alunos.Nome_Aluno, Alunos.Curso, Notas.Nota_1 from Notas  inner join Alunos
on Notas.Cod_RM = Alunos.Cod_RM
inner join Disciplinas on Notas .Cod_Discipl = Disciplinas.Cod_Discipl where Notas.Nota_1 > 8.0 and Disciplinas.Nome_Disciplina = 'Matemática';

--g) Quantas notas (nota1) inferior a 6,0, em Banco de Dados,  temosno Cadastro de Notas? 
Select count (Notas.Nota_1) as 'Qntd N1 BD < 6.0' from Notas inner join Disciplinas 
on  Notas .Cod_Discipl = Disciplinas.Cod_Discipl where Notas.Nota_1 < 6.0;

--h) Qual a média de Notas (Nota2) na disciplina LPII? 
select avg (Notas.Nota_2) as 'Média N2 da LPII' from Notas inner join Disciplinas 
on  Notas .Cod_Discipl = Disciplinas.Cod_Discipl where Disciplinas.Nome_Disciplina = 'LPII';

--i) Quantos alunos temos no curso de  Informática? 
Select count(Alunos.Cod_RM) as 'Qntd de Alunos em inf. ' from Alunos inner join Cursos
on  Alunos.Curso = Cursos.Cod_Curso where Cursos.Nome_Curso = 'Informática';

--j) Quantos alunos temos no curso de  Plástico?
Select count(Alunos.Cod_RM) as 'Qntd de Alunos no curso de plast. ' from Alunos inner join Cursos
on  Alunos.Curso = Cursos.Cod_Curso where Cursos.Nome_Curso = 'Plástico';

--k) Selecionar todos os alunos que não possuem Nota1.
Select Alunos.Nome_Aluno, Notas.Nota_1 from Alunos left outer join Notas 
on Alunos.Cod_RM = Notas.Cod_RM where Notas.Nota_1 is Null;

--l) Selecionar todos os alunos que não possuem Nota2.
Select Alunos.Nome_Aluno, Notas.Nota_2 from Alunos left outer join Notas 
on Alunos.Cod_RM = Notas.Cod_RM where Notas.Nota_2 is Null;

--m) Selecionar todos os alunos que não possuem Nota1 em Matemática
Select Notas.Cod_RM, Notas.Nota_1 from Notas left outer join Disciplinas
on Notas.Cod_Discipl = Disciplinas.Cod_Discipl
where Notas.Nota_1 is Null and Disciplinas.Nome_Disciplina = 'Matemática';
