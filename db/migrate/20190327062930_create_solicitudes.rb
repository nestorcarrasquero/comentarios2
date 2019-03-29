class CreateSolicitudes < ActiveRecord::Migration[5.1]
  def change
    create_table :solicitudes do |t|
      t.string :titulo
      t.string :descripcion
      t.integer :positivo
      t.integer :negativo      
    end
  end
end
