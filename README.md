# BancoDeDADOS-SALAO-SENAC
Durante o meu 2º período na faculdade Senac, no curso de Análise e Desenvolvimento de Sistemas, enfrentei o desafio de desenvolver um projeto de banco de dados. Este projeto fazia parte de uma iniciativa maior, que incluía tanto o desenvolvimento de back-end quanto de front-end, para criar um site para o salão do Senac.

# Sistema de Gestão de Salão de Beleza

## Descrição
Este projeto é um sistema de gestão para um salão de beleza, permitindo o gerenciamento de clientes, funcionários, agendamentos, serviços, pagamentos e endereços.

## Estrutura do Banco de Dados
O banco de dados `salaoSenac` contém as seguintes tabelas:
- **Cliente**
- **Funcionario**
- **Telefone**
- **EnderecoCli**
- **EnderecoFunc**
- **Servico**
- **Agendamento**
- **FormaPag**

## Funcionalidades
- **Cadastrar Novo Cliente**
- **Atualizar Salário do Funcionário**
- **Deletar Cliente**
- **Registrar Novo Agendamento**
- **Atualizar Status do Agendamento**
- **Calcular Desconto**
- **Calcular Total de Serviços por Cliente**
- **Calcular Total de Serviços por Funcionário**
- **Calcular Receita Total por Funcionário**
- **Calcular Receita Total por Cliente**

## Triggers
- Atualizar o valor total de um agendamento após a inserção de um pagamento.
- Atualizar o estoque de um serviço após a inserção de um agendamento.
- Registrar a data de atualização de um cliente.
- Impedir a exclusão de um cliente com agendamentos associados.
- Atualizar o status de um agendamento após a conclusão.
- Impedir a inserção de um cliente com um e-mail já existente.
- Registrar a data de modificação de um funcionário.
- Impedir a inserção de um agendamento em um horário já ocupado pelo mesmo funcionário.

## Autor
- Edson de Santana Alves - edsonsantana1

