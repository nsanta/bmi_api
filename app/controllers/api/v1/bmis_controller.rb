class Api::V1::BmisController < Api::V1::BaseController
  rescue_from BmiCalculator::BmiInputError do |exception|
    render json: {error: exception.message}, status: :bad_request
  end

  def show
    result = BmiCalculator.new(params[:weight].to_i, params[:height].to_i).call
    render json: {data: result}
  end
end
