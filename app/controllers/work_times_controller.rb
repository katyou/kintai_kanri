class WorkTimesController < ApplicationController
  before_action :logged_in_user
  before_action :set_work_time, only: [:show, :edit, :update, :destroy]

  def index
    @work_times = WorkTime.all
    current_time = Time.now
    @weaks = %w(日 月 火 水 木 金 土)
    #NOTE Timeクラス、DateTimeクラスでeachをするとcan't iterate..とエラー
    @month_first= current_time.beginning_of_month.to_date
    @month_last= current_time.end_of_month.to_date
  end

  def show
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
        format.html { redirect_to @work_time, notice: 'Work time was successfully updated.' }
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
      params.fetch(:work_time, {})
    end
end
