Rails.application.routes.draw do
  get 'contacts/get'

  root 'home#index'

  get '/ms_authorize' => 'auth#ms_gettoken'
  get '/thankyou' => 'home#thankyou'
  get '/contacts' => 'contacts#get'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
