class CreateAdministraciones < ActiveRecord::Migration
  def self.up
    create_table :gen_passwords do |t|
      t.column        :password,     :string, :limit => 40
      t.timestamps
    end
  end

  def self.down
    drop_table :gen_passwords
  end
end
