class TasksController < ApplicationController
	before_action :require_user_logged_in
	before_action :correct_user, only: [:edit, :destroy]

	def index
		@tasks = Task.all.reverse_order.page(params[:page]).per(5)
	end

	def new
		# @task = Task.new
		@task = current_user.tasks.build
	end

	def create
		# 下記は Tas.new(content: '...') となる
		# @task = Task.new(task_params)
		@task = current_user.tasks.build(task_params)
		
		if @task.save
			flash[:success] = 'タスクの投稿完了'
			# redirect_to @task
			redirect_to root_url
		else
			@tasks = current_user.tasks.order('created_at DESC').page(params[:page])
			flash.now[:danger] = 'タスクの投稿失敗'
			# render :new
			render 'toppages/index'
		end
	end

	def show
		@task = Task.find(params[:id])
	end

	def edit
		@task = Task.find(params[:id])
	end

	def update
		@task = Task.find(params[:id])
		
		if @task.update(task_params)
			flash[:success] = 'タスクの編集完了'
			redirect_to @task
		else
			flash.now[:danger] = 'タスクの編集失敗'
			render :edit
		end
	end

	def destroy
		# @task = Task.find(params[:id])
		@task.destroy
		
		flash[:success] = 'タスク削除完了'
		# redirect_to tasks_url
		redirect_back(fallback_location: root_path)
	end
	
	private
	
	#strong parameter
	def task_params
		# new から create へ送られてきたフォームの内容は params に格納されている
		# Taskモデルのフォームから得られるデータで、contentカラムを取得
		params.require(:task).permit(:content, :status)
	end

	def correct_user
		@task = current_user.tasks.find_by(id: params[:id])
		unless @task
	  	redirect_to root_url
		end
	end
end