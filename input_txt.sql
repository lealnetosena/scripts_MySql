DROP PROCEDURE if exists tabela_temp_atualizar;

DELIMITER $

CREATE PROCEDURE  tabela_temp_atualizar()
BEGIN


DECLARE counter INT DEFAULT 1;
DECLARE counter_fim INT;
DECLARE campo varchar(40);
SET counter_fim = 157;


	WHILE counter <= counter_fim DO

		set @ordinal_position = (SUBSTRING(concat('026;029;027;073;031;033;070;034;067;068;065;074;032;069;',
			'066;101;075;100;072;090;099;071;102;103;008;015;064;098;223;224;',
			'225;226;194;192;119;193;105;106;107;208'), counter, 3));

		SET @campo = (select COLUMN_NAME from information_schema.COLUMNS 
						where table_name = "tabela" and ordinal_position = @ordinal_position);			


			set @temp = CONCAT('temp.',campo);

			set @tb = concat('tb.',campo);

			SET @select_ = CONCAT(	
					'UPDATE tabela tb
					INNER JOIN tabela_temp temp
					ON tb.chave_bd_tabela_temp = temp.chave_bd_tabela_temp
					SET ',
					@tb,
					' = ',
					@temp,
					' Where ',
					@temp,
					' != ',
					@tb,
					' AND (tb.dt_ret LIKE "%99999%" or tb.dt_ret LIKE "202004%" or  tb.dt_ret LIKE "202003%")');

			PREPARE query_dinamic FROM @select_;

			EXECUTE query_dinamic;

			

			SET counter = counter + 4;
		


	END WHILE;



END$

DELIMITER ;
