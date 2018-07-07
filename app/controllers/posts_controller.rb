class PostsController < ApplicationController

  before_action :authenticate_user!, except: :show

  def show
    @post = Post.friendly.find(params[:id])
    unless current_user || @post.publish
      redirect_to root_path
    end
  end

  def new
    @post = Post.new
    @tags = Tag.all
  end

  def create
    @post = Post.new(post_params)
    if post_params[:publish] == true
      @post.published_at = Time.now
    end
    if @post.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    @post = Post.friendly.find(params[:id])
    if @post.delete
      redirect_to dashboard_path
    end
  end

  def edit
    @post = Post.friendly.find(params[:id])
    @tags = Tag.all
  end

  def update
    @post = Post.friendly.find(params[:id])
    @post.assign_attributes(post_params)
    if @post.publish_changed?
      @post.published_at = Time.now if @post.publish
    end
    if @post.save
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :subtitle, :content, :publish, :feature, tag_ids: [])
  end

end
