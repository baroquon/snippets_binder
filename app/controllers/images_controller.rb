class ImagesController < ApplicationController
  before_filter :load_new_image, :only => [:new, :create]
  before_filter :load_image, :only => [:show, :edit, :update, :destroy]

  protected
  def load_new_image
    @image = Image.new(params[:image])
  end

  def load_image
    @image = Image.find(params[:id])
  end

  public
  def new
  end

  def create
    if @image.save
      flash[:notice] = "Image created successfully."
      redirect_to image_path(@image)
    else
      flash.now[:error] = "There was a problem saving the image."
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @image.update_attributes(params[:image])
      flash[:notice] = "The image was successfully edited."
      redirect_to :action => 'show', :id => @image
    end
  end

  def destroy
    if @image.destroy
      flash[:notice] = "The image was deleted."
      redirect_to '/'
    else
      flash.now[:error] = "There was a problem deleting the image, dummy."
      render :action => 'show'
    end
  end

  def show
  end
end