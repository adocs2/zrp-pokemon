Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1 do
    scope module: :pokemon do
      get '/pokemon/info/:pokemon_name', to: 'pokemon#get_info'
    end
  end
end
