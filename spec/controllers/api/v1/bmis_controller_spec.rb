require 'rails_helper'

describe Api::V1::BmisController, type: :controller do

  describe "GET #show" do
    let(:params) do
      {
        weight: weight,
        height: height
      }
    end
    let(:weight) { 50 }
    let(:height) { 150 }
    let(:json_response) { JSON.parse(response.body, symbolize_names: true) }
    let(:user) { create(:user) }

    subject { get :show, params: params }

    context "when user is signed in" do
      before do
        allow(controller).to receive(:current_user).and_return(user)
        sign_in(user)
      end

      context "when the input is valid" do
        let(:data) do
          {
            value: 22.22,
            result: 'Normal'
          }
        end
        it "should return an ok response" do
          subject
          expect(response.status).to eq(200)
          expect(json_response[:data]).to eq(data)
        end
      end
      context "when the input is invalid" do
        let(:weight) { 'String' }

        it "should return a bad request response" do
          subject
          expect(response.status).to eq(400)
          expect(json_response[:error]).to eq("Weight or Height are not a postive numbers.")
        end
      end
    end

    context "when user not signed in" do
      it "should not authorize the request" do
        subject
        expect(response.status).to eq(401)
      end
    end
  end

end
