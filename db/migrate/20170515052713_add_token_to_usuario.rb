class AddTokenToUsuario < ActiveRecord::Migration[5.1]
  def change
    add_column :usuarios, :token, :string
  end
end
