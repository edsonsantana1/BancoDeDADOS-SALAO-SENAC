-- 1.TODOS OS PROFICIONAIS.
        
select func.cpf as "CPF", func.nome "Nome", func.sexo "Gênero", func.estadoCivil "Estado Civil",
	date_format(func.dataNasc, '%d/%m/%Y') "Data de Nascimento", 
	func.email "E-mail", func.especialidade "Especialidade",
    concat("R$ ", format(func.salario, 2, 'de_DE')) "Salário", 
    concat("R$ ", format(func.comissao, 2, 'de_DE')) "Comissão",
	date_format(func.dataAdm, "%h:%i %d/%m/%Y") "Data de Admissão",
    coalesce(date_format(func.dataDem, "%h: %i %d/%m?%Y"), "Ativo") "Data de Demissão",
    endF.cidade "Cidade", tel.numero "Telefone"
    from funcionario func
		inner join enderecofunc endF on func.cpf = endF.Funcionario_cpf
        left join telefone tel on tel.Funcionario_cpf = func.cpf
			order by nome; 
            
            
-- 2.LISTA DE PROFISSIONAIS ATIVOS NO SALÃO SENAC.

 select func.cpf as "CPF", func.nome "Nome", func.sexo "Gênero", func.estadoCivil "Estado Civil",
	date_format(func.dataNasc, '%d/%m/%Y') "Data de Nascimento", 
	func.email "E-mail", func.especialidade "Especialidade",
    concat("R$ ", format(func.salario, 2, 'de_DE')) "Salário", 
    concat("R$ ", format(func.comissao, 2, 'de_DE')) "Comissão",
	date_format(func.dataAdm, "%h:%i %d/%m/%Y") "Data de Admissão",
    coalesce(date_format(func.dataDem, "%h: %i %d/%m?%Y"), "Ativo") "Data de Demissão",
    endF.cidade "Cidade"
    from funcionario func
		inner join enderecofunc endF on func.cpf = endF.Funcionario_cpf
			where func.dataDem is null
				order by func.nome;


-- 3.RELAÇÃO DE TODOS OS FUNCIONÁRIOS DE SEXO MASCULINO DO SALÃO SENAC.
 
select func.cpf as "CPF", func.nome "Nome", func.sexo "Gênero", func.estadoCivil "Estado Civil",
	date_format(func.dataNasc, '%d/%m/%Y') "Data de Nascimento", 
	func.email "E-mail", func.especialidade "Especialidade",
    concat("R$ ", format(func.salario, 2, 'de_DE')) "Salário", 
    concat("R$ ", format(func.comissao, 2, 'de_DE')) "Comissão",
	date_format(func.dataAdm, "%h:%i %d/%m/%Y") "Data de Admissão",
    coalesce(date_format(func.dataDem, "%h: %i %d/%m?%Y"), "Ativo") "Data de Demissão",
    endF.cidade "Cidade"
    from funcionario func
		inner join enderecofunc endF on func.cpf = endF.Funcionario_cpf
			where func.sexo = 'M' 
				order by func.nome;
                
            
-- 4.RELAÇÃO DE TODOS OS FUNCIONÁRIOS DE SEXO FEMININO DO SALÃO SENAC.

select func.cpf as "CPF", func.nome "Nome", func.sexo "Gênero", func.estadoCivil "Estado Civil",
	date_format(func.dataNasc, '%d/%m/%Y') "Data de Nascimento", 
	func.email "E-mail", func.especialidade "Especialidade",
    concat("R$ ", format(func.salario, 2, 'de_DE')) "Salário", 
    concat("R$ ", format(func.comissao, 2, 'de_DE')) "Comissão",
	date_format(func.dataAdm, "%h:%i %d/%m/%Y") "Data de Admissão",
    coalesce(date_format(func.dataDem, "%h: %i %d/%m/%Y"), "Ativo") "Data de Demissão",
    endF.cidade "Cidade"
    from funcionario func
		inner join enderecofunc endF on func.cpf = endF.Funcionario_cpf
			where func.sexo = 'F' 
				order by func.nome;
            
            
-- 5.RELAÇÃO DE TODOS OS FUNCIONÁRIOS DE OLINDA/PE.

select funcionario_cpf from enderecofunc
    where cidade like "Olinda";


select func.cpf as "CPF", func.nome "Nome", func.sexo "Gênero", func.estadoCivil "Estado Civil",
	date_format(func.dataNasc, '%d/%m/%Y') "Data de Nascimento", 
	func.email "E-mail", func.especialidade "Especialidade",
    concat("R$ ", format(func.salario, 2, 'de_DE')) "Salário", 
    concat("R$ ", format(func.comissao, 2, 'de_DE')) "Comissão",
	date_format(func.dataAdm, "%h:%i %d/%m/%Y") "Data de Admissão",
    coalesce(date_format(func.dataDem, "%h: %i %d/%m%Y"), "Ativo") "Data de Demissão",
    endF.cidade "Cidade"
    from funcionario func
		inner join enderecofunc endF on func.cpf = endF.Funcionario_cpf
			where endF.cidade like "Olinda"
				order by func.nome;
                
                
-- 6.RELAÇÃO DE TODOS OS FUNCIONÁRIOS DE RECIFE/PE

select funcionario_cpf from enderecofunc
    where cidade like "Recife";


select func.cpf as "CPF", func.nome "Nome", func.sexo "Gênero", func.estadoCivil "Estado Civil",
	date_format(func.dataNasc, '%d/%m/%Y') "Data de Nascimento", 
	func.email "E-mail", func.especialidade "Especialidade",
    concat("R$ ", format(func.salario, 2, 'de_DE')) "Salário", 
    concat("R$ ", format(func.comissao, 2, 'de_DE')) "Comissão",
	date_format(func.dataAdm, "%h:%i %d/%m/%Y") "Data de Admissão",
    coalesce(date_format(func.dataDem, "%h: %i %d/%m%Y"), "Ativo") "Data de Demissão",
    endF.cidade "Cidade"
    from funcionario func
		inner join enderecofunc endF on func.cpf = endF.Funcionario_cpf
			where endF.cidade like "Recife"
				order by func.nome;
                
                
-- 7.LISTA DE RELAÇÃO DE FUNCIONÁRIOS DEMITIDOS ENTRE 2016 A 2024.

select func.cpf as "CPF", func.nome "Nome", func.sexo "Gênero", func.estadoCivil "Estado Civil",
	date_format(func.dataNasc, '%d/%m/%Y') "Data de Nascimento", 
	func.email "E-mail", func.especialidade "Especialidade",
    concat("R$ ", format(func.salario, 2, 'de_DE')) "Salário", 
    concat("R$ ", format(func.comissao, 2, 'de_DE')) "Comissão",
	date_format(func.dataDem, "%h:%i %d/%m/%Y") "Data de Admissão",
    date_format(func.dataDem, "%h: %i %d/%m%Y") "Data de Demissão",
    endF.cidade "Cidade"
    from funcionario func
		inner join enderecofunc endF on func.cpf = endF.Funcionario_cpf
			where func.dataDem between '2016-01-01' and '2024-12-31'
				order by func.dataDem;
    
    
-- 8. LISTA DE FUNCIONÉRIOS ADMITIDOS ENTRE 2015 A 2024.
    
select func.cpf as "CPF", func.nome "Nome", func.sexo "Gênero", func.estadoCivil "Estado Civil",
	date_format(func.dataNasc, '%d/%m/%Y') "Data de Nascimento", 
	func.email "E-mail", func.especialidade "Especialidade",
    concat("R$ ", format(func.salario, 2, 'de_DE')) "Salário", 
    concat("R$ ", format(func.comissao, 2, 'de_DE')) "Comissão",
	date_format(func.dataAdm, "%h:%i %d/%m/%Y") "Data de Admissão",
    date_format(func.dataDem, "%h: %i %d/%m%Y") "Data de Demissão",
    endF.cidade "Cidade"
    from funcionario func
		inner join enderecofunc endF on func.cpf = endF.Funcionario_cpf
			where func.dataDem between '2015-10-01' and '2024-12-31'
				order by func.dataDem;
  
  
-- 9. LISTA DE FUNCIONÁRIOS QUE GANHAM IGUAL OU MENOR QUÊ R$ 2.000,00.

select func.cpf as "CPF", func.nome "Nome", func.sexo "Gênero", func.estadoCivil "Estado Civil",
	date_format(func.dataNasc, '%d/%m/%Y') "Data de Nascimento", 
	func.email "E-mail", func.especialidade "Especialidade",
    concat("R$ ", format(func.salario, 2, 'de_DE')) "Salário", 
    concat("R$ ", format(func.comissao, 2, 'de_DE')) "Comissão",
	date_format(func.dataAdm, "%h:%i %d/%m/%Y") "Data de Admissão",
    coalesce(date_format(func.dataDem, "%h: %i %d/%m%Y"), "Ativo") "Data de Demissão",
    endF.cidade "Cidade"
    from funcionario func
		inner join enderecofunc endF on func.cpf = endF.Funcionario_cpf
		where salario <= 2000 
			order by func.nome;
            
            
-- 10. LISTA DE FUNCIONÁRIOS QUE GANHAM UM SALÁRIO MAIOR QUÊ R$ 2.000,00.
     
select func.cpf as "CPF", func.nome "Nome", func.sexo "Gênero", func.estadoCivil "Estado Civil",
	date_format(func.dataNasc, '%d/%m/%Y') "Data de Nascimento", 
	func.email "E-mail", func.especialidade "Especialidade",
    concat("R$ ", format(func.salario, 2, 'de_DE')) "Salário", 
    concat("R$ ", format(func.comissao, 2, 'de_DE')) "Comissão",
	date_format(func.dataAdm, "%h:%i %d/%m/%Y") "Data de Admissão",
    coalesce(date_format(func.dataDem, "%h: %i %d/%m%Y"), "Ativo") "Data de Demissão",
    endF.cidade "Cidade"
    from funcionario func
		inner join enderecofunc endF on func.cpf = endF.Funcionario_cpf
		where salario >= 2001 
			order by func.nome;
            
            
-- 11. TIPO DE PAGAMENTO E VALOR TOTAL PAGO.

select tipo as "Tipo de Pagamento", 
       SUM(valor) "Total Pago"
		from formapag
			group by tipo
				order by SUM(valor) desc;
                
                
-- 12. MÉDIA SALARIAL DOS FUNCIONÁRIOS.

select avg(salario) from funcionario;
            

select func.cpf as "CPF", func.nome "Nome", func.sexo "Gênero", func.estadoCivil "Estado Civil",
	date_format(func.dataNasc, '%d/%m/%Y') "Data de Nascimento", 
	func.email "E-mail", func.especialidade "Especialidade",
    concat("R$ ", format(func.salario, 2, 'de_DE')) "Salário", 
    concat("R$ ", format(func.comissao, 2, 'de_DE')) "Comissão",
	date_format(func.dataAdm, "%h:%i %d/%m/%Y") "Data de Admissão",
    coalesce(date_format(func.dataDem, "%h: %i %d/%m%Y"), "Ativo") "Data de Demissão",
    endF.cidade "Cidade"
    from funcionario func
		inner join enderecofunc endF on func.cpf = endF.Funcionario_cpf
			where salario > (select avg(salario) from funcionario)
				order by salario desc;
                
                
-- 13. LISTA DOS FUNCIONÁRIOS DE SEXO 'M' SOLTEIROS.

select func.cpf as "CPF", func.nome "Nome", func.sexo "Gênero", func.estadoCivil "Estado Civil",
	date_format(func.dataNasc, '%d/%m/%Y') "Data de Nascimento", 
	func.email "E-mail", func.especialidade "Especialidade",
    concat("R$ ", format(func.salario, 2, 'de_DE')) "Salário", 
    concat("R$ ", format(func.comissao, 2, 'de_DE')) "Comissão",
	date_format(func.dataAdm, "%h:%i %d/%m/%Y") "Data de Admissão",
    coalesce(date_format(func.dataDem, "%h: %i %d/%m%Y"), "Ativo") "Data de Demissão",
    endF.cidade "Cidade"
    from funcionario func
		inner join enderecofunc endF on func.cpf = endF.Funcionario_cpf
			where estadoCivil = "Solteiro"
				order by nome;
                

-- 14. LISTA DOS FUNCIONÁRIOS DE SEXO 'F' SOLTEIRAS.

select func.cpf as "CPF", func.nome "Nome", func.sexo "Gênero", func.estadoCivil "Estado Civil",
	date_format(func.dataNasc, '%d/%m/%Y') "Data de Nascimento", 
	func.email "E-mail", func.especialidade "Especialidade",
    concat("R$ ", format(func.salario, 2, 'de_DE')) "Salário", 
    concat("R$ ", format(func.comissao, 2, 'de_DE')) "Comissão",
	date_format(func.dataAdm, "%h:%i %d/%m/%Y") "Data de Admissão",
    coalesce(date_format(func.dataDem, "%h: %i %d/%m%Y"), "Ativo") "Data de Demissão",
    endF.cidade "Cidade"
    from funcionario func
		inner join enderecofunc endF on func.cpf = endF.Funcionario_cpf
			where estadoCivil = "Solteira"
				order by nome;
                
                
-- 15. LISTA DE AGENDAMENTOS.
    
select ag.status, ag.hora, ag.data,
    cli.nome "Nome do Cliente", 
    cli.email "Email do Cliente",
    tel.numero "Telefone do Cliente",
    func.nome "Nome do Funcionário", 
    srv.nome "Tipo de Serviço", 
    concat('R$ ', format(srv.valor, 2, 'de_DE')) "Valor do Serviço", 
    fp.tipo AS "Forma de Pagamento",
    concat('R$ ', format(fp.valor, 2, 'de_DE')) "Valor Pago"
	from agendamento ag
		inner join cliente cli on ag.Cliente_email = cli.email
		inner join telefone tel on cli.email = tel.Cliente_email
		inner join funcionario func on ag.Funcionario_CPF = func.cpf
		inner join servico srv on ag.Servico_idServico = srv.idServico
        inner join formapag fp on ag.idAgendamento = fp.Agendamento_idAgendamento
			order by ag.data, ag.hora; 


-- 16. LISTA DE CLIENTES SALÃO SENAC


select cli.email AS "Email", cli.nome "Nome", cli.sexo "Gênero", 
    DATE_FORMAT(cli.dataNasc, '%d/%m/%Y') AS "Data de Nascimento", 
    endF.cidade as "Cidade", 
    tel.numero as "Telefone"
	from cliente cli
		inner join enderecocli endF on cli.email = endF.Cliente_email	
        left join telefone tel on tel.Cliente_email = cli.email
			order by cli.nome;
            

-- 17. LISTA COM OS CLIENTES DE SEXO MASCULINO.

select cli.email AS "Email", cli.nome "Nome", cli.sexo "Gênero", 
    DATE_FORMAT(cli.dataNasc, '%d/%m/%Y') AS "Data de Nascimento", 
    endF.cidade as "Cidade", 
    tel.numero as "Telefone"
	from cliente cli
		inner join enderecocli endF on cli.email = endF.Cliente_email	
        left join telefone tel on tel.Cliente_email = cli.email
			where cli.sexo = 'M'
			order by cli.nome;
            
            
-- 18. LISTA COM OS CLIENTES DE SEXO FEMININO

select cli.email AS "Email", cli.nome "Nome", cli.sexo "Gênero", 
    DATE_FORMAT(cli.dataNasc, '%d/%m/%Y') AS "Data de Nascimento", 
    endF.cidade as "Cidade", 
    tel.numero as "Telefone"
	from cliente cli
		inner join enderecocli endF on cli.email = endF.Cliente_email	
        left join telefone tel on tel.Cliente_email = cli.email
			where cli.sexo = 'F'
			order by cli.nome;
            
            
-- 19. VALOR TOTAL ARRECADADO POR FUNCIONÁRIO POR MÊS.
    
select func.nome as "Nome do Funcionário",
    DATE_FORMAT(ag.data, '%Y-%m') "Mês",
    SUM(srv.valor) "Valor Total Arrecadado"
	from agendamento ag
		inner join funcionario func on ag.Funcionario_CPF = func.cpf
		inner join servico srv on ag.Servico_idServico = srv.idServico
			group by func.nome, DATE_FORMAT(ag.data, '%Y-%m');


-- 20. VALOR TOTAL ARRECADADO POR CLIENTE.

select cli.nome AS "Nome do Cliente", cli.email "Email do Cliente",
    SUM(fp.valor) "Valor Total Pago"
from agendamento ag
	inner join cliente cli on ag.Cliente_email = cli.email
	inner join formapag fp on ag.idAgendamento = fp.Agendamento_idAgendamento
		group by cli.nome, cli.email
			order by "Valor Total Pago" desc;
    
    
