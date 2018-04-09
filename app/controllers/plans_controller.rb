class PlansController < ApplicationController
  load_and_authorize_resource
  before_action :set_plan, only: [:show, :edit, :update, :destroy]


def destroyplansoption
  if params[:id].present? && params[:option_id].present?
    @plansoption = PlansOption.where(plan_id: params[:id], option_id: params[:option_id]).take.destroy
  end

end

def destroycourseplan
  if params[:id].present? && params[:course_id].present?
    @courseplan = CoursePlan.where(plan_id: params[:id], course_id: params[:course_id]).take.destroy
  end
end


  # GET /plans
  # GET /plans.json
  def index
    @plans = Plan.all
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
    @plansoption = PlansOption.where(plan_id: @plan.id)
    @courseplan = CoursePlan.where(plan_id: @plan.id)
  end

  # GET /plans/new
  def new
    @options = Option.all
    @course = Course.all
    @plan = Plan.new
  end

  # GET /plans/1/edit
  def edit
   @options = Option.all
   @courses = Course.all
   @plansoption = PlansOption.where(plan_id: @plan.id)
   @courseplan = CoursePlan.where(plan_id: @plan.id)
  end

  # POST /plans
  # POST /plans.json
  def create
    @plan = Plan.new(plan_params)
    respond_to do |format|
      if @plan.save
        plansoption()
        courseplan()

        format.html { redirect_to @plan, notice: 'Plan was successfully created.' }
        format.json { render :show, status: :created, location: @plan }
      else
        format.html { render :new }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end


def plansoption
  if params[:plan][:options].present?
      arr = params[:plan][:options].to_a
      arr.each do |opt|
          if opt != "" && opt != nil
            PlansOption.create!(plan_id: @plan.id, option_id: opt)
          end
        end
      @plansoption = PlansOption.where(plan_id:@plan.id)
  end
end


def courseplan

  if params[:plan][:object_id].present?
      arr = params[:plan][:object_id].to_a
      arr.each do |opt|
          if opt != "" && opt != nil
            CoursePlan.create!(plan_id: @plan.id, course_id: opt)
          end
        end
      @courseplan = CoursePlan.where(plan_id: @plan.id)
  end
end
  # PATCH/PUT /plans/1
  # PATCH/PUT /plans/1.json
  def update
    plansoption()
    courseplan()
    respond_to do |format|
      if @plan.update(plan_params)
        format.html { redirect_to @plan, notice: 'Plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @plan }
      else
        format.html { render :edit }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to plans_url, notice: 'Plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_params
      params.require(:plan).permit(:precio, :moneda, :descripcion)
    end
end
