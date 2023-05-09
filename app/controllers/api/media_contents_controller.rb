module Api
class MediaContentsController < ApplicationController
  before_action :set_media_content, only: %i[ show edit update destroy ]

  # GET /media_contents or /media_contents.json
  def index
    @media_contents = MediaContent.all
  end

  # GET /media_contents/1 or /media_contents/1.json
  def show
  end

  # GET /media_contents/new
  def new
    @media_content = MediaContent.new
  end

  # GET /media_contents/1/edit
  def edit
  end

  # POST /media_contents or /media_contents.json
  def create
    @media_content = MediaContent.new(media_content_params)

      if @media_content.save
       render 'api/media_contents/show', status: :created 
      else
         render json: @media_content.errors, status: :unprocessable_entity 
      end
    end
  end

  # PATCH/PUT /media_contents/1 or /media_contents/1.json
  def update
    respond_to do |format|
      if @media_content.update(media_content_params)
        render 'api/media_contents/show', status: :ok 
      else
        render json: @media_content.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /media_contents/1 or /media_contents/1.json
  def destroy
    @media_content.destroy

    render 'api/media_contents/show', status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_media_content
      @media_content = MediaContent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def media_content_params
      params.require(:media_content).permit(:name)
    end
end
end