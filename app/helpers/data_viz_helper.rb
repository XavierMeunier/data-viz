module DataVizHelper

  def display_data_viz
    content_tag(:div, id: "dataviz_container") do

      concat(content_tag(:div, id: "dataviz_model", data: {model: @data_model_json}) do
      end)
      
      concat(link_to("#", {class: "dataviz_btn dataviz_paper_raise", id: "save_position"}) do
        "Save the positions"
      end)

      concat(link_to("", {class: "dataviz_btn dataviz_paper_raise", id: "refresh"}) do
        "Reload model"
      end)
  
    end

  end
end