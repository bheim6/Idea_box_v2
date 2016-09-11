class IdeasController < ApplicationController
before_action :set_idea, only: [:show, :edit, :update]

  def index
    if current_user
      @ideas = current_user.ideas
    else
      @ideas = []
    end
  end

  def new
    @idea = Idea.new
    @categories = Category.all
  end

  def create
    @idea = current_user.ideas.new(idea_params)
    if @idea.save(idea_params)
      flash[:notice] = "Idea was created!"
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end

  def show
  end

  def edit
    @categories = Category.all
  end

  def update
    if @idea.update_attributes(idea_params)
      flash[:notice] = "Idea was updated!"
      redirect_to idea_path(@idea)
    else
      render :edit
    end
  end

  def destroy
    idea = Idea.find(params[:id])
    idea.destroy
    flash[:notice] = "Idea was destroyed!"
    redirect_to ideas_path
  end


  private
  def idea_params
    params.require(:idea).permit(:name, :category_id)
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end
end
