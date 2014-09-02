class DataModelViz
	def self.generate_json
		output_json = {date: DateTime.now.strftime("%Y%m%d_%H%M%S")}

		model_name = self.models_name
		model_name.each do |model|
			attributes_hash = self.attributes_hash(model)
			relations_hash = self.relations_hash(model)
			output_json.merge!({model.to_sym => {attributes: {}, relations: {}}})
			output_json[model.to_sym][:attributes] = attributes_hash if !attributes_hash.blank?
			output_json[model.to_sym][:relations] = relations_hash if !relations_hash.blank?
		end
		output_json.to_json
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
end