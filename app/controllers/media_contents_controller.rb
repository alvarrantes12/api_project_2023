class MediaContentsController < ApplicationController
  before_action :set_media_content, only: %i[ show edit update destroy ]

  def index
    @media_contents = MediaContent.all
  end

  def show
  end

  def new
    @media_content = MediaContent.new
  end

  def edit
  end

  def create
    @media_content = MediaContent.new(media_content_params)
      if @media_content.save
        render 'api/media_content/show', status: :create
      else
        render json:@media_content.erorrs, status: :unprocessable_entity
      end
    end
  end

  def update
      if @media_content.update(media_content_params)
        render 'api/media_content/show', status: :ok
      else
        render json:@media_content.erorrs, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @media_content.destroy

      render 'api/media_contents/index', status: ok
    end
  end

  private
    def set_media_content
      @media_content = MediaContent.find(params[:id])
    end

    def media_content_params
      params.require(:media_content).permit(:name, :director_id)
    end
end
