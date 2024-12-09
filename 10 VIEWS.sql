-- VIEWS

-- 1. funcSexoMascAtivo 

create view funcSexoMascAtivo as

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
			where func.sexo = 'M' and func.dataDem is null
				order by func.nome;
                
                
-- 2.  view funcSexoFemAtivo

create view funcSexoFemAtivo as

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
			where func.sexo = 'F' and func.dataDem is null
				order by func.nome;
                
                
-- 3. view FuncAtivoOlinda

create view FuncAtivoOlinda as

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
			where endF.cidade like "Olinda" and func.dataDem is null
				order by func.nome;
                
                
-- 4. view funcAtivoRecife      

create view funcAtivoRecife as

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
			where endF.cidade like "Recife" and func.dataDem is null
				order by func.nome;


-- 5. view funcSalarioMenor2000ativo

create view funcSalarioMenor2000ativo as

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
		where salario <= 2000 and func.dataDem is null
			order by func.nome;
            
            
-- 6. view funcSalaraioMaior2000ativo

create view funcSalaraioMaior2000ativo as

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
		where salario >= 2001 and func.dataDem is null
			order by func.nome;
            
            
-- 7. view MediaSalarioFuncAtivo

create view MediaSalarioFuncAtivo as 

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
			where salario > (select avg(salario) from funcionario) and func.dataDem is null
				order by salario desc;
            
            
-- 8. view exibirAgendamPorData

create view exibirAgendamPorData as 

select ag.status, ag.hora, ag.data, 
    cli.nome "Nome do Cliente", cli.email "Email do Cliente",
    tel.numero "Telefone do Cliente",
    func.nome "Nome do Funcionario", srv.nome "Tipo de Serviço", srv.valor AS "Valor do Serviço"
	from agendamento ag
		inner join cliente cli on ag.Cliente_email = cli.email
		inner join telefone tel on cli.email = tel.Cliente_email
		inner join funcionario func on ag.Funcionario_CPF = func.cpf
		inner join servico srv on ag.Servico_idServico = srv.idServico
			where ag.data = '2024-12-07'  
				order by ag.data;
                
                
-- 9. view listaClientesSalao

create view listaClientesSalao as

select cli.email AS "Email", cli.nome "Nome", cli.sexo "Gênero", 
    DATE_FORMAT(cli.dataNasc, '%d/%m/%Y') AS "Data de Nascimento", 
    endF.cidade as "Cidade", 
    tel.numero as "Telefone"
	from cliente cli
		inner join enderecocli endF on cli.email = endF.Cliente_email	
        left join telefone tel on tel.Cliente_email = cli.email
			order by cli.nome;
            
            
-- 10. view ValorTotalMesFunc

create view ValorTotalMesFunc as 

select func.nome as "Nome do Funcionário",
    DATE_FORMAT(ag.data, '%Y-%m') "Mês",
    SUM(srv.valor) "Valor Total Arrecadado"
	from agendamento ag
		inner join funcionario func on ag.Funcionario_CPF = func.cpf
		inner join servico srv on ag.Servico_idServico = srv.idServico
			group by func.nome, DATE_FORMAT(ag.data, '%Y-%m'); 