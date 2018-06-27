class UsersController < ApplicationController
  def login
  end
  def sessions
    @msg="로그인 실패"
    @users=User.all
    @users.each do |u|
      if u.email==params[:email] and u.password==params[:password]
        session[:current_user_id] = u.id
        session[:current_user_name] = u.name
        redirect_to '/' and return
      end
    end
  end

  def logout
    session.clear
    redirect_to '/'
  end

  def signup
  end

  def create
    unless User.find_by(email: params[:email]) or User.find_by(name: params[:name])
      User.create(
      email: params[:email],
      password: params[:password],
      name: params[:name]
      )
    else
      redirect_to '/users/signup' and return
    end
  end
  
  def admin
    @users=User.all
  end
  
  def destroy
    @user=User.find(params[:id])
    @user.destroy
    redirect_to '/users/admin'
  end
  
  def edit
    @user=User.find(params[:id])
  end
  
  def update
    @user=User.find(params[:id])
    @user.update(
      email: params[:email],
      password: params[:password],
      name: params[:name]
      )
    redirect_to '/users/admin'
  end
end
