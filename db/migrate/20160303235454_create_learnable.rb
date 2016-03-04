class CreateLearnable < ActiveRecord::Migration
  def change
    create_table :learnables do |t|
      t.string :name
      t.string :proficiency
      t.string :type
      t.references :competency, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
