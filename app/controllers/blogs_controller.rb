class BlogsController < ApplicationController
  before_action :load_object, only: [:new, :edit, :show]
  def index
    @posts = Blog.all
  end

  def edit
  end

  def new
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to @blog
    else
      render :edit
    end
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to @blog
    else
      render :new
    end
  end

  private

  def load_object
    @blog = Blog.find_by(id: params[:id]) || Blog.new  
  end

  def blog_params
    params.require(:blog).permit(Blog::UPDATEABLE_ATTRS)
  end
end