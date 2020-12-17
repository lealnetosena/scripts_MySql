create table historico(
	id_historico int auto_increment primary key,
	id_campos_ri int,
	usuario varchar(50),
	data_alteracao datetime,
	campo_alterado varchar(50),
	valor_antigo varchar(50),
	valor_novo varchar(50)
);



DROP TRIGGER if exists historico_nome_da_coluna;

DELIMITER $

create trigger historico_nome_da_coluna 
AFTER UPDATE ON tabela
FOR EACH ROW
BEGIN	
	SET @valor_old =
	(case 
		WHEN NEW.coluna1 != OLD.coluna1 THEN NEW.coluna1
		WHEN NEW.coluna2 != OLD.coluna2 THEN NEW.coluna2
		WHEN NEW.coluna3 != OLD.coluna3 THEN NEW.coluna3
		WHEN NEW.coluna4 != OLD.coluna4 THEN NEW.coluna4
		WHEN NEW.coluna5 != OLD.coluna5 THEN NEW.coluna5
		WHEN NEW.coluna6 != OLD.coluna6 THEN NEW.coluna6
		WHEN NEW.coluna7 != OLD.coluna7 THEN NEW.coluna7
	END);

	SET @valor_new =
	(case 
		WHEN NEW.coluna1 != OLD.coluna1 THEN OLD.coluna1
		WHEN NEW.coluna2 != OLD.coluna2 THEN OLD.coluna2
		WHEN NEW.coluna3 != OLD.coluna3 THEN OLD.coluna3
		WHEN NEW.coluna4 != OLD.coluna4 THEN OLD.coluna4
		WHEN NEW.coluna5 != OLD.coluna5 THEN OLD.coluna5
		WHEN NEW.coluna6 != OLD.coluna6 THEN OLD.coluna6
		WHEN NEW.coluna7 != OLD.coluna7 THEN OLD.coluna7	
	END);

	SET @campo =
	(case 
		WHEN NEW.coluna1 != OLD.coluna1 THEN 'coluna1'
		WHEN NEW.coluna2 != OLD.coluna2 THEN 'coluna2'
		WHEN NEW.coluna3 != OLD.coluna3 THEN 'coluna3'
		WHEN NEW.coluna4 != OLD.coluna4 THEN 'coluna4'
		WHEN NEW.coluna5 != OLD.coluna5 THEN 'coluna5'
		WHEN NEW.coluna6 != OLD.coluna6 THEN 'coluna6'
		WHEN NEW.coluna7 != OLD.coluna7 THEN 'coluna7'
	END);

	insert into historico values(null, OLD.id_tabela, CURRENT_USER(), now(), @campo, @valor_old, @valor_new);

END$

DELIMITER ;
