create database vendas;
use vendas;

create table cliente(
cod_cli int not null auto_increment,
nome_cli varchar(40) not null,
endereco varchar(40) null,
cidade varchar(20) null,
cep char(08) null,
uf char(02) null,
primary key (cod_cli)
);

insert into cliente(nome_cli, endereco, cidade, cep, uf) value ("Michael", "Bairro B", "Erechim", 98987121, "RS");
insert into cliente(nome_cli, endereco, cidade, cep, uf) value ("Maria", "Bairro C", "Erechim", 98987233, "RS");
insert into cliente(nome_cli, endereco, cidade, cep, uf) value ("Michael", "Bairro A", "Erechim", 98932121, "RS");

create table vendedor(
cod_vendedor int not null auto_increment,
nome_vendedor varchar(40) not null,
sal_fixo int not null,
faixa_comissao char(01) not null,
primary key (cod_vendedor)
);

create table produto(
cod_produto int not null auto_increment,
unid_produto char(03) not null,
desc_produto varchar(20) not null,
 val_unitario decimal not null,
primary key (cod_produto)  
);

insert into produto (unid_produto, desc_produto, val_unitario) value ("1", "Leite", 2.00);
insert into produto(unid_produto, desc_produto, val_unitario) value ("1", "Frangp", 20.00);
insert into produto(unid_produto, desc_produto, val_unitario) value ("1", "Água", 1.0);
 

create table pedido(
num_pedido int not null auto_increment,
prazo_entrega int not null,
primary key (num_pedido)
);

create table item_pedido(
descricao_pedido varchar(50) not null,
codigo_produto int not null,
qtd_pedido int not null
);

alter table vendedor add column sobrenome varchar(20) not null after sal_fixo;

alter table pedido add column descricao_resumida varchar(100);

alter table cliente add column teste1 varchar(20) first;

alter table cliente add column teste2 varchar(20);

alter table pedido rename to pedido_ifrs;

alter table produto rename to produto_ifrs;

alter table pedido_ifrs change column num_pedido numero_pedido int not null auto_increment;

alter table item_pedido change column qtd_pedido quantidade_pedido int not null;

alter table produto_ifrs modify column desc_produto varchar(100);

alter table cliente add column RG bigint(12) not null;

insert into cliente( nome_cli, RG) value ("José", 9085462465);

update cliente set RG = 150820 where RG = 9085462465;  

create table contas(
cod_contas int not null auto_increment primary key,
NF int not null,
cod_produto int NOT NULL,
CONSTRAINT produto_cod_produto_fk
FOREIGN KEY (cod_produto)
REFERENCES produto (cod_produto),
cod_cli int NOT NULL,
CONSTRAINT cliente_cod_cli_fk
FOREIGN KEY (cod_cli)
REFERENCES cliente (cod_cli),
Qtde int not null, 
valor decimal not null,
dia int(2) not null
); 

insert into contas(NF, cod_produto,cod_cli, Qtde,valor,dia) value (1, "001", "1", 8, 160.00, 5);
insert into contas(NF, cod_produto,cod_cli, Qtde,valor,dia) value( 1, "002", "1", 2, 34.00, 5); 
insert into contas(NF, cod_produto,cod_cli, Qtde,valor,dia) value( 1, "003", "1", 1, 58.00, 5);
insert into contas(NF, cod_produto,cod_cli, Qtde,valor,dia) value( 2, "002", "3", 20, 340.00,7);
insert into contas(NF, cod_produto,cod_cli, Qtde,valor,dia) value( 3, "001", "2", 12, 240.00, 8);
insert into contas(NF, cod_produto,cod_cli, Qtde,valor,dia) value( 3, "002", "2", 5, 85.00, 8);
insert into contas(NF, cod_produto,cod_cli, Qtde,valor,dia) value( 4, "001", "1", 2, 40.00 , 10);
insert into contas(NF, cod_produto,cod_cli, Qtde,valor,dia) value( 5, "003", "3", 4, 232.00, 15); 

select * from contas;  
select cod_cli from contas;  

alter table contas change column Qtde Quantidade int not null;

select cod_cli, cod_produto from contas;

select count(*) from contas;

select sum(valor) from contas;

select avg(valor) from contas;

select max(valor) from contas;

select min(valor) from contas where cod_cli="C1";

select cod_cli, avg(valor) from contas group by cod_cli  having avg(valor) >50; 

select cod_produto, valor, cod_cli, Quantidade from contas order by cod_produto asc, valor desc; 
 
select min(Quantidade) from contas;

select sum(Quantidade) from contas;

select * from contas; 

select cod_cli, min(Quantidade)  from contas ;

select cod_produto, max(valor) from contas;

select cliente.nome_cli, contas.valor from contas inner join cliente on contas.cod_cli = cliente.cod_cli where valor >200; 