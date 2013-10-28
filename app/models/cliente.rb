class Cliente < ActiveRecord::Base
	attr_accessible :nome, :idade

	validates_presence_of :nome, message: "Campo obrigatório"
	validates_uniqueness_of :nome, message: " - nome já cadastrado"
	validates_numericality_of :idade, greater_than: 10, less_than: 100,
	message: " - deve ser um número entre 10 e 100"

	has_many :qualificacoes
	has_and_belongs_to_many :pratos
end
