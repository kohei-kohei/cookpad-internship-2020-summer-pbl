class Api::V1::ExercisesController < ApiController
    before_action :set_exercise, only: [:show]
  
    rescue_from Exception, with: :render_status_500
    # ActiveRecordのレコードが見つからなければ404 not foundを応答する
    rescue_from ActiveRecord::RecordNotFound do |exception|
      render json: { error: '404 not found' }, status: 404
    end
  
    def index
      exercises = Exercise.all
      render json: exercises
    end
  
    def show
      render json: @exercise
    end

    def create
      exercise = Exercise.new(exercise_params)
      if exercise.save
        render json: exercise, status: :created
      else
        render json: { errors: exercise.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
      def set_exercise
        @exercise = Exercise.find(params[:id])
      end

      def exercise_params
        params.fetch(:exercise, {}).permit(:name, :time)
      end
  
      def render_status_404(exception)
        render json: { errors: [exception] }, status: 404
      end
  
      def render_status_500(exception)
        render json: { errors: [exception] }, status: 500
      end
end