class BmiCalculator
  class BmiInputError < StandardError;end

  BMI_TABLE = {
    0...15 => 'Very severely underweight',
    15...16 => 'Severely underweight',
    16...18.5 => 'Underweight',
    18.5...25 => 'Normal',
    25...30 => 'Overweight',
    30...35 => 'Obese Class I (Moderately obese)',
    35...40 => 'Obese Class II (Severely obese)	',
    40..Float::INFINITY => 'Obese Class III (Very severely obese)'
  }

  def initialize(weight, height)
    validate_input(weight, height)
    @weight = weight
    @height = height.to_f / 100
  end

  def call
    value = calculate.round(2)
    return {
      value: value,
      result: BMI_TABLE.detect {|range, result| range.include?(value) }.last
    }
  end

  private

  def calculate
    @weight.to_f / (@height.to_f ** 2)
  end

  def validate_input(weight, height)
    return if postive_numbers?(weight, height)
    fail BmiInputError, "Weight or Height are not a postive numbers."
  end

  def postive_numbers?(weight, height)
     weight.is_a?(Numeric) && height.is_a?(Numeric) &&
     weight > 0 && height > 0
  end
end
