require 'rails_helper'

RSpec.describe 'Routing Tests', type: :routing do
  it 'correctly routes the root route to static_pages#home' do
    expect(get: '/').to route_to(controller: 'static_pages', action: 'home')
  end
end
