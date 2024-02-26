CREATE TABLE userX 
( 
 user_code INT(11) PRIMARY KEY,
 user_name VARCHAR(100),  
 user_password VARCHAR(10),  
 user_level INT(11)
); 

CREATE TABLE products 
( 
 prod_code INT(11) PRIMARY KEY,  
 prod_name VARCHAR(100),  
 prod_value FLOAT,  
 prod_unid_med INT(11),  
 prod_cod_bar VARCHAR(13),  
 prod_dep INT(11),  
 prod_stock DECIMAL(15,4),  
 UNIQUE (prod_cod_bar)
); 

CREATE TABLE unid_med 
( 
 uni_code INT(11) PRIMARY KEY,  
 uni_name VARCHAR(100)
); 

CREATE TABLE sell_items 
( 
 isell_cod INT(11) PRIMARY KEY,  
 isell_value DECIMAL(15,4),  
 isell_discon DECIMAL(15,4),  
 isell_full DECIMAL(15,4),  
 isell_product INT(11),  
 isell_fk_sell INT(11)
); 

CREATE TABLE clientX 
( 
 cli_code INT(11) PRIMARY KEY,  
 cli_name VARCHAR(100),  
 cli_address VARCHAR(60),  
 cli_cpf DECIMAL(10,0),  
 cli_pho DECIMAL(10.0),  
 cli_neighborhood VARCHAR(60),  
 cli_numb_house VARCHAR(10),  
 cli_fk_city_code INT(11),
 UNIQUE (cli_cpf)
); 

CREATE TABLE city 
( 
 cit_code INT(11) PRIMARY KEY,  
 cit_name VARCHAR(100),  
 cit_fk_est INT(11)
); 

CREATE TABLE departments 
( 
 dep_cod INT(11) PRIMARY KEY,  
 dep_name VARCHAR(100) 
); 

CREATE TABLE sells 
( 
 sell_code INT(11) PRIMARY KEY,  
 sell_date DATE,  
 sell_full DECIMAL(15,4),  
 sell_client INT(11),  
 sell_stats TINYINT(1),
 sell_FK_client INT
); 

CREATE TABLE stats 
( 
 sts_stats INT(11) PRIMARY KEY,
 sts_name VARCHAR(100)
); 

CREATE TABLE receipt
(
  rec_code INT(11) PRIMARY KEY,
  rec_date DATE,
  rec_value DECIMAL(15,4),
  rec_fk_code_sell INT(11),
  rec_fk_code_payment INT(11)
);

CREATE TABLE payment
(
  pay_code INT(11) PRIMARY KEY,
  pay_name VARCHAR(30)
);