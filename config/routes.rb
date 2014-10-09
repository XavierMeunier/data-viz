Rails.application.routes.draw do
  match '/display_data_viz' , to: 'data_viz#display'    , via: 'get', as: 'data_viz'
  match '/save_json'        , to: 'data_viz#save_json'  , via: 'post'
end
