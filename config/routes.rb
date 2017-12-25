Rails.application.routes.draw do
  get 'errors/not_found'
  #ckeditor
  mount Ckeditor::Engine => '/ckeditor'
  resources :pages
  root 'pages#index'
  # error pages
  %w( 404 422 500 503 ).each do |code|
    get code, :to => "errors#not_found", :code => code
  end
  #redirect to 404 page
  get "*any", via: :all, to: "errors#not_found"
end
