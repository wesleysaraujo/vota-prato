class Prato < ActiveRecord::Base
	attr_accessinle :nome

	validates_presence_of :nome, message: " - deve ser preenchido"
	validates_uniqueness_of :nome, message: " - nome já existe"

	validate :validate_presence_of_more_than_one_restaurante

	has_and_belongs_to_many :restaurantes
	has_one :receita

	private
	def validate_presence_of_more_than_one_restaurante
		errors.add("restaurantes", "deve haver ao menos um restaurante") if restaurante.empty?
	end
end
