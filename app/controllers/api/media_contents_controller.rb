module Api
class MediaContentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_media_content, only: %i[ show edit update destroy ]

  def index
    @media_contents = MediaContent.all
  end

  def show; end

  def new
    @media_content = MediaContent.new
  end

  def edit; end

  def create
    @media_content = MediaContent.new(media_content_params)

    if @media_content.save
      render 'api/media_contents/show', status: :created
    else
      errors = validate
      render json: errors, status: :unprocessable_entity 
    end
  end

  def update
    if @media_content.update(media_content_params)
      render 'api/media_contents/show', status: :ok
    else
      errors = validate
      render json: errors, status: :unprocessable_entity
    end
  end

  def destroy
    @media_content.destroy

    render 'api/media_contents/index', status: :ok
  end

  private
    def set_media_content
      @media_content = MediaContent.find(params[:id])
    end

    def media_content_params
      params.require(:media_content).permit(:name, :director_id)
    end

    def validate
      errors = {}
    
      if @media_content.name.blank?
        errors[:name] = t('activerecord.errors.blank', model: t('activerecord.attributes.media_content.name'))
      end
      if !Director.exists?(@media_content.director_id)
        errors[:director_id] = t('activerecord.errors.required_error_model', model: t('activerecord.attributes.media_content.director_id'))
      end
      return errors
    end
    
end
end
