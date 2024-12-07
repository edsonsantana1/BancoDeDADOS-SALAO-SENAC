-- 5 PROCEDURES


-- 1. CADASTRAR NOVO CLIENTE.

delimiter $$

create procedure cadCliente(
							in pNome varchar(60),
							in pSexo char(1),
							in pEmail varchar(45),
							in pDataNasc date,
							in pCidade varchar(60),
							in pTelefone varchar(15))
begin
    insert into cliente (nome, sexo, email, dataNasc)
    values (pNome, pSexo, pEmail, pDataNasc);
    
    insert into enderecofunc (Cliente_email, cidade)
    values (pEmail, pCidade);
    
    insert into telefone (numero, Cliente_email)
    values (pTelefone, pEmail);
end $$
delimiter ;


-- 2. ATUALIZAR SALÁRIO DO FUNCIONÁRIO.

delimiter $$

create procedure atualizaSalarioFuncionario(
											in pCPF varchar(14),
											in pNovoSalario decimal(7,2))
begin
    update funcionario
    set salario = pNovoSalario
    where cpf = pCPF;
end $$
delimiter ;


-- 3. DELETAR CLIENTE.

delimiter $$

create procedure deletaCliente(
								in pEmail varchar(45))
begin
    delete from telefone where Cliente_email = pEmail;
    delete from enderecofunc where Cliente_email = pEmail;
    delete from cliente where email = pEmail;
end $$
delimiter ;


-- 4. REGISTRAR NOVO AGENDAMENTO.

delimiter $$

create procedure regAgendamento(
								in pStatus varchar(45),
								in pHora time,
								in pData date,
								in pClienteEmail varchar(45),
								in pFuncionarioCPF varchar(14),
								in pServicoID int)
begin
    insert into agendamento (status, hora, data, Cliente_email, Funcionario_CPF, Servico_idServico)
    values (pStatus, pHora, pData, pClienteEmail, pFuncionarioCPF, pServicoID);
end $$
delimiter ;


-- 5. ATUALIZAR STATUS DO AGENDAMENTO.

delimiter $$

create procedure atualizaStatusAgendamento(
										    in pIDAgendamento int,
											in pNovoStatus varchar(45))
begin
    update agendamento
    set status = pNovoStatus
    where idAgendamento = pIDAgendamento;
end $$

delimiter ;


-- 5 FUNÇÕES


-- 1. CALCULAR DESCONTO

delimiter $$

create function calcDesconto(preco decimal(7,2), percentual decimal(5,2))
returns decimal(7,2) deterministic 
begin
    return preco - (preco * percentual / 100);
end $$

delimiter ;


-- 2. CALCULAR TOTAL DE SERVIÇOS POR CLIENTE

delimiter $$

create function totalServicosCliente(pEmail varchar(45))
returns int deterministic
begin
    declare total int;
    select COUNT(*) into total
    from agendamento
    where Cliente_email = pEmail;
    return total;
end $$

delimiter ;


-- 3. CALCULAR TOTAL DE SERVIÇOS POR FUNCIONÁRIO.

delimiter $$

create function totalServicosFuncionario(pCPF varchar(14))
returns int deterministic
begin
    declare total int;
    select COUNT(*) into total
    from agendamento
    where Funcionario_CPF = pCPF;
    return total;
end $$

delimiter ;


-- 4. CALCULAR RECEITA TOTaL POR FUNCIONÁRIO.

delimiter $$

create function receitaTotalFuncionario(pCPF varchar(14))
returns decimal(10,2)  deterministic
begin
    declare total decimal(10,2);
    select SUM(srv.valor) into total
    from agendamento ag
    inner join servico srv on ag.Servico_idServico = srv.idServico
    where ag.Funcionario_CPF = pCPF;
    return total;
end $$

delimiter ;


-- 5. CALCULAR RECIETA TOTAL POR CLIENTE.

delimiter $$

create function receitaTotalCliente(pEmail varchar(45))
returns decimal(10,2)  deterministic
begin
    declare total decimal(10,2);
    select SUM(srv.valor) into total
    from agendamento ag
    inner join servico srv on ag.Servico_idServico = srv.idServico
	where ag.Cliente_email = pEmail;
    return total;
end $$

delimiter ;