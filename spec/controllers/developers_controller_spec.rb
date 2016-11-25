require 'rails_helper'

RSpec.describe DevelopersController, type: :controller do
  context 'when user is not signed in' do
    it 'redirects to sign in form' do
      expect(get :index).to redirect_to new_user_session_path
    end
  end

  context 'when user is signed in' do
    before do
      @user = create(:user)
      allow(request.env['warden']).to receive(:authenticate!).and_return(@user)
      allow(controller).to receive(:current_user).and_return(@user)
    end

    describe 'GET :index' do
      before { 5.times { create(:developer) } }

      it 'loads all developers' do
        get :index
        expect(assigns(:developers)).to eq Developer.all
      end
    end
  end
end
