class DocumentsController < ApplicationController
	before_action :authenticate_user!

	def index
		@documents = Document.all
		#@documents = current_user.documents
	end

	def new
		@document = Document.new
	end

	def create
		@document = Document.new(document_params)
		@document.user = current_user
		if @document.save
			redirect_to @document
		else
			render 'new'
		end
	end

	def show
		@document = Document.find(params[:id])
	end

	def search
	end

	def destroy
		@document = Document.find(params[:id])
		@document.destroy
		redirect_to documents_path
	end

	private
		def document_params
			params.require(:document).permit(:title, :file, :owner_id)
		end
end
