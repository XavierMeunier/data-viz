module DataVizHelper
  def helloworld
    "hello world!"
  end

  def display_data_viz
    data_model_json = DataModelViz.generate_json

    content_tag(:div, id: "data_viz_model", data: {model: data_model_json}) do
    end
  end
end