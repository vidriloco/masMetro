class CreateEntradas < ActiveRecord::Migration
  def self.up
    create_table :entradas do |t|
      t.string :titulo
      t.text :contenido
      t.boolean :visible
      t.integer :mini_blog_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :entradas
  end
end
