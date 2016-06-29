class AddAuthenticationTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :auth_token, :string, default: ""
    
    # Make auth_token unique on the database level
    add_index :users, :auth_token, unique: true
  end
end
