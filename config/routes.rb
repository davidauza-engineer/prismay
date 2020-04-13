Rails.application.routes.draw do
  # Internationalization setup
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    get 'static_pages/home'
    root 'static_pages#home'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
