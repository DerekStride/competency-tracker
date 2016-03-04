class CreateCompetencies < ActiveRecord::Migration
  def change
    create_table :competencies do |t|
      t.timestamps null: false
    end
  end
end
