class PostsController < ApplicationController
  def index
    @posts=Post.all
    unless session[:current_user_id]
      redirect_to '/users/login' and return
    end
  end

  def new
  end
  
  def create
    Post.create(
      title: params[:title],
      content: params[:content],
      img_url: params[:img_url],
      tag: params[:tag],
      name: session[:current_user_name]
      )
      redirect_to '/'
  end

  def show
    @post=Post.find(params[:id])
  end

  def edit
    @post=Post.find(params[:id])
  end

  def update
    @post=Post.find(params[:id])
    @post.update(
      title: params[:title],
      content: params[:content],
      img_url: params[:img_url],
      tag: params[:tag]
      )
    redirect_to "/posts/show/#{@post.id}"
  end

  def destroy
    post=Post.find(params[:id])
    post.destroy
    redirect_to '/'
  end
end
