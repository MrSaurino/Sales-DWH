drop database ventasStage

create database ventasStage;

use ventasStage;

create table STG_categoria(categoriaID int not null,
                           nombre nvarchar(50),
						   SKcategoriaID int identity,
                           constraint categoriaPK primary key (categoriaID));
                           
create table STG_subcategoria(subcategoriaID int not null,
                              nombre nvarchar(50),
                              categoriaID int,
							  SKsubcategoriaID int identity,
                              constraint subcategoriaPK primary key (subcategoriaID),
                              constraint subcategoriafk1 foreign key (categoriaID) references STG_categoria(categoriaID));
 
create table STG_modelo(modeloID int not null,
                        nombre nvarchar(50),
						SKmodeloID int identity,
                        constraint modeloPK primary key (modeloID)); 
                         
create table STG_producto(productoID int not null,
                          nombre nvarchar(50),
                          NoProducto nvarchar(25),
                          color nvarchar(15),
                          costo money,
                          precio money,
                          subcategoriaID int,
                          modeloID int,
						  SKproductoID int identity,
						  SKcategoriaID int,
						  SKsubcategoriaID int,
						  SKmodeloID int,
                          constraint productoPK primary key (productoID),
                          constraint productofk1 foreign key (subcategoriaID) references STG_subcategoria(subcategoriaID),
                          constraint productofk2 foreign key (modeloID) references STG_modelo(modeloID));

 create table STG_territorio(territorioID int not null,
                            nombre nvarchar(50),
                            codigoPais nvarchar(3),
                            Grupo nvarchar(20),
							SKterritorioID int identity,
                            constraint territorioPK primary key (territorioID));                          
                       
create table STG_cliente(clienteID int not null,
                         nombre nvarchar(50),
						 SKclienteID int identity,
                         constraint clientePK primary key (clienteID));
                      
create table STG_vendedor(vendedorID int not null,
                          nombre nvarchar(50),
						  SKvendedorID int identity,
                          constraint vendedorPK primary key (vendedorID));

                        
 create table STG_fechas(fecha datetime not null,
                         año int,
                         mes int,
                         mesD nvarchar(10),
                         dia int,
                         semana int,
                         cuatrimestre int,
                         diaSemana nvarchar(10),
			 SKfecha int identity,
                         constraint fechasPK primary key (fecha)); 

create table STG_Orden (ordenID int,
                        fecha datetime,
                        clienteID int,
                        vendedorID int,
                        territorioID int,
                        subtotal money,
                        impuesto money,
                        total money,
						SKclienteID int,
						SKvendedorID int,
						SKterritorioID int,
						SKfecha int,
                        constraint OrdenPK primary key (OrdenID),
                        constraint Ordenfk1 foreign key (clienteID) references STG_cliente(clienteID),
                        constraint Ordenfk2 foreign key (vendedorID) references STG_vendedor(vendedorID),
                        constraint Ordenfk3 foreign key (territorioID) references STG_territorio(territorioID),
						constraint Ordenfk4 foreign key (fecha) references STG_fechas(fecha));
                        

create table STG_DetalleOrden (OrdenID int,
                               OrdenDetalleID int,
                               productoid int,
                               cantidad smallint,
                               preciounitario money,
                               totalVentas money,
							   SKVenta int identity,
							   SKproductoid int,
                               constraint Detalleordenpk primary key (ordenID,OrdenDetalleid),
                               constraint DetalleOrdenfk1 foreign key (ordenID) references STG_orden(ordenID),
                               constraint DetalleOrdenfk2 foreign key (productoID) references STG_producto(productoID));

