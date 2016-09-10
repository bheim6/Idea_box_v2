class IdeasController < ApplicationController
before_action :set_idea, only: [:show, :edit, :update]

  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save(idea_params)
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @idea.update_attributes(idea_params)
      redirect_to idea_path(@idea)
    else
      render :edit
    end
  end

  def destroy
    idea = Idea.find(params[:id])
    idea.destroy
    redirect_to ideas_path
  end


  private
  def idea_params
    params.require(:idea).permit(:name)
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end
end
