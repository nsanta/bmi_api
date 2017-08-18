require 'rails_helper'

describe BmiCalculator do
  let(:weight) { 50 }
  let(:height) { 150 }
  let(:resource) { BmiCalculator.new(weight, height) }

  context "on initialize" do
    context "when the inputs are numbers" do
      it "should not raise an error" do
        expect { resource }.not_to raise_error
      end
    end

    context "when the inputs are not numbers" do
      context "when weight is not a number" do
        let(:weight) { 'STRING' }
        it "should  raise an error" do
          expect { resource }.to raise_error(BmiCalculator::BmiInputError)
        end
      end

      context "when weight is not a positive number" do
        let(:weight) { -123 }
        it "should  raise an error" do
          expect { resource }.to raise_error(BmiCalculator::BmiInputError)
        end
      end

      context "when height is not a number" do
        let(:height) { "string" }
        it "should  raise an error" do
          expect { resource }.to raise_error(BmiCalculator::BmiInputError)
        end
      end

      context "when height is not a positive number" do
        let(:height) { -123 }
        it "should  raise an error" do
          expect { resource }.to raise_error(BmiCalculator::BmiInputError)
        end
      end

    end
  end

  describe "#call" do

    subject { resource.call }

    it "should return an valid result" do
      expect(subject).to eq({value: 22.22, result: 'Normal'})
    end
  end
end
