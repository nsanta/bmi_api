class Api::V1::BmisController < Api::V1:BaseController
  rescue_from BmiCalculator::BmiInputError do |exception|
    render json: {error: exception.message}, status: :bad_request
  end

  def show
    result = BmiCalculator.new(params.permit(:weight, :height)).call
    render json: {data: result}
  end
end
