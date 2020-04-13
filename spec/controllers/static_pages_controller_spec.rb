require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  render_views
  let(:base_title) { ' | Prismay' }

  context 'when visiting Home Page' do
    before do
      get :home
    end

    it 'successfully gets home' do
      expect(response.code).to eq '200'
    end

    it 'has the right title' do
      expect(response.body).to have_title I18n.t('static_pages.home.title') + base_title
    end
  end
end
