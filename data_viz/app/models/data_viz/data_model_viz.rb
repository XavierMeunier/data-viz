class DataModelViz
	def self.get_model_names
		model_name = []
		ActiveRecord::Base.subclasses.each do |t|
			model_name << t.name.camelize
		end
		model_name
	end

	# def self.get_attributes
	# 	attribute_names = []
	# end
end