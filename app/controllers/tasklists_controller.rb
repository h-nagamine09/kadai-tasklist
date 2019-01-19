class TasklistsController < ApplicationController
  
  def index
    @tasklists = Tasklist.all
  end
  #一覧のTasklistを表示(モデルのレコードの表示)
  
  def show
    @tasklist = Tasklist.find(params[:id])
  end 
  #単一のTasklistを表示
  
  def new
    @tasklist = Tasklist.new
  end 
  #Tasklistを新規作成

  def create
  @tasklist = Tasklist.new(tasklist_params)
 
    if @tasklist.save
      flash[:success] = 'Tasklist が正常に追加されました'
      redirect_to @tasklist
    else
      flash.now[:danger] = 'Tasklist が追加されませんでした'
      render :new
    end 
  end 
  #Tasklistを実行表示

  def edit
    @tasklist = Tasklist.find(params[:id])
  end 
  #Tasklistを編集

  def update
     @tasklist = Tasklist.find(params[:id])
 
    if @tasklist.update(tasklist_params)
      flash[:success] = 'Tasklist が正常に追加されました'
      redirect_to @tasklist
    else
      flash.now[:danger] = 'Tasklist が追加されませんでした'
      render :edit
    end 
  end 
  #Taskkistを

  def destroy
      @tasklist = Tasklist.find(params[:id])
      @tasklist.destroy
      
      flash[:success] = 'Tasklist は正常に削除されました'
      redirect_to tasklists_url
  end
  #Tasklistを削除
end


 private

 def tasklist_params
 params.require(:tasklist).permit(:content)
 end
