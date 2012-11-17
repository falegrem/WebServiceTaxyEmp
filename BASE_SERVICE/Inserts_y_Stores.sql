INSERT INTO dbo.TB_empresa values (1,'Backus','56565656562')
INSERT INTO dbo.TB_empresa values (2,'AFP Integra','59165650062')
INSERT INTO dbo.TB_empresa values (3,'Americatel','11565676560')
GO

INSERT INTO dbo.TB_user Values(1,1,'Jose Luir Carranza','56895623')
INSERT INTO dbo.TB_user values(2,1,'Juan Carlos Bazalar','56895654')
INSERT INTO dbo.TB_user values(3,1,'Antonio Cartagena','57795644')
INSERT INTO dbo.TB_user values(4,1,'Tony VEGA','57795123')
INSERT INTO dbo.TB_user values(5,1,'Sandro Baylon','57193123')
INSERT INTO dbo.TB_user values(6,2,'Will Smith','51195123')
INSERT INTO dbo.TB_user values(7,2,'Cesar Cueto','87190123')
INSERT INTO dbo.TB_user values(8,2,'Ariel Ortega','32190123')
INSERT INTO dbo.TB_user values(9,2,'Eddie Santiago','32177123')
INSERT INTO dbo.TB_user values(10,3,'Tommy Olivencia','32990120')
INSERT INTO dbo.TB_user values(11,3,'Zack Morris','32195483')
INSERT INTO dbo.TB_user values(12,3,'Tresor Moreno','99195485')
INSERT INTO dbo.TB_user values(13,3,'abc','11111')
GO

INSERT INTO dbo.TB_ruta values(1,'Grau - Lima','Los Angeles - Chosica',28.00,'S','S')
INSERT INTO dbo.TB_ruta values(2,'Plaza San Miguel','Matelini - Chorrillos',25.00,'S','S')
INSERT INTO dbo.TB_ruta values(3,'Minka - Callao','Kenedy - Miraflores',32.00,'S','S')
INSERT INTO dbo.TB_ruta values(4,'Zarate - SJL','Pershing - Jesus Maria',28.00,'S','S')
INSERT INTO dbo.TB_ruta values(5,'Jose Leal - Lince','Pardo Miraflores',14.00,'S','S')
INSERT INTO dbo.TB_ruta values(6,'Sinchi Roca - Comas','Metro Colonia - Cercado Lima',24.00,'S','S')
GO

INSERT INTO dbo.TB_servicio values(1,3,'12/02/2011')
INSERT INTO dbo.TB_servicio values(2,6,'23/12/2011')
INSERT INTO dbo.TB_servicio values(3,1,'14/05/2011')
INSERT INTO dbo.TB_servicio values(4,2,'14/05/2011')
INSERT INTO dbo.TB_servicio values(5,4,'20/05/2011')
INSERT INTO dbo.TB_servicio values(6,3,'22/07/2011')
INSERT INTO dbo.TB_servicio values(7,5,'22/07/2011')
INSERT INTO dbo.TB_servicio values(8,5,'22/07/2011')
INSERT INTO dbo.TB_servicio values(9,2,'22/07/2011')
INSERT INTO dbo.TB_servicio values(10,2,'22/07/2011')
INSERT INTO dbo.TB_servicio values(11,4,'22/07/2011')
INSERT INTO dbo.TB_servicio values(12,6,'22/07/2011')
GO

INSERT INTO dbo.TB_reserva values(1,1,1,'02/01/2012',32.00,'ATENDIDO')
INSERT INTO dbo.TB_reserva values(2,3,2,'02/01/2010',24.00,'REGISTRADO')
INSERT INTO dbo.TB_reserva values(3,5,3,'01/01/2012',28.00,'ATENDIDO')
INSERT INTO dbo.TB_reserva values(4,10,4,'02/01/2012',25.00,'ENVIADO')
INSERT INTO dbo.TB_reserva values(5,2,5,'03/01/2010',28.00,'ATENDIDO')
INSERT INTO dbo.TB_reserva values(6,5,6,'02/04/2010',32.00,'REGISTRADO')
INSERT INTO dbo.TB_reserva values(7,7,7,'12/06/2010',14.00,'ENVIADO')
INSERT INTO dbo.TB_reserva values(8,9,8,'12/06/2011',14.00,'ENVIADO')
INSERT INTO dbo.TB_reserva values(9,2,9,'01/01/2012',25.00,'ATENDIDO')
INSERT INTO dbo.TB_reserva values(10,3,10,'01/01/2012',25.00,'REGISTRADO')
GO

select * from dbo.TB_user
select * from dbo.TB_empresa
select * from dbo.TB_ruta
select * from dbo.TB_servicio
select * from dbo.TB_reserva
GO


/******************************************************************
* STORES
******************************************************************/

CREATE PROCEDURE SP_ConsultarServicioRutaDisponiblePorDia @fecha datetime
AS
BEGIN
	
SELECT ts.cod_servicio, tr.des_ruta_ini, tr.des_ruta_fin, tr.costo_ruta, ts.fec_servicio
  FROM TB_servicio ts
INNER JOIN TB_ruta tr ON tr.cod_ruta = ts.cod_ruta
WHERE ts.fec_servicio = @fecha
ORDER BY tr.des_ruta_ini, tr.des_ruta_fin

END
GO
--EXEC SP_ConsultarServicioRutaDisponiblePorDia '22/07/2011'

/*************************************************************
* SP_ReservarServicioRuta
*************************************************************/

CREATE PROCEDURE SP_ReservarServicioRuta @cod_user int, @cod_servicio int
AS
BEGIN
	
DECLARE @max_id INT
SELECT @max_id = MAX(cod_reserva) FROM TB_reserva
--SELECT @max_id

INSERT INTO dbo.TB_reserva values(@max_id + 1, @cod_user, @cod_servicio, GETDATE(),
(SELECT TB_ruta.costo_ruta FROM TB_ruta
INNER JOIN TB_servicio ts ON ts.cod_ruta = TB_ruta.cod_ruta
WHERE ts.cod_servicio = @cod_servicio),
'REGISTRADO')

END
GO
--EXEC SP_ReservarServicioRuta 3,10

/***************************************************************
* SP_ConsultarReservasRegistradas
***************************************************************/

CREATE PROCEDURE SP_ConsultarReservasRegistradasPorUsuario @cod_user int
AS
BEGIN
	
SELECT tr.cod_reserva, tr.cod_user, ts.cod_servicio, tr.fec_reserva, tr.costo_ruta, tr.est_reserva,
tu.nombre_user, tr2.des_ruta_ini, tr2.des_ruta_fin, ts.fec_servicio
       
FROM TB_reserva tr
INNER JOIN TB_servicio ts ON ts.cod_servicio = tr.cod_servicio
INNER JOIN TB_user tu ON tu.cod_user = tr.cod_user
INNER JOIN TB_ruta tr2 ON tr2.cod_ruta = ts.cod_ruta
WHERE tr.est_reserva = 'REGISTRADO'
AND tu.cod_user = @cod_user

END
GO
--EXEC SP_ConsultarReservasRegistradasPorUsuario 3

/*******************************************************************
* SP_CancelarReservaRuta
*******************************************************************/

CREATE PROCEDURE SP_CancelarReservaRuta @cod_reserva int
AS
BEGIN

UPDATE TB_reserva
SET est_reserva = 'CANCELADO'
WHERE cod_reserva = @cod_reserva

END
GO
--EXEC SP_CancelarReservaRuta 8


