class TasksController < ApplicationController

	def index
		@tasks = Task.all.reverse_order
	end

	def new
		# @task = Task.new(content: 'タスク内容を入れて下さい')
		@task = Task.new
	end

	def create
		# 下記は Tas.new(content: '...') となる
		@task = Task.new(task_params)
		
		if @task.save
			flash[:success] = 'タスクの投稿完了'
			redirect_to @task
		else
			flash.now[:danger] = 'タスクの投稿失敗'
			render :new
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
		@task = Task.find(params[:id])
		@task.destroy
		
		flash[:success] = 'タスク削除完了'
		redirect_to tasks_url
	end
	
	private
	
	#strong parameter
	def task_params
		# new から create へ送られてきたフォームの内容は params に格納されている
		# Taskモデルのフォームから得られるデータで、contentカラムを取得
		params.require(:task).permit(:content)
	end

end