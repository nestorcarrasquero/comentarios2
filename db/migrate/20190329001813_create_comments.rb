class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :descripcion
      t.integer :solicitud_id
    end
  end
end
