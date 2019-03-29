class SolicitudesController < ApplicationController

	# Agrupa el formulario para crear solicitudes y la lista de registros
	def index
		@solicitud = Solicitud.new
		@solicitudes = Solicitud.all
		@comment = Comment.new
	end

	# Crear registro
	def create
		@solicitud = Solicitud.new(solicitud_params)
		if @solicitud.save
			flash[:notice] = 'Información de solicitud registrada satisfactoriamente'
			redirect_to solicitudes_path
		else
			flash[:alert] = 'No se pudo procesar su solicitud'
			render :index
		end		
	end

	# Ordenar según opciones
	def search
		case params[:order]
		when '1'
			@solicitudes = Solicitud.by_valor
		when '2'
			@solicitudes = Solicitud.by_titulo
		else
			@solicitudes = Solicitud.all
		end 
		render partial: "lista"
	end

	# Módulo para incrementar valoraciones positivas y negativas de una solicitud
	def valorar
		solicitud = Solicitud.where("id = ?",params[:solicitud_id]).first

		if !solicitud.nil?
			case params[:valor]
			when 'like'
				solicitud.increment(:positivo, by = 1)
			when 'unlike'
				solicitud.increment(:negativo, by = 1)
			end
			solicitud.save	
			flash[:notice] = 'Información de solicitud actualizada satisfactoriamente'
		else
			flash[:alert] = 'No se pudo actualizar la solicitud'  
		end
		redirect_to solicitudes_path
	end

	def solicitud_params
		params[:solicitud].permit(:titulo, :descripcion) if !params[:solicitud].nil?
	end
end
