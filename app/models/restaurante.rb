#encoding: utf-8
class Restaurante < ActiveRecord::Base
	attr_accessible :nome, :endereco, :especialidade
	validates_presence_of :nome, message: "Campo obrigatório"
	validates_presence_of :endereco, message: "Campo obrigatório"
	validates_presence_of :especialidade, message: "Campo obrigatório"

	validates_uniqueness_of :nome, message: "Nome já cadastrado"
	validates_uniqueness_of :endereco, message:"Endereço já cadastrado"

	validate :primeira_letra_deve_ser_maiuscula

	private
	def primeira_letra_deve_ser_maiuscula
		errors.add(:nome, "Primeira letra deve ser maiúscula") unless nome =~ /[A-Z].*/
	end
end
