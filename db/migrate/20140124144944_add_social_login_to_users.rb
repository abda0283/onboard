class AddSocialLoginToUsers < ActiveRecord::Migration
  
  def change


  	add_column :users, :provider, :string

  	add_column :users, :provider_id, :string

  	add_column :users, :provider_key, :string


  	add_column :users, :provider_secret, :string





  end
end
