# scripts_MySql

historico_nome_coluna.sql
  - Registra em uma tabela de historico a coluna que foi realizado o Update, Insert ou Delete(conforme seletora na trigger),
      juntamente com id alterado,usuario, data/hora, coluna altrada, valor antigo e valor novo .
  - No meu caso tenho uma tabela com 226 colunas e selecionei 40 para que caso sofram Update seja registrado a alteração 
    (As informações que fazem o Update vêm de outra tabela que recebe um input 'load data infile' txt) 

input_txt.sql
  - Realiza Update dos registros da tabela que já estão na tabela_temp(que recebe o txt) e realiza em colunas específicas (40 do total de 226)
