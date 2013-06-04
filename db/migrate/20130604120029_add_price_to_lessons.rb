class AddPriceToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :price, :decimal
  end
end
