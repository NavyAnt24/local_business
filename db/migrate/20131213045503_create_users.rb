class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name, :null => false
    	t.string :email, :null => false
    	t.integer :phone_number, :null => false
    	t.string :type, :null => false
    	t.string :session_token, :null => false
    	t.integer :manager_id

      t.timestamps
    end

    add_index :users, :email, :unique => true
    add_index :users, :phone_number, :unique => true
    add_index :users, :session_token, :unique => true
  end
end
