class DirectorsController < ApplicationController
  before_action :set_director, only: %i[ show edit update destroy ]

  def index
    @directors = Director.all
  end

  def show; end

  def new
    @director = Director.new
  end

  def edit; end

  def create
    @director = Director.new(director_params)

    if @director.save
      redirect_to director_url(@director), notice: t('application.create_message', model: t('activerecord.modules.director.one'))
    else
      @errors = validate
      render :new, status: :unprocessable_entity
    end
  end
  
  def update
    if @director.update(director_params)
      redirect_to director_url(@director), notice: t('application.update_message', model: t('activerecord.modules.director.one'))
    else
      @errors = validate
      render :edit, status: :unprocessable_entity 
    end
  end
  

  def destroy
    @director.destroy

    redirect_to directors_url, notice: t('application.delete_message', model: t('activerecord.modules.director.one')) 
  end

  private
    def set_director
      @director = Director.find(params[:id])
    end

    def director_params
      params.require(:director).permit(:first_name, :last_name)
    end

    def validate
      errors = []
  
      [:first_name, :last_name].each do |attribute|
        if @director.send(attribute).blank?
          errors.push(t('activerecord.errors.required_error_model', model: t("activerecord.attributes.director.#{attribute}")))
        elsif @director.send(attribute).length < 3
          errors.push(t('activerecord.errors.minimum_long_error_model', model: t("activerecord.attributes.director.#{attribute}")))
        elsif @director.send(attribute).length > 10 && @director.send(attribute) ==  @director.last_name
          errors.push(t('activerecord.errors.maximum_long_error_model', model: t("activerecord.attributes.director.#{attribute}")))
        end
      end
      return errors
    end
end
