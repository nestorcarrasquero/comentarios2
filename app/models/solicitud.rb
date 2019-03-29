class Solicitud < ApplicationRecord
	# Validaciones
	validates :titulo, presence: true
	validates :descripcion, presence: true
	scope :by_valor, -> { order('positivo DESC') }
	scope :by_titulo, -> { order('titulo') }
	# Relaciones con otros modelos
	has_many :comments
end
