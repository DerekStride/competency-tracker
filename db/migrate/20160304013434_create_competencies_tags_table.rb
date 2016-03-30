class CreateCompetenciesTagsTable < ActiveRecord::Migration
  def change
    create_table :competencies_tags do |t|
      t.belongs_to :competency, index: true
      t.belongs_to :tag, index: true
    end
  end
end
