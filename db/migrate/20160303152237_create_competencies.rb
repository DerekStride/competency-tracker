class CreateCompetencies < ActiveRecord::Migration
  def change
    create_table :competencies do |t|
      t.timestamps null: false
      t.string :name
      t.string :proficiency
      t.references :competency, index: true, foreign_key: true
    end
  end
end
