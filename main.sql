--Sintaxe básica de SQL

use fcc_sql_guides_database; -- seleciona o banco de dados da amostra, chamado fcc_sql_guides

--Instruções SELECT e FROM

select studentID, FullName, 3+2 as five, now() as currentDate
    from student;


 --Instrução WHERE (AND/OR, IN, BETWEEN e LIKE)

select studentID, FullName, sat_score, recordUpdated
from student
where (
		studentID between 1 and 5
		or studentID = 8
        or FullName like '%Maximo%'
		);

--Exemplo excluindo alunos com pontuaçõe sentre 1000 e 1400:

select studentID, FullName, sat_score, recordUpdated
    from student
    where (
		studentID between 1 and 5
		or studentID = 8
        or FullName like '%Maximo%'
		)
		and sat_score NOT in (1000, 1400);


 --ORDER BY (ASC, DESC)

SELECT studentID, FullName, sat_score
FROM student
ORDER BY FullName DESC;


--Lista não ordenada

SELECT studentID, FullName, sat_score, rcd_updated FROM student;

--Limitar studentIDs entre 1 e 5 OU studentID de 8 OU nome completo que contenha "Maximo" E pontuação do SAT que não seja de 1000 ou 1400

select studentID, FullName, sat_score
  from student
   where (studentID between 1 and 5 -- incluindo os extremos
	    or studentID = 8
        or FullName like '%Maximo%')
	    and sat_score NOT in (1000, 1400)
        order by FullName DESC;


--GROUP BY e HAVING

select Candidate, Election_year, sum(Total_$), count(*)
    from combined_party_data
    where Election_year = 2016
    group by Candidate, Election_year
    having count(*) > 80
    order by count(*) DESC;


--Operador BETWEEN em SQL

select field1, testField
from table1
where testField between min and max

--Usando a instrução WHERE

-- sem a instrução WHERE
select studentID, FullName, studentID
from student;
    
-- com a instrução WHERE e com BETWEEN
select studentID, FullName, studentID
from student
where studentID between 2 and 7;

--Usando a instrução HAVING

select Candidate, Office_Sought, Election_Year, format(sum(Total_$),2)
from combined_party_data
where Election_Year = 2016
group by Candidate, Office_Sought, Election_Year
having sum(Total_$) between 3000000 and 18000000
order by sum(Total_$) desc;

--Criando tabela

CREATE TABLE TABLENAME(Attribute1 Datatype, Attribute2 Datatype,........);


--Exemplo de tabela

CREATE TABLE Person(
  Id int not null,
  Name varchar not null,
  DateOfBirth date not null,
  Gender bit not null,
  PRIMARY KEY( Id )
);


--Uma coluna pode ser not null ou null, indicando se ela é ou não obrigatória.

CREATE TABLE example_table ( name varchar(255), age int)

--Insert

INSERT INTO example_table (column1,column2) VALUES ("Andrew",23)

--Usando a tabela sem a instrução WHERE

select * from student;

--Usando a instrução WHERE

select * from student 
where programOfStudy = 'Programming';

--Usando a instrução WHERE atualizada com AND, mostrando pontuação maior que 800

select * from student 
where programOfStudy = 'Programming' 
and sat_score > 800;

--Usando instrução GROUP BY com uma instrução HAVING usando um AND para restringir o número de registros retornados a candidatos de 2016 com contribuições entre US$3 milhões e US$18 milhões no total.

select Candidate, Office_Sought, Election_Year, FORMAT(sum(Total_$),2) from combined_party_data
where Office_Sought = 'PRESIDENT / VICE PRESIDENT'
group by Candidate, Office_Sought, Election_Year
 having Election_Year = 2016 and sum(Total_$) between 3000000 and 18000000
order by sum(Total_$) desc;

--Inner Join - retorna todas as linhas nas quais haja ao menos uma correspondência nas duas tabelas.

SELECT * FROM A x JOIN B y ON y.aId = x.Id

--Left Join - retorna todas as linhas da tabela da esquerda e as linhas correspondentes da tabela da direita.

SELECT * FROM A x LEFT JOIN B y ON y.aId = x.Id

--Right Join -retorna todas as linhas da tabela da direita e as linhas correspondentes da tabela da esquerda

SELECT * FROM A x RIGHT JOIN B y ON y.aId = x.Id

--Full Join -retorna todas as linhas para as quais haja uma correspondência em qualquer uma das tabelas

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders
ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName











