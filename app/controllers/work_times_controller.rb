class WorkTimesController < ApplicationController
  before_action :logged_in_user
  before_action :set_work_time, only: [:show, :edit, :update, :destroy]

  def index
    current_time = Time.now
    #NOTE Timeクラス、DateTimeクラスでeachをするとcan't iterate..とエラー
    @month_first= current_time.beginning_of_month.to_date
    @month_last= current_time.end_of_month.to_date
    @work_times = WorkTime.get_user(current_user)
  end

  def get_next_month
    current_month = params[:current_month].to_date
    @month_first = current_month.next_month.beginning_of_month
    @month_last = current_month.next_month.end_of_month
    @work_times = WorkTime.get_user(current_user)
    render 'result_display_calender'
  end

  def get_prev_month
    current_month = params[:current_month].to_date
    @month_first = current_month.prev_month.beginning_of_month
    @month_last = current_month.prev_month.end_of_month
    @work_times = WorkTime.get_user(current_user)
    render 'result_display_calender'
  end

  def show
    @work_time = WorkTime.find(params[:id])
  end

  #NOTE rails側ではデータの読み込みしかしないからnewやcreateは不要？
  def new
    @work_time = WorkTime.new
  end

  def edit
  end

  def create
    @work_time = WorkTime.new(work_time_params)

    respond_to do |format|
      if @work_time.save
        format.html { redirect_to @work_time, notice: 'Work time was successfully created.' }
        format.json { render :show, status: :created, location: @work_time }
      else
        format.html { render :new }
        format.json { render json: @work_time.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @work_time.update(work_time_params)
        format.html { redirect_to  user_work_time_path, notice: '勤務時間の情報を更新しました' }
        format.json { render :show, status: :ok, location: @work_time }
      else
        format.html { render :edit }
        format.json { render json: @work_time.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @work_time.destroy
    respond_to do |format|
      format.html { redirect_to work_times_url, notice: 'Work time was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_work_time
      @work_time = WorkTime.find(params[:id])
    end

    def work_time_params
      params.require(:work_time).permit(:start_time, :finish_time, :work_time, :rest_time, :user_id)
    end
end
