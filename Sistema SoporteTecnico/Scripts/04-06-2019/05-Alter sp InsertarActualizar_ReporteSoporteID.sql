ALTER Procedure [dbo].[InsertarActualizar_ReporteSoporteID](
@ClienteID smallint,
@ColaboradorID smallint,
@FechaInforme datetime,
@FechaSolucion datetime,
@HoraReporte datetime,
@ReportadoPor varchar(30),
@Caso varchar(max),
@Solucion varchar(max),
@TemaPendiente varchar(max),
@HoraSolucion datetime,
@Solucionado bit,
@TemaPendienteCheck bit,
@CasoSolucion smallint
)as begin

Declare @ID smallint

	   set @ID = null
	    select top 1 @ID = ID +1
	    from ReporteSoporte order by ID desc
	    
	    set @ID = ISNULL(@ID,1)
	    
		Insert into ReporteSoporte
		  (ID,
			ClienteID,
			ColaboradorID,
			FechaInforme,
			FechaSolucion,
			HoraReporte,
			ReportadoPor,
			Caso,
			Solucion,
			TemaPendiente,
			HoraSolucion,
			Solucionado,
			TemaPendienteCheck,
			CasoSolucionID)
		values
		 (@ID,
			@ClienteID,
			@ColaboradorID,
			@FechaInforme,
			@FechaSolucion,
			@HoraReporte,
			@ReportadoPor,
			@Caso,
			@Solucion,
			@TemaPendiente,
			@HoraSolucion,
			@Solucionado,
			@TemaPendienteCheck,
			@CasoSolucion)
		
	
	Select @ID [ID]

end
