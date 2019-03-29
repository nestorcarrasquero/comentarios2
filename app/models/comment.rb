class Comment < ApplicationRecord
	# Validaciones
	validates :descripcion, presence: true
	# Relaciones con otros modelos
	belongs_to :solicitud
end
