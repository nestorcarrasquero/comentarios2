class CommentsController < ApplicationController
	before_action :get_solicitud, only: [:new, :create]
	before_action :get_comments, only: [:new]

	# Nuevo registro de comentarios vinculados a solicitud
	def new
		@comment = Comment.new		
	end

	# Módulo para crear registro
	def create
        @comment = Comment.new(comment_params)
        if @comment.save
        	flash[:notice] = 'Comentario vinculado satisfactoriamente'
        	get_comments
			respond_to do |format|
        		format.js
    		end
        else
        	flash[:alert] = 'Comentario no pudo ser agregado'
        	render :new
        end
	end

	# Lista de comentarios
	def get_comments
		@comments = Comment.where("solicitud_id = ?", @solicitud)
	end

	def comment_params
		params[:comment].permit(:descripcion, :solicitud_id) if !params[:comment].nil?
	end

	def get_solicitud
		@solicitud = Solicitud.where("id = ?", params[:solicitud_id]).first
	end
end
