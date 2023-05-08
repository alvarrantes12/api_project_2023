module Api 
 class MidiaContentsController < ApplicationController
  skip_before_action :verify_authenticity_token  
  before_action :set_midia_content, only: %i[ show edit update destroy ]

   def index
    @midia_contents = MidiaContent.all
   end

   def show; end

   def new
    @midia_content = MidiaContent.new
   end

   def edit; end

   def create
     @midia_content = MidiaContent.new(midia_content_params)

       if @midia_content.save
         render 'api/midia_contents/show', status: :created
       else
          render json: @midia_content.errors, status: :unprocessable_entity 
       end
   end

   def update
     if @midia_content.update(midia_content_params)
       render 'api/midia_contents/show', status: :ok
     else
       render json: @midia_content.errors, status: :unprocessable_entity 
     end
   end

   def destroy
     @midia_content.destroy

      render 'api/midia_content/show', status: :ok
   end

   private
     def set_midia_content
       @midia_content = MidiaContent.find(params[:id])
     end

     def midia_content_params
       params.require(:midia_content).permit(:name, :director_id)
     end
 end
end
