# frozen_string_literal: true

class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :update, :destroy]

  # GET /workouts
  def index
    @workouts = Workout.all

    render json: @workouts
  end

  # GET /workouts/1
  def show
    render json: @workout
  end

  # POST /workouts
  def create
    @workout = Workout.new(workout_params)

    if @workout.save
      render json: @workout, status: :created
    else
      render json: @workout.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /workouts/1
  def update
    if @workout.update(workout_params)
      head :no_content
    else
      render json: @workout.errors, status: :unprocessable_entity
    end
  end

  # DELETE /workouts/1
  def destroy
    @workout.destroy

    head :no_content
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_workout
    @workout = Workout.find(params[:id])
  end
  private :set_workout

  # Only allow a trusted parameter "white list" through.
  def workout_params
    params.require(:workout).permit(:date)
  end
  private :workout_params
end