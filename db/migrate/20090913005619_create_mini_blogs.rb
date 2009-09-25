class CreateMiniBlogs < ActiveRecord::Migration
  def self.up
    create_table :mini_blogs do |t|
      t.string :nombre
      t.text :descripcion

      t.timestamps
    end
  end

  def self.down
    drop_table :mini_blogs
  end
end
