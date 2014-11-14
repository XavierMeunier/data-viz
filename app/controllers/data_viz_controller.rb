class DataVizController < ActionController::Base

  def display
  end
  
  def save_json

    new_position = params[:data_model]

    @response = {
      response: 0,
      message: 'Beggining of save json file'
    }

    unless new_position.blank?

      path = "files/data_viz/" # configuration
      filename = (new_position[:date].blank?) ? new_position[:date] : DateTime.now.strftime("%Y%m%d%H%M%S")
      filename += "_data_viz"

      DataModelViz.save_model(path, filename, new_position)

      @response[:response] = 1
      @response[:message] = "Model positions are saved"
    else
      @response[:message] = "No model positions are founded"
    end

    render json: @response
  end
    
end