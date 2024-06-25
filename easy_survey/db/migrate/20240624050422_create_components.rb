class CreateComponents < ActiveRecord::Migration[6.1]
  def change
    create_table :components do |t|
      t.references :survey, null: false, foreign_key: true
      t.string :component_type
      t.integer :x
      t.integer :y
      t.text :content

      t.timestamps
    end
  end
end
