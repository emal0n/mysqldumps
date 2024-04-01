CREATE TABLE alunos ( 
 alu_id              INT(11) PRIMARY KEY auto_increment,
 alu_nome            VARCHAR(100),  
 alu_cursofk         INT(11)                   ); 



CREATE TABLE materias ( 
 mat_id              INT(11) PRIMARY KEY auto_increment,  
 mat_nome            VARCHAR(100)               ); 



CREATE TABLE curso   ( 
 curs_id            INT(11) PRIMARY KEY auto_increment,  
 curs_nome          VARCHAR(100)                ); 
 
 
 CREATE TABLE nota   ( 
 not_id            INT(11) PRIMARY KEY auto_increment,  
 not_fk_materia    INT(11),               
 not_fk_aluno      INT(11),
 not_nota          INT(11),
 not_media         INT(11)                      ); 