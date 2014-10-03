
Rails.application.routes.draw do
  match '/save_json'        , to: 'data_viz#save_json' , via: 'post'
end
