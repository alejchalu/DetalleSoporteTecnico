ALTER Procedure [dbo].[InsertarActualizar_Colaboradores](
@Accion varchar(15), 
@ID smallint,
@Nombre varchar(100), 
@Predeterminado bit, 
@Activo bit,
@IdEquipo smallint
)as begin

	if @Accion = 'Insertar' begin
	   set @ID = null
	    select top 1 @ID = ID +1
	    from Colaboradores order by ID desc
	    
	    set @ID = ISNULL(@ID,1)
	    
		Insert into Colaboradores
		  (ID,Nombre,Predeterminado,Activo,IdEquipo)
		values
				(@ID,@Nombre,@Predeterminado,@Activo,@IdEquipo)
		
	end
	if @Accion = 'Actualizar' begin 
	
		update Colaboradores
		set Nombre = @Nombre,
			Predeterminado = @Predeterminado,
			Activo = @Activo,
			IdEquipo = @IdEquipo			
	    where ID = @ID
	    
	end

end
