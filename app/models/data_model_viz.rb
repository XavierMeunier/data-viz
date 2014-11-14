class DataModelViz

	##################################
	###### GENERATE MODEL JSON #######
	##################################

	def self.get_json_from_file(path)
		data_viz_files = Dir.glob("#{path}/*.txt").sort! # more precision
		if !data_viz_files.empty?
			filename = data_viz_files.last
			File.read("#{filename}")
		else
			false
		end
	end

	def self.generate_json

		# Check if a json file already exists
		if !(output_json = self.get_json_from_file("files/data_viz/"))
			output_json = {date: DateTime.now.strftime("%Y%m%d_%H%M%S")}

			model_name = self.models_name
			model_name.each do |model|
				attributes_hash = self.attributes_hash(model)
				relations_hash = self.relations_hash(model)
				output_json.merge!({model.to_sym => {attributes: {}, relations: {}}})
				output_json[model.to_sym][:attributes] = attributes_hash if !attributes_hash.blank?
				output_json[model.to_sym][:relations] = relations_hash if !relations_hash.blank?
			end
			output_json = output_json.to_json
		end
		output_json
	end

private
	def self.models_name
		model_name = []
		ActiveRecord::Base.subclasses.each do |t|
			model_name << t.name.camelize
		end
		model_name
	end

	def self.attributes_hash(model_name)
		attributes_hash = {}
		model = model_name.constantize
		model.column_names.each do |col|
			attributes_hash.merge!(col.to_sym => model.columns_hash[col].type)
		end
		attributes_hash
	end

	def self.relations_hash(model_name)
		relations_hash = {}
		model = model_name.constantize
		model.reflect_on_all_associations.each do |link|
			relations_hash.merge!(link.name.to_sym => link.macro.to_sym)
		end
		relations_hash
	end


	##################################
	######## SAVE MODEL FILE #########
	##################################

	def self.create_directory(path)
		FileUtils.mkdir_p(path) unless File.exists?(path)
	end

	def self.save_model(path, filename, model)
		self.create_directory(path)
		new_file = File.open("#{path}/#{filename}.txt", "w+")
		new_file.write(model.to_json)
		new_file.close
	end

end