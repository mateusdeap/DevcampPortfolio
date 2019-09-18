class BlogsController < ApplicationController
  before_action :set_blog, only: [
    :show,
    :edit,
    :update,
    :destroy,
    :toggle_status
  ]

  def index
    @blogs = Blog.all
    @page_title = "My Portfolio Blog"
  end

  def show
    @page_title = @blog.title
    @seo_keywords = @blog.body
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html do
          redirect_to @blog, notice: 'Blog was successfully created.'
        end
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html do 
          redirect_to @blog, notice: 'Blog was successfully updated.'
        end
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html do
        redirect_to blogs_url, notice: 'Blog was successfully destroyed.'
      end
    end
  end

  def toggle_status
    if @blog.published?
      @blog.draft!
    elsif @blog.draft?
      @blog.published!
    end
    redirect_to blogs_url, notice: 'Post status has been updated'
  end

  private

    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :body)
    end
end
