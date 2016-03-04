class CreateLearningSources < ActiveRecord::Migration
  def change
    create_table :learning_sources do |t|
      t.string :name
      t.references :learnable, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
