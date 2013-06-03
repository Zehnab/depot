class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.date :lesson_date
      t.text :description

      t.timestamps
    end
  end
end
