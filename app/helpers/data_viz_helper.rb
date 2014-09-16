module DataVizHelper
  def helloworld
    "hello world!"
  end

  def display_data_viz
    data_model_json = DataModelViz.generate_json


    content_tag(:div, id: "dataviz_container") do

      concat(content_tag(:div, id: "dataviz_model", data: {model: data_model_json}) do
      end)
      
      concat(link_to("", {class: "dataviz_btn dataviz_paper_raise"}) do
        "Save the positions"
      end)

      concat(link_to("", {class: "dataviz_btn dataviz_paper_raise"}) do
        "Reload model"
      end)
  
    end

  end
end