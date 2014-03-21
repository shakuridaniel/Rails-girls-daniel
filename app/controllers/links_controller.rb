class LinksController < ApplicationController

  def index
    @links = Link.all
    render 'index'
  end

  def show
    @link = Link.find(params[:id])
    render 'show'
  end

  def new
    @link = Link.new
    render 'new'
  end

  def edit
    @link = Link.find(params[:id])
    render 'edit'
  end

  def create
    @link = Link.new(link_params)

    if @link.save
      redirect_to @link, notice: 'Link was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      redirect_to @link, notice: 'Link was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to links_url, notice: 'Link was successfully destroyed.'
  end

  private
  # Only allow a trusted parameter "white list" through.
  def link_params
    params.require(:link).permit(:title, :description, :url)
  end

end
