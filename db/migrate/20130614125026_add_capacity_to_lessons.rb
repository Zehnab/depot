class AddCapacityToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :capacity, :decimal
  end
end
