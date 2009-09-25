class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.column :login,                     :string, :limit => 40
      t.column :name,                      :string, :limit => 100, :default => '', :null => true
      t.column :email,                     :string, :limit => 100
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string, :limit => 40
      t.column :remember_token_expires_at, :datetime
      t.column :rol,                       :string
      t.column :temporal,                  :boolean
    end
    add_index :users, :login, :unique => true
    
    @user=User.new(:login => "administrador", 
                :name => "Administrador", 
                :email => "admin@example.com", 
                :password => "nuestro_metro", 
                :password_confirmation => "nuestro_metro", 
                :rol => "ADMINISTRADOR")
    @user.temporal = true 
    @user.save!
  end

  def self.down
    drop_table "users"
  end
end
