ALTER procedure [dbo].[EliminarInsertar_Configuracion](
@SMTP varchar(100),
@ContraseñaSMTP  varchar(100),
@UsuarioSMTP varchar(100),
@Puerto smallint,
@SSL bit,
@CorreoDe varchar(100),
@Asunto varchar(100),
@Cuerpo varchar(max),
@CopiaCorreos varchar(100),
@RutaArchivo varchar(max)
)
as begin

	delete from Configuracion

	declare @ID smallint
	select top 1 @ID = ID +1
	    from Configuracion order by ID desc
	    
	    set @ID = ISNULL(@ID,1)
		  
	insert into Configuracion(ID,SMTP,ContraseñaSMTP,UsuarioSMTP,Puerto,
									  SSL,CorreoDe,Asunto,Cuerpo,CopiaCorreos,RutaArchivo) 
				values (@ID,@SMTP,@ContraseñaSMTP,@UsuarioSMTP,@Puerto,
									  @SSL,@CorreoDe,@Asunto,@Cuerpo,@CopiaCorreos,@RutaArchivo)
		  
	

end