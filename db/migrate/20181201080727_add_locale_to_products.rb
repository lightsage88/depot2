class AddLocaleToProducts < ActiveRecord::Migration[5.1]
  def up
    add_column :products, :locale, :string, default: "en"
  end

  def down
    remove_column :products, :locale
  end
end
