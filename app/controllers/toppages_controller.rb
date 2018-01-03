class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @todo = current_user.todos.build  # form_for 用
      @todos = current_user.todos.order('created_at DESC').page(params[:page])
    end
  end
end
