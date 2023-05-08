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
      redirect_to director_url(@director), notice: t('application.crud_message.male.create_message_model', model: t('activerecord.modules.director.one'))
    else
      render :new, status: :unprocessable_entity
    end

  end
  
  def update
    if @director.update(director_params)
      redirect_to director_url(@director), notice: t('application.crud_message.male.update_message_model', model: t('activerecord.modules.director.one'))
    else
      render :edit, status: :unprocessable_entity 
    end
  end
  

  def destroy
    @director.destroy

    redirect_to directors_url, notice: t('application.crud_message.male.delete_message_model', model: t('activerecord.modules.director.one'))
  end

  private
    def set_director
      @director = Director.find(params[:id])
    end

    def director_params
      params.require(:director).permit(:first_name, :last_name)
    end
end