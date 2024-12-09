-- 6 TRRIGGER


-- 1. TRIGGER PARA ATUALIZAR O VALOR TOTAL DE UM AGENDAMENTO APÓS A INSERÇÃO DE UM AGENDAMENTO.

delimiter $$

create trigger trg_aft_insert_formapag after insert
on FormaPag
for each row
begin
    update Agendamento
    set valorTotal = valorTotal + new.valor
    where idAgendamento = new.Agendamento_idAgendamento;
end $$

delimiter ;


-- 2. TRIGGER PARAA ATUALIZAR O ESTOQUE DE UM SERVIÇO APÓS A INSERÇÃO DE UM AGENDAMENTO.

delimiter $$

create trigger trg_aft_insert_agendamento after insert
on Agendamento
for each row
begin
    update Servico
    set quantidade = quantidade - 1
    where idServico = new.Servico_idServico;
end $$

delimiter ;


-- 3. TRIGGER PARA IMPEDIR A EXCLUSÃO DE UM CLIENTE COM AGENDAMENTO ASSOCIADOS.

delimiter $$

create trigger trg_bef_delete_cliente before delete
on Cliente
for each row
begin
    if exists (select 1 from Agendamento where Cliente_email = old.email) then
        signal sqlstate '45000' set message_text = 'Não é possível excluir cliente com agendamentos associados';
    end if;
end $$

delimiter ;


-- 4. TRIGGER PARA ATUALIZAR O STATUS DE UM AGENDAMENTO APÓS A CONCLUSÃO.alter

delimiter $$

create trigger trg_aft_update_agendamento after update
on Agendamento
for each row
begin
    if new.status = 'Concluído' then
        update Agendamento
        set dataConclusao = now()
        where idAgendamento = new.idAgendamento;
    end if;
end $$

delimiter ;


-- 5. TRIGGER PARA IMPEDIR A INSERÇÃO DE UM AGENDAMENTO EM UM HORÁRIO JÁ OCUPADO PELO MESMO FUNCIONÁRIO.

delimiter $$

create trigger trg_bef_insert_agendamento before insert
on Agendamento
for each row
begin
    if exists (
        select 1 from Agendamento
        where Funcionario_CPF = new.Funcionario_CPF
        and data = new.data
        and hora = new.hora
    ) then
        signal sqlstate '45000' set message_text = 'O funcionário já tem um agendamento neste horário';
    end if;
end $$

delimiter ;


-- 6. TRIGGER PRARA IMPEDIR A INSERÇÃO DE UM CLIENTE COM UM E-MAIL JÁ EXISTENTE.

delimiter $$

create trigger trg_bef_insert_cliente before insert
on Cliente
for each row
begin
    if exists (select 1 from Cliente where email = new.email) then
        signal sqlstate '45000' set message_text = 'O e-mail já está cadastrado para outro cliente';
    end if;
end $$

delimiter ;

