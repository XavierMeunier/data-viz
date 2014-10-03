class DataVizController < ActionController::Base
  
  def save_json
    
    @response = {
      response: 1,
      message: "Le json a bien ete enregistre" 
    }

    render json: @response
  end
  
end