drop database ventasDWH;

create database ventasDWH;

use ventasDWH;

create table DIM_territorio(SKterritorioID int not null,
                            territorioID int not null,
                            nombre nvarchar(50),
                            codigoPais nvarchar(3),
                            Grupo nvarchar(20),
                            constraint territorioPK primary key (SKterritorioID));
                        
create table DIM_cliente(SKclienteID int not null,
                         clienteID int not null,
                         nombre nvarchar(50),                 
                         constraint clientePK primary key (SKclienteID));
                      
 
create table DIM_categoria(SKcategoriaID int not null,
                           categoriaID int not null,
                           nombre nvarchar(50),
                           constraint categoriaPK primary key (SKcategoriaID));
                       
      
create table DIM_subcategoria(SKsubcategoriaID int not null,
                              subcategoriaID int not null,
                              nombre nvarchar(50),
                              constraint subcategoriaPK primary key (SKsubcategoriaID));   

create table DIM_modelo(SKmodeloID int not null,
                        modeloID int not null,
                        nombre nvarchar(50),
                        constraint modeloPK primary key (SKmodeloID));          
  
create table DIM_producto(SKproductoID int not null,
                          productoID int not null,
                          nombre nvarchar(50),
                          color nvarchar(15),
                          constraint productoPK primary key (SKproductoID));

create table DIM_vendedor(SKvendedorID int not null,
                          vendedorID int not null,
                          nombre nvarchar(50),
                          constraint vendedorPK primary key (SKvendedorID));
                   
 create table DIM_fecha(SKfecha int not null,
                        fecha datetime not null,
                        año int,
                        mes int,
                        mesD nvarchar(10),
                        dia int,
                        semana int,
                        cuatrimestre int,
                        diaSemana nvarchar(10),
                        constraint DIM_fechaPK primary key (SKfecha)); 

create table FACT_Ventas (SKVenta int identity not null,
                          ordenID int not null,
                          detalleid int not null,
                          cantidad smallint,
                          costounitario money,
                          preciounitario money,
                          descuento money,
                          totalVentas money,
                          costoVentas money,
                          utilidad money,
                          SKfecha int,
                          SKproductoid int,
                          SKcategoriaID int,
                          SKsubcategoriaID int,
                          SKmodeloID int,
                          SKclienteID int,
                          SKvendedorID int,
                          SKterritorioID int,
                          constraint FACT_Ventaspk primary key (SKVenta),
                          constraint FACT_Ventasfk1 foreign key (SKproductoid) references DIM_producto(SKproductoid),
                          constraint FACT_Ventasfk2 foreign key (SKsubcategoriaID) references DIM_subcategoria(SKsubcategoriaID),
                          constraint FACT_Ventasfk3 foreign key (SKcategoriaID) references DIM_categoria(SKcategoriaID),
                          constraint FACT_Ventasfk4 foreign key (SKclienteID) references DIM_Cliente(SKclienteID),
                          constraint FACT_Ventasfk5 foreign key (SKvendedorID) references DIM_vendedor(SKvendedorID),
                          constraint FACT_Ventasfk6 foreign key (SKterritorioID) references DIM_territorio(SKterritorioID),
                          constraint FACT_Ventasfk7 foreign key (SKfecha) references DIM_fecha(SKfecha),
                          constraint FACT_Ventasfk8 foreign key (SKmodeloID) references DIM_modelo(SKmodeloId));

 
     
