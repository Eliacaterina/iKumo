class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.string :title
      t.text :content
      t.date :posted_on
      t.belongs_to :baby

      t.timestamps
    end
  end
end
