class Admin::ImagesController < Admin::BaseController

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:notice] = "Image created!"
      redirect_to admin_image_path(@image)
    else
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
    @ideas = @image.ideas.all
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update_attributes(image_params)
      flash[:notice] = "Image updated!"
      redirect_to admin_image_path(@image)
    else
      render :edit
    end
  end

  def destroy
    image = Image.find(params[:id])
    image.destroy
    flash[:notice] = "Image deleted!"
    redirect_to admin_images_path
  end


  private
  def image_params
    params.require(:image).permit(:name, :url)
  end
end
