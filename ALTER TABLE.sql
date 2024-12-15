ALTER TABLE agendamento DROP FOREIGN KEY fk_Agendamento_Servico1;


ALTER TABLE Servico MODIFY COLUMN idServico INT AUTO_INCREMENT;


ALTER TABLE agendamento ADD CONSTRAINT fk_Agendamento_Servico FOREIGN KEY (idServico) REFERENCES Servico(idServico);



ALTER TABLE agendamento ADD CONSTRAINT fk_Agendamento_Servico1 FOREIGN KEY (Servico_idServico) REFERENCES Servico(idServico);



ALTER TABLE agendamento DROP FOREIGN KEY fk_Agendamento_Servico1;


ALTER TABLE agendamento ADD CONSTRAINT fk_Agendamento_Servico1 FOREIGN KEY (Servico_idServico) REFERENCES Servico(idServico) ON DELETE CASCADE;